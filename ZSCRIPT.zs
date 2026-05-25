version "4.13.0"

class RandomDeathSoundPlayer : EventHandler
{
    private transient CVar rds_volume;
    private transient CVar rds_dropoff;

    static const String deadmus[] = {
        "AMONGUS",
        "AOE2VILL",
        "AOE22HRD",
        "BOTWDED",
        "BTD6",
        "CLAIRDEL",
        "CSGODED1",
        "CSGODED2",
        "DARKSOUL",
        "DKCTFDED",
        "FACTORIO",
        "HALFLIFE",
        "HALODED1",
        "HALODED2",
        "HALODED3",
        "HOLKNGHT",
        "LEGOBRIK",
        "LEGOYODA",
        "MESSENGR",
        "METLPIPE",
        "MINECRFT",
        "MRWLDDED",
        "NOITADED",
        "R6SAZAMI",
        "R6SIEGE",
        "RAINWRLD",
        "RNWDINV1",
        "RNWDINV2",
        "RNWDINV3",
        "RNWDINV4",
        "RIDDHOLE",
        "RIDDSURP",
        "ROBLXOOF",
        "SILKSNG1",
        "SILKSNG2",
        "SILKSNG3",
        "SILKSNG4",
        "SSAMDED1",
        "SSAMDED2",
        "SUBSTORY",
        "SUPSMASH",
        "TERRARI2",
        "TERRARIA",
        "TRILBY",
        "TWILPRIN",
        "VINEBOOM",
        "WARIOFSH",
        "WHEATPIT",
        "WIIBOWL",
        "WIIHOCP1",
        "WIIHOCP2",
        "WIIPLANE",
        "WIITNKDE",
        "YAKUZAGG"
    };

    Actor inflictor;

    override void WorldThingDied(WorldEvent e)
    {
        inflictor = e.Inflictor;
        //Console.printf(e.Inflictor.GetClassName());
    }

    override void PlayerDied(PlayerEvent e)
    {
        if (!rds_volume)
            rds_volume = CVar.GetCVar("rds_volume", players[consoleplayer]);
        if (!rds_dropoff)
            rds_dropoff = CVar.GetCVar("rds_dropoff", players[consoleplayer]);

        //console.printf("You died! oifhaiuhe");
        //console.printf(String.Format("Self Volume: %.2f", cds_self_volume.GetFloat()));

        int random_index = Random(0, deadmus.size() - 1);

        PlayerInfo dead_player = players[e.PlayerNumber];

        if (inflictor.GetClassName() != 'NoitaGods')
        {
            // Randomize the death sounds
            dead_player.Mo.A_StartSound(deadmus[random_index], CHAN_AUTO, CHANF_DEFAULT, 0.5 * rds_volume.GetFloat(), 0.5 * rds_dropoff.GetFloat()); // people around them
        }
        else
        {
            // Only play the noita sound
            dead_player.Mo.A_StartSound("NOITADED", CHAN_AUTO, CHANF_DEFAULT, 0.5 * rds_volume.GetFloat(), 0.5 * rds_dropoff.GetFloat()); // people around them
        }
    }
}