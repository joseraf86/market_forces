Market Forces is a game that revolves around resource production and currency-levered trading.

### Description

Market Forces is built upon 3 separate aspects, namely:
```
resources -> production -> trading
```

**Resource-related constraints:**

 * Each player is given an **spot**
 * **Resource potential** is the amount of resource availability known to players
 * Each player **spot** has a random generated **resource potential** for each resource
 * **Resource potential** is just partially known to players
 * **Resource potential** will gradually vary in time
 * Sometimes **resource potential** may change drastically
 * Some resources will be scarce and some others will abound in each **spot**
 * Some **spots** may lack of some resources whatsoever at a given time
 * No player can have all resources initially, therefore players will be encourage to trade resources in a free market
 * Resources are actually endless in a _spot_ but resource-specific availability is not granted at an specific time
 * At any time all players must have availability to some resources

**Production-related constraints:**

 * Players must build **facilities** in their _spots_
 * Players can build has many facilities if they pay the required costs
 * Facilities have an initial cost
 * Players will have enough initial resources to let them build as much facilities as they see fit
 * Facilities will let players exploit their **spot** resources
 * Facilities transform **spot's** **resource potential** in effective resources ready to be invested or traded.
 * Facilities require an input to exploit a resource as output
 * Input = energy + maintenance resource
 * Once the energy is depleted no more production will take place
 * There are 2 kind of resources: Energetic resources and regular resources
 * Facilities need energy taken from energetic resources to operate
 * A facility exploit a resource at a certain **working rate**
 * Facilities may level up
 * Each level up increses facility production rate but also the maintenance resource required to operate
 * At level 1 no maintenance resource is required
 * At level 1 facilities operate at their lowest **working rate**
 * Players can chose wich energetic resource want their facility depend on
 * A player cannot change facility's **energetic resource** once it is already set
 * A player can chose which maintenance resource want their facility depend on
 * A player cannot chose as maintenance resource the facility's output resource 
 * A player may level up a facility investing an extra amount of the maintenance resource
 * Players may chose at which level a facility will work on
 * Players may not invest in a facility maintenence but when the energetic resource is depleted the facility will stop its operation and will decrease 1 level

---
 
**Example:** Initial State
 
Given a player with 1 _spot_ with the following resource distribution potentials:

**Resources:**

| regular  | potential | texture |
|----------|:---------:|---------|
| timber   |    500    |![timber_texture](https://github.com/joseraf86/market_forces/blob/master/img/timber_texture-64x64.jpg?raw=true) |
| iron     |    300    |![iron_texture](https://github.com/joseraf86/market_forces/blob/master/img/iron_texture-64x64.jpg?raw=true)|
| gold     |    5      | ![gold_texture](https://github.com/joseraf86/market_forces/blob/master/img/gold_texture-64x64.jpg?raw=true)|
| copper   |    300    |![copper_texture](https://github.com/joseraf86/market_forces/blob/master/img/copper_texture-64x64.jpg?raw=true)|
| diamond  |    5      |![diamond_texture](https://github.com/joseraf86/market_forces/blob/master/img/diamond_texture-64x64.jpg?raw=true)|
| clay     |    600    |![clay_texture](https://github.com/joseraf86/market_forces/blob/master/img/clay_texture-64x64.jpg?raw=true)|
| marble   |    30     |![marble_texture](https://github.com/joseraf86/market_forces/blob/master/img/marble_texture-64x64.jpg?raw=true)|

.

|energetic | potential | texture |
|----------|:---------:|---------|
| coal     |    500    |![coal_texture](https://github.com/joseraf86/market_forces/blob/master/img/coal_texture-64x64.jpg?raw=true) |
| oil      |    300    |![oil_texture](https://github.com/joseraf86/market_forces/blob/master/img/oil_texture-64x64.jpg?raw=true)|
| gas      |    5      |![gas_texture](https://github.com/joseraf86/market_forces/blob/master/img/gas_texture-64x64.jpg?raw=true)|
| water    |    300    |![water_texture](https://github.com/joseraf86/market_forces/blob/master/img/water_texture-64x64.jpg?raw=true)|
| uranium  |    5      |![uranium_texture](https://github.com/joseraf86/market_forces/blob/master/img/uranium_texture-64x64.jpg?raw=true)|
 
The player can build only its first facility for free. The player chooses to build a gold mine first. At level 1 a
facility requires no maintenance resource, nonetheless the player have not any energetic resource so gold production cannot start off. The player have two choices then:

* Print some money to exchange its currency for the desired resource (check currency)
* Unbuild the only facility it has built so far and build another facility for free. This new facility should exploit some energetic resource, otherwise any initial facility production cannot occur

The player decides to unbuild its only facility and build other one, this time tied to coal. This process goes as follows:

The player can build only its first facility for free. The player chooses to build a gold mine first. At level 1 a
facility requires no maintenance resource, nonetheless the player have not any energetic resource so gold production cannot start off. The player have two choices then:

* Print some money to give its currency in exchange of the desired resource (see currency)
* Unbuild the only facility it has built so far and build another facility for free. This new facility should exploit some energetic resource, otherwise any initial facility production cannot occur

The player decides to unbuild its only facility and build other one, this time tied to coal. This process goes as follows:

facility level: 1
exploited resource: coal
Maintenance resorce: wood

The players decides to build a timber-operated facility that exploits coal. Since the facility is in its first level it requires no maintenance at all. Therefore the player eventually will get alll the energetic reosource needed to ignite the production process.




so after some time the player will have some amounts of gold stored within its
treasury.


 ```
 Input = Energy + Maintenance resource
 Energy: Coal (energetic resource)
 Maintenance resource: wood (regular resource)
 ```

 **Initial escenario**
 
 _Spot_:  1K gold (at least)
 initial facility cost?
 facility level 1
 Energy + no maintenance -> facility -> 
 60 coal -> gold facility 0,25 gold/minute
 58 coal -> 0,5 gold
 56 coal -> 1 gold
 0  coal -> 15 gold

| facility level | exploited resource |maintenance resource| energetic resource |
|----------------|--------------------|:------------------:|:------------------:|
| 1              | coal               |N/A                 |N/A                 |

The player decides to build a timber-producing facility that will exploit coal. Since the facility is in its first level it requires no maintenance at all. Furthermore, the first energetic resource facility must operate with no energetic resource at level 1 also, so that the boot production process can begin.

The timber-producing facility will begin to exploit timber at its lowest **working rate** (yet to be defined),
so after some time the player will end up with some timber stored within its **treasury**.

Situation:
 
_Spot_: 500 timber
Facility level: 1
Facility exploited resource: coal
Facility maintenance resource: N/A
Facility energetic resource: N/A
Initial facility cost: N/A
Facility working rate: 0,25 coal/minute (yet to be defined)


**Production process:**

| minute   |exploited resource | energetic resource | maintenance resource |
|:--------:|:-----------------:|:------------------:|:--------------------:|
|0         |         0,25      |       N/A          |        N/A           |
|1         |         0,5       |                    |                      |
|...       |         ...       |                    |                      |
|58        |         14.75     |                    |                      |
|59        |         15        |                    |                      |

Now that the pleyer has some coal sotored he can choose to

* Trade the resource gathered
* Invest the resource gathered
* Save up the resource gathered

The player decides to invest in a gold mine but he will need some timber to build it up. He chose timber instead of other regular resources because timber has a higher resource potential in his _spot_. Since the player already has a coal-producing facility his second facility is not for free. He will need to invest some timber to build a timber-based gold-producing facility if he choooses so. He can of course depend on other regular material. What's more, he will need to choose which energetic resource its timber-based facility will depend on as well.

Player's decision goes as follows:

Facility level: 1
Facility exploited resource: gold
Facility maintenance resource: timber
Facility energetic resource: coal
Initial facility cost: 10 timber
Facility working rate: 0,025 gold/minute (yet to be defined)
 
Player has no timber, so he can choose to:

1. Trade some of his coal in exchange of 10 timber
2. Print some money and exchange his currency for 10 timber
3. Unbuild his coal-producing facility to have a free coal-based timber-producing facility

Though the third option do not depend on others players, in general is not wise to do so because you can only have one of these _starter_ facilities at a time, and it will operate for free just in its first level at its **minimum working rate**.
Nevertheless, for the sake of simplicity, the player will chose the third option.

The player choses to unbuild his coal-producing facility in order to build a timber-producing facility. Currently the player has 15 coal in his **treasury**. He decides to produce timber has follows:

Facility level: 1
Facility exploited resource: timber
Facility maintenance resource: N/A
Facility energetic resource: coal
Initial facility cost N/A
Facility working rate: 0,5 timber/minute

| minute   | exploited resource | energetic resource | maintenance resource|
|----------|--------------------|:------------------:|:--------------------:
|0         |0.5                 |N/A                 |N/A
|1         |1                   |                    |
|...       |...                 |                    |
|57        |29                  |                    |
|58        |29.5                |                    |
|59        |30                  |                    |


Now the player has 30 timber and 15 coal. The player decides to build his gold mine:

Facility level: 1
Facility exploited resource: gold
Facility mainteinance resource: timber
Facility energetic resource coal
Initial facility cost: 10 timber
Facility working rate: 0,025 gold/minute
Facility consuming rate: 0,20 coal/minute

| minute   | exploited resource | energetic resource |maintenance resource
|:--------:|:------------------:|:------------------:|:------------------:
| 0        |0.025               |14.8                |N/A
| 1        |0.05                |14.6                |
| ...      |...                 |...                 |
| 57       |1.45                |2.6                 |
| 58       |1.475               |2.4                 |
| 59       |1.5                 |2.2                 |


The player have now two facilities:

* 1 coal-based timber-producing facility
* 1 coal-powered timber-based gold-producing facility
 
The player have now in his **tresury** 2.2 coal, 1.5 gold and 20 timber.

#### Leveling facilities up

 consumptium rate = 1 - working rate
 level 1
 consumptium rate =
 facility level 2
 n Energy resource + (0,05*n) Manteinance resource -> facility (K*n resource per hour) -> output
 60 coal + 3 wood -> gold facility 0,5 gold/minute 
 58 coal +   --   -> 1 gold
 0  coal +   --   -> 30 gold
 
 facility level 3
 60 coal + 6 wood -> gold facility 1 gold/minute
  0 coal +  --     -> 60 gold

**Currency Exchange**

(it can be a city, a country, lands, planets) the theme  

Vocabulary
Resource potential
Spot