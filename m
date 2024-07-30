Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BD3940315
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 03:06:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7C3782C;
	Tue, 30 Jul 2024 03:06:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7C3782C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722301618;
	bh=GLTttUg063vXHJRylgU1noA6r3NhEhRVQ3L0YGxmuK0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ms8mZtSEbEea4nicxg5404NiBdNRWkr+3l8FuURnIQoO6wW3trOguq911vQA3Ytue
	 YHCXvCXHPnccro6ndV/xTDnFaGjvM/z8pM6RNzudLQHM65djVMSCjtrGbQ5+VYqe5e
	 iN8ZLZ1n49Zuq7jSMXGInGWYcBAgd1cQG2QjFSEI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5522FF805BA; Tue, 30 Jul 2024 03:06:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5184AF805B1;
	Tue, 30 Jul 2024 03:06:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AC7F7F802DB; Tue, 30 Jul 2024 03:02:45 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 01225F800E3
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 03:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01225F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Vh6/AjE6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3db5tmsVKdS+NfK1MeZxg85q3jiXHMt/H9QuO/2eYGX4/hAw/q1FIhyplAkG32AfAXXi0SB8BwUDA6nLx6LUC4Urh6L00xE2OGp+DUONG4IY3u23rpG5WiVWm05hrwJqEJ0V0fm2zf8t8UXAvpgoV04I27iW3uwTAw532bzMzOn6Bo/qCyFZQQWTSwm6XbImq+eWOuhQQedRE3reMYmeJ9KzEo2Kh+RIINJjs3SQfWKsb4VgJK+KqhCSU3F5QFbwZIqrZ7xJ+BNfXNHuVGoA7sVVz+M9mkTcM3oXeLa0zzMndsQfn3VS9jeT54WsiDh6Fxcig1jaIkajrYuWYXtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZlI5hnmne15pWgb6MdOl92WpAgAkcXV9OlOJ9ZQOnE=;
 b=kSdM8OKcoYhfP1kD9aBqr0SgOwT9Hx5/ycc41RKJVKUwc1rgC3pnMD/uee+if+g+hXODUmUYljpfaGMk7qs/FYKG3NFYfO25n1y0iyle46HGP+f6TWvlBiQCLe4LUHr3dbRBugW1T1ZcMl059wsAc5eJT0UA+3mG6v52z15l3dUfYzCYKAVH16hHyuSBJf+vbTOEaKuqWBwVEpXlRbZA5mkc347wCIBTxH6Sq8wlSDYKdhGbE+lsSH2Rj2gTuIyJVjFd9Pw05RHvArABuZ3CNVJRCQOc+2hYRXb30QfWx3GtKJKwq67amhs8djZpcBR0iabF4MSVWYLD+jyvpSSRbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZlI5hnmne15pWgb6MdOl92WpAgAkcXV9OlOJ9ZQOnE=;
 b=Vh6/AjE61x3AEniSMfeyPyEJ56OsF8yNYRUmZDMlPuCpSC0WpzRQDgFCwg1hM0KYyuChy+vlrOQgeOKGJEtH+XV/kWhxkU6e8ul8++g9prZLxU2zrAouwgPQqemc1Q4Z9xihOaZktPi6StrFOmTExID4VY17OUtwqLH85A6kLdY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12484.jpnprd01.prod.outlook.com
 (2603:1096:604:2f6::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 01:02:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 01:02:26 +0000
Message-ID: <87bk2flmjh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 1/4] ASoC: soc-pcm: Indicate warning if
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
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>
Cc: alsa-devel@alsa-project.org,
	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
References: <87cymvlmki.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 01:02:26 +0000
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12484:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d37d5e2-9981-4d2d-d25d-08dcb0334768
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Nporgj2EhP4BdIBAUlkdm4YwkxmwCmpXytp8Xm+1bUG/2QehpvdpRyXcDmpA?=
 =?us-ascii?Q?Bicd4ggneqR53nsz1x30yQc6KJlI/eYAaFDb5L1VPCYzZmKu+Kxihe9PlldA?=
 =?us-ascii?Q?BA06/rv3eY01c9Wf7dO4y/6Lk17Yn0GkkjBvG77wnkyx/leQ+9Y7XX2K6dIB?=
 =?us-ascii?Q?Ie4tnQB8FIYlsGQP2Ykq37UJVkk3rYHpG/K6hWS92aoTspD7n6kSxFSgvSvX?=
 =?us-ascii?Q?cujmM88ZQB9MXpl52Seos1HqpUNWUIc2t40wRVH6hLqEhx8P1hHz6tEdzOnG?=
 =?us-ascii?Q?N672aqJTaJS7seuo//E7oN1yXlXohbTXBOc1zZ0XB8svOKHoibmopF1csPoY?=
 =?us-ascii?Q?S4ZJpbHcdfSqW2jbvcvDhTEEkaQexcnesYqshWu1N+DDifa0fWRC6m7wO3cK?=
 =?us-ascii?Q?rYoJtHAuvY5Eq5q8ZGXSxE1Rfay9k4jMNwIkq0WwxcdWdiFR9CWh/PGvi2oN?=
 =?us-ascii?Q?JHm++68h5ybR881cD1J6Y8dCmAneBwpI8tsPQj0W9GeCsxrrYqwmcM61cT9D?=
 =?us-ascii?Q?xlBdDzOrjg+jE6QxjHtEkqe1pfvq6UpYbMCQUHwSTReTOQmh9aVk+DVzPI13?=
 =?us-ascii?Q?9gJtXh/0DVO6o5IEfx/9XMJ+iAqCw2BgSBirtCCoizkHFy/LtdK0LggKzBmW?=
 =?us-ascii?Q?mTQyZEOeBEwE2VJ61P82IJO3kNTbYkx9IjTXSlBaufVem7hkLNTIfc8ucO6m?=
 =?us-ascii?Q?GdEfangHUe//QV182TtqXjbfyx3eITL9YX3PGUROk9PJRiYDPHkm4HBEU0xq?=
 =?us-ascii?Q?lH9pj6qdPSyxjDwVuQRM+XYxAgmBNM3KQ4pK6TCsqTsjEXzmmMBFgm6Fdkk1?=
 =?us-ascii?Q?6WdULPjRtJk+QA+Cidd3gEbWIutSowAF+Uv53pOSCxrW03J8xAQwTBbFNpbY?=
 =?us-ascii?Q?INlHWYiZrIlwv+dtaOheg3LqUhKVA7jjJtrISPhy0ylSIgH4slHtJ/LWH1S5?=
 =?us-ascii?Q?AWinc+7Aq8LgjOkmilm1HeTQ+RIkPkMv2ERoLp9u7qJ2C/UqXiIdOnZI/ivn?=
 =?us-ascii?Q?OqISx1cAv9LU4wTtRGgtsVOUmupC6VA7U+SttmX1C1GynzYKcrbOFsQhgcFL?=
 =?us-ascii?Q?aX08hDgcPQwbEDThAGSzNeMzbQvPCfxrZPs7D56P3Ts0KnHmHQa8jQCNa3jf?=
 =?us-ascii?Q?ShnWMy3b8Ea299T+7Fyln+GqrRgW+mh6l/OT3lW3rH6FFA3RstOPM/9mhBKO?=
 =?us-ascii?Q?uVgIdHTqQ2gGPoxNQ7BEDM7ZQ77YDtV3lTXruUrMJt/zwWAZMSjgHG6+YEAZ?=
 =?us-ascii?Q?5S2djN1GGYIbCThFVDznESh3b6pttqOjHosaLUXp0dZqw89m1E1QmiBfMm9l?=
 =?us-ascii?Q?ACo3bc76XpGCniiEuJ5Y1yyxSQD53J9mo80WV+RJm0fwQvsIGJfr4fREcYdl?=
 =?us-ascii?Q?n6H6IGHgbV8THGly6c8qrGPTBtN7?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O9tfFdGWzZJr4U+7CWZFKa5r9QFRpR8bW8zYYDtw8CFADHr5PxbERl7S+td4?=
 =?us-ascii?Q?GNM3jQPlyq+SfNdWkU4kDmeeqJmWKKifgN5K8ZSp1OR7TjoV5/as0Zs4EUPg?=
 =?us-ascii?Q?3s3CSvgLRkxgS0h9h6+qmOEXK7/U6EPPzLYKn/qsZS9nuW7f2d2B1Z4hJig3?=
 =?us-ascii?Q?C4rN824X53kINpFaQ0Ni6+dKaHKC1zRs4cIJqY3zu6YltNGy9Pv+vsKb8SjU?=
 =?us-ascii?Q?+N6nczv5AzXMkYJcsrsRQXimc2IyXn/7n5nF99ogAF+0+5PMEuJ188LTJqPa?=
 =?us-ascii?Q?5tbO6MOhAF5JqDcCVZmg20DRl0KCmEL0JoY7AQSurC52bR7rjy0qUqxLrffN?=
 =?us-ascii?Q?w/m7LumkdWugkxj1TFX6DhJu4PxT2T/2GyHDwANPYr3jXH0bMAmqMJ4cmTMJ?=
 =?us-ascii?Q?Kyj2Hkq5RXSX14Z5N02SPNtWw7Qa63AGAlhpqGiXvn4k2fDV4scgzggWXnM8?=
 =?us-ascii?Q?fr76Ga+hk5PP6dYg8qk3X/x3AsNyFRC9ALq1mM2YBhXi0H1PvW+UeYUTudWV?=
 =?us-ascii?Q?lM2OCYsUclGdJAG6cK6hKc8RA+5i+B82w4ouvETjcrA47z6wbatdx4IgiFpe?=
 =?us-ascii?Q?oSxU0ADPbpr+fN4nEwbzfLsO/Yhnb8pvYcxdHbIR5iYv2WOn+pSK3WfZ7eN+?=
 =?us-ascii?Q?eFqhxiC9w4eMA9KBCOB1i9UDauj6rLgEMFWL8kgOi94FqZagrtlVWkKKf8zk?=
 =?us-ascii?Q?z7Wz9jDjrT8PzmnkyemSAGji18zoTS65aWbJCLYB95PI4n9vcBH2kyQ+4muy?=
 =?us-ascii?Q?XN//bimXFKrPyNdmA2SUCl0h6j5arkkcQPCRWYP5zqyecGeZWBCbrkmhgYZn?=
 =?us-ascii?Q?yZux7zo2vgqNfDbTmahWKFGWZ/654WJlqb2Hsm9eNy0flhPzEKKVV/Qa0Iuw?=
 =?us-ascii?Q?7dIHWiLV5exzIEOYiBDFvUGgRmyOJ//9kbIX4av6X4S0BTta6BXLP9joD1dg?=
 =?us-ascii?Q?FwYfbvNy9ZuCp9GYwRvImw6FRCqbYX68ucLvZf+LPHsIR/hSxCOI1SAz3CYT?=
 =?us-ascii?Q?0Puh7PEz00se/+Wa/b//frzEmVCqAhL3RKqM7IZvF62QVUHZLPkVTNG+DNze?=
 =?us-ascii?Q?cz3Gi+SUoj5Hy1UZ+59zh1Zywlm4dnFevyuMqIAQC2OF9Nl0DpyNAYgZO4fy?=
 =?us-ascii?Q?3WegSheQ2RFAUJ/JiQqP5hOAS3KJuygghi1fWCIPSOG3iPml5wE8o8duRc3l?=
 =?us-ascii?Q?/r6//5IJ6e2RSktQcS1k/ChOtFnuFWRDjGZaQ/mIgojoCj5PCAitEs+yF3wH?=
 =?us-ascii?Q?XSj4a1O38uV4oJEOhAbJ4UeEv48wGWn/Y5w0dFtLjhBf31Q5/3j7tFi02D6u?=
 =?us-ascii?Q?JrCtgsCP2Q8LyBrHHa6LzAn5GfGRbTBBY+LXButtkycNGH84KwqEZrVNQ7sr?=
 =?us-ascii?Q?SxgVPw/JArQvrWjSDWTiGYUkRo94QSbUEVODV/48eb5cH4ByvREDzDXTYl5g?=
 =?us-ascii?Q?rJVVLhcGLrv+OIiUIaxMuRsksSakwq+C23VyKw3kdbgXUQ612lXaNh3gPHvW?=
 =?us-ascii?Q?t5YQMMqkKcVb8A+q5VBtkehqRnsjsCrLXHcfRtYEUk44BoNno/hcxYFx9Z/d?=
 =?us-ascii?Q?hLxriXwbKLN1vifA1TlaCBh8x6a1fAU6K74b7Bq856od7oyM04FrYt4wCylH?=
 =?us-ascii?Q?yE1VjCNqiBCMfvsqRiw9HLU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d37d5e2-9981-4d2d-d25d-08dcb0334768
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 01:02:26.8652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ERKZPD33+Sx8a0eI1A3Z97J7czjky0LYYoE2fwmbEI0Qx63+woY7LNCenVOPPHzmYWHB7wpJDQXaVmZ1JD42co4h3UsAQ0AGSMlFzBUbsBhX6E3NI4JSSdUy9l1Vxj7B
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12484
Message-ID-Hash: Y44DUV77ERMIHZIYDQWRGQWOE2A6LR2J
X-Message-ID-Hash: Y44DUV77ERMIHZIYDQWRGQWOE2A6LR2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y44DUV77ERMIHZIYDQWRGQWOE2A6LR2J/>
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
index a8e66bbf932b3..abd27d2f42e2a 100644
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
index bad823718ae47..b1b35e4d35d70 100644
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

