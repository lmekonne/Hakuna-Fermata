"""
Lisa Mekonnen
Sunrise to Morning
CSCI 3725
"""
##|Tempo to match our heart beats to calm the students during finals
tempo = 60

##| Utilizing the live loop to continue this melody without stopping and
##| minumum amount of code that will be the main melody throughout the song
live_loop :slow_down do
  use_bpm tempo
  with_fx :reverb, mix: 0.6, decay: 26 do
    play :A3, release: 4
    play :B3, release: 4
    play :E4, release: 4
  end
  sleep 6
  tempo -= 1
end

##| Incoropated a drum that emulates a kebero in Ethiopian culture
live_loop :drums do
  sample :drum_tom_hi_soft
  sleep 4
end

##| Add a tick noise to compliment the slow_down function
live_loop :tick do
  play [:c, :e, :d, :f].ring.tick, release: 0.1
  sleep 4
end

##| Add a gentil low melody that repeats 3 times thoroughout the song
##| Changes the flow of the song without changing much (tiny novelty)
live_loop :melody1 do
  3.times do
    play chord(:g, :major7), attack: 3, amp: 1, release: 6
    sleep(8)
    play chord(:fs, :minor7), attack: 3, amp: 1, release: 6
    sleep(8)
    play chord(:a, :minor7), attack: 3, amp: 1, release: 6
    sleep(8)
  end
  
  sleep(45)
  
  ##| Add a gentil low melody that repeats 3 times thoroughout the song
  ##| Changes the flow of the song without changing much (tiny novelty)
  define :surprise do
    play chord(:d, :minor7), attack: 3, amp: 1, release: 6
    sleep(8)
    play chord(:e, :minor7), attack: 3, amp: 1, release: 6
    sleep(8)
    play chord(:fs, :minor7), attack: 3, amp: 1, release: 6
    sleep(8)
  end
  
  3.times do
    surprise
  end
  
  sleep(60)
  
  ##| Add a hint of melody using a rhythmic sequence
  define :melody2 do
    use_synth :piano
    
    2.times do
      play [:d, :f, :a, :c, :e, :g], attack: 1, release: 1.5, sustain: 1, amp: 8
      sleep(4)
      play [:ds, :fs, :as, :cs, :f, :gs], attack: 1, sustain: 1, amp: 8
      sleep(4)
    end
  end
  
  melody2
  
  ##| Add some surprise and tension!
  ##| Make sure your listener does not fall asleep while studying for finals
  live_loop :bass do
    use_synth :pretty_bell
    play (chord :C2, :major).choose, release: 0.125, cutoff: rrand(60, 110)
    sleep 0.25
  end
end



