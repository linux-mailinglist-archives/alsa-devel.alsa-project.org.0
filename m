Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0798B8D42EF
	for <lists+alsa-devel@lfdr.de>; Thu, 30 May 2024 03:30:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 015FBE0F;
	Thu, 30 May 2024 03:30:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 015FBE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717032650;
	bh=bfl/JRU0+6fz2tWj2ZPZ6QzVeJisjemnLUSb0s+09Ew=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=qtEcRfzL/a1N+R6cjJ5SRpTGIvja7Lu2k2Uzlzl9MH0uGOyxp83lygfQo1ZucDoyT
	 GNtj6hg+WFAEeOYB0o9uYDpZtcSc1geXMrE6+01bLhWHViqGGTVJIHplsLhR52ucVo
	 EfSX+GEYfsyywyWcYYEvPOJTa4NYC9Z3JNqNmlXw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EED07F80637; Thu, 30 May 2024 03:29:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 531B6F80637;
	Thu, 30 May 2024 03:29:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58EE8F8061D; Thu, 30 May 2024 03:29:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4245EF8051E
	for <alsa-devel@alsa-project.org>; Thu, 30 May 2024 03:29:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4245EF8051E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Z3gnyfDW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ie0pi7UR+kyRo3snePKK8fwXidogb9rZBMJpiBvw8PdKwvfa/dCAtNQMvrKf0n8GvuljNWEZqStltPQQnIdkbbXnwyJtzhuEDeb3ThTtDlP/JfxhsmBzVTJQ2KCTQKta4ZKhoz3LRc7xSuonuwm4LLwpAlWTTwb85QRuZRFPIP+EdwRasZFCYK4Wf9956GuJ2nQbmrKdTrOkglJ29nK/m3s+kdj8GhHWIRT5uYpa/quAkznTsmi+Nq539IocESHK7Qe7pCj7fvOlMCkNfSCDNxwKQAxDIVkO/ZyMJ0XMh6zxD1Tokq7D6l2sx1CelGE38atiK07h3tOOzljVL7Jyog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M0EBnAAZBdkDfxlXMTl7cfgx8vZN92k7oH69sZV7pHw=;
 b=k+plAaUCxT+ALyrLdVp3tHcEwOP6KWMHpqcv5JIyj2TX+5kmDOXYmdHNXmXlqR2W0fdirCgotVRpJp7m2R6LezHfAIlUHtcaNpBFzd78gK+d2826IuFufaatcACeAd5wG7YFJfK4rQnp3mZAZPRRbc8uBcWvxlYx1EUVBqI6F4cGfy2u9vWjKYT8WXNkGRlBw0UCyvgoiENSLarTFQne1dNVhL3I8HjfYCmHV3UaP/7MCuE+NvH/4P5seqtIfvDl/7AtE7aC9a/k6JHYgKIMLMWYYu4h8nlfg04MkW4AnGM8oojLw9cn1ZHrebgffgsWf98ydxCkT0UEAhz6afOZUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M0EBnAAZBdkDfxlXMTl7cfgx8vZN92k7oH69sZV7pHw=;
 b=Z3gnyfDWcyTqEmJonCs1KS/jnKaC/WPjJvnul9/3lO2Hqo1c2XsIixXv0aehJIkuW78aKC9PD98osHOxq2T8ZKjvZKpn0YSfOQZnXiColNUTuIhrcpH4MH9WGqR1Qy9sB7CGjhZMvdj8iSXjZxYADCRU+OCK/aK3ENNnrlCBwPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB5524.jpnprd01.prod.outlook.com
 (2603:1096:604:a6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.21; Thu, 30 May
 2024 01:29:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 01:29:16 +0000
Message-ID: <87wmncozo4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC 05/12] ASoC: samsung: remove dpcm_xxx flags
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
Date: Thu, 30 May 2024 01:29:15 +0000
X-ClientProxiedBy: TYCP286CA0091.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB5524:EE_
X-MS-Office365-Filtering-Correlation-Id: b572e3a1-1053-438b-a44d-08dc8047ebaf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|7416005|366007|1800799015|52116005|921011|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QELEQIQKgWsrhH01axNYQZ/qx+Q68pHRE8XyPaaJcBRh661lu857pQEp5hMb?=
 =?us-ascii?Q?1bhA4CeCR7eKWTt4EUcjw300ZFi/Mk+D6wxfOpKe1rFIe296WQoMDAesH4B1?=
 =?us-ascii?Q?b2xBDaeYIadRfMstm9J6oeJUg5Ib4GKt4WTTqR510+oKf8ATQaRcUadZrSmB?=
 =?us-ascii?Q?KUOhyfljyTd/IilxI+NYsCcLLfX2Di4HrtIwsQWDmOpzTU2slrsBACCAl+kr?=
 =?us-ascii?Q?1HVenhCniWiLaa7gh4Wl1Yi/msOKYFYm+kK4UH8pLztBnLAOk3aImm3U0xgu?=
 =?us-ascii?Q?KlSy0S81W/uL/wsQZK8jKQyyi6X1GBGt8ZY0qaHvNelYveyvnCB78wd3OiYJ?=
 =?us-ascii?Q?RTQGoLeQRUtZzK3ihK9g2L5qwBdFIl5usuKiGkde/E2rjrVW7+y0QcO2jnX2?=
 =?us-ascii?Q?yEqJjaZHuVvBCzrD/3IQoBdal0N9U5pN2nQN435OdIFKordTRJEfoxfZOuDO?=
 =?us-ascii?Q?wUzgt7rEg6WXP2etDp3ZMyMHZpgHnE6zcrKe6U1gPa5MSaN0qU5M0m61bg7X?=
 =?us-ascii?Q?Wk+djmVxsmbF1UH9hq8Uz9xFg/3d6Vi4gK1rn3QpQ4f46TE7ZJnFzyj0ODYU?=
 =?us-ascii?Q?m0LHu/JS+aokgKGt2owsWsY8Zp00ojr+FigQ1KK+NzszyFu8sZ/AHJ30Cxer?=
 =?us-ascii?Q?40JJDJFceJuqK/qL7Bxb8uDrAPFMVaTlKwDINO0Iaabraw/+CpAEybIjqTRh?=
 =?us-ascii?Q?pGRWWApvxWTr7MzcsOJMWctlERJofvGAKEYFgkWveI71D9v1DnRKJ60JMiKJ?=
 =?us-ascii?Q?ND43+dwdqcEzT6/zrbA2IdIrCDjT2N3ShweS6HV/M5KdK/PeZD7y0F+SZCBY?=
 =?us-ascii?Q?GDAvyFaoX/tn/RTCo3T0UZa2CW3GzgGr8+vlvOlXyDT0dOAq1M9umBWgP59S?=
 =?us-ascii?Q?GWTyP9bJ9VI8RnzGhLSEkPoIZwIAvszr1GjS1Ai+DayxpfCfl+jkqFeET8EB?=
 =?us-ascii?Q?xeRdPU3uZVYzQ9ihasRb3FCqZV0pJkw6ulg+RAduDXXg+nSlZb4A7kngyX75?=
 =?us-ascii?Q?eWCi/wCyjYA/jshlxVgHCM98eZs4uB7vIdJ73ZE+/b4pCxP1RVXFPkwGzSZG?=
 =?us-ascii?Q?YxL8YkeCYAo3PLa6jQ7yngppwJHKk5mCtPzswMtrpClBEsm3NG3HqbbBBpOr?=
 =?us-ascii?Q?HOVdFfNmi1Bl5KhhW/NSy8nhFzcZ4/5OiLy6YLCQhKvBfXnVpkKpF/QnAxIl?=
 =?us-ascii?Q?JTqYqSpiU//Ugn0r32GbKtiG1x7BSnEB0gKzx53Rjvg0TQUMGrOOxaxMc8nG?=
 =?us-ascii?Q?hdaZE+caxmZ4ghfWSCSEr1RlVJZfOvBE7/OOoqIq35e1SgZqZMi50cU6c5jZ?=
 =?us-ascii?Q?4gO2bTYWqkPjZakj3pLJAvv2HPADsbXFO/eyFbZ+FyjQpkTrUvNadWjBbqRu?=
 =?us-ascii?Q?pOZKge8=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(366007)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7T7uFmW9flNT2E+GvTfGUHsse8+BhwSMb4kl3/Dp2g6yANxHP73VC19oW8Co?=
 =?us-ascii?Q?dC3QKpMkS65mIxqBgctXmSVZdaGCKA1owqVSH3Rk0UDvoID7fkIbKNQ+E+Yf?=
 =?us-ascii?Q?4P+HUa2tjAu5M2VMscL1nCF5H+FA6pr1zkd8O+hUXhMAHW4ZWIJ6P7OMwskO?=
 =?us-ascii?Q?JpRZNgfC9O2uuxWH/0RWETbCu8ZTA0dTJuT6FbEfrb3DoBIbFfVqXDL/E/sd?=
 =?us-ascii?Q?aSgAoOJJ+kOc6TJpigOmFgbGxRW26n9hr7Z1/yZPf1iBxy+6h5gUL1FEJ/m4?=
 =?us-ascii?Q?3QBFMq6q5XREDs/cL79iLS0mXBihJ1fvSd2jaPZQw8NUMEKjjQ+PmBXSzZix?=
 =?us-ascii?Q?xWeO379ZwoEJH9vu+ULj5RmfrzgqimQKER1Ha0d6s7N43g/CUjwrodYwdWWE?=
 =?us-ascii?Q?AbHwp9IexefdAqlIXR1IH5eKHZIdGIaT3r8q0iEauMDlH+rWsKjAGMPnynrA?=
 =?us-ascii?Q?qHrqIbH68xZMh2SX1AwxMVt1DHuym4XEML9EzG8iL9k+mT6WF3gkGELxR5iX?=
 =?us-ascii?Q?A4Hzm4BMFKJ1ybmoCDXc1Bq9mL8x8Sxzmm/ZMoTRbQCmmODshu3LBIkPmkax?=
 =?us-ascii?Q?wVFz3sJwOzNtYkHA5MavfqkSPlXR78gWao2R19NnGmB8QgtI1wXzAVGCLU4Q?=
 =?us-ascii?Q?bQ/rSdoGloQMmenRfnefVH5TWHdMxEKPlJ3k0B7/EOGmfY+XlPdanOx7sXsT?=
 =?us-ascii?Q?v3Aa/ZuDEEZzJsrVuvwqchA9KScA737axjsf4Nk1M+76MJy/MaOOoprLaiya?=
 =?us-ascii?Q?CE4zPQJtSWM8V3zhUzmGCWWRpbYPB32P5FQTgHYBxnPJNO+YINQe3uthEqTA?=
 =?us-ascii?Q?VotEu84qX5OMhyop024N+T61aB6qiPHhna98HlIQdDThegoRfFswp0UsJZFB?=
 =?us-ascii?Q?8rbgN5Zk9UgdVuD060UOlr4Ic4IWnfHv/U8leX6OVRpkpLxrmpE34MiS38Hh?=
 =?us-ascii?Q?TN9nIkRlG7wndlmulK+5vkjYQ4bBEzujVhG0p37WpUXF7swYkjoa625cqMRd?=
 =?us-ascii?Q?foX66InvUYcGJPrg7FLltA2utUzvVWo4yBkciPnsJSlKPuHQ5oQikLq3Gv7Z?=
 =?us-ascii?Q?AG2ALLT3pr9osGFl/niUUFNumsgPK8rZFlnsMwnZ2dosmDI+SNTVjEY3OH1h?=
 =?us-ascii?Q?HofrtJhcwY9XtX7gZQ8zJ8n8HrOyQwK7346mik2Nhj/e+bAD/7tuuI74LLyi?=
 =?us-ascii?Q?KGQ7x/ieBNyXbh/usr3raRy47nmcqDvReXqiQkaqqqaMcHGD7Uq3mmgMhcle?=
 =?us-ascii?Q?3H3pZXwNWWpxFVgle34WCXMxmGhjAcqZXUvW7pOmjDZmQg9k03GauT7Bjnzd?=
 =?us-ascii?Q?0aOpI4PdhvMCDjLfRMzugLN8YCO4wtdy2SGE97PCBmVpOf2efvwFhBtEdOTg?=
 =?us-ascii?Q?YYeOj9xKUASbEFNohzrTBEaXpUY+8GTncYF6sf/nMYZt/dTtAmwOG1aLTuSc?=
 =?us-ascii?Q?R88k2GXXHkNEp//HVriwTTjxclwWf9NoIh7lXDrIttctCvuihOYTRYarkBfb?=
 =?us-ascii?Q?qu0fwbPxnXcsAzqYEU2EqZWaGpAPFMRonaMRMLeXgQs6/zjji1KmPWmmBCKm?=
 =?us-ascii?Q?c6xsjb4XugeDFPc96NAzk1PPizoXIGxjqMTK6NB7rAj+vJcLmp8W22ROZqAm?=
 =?us-ascii?Q?Y7aDyHQeQjyZ4N9oC1r4Bj8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b572e3a1-1053-438b-a44d-08dc8047ebaf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 01:29:16.6590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 E0tRFgbhaNOUIGLIYVKhNr+Ijfp/vaN1jsyIZHBRgIhYtEnFbWfu1SJzyxHfaQB3GHZcmbZHgrTjRIXlA9do4UM3n12XpamwO1jme1b+eU/19cTzjm4XUthd/W0nbxFy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5524
Message-ID-Hash: 2SVNL7H4F2ALDJ4MUAOSAMG3AOT2AICD
X-Message-ID-Hash: 2SVNL7H4F2ALDJ4MUAOSAMG3AOT2AICD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SVNL7H4F2ALDJ4MUAOSAMG3AOT2AICD/>
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
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 110ae14dd7eac..8489bf4dd0704 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -171,14 +171,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -189,7 +189,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -278,8 +278,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].playback_only = 0;
+		card->dai_link[1].playback_only = 0;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.43.0

