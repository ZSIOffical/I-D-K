local Bypasses = {
	['fuck'] = 'fˁucˁk',
	['bitch'] = 'bitˁch',
	['whore'] = 'whoˁre',
	['fucker'] = 'fuˁcker',
	['nigger'] = 'nˁigˁger',
	['nigga'] = 'nˁigˁga',
	['niggas'] = 'nˁiggas',
	['pussies'] = 'puˁssˁies',
	['ass'] = 'asˁs',
	['faggot'] = 'faˁggot',
	['nazi'] = 'naˁzi',
	['jew'] = 'jeˁw',
	['cunt'] = 'cuˁnt',
	['slut'] = 'slˁut',
	['commie'] = 'coˁmmie',
	['commy'] = 'coˁmmy',
	['lmao'] = 'lˁmao',
	['lmfao'] = 'lmˁfao',
	['penis'] = 'penˁis',
	['vagina'] = 'vagˁina',
	['hoe'] = 'hˁoe',
	['boob'] = 'boˁob',
	['boobies'] = 'booˁbies',
	['boobs'] = 'booˁbs',
	['tits'] = 'tˁits',
	['shit'] = 'shˁit',
	['dick'] = 'dˁick',
	['dickhead'] = 'dˁickˁhead',
	['bastard'] = 'baˁstard',
	['damn'] = 'daˁmn',
	['cum'] = 'cˁum',
	['fatass'] = 'faˁtaˁss',
	['rape'] = 'raˁpe',
	['rapist'] = 'raˁpˁist',
	['hoes'] = 'hˁoeˁs',
	['bitches'] = 'bˁitches',
	['fucking'] = 'fˁuˁcˁkˁiˁng',
	['sex'] = 'sˁex',
	['pussy'] = 'puˁssy',
	['sexy'] = 'seˁxy',
	['horny'] = 'horˁny',
	['masturbate'] = 'masˁturˁbate',
	['killyourself'] = 'kˁillyouˁrself',
	['kys'] = 'kˁys',
	['asshole'] = 'asˁshoˁle',
	['cocaine'] = 'cocaˁine',
	['crack'] = 'crˁack',
	['weed'] = 'weˁed',
	['marijuana'] = 'marˁijuana',
	['meth'] = 'mˁeth',
	['haroine'] = 'haroˁine',
	['slut'] = 'sˁlut',
	['stfu'] = 'stˁfu',
	['retard'] = 'reˁtaˁrd',
	['discord'] = 'dˁiscˁord',
	['cj#1211'] = 'cˁj#ˁ12ˁ11',
	['omfg'] = 'omˁfg',
	['hitler'] = 'hitˁler',
	['balls'] = 'baˁlls',
	['fml'] = 'fmˁl',
	['crip'] = 'cˁrip',
	['suck'] = 'sˁuck',
	['kiss'] = 'kˁisˁs',
	['my'] = 'mˁy',
	['you'] = 'yˁou',
	['nipple'] = 'nˁipˁple',
	['nipples'] = 'nˁipˁples',
	['lick'] = 'lˁick',
	['gay'] = 'gˁay',
	['oder'] = 'oˁder',
	['blowjob'] = 'bˁlowˁjob',
	['eat'] = 'eˁat',
	['fuckin'] = 'fuˁckˁin',
	['jesus'] = 'jeˁsus',
	['fuc'] = 'fuˁc',
	['bitc'] = 'bitˁc',
	['sax'] = 'saˁx',
	['baby'] = 'baˁby',
	['oh'] = 'oˁh',
	['mama'] = 'maˁma',
	['love'] = 'loˁve',
	['like'] = 'liˁke',
	['hot'] = 'hoˁt',
	['hawt'] = 'haˁwt',
	['babe'] = 'baˁbe',
	['mf'] = 'mˁf',
	['kick'] = 'kˁick',
	['marry'] = 'maˁrrˁy',
	['propose'] = 'prˁoˁpose',
	['husband'] = 'husˁband',
	['huhband'] = 'huhˁband',
	['pregnant'] = 'pˁreˁgˁnaˁnt',
	['pregnancy'] = 'pˁreˁgˁnanˁcy',
	['kisses'] = 'kiˁssˁes',
	['ily'] = 'iˁlˁy',
	['ilu'] = 'iˁlˁu',
	['luv'] = 'lˁuˁv',
	['wuv'] = 'wˁuˁv',
	['u'] = 'ˁu',
	['butthole'] = 'buˁtˁtˁhole',
	['butt'] = 'bˁutˁt',
	['buttcrack'] = 'buˁttˁcrack',
	['asscrack'] = 'aˁsˁscrack',
	['homo'] = 'hˁomˁo',
	['muah'] = 'muˁah',
	['uwu'] = 'uˁwˁu',
	['owo'] = 'oˁwˁo',
	['mwah'] = 'mwˁah',
	['muaw'] = 'mˁuaw',
	['porn'] = 'poˁrn',
	['porn?'] = 'poˁrn?',
	['hate'] = 'haˁte',
	['black'] = 'blˁack',
	['niga'] = 'niˁga',
	['nigablac'] = 'niˁgablac',
	['kkk'] = 'kˁkˁk',
	['pansexual'] = 'panˁseˁxual',
	['pan'] = 'pˁan',
	['date'] = 'daˁte',
	['dating'] = 'daˁting',
	['nudes'] = 'nuˁdes',
	['nude'] = 'nuˁde',
	['pics'] = 'piˁcs',
	['pictures'] = 'picˁtures',
	['me'] = 'mˁe',
	['wife'] = 'wiˁfe',
	['waifu'] = 'waˁifu',
	['hard'] = 'haˁrd',
	['dildo'] = 'diˁlˁdo',
	['dicks'] = 'diˁckˁs',
	['smash'] = 'smˁash',
	['thick'] = 'thˁiˁck',
	['thicc'] = 'thˁiˁcc',
	['naked'] = 'naˁkˁed',
	['wtf'] = 'wˁtˁf',
	['shave'] = 'shˁaˁve',
	['bitches'] = 'biˁtˁchˁes',
	['period'] = 'peˁriˁod',
	['blood'] = 'blˁoˁod',
	['jack'] = 'jaˁck',
	['jerk'] = 'jeˁrk',
	['cock'] = 'coˁck',
	['booty'] = 'boˁootˁy',
	['spread'] = 'sprˁeaˁd',
	['tease'] = 'teˁaˁse',
	['pp'] = 'pˁp',
	['girl'] = 'giˁrl',
	['fucker'] = 'fˁucˁkˁer',
	['pedo'] = 'peˁdo',
	['hub'] = 'hˁub',
	['hub'] = 'hˁub',
	['what'] = 'wˁhat',
	['smd'] = 'sˁmd',
	['kill'] = 'kˁiˁll',
	['yourself'] = 'yˁourself',
	['the'] = 'tˁhˁe'
}
return Bypasses
-- not my bypasses!
