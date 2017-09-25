// hz to note names for D dorian scale
146.83 => float d;
164.81 => float e;
174.61 => float f;
196. => float g;
220. => float a;
246.94 => float b;
261.63 => float c;

// sound path
TriOsc clickOsc => dac;
TriOsc clickHighOsc => dac;

TriOsc dRootOsc => dac;
TriOsc eRootOsc => dac;
TriOsc fRootOsc => dac;
TriOsc gRootOsc => dac;
TriOsc aRootOsc => dac;
TriOsc bRootOsc => dac;
TriOsc cRootOsc => dac;
TriOsc dOctRootOsc => dac;

TriOsc dOsc => dac;
TriOsc eOsc => dac;
TriOsc fOsc => dac;
TriOsc gOsc => dac;
TriOsc aOsc => dac;
TriOsc bOsc => dac;
TriOsc cOsc => dac;
TriOsc dOctOsc => dac;

TriOsc endOsc => dac;
TriOsc endFifthOsc => dac;


// set the frequencies
d / 2 => clickOsc.freq;
d * 2 => clickHighOsc.freq;

d => dRootOsc.freq;
e => eRootOsc.freq;
f => fRootOsc.freq;
g => gRootOsc.freq;
a / 2 => aRootOsc.freq;
b => bRootOsc.freq;
c => cRootOsc.freq;
d => dOctRootOsc.freq;

d * 4 => dOsc.freq;
e * 4 => eOsc.freq;
f * 4 => fOsc.freq;
g * 4 => gOsc.freq;
a * 4 => aOsc.freq;
b * 4 => bOsc.freq;
c * 4 => cOsc.freq;
d * 8 => dOctOsc.freq;

d * 2 => endOsc.freq;
a * 2 => endFifthOsc.freq;

// set the initial gains to 0
0 => dRootOsc.gain;
0 => eRootOsc.gain;
0 => fRootOsc.gain;
0 => gRootOsc.gain;
0 => aRootOsc.gain;
0 => bRootOsc.gain;
0 => cRootOsc.gain;
0 => dOctRootOsc.gain;

0 => eOsc.gain;
0 => fOsc.gain;
0 => gOsc.gain;
0 => aOsc.gain;
0 => bOsc.gain;
0 => cOsc.gain;
0 => dOctOsc.gain;
0 => endOsc.gain;
0 => endFifthOsc.gain;

0 => clickOsc.gain;
0 => clickHighOsc.gain;

// set the 'on' flag for each oscillator to 0 (booleans should be used here)
0 => int clickOn;

0 => int bassPlaying;
0 => int leadPlaying;

0 => int dRootOn;
0 => int eRootOn;
0 => int fRootOn;
0 => int gRootOn;
0 => int aRootOn;
0 => int bRootOn;
0 => int cRootOn;
0 => int dOctRootOn;

0 => int dOn;
0 => int eOn;
0 => int fOn;
0 => int gOn;
0 => int aOn;
0 => int bOn;
0 => int cOn;
0 => int dOctOn;

// set the initial gain variable values
0 => float clickGain;
0 => float clickHighGain;

0 => float dRootGain;
0 => float eRootGain;
0 => float fRootGain;
0 => float gRootGain;
0 => float aRootGain;
0 => float bRootGain;
0 => float cRootGain;
0 => float dOctRootGain;

0 => float dGain;
0 => float eGain;
0 => float fGain;
0 => float gGain;
0 => float aGain;
0 => float bGain;
0 => float cGain;
0 => float dOctGain;

// set the initial gain values for the oscillators
clickGain => clickOsc.gain;

dRootGain => dRootOsc.gain;
eRootGain => eRootOsc.gain;
aRootGain => aRootOsc.gain;
dOctRootGain => dOctRootOsc.gain;
dGain => dOsc.gain;
eGain => eOsc.gain;
fGain => fOsc.gain;
gGain => gOsc.gain;
aGain => aOsc.gain;
bGain => bOsc.gain;
cGain => cOsc.gain;
dOctGain => dOctOsc.gain;

// gain reductions
0.02 => float longGainReduction;
0.0001 => float shortGainReduction;

// next notes
"" => string nextNote;
"" => string prevNote;

// counters
0 => int loopCount;
0 => int dLoopCount;
0 => int loopStart;
0 => int endLoopPos;

// endNode
1 => int endNode;
0 => int resetBassLoop;

// lead density
0 =>  int leadDensity;

while( true )
{
    // if(loopCount % 64 == 0)
    if(loopCount % 40 == 0)
    {
        1 => loopStart;
        if(loopCount > 4)
        {
            loopCount % 200 => leadDensity;
        }
        200 => leadDensity;
        
    }
    else
    {
        0 => loopStart;
    }
    
    Math.random2(0, 100) => int randOneHundred;
    Math.random2(0, 1000) => int randOneThousand;
    Math.random2(0, 10) => int randTen;
    
    
    
    ////////////////////////////////////
    
    
    
    
    // lead note (d)
    
    if (loopCount % 50 == 0  && randOneThousand < 1 * leadDensity && 1 != dOn && 1 != aOn)
    {
        .09 => dGain;
        1 => dOn;
        // Todo: this isn't being used
        1 => leadPlaying;
        
    }
    
    if(1 == dOn && dGain >= 0.01)
    {
        dGain - shortGainReduction => dGain;
    }
    
    if(dGain <= 0.01)
    {
        0 => dOn;
        0 => dGain;
        0 => leadPlaying;
    }
    
    dGain => dOsc.gain;
    
    // lead note (e)
    if (loopCount % 50 == 0  && randOneThousand >= 2 * leadDensity && randOneThousand < 3 * leadDensity && 1 != eOn)
    {
        .08 => eGain;
        1 => eOn;
        1 => leadPlaying;
    }
    
    if(1 == eOn && eGain >= 0.01)
    {
        eGain - shortGainReduction => eGain;
    }
    
    if(eGain <= 0.01)
    {
        0 => eOn;
        0 => eGain;
        0 => leadPlaying;
    }
    
    eGain => eOsc.gain;
    
    // lead note (f)
    if (loopCount % 50 == 0  && randOneThousand >= 3 * leadDensity && randOneThousand < 4 * leadDensity && 1 != fOn)
    {
        .07 => fGain;
        1 => fOn;
        1 => leadPlaying;
        
    }
    
    if(1 == fOn && fGain >= 0.01)
    {
        fGain - shortGainReduction => fGain;
    }
    
    if(fGain <= 0.01)
    {
        0 => fOn;
        0 => fGain;
        0 => leadPlaying;
    }
    
    fGain => fOsc.gain;
    
    // lead note (g)
    if (loopCount % 50 == 0  && randOneThousand >= 4 * leadDensity && randOneThousand < 5 * leadDensity && 1 != gOn)
    {
        .06 => gGain;
        1 => gOn;
        1 => leadPlaying;
        
    }
    
    if(1 == gOn && gGain >= 0.01)
    {
        gGain - shortGainReduction => gGain;
    }
    
    if(gGain <= 0.01)
    {
        0 => gOn;
        0 => gGain;
        0 => leadPlaying;
    }
    
    gGain => gOsc.gain;
    
    // lead note (c)
    if (loopCount % 50 == 0  && randOneThousand >= 5 * leadDensity && randOneThousand < 6 * leadDensity && 1 != cOn)
    {
        .05 => cGain;
        1 => cOn;
        1 => leadPlaying;
        
    }
    
    if(1 == cOn && cGain >= 0.01)
    {
        cGain - shortGainReduction => cGain;
    }
    
    if(cGain <= 0.01)
    {
        0 => cOn;
        0 => cGain;
        0 => leadPlaying;
    }
    
    cGain => cOsc.gain;
    
    
    ////////////////////////////////////    
    // metronome
    
    // Add a steady beat as well
    
    //if( loopCount % 8 == 0 || loopCount % 10 == 0 )
    //if( loopCount % 24 == 11 || loopCount % 10 == 0)
    if( loopCount % 80 == 19 || loopCount % 40 == 0 )
    {
        0.4 => clickGain;
        // fade in
       0.1 => clickHighGain;
        1 => clickOn;
    }
    else
    {
        
        if(1 == clickOn && clickGain > 0.01)
        {
            clickGain - 0.1 => clickGain;
           clickHighGain - 0.01 => clickHighGain;
            
        }
        else
        {
            0 => clickGain;
            0 => clickHighGain;
            0 => clickOn;
        }
        
    }
    
    clickGain => clickOsc.gain;
    clickHighGain => clickHighOsc.gain;
    
    
    if(loopCount % 5 == 0)
    {
        .19 => endOsc.gain;
        .14 => endFifthOsc.gain;
        if(0 == endLoopPos)
        {
            d  => endOsc.freq;
            a * Math.random2(1, 2) * 2 => endFifthOsc.freq;
        }
        if(1 == endLoopPos)
        {
            e  => endOsc.freq;
            b * Math.random2(1, 2) * 2 => endFifthOsc.freq; 
        }
        if(2 == endLoopPos)
        {
            f  => endOsc.freq;
            c * Math.random2(1, 2) * 2 => endFifthOsc.freq;
        }
        if(3 == endLoopPos)
        {
            g  => endOsc.freq;
            d * Math.random2(1, 2) * 2 => endFifthOsc.freq;
        }
        if(4 == endLoopPos)
        {
            a * Math.random2(1, 2) * 2  => endOsc.freq;
            e * Math.random2(1, 4) => endFifthOsc.freq;
        }
        if(5 == endLoopPos)
        {
            b => endOsc.freq;
            f * Math.random2(1, 2) * 2 => endFifthOsc.freq;
        }
        if(6 == endLoopPos)
        {
            c => endOsc.freq;
            g * Math.random2(1, 2) * 2 => endFifthOsc.freq;
        }
        if(7 == endLoopPos)
        {
            d * 2 => endOsc.freq;
            a * Math.random2(1, 4) => endFifthOsc.freq;
        }
        (endLoopPos + 1) % 5 => endLoopPos;
    }
    
    loopCount++;
    31.25::ms => now;
    
}