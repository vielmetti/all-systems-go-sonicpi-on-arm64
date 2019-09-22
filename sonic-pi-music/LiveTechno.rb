use_bpm 128

w = 1
h = 0.5
q = 0.25
b = 0.0625


out_1 = 0
out_2 = 0
out_3 = 0
out_4 = 0
out_5 = 0

#Range 1: 0-4 (float)
#Range 2: 0-2 (f)
#Range 3: 0-2 (f)
#Range 4: 0-1 (f)
#Range 5: 0-2

trig_kick =    [1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0].ring #1
trig_cowbell = [1,1,0,1,1,0,1,1,0,0,0,1,1,0,0,0].ring #2
trig_tomsoft = [0,0,0,1,0,0,1,0,0,0,1,0,0,0,0,0].ring #2
trig_hihat =   [1,0,1,1,0,0,1,0,1,0,1,0,1,1,1,0].ring #3
trig_splash =  [0,1,0,0,0,0,0,0,0,0,0,0,0,0,1,0].ring #3
trig_fx1=      [0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0].ring #3
trig_synth=    [0,0,0,1,0,0,0,0,0,0,0,0,1,0,0,6].ring #4,5 release , amp

#a 1-131



define :drop do
  tick
  use_real_time
  sample :drum_bass_hard, amp: out_1 if trig_kick.look == 1
  sample :drum_cowbell, amp: out_2 if trig_cowbell.look == 1
  sample :drum_tom_hi_soft, amp: out_2 if trig_tomsoft.look == 1
  sample :drum_cymbal_soft, amp: out_3 if  trig_hihat.look == 1
  sample :drum_splash_hard, amp: out_3 if trig_splash.look == 1
  sample :ambi_soft_buzz, amp: out_3 if trig_fx1.look == 1
  
  with_fx :reverb do
    use_synth :tb303
    play :C4, amp: out_5 ,release: out_4 if trig_synth.look == 1
    play :F4, amp: out_5 ,release: out_4 if trig_synth.look == 4
    play :G4, amp: out_5,release: out_4 if trig_synth.look == 5
    play :A4, amp: out_5 ,release: out_4 if trig_synth.look == 6
  end
  sleep q
  
end


live_loop :kick_d do
  drop
end

live_loop :inputs do
  use_real_time
  out_1, out_2, out_3, out_4, out_5 = sync "/osc/wek/outputs"
end







