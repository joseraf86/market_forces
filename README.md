# Market Forces
## Resource production & currency-levered trading

### Description

Market Forces is a game that revolves around resource production and currency-levered trading.

Market Forces is built upon 3 separate aspects, namely:
```
resources -> production -> trading
```

### Resource-related constraints:

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

### Production-related constraints:

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
* If a plyer only have 1 energetic-resource-pruducing facility and that facility is in level 1 it should produce that energetic resource without energetic resource inout nor maintenance
* At level 1 all facilities don't requery maintenance resource
* If a player only have 1 regular-resource-producing facility and that facility is in level 1 it should produce that regular resource without maintenance resource but it still need the energetic resource to operate

---
 
#### Example: Initial State
 
Given a player with 1 _spot_ with the following resource distribution potentials:

##### Resources:

|regular   |potential  |texture                            |
|:--------:|:---------:|:---------------------------------:|
| timber   |    500    |![timber_texture][timber_texture]  |
| iron     |    300    |![iron_texture][iron_texture]      |
| gold     |    5      |![gold_texture][gold_texture]      |
| copper   |    300    |![copper_texture][copper_texture]  |
| diamond  |    5      |![diamond_texture][diamond_texture]|
| clay     |    600    |![clay_texture][clay_texture]      |
| marble   |    30     |![marble_texture][marble_texture]  |

.

|energetic |potential  |texture                            |
|:--------:|:---------:|:---------------------------------:|
| coal     |    500    |![coal_texture][coal_texture]      |
| oil      |    300    |![oil_texture][oil_texture]        |
| gas      |    5      |![gas_texture][gas_texture]        |
| water    |    300    |![water_texture][water_texture]    |
| uranium  |    5      |![uranium_texture][uranium_texture]|
 

The player can build only its first facility for free. The player chooses to build a gold mine first. At level 1 a
facility requires no maintenance resource, nonetheless the player have not any energetic resource so gold production cannot start off. The player have two choices then:

* Print some money to give its currency in exchange of the desired resource (see currency)
* Unbuild the only facility it has built so far and build another facility for free. This new facility should exploit some energetic resource, otherwise any initial facility production cannot occur

The player decides to unbuild his only facility and then builds another one, this time tied to coal.
This process goes as follows:

| facility   | value          | free |
|:----------:|:--------------:|:----:|
|level       |1               |      |
|exploited   |coal            |      |
|maintenance |timber          |x     |
|energetic   |coal            |x     |
|initial cost|ytbd\*          |x     |
|working rate|0.25 coal/minute|      |
\* ytbd: yet to be defined

The player decides to build a timber-based coal-powered facility that will exploit coal. Since the facility is in its first level it requires no maintenance at all. Furthermore, the facility must operate with no energetic resource at level 1 so that the boot production process can begin (this is the only player's facility so far).

The timber-producing facility will begin to exploit timber at its lowest **working rate** (yet to be defined),
so after some time the player will end up with some timber stored within its **treasury**.

##### Production process:

| minute   |exploited resource | energetic resource | maintenance resource |
|:--------:|:-----------------:|:------------------:|:--------------------:|
|0         |         0,25      |       N/A          |        N/A           |
|1         |         0,5       |                    |                      |
|...       |         ...       |                    |                      |
|58        |         14.75     |                    |                      |
|59        |         15        |                    |                      |

Now that the player has some coal stored in his **treasury** he can choose to

* Trade the resource gathered
* Invest the resource gathered
* Save up the resource gathered

The player decides to invest in a gold mine but he will need some timber to build it up. He choses timber instead of other regular resources because timber has a higher resource potential in his _spot_. Since the player already has a coal-producing facility his second facility cannot be built for free. He will need to invest some timber to build a timber-based coal-powered gold-producing facility if he chooses so. He could, of course, make the facility depend on other regular resource besides timber. What's more, he must choose which energetic resource its timber-based facility will depend on as well (coal this time).

Yet the player has no timber, so he can choose to:

1. **Trade** some of his coal in exchange of 10 timber
2. **Print some money** and exchange his currency for 10 timber
3. **Unbuild** his coal-producing facility to have a free coal-powered timber-producing facility

Though the third option do not depend on others players, in general is not wise to do so because you can only have one of these _starter_ facilities at a time. It will operate for free just if no other facilities are built when you are building it. Also, it will operate for free just in its first level at its **minimum working rate**. Nevertheless, for the sake of example simplicity, the player will choose the third option.

The player chooses to unbuild his coal-producing facility in order to build a timber-producing facility. Currently the player has 15 coal in his **treasury**. The player decides to produce timber as follows:

| facility   | value           | free |
|:----------:|:---------------:|:----:|
|level       |1                |      |
|exploited   |timber           |      |
|maintenance |iron             |x     |
|energetic   |coal             |x     |
|initial cost|ytbd\*           |x     |
|working rate|0.5 tomber/minute|      |

##### Timber production 

| minute   | exploited resource | energetic resource | maintenance resource|
|----------|--------------------|:------------------:|:--------------------:
|0         |0.5                 |N/A                 |N/A
|1         |1                   |                    |
|...       |...                 |                    |
|57        |29                  |                    |
|58        |29.5                |                    |
|59        |30                  |                    |


Now the player has 30 timber and 15 coal in his **treasury**.
The player decides to build his gold mine thereafter:

| facility     | value             | free |
|:------------:|:-----------------:|:----:|
|level         |1                  |      |
|exploited     |gold               |      |
|maintenance   |timber             |      |
|energetic     |coal               |      |
|initial cost  |10 timber          |      |
|working rate  |0.025 gold/minute  |      |
|consuming rate|0.20 coal/minute   |      |

##### Gold production

| minute   | exploited resource | energetic resource |maintenance resource
|:--------:|:------------------:|:------------------:|:------------------:
| 0        |0.025               |14.8                |N/A                |
| 1        |0.05                |14.6                |                   |
| ...      |...                 |...                 |                   |
| 57       |1.45                |2.6                 |                   |
| 58       |1.475               |2.4                 |                   |
| 59       |1.5                 |2.2                 |                   |


The player have now two facilities:

* 1 iron-based coal-powered timber-producing facility
* 1 timber-based coal-powered gold-producing facility
 
##### Player's treasury:

| resource | potential | 
|----------|-----------|
| coal     |2.2        |
| gold     |1.5        |
| timber   |20         |

##### Player's spot

| regular  | potential | texture                           |
|----------|:---------:|-----------------------------------|
| timber   |    470    |![timber_texture][timber_texture]  |
| iron     |    300    |![iron_texture][iron_texture]      |
| gold     |    3.5    |![gold_texture][gold_texture]      |
| copper   |    300    |![copper_texture][copper_texture]  |
| diamond  |    5      |![diamond_texture][diamond_texture]|
| clay     |    600    |![clay_texture][clay_texture]      |
| marble   |    30     |![marble_texture][marble_texture]  |

.

|energetic | potential | texture                           |
|----------|:---------:|-----------------------------------|
| coal     |    485    |![coal_texture][coal_texture]      |
| oil      |    300    |![oil_texture][oil_texture]        |
| gas      |    5      |![gas_texture][gas_texture]        |
| water    |    300    |![water_texture][water_texture]    |
| uranium  |    5      |![uranium_texture][uranium_texture]|


#### Leveling facilities up

Players may upgrade their facilities leveling them up.

* An upgraded facility increases its producing resource **production rate**
* An upgraded facility increses its energetic resource **comsuption rate**
* An upgraded facility increses its maintenance resource requirement
* Facilities start off at level 1
* All facilities may incresed their levels sequentially: 1,2,3...
* Leveling facilities up do have a an increasing cost
* Maintenance facility level-up cost must match regular resource maintenance
* Players may choose their facility production level
* Facilities can be downgraded so that players can get its maintenance resource investement back to their **treasury**
* In order to upgraded/downgrade a level the facility production process must not being performed

### Trading

Trading is one of the main aspect of the game. Trading takes place between any two players. In order to do so a player must offer some resource in exchange of another resource (barter). Just one type of resource can be traded in one transaction and they must be different. Players are completely free to agree the exchange rate. Players should always give something for something back. Players can't give away resources. Both players must agree before the transaction takes place.

#### Distances

* Player's can own several **spots** besides the one they get when they start the game. How much and how they can get more **spots** is yet to be defined
* There are always distances defined between each two **spots** even if they belong to the same player or not
* Players can exchange resources only if they have enough energy to transport them
* The longer the distance the higher the amount of energy needed to move the exchanged resources
* Farther distances implies higher amounts of time to deliver the exchanged resources
* Player can move reources from one of his **spots** to another only if he has the energy required to do so
* Energy is taken from player's energetic resources stored in his **treasury**
* It is wise to trade with those player who have near **spots** to other players so the energy cost implied in resource movement can be diminished
* It is wise to build player own facilities near so that they can exchage resources quickly with low energy cost and to build facilities at strategic **spots** near places that have the resource a player is lacking of, a player can in turn exchange this resource for the scarce resource in the near **spots**

#### Currency exchange

* Players are free to print and name their own currency. How much money they can print is yet to be defined.
* A player can give some of his money in exchange of resources
* A player can accept resources in exchange of other players money
* Players can exchange their currency directly
* Money exchange requires no energy
* The exchange rate must be agreed by the players performing the transaction
* Transaction information involving players' currency will be made public so that other player can have some reference of the exchange rate.
* Player's own and foreign currency are stored in the **treasury**

Players can use their own money to get resources from other players in advance and to save the energy implied when resources are moved from one **spot** to another, but both player should agree first on this and set the exchange rate.

Nevertheless, it's wise that players accept their own currency as a legitimate exchange instrument. So, when a player asks another player for some resources giving in exchange the emiting-money player currency this player should accept the offer agreeing the transaction at some exchage rate. This way players currency gain trust. Later, the emiting-money player can use this instrument as a means to get resources in advance as he see fit. There must be a mechanism that can tell other players how trusted a currency is. Foreign currency can be think of as some sort of wealth if this currency is printed by a trusted player (someone who always accept their own currency as payment at a reasonable exchange rate and publish his **treasury** status regularly) because this amount of money represent potential access to other markets and its resources.

##### Valuable information

* Gathered resources and other players currency stored in **treasury** can represent player's wealth
* A player can choose if they want to make public **treasury** information so that other players can have an idea how stable his currency is or made just a partial display of the treasury information.
* Potential resource access are another source of valuable information
* Distances between **spots** idem
* Distribution of resource availability in near located **spots**
* Amount of money printed vs amount of money accepted
* Amount of currency widespread in the market
* Exchage rates information
* Amount of transactions done
* Amount of owned facilities built in other players **spots** (industrial power) 
* Players who excels managing their resources can become their own currency a reference in the market
* The printed amount of money divided by the resources gathered can be seen as a way to guess how worthy a currency unit is.
* Players can decrease the amount of money they have printed but this money must be in their **treasury** first
* How much money a player has printed and how much own money a player have accepted information must be publicly available.
* No player can print other player currency

#### Renting **spots**

* A player can let other players build facilities in their **spots** for a areed amount of the resource production exploited
* A player can decide instead to let a user to exploit his resource until reaching a resource gathering limit in exchange of currency or other resources
* Not producing foreign facilities can be taken by a player. Once a facility is expropriated it can be used inmediately for the expropriating player, but this act will be publicly known
* A player can decide to unbuild their facilities in other player **spot** if they are not producing and take their resources back provided the energy required to move the resources.



### Food for thought

* What will motivate users to gather resources and level up facilities since there's nothing but facilities to be build?
* What's the overall game goal?. For instance in some games players climb up in some sort of ladder or leages, or they complete collections of objects (cards, creatures, treasures), they get the highest score, show off with fancy decorations or awards)
* Will it "blend"?: be entertaining and "catchy": a Proof of Concept prototype must be built first.
* What will players make them play again the game (notification mechanism, expiring times, logins instant rewards)
* Overall game purpose, what will player will get from it?
* Does it provide some sort of gamers feedback?
* How the app can be sustainable? Monetization (Ads, in-game currency, accelration/power-ups, hybrid startegy?)
* Game lifespan: Every game have a loifespan after a player fulfill its goal the game is over (Ladder top, all buildings finished, all levels cleared, etc). How can we make the game cyclic?
* How players will have fun?

```
resources -> production -> trading -> spending? -> resources (extra spots/rent?)
```

Once a player has gathered enough wealth he should be able to get more resources to exploit so that there are always new
Player must have easy and quick access to other players' economic & production information so that they can made clever decision
**Spots** resource potential should constantly change in a more or less predictible manner so that player can think of an strategy firsthand but no magic formula can be derived. 
---

[//]: # (TODO)

### Vocabulary 
**Resource potential**
**Spot**
**energetic resource**
**regular resource**
**facility**
**working rate**
**consumption rate**
**energy**

[//]: # (TEXTURES)

[//]: # (REGULAR RESOURCES)

[timber_texture]: https://github.com/joseraf86/market_forces/blob/master/img/timber_texture-64x64.jpg?raw=true
[iron_texture]: https://github.com/joseraf86/market_forces/blob/master/img/iron_texture-64x64.jpg?raw=true
[gold_texture]: https://github.com/joseraf86/market_forces/blob/master/img/gold_texture-64x64.jpg?raw=true
[copper_texture]: https://github.com/joseraf86/market_forces/blob/master/img/copper_texture-64x64.jpg?raw=true
[diamond_texture]: https://github.com/joseraf86/market_forces/blob/master/img/diamond_texture-64x64.jpg?raw=true
[clay_texture]: https://github.com/joseraf86/market_forces/blob/master/img/clay_texture-64x64.jpg?raw=true
[marble_texture]: https://github.com/joseraf86/market_forces/blob/master/img/marble_texture-64x64.jpg?raw=true

[//]: # (ENERGETIC RESOURCES)

[coal_texture]: https://github.com/joseraf86/market_forces/blob/master/img/coal_texture-64x64.jpg?raw=true
[oil_texture]: https://github.com/joseraf86/market_forces/blob/master/img/oil_texture-64x64.jpg?raw=true
[gas_texture]: https://github.com/joseraf86/market_forces/blob/master/img/gas_texture-64x64.jpg?raw=true
[water_texture]: https://github.com/joseraf86/market_forces/blob/master/img/water_texture-64x64.jpg?raw=true
[uranium_texture]: https://github.com/joseraf86/market_forces/blob/master/img/uranium_texture-64x64.jpg?raw=true