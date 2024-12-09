Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8D59E8C6B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2024 08:42:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1739F210;
	Mon,  9 Dec 2024 08:41:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1739F210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1733730123;
	bh=l28EoavNEEln90CpJ8B58Sv3MxbmTPJAoQKfzCHAt4A=;
	h=To:From:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Q/YVgky4dzNhTczL8Z81bqVNAA7Zm24aHUQcTzi/KdblqVbBzNCTykFstVnEN3H8M
	 nSvl6oBIgdxOBAAK3gXCYRHDdOnq7LkxDxIplNA9bk+kLGUgWZO3LGQunnIcacMn17
	 8VQXp+7pG6dYU37enF36JS9JmtV/6OODfRaBokZI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 23021F805F9; Mon,  9 Dec 2024 08:40:44 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AE087F80087;
	Mon,  9 Dec 2024 08:40:43 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3062DF805E1; Mon,  9 Dec 2024 08:40:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010065.outbound.protection.outlook.com [52.101.229.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 226B8F805E1
	for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2024 08:40:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 226B8F805E1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Ya0FbA2Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qpxMsWE6MVubXcngc6xvLgRqx/SwELKF4Re4w9yKeqZ1jLV9JnAjpI8kwbnF4TIP7A7X0EAOW4+DbL8cUltihfN+2xyqoalj8JGyW5x3TvDQ/aIxRM7TFEL6wMor9WvJkodoR+zYSWOJUAURl7OgpGNO01+Ql3mecO1OMuC8OfT4leWqCiOX30LuZIl0lUHICXNkXcz+wmw6Kv1qoGnDCDfXvfx5QQ3VGpy6lRStP7Tme7U/ccwSCuT1bTr9/IsoVJwDg81j1bE7cWpiD+9lCDGTKaHjeM5lri/F5HbGdst1YEMfsFCpRuRJ8GkHblmhslsUZSfFQs4KHXd0MCr7sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kUZisYMxL1epoB7wZ5Il8HPMuc0v9OoPBD5Qu9lJFw=;
 b=bWHzJFkc2WAM3bwcE11z892nV5E4BgZYispXmTuf1yjJQ3Pl8nEylYcyy2RlcOVmCx5qR893GP+7UbzdwQeitxD/oWGnF+7P+p4qaFYeqywNScllfSSRx7Wdq7qvsKTX2CUhWD53sKvzIaTz9O9u1qvY9VPuefNGpbJGPF/F7PWC6KbLXSbY0B/bPkehJ6ZPwqsqB6VJg1BcFguZhZsSCnnon1llOUsUjkCwBhPDFI2cZuVZ5PvyqdwWo/GVP9zqEZUMLMHUbQQz6GyU3ueznubE8exKfVmKw+YXhA38dwY0JGG7ofbzaiAZCikKR50zgQEAvKhBtDwDcZtTWtbWYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kUZisYMxL1epoB7wZ5Il8HPMuc0v9OoPBD5Qu9lJFw=;
 b=Ya0FbA2ZpADoeJRY8urgdFLYuF2oA1bCGt/GxmhIZK39x4IWwFeJ3u3rDDTfnR24QG5ht5vvAmreys/N9ZS5NHj8buvaG2goSxi/36D7FJpOE6dmyVrxXCpeocDyc2OI6F1IOxrxbiusBX+Kkof/+NZactcoX41WRpKLTd2rfME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSCPR01MB12968.jpnprd01.prod.outlook.com
 (2603:1096:604:32e::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 07:40:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8230.010; Mon, 9 Dec 2024
 07:40:02 +0000
Message-ID: <87o71lmhim.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Nuno_S=E1=22?= <nuno.sa@analog.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig=22?= <u.kleine-koenig@baylibre.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Daniel Mack
 <daniel@zonque.org>, David Rhodes <david.rhodes@cirrus.com>, Haojian Zhuang
 <haojian.zhuang@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Lars-Peter
 Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Richard Fitzgerald
 <rf@opensource.cirrus.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-rpi-kernel@lists.infradead.org, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmg9mhkk.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/17] ASoC: codecs: cs53l30: remove
 snd_soc_dai_set_tristate()
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 9 Dec 2024 07:40:01 +0000
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSCPR01MB12968:EE_
X-MS-Office365-Filtering-Correlation-Id: d404d66a-902c-4299-8ed2-08dd1824b0be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?un01rY6QiCvIy3mrUhy5RXY/WU0+qwxEH8gjEtzaJ4EME7dLJWab1yBu6ghp?=
 =?us-ascii?Q?xpRf/U4Sipi1W25HfjTZCKU8rSWTfkrS8imEBwLqMqwbHSH2P8MpRzHIP/fh?=
 =?us-ascii?Q?OrePxlRYm5niuDWrioVk/hjGJupb1OAGnFRuysyxIMuP9sFnZx28FLSHL/qr?=
 =?us-ascii?Q?KjEOh0B3h5cWasSGp8RKLBsJzxCHEoL3Nf3f677WrohAfqW3Id0ngQnTbX16?=
 =?us-ascii?Q?Do+/qhW9hQi7zvmQjCAJZkEm1bLKbVt44pAtJHiwIcdjeRz+XYdc2gfC/OO6?=
 =?us-ascii?Q?5yVcDCAZHEX40PMBgqRBFS4lbz+DXRMcmSoe+KPL3taqw05Pt76glEtVuLuN?=
 =?us-ascii?Q?dyGUv96P9pShu4N6X6koPjpeyPJluJOlwgexbrK9/POzw0pIKn4ZQKdqQUPN?=
 =?us-ascii?Q?aL1dk4FRW5CdEnRD0oO19TfDwV+FWaaiKMBHsz6nt5/YrBCHjEXIk7Xxs3EN?=
 =?us-ascii?Q?HlsCG6PjnZ197cbi4272Wt18I87AZyfidXBo/0S9dPhu0G4JYU2vl0trj2R/?=
 =?us-ascii?Q?HFNIWYpfDJPKg27tietgDKP7ync1FkRwbLHz2MeEuRxvRSacboOi9Nq7YvM/?=
 =?us-ascii?Q?eWvoR/lMvsnCJoGbtEHxD4gjV3pocwshXN0M0WWzDxxQxRasln2X2hCdRqzJ?=
 =?us-ascii?Q?UU1Cczo6ojgloT77lH5x8FJyYE9iRDTMb/8ZW2SsrLt3rSGSXQa+3WfuAtuE?=
 =?us-ascii?Q?QdAh+sED2XPut1JlB4fxE3hePYFaCT2y0tLG/irrSIGQAvNcQEoAACAIrS0i?=
 =?us-ascii?Q?DbbE3GeNFV8RMX113rqeXRoKRtyeFHDCcD1w9OVVRiSK3pqbDshoHUcQ1CuE?=
 =?us-ascii?Q?nkdV7iMSjwWYtbZ1jARdhHTm7dLFo28a3FldtuHohEt3BhSL5KY6dDTNCAsL?=
 =?us-ascii?Q?m6ryeqckMLZjxKCDYdmlx94o5z0W1Xy+d4k6jZUhiXsAE9o97tJx3UIe2djr?=
 =?us-ascii?Q?8JJ9YpztmhSZETOVIHfHYRu9dRcVpnuijWdtIcCWq8xUssJ7PzhInUn+ayqC?=
 =?us-ascii?Q?WkQtyv/J640U9Px9a7+SR6aC14Aoz7QGIHXHELl3Tq79HBHN1v13mrv8kImv?=
 =?us-ascii?Q?SVDsqhPeEjkfpFlTT9hFduMOKz7B4rrZlvOm0WLYBrZVlmZK5ouaucd4YmVd?=
 =?us-ascii?Q?Mx3F90PnpqYr16Nk0mCT8DGuP0ZM6ZG3grM+c1xy/5JfZMwV7KQViZhrF1xF?=
 =?us-ascii?Q?cXtP4b9LhY+ml0qUUHgYNFDy0YcbdJ7b58gRffJdz83CE8EEVX61Bhbcf4WV?=
 =?us-ascii?Q?uMJ1defGk41VqjXvJkKygIVNmKh0uZu41rPNE1A11FZtTnCrvKv8NkXrjsye?=
 =?us-ascii?Q?nykjlrilSO5i/9V2u3VrY6XQ6HpeRtg9tL1DxqvqdbkQ5PlIO4C6BE9FAR4/?=
 =?us-ascii?Q?JCcc9XEf56OLqYeSmkkAz5EZgai4TPwh628A3Rl8xpMd1sYpXgy3h5ybKtiS?=
 =?us-ascii?Q?/OejO0j3zMbaMBCYlzZF+eE3jmBVHvwH?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rx6gDmxsI5y05sbjjSS0HgYuRS6EM03b8v6cbhoAnDeCUO+l+VESS3FH5p5V?=
 =?us-ascii?Q?chBizlYUjtHHIkS0POAG/mujFCSqNc7n9Ggg8vh94T0UpoDkODByrZOksAny?=
 =?us-ascii?Q?EckaYY/3e1tMY+ZrdDoHm08/83hYnq5ZJEesthQfMa/3eJNEf7Kb8cEVNOs5?=
 =?us-ascii?Q?ik/uw0vV5+rs9tZTjUqI5PwF0d4xoG8XsSFRDwxefQUfDGEMmzlwn6byFFvz?=
 =?us-ascii?Q?yx1/SQA4SuvuWq5x5VW5gIDR6LNSluZXYdMKTBMXNeEw73wWCnYVkEqR9Lha?=
 =?us-ascii?Q?2ee1M/mNrT+p3aa7D8YMWVRaiQZZ/scFNk077m6+C3rhT+Me+vm0LXQFYSUf?=
 =?us-ascii?Q?r7kb0P1ahYaVTKiP13RxAMixBvaAGyn2SDgSPwuXoXAqO+uOWXTc7YvkN+jH?=
 =?us-ascii?Q?kyOrdVBrQ0UmE9byYi6IiuhgorqaXsPD5nf9RyPvqLb+h0ouE/uM+LryCLD2?=
 =?us-ascii?Q?6aCr+BDubSKpNBdYAdSHAHbpCne8NF5UsA1G1/bkx+59sxuZALAjm1jQUbHF?=
 =?us-ascii?Q?plv4vEuugT5IRLvUvT25wrEOmr7r1UxtH8bP3/GAiY7Hq+G0qnLvV4x/D4HR?=
 =?us-ascii?Q?pa+eOlS/kAzUtsnJH5SmKA2DpgEyf5ZVt13DikiprRHw5yoDtNot//0rrhnP?=
 =?us-ascii?Q?TFGvBrqLTF8CNbaUpg79IHzca7QWzph9ph26V5PX6zpzsLBOaFa9GGYxqYZA?=
 =?us-ascii?Q?/sWV/tOL1VM0Y/F2ERJV324c3j/nrM59YlsP6mZ6LFvg/mHgNSrw4vNZw8zU?=
 =?us-ascii?Q?wrimWVXifyoF2oz9OKDqpMkLQXlEXIv/uqLWRcieUegUNJ7IET8Nn6r8mJcM?=
 =?us-ascii?Q?UZr2/OPO+fmbFoAGKJRzA7gN3fGf0ZOgFC8XRsGbug73fblMNKcCDYZOVwpy?=
 =?us-ascii?Q?RAckgLD2Xcv2JGErKSnPD8J4KsyU3jOoHwPe2E+3jCsaHM983Ernfa5E+Pke?=
 =?us-ascii?Q?/FAQsD8N3tokoCSYOsV+u6jw/x8KrcuyrUffw/B1xq67MZLd6fI0DDaoxEFL?=
 =?us-ascii?Q?0SvdCQdydvu1oqs+wySqkWK8yaZISahaXR8QZpRB68T4/TMtQyGl0MJ0EjLC?=
 =?us-ascii?Q?SQhyH9Us3XTndlsqJN4KjRngxIpApXjVEvgftERGWOFtatreNz/l80y4oaLy?=
 =?us-ascii?Q?d7UuaItI5iB7k7zmsRN6243oFbS+j1vYb6NuKSok85OSCNFlf7zOSaHxm5KS?=
 =?us-ascii?Q?vK0WDBcj00KKVv/Uo5H29J220J8gSnuc3rAqW1llb7FTaODZRalIEIZgzEVC?=
 =?us-ascii?Q?w5QYHhM2sxIgltFBIRRXVZzABJ33kj2SGtyP1nejR+VY6gz8MXXybs7W204V?=
 =?us-ascii?Q?JWOm70IhV2+ixveCmocyBhPYzeCw4BG6ORdIfwa1eGZSn8Eez6/6T8o34eQp?=
 =?us-ascii?Q?gJZXlDoKaAEFSBbC5a2BgL6SGlQDTNfT9wC2Q31XjUSNA3n+pTKLkSp34ZYB?=
 =?us-ascii?Q?1Dweq4unyEZz3pp9278ikKlA2scOzE+fYy+NFsCJq8EzuK2ZzjdUqzgFgzSF?=
 =?us-ascii?Q?ir0umbeR6WQa8eWuRF+DNw/5L94jdBASomc6PdC/R1iJgdE1br3ULPQlXiky?=
 =?us-ascii?Q?NTsNiPAJQixgoaDvazlrGEMG4snSGWBIN+wjYMNp5+qyISZ299oXWSZJ4bX3?=
 =?us-ascii?Q?QI8d3IZaBzyiDnnQJEJ7nNg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d404d66a-902c-4299-8ed2-08dd1824b0be
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 07:40:02.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sxo3bg4ipDndFzU/IKAxDiMsqB1ZpBh0/P0JId+Gnwk/c+865woKNEfp1xjIv7tuav1DJR/g+n3FAjgShsyOeSGFgXyg4C1MWeOqEwWQn2tET4p4vQJFn/KlLplz+r1Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12968
Message-ID-Hash: R3OYNRDXE7N6EU62YGMKKUCHPFMCE3TP
X-Message-ID-Hash: R3OYNRDXE7N6EU62YGMKKUCHPFMCE3TP
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3OYNRDXE7N6EU62YGMKKUCHPFMCE3TP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_set_tristate() has never been used before.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs53l30.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index 28f4be37dec19..f436862dc5c60 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -730,15 +730,6 @@ static int cs53l30_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
-static int cs53l30_set_tristate(struct snd_soc_dai *dai, int tristate)
-{
-	struct cs53l30_private *priv = snd_soc_component_get_drvdata(dai->component);
-	u8 val = tristate ? CS53L30_ASP_3ST : 0;
-
-	return regmap_update_bits(priv->regmap, CS53L30_ASP_CTL1,
-				  CS53L30_ASP_3ST_MASK, val);
-}
-
 /*
  * Note: CS53L30 counts the slot number per byte while ASoC counts the slot
  * number per slot_width. So there is a difference between the slots of ASoC
@@ -836,7 +827,6 @@ static const struct snd_soc_dai_ops cs53l30_ops = {
 	.hw_params = cs53l30_pcm_hw_params,
 	.set_fmt = cs53l30_set_dai_fmt,
 	.set_sysclk = cs53l30_set_sysclk,
-	.set_tristate = cs53l30_set_tristate,
 	.set_tdm_slot = cs53l30_set_dai_tdm_slot,
 	.mute_stream = cs53l30_mute_stream,
 };
-- 
2.43.0

