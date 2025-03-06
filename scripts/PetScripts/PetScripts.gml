// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
/// Function to generate a struct with sprite sets for each cat variant
function new_cat_sprites(cat_variant) {
    switch (cat_variant) {
        case 0:
            return {
                idle: spr_IdleCatb,
                sit: spr_Sittingb,
                run: spr_RunCatb,
                jump: spr_JumpCabt,
                sleep: spr_SleepCatb
            };
        case 1:
            return {
                idle: spr_IdleCattt,
                sit: spr_Sittinggg,
                run: spr_RunCattt,
                jump: spr_JumpCatttt,
                sleep: spr_SleepCatb
            };
    }
}