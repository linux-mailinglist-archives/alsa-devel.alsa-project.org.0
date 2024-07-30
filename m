Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 54090940319
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:07:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0E23E72;
	Tue, 30 Jul 2024 03:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0E23E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722301651;
	bh=iSU3JJsNU5z33Am48uwyctCzLsp+FdUOPoHqbrUbFKY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QSShp39SeNX48kPkHAYDM1pNT2F1CcM1d8yXFyi+dddHmEr6uS8eXXYs3pF0aLuDp
	 Th89+LRnpu3rKYUymqg87ouyjet1bmdckuzfQMhJcmJ+1u+v8aZWDR9xq4+iyx8QGT
	 yQ67Lg8Dyd4v0tm6RIVerDFkTyhlGCdQDx7L4zzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8072F805F0; Tue, 30 Jul 2024 03:06:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9ABFAF805F7;
	Tue, 30 Jul 2024 03:06:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 000B9F802DB; Tue, 30 Jul 2024 03:03:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CBA8F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:03:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBA8F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=n6NfTsmU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAObGC0lyyp99tskYkm7wjXBqpKAm1E2ct/cgKFbEIs6de5mFq4p5+cxN8BFkO7mUhvgGqZDQNEq68iv2ldbTYdGLEVUjDp5g2li0o+aC//k20c0r3C/wYxeHbUg+TkorKj8IM5jcdpu+3O9rkqSOrYdpmUTS9Imurqf+sHJgXYEq6Pr+1UgChXoF0jO3YYa/bbD+ELsYJYexdYGBGIfBk4EogMPNG1vU6b/XKmadjOhEFm/kW4lxRg1FVMDmH5g3MjMVg5FCez2UV07ajhB8GD4mmZRAqeD34g/fSQIowyy2IwA3HpLJL84/Zn7Avg/tNMd+4bgK07dM2DnODeERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=T00rdNGN7aHwxo6wONhZB3tPCp1nRitE2lFt7abgOoe261ZlDN3wYf0l9OvjN6ZMwQmam2JWE4ZlyegB4cl3vmpyDX7N08BoHH+Fvyvo8rNaLmVWAZPh4ZWjwVPzYHuk3BI0h9ysGudhsOfhQXBmGYGcPp1veLEpQKBJ+skdZMaX6wSWeToDcKhQiihb5MaOjo5rB/7te0CyUm0okjy3WVAXTy3bFUfpV/8D/J0nnVvwQCY6Sh9PCk8a881ziM7+F5T6wq0urW5SFW/3Bjs5CBFCow+e6HEP3dmnBNukLJGhjfGACemo2DLLFz8hD02VoVPYHxZg1GElf1OHaKsA1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W38nidIvKGQqFNX3kjmn0/hAzSh3plyKNuEVs3DX0iE=;
 b=n6NfTsmUPMkdCoYyhxmBnZrMFZ/swJhQtiSnre0hbyiNFJgwzT4mhVjuEfVOAXHZhX6rR4jN+aFIZ8ir2o1WLAGAgqetinv3boDkiNOfIAXX6U17j3W8azMxuh1CThhfFKczNWVOhnULqbV8EPabdFZFfbmd+r1PSdFSuDUc/t8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12484.jpnprd01.prod.outlook.com
 (2603:1096:604:2f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 01:03:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:03:03 +0000
Message-ID: <878qxjlmit.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 3/4] ASoC: amlogic: do not use dpcm_playback/capture flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
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
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:02:52 +0000
X-ClientProxiedBy: TYCP286CA0269.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12484:EE_
X-MS-Office365-Filtering-Correlation-Id: 54a84d65-e606-4c51-22db-08dcb0335779
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5Lj1kPR3aEwTBWJOmaS5i+yFlrNCU6FBuQSJRPTp5J7NprFAxTIr5k/vDY2g?=
 =?us-ascii?Q?CkgfWBkjBnc3UytqYY+YPzHVUNUD0lcFmnW11M83KHQvxpUlm7PfGZD5MD9a?=
 =?us-ascii?Q?a+C/Wvv4u4KtWiBMJwNTFmVv2RHyhpse7iXxMdzBBckh/Lu4yxzRwd/U8GtW?=
 =?us-ascii?Q?2aagI9H55Os8XNxA1pF0mFh0FYoLSb+1kik/VNvz9YCIXVJDpFfM2iOua0sD?=
 =?us-ascii?Q?rGXYS4awLhIjZnmG9Q6Rv+5NVLVl2uAT6vCERzjWvnQsUEEGzlvH3XnVafNL?=
 =?us-ascii?Q?FN52NB8PQgqKB3NNDzTX2iKUj28DpGKuu1rG1oE661SSrFcZRIAfs1euOXv6?=
 =?us-ascii?Q?anGPpcTcihvjRGQgWbVmbPpzboDtp44ODRKlnygmMCHRggwHCsTQZy0d+4+D?=
 =?us-ascii?Q?qo0lS2N4jrCR5ElwnPYsp1+Xr2k7sA7b6C0s4S5t+vsp2R/oGzURgXYILDa7?=
 =?us-ascii?Q?rCnc2KN4G3XMoWCU4M8TcEhGLJkijB6RAiVXDHMuuJG6/yaSSLmGumBbCMgE?=
 =?us-ascii?Q?yklc0NG8biOl/nCnDuXVp4ZA1sZmLIokdvbAS9fLJovUXJlIOb20mFCo547c?=
 =?us-ascii?Q?06Q6ubY9MmOZnR7pCSHALl2X/kLKN98SSYNfS1C/nFkfMc/0D1JWbkUEg5KZ?=
 =?us-ascii?Q?4oHNY1BSqtaRFw/IEajI9Hf6PhEe9MAzzcKDk+sARQxIY2R+EoHShWtwaL4V?=
 =?us-ascii?Q?pb2Kh3sDWDs6fyjVvO2a/dzg5CjaVv7lKwaib7dQHy7actRG6KfcrM618KX8?=
 =?us-ascii?Q?pJt4C7h1mux+C+H67fAW29/OqrMEu2BzbsXhfCnXcTDUu2RaPeUJr0m7BBnn?=
 =?us-ascii?Q?woiELRUvVciBbLL9xBFmznRPQcPINaSlB1kWT+gkWkV34oQ10CAkueJScvN4?=
 =?us-ascii?Q?UXwaBIhmG7Nx6geIiozeLe2WBZzW7sYoDTbfT+oGlHqSnNxnOFm4xZHXNdJ/?=
 =?us-ascii?Q?puB9pRtg9O3B8OkZicGByYYXQXd8yrJu81txIqk8Y2ssHDlWaPSd/M5+pOfA?=
 =?us-ascii?Q?Oc8AABPCj3RM7xNzKui6B4hRZhC5yuW91IfWGkiQG0bsXUUxi9ww5ZLNul1i?=
 =?us-ascii?Q?FDHaa3roENiigkgXt8vnxgrC4JZt+B45TaTvd6+XO/JN7ACwdk7YL2MTSEQA?=
 =?us-ascii?Q?tb2QBfrSMb4P1WvmWhNSH3oqT0N2jCYHu+1oh4GuX5md8f2bTmAiGXx1/vMI?=
 =?us-ascii?Q?Od1nR5wZrhL9QnKllHYvmOqKnCqUfnJVifm69MBAMgsXxPCrtVdLL0RCopLn?=
 =?us-ascii?Q?jro9QQq9olGt8Ui/evnDqO+OPcnomraA9OJizngftzqmQ9+PPZtrikXQzx9m?=
 =?us-ascii?Q?LM6IXq5jNatnDK4BYZ5rqjdyYrTFMwQE0emtHJiGQlNOn/FHj0lhlORRkQiA?=
 =?us-ascii?Q?TyvQww7S8esJEEa1qnCv7T0peB50rG05UVztHb/sYWomD85GQydiYIJdJDHw?=
 =?us-ascii?Q?Y9Lg0+RRs6Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fh3rKw6Km02keMW10nCWISL+i/Dth7u21YrD0Zo4opyPBIGzrQN18jknGi0C?=
 =?us-ascii?Q?EcTOOcuW2MmAU2TfqjPPwMpIYshyonvzaNhWNXZQMAZUKAclGsSDXO1B14Em?=
 =?us-ascii?Q?bKHPFsM5CRa2aeaTFv7wY2KcyK45R98K7v8Ey3EPwAoPr8lljfLrKrq2RHK7?=
 =?us-ascii?Q?tyJC6dIpa/FxXXRePl2D31ikABGNEfKhZFo9LAOC2xybkeAnJnYppkH2Z2v8?=
 =?us-ascii?Q?WSQyFPW+s8K9vVHjGfFq2uJv4TzueMWxaVqyM/vOV3/Tk4n/FkSxotyoEkco?=
 =?us-ascii?Q?jmAoqlWwq+Wphs0pcQUt7Sm8ix5UF2WRYphh0s2gGfxly2Ewu5FWWxLsilRF?=
 =?us-ascii?Q?STI0TOssMNLhpA4KHYphHoBt6h4gMg8IS/5hy1G6BQJisRwlZntM/sTDRBOB?=
 =?us-ascii?Q?vklXh78fnNPiw0SMDNnhgk7R0W/9zuF09KbAIz69Sw++dceWP2C/L0SJWitr?=
 =?us-ascii?Q?JeWN9t9Tsz9TGKnNbDBIA9EgHKnZ8flpcg47J74zrzMWtbI10oLtI9X3OqTG?=
 =?us-ascii?Q?dudNgcBaXXK0ZwlEn1Kwv4eh1HwlcqKv6S0KWJfuaPmjF9Fnp75Ylnaw5KDK?=
 =?us-ascii?Q?qxqvBO98VV5RCCllB+SZxPcuQMFkkQoMSd1RnA4xLcgpy/dY8/3lwf9kynot?=
 =?us-ascii?Q?nJvKRVLIJVpOAMEn97D85tVy9kqoVQ7brjZL/tDDpVInTV2dzuQh5YZ5Nbug?=
 =?us-ascii?Q?TTfhCljNY054NptiFnCTHScv9tQ2NI3sHJmIOzbQA3Iw/Lt5vXQl2a1yPzYv?=
 =?us-ascii?Q?cuC4XSmFAguVTTBfILWhZ/jysZxtzF6uj1zUvdubLLtbWQLTVVCGpMrrrh/k?=
 =?us-ascii?Q?k+9VUnl8Xnhx/Fxbm2kH1xSXRh5uMUQeAwchHGJlxI1k1aqi8lm/ZTiR2Kjs?=
 =?us-ascii?Q?SGzInyEHB9M4LgNK6r4azXz4zHuD5snN458rpqnoXPnAeY8ulwJKFpZap6ZT?=
 =?us-ascii?Q?65v9xdNA8IW2q+E71ZVBOv+qzBNOaWz70H0rD+QrgVYVhj+ACWEczvJ2j2QQ?=
 =?us-ascii?Q?Yaulmx75NG1s6DzeRnxR9BQFZdKjOANzjepDPx24TPmQBoJdK2MuMtu3EQXw?=
 =?us-ascii?Q?7yamGa7/Voi+j4YHTdNyGm7KHFTgc4MTvOrzFFFnOe3zGEdqKFX+WTgT+C7k?=
 =?us-ascii?Q?s2FHuXUlixOYicqPLuBrYb6uAOhhNh9mTiTtYMnyNvtIdqOoMGZpuZHC+fW1?=
 =?us-ascii?Q?+QH7ikbic0eaXivAWpoVcYTrbpWo56LUQipY+AXdPmQD6XCF4BeIl7Ca6t/V?=
 =?us-ascii?Q?PNqZBL0T43h2JeUNpbnyRGiaookjXm+71QVvaLrmeMUl5iGvhDxBJ8rgHPCj?=
 =?us-ascii?Q?yC0ZvViPujg/jL0ZOxOVTwgyeWtlJd36mBxWnjEcHSIhybBTbJgurE5DR+gQ?=
 =?us-ascii?Q?Y4s6y0cYWfQTsLxtqB9yan8RKt8xiasPhxpGm8di0qGI5jObbNzVoCY3alaZ?=
 =?us-ascii?Q?9+2amgi0eT4843PIJsE8GOaWecjB83kFldvD5Bu0CqsDlt45fhsFeXAGRaY3?=
 =?us-ascii?Q?hTvjce30zxwCKLLJ9UazK2T/oMG/jOeC2wOENsXyn+UvjYHf77E8V9qmQ7sr?=
 =?us-ascii?Q?eUy3HR/1fKEcQ50XzwI+6FIPGA+rOmqIqLRhFXrS32LjTqjcsBvbdrGtoUSs?=
 =?us-ascii?Q?SxZoKRYr/MpPE2d5S3nlzlw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 54a84d65-e606-4c51-22db-08dcb0335779
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:02:58.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 c9r3clq2gE+KqJKzUI68iA2MEq7eUFu79HOYeIe7xDrIKHsf0/qsdjcjT2n+wLaKNJsMRPqOsgjW8OoRPS32L1AdM/CQg5pACKEyQGcGmHWXFyLOmuFU5vKLPrawF7EY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12484
Message-ID-Hash: 26CZU54GPZXB53Z5MBT2HNYYHC3CCNUU
X-Message-ID-Hash: 26CZU54GPZXB53Z5MBT2HNYYHC3CCNUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/26CZU54GPZXB53Z5MBT2HNYYHC3CCNUU/>
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
index 09aa36e94c85b..646ab87afac24 100644
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
index ed6c7e2f609c9..1a4ef124e4e25 100644
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

