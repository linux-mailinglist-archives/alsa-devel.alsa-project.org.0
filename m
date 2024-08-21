Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B5D9592A5
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2C35823;
	Wed, 21 Aug 2024 04:14:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2C35823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724206506;
	bh=R5m/4n1JoYnPi16p3LCIa2mEuJhAVRlRCjFtk+jPqoc=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n396msNsAq7P+cSh0SMCaIhDwx9ZrqxGUrRRpgKsp4UhuAH6iUBWi4enkJmgfu4xS
	 PP9FAO7g89+rMB3mpGEhhGKOTrm7bRQMWuvFD2dd6gKTGMAp3W+mEMNqf+cUujXinl
	 Og+N1weXRrJGeManebAji0VW6EpQsynchnqOlZWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2801F805F9; Wed, 21 Aug 2024 04:14:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A02CAF805EC;
	Wed, 21 Aug 2024 04:14:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B4E9F8057A; Wed, 21 Aug 2024 04:14:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B65CF8049C
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:14:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B65CF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mhP97ZUb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wb0UKTURAdHCMWBF7DjJ8bUsMWEGfeN/gY4WrQdWKb7XWPlftFHZmNZF6YegvHnKeQ5wHFPbcMBLEEr62V6G1RZ9vt9NW6iR8ZTFxQTAqAzKk9LbuGUYUm28fG9mL9XSzZpwXzbsL9V2zwf1zhXreh6t3OeXArNkNtmvfCFo0SY2TwIVkAFy/z8qu+OMX1rK9HRf/6ZpdD8UBXa/r9YMx2/PGQGCr8LMwYBdVQajdpKOD5/0TMQfOAeivpcGUrz4wCOoS5fvMEaePFIdFNd6gY24VaXi7FbhmnSnuOtXpxDqHJSkeFShHOzRBa758UQs3WmCYFFHYDI5ZSvH1VTqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w61PALYSiWkhH9o42uXVCAd/pnpT87hto831DJrTNiE=;
 b=G1k/o0RM/thxOobB9upiWqQ814PoNp2bJaJZOzaUrcG4XkIZUApdqiNVH/TPvvNSirq41c22K1FYPvZNxe44nug4z0I3eUzcJn7uDKJDvDFhWcsAsTGsTztl+jZSciBA3zqHQlcKq7IvOfsbWTMoqyvqEInOJPtMIKy4ryKnjRyMgtzhKMC2+kei/2knoClg2dhJyUZ/rQqPfLi4/7fXMGZzFB3gXjhHOHTgzVLAloHe4/FRzdEcFgD5h2n6Ar8Zh7Cqqw9eOH6v4QdpmmYy3pHE52yZqgFQFHYN9EetqD0iEuyFyfFxBDQrJ46c+BQ6UPUx57O426byNlkPxMixxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w61PALYSiWkhH9o42uXVCAd/pnpT87hto831DJrTNiE=;
 b=mhP97ZUbDPKZDb9xvE5N+L6zvR8f/Jq5lk9UTYvZfnyPBdbSkCUBP6rOOhr6H+TZBdgKCHIDmvYAz4WTj8PJN9TTdrSugUpUz2dBi2dHDDc4crbZ2zLiL/IgRW2QGS0eOGg47RDfGEu/lT94u5im7hZhWCtFceodmERG8kGmXlk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12133.jpnprd01.prod.outlook.com
 (2603:1096:604:2e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 02:14:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:14:09 +0000
Message-ID: <87plq2aahb.wl-kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Alexandre Belloni
 <alexandre.belloni@bootlin.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,	Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,	Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>,	Daniel Baluta <daniel.baluta@nxp.com>,
	Hans de Goede <hdegoede@redhat.com>,	Jaroslav Kysela <perex@perex.cz>,
	Jerome Brunet <jbrunet@baylibre.com>,	Jiawei Wang <me@jwang.link>,	Jonathan
 Corbet <corbet@lwn.net>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kevin Hilman <khilman@baylibre.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttfeaaif.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v8 3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:14:09 +0000
X-ClientProxiedBy: TYBP286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: 6013f656-dc19-46dd-16fe-08dcc186f124
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?c7fk3hVyqhq+MLRZGgdjKlEtHF49AXJpkCxLvCouzrj0H0fREj50tKlBFxh6?=
 =?us-ascii?Q?D66oYv60WL9EZ3jBgQkRWWF61DoiPGFkmclf7Kuj/TKbwTt8Of2FtI+4j+s4?=
 =?us-ascii?Q?WbBJpigm9pxZoSDgSvy7WBl5Hp1kz9nmrgM1Rik15OQbm8+ZnVzDshyOZtcS?=
 =?us-ascii?Q?kNVvPpDhUzSMJHrTHAlj0hhg+O64ELXVq67CaHAGRKJNVua/cvPrq8Vjh124?=
 =?us-ascii?Q?HIuhkQpaqwSk1mc2twIfr8litaZfasUIIDaTn0EyhU3ON0qr7V1EDjTYvf98?=
 =?us-ascii?Q?yxn2BtGcpBQ2WvMiSwarlPyPRJpnXHCzu4drEiiDJGcYlSqObcHdYnTXIYsM?=
 =?us-ascii?Q?FPwh9Qd2ETGrAfB6Aocozi5vQWUFrN5+y7yR2STDXCEk9ugGIaNhVQ0IL0fE?=
 =?us-ascii?Q?ZnbvPjeUZjO5cthyx5R3SalhX+kNp91A+uvVGmstIx1V7mLhXvccYRTN7KK6?=
 =?us-ascii?Q?3oXtZqnNkC1PJwZ/1iGuq9lE9iAUt+EZoto6LMGl2gO6FV7l1mPxnnWli4l+?=
 =?us-ascii?Q?jbBLNdoehTVz5mhN9nLqSIADkHhbSd/j8fEdx41X4Mn+7epawR4+iKtW7+N/?=
 =?us-ascii?Q?R7n5RJZWeeQySEXc6DQOmd1Pi3GD4ZrtAfbPAs5fkVTe0yQ8V5NJnpYV9Wj6?=
 =?us-ascii?Q?cw7ZeXKS/hPq1qJchdBjUhXc5joBO/GloQDfIGvzdati9GmI2mHVEeftUMXc?=
 =?us-ascii?Q?2oBoXDg3DSgLPLUpLuhvKLT4owPkkTtpUUL/pqa9OCmmqWZ1uH+QIFdmEcIQ?=
 =?us-ascii?Q?yMu34bHYU5sjegaPXJxZxbuUdum6aQqP9VfKSL54y2tB3jCuSYf59O8G0BNl?=
 =?us-ascii?Q?zqXPxxax0pgiX+Mvj9CVc+tBQkTw7low/gcIV/jPMMnSyeKLLo3qaEW2EU7j?=
 =?us-ascii?Q?ZWVVvXUEk9IV0xcpFSOAhb/0VGT63WfIqLosEYewdPg3/GUqw713tEr6AJzP?=
 =?us-ascii?Q?bFw1PU8YnDnQ4ULBxwYcGG92SKHmQ94oRDovtmDRa+KQWfk+zg5zFegp7nwe?=
 =?us-ascii?Q?LTGwEhmjXD0OQd1XzWaS9qj2ZCVLf+vzvPZ1USLCGB576P9mz+S4Fz6ecvqA?=
 =?us-ascii?Q?sCYMfaMXb0CWN4ZWg3WQloXGivCrT6trFU+deNkvo4vuWvJHxi5nhGBxFfff?=
 =?us-ascii?Q?8oYQf8LIh/tyjPT9+N3mtAKCl8oRrYgaZbmnCsgYiP4G7mWooKWaHqyuIyr7?=
 =?us-ascii?Q?EfbVudyXV2XgcH/eRfx9EHluBeGHRAd/NRcMxF6yMktyO51QdAQBgDzPArxz?=
 =?us-ascii?Q?0/mlQqnZARkf6Ub5gJ/oSP5CagALRwQs2TWz8i+y8HSfO30xNjwTSBVVlW2V?=
 =?us-ascii?Q?8bCWiUaw+c4iniBh3bfpQZqXGHqi0juMVf4LT/IZldrd2gBMvm4mGMV/pmZB?=
 =?us-ascii?Q?c05Xvlg45aULbm9vcsuqUb7HGh1jVul5RKRfIgzecFyEutUgx/ixRctE+Khm?=
 =?us-ascii?Q?PuOjWnWVse0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Qm3WfzReRAYBOZvUCQw7WKaTagvhF9sI8xUe9R3cswbnFMN+IZi6UqkAiG71?=
 =?us-ascii?Q?zEomUFJpv2fbqRyOtN0nh+yzbJe2bVW8336cDDzW3lCptGl+XFGG5t8iLA7s?=
 =?us-ascii?Q?vRA9GJmXr+jEVo8qR+Qs3nxVopp4CHt6kvxT6s+s5/R6e1fM58jL/lT1zMG/?=
 =?us-ascii?Q?3OpNiU/rNPM7lHbiPenNkMFe6YoyTSgYHaMvlutgSoUa15pig4Gh4HPFOnK8?=
 =?us-ascii?Q?fnqXJzX4hbw2pSdLKtDgbzGsY+MHoKGA6GVFjUHXWzYW3oqOO/5HFO3/WHxF?=
 =?us-ascii?Q?JTDUtyNt5M/Z60upxCiuT+LAPztO/rsoigoZ1PdRwgdRR/DGg/bQ8xiCkJX2?=
 =?us-ascii?Q?1ZXtuidhX3R2T/qJxuEJ7kJCNxCh+pmWl7xPK46cRSM9AWYy+jH37qL9ed3A?=
 =?us-ascii?Q?Sk9FQkHoFpWK/Jj5Z/Vgy08L8Cd+mRANUs8SKZPUdiRD9d3SR9Hz6je9HuY2?=
 =?us-ascii?Q?jcAfSbWcx4fJLjPmZk7djpLyVmC9vY/B9UIsH18Zv4DrcNiZmn71/pj/YCiR?=
 =?us-ascii?Q?S7jP/SU6zBWuZ0qI/5iVGLEsm2MxguSp5IvS88mh33DuGSAc7T7yM7AEC7UK?=
 =?us-ascii?Q?5k7zY9mBCkkkh/3W0rH+QwCQ9kR389e7guBC2jxns81fVSiMRtbwhZrpTWmA?=
 =?us-ascii?Q?T0vV8kU6HPX8AQPZLbICP49s7cwwN5YTLYfkVhrzjGb9Ue8A9NRXppHhtsAs?=
 =?us-ascii?Q?XGdV9O1RAa7TvYaawBeVFX3JL3vtnOkuKSnF1HwWrJjnVKAkxAZ7ZWU29Mql?=
 =?us-ascii?Q?1hWz2LeFazDKaAOhNynlwXhuaBmuTebN0hk0y0tCTjPAQ3UAvlsJMEQYjeM1?=
 =?us-ascii?Q?d/Foq3SLXqLTDTzLg+Ilfr0StfLDizm2Ldn5V4F9iR9x8pEK3DhyWwzZm0eR?=
 =?us-ascii?Q?9NwEiw7GLm8GUbI33x+NK24yUFNDxFZxWM1pGWHvStY20PI7bmNdsw0pMOl4?=
 =?us-ascii?Q?QZo10PuNez8xjn2vD7JVrnBSHFo+o6CpQunEDYR/e8YhJfvQGbb64sC0s64l?=
 =?us-ascii?Q?HZGJVT6KacngUp6paJftJewjcAkdUtJzb4oWU9GWMzGSOYleJpBtDdG/hYfU?=
 =?us-ascii?Q?Z8stI+7+Emn/StMH2shIOB7qoxu6yD4aMekUgH6VmkdN58VDToJmh7JZjquX?=
 =?us-ascii?Q?fnoTbUaBP/GVtz3c89ZukXRX0ILqiGSDiBIOy9V0DN/rRRLaT1HpQ9p0xEXT?=
 =?us-ascii?Q?nWQ2vxUlW/pyIt7p8e1DBaWX62/4TpozEs042vNf5dSnQKVSR06LoTcCizIy?=
 =?us-ascii?Q?ZJN+wN1dpLHbdLTRMd/YUmfsmsxvA7AM2JKAvd2hweNJXniJq3Ur+G+jRtSl?=
 =?us-ascii?Q?jBNVUk3z2Wr7eWqih0O31zuHWzWhI+GfKt9z2ntMiJaK87R/kW8hmp4GlUri?=
 =?us-ascii?Q?++H375AymvAm1RNH/frcExBYXHVP0puYopN0eDP3tkvhcY6kMpMVjzyCANmG?=
 =?us-ascii?Q?mUX/XMyzz+n8fO/ODiVaCuBueHuD50z+FGF+iJ2iA1fazREE+oi4oVig3djF?=
 =?us-ascii?Q?sYvU5sZiCZUqbDbS/QMkxtZ6LsvrCwE9nwsfnDHB+72M77MLSMoOKKU+ninK?=
 =?us-ascii?Q?POYfTTIEsyo62FBSmF2GAyx6O/vk5wvlq6EIxbcXQMz9gywWWhKXQqG6jXAo?=
 =?us-ascii?Q?Pfd+zANST5W/x6er2+vQHFE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6013f656-dc19-46dd-16fe-08dcc186f124
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:14:09.6269
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8CHEvACK72LtMkZeziK0rNN53FCZEiXLfvcyILAMgW0ofE8XEFyzXL0dI0U1K52YkEx/YamOf9VodlvPMOu7pZpbOtCoYUHPSLInbxviGUU846vKrKfOMLihh9hYHaUx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12133
Message-ID-Hash: OFKCLJEXRFZELQUUHSGHHIUUNRCXNKXZ
X-Message-ID-Hash: OFKCLJEXRFZELQUUHSGHHIUUNRCXNKXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OFKCLJEXRFZELQUUHSGHHIUUNRCXNKXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Jerome Brunet <jbrunet@baylibre.com>

dpcm_playback/capture flags are being deprecated in ASoC.
Use playback/capture_only flags instead

Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 10 +++++-----
 sound/soc/meson/meson-card-utils.c |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 09aa36e94c85..646ab87afac2 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,9 +186,9 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
-	/* ... but the interface should at least have one of them */
+	/* ... but the interface should at least have one direction */
 	if (!tx && !rx) {
 		dev_err(card->dev, "tdm link has no cpu slots\n");
 		return -EINVAL;
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ed6c7e2f609c..1a4ef124e4e2 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -186,9 +186,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.43.0

