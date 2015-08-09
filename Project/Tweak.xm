/*

	FEATURES:
	
	1. Free Towers
	2. Full Screen Tower Range
	3. Fast Tower Fire Delay
	4. Fast Tower Fire Cooldown
	5. Instant Tower Ability Cooldown
	6. Longer Projectile Lifetime (how long projectile is on screen)
	7. Longer Projectile Cutoff Distance (how far a projectile travels before disappearing)
	8. Long Status Effect Time
	9. Slow Status Effect Stops Bloons
	10. Fast Projectile Move Speed
	11. High Projectile Damage (number of bloons projectile can pop before disappearing)
	12. All Towers Can Target Cammo
	13. All Towers Can Pop Any Bloons
	14. Place Towers Anywhere
	15. Always Able To Skip Map
	16. Always Able To Spy On Enemy 
	17. Always Able To Roll Extra Tower
	18. Always Able To Re-Roll Extra Tower

	WARNING: All tower features effect your opponent as well!

	CREDITS:
	
	- αlphaMΛTTΞR
	- shmoo419, Chrizk0, Mikedamen9, Razzile, etc (anyone else who's hacked this game or some version of bloons td)
*/

#include <substrate.h>
#import "writeDataBypassASLR.h"

#define cre @"Modded By αlphaMΛTTΞR"

float (*towerCostOld)(void *self);
float towerCost(void *self) {
	return 0.0f;
}

float (*towerRangeOld)(void *self);
float towerRange(void *self) {
	return 100000.0f;
}

float (*towerFireDelayOld)(void *self);
float towerFireDelay(void *self) {
	return 0.01f;
}

float (*towerFireCooldownOld)(void *self);
float towerFireCooldown(void *self) {
	return 0.0f;
}

float (*towerAbilityCooldownOld)(void *self);
float towerAbilityCooldown(void *self) {
	return 0.0f;
}

float (*projectileLifetimeOld)(void *self);
float projectileLifetime(void *self) {
	return 1000.0f;
}

float (*projectileCutoffOld)(void *self);
float projectileCutoff(void *self) {
	return 10000.0f;
}

float (*statusEffectTimeOld)(void *self);
float statusEffectTime(void *self) {
	return 1000000.0f;
}

float (*statusEffectSlowOld)(void *self);
float statusEffectSlow(void *self) {
	return 0.0f;
}

float (*projectileSpeedOld)(void *self);
float projectileSpeed(void *self) {
	return 250.0f;
}

float (*damageOld)(void *self);
float damage(void *self) {
	return 100.0f;
}

bool (*canHitCammoOld)(void *self);
bool canHitCammo(void *self) {
	return true;
}

bool (*canPopAllOld)(void *self);
bool canPopAll(void *self) {
	return true;
}

bool (*placeTowerAnywhereOld)(void *self);
bool placeTowerAnywhere(void *self) {
	return true;
}

%hook  AppDelegate

- (char)application:(id)fp8 didFinishLaunchingWithOptions:(id)fp12 {
	[NSTimer scheduledTimerWithTimeInterval:10.0 target:self selector:@selector(enabledHacks) userInfo:nil repeats:NO];	
	
	return %orig;
}

%new
-(void)enabledHacks {
	
	UIAlertView *popup = [[UIAlertView alloc] initWithTitle:cre message:@"" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil,nil];
	[popup show];
	[popup release];
	
	MSHookFunction((void*)(0x1689F4+1),(void*)towerCost,(void**)&towerCostOld);							//cost of towers
	MSHookFunction((void*)(0x168A6C+1),(void*)towerRange,(void**)&towerRangeOld);						//tower range
	MSHookFunction((void*)(0x168AE4+1),(void*)towerFireDelay,(void**)&towerFireDelayOld);				//fire delay
	MSHookFunction((void*)(0x168B5C+1),(void*)towerFireCooldown,(void**)&towerFireCooldownOld);			//fire cooldown
	MSHookFunction((void*)(0x168BD4+1),(void*)towerAbilityCooldown,(void**)&towerAbilityCooldownOld);	//ability cooldown
	MSHookFunction((void*)(0x168C4C+1),(void*)projectileLifetime,(void**)&projectileLifetimeOld);		//how long projectile is on screen
	MSHookFunction((void*)(0x168CC4+1),(void*)projectileCutoff,(void**)&projectileCutoffOld);			//how far a projectile travels before disappearing
	MSHookFunction((void*)(0x168D3C+1),(void*)statusEffectTime,(void**)&statusEffectTimeOld);			//how long a status effect lasts
	MSHookFunction((void*)(0x168DB4+1),(void*)statusEffectSlow,(void**)&statusEffectSlowOld);			//speed multiplier of bloons by status effect
	MSHookFunction((void*)(0x168F1C+1),(void*)projectileSpeed,(void**)&projectileSpeedOld);				//speed at which projectiles move
	MSHookFunction((void*)(0x169090+1),(void*)damage,(void**)&damageOld);								//bloons projectile can pop before disappearing
	MSHookFunction((void*)(0x1692F0+1),(void*)canHitCammo,(void**)&canHitCammoOld);						//all towers can target cammo
	MSHookFunction((void*)(0x169378+1),(void*)canPopAll,(void**)&canPopAllOld);							//all towers can pop any bloons
	MSHookFunction((void*)(0x11898C+1),(void*)placeTowerAnywhere,(void**)&placeTowerAnywhereOld);		//place tower anywhere
	
	writeData(0x2E627C,0x8042); 																		//always able to skip map
	writeData(0x2E5CA4,0x0020); 																		//always able to spy on enemy
	writeData(0x2E3D22,0x0120); 																		//always able to roll extra tower
	writeData(0x2E3D24,0x0121C046); 																	//always able to roll extra tower
	writeData(0x2E3F1E,0x0020); 																		//always able to re-roll extra tower
	
}

%end