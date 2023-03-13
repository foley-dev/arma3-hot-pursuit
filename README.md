# Hot Pursuit

![Loading screen](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/loading.png)

*A suspicious truck has been spotted...*

## About

* Co-op + Civilians
* Map: **Altis**
* Player count: **25**\
(15 combat roles + 10 civilians)
* Typical duration: **10 min – 25 min**
* [Mod dependencies](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/tour_modset.html) (load into Arma 3 Launcher

## Briefing

### AAF

> A suspicious truck has been reported east-bound leaving Altis Intl. Airport where you're based. Description matches a classified project run by CSAT.\
\
The truck is currently on the highway, escorted by several light vehicles. Unless we intervene, it will reach the border within 20 minutes.\
\
**Intercept the truck ASAP and bring it back to base in one piece.**\
\
Civilians may be active in the area, use caution.

### Civilians (optional)

> You will act as a civilian road user.\
\
This is a **non-combatant** role. Refrain from operating weapons and military vehicles.\
\
Please drive sensibly:
>- stay on the right side of the road
>- respect speed limits
>- give way to emergency vehicles
>- do not block or interfere with military vehicles in any disruptive way
>
>Feel free to explore as you see fit, though it's best to stay near the highway inbetween: Rodopoli - Paros - Delfinaki - Sofia.

## Scripting highlights

* **Heavily scripted damage handling** for the truck to encourage players to stop the truck in order to eliminate the crew. This also reduces the risk of explosion when the truck is rammed by another vehicle. `scripts\server\damageControl.sqf`
* Heavily scripted AI behaviour `scripts\server\ai.sqf`
    * **"Runaway" behaviour** intended to make the truck driver extremely stubborn and always moving `scripts\server\runaway.sqf`
    * **Escort behaviour** intended to keep the convoy in the formation and dismount only when the situation really requires it `scripts\server\escort.sqf`
* Adjustments to vehicles `scripts\server\vehicles.sqf`
    * Automatically shutting off siren when driver leaves the vehicle (GTA V-inspired)
    * Helicopter locked to pilot slots only
    * Road safety equipment (i.e. cones, barriers, lights) automatically loaded into vehicle cargo (ACE3 feature)
* Discouraging civilian players from interfering with the AI convoy `scripts\player\collisions.sqf`
* Selectable escort strength `description.ext`

## Video

[***Watch on YouTube***](https://youtu.be/beIPVC8Eix4)

## Screenshots

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/1.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/2.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/3.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/4.jpg)

![Screenshot](https://raw.githubusercontent.com/foley-dev/arma3-hot-pursuit/assets/screenshots/5.jpg)

## Playable slots

### Command
* Commander

### Alpha
* Team Leader
* Autorifleman
* Rifleman (LAT)

### Bravo
* Team Leader
* Breacher (Shotgun)
* Explosives Specialist

### Charlie
* Team Leader
* Grenadier
* Combat Life Saver

### Delta
* Lead Service Enginner
* Service Engineer
* Service Engineer
* Service Medic

### Hotel
* Helicopter Pilot

### Civilians
* Civilian (BMW)
* Civilian (Hilux)
* Civilian (Sprinter)
* Civilian (Yava Motorbike)
* Civilian (Civic)
* Civilian (Golf)
* Civilian (Ikarus Bus)
* Civilian (Landcruiser)
* Civilian (Ural Tow Truck)
* Civilian (Lada)
