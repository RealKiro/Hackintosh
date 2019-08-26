// VoodooPS2Mouse.kext has the ability to appear as a trackpad.
// Most "trackpad" related settings don't work with it, but it will
// enable a few extra features. 
DefinitionBlock("", "SSDT", 2, "hack", "RM-Merge", 0)
{
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    Scope (_SB.PCI0.LPCB.PS2K)
    {
        Name (RMCF,Package() 
        {
            "Mouse", Package()
            {
                "ActLikeTrackpad", ">y",
            },
            
            "Keyboard", Package()
            {
                "Custom PS2 Map", Package()
                {
                    Package(){},
                    "e037=0",
                },
            },
            
            "Synaptics TouchPad", Package()
            {
                "BogusDeltaThreshX", 400,
                "BogusDeltaThreshY", 350,
                "DivisorX",1,
                "DivisorY",1,
                "MomentumScrollThreshY", 7,
                "MultiFingerHorizontalDivisor", 1,
                "MultiFingerVerticalDivisor", 1,
                "Resolution", 2950,
                "ScrollDeltaThreshX", 10,
                "ScrollDeltaThreshY", 10,
                "ScrollResolution", 2950,
            }, 

        })
    }
}
//EOF