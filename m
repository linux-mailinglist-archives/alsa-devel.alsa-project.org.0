Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B33A89592A8
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:15:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33EA26C0;
	Wed, 21 Aug 2024 04:15:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33EA26C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724206532;
	bh=uXvWewXCu+wRq7FhwUkM+5IzreW+qMkECRunhKuWVmU=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0zAZlEwlsfuTYLVTZmtndfIyevsSH/Ex49yP8fKBDWm7sagftJWBJH5p8w6Z1RU4
	 Jij1LJuE0x7V0otPVlbzhJrc5+0CxakxQVcmFuXVWHSnf2oDRuyY7ocFIt7LQb5TQj
	 wNos+7G2yrV2Mn2Qinzx7K9kNmY38lDcqLgoZV9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73335F80614; Wed, 21 Aug 2024 04:14:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B9CCF80623;
	Wed, 21 Aug 2024 04:14:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D332EF805F1; Wed, 21 Aug 2024 04:14:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B2B5F805C6
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:14:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B2B5F805C6
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=EmX2lSVd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i56nCMMW9GAMKwsAEtnzWx7aBwkvKNdP/PCtjfEuqzzhId3IdXMrwPY678Bqbm0MB/kY0uEAbJQ2wzjoZeQY6fgApKVHYcOaP2u1+9ZCRM6bH7AdXESYi19SA9SzcCPtwaDKLwUsoDJBeiQTXSgzGHSvSNj9GH/6QYpbv8DU5YRBENGFGyvFIzboskIC4JWYBrqE6AdkdEVxIloDvHZPW3UYkYfhqwZ6nHdsW0UaX8EcYctSCxV4VPXg8lHAB03yM6wBKVxYdYSxSaOWBrEtRooI4OpM/54zeuogThGqfWz//2dKpYIiFCkgBx4Zb+oNZqIB3RV165XoHscITd0lUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JhwBV456gkTK1RetyWZudKaGui11zsj2j1Tj8MmhvE=;
 b=DpGtZpyEpH09AErgBqui/497yFPwlqoLF01jDpJqiBn9wWCY6x/fPRTK7W4jCCs2Tf2Xo728QvjaGImL4QIR81R7Is3ABIs7h++mwIJhvYHiOtl71swVujZsVh1dY5yVKzxGMr9ifK7HVowOoJaPbEYSoAfxK3IH+GgoY8sj9ts97OVL8SpltTmkL8CMlhR0bySl2YRm3KF0uwS4PnILY62WsBMs3cvF3LgS50Bb5LtOWtKIaMc3p3XZqoOBHx66TnKwgYK6nS9EWhxyR5xMVimbRvSwhQRpdebh9ypLwAVdlY/kIXE7VuiXmFnLHP/Vn6EPRRuqjQ6Yk1Shsc8QKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JhwBV456gkTK1RetyWZudKaGui11zsj2j1Tj8MmhvE=;
 b=EmX2lSVd7JyyIrcgz710gB2+ZymKteEfuC9uKZViisY2qf+drv8w0KvNDmHvphS/gfurez7AHI4Dk0x0IsPh9zGj5uQtAt2qefWuqNHgfxgZDI6XYDouzzuZyPWA7k62SomEZkPxOVfVeoFRv3Fmxd9bcl3OOSuhq+22OIOqTK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12133.jpnprd01.prod.outlook.com
 (2603:1096:604:2e7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.18; Wed, 21 Aug
 2024 02:14:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:14:15 +0000
Message-ID: <87o75maah5.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: [PATCH v8 4/4] ASoC: Intel: sof_sdw: use playback/capture_only flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:14:15 +0000
X-ClientProxiedBy: TYWP286CA0002.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12133:EE_
X-MS-Office365-Filtering-Correlation-Id: e60a8cfe-627b-449e-4bdb-08dcc186f48f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8yM0D8YxAp6sv30bOtGPvww76JcqyG1Lrx4UTcoze0fTrT2yTw3XW/8juPXv?=
 =?us-ascii?Q?oPoSyl6zo6/h6UTfw1TSqKs2VBlA8leMC4mRo/VuqSyWE0hXbhX19yBR4xZp?=
 =?us-ascii?Q?0WOVta/ApACEpMgHccfxFTDl383zny2BOO05+XdzaAz/ab5r+3XI6244P4ae?=
 =?us-ascii?Q?ztJGmhfATlpA8NNHmMOWq8AYP1a2qs9P4C7ereiMgjsAzATv98ugNnZFB4ok?=
 =?us-ascii?Q?wvpr4CbVvjAdQr5fScMHsyxyE1w7x4ed4y4NTpC+V6hrUe/CwtILeXU1RBTg?=
 =?us-ascii?Q?tHrQCtYcL/egza/W2g8O7PZ/JhXx7CTwfiRsy2FtCRQJiKYMv12TiZXOnqHH?=
 =?us-ascii?Q?DvEIIeSlATufMql0HxkWW4LBGCnoC1wmLEkFHN/jfqSAr8RMdMC9ViH4P8l4?=
 =?us-ascii?Q?TdZk6a4qP48Bb4UxRns+A4mG87BQZeX3Q6rJKG/Tk0Ehek2fdqoidxRT6J1P?=
 =?us-ascii?Q?5OJ94lnPUvko6NIR05CJuD4xeXXpXHHUdVHKvuQSM6FqehynhKmOFIG802jF?=
 =?us-ascii?Q?jIzaikSmyUOB1LaNVKHRgNxjw5pySZS0ImzMscaeIStfATQrSJvGkctGx/PI?=
 =?us-ascii?Q?LIM2oJVW0vbhc7khb3xzAYOMBwvt0bHtJpfIPdRZa8eeQp3y443Qcl/zRUKO?=
 =?us-ascii?Q?ppBMUE/xAkbbF5GTmTTSgEV4HSJiTwmYQYi5FzmyXfjsA1UoTkVRR+YIf2NL?=
 =?us-ascii?Q?ELZAlc5jND1iXVxOliz12K1lRcVp1VIrp8gAf6UJLwatNBpat6n0WEOOSBLC?=
 =?us-ascii?Q?yct3XnNO9CC/BXb6597iYLIBhatNHCpD8BImkEzLo66mBliJuf+/y0VdFoSJ?=
 =?us-ascii?Q?T40bDuulrrmGFbCfzvxVkX5OTwY7z5Wt9QLn2Wnlr93QmsHA3KusHf5oP6eK?=
 =?us-ascii?Q?W9DTv/dWws8oErpeol9HUeodNijdN1V7jtRZi7uWxRTCCmIU9gv/60lyFH1L?=
 =?us-ascii?Q?k5dA9GpIgBlHEV/F6BjUC2LqzLSKH9z9Kbb9HZ6KPpVOr98y++m+cD1kFhMq?=
 =?us-ascii?Q?sqzmfP+3GLY/hE4BtOZfC7YhCANt9uDJ48MMzEXyYsAZocF0o87UHIKLcmkv?=
 =?us-ascii?Q?VE07jHpNrzGwJS5qwwJaMYQ2u1jsDIwdMTXR95jB7JDYyA3Tp1jKuOvDpqse?=
 =?us-ascii?Q?yaeGRZywTTEIrpOyqv8S/wQ6xblenAKXurz6MwVG1BXuPbUcdMKfquOq16lT?=
 =?us-ascii?Q?gkAduO1y45DBe+gw+na84Tstv6WZDMQcB5GzAp1MG0hi2qQSRh4eC9jWALk/?=
 =?us-ascii?Q?y3bSppjYS6hmyxp3AgZP/CNforjjqbD3Sd5VaK12Y3qGWHKPP/kiix48nZLH?=
 =?us-ascii?Q?4VSoOkqrKTRqEl4CTB088U374xQcm1Wzuk0xmAZbRpYYnQ767mt1NrtrBpiD?=
 =?us-ascii?Q?lyH9E9BfB8vml3azoffx5+SNu3gCVtUjR+YbfmOy5EszihU7GwyYCEstbXy3?=
 =?us-ascii?Q?DGS1Rg3PFD0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CPUneJcNb/1HNoJGWnWzTCKOZI6r5POZiWtTUPKHGY0MPvnlBkhM6W4Lfs6H?=
 =?us-ascii?Q?iFDn7SLP0otQ6k5+164PsSxafKnWni8HRKFvfVjawntAQhUQYdPj3smvZzhb?=
 =?us-ascii?Q?6OtptqxmS2jy0JUADdQKwPsfpSgYylDIW4FhxsfydluuA0qoHQ5zhCCNls6C?=
 =?us-ascii?Q?TDYVrFIZ2fqBCZySfEir4JAdFnLTAZVazamwg6SPIMpuwJhi7ZrY8tnJB6Ju?=
 =?us-ascii?Q?3v5f6o7UGvireznPg0BmZLxCVnCa6hihBffOzfwIc8KNk8NX9mrLypJZlH/m?=
 =?us-ascii?Q?0VrcAG7EHRqy+bNPyAkqSlgRgabgBdck9AfCYSJbp5oUZLiiz2IDDxWttWuv?=
 =?us-ascii?Q?S24vzDzC5rYJCAr9ShoN1KnHvFsmEtAAxNGIbk0BMf48DFSUXLAcZn0b6dCX?=
 =?us-ascii?Q?97FFxvQSbyLz0TNSyUMOqtro2rPrvrgpCz0X7t29o621IBjnPMe2O/wn2wPD?=
 =?us-ascii?Q?SuQaIADebGOtDhhuPFMRLZRMPIhFBrjd9zLL7sowy4CRIjJ4cOLTp0hWoR8w?=
 =?us-ascii?Q?pkciaOWBRrjoh2ZF8TDxmYEYNNyhtkBjmF41a3l725ylZz5JoYPRtOsYAbdJ?=
 =?us-ascii?Q?AORxPb7ryMCdjeAlzuAss66Lj8Kfb7Ql0K2l4Yr4yjLQ1Pb1l6GR2hP1iG5A?=
 =?us-ascii?Q?xWWW3t4IEFdRQFwE/lODoySyuaRzHvwLJilPW8K9NInWRt5vb8Q9LX4G7CRl?=
 =?us-ascii?Q?TGfIauW3Uf3VbVJAQmIiZzYuJ+sDW1Ljacg60vURV+vZZaR/k/0GEy3oEVvr?=
 =?us-ascii?Q?Rr4iuaAr7LFnIotCa0r1TixCPln/VHgAKcD1kObWbNCD40ozLTc7ir8PfSCL?=
 =?us-ascii?Q?ls2e4TWzBa9POdKbEJeukVEPJtBDa9Y/G1lGTNIQlHWdWdfxb2ZvQ2+nyCHH?=
 =?us-ascii?Q?AkiMmK52Z8CX7EzG4ykvxhYz5mExKL5p3zq0BcPkJtH7soji/+heAMTQ74xK?=
 =?us-ascii?Q?K6kvFGsDCinm6ZXXsDZVgeDoyCSQjvaJzZQWcKpiD+wAwPfM0tDB2SUdDPKn?=
 =?us-ascii?Q?9x/6m3tR03HzL8B9Vw29l1rLACi8Wo7Oihx5XJsypGFaXB/7TURy9Nvnjrp7?=
 =?us-ascii?Q?vLa+C34VMu45AzTkLrHolfV1w23nDQ93mrTrK4+iK4HQmm3ZnG65HNE9L0Cp?=
 =?us-ascii?Q?+KDOHd8ANI+HWdmprYlmzLN6COGCUHc4xOUIgRUCiddDREEkg00LnpTDqUED?=
 =?us-ascii?Q?nCoH97aj/UlMJPVvw/9d2N/YBT+fokKZc7IoxWnRiRoFa9dYzzfIg9PvmrtV?=
 =?us-ascii?Q?4SvrOLp0nrTSLjTSRMA3MfYcO3DrDUhrjT6BEkZ85HI/gryx00RI8dvhfOIn?=
 =?us-ascii?Q?SYyLlfiE3s58v6dyU1YMSXq+5h0hsHKhOfcIPk89SJRWAf1f2rOjOyMVs4Ed?=
 =?us-ascii?Q?hxDMNGuIIvqxXA4Wm9WSoQC2g0/Ve9qRBhdANmSRHYtvM7Vv6iyLw8cQ9sIh?=
 =?us-ascii?Q?c39SqXXP3qHIMAAyRt78kKMdzonVi1guhM4fiqbdwnvqKuHWEbDwvXk9+iby?=
 =?us-ascii?Q?9WRomcjQj3DQCXrirpg5LjIOKGUpXk5XWnZZ1tixdzgRlXuef5OX2889QAQ0?=
 =?us-ascii?Q?GWAMNFqmoDnxG+RC50McWt/e6MtCZBqFRkfCpTTQmCbl8Dbjr7BQQ6G4NYMG?=
 =?us-ascii?Q?i/wqu1sYp7mSJcW2gUWEX1A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e60a8cfe-627b-449e-4bdb-08dcc186f48f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:14:15.4024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hzyrXtqL/Snp9bETDR5GVtv9mMLyL8H3OI7Dbv3GcjOgOK75XD77g6y3lH4aPRuNmIqw3dS52WraQ1KW/JFkxjiy1lW6nXzBCFOmKlr6vH83OOUJUvkC6OzTWCQ3ymyC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12133
Message-ID-Hash: MZ5RJG4N24QTBOWGRNZKMYEKI6SFBN6Q
X-Message-ID-Hash: MZ5RJG4N24QTBOWGRNZKMYEKI6SFBN6Q
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MZ5RJG4N24QTBOWGRNZKMYEKI6SFBN6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Prepare for removal of dpcm_playback and dpcm_capture flags in
dailinks.

[Kuninori adjusted Pierre-Louis's patch]

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sdw_utils/soc_sdw_utils.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdw_utils/soc_sdw_utils.c b/sound/soc/sdw_utils/soc_sdw_utils.c
index 6183629d1754..e8d0f199155d 100644
--- a/sound/soc/sdw_utils/soc_sdw_utils.c
+++ b/sound/soc/sdw_utils/soc_sdw_utils.c
@@ -950,8 +950,8 @@ void asoc_sdw_init_dai_link(struct device *dev, struct snd_soc_dai_link *dai_lin
 	dai_links->num_cpus = cpus_num;
 	dai_links->codecs = codecs;
 	dai_links->num_codecs = codecs_num;
-	dai_links->dpcm_playback = playback;
-	dai_links->dpcm_capture = capture;
+	dai_links->playback_only =  playback && !capture;
+	dai_links->capture_only  = !playback &&  capture;
 	dai_links->init = init;
 	dai_links->ops = ops;
 }
-- 
2.43.0

