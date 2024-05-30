Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7C88D42EE
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:30:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65097DF9;
	Thu, 30 May 2024 03:30:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65097DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032628;
	bh=ygINalTjpl1BYKMbiAAs46lVP00GXdhXtwBf91tRmWU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=ok5AXsMGWctw5ZBRLSRhyfLAMDQom63U8mcDQxswcLid2drl/8OsrBj7fOgMCwwWi
	 E13ozLM/f8jBWu1kA+Mh5vKLb5FPR9oFTqj9S+xTDCYIvb+frYqLwGDLMQdSFPCMvq
	 zyon7DgyPpJct0P4ZTOOdnYmYfMhWN+ormTKXF7k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0FCBDF8060E; Thu, 30 May 2024 03:29:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61AABF8060C;
	Thu, 30 May 2024 03:29:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BCFEF80607; Thu, 30 May 2024 03:29:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170100000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D7A11F80608
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7A11F80608
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=O/jPNbsv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NM1DoVfNs+cigqqi3vD7YdVOLaKRwHEG/XUoJl25ELbJHrilVQJTqCvMFS6lIFTbFE8hYkyFY7pi9n5LIzfaVWsaz+TcCFaZVhKuXLzEGcohCSyvlEAV1vazfZQx/5vbWOcqWy0vyC8L3wWxQHVjcFntTZqYfwIzV72712unE7iM7ZzbqQ/gc3RfG7ER8VP3whZoJkPlyrTVyCfmhv6bAkABXx7UPN+joVI7sLF1pIti5pYCnLV1f0oDNMwIiV4ZTJyR2TZvazXUh/aPigfeuvXUahve9bvzPbKcOAaVOHGwRuVa48zjGkQJjZtIG7aUFYgw4H53FDhtoxTiH0vRqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3wbbuhCZprdaBlaB9jQFm+v5qJO9LsnVF0x7h0smzD0=;
 b=NUsTgZs7gmYuLx8sk1OJnJFeGj3XG5KPRvqcBxexFvIXFH8Pj1Y9QwZEjq/p8kwYLuVNnxfYzrRvekREdC0qEz5DeL/pSGB/EgBJGiX70bq01N1jV+3/WJSSfnajXIyQlS3++RjjYUSFEYVuMV1QjiipoW1Uk1GJEz3xUtqT4AS5XEXvCM7nBBwTPq//4nCzS60KH3mF5h2BPgJth8BByVk7oU7gJ9JuvBnJCPSvD9p5uWfQ6FoYTqAXE2PyuynsH9mzscClNjRHr+gCa9MW30v3Z/Cvqd5k5/l/Qtg9gT2Rb8p69+n9igPiApq+0Q+tvx/Do/V9s6CRba6YkOEljg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wbbuhCZprdaBlaB9jQFm+v5qJO9LsnVF0x7h0smzD0=;
 b=O/jPNbsv/yqIFiWz3DSImEqzxtr5nIITyfK4MCnSw/Jam5baRCaLnBAikt/aeXIjfO3+jLR0ngdvVtxXxQduXaNBHE5zdqtIBiOcAIuK05DBe2SN7gRC3qrxjKu7rik5zd69cQDKNylHNaVY9z90CH6ApkFFqXoKrx0y5/aty9U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:09 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:09 +0000
Message-ID: <87y17sozob.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 04/12] ASoC: intel: remove dpcm_xxx flags
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
In-Reply-To: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
References: <874jagqe9w.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:29:08 +0000
X-ClientProxiedBy: TYAPR01CA0203.jpnprd01.prod.outlook.com
 (2603:1096:404:29::23) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f5cdbf-9c56-4e46-8f2b-08dc8047e796
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uznT6i+k2+SC3eRLrf1BSEsCwU5Xfgi/4U+d3X3nFpf1mGfKLzkodJ1cJ7GP?=
 =?us-ascii?Q?j2PyiioNx76SHY34k4yPVpF5KDfZmJRrtO8TFCQRkHdB3+yZYlvdj5Jf1zgf?=
 =?us-ascii?Q?+MF15Div5xYL3FFbzWUvux6gF9Xu+C8q0jP2+Q3CK72LA4umBXJifdRMqzEB?=
 =?us-ascii?Q?yLWoPeQ/l/WnriCc26MQvtGOo0kvpmIe2rwobHkiaTbVtYJfG1RwrP6K8H0t?=
 =?us-ascii?Q?GHAEABFpXpWcxGIS4P+dJKsOubc4XEARWB4Y+99TCqXBCEqCEwBhtXZZsSpf?=
 =?us-ascii?Q?EO6kKe2dwiyABNJ9nqffI6/utW7wSxNDwxmQQkDBNv1jzz2RsdKDFrAdf6XB?=
 =?us-ascii?Q?/qkdqc0uopdknWM2LU7gSH+ckYCZbGryMfJqeSQQIsI4H3RwPo6PhyhT3gje?=
 =?us-ascii?Q?BsnNGqULGKMEzO2x+jCdRTRWTUv/2tvPmUtgirGIWCiazm/EEFTK7fD/jJdf?=
 =?us-ascii?Q?wN4AQLqENuwTodB9llIlS7YF53CTLQLpKoVLzBA93Alb2rf7/X5nerLYW7QC?=
 =?us-ascii?Q?lD6x6S7BY/S0KG5FEN5nC2i5NaN+AI8MNTfd9zH9viaRgKfJaMTZCv6GZrJ1?=
 =?us-ascii?Q?7T/jJFDlDtknuaO8u9Hme7jkl195be5ZAk9ne/sjaGHIgmNg8XH+9lEtNouA?=
 =?us-ascii?Q?5FwuquROha9grP3B16umv3AP0pHrmQ6CVBBjBoVWN+grCrZZgzud3yzLogPJ?=
 =?us-ascii?Q?h59jOgh9yV6lTCb2LwtfxREa1gdLAmOC4c+lyUzH5d7uNMn6G6Q1djgbFCjO?=
 =?us-ascii?Q?vnO+0ceybv2b9vuTEKsJ5d34bEcvBhqz3KrgevHZIlXey2PXZyu7v7InZ5u+?=
 =?us-ascii?Q?QGO7fHOkIQWtS9XyiFyPLaOy+aaW3vTzVxOdLS79o01eRnC8Hn3lNV3Dt/Uj?=
 =?us-ascii?Q?vW7oEggOTcuxd3H19Cu+kfoWnmelLTNsaU/DU1MwtHphy1jDe/Q/cWTts1XV?=
 =?us-ascii?Q?KDh2vU6lJm6phKise/NGVHzSMVHK3w2+EM7ur+dXIPldX/yr1phHx5QiO5Y8?=
 =?us-ascii?Q?YVbpEypOesUTMl3O/3/x3h4Pr9799bs6eV5rveO5qDV26Bw6ixwJRRko7WjA?=
 =?us-ascii?Q?40QWBLAonH8JEsHxBUbGYcH9E5IyalfiR/O7JvJ6Fu5h/VOzJEIMUO8/xcQ8?=
 =?us-ascii?Q?J1bBBI8UURMGaXXnidKwZyJuPOP5H6LcyjE60gP6gnFK1KF050X2Ho5syJwN?=
 =?us-ascii?Q?HArbAUTqH92amotRwGVwKdbBcAUYqZE6NNkn8CEPtAAaGKjuGm+Uu3TEgtT8?=
 =?us-ascii?Q?OOJVqUgDhU+jG18Wu/Ooc+LO4xoKogUyC1Qx4zBjM+97v3OrtznaSm+IWkck?=
 =?us-ascii?Q?Byaj0gcP/k5M/v+pXy/8bmi4cfX3QmF5wT09oaeBYB2tzgD4V7MR8VLxexPV?=
 =?us-ascii?Q?K0ey1ik=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TOV7OPuzXEdm6AvCCu+fc9dtz4GEr3bBIj6tiV3ipX5pScO0K0IJLrf5fjxf?=
 =?us-ascii?Q?IPhCDpTdixr2QDQDN3B86tnLLG8h1htTJoHKudeVsz1O0N4cJLMwRGH4UMQI?=
 =?us-ascii?Q?eB6KWeKi61imf1f1GSgbLPzUKHEy9bfp6aWECD2Lj8V1URARLUuEOX4dX6S8?=
 =?us-ascii?Q?LaJMI6KmkNL6wtMLqJIBqt3VHfLgzxkUy2x3p1cEeSUfDZ6hy+OSkYeIJLzO?=
 =?us-ascii?Q?sfEFcJFs7xB7hQCLgal3ywOdcWW7l0MYyCP3GMkoU5PCUyDxsWuYAB014su5?=
 =?us-ascii?Q?tDFS8+QJG80pCgjcTb3UDe7PI/nZlzI95HWPQ62L69puC1hwIyHAuSmzmltZ?=
 =?us-ascii?Q?bYOfsbFwEy/la7U9AYYXzTqg64FUZBg/jlAF/GLnhtPNWo2HyDGyvjS9YVkM?=
 =?us-ascii?Q?lKEB07aFAb6OZGU//BpviXtPvyWtB3t9JHR2BVts4Z0amH/s6wft52D3mJPX?=
 =?us-ascii?Q?qNcCQS6Zb/DWmllmiDjZTBZs1mrG/nnEVnvrG2IqyYpOkspGZ20Okw0Iebru?=
 =?us-ascii?Q?BqE7HFugX8RTJSwYDLfDyE223z01lifxeQzzb4vxF0AYocUFSNQ0a4+Uzsvd?=
 =?us-ascii?Q?8ID2qW4NEERxl6z/JW3DZzOO7Ak/K06RJcRIziTlzpWWtMhw7Bf//kRMTuTp?=
 =?us-ascii?Q?HwVXWNfohLK/E7wbxEVFgGmgEDTY07l5WOPp8gtWpp37mA0ZJhw6CKS3DefD?=
 =?us-ascii?Q?PQvzNi7lKSlOTbon+xO6WP58ACi5Y8tQjrRChqd32dY45djWsUD/CAj8G53i?=
 =?us-ascii?Q?rLS97X9b4BRFHiakNj0IQBvOvkXksWZjyeJlrJ/d8MTpSmDEvKV8W63KWTos?=
 =?us-ascii?Q?lF2tacnYC0TUnexIPzkpPzYG1cSolDLwa2XQ3IwPduCS3uHxhdAUyqLNEFbO?=
 =?us-ascii?Q?mWVfJv8X4eEiUi+aVjHFEHEYJ2YhhleFEh+DDjRC7HHXnXWNpLCyimZKKWea?=
 =?us-ascii?Q?qRfOecdywmBW9Giyh1/liA9GTtFhD0af0lAS60ZTqhHbxqfkkJiUbpDOLI5v?=
 =?us-ascii?Q?0SmHXB62yIX4TUpK+w5cms5M6HIcKp5AFGcj4PNW66ZnNe3ZEjdUahiwXTEv?=
 =?us-ascii?Q?XEOQY4Gg0KtQFUeQpDo5FIC6thVZ7rUkhKD/ucmxBv0O/HzLX18/KjRTHMGg?=
 =?us-ascii?Q?UoT08FoRaDdowFFcvS9o3KcXzC8HTd3FwYM2my6ObeTSvTg9FQRg5qbW9U5s?=
 =?us-ascii?Q?IrjnAm64oIw4o6RBp/GdomBlwMRcDr60i3vrbmReleqmZNN0EDq4ncOanqlq?=
 =?us-ascii?Q?8TW3FsUhr79Tow/v0zAV23gtFM+kC8LLBuMRdtVUG3QDFjIDyoK0E1daJbMt?=
 =?us-ascii?Q?P6QU2KCScFPBfwLAkj7KHINx0NMR3h/A9FzB/4KdMRPhyvlAWzATTNXlpQmS?=
 =?us-ascii?Q?QpO9aWBGx2iIag+qNzgjWtJP7cLNlj2Yk9Rw6tFT5EvdGHQ86ZnuDxJoGXaa?=
 =?us-ascii?Q?NgqYjeSNoDkySKFGfR9ENoMLpc/GYQSE/kS9S02Tb7D6/jQddWLg8nclbOrY?=
 =?us-ascii?Q?TeWnb8nOvLFaZtuLggSCCQPY3FUbCDXPatslB0+1AYP7dnb3YE1n7U5RUd6S?=
 =?us-ascii?Q?N5xwyph4tnuFB9+QF8xe60JhEB6RwDm9hpxlP+AhzRlFROaHls2dFJ0+j9fj?=
 =?us-ascii?Q?jZqLjNE/EY9w+1f50k4Rp8o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42f5cdbf-9c56-4e46-8f2b-08dc8047e796
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:09.7653
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HxJ8OO01sJLboJ6sLEFC2MljKHFWgHRKr66rYzCZexa3vtDkyPPARnxdMYqwE/tBTM23NrnVmSUjTXikcXQt3CAyl3ilxw1GHm5oMfZ1nGCUHEuwRF9bbacNlkWAOsMG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: EJHIQEVWEBRX3GPOMX6CFOLCZLFU34IW
X-Message-ID-Hash: EJHIQEVWEBRX3GPOMX6CFOLCZLFU34IW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EJHIQEVWEBRX3GPOMX6CFOLCZLFU34IW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/es8336.c    | 2 --
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5514.c    | 2 +-
 sound/soc/intel/avs/boards/rt5663.c    | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 16 files changed, 4 insertions(+), 32 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 80c0a1a956542..93eba4fd27710 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -203,8 +203,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index a31aa471a1c21..4dd9591ee98b7 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/es8336.c b/sound/soc/intel/avs/boards/es8336.c
index 3bf37a8fd6e65..776d1551d9dc9 100644
--- a/sound/soc/intel/avs/boards/es8336.c
+++ b/sound/soc/intel/avs/boards/es8336.c
@@ -233,8 +233,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_es8336_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index 430c070a1a0ee..cb6d54db71892 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -160,8 +158,6 @@ static const struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = &snd_soc_dummy_dlc,
 	.num_cpus = 1,
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index 7e6c8d9c900bd..4556f105c793e 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -46,8 +46,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 8d550e82b46a8..6570209c1a63e 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -82,7 +82,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index fdef5a008daff..6f25e66344b7a 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -134,8 +134,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 082f311d8b840..ad18c4e9a6704 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index 6ea9058fdb2a7..bf902540744c5 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -210,8 +210,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 9fcce86c6eb48..4b6c02a402047 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -184,8 +184,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index f157f2d19efb4..e40563ca99fd5 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -153,8 +153,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 1e85242c8dd2b..94fce07c83f9e 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5514.c b/sound/soc/intel/avs/boards/rt5514.c
index cfa146b6cf087..30588d9e9ba3b 100644
--- a/sound/soc/intel/avs/boards/rt5514.c
+++ b/sound/soc/intel/avs/boards/rt5514.c
@@ -121,7 +121,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5514_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
+	dl->capture_only = 1;
 	dl->ops = &avs_rt5514_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5663.c b/sound/soc/intel/avs/boards/rt5663.c
index 44f857e909691..b456b9d146654 100644
--- a/sound/soc/intel/avs/boards/rt5663.c
+++ b/sound/soc/intel/avs/boards/rt5663.c
@@ -171,8 +171,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt5663_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ops = &avs_rt5663_ops;
 
 	*dai_link = dl;
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index 0dcc6392a0cc8..335960cfd7ba1 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -242,8 +242,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 63bbfc30f35e9..cfef00462f661 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -121,8 +121,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.43.0

