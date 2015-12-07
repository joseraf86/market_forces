# Market Forces: 

## A resource investment and currency exchange game.

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
 
Some player have 1 _spot_ with the following resource distribution potentials:

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
| gas     |    5       |![gas_texture](https://github.com/joseraf86/market_forces/blob/master/img/gas_texture-64x64.jpg?raw=true)|
| water   |    300     |![water_texture](https://github.com/joseraf86/market_forces/blob/master/img/water_texture-64x64.jpg?raw=true)|
| uranium  |    5      |![uranium_texture](https://github.com/joseraf86/market_forces/blob/master/img/uranium_texture-64x64.jpg?raw=true)|

 
 Input = Energy + Maintenance resource
 Energy: Coal (energetic resource)
 Maintenance resource: wood (regular resource)
 
 Initial escenario
 _Spot_:  1K gold (at least)
 initial facility cost?
 facility level 1
 Energy + no maintenance -> facility -> 
 60 coal -> gold facility 0,25 gold/minute
 58 coal -> 0,5 gold
 56 coal -> 1 gold
 0  coal -> 15 gold
 
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
