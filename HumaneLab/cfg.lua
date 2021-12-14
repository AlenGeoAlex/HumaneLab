Config = {}
Config.Locale = 'en'
Config.CountTimer = 20
Config.FingerHackingMinLvl = 2
Config.FingerHackingMaxLvl = 4 --4 Can Be The Maximum
Config.FingerLivesMin = 1
Config.FingerLivesMax = 4
-----------------------------------
--##Doorlock
----------------------------------
Config.DoorList = {
	{
		objName = 'v_ilev_bl_door_l',
		objCoords  = {x = 3569.43, y = 3695.2, z = 28.12},
		textCoords = {x = 3569.28, y = 3695.59, z = 28.12},
		authorizedCodes = 5555,
		locked = true,
		distance = 2.5
    },
    {
		objName = 'v_ilev_bl_door_r',
		objCoords  = {x = 3568.28, y = 3693.59, z = 28.12},
		textCoords = {x = 3568.18, y = 3693.97, z = 28.12},
		authorizedCodes = 5555,
		locked = true,
		distance = 2.5
    },
}
-----------------------------------
--##Security Ped
----------------------------------

Config.Ped = {

    Pos1 ={
        Pedhash=-1275859404,
        PedAccuracy=45,
        PedLocation = {
        {x=3438.97 ,y=3750.35 ,z=30.5 ,weapon= 'WEAPON_PISTOL'},
        {x=3439.67 ,y=3757.82 ,z=30.5 ,weapon='WEAPON_PISTOL'},
        {x=3462.27 ,y=3766.64 ,z=30.48 ,weapon='WEAPON_PISTOL'},
        {x=3459.58 ,y=3789.01 ,z=30.63 ,weapon='WEAPON_PISTOL'}
    }
    },

    Pos2 ={
        Pedhash=-1275859404,
        PedAccuracy=45,
        PedLocation = {
            {x=3607.97 ,y=3719.35 ,z=29.5 ,weapon= 'WEAPON_PISTOL'},
            {x=3569.67 ,y=3704.82 ,z=29.5 ,weapon='WEAPON_PISTOL'},
            {x=3601.27 ,y=3707.64 ,z=29.48 ,weapon='WEAPON_PISTOL'},
            {x=3610.58 ,y=3713.01 ,z=29.63 ,weapon='WEAPON_PISTOL'}
        
        }
    },


}
-----------------------------------
--##Marker
----------------------------------
Config.Marker ={
     {x=3427.6022949219, y= 3762.8029785156, z=29.872061920166, msg= "Press ~INPUT_CONTEXT~ To Check For Access Card"}, --Security
     {x= 3611.18, y= 3728.66, z=28.76, msg = "Press ~INPUT_CONTEXT~ To Deactivate Electric Field"},
     {x= 3536.86, y= 3668.66, z=28.12, msg = "Press ~INPUT_CONTEXT~ To Hack into the system"},
     {x= 3536.2, y= 3659.32, z=27.52, msg = "Press ~INPUT_CONTEXT~ To Get Access Into The Lock Down Security System"}
      } 
-----------------------------------
--##Same As Above, But For Checking Disctance
----------------------------------

Config.Security ={x=3427.6022949219, y= 3762.8029785156, z=29.872061920166} 
Config.Electric ={x= 3611.18, y= 3728.66, z=29.96}
Config.Rob ={x= 3536.86, y= 3668.66, z=28.12}
Config.PassComputer = {x= 3536.2, y= 3659.32, z=27.92}
