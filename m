Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6828D42CF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4185826;
	Thu, 30 May 2024 03:21:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4185826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032116;
	bh=HcR3Z/effrP1FZUPqig3Zvj7l0KDHU6Suc98FZZqaxU=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ud9XwcXkqMhnnWB1K5ERTkS0yRzyyekL87xaNy357IVkWRjD/H3gpmK0mXNENaw8B
	 x97BD1A3rogrdh7k82rajbRHjhx1uiGdfV/eUzpvq4t6L/Gcfq/0D4hDI1uLFa6NS6
	 KWPdsIfI/07upkaLdaefvCRFZyNRSmw+HfAu1hgQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C94EF80616; Thu, 30 May 2024 03:20:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5F00F80610;
	Thu, 30 May 2024 03:20:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D865FF80149; Thu, 30 May 2024 03:19:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4212BF800E9
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:18:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4212BF800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QzHcUlRj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7ENcu41rU3mvVzYwshZpA68yt3yEJpb1TAWBuslHnhotw3pq46zZvzf1HhjIxG36rHMnBm+nz4DsdM9akscQKfggL6RaHKufzn83rPMpkII68suoSLM4xCDnEk+vtiajYeEQ0xI5d5oKVX6C3YHL59JWqZUXUU5yjvuuSyPm5MMQkITwqGpDdU8+KB7aqsWJBk/Nqfie9C5WNvYdpnMAiFfmnzEFql2QU4Wi3TJBRPpZVG08Fjbux/exCZZ/E8HwcuF0AMAEn6qic0ToRGFvnVz6IvM7r8gMDqXaIsXx8sezKdV/XCrt5tSz18vsha3F8QbPNTQiGLbopcq9grbRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vonKr3xCTVsyBVxO7nQoUW2nAXyiCWU2/z8amjUQWY=;
 b=M6CFICq86dg60BXZA7J+NN/Pw2IiAOcVf6fCUeBcxu3MPDgCDZzb5KzPhlnKxEQOCr8sBtGg6D1yFm80Tr4Gmm07hNHXvvh8iXIn8bKqn8plKp9Js+N2mIkPASV+UXQ+pmxujwBv5qR1tfXHamXCZzpGtK9CmhMlwC5waUBRGAAfwJzbyAaV5qWU7+41Re/MU7PADCZvMzj7wM5xY2ZbgMfz0e5Tq4gRslUo7BNFmFol8r/zzmbzlX6xXN97LS8aB/JE/8YlFxzz+lVCAmrFsueu7wCh5o7TuCOjkF2G8GXKTbN/pnoLdBo+JlVQWhHf1SpYZNGROFLV/tFP3f18vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vonKr3xCTVsyBVxO7nQoUW2nAXyiCWU2/z8amjUQWY=;
 b=QzHcUlRjq5UmYoYR75aDdDwWjEVaK08hjydv+enf2959Lv+xY8oV219fJZeWAXbL5T2T3yEVqEwudo5OiKMUX1n2IxiK8iQHlw2O15zX0LM5KH6ul8Cu6SVQNzPiy03jjND2C5u6susKoe45m5nx1xNZ4BAZopeRQdODJTEZ80o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6933.jpnprd01.prod.outlook.com
 (2603:1096:604:12c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 30 May
 2024 01:17:59 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:17:58 +0000
Message-ID: <87a5k8qerd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 1/4] ASoC: soc-pcm: Indicate warning if
 dpcm_playback/capture were used for availability limition
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
In-Reply-To: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
References: <87bk4oqerx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 30 May 2024 01:17:58 +0000
X-ClientProxiedBy: TYCP286CA0106.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 30274907-6755-4f2c-7e4e-08dc804657bd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|7416005|1800799015|376005|366007|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5Ja9A2g/zjxl1fwfoz60ZfEkdaQ96nYnFgE/chBJVrCkxb4K/WJ/xICZvQKk?=
 =?us-ascii?Q?u1+nPYXBgJwBdwu42ViunUi74lAkKmYixg2+XoY//TT/BxAQ0qGexX0D04j+?=
 =?us-ascii?Q?Ox8LqOWkmeycETh2wlBECtbK0bjrlOX86zK5i7rcI3PWg4miIZfNtajVK3ZV?=
 =?us-ascii?Q?tK+4ZcyG5GfFYrKdPFYjumDnP/azIMnrVIBRdzf3WqwyTuavOEHSPAsn9POl?=
 =?us-ascii?Q?hjYABcgvzY7tvbBfIk4654uR2985bzm2IN8Neb0hmWBayveLJjGUh5/JlzWV?=
 =?us-ascii?Q?AscPgpsvlq9ag9UoVehY1uLTKt/9ljmPb60zVN+7PddTYryvl25QGfKYqB8Y?=
 =?us-ascii?Q?sbKz1UXn4PmnQ3tH26hIpKKADTVTZogx3FJflvqZo9m+hLo7bjKNHNotoOqj?=
 =?us-ascii?Q?y5Z2ONAm1ZyH+bGtGRZ6Qux8yWdnZ3UabkeFoqo3VSXy4nqwG3d+0PSGztz8?=
 =?us-ascii?Q?jK+4QRTfiavpVbbDMlr7FuEhrS+MXMuJvWqVIMUcYbEseZKNkdOxdoy1WU2Y?=
 =?us-ascii?Q?Vv/52yys8wu2zUfpnEOkS5eMYHaJmsKbCcLEsM4bRf6bNqmHrVGJnOs/8loi?=
 =?us-ascii?Q?T6eTNB8OFJDDqabO5/4iIXKZdA2r37SbEEtQci2g4ycVtLL7RpSs7Q2fQLgU?=
 =?us-ascii?Q?D5yB58LQqt3CAEVSFVUmK4Ts2TklKLZ2ObeAiQCj1aCvbLPEBlqycvPkYI8X?=
 =?us-ascii?Q?NfILNE6LBdNobeT7y12DQ/6BrHLc5k53SBAV5sgplROVTnFsll5SfMOD1l9B?=
 =?us-ascii?Q?3Aa2njwK8uJCR2xM2zNP8f6G5W7Z7LuxxlZaa9g6tw1NcWMpM99u80tuglYq?=
 =?us-ascii?Q?D2Ob0s9D8NCKhwAUh1AThJJSXZajt7j+7PnyCQUeT3QFLzPJqINySt4nWUrO?=
 =?us-ascii?Q?naxSTJFDVOEQDQpK8TxPI8VJBnYR1iFM6XxaMZjG8jRV9N4bfpoKW8zEekLt?=
 =?us-ascii?Q?zW8CChYa7FFIa+JL3OAIX29bFf+E8SNHCgjK5CiYUXsQH0ZbLGdfAhkGnVbe?=
 =?us-ascii?Q?0TvymChGc5YRl7DN4pwe4CgnN2kh3/d4/SQBQROa13Utn1CtpkTmhd/KGxxI?=
 =?us-ascii?Q?MkCNSAKuT6LVTaVUHLb1MNvU/+F3QCjjwHKVvjBaJxy9/o5Cl30jBAKA9gkq?=
 =?us-ascii?Q?lDvjcytSGoqpmgr4dre2HjEev3qTj1ny9LYOU/x/Uhjg541Q5Ar7saQFq/5N?=
 =?us-ascii?Q?Um+OqYn++7VlGmjerJ3oHKQLZpB01X0cbMYCxad5SACOrok7GYepKmS9KJTp?=
 =?us-ascii?Q?7Xbyw3dHLDkLuCa3YwOO5BTecfkEpfi+r/P8cFNao0hQw8aD5ta1Yddbm1rL?=
 =?us-ascii?Q?JEs=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QHj/gk9lShh9Y+z5bdHcO/7qVcndMgJzYjFAlGOEgOit7mCDms9OmJlfkj/X?=
 =?us-ascii?Q?BUPl0wU+r94/qqO80Or4wU5XS2l3w9N8/FXFf0MJURiodvSQ65q7UeGwJUOR?=
 =?us-ascii?Q?JaKwwnfTn82n/ZYxDkXIHOUw4DFBfvOmxXFDM+Pg3ZYoT4q4d/O6iUlZQ0L/?=
 =?us-ascii?Q?4vacgKxRLVmjY+TfpsWkNnZ0nCWhuCDKAKVbZPfq5RdhcQcQMl9BAftW4skF?=
 =?us-ascii?Q?E1Ha+MAVdbudWnZXJ+gHbBvQ/y7tu5QjinNbmWjJ5TODAFq3qT83nnZICPgg?=
 =?us-ascii?Q?KXDFgeD+Y7WWRM9IC2LbJ9z803fLZiILwTkAIAUIjRoQOjx+1LyZ6IaJImw9?=
 =?us-ascii?Q?y0AiWNFYARG7OnHXkqHwnvlCXV4iRvoB3Gq0/YhK0s8kYCLlsSwUoXUNlXmC?=
 =?us-ascii?Q?1Ah5HnGN5P7Exua7Qie5+0ovTeZBB+IMvih6eDhbXMHuWHEGqtZz23i3w/OP?=
 =?us-ascii?Q?tTUPmiWUyRbATwvKS/o2HDh/0d9CUieWt1Ce89S/+7q8z7vUrNc6myg+IIXb?=
 =?us-ascii?Q?783btfrlOj2aEb98gGppNkuksd/MdUkgBFuXfQpuG2g3il0u4C85EQ/YhdML?=
 =?us-ascii?Q?cDPSgW0silrSuobSEApgPd0x4hbF7aTYGPWbgwLGfDaGMSlajDFx3lmfY18L?=
 =?us-ascii?Q?vh1BQFkEqV2oyxU1/6FKHCo6YqszB6wxhbZk+Oek9Txwx18g+2d2Tyg1+6yl?=
 =?us-ascii?Q?jPWd3UpK/uUx+hqEqDGMx83CyGGXXsUMdFVnlLWTGs+Ptr7Qzs5dstmcN51/?=
 =?us-ascii?Q?IVUJQIEpsSwuXus9GLDNSnWRJVPd16b6s6N9YtnWVWlImM3rUTpLSVKAe3hM?=
 =?us-ascii?Q?dcPa/qydHaEGAmq+rMeUYUHGiyVo6UOAsluoyVBIUTwd3+1JHQLAc0zg4+n9?=
 =?us-ascii?Q?ADyJrWNo2Z0/hSK3IfEyefv+8M9Z3EulukpukN03uV1iUrlAh2iRMbHgNXCi?=
 =?us-ascii?Q?u4kwpYftlaT7G7+yWtBJJ7kUunTSKk/YtihWezENlOAwyAwXT2hLuQfJEXNg?=
 =?us-ascii?Q?L2sK3bflc2KzDA2C6tseGu2m0ftChHfTaXaV6GOpCyjq803+w7SaL/e/+KMn?=
 =?us-ascii?Q?3o6BQ4VUixX0t8u26giGLi9PgrX/tJdjJ8MfyMrCwT/E7zJcuaUYJWcGCw3i?=
 =?us-ascii?Q?OVZboTE2Y+gdWm+o9hsJDGPfxBLHxr2AjFIInwSksz2YAutAqTwOHSmnkniT?=
 =?us-ascii?Q?dXXkkl5R8zy1Xnhk9eVETsRJkq7oU9j29A9IgQTpR8TYFh8a6CwW8a7aLWIX?=
 =?us-ascii?Q?/U/AdGCO6sncngTHuXvL5jrrAJDYRPFkBIMKlK+CVnBdw8iZp4BDmntgMTwi?=
 =?us-ascii?Q?uPGB9wCdf3Dgh2HyyYSMaQmCA6GMqdnczkclWpzgHAiD2NrfaosG8VQcNcBG?=
 =?us-ascii?Q?g4IlNg1uzDtduf9aYqaeEJuzIzGvfl7Pe6sJMaG7Dhs8AxxFvwQqFs3ozawo?=
 =?us-ascii?Q?gLptOTPzcBHAA6QATdz1nEdOt3sbzvozpHRAbpaOKvupLjPJHq4+b2sXS55A?=
 =?us-ascii?Q?/tmC5Akx1Os0H5c/t8XrmcEeT3EQG7NggQ/CDktihx2FNR2+vZSqZ83NWaSB?=
 =?us-ascii?Q?xZd3VA2o3/MT1YFbMRyGsFZMRLEPZxYyWwrZ/sswmLbrS0QubhO7EQ8XhON7?=
 =?us-ascii?Q?cM6mD3gy864S6TRIjnxQyvc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 30274907-6755-4f2c-7e4e-08dc804657bd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:17:58.8911
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 5uf9v+/Q52PurZtdv/AZS7S+WOTYW+j+GOzyaHBuN8PwAx7l9jUBCXe8d2Qlf86O+yHFnHu3PJySJswv/iNoK3ZAomNQh03Y2t8HWzig9UsdYGoe1lPCWA6ye101wz6u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6933
Message-ID-Hash: LQIDVTRIPAI4ZLTPMN22URIAMYTSRGHR
X-Message-ID-Hash: LQIDVTRIPAI4ZLTPMN22URIAMYTSRGHR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LQIDVTRIPAI4ZLTPMN22URIAMYTSRGHR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

I have been wondering why DPCM needs special flag (= dpcm_playback/capture)
to use it. Below is the history why it was added to ASoC.

(A) In beginning, there was no dpcm_xxx flag on ASoC.
    It checks channels_min for DPCM, same as current non-DPCM.
    Let's name it as "validation check" here.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		if (cpu_dai->driver->playback.channels_min)
			playback = 1;
		if (cpu_dai->driver->capture.channels_min)
			capture = 1;

(B) commit 1e9de42f4324 ("ASoC: dpcm: Explicitly set BE DAI link supported
    stream directions") force to use dpcm_xxx flag on DPCM. According to
    this commit log, this is because "Some BE dummy DAI doesn't set
    channels_min for playback/capture". But we don't know which DAI is it,
    and not know why it can't/don't have channels_min. Let's name it as
    "no_chan_DAI" here. According to the code and git-log, it is used as
    DCPM-BE and is CPU DAI. I think the correct solution was set
    channels_min on "no_chan_DAI" side, not update ASoC framework side. But
    everything is under smoke today.

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		playback = rtd->dai_link->dpcm_playback;
		capture  = rtd->dai_link->dpcm_capture;

(C) commit 9b5db059366a ("ASoC: soc-pcm: dpcm: Only allow playback/capture
    if supported") checks channels_min (= validation check) again. Because
    DPCM availability was handled by dpcm_xxx flag at that time, but some
    Sound Card set it even though it wasn't available. Clearly there's
    a contradiction here. I think correct solution was update Sound Card
    side instead of ASoC framework. Sound Card side will be updated to
    handle this issue later (commit 25612477d20b ("ASoC: soc-dai: set
    dai_link dpcm_ flags with a helper"))

	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
		...
		playback = rtd->dai_link->dpcm_playback &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);
		capture = rtd->dai_link->dpcm_capture &&
			   snd_soc_dai_stream_valid(cpu_dai, ...);

This (C) patch should have broken "no_chan_DAI" which doesn't have
channels_min, but there was no such report during this 4 years.
Possibilities case are as follows
	- No one is using "no_chan_DAI"
	- "no_chan_DAI" is no longer exist : was removed ?
	- "no_chan_DAI" is no longer exist : has channels_min ?

Because of these history, this dpcm_xxx is unneeded flag today. But because
we have been used it for 10 years since (B), it may have been used
differently. For example some DAI available both playback/capture, but it
set dpcm_playback flag only, in this case dpcm_xxx flag is used as
availability limitation. We can use playback_only flag instead in this
case, but it is very difficult to find such DAI today.

Let's add grace time to remove dpcm_playback/capture flag.

This patch don't use dpcm_xxx flag anymore, and indicates warning to use
xxx_only flag if both playback/capture were available but using only
one of dpcm_xxx flag, and not using xxx_only flag.

Link: https://lore.kernel.org/r/87edaym2cg.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 65 ++++++++++++++++++++++++++-------------------
 2 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 33671437ee896..2a3da1d913776 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -815,6 +815,7 @@ struct snd_soc_dai_link {
 	/* This DAI link can route to other DAI links at runtime (Frontend)*/
 	unsigned int dynamic:1;
 
+	/* REMOVE ME */
 	/* DPCM capture and Playback support */
 	unsigned int dpcm_capture:1;
 	unsigned int dpcm_playback:1;
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 711b2f49ed88d..7fe5ee3bcfd4e 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2795,6 +2795,7 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int has_playback = 0;
 	int has_capture  = 0;
 	int i;
@@ -2805,43 +2806,51 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	if (dai_link->dynamic || dai_link->no_pcm) {
-		int stream;
 
-		if (dai_link->dpcm_playback) {
-			stream = SNDRV_PCM_STREAM_PLAYBACK;
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_playback = 1;
-					break;
-				}
-			}
-			if (!has_playback) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support playback for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
-			}
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK))
+				has_playback = 1;
+
+			if (snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE))
+				has_capture = 1;
 		}
-		if (dai_link->dpcm_capture) {
-			stream = SNDRV_PCM_STREAM_CAPTURE;
 
-			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
-					has_capture = 1;
-					break;
-				}
+		/*
+		 * REMOVE ME
+		 *
+		 * dpcm_xxx flag will be removed soon, Indicates warning if dpcm_xxx flag was used
+		 * as availability limitation
+		 */
+		if (has_playback && has_capture) {
+			if ( dai_link->dpcm_playback &&
+			    !dai_link->dpcm_capture  &&
+			    !dai_link->playback_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using playback_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_capture = 0;
 			}
 
-			if (!has_capture) {
-				dev_err(rtd->card->dev,
-					"No CPU DAIs support capture for stream %s\n",
-					dai_link->stream_name);
-				return -EINVAL;
+			if (!dai_link->dpcm_playback &&
+			     dai_link->dpcm_capture  &&
+			    !dai_link->capture_only) {
+				dev_warn(rtd->card->dev,
+					 "both playback/capture are available,"
+					 " but not using capture_only flag (%s)\n",
+					 dai_link->stream_name);
+				dev_warn(rtd->card->dev,
+					 "dpcm_playback/capture are no longer needed,"
+					 " please use playback/capture_only instead\n");
+				has_playback = 0;
 			}
 		}
 	} else {
-		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-- 
2.43.0

