CASE WHEN instr(flags, 'Manuel: "') THEN substr(flags, instr(flags, 'Manuel: "') + length('Manuel: "'), instr(substr(flags, instr(flags, 'Manuel: "') + length('Manuel: "')), '"') - 1) END
CASE WHEN instr(flags, 'Wiki: "') THEN substr(flags, instr(flags, 'Wiki: "') + length('Wiki: "'), instr(substr(flags, instr(flags, 'Wiki: "') + length('Wiki: "')), '"') - 1) END
add nocopy BOOLEAN generated always as (flags GLOB '*NOCOPY*') virtual;
add nomanuel BOOLEAN generated always as (flags GLOB '*NOMANUEL*') virtual;
add boss BOOLEAN generated always as (flags GLOB '*BOSS*') virtual;
CASE WHEN nocopy THEN FALSE WHEN boss THEN FALSE WHEN nocopy_precombat THEN FALSE WHEN nomanuel THEN FALSE ELSE TRUE END
CASE WHEN nocopy THEN FALSE WHEN boss THEN FALSE WHEN nocopy_postcombat THEN FALSE WHEN nomanuel THEN FALSE ELSE TRUE END
add nobanish BOOLEAN generated always as (flags GLOB '*NOBANISH*') virtual;
CASE WHEN boss THEN false ELSE NOT nobanish END
add nowander BOOLEAN generated always as (flags GLOB '*NOWANDER*') virtual;
CASE WHEN boss THEN false ELSE NOT nowander END
add free BOOLEAN generated always as (flags GLOB '*FREE*') virtual;
add ghost BOOLEAN generated always as (flags GLOB '*GHOST*') virtual;
add snake BOOLEAN generated always as (flags GLOB '*SNAKE*') virtual;
// Cat for scepter, other buckets of monsters
add drippy BOOLEAN generated always as (flags GLOB '*DRIPPY*') virtual;
add wanderer BOOLEAN generated always as (flags GLOB '*WANDERER*') virtual;
add ultrarare BOOLEAN generated always as (flags GLOB '*ULTRARARE*') virtual;
add lucky BOOLEAN generated always as (flags GLOB '*LUCKY*') virtual;
add superlikely BOOLEAN generated always as (flags GLOB '*SUPERLIKELY*') virtual;
CASE WHEN instr(flags, 'Article: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Article: ') + length('Article: ')), ' ') THEN substr(flags, instr(flags, 'Article: ') + length('Article: '), instr(substr(flags, instr(flags, 'Article: ') + length('Article: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Article: ') + length('Article: ')) END END
CASE WHEN instr(flags, ' P: ') THEN CASE WHEN instr(substr(flags, instr(flags, ' P: ') + length(' P: ')), ' ') THEN substr(flags, instr(flags, ' P: ') + length(' P: '), instr(substr(flags, instr(flags, ' P: ') + length(' P: ')), ' ') - 1) ELSE substr(flags, instr(flags, ' P: ') + length(' P: ')) END END
CASE WHEN instr(flags, 'E: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'E: ') + length('E: ')), ' ') THEN substr(flags, instr(flags, 'E: ') + length('E: '), instr(substr(flags, instr(flags, 'E: ') + length('E: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'E: ') + length('E: ')) END END
CASE WHEN instr(flags, 'Group: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Group: ') + length('Group: ')), ' ') THEN substr(flags, instr(flags, 'Group: ') + length('Group: '), instr(substr(flags, instr(flags, 'Group: ') + length('Group: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Group: ') + length('Group: ')) END END
CASE WHEN instr(flags, 'Atk: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Atk: ') + length('Atk: ')), ' ') THEN substr(flags, instr(flags, 'Atk: ') + length('Atk: '), instr(substr(flags, instr(flags, 'Atk: ') + length('Atk: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Atk: ') + length('Atk: ')) END END
CASE WHEN instr(flags, 'Def: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Def: ') + length('Def: ')), ' ') THEN substr(flags, instr(flags, 'Def: ') + length('Def: '), instr(substr(flags, instr(flags, 'Def: ') + length('Def: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Def: ') + length('Def: ')) END END
CASE WHEN instr(flags, 'HP: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'HP: ') + length('HP: ')), ' ') THEN substr(flags, instr(flags, 'HP: ') + length('HP: '), instr(substr(flags, instr(flags, 'HP: ') + length('HP: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'HP: ') + length('HP: ')) END END
CASE WHEN instr(flags, 'Init: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Init: ') + length('Init: ')), ' ') THEN substr(flags, instr(flags, 'Init: ') + length('Init: '), instr(substr(flags, instr(flags, 'Init: ') + length('Init: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Init: ') + length('Init: ')) END END
CASE WHEN instr(flags, 'Scale: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Scale: ') + length('Scale: ')), ' ') THEN substr(flags, instr(flags, 'Scale: ') + length('Scale: '), instr(substr(flags, instr(flags, 'Scale: ') + length('Scale: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Scale: ') + length('Scale: ')) END END
CASE WHEN instr(flags, 'Cap: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Cap: ') + length('Cap: ')), ' ') THEN substr(flags, instr(flags, 'Cap: ') + length('Cap: '), instr(substr(flags, instr(flags, 'Cap: ') + length('Cap: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Cap: ') + length('Cap: ')) END END
CASE WHEN instr(flags, 'Floor: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Floor: ') + length('Floor: ')), ' ') THEN substr(flags, instr(flags, 'Floor: ') + length('Floor: '), instr(substr(flags, instr(flags, 'Floor: ') + length('Floor: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Floor: ') + length('Floor: ')) END END
CASE WHEN instr(flags, 'Phys: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Phys: ') + length('Phys: ')), ' ') THEN substr(flags, instr(flags, 'Phys: ') + length('Phys: '), instr(substr(flags, instr(flags, 'Phys: ') + length('Phys: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Phys: ') + length('Phys: ')) END END
CASE WHEN instr(flags, 'Elem: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Elem: ') + length('Elem: ')), ' ') THEN substr(flags, instr(flags, 'Elem: ') + length('Elem: '), instr(substr(flags, instr(flags, 'Elem: ') + length('Elem: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Elem: ') + length('Elem: ')) END END
CASE WHEN instr(flags, 'MLMult: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')), ' ') THEN substr(flags, instr(flags, 'MLMult: ') + length('MLMult: '), instr(substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'MLMult: ') + length('MLMult: ')) END END
CASE WHEN instr(flags, 'Exp: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Exp: ') + length('Exp: ')), ' ') THEN substr(flags, instr(flags, 'Exp: ') + length('Exp: '), instr(substr(flags, instr(flags, 'Exp: ') + length('Exp: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Exp: ') + length('Exp: ')) END END
CASE WHEN instr(flags, 'Poison: "') THEN substr(flags, instr(flags, 'Poison: "') + length('Poison: "'), instr(substr(flags, instr(flags, 'Poison: "') + length('Poison: "')), '"') - 1) END
CASE WHEN instr(flags, 'Item: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Item: ') + length('Item: ')), ' ') THEN substr(flags, instr(flags, 'Item: ') + length('Item: '), instr(substr(flags, instr(flags, 'Item: ') + length('Item: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Item: ') + length('Item: ')) END END
CASE WHEN instr(flags, 'Skill: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Skill: ') + length('Skill: ')), ' ') THEN substr(flags, instr(flags, 'Skill: ') + length('Skill: '), instr(substr(flags, instr(flags, 'Skill: ') + length('Skill: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Skill: ') + length('Skill: ')) END END
CASE WHEN instr(flags, 'Spell: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Spell: ') + length('Spell: ')), ' ') THEN substr(flags, instr(flags, 'Spell: ') + length('Spell: '), instr(substr(flags, instr(flags, 'Spell: ') + length('Spell: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Spell: ') + length('Spell: ')) END END
CASE WHEN instr(flags, 'Meat: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'Meat: ') + length('Meat: ')), ' ') THEN substr(flags, instr(flags, 'Meat: ') + length('Meat: '), instr(substr(flags, instr(flags, 'Meat: ') + length('Meat: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'Meat: ') + length('Meat: ')) END END
CASE WHEN instr(flags, 'SprinkleMin: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'SprinkleMin: ') + length('SprinkleMin: ')), ' ') THEN substr(flags, instr(flags, 'SprinkleMin: ') + length('SprinkleMin: '), instr(substr(flags, instr(flags, 'SprinkleMin: ') + length('SprinkleMin: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'SprinkleMin: ') + length('SprinkleMin: ')) END END
CASE WHEN instr(flags, 'SprinkleMax: ') THEN CASE WHEN instr(substr(flags, instr(flags, 'SprinkleMax: ') + length('SprinkleMax: ')), ' ') THEN substr(flags, instr(flags, 'SprinkleMax: ') + length('SprinkleMax: '), instr(substr(flags, instr(flags, 'SprinkleMax: ') + length('SprinkleMax: ')), ' ') - 1) ELSE substr(flags, instr(flags, 'SprinkleMax: ') + length('SprinkleMax: ')) END END
//'EA:'
//'ED:'

// https://github.com/kolmafia/kolmafia/commits/main/src/data/monsters.txt
// Need an additional case on most columns testing for [] for expressions, however only god lobster does not parse correctly without this extra case
// some poisons missing, mostly telegram snakes
// monster parts missing, may have to collect from wiki
// https://github.com/kolmafia/kolmafia/blob/main/src/net/sourceforge/kolmafia/MonsterData.java
