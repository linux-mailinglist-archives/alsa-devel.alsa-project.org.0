Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1F8CCAA1
	for <lists+alsa-devel@lfdr.de>; Thu, 23 May 2024 04:13:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C9C0829;
	Thu, 23 May 2024 04:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C9C0829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716430425;
	bh=zt1hZwnS8CntM7/tETv3kXf/Tl2a4TlBiJG0KRNTiqE=;
	h=Date:To:In-Reply-To:References:From:Subject:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o7ANiESH+ktYzcHccc0URBSYhj5KyQSyMDc7ZyM7cOKC5v4CzO4os0B2fvLXysWjh
	 oRL17QrR3rxYNsE161D/Rq7FTk+joVKPNfg+5GmUyZvS+RwVIFNl8CjyawOixawxM0
	 tOF3gnbeM3QiMjxnkttNC2zXbFIPHO7JG8IH1jzQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3090F805B2; Thu, 23 May 2024 04:13:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE8CEF8057A;
	Thu, 23 May 2024 04:13:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8ADC9F8028B; Thu, 23 May 2024 04:13:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0660AF800BA
	for <alsa-devel@alsa-project.org>; Thu, 23 May 2024 04:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0660AF800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gWVP+HOe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKrpEtgJlvhaEW4xbAUr9J1kBENm9qZwvu7nVzEdOpEpwR1jqTXf9M7Upl8H3v4RDPYQmrCFbS0i1ZPw2Rp6AGSq6nQ/q7oBMTvneGDQnQjYoQJIGqSHnLixcR8d1JEV5aEW7VkXuKYfnqtXwy0fOVgq7aX316qDeqtJeJmdlob/kVafepGLOSAMVNad/aNvtah6KR9TO5U3CWXCRhKN4znEpM1YntphXyf18bxQwMurgMIfeP3tVQkEB0qUnLhKW5/Os6Pur6yXLZ2F7r2Ai5H1nKLRDWJR7L4MMUCqv8fUj78qXQmdzARAGtjrfInpciOeOrNzHdi7pxjQFqpL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9/RPTnwkzZIAalYTXmYVqbX5Qb8hkDaoZsE6UJxj1FE=;
 b=TxWY0KyuyK66JrPWFE931RZbC2Lrjo11z3wCp0hmyykSDz4v6IO1z2SGuKY+4WjzHnwgrehPQgl8m+j9sv40bYKIUjxvm8LOXkAjIT6lJcKWF4Zjn2r0QFyjHqzMuF8FoXxFHa7oVebqmhzPybk/iTSOQAZ7b5N12k0Dwph1I+jvZnwnS/ZQ9+8rL71ogL/OgudRl1PEQO2lT4DWvjWyrnCw0bMJUXX+4XEkbG+V5ai07DpyeopCabHH0yJyow42U13xONmgtKsMVK6TVxve8biOUNkjKFku9EURyUKwFG5cUETW62XT+D2cINXlDf+DnL3OWanhe9ZLIp2gChzH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/RPTnwkzZIAalYTXmYVqbX5Qb8hkDaoZsE6UJxj1FE=;
 b=gWVP+HOeLLyfQeBmJmfhm9Vcyh704FvbA1pfVzApCCHJWcpGV+yOptli7T83YPsVyqPeGeH/fo2370ONRVIRJAhacwukQzocV1K8X1jDtWuodUXsxunnUse1jD47PtrW+R6sCuIhazvRo9nL4ZueDnJGBa2QpfqlmG19JjefwTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9434.jpnprd01.prod.outlook.com
 (2603:1096:400:195::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 02:13:12 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7611.016; Thu, 23 May 2024
 02:13:12 +0000
Date: Thu, 23 May 2024 11:13:11 +0900
Message-ID: <87wmnlmg20.wl-kuninori.morimoto.gx@renesas.com>
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
In-Reply-To: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
References: <871q5tnuok.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 3/3] ASoC: amlogic: do not use dpcm_playback/capture flags
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0328.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: d8e14e43-270e-4c3d-2e7a-08dc7acde5a2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|52116005|7416005|1800799015|376005|366007|38350700005|921011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zOsmQT10YVRL8uzCrVmr5lQrgRxb/V9RCFVFio537aMYfd7kvKPVATg6A3hF?=
 =?us-ascii?Q?+K1f7zEM33VSX6YLTpxk/9wKwhbhD9Ny7VZa0ly61P0xMSYXXoghN8CllvN6?=
 =?us-ascii?Q?KpRhudwVYvz+4HZQopmSC2//CXQwULOJwPviOG5MBtRAsflC760A3H28mDMc?=
 =?us-ascii?Q?eQws0T+s9fHJyxNZms8xmg45/+WYqCoRT/yD7e98TH/235Z4yM22r2o4LocQ?=
 =?us-ascii?Q?UFjCVp2yH3tMnVuEUa09bK0SOcqoiDfVVedTOIIbbYeIaJiUeBeL0PIS4R9U?=
 =?us-ascii?Q?uCK0JnZWXOek7bJBn8Ekg6V1Yms5mq60rYobJbiB5ZxAOC3v7QL8XV0xoQwH?=
 =?us-ascii?Q?8/SA5Vz/LJChvYO037BgWXD+l3ZC4Z6bRpzbMNy12RZBeoEsfkfzvdCP2t1N?=
 =?us-ascii?Q?3QI6THdI/GYHJdHtWuixxiSAY4Tzxw+3gYjl6uolFyqeazinqIZluzIwxc9a?=
 =?us-ascii?Q?k/u1TFCQzIkLHsiFQsrAT0qF3AJ8ned33db8czeExIFHOixX97xmAymBTwdy?=
 =?us-ascii?Q?TzIG1fPNLshmtURKunsxtyQGkKuOvckd3scfdxHASNpFyeR4O7Jo3X00DZWQ?=
 =?us-ascii?Q?7j+eFlCtYycm0fICu4UuEDSt+yjQcBI3f4eO0zrxio7D1fxj/xiwIR5FRzsV?=
 =?us-ascii?Q?qFW8+K1t67zGLeJd9fForM2iPL1OXa6FbkEgoheM0EkvcLZcWLFJRStG3anu?=
 =?us-ascii?Q?VhKlZF8yPzrQX6Z3CwHqtGxwrr84YXeEE8RU016k+8dneYkfSZPFg/45sSy8?=
 =?us-ascii?Q?I1An7X3zgRh8idRmaQNW6g3dBIeUcF5OS0qz6tX8EraZv2hdLXrllCogeC2s?=
 =?us-ascii?Q?qCCLEDfHCaQxlCZgfR0Q25OxRnVrTbzalCWVABJMgw3rXZ/d/SK9uWtAZuQG?=
 =?us-ascii?Q?TsBTLNEZqCX0/NzFhazaumCVGu0OIOoJlkKHyemXRGii2sHG1tnlS0YrgNPm?=
 =?us-ascii?Q?lqlvlZC63I1rk3kixF7tZGoYjK/yWNPOyeQhrHX39yu+YOKZhZCSPABsXKLL?=
 =?us-ascii?Q?Mr5r+jjZy0H1fBqKZj/sK3sm2AlZ4nEOzgVPyZnFk0lBKvPWfdD8Az98i8rV?=
 =?us-ascii?Q?gUeOtdG3UaNCYkeoXesEls0CPX6W6l6EaqL0Pmsk9JEl6NE14CcnGcmX2IVI?=
 =?us-ascii?Q?T7NNOGc3MKQgkA81dQNfKcw+KtqJRNQ1ork4YlM7gH6tmubbh7Q9oB5LlPk1?=
 =?us-ascii?Q?V/gLNxrGExD1XIRAd05+1jWuH9mUVLsKm04XgTX5lpKv5jHZr+HdE07+fYkT?=
 =?us-ascii?Q?bLUL4XaWrXSJIUWWcI2+ERBslppqMbzC6FHEDp4at2S9xKpA8581RUpCQ5Gm?=
 =?us-ascii?Q?nkF0+5nqVhZO2DxenqkDJEb/B5WAtfbrqbbXsb/1xJ11aN8ayE+pRsrNC7/G?=
 =?us-ascii?Q?eK542Ko=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(52116005)(7416005)(1800799015)(376005)(366007)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rILQgsL/cGJcDrnAVVyqcSlLUEL+w/zVb6rLLZmQZ1AUrSpl8Le/1iKEQC93?=
 =?us-ascii?Q?97YrOtt3/ELHwo7NNNERo1WqoALRXGYnU6yCG0iSF4READvt2cG2l3b5jq18?=
 =?us-ascii?Q?OGI+zzUa63wWqR1e30WuIzQcP5kch5z8xMr1dhAyAawEihIPJw6tUHOykf/Q?=
 =?us-ascii?Q?2iQce2zeW+01rxOFTuhSxx4sraJQflZyZIkrvqcOpz9BO2r5irCpemh53wgQ?=
 =?us-ascii?Q?P/vqMN7Aw2gbdd8/3EToBcPuwKP5y6l6h/15X9FYFNAvcG042SH8/PmB/PcL?=
 =?us-ascii?Q?vi4yV2hakBayxPEzCVJVZ7Xg71mP5nMSNkvfhzi/xex6nxrAplWlknuTTzPw?=
 =?us-ascii?Q?jpU7mmGdkuXvgHvY18CdVwvIQYhAw8b4fHLvCnyW0l14NfFqTIDzSGm7u+ya?=
 =?us-ascii?Q?wVxBszJWS7u0BCMfom1CVD5E+wi5d7gXg/KyU5CNpf4+04E+iMUjIsRS2+xQ?=
 =?us-ascii?Q?QOw4veQfIlI1wzBQJ5eMx7Oej2NJQ3mHWXHuRjMs6zrGQeXxSF+3D/d84KYk?=
 =?us-ascii?Q?5LqEpqDoUYoeyXRy+3oRjGul3mX6lO3dtfDXdeD0g6zFxQtBSfCQegNab/rX?=
 =?us-ascii?Q?yoWFKDY4RBhonU5TzMx5KCGGach9gaUfVL5xwIZzsTerx87wTFdGQ40q6dUP?=
 =?us-ascii?Q?eKN4DIhYIvXRjwakfwyurQ4mqbtAHaeqmTTUP1/YTlaKa0HjK+P+DGFcUGlM?=
 =?us-ascii?Q?kwVpEaOq2rcP85p5jJmqGq7DgJwknK8kaYpuTKx3fGgI6brKAGeu6jYpQu5g?=
 =?us-ascii?Q?8dkK/SKcEOjFHgUt+BNbqGhEqbSCqK7IcdaK5rO5H182dN/r6VV9+Rd2hS5A?=
 =?us-ascii?Q?gbYYL6F+9b87MKUIgHDfuGP9RHo/K+wxcqk1khJTtQRCD4mvtB9mdsl/HOA7?=
 =?us-ascii?Q?n9NkWxXUK/D1se4EQrb+nMUFHV7UnhMfsJrXK06bGx1eJFyBXjUZT006B8n+?=
 =?us-ascii?Q?K0YSd46+mfFJgT9qeklmlyXFoRXVzB5Gl4Utp8s8Uqn00qo2rA1e6pH2oDEB?=
 =?us-ascii?Q?wyONXIZ2XHK45fy3INnhoNsb8HY41jZNau6kYuLXy/jcegZHhQOptqjwASzh?=
 =?us-ascii?Q?Y2dqUJLcyoKeihCt4t2pp4zX3pJGSKs66gP5zL3zhZnq0f6qHeSvZzMy5TGe?=
 =?us-ascii?Q?e9i/9aTn2lxOnyLrtOLF6FFH6+e+4sFn9wQ2cDvz1UvH34gCfatBKOmXLRQu?=
 =?us-ascii?Q?A51yb/hXgfiIl4+uaO+4jMZeyoLg6F0FUD3/8OxhBfR1KVqjPA9dWNYshLle?=
 =?us-ascii?Q?EGQ2TKLrow7XXZcnNLG0N5OMTbC2ceynjMvCpjEdI8MkuggSDtZlQx04gTMn?=
 =?us-ascii?Q?dPbSRYdiW/FldzOvDkwJznFu2/lcN4N/a0cwalUhru5oKvz8M5mAucq31nZ6?=
 =?us-ascii?Q?CCZoBgVB1tsvXNXItXo9+BSzJNAmhFw1Hi35wxyZkgjsqtahpB+XjTrddt1C?=
 =?us-ascii?Q?VywQn0ozuiY+boEqVCOhUUmSSq2zSOXq7HRnvvabkid+dLYdlj93cW8MZ0qy?=
 =?us-ascii?Q?Xxr1LRPKZrEHjSdu8KElKnsucPJpeCQdse/p2+CV3b/i5YXaRisxaz09UkRz?=
 =?us-ascii?Q?xVOgFKb4XIgGoNUtLusadq5MPGblKU1m8D3R6oEbI5ra0WyAZ+1WaILb2QB5?=
 =?us-ascii?Q?5QTy+kUhaButrWycFzqZUyY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d8e14e43-270e-4c3d-2e7a-08dc7acde5a2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 02:13:12.0354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2De2uE7xQFUW9bghsnMCMP+qfh+/WXV2jpMPxG0a4XAh+nBmx41rPUa4+S3N/mad/T6q97HNW2Ds88U0OrO9g9XJVXvsLjJOUHNSZ3yZxh/z0nVOL5PM0DXbxcX9UBGi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9434
Message-ID-Hash: 634MV7WMDHYU4LLHKR7NPESYRT7CHAEN
X-Message-ID-Hash: 634MV7WMDHYU4LLHKR7NPESYRT7CHAEN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/634MV7WMDHYU4LLHKR7NPESYRT7CHAEN/>
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
2.25.1

