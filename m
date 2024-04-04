Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BD9897DB3
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Apr 2024 04:26:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43C5F2C63;
	Thu,  4 Apr 2024 04:26:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43C5F2C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712197589;
	bh=nT23ThxdTEXe90WlQLM6HHibwhWKcVoRrqZocQBxNL8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XALv0ZuYcnkBWXadoFsNUMTflZ2QWn8TATWK6UWvrgjc/zOuxsxMnH8VFswFRyWwz
	 VDGVgV7AyPEHfZcfTfiWlfkr7ZLoU36pTn7B9h8bLd1rDP1cBQZeeu5Heiq7NHtWpW
	 3PbbzZcCKsR+n9LV5U41Zlmo7R3+mJLBzml+l7B4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF32AF805A1; Thu,  4 Apr 2024 04:25:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D33B1F8057A;
	Thu,  4 Apr 2024 04:25:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2B1D0F8020D; Thu,  4 Apr 2024 04:22:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 823FAF80114
	for <alsa-devel@alsa-project.org>; Thu,  4 Apr 2024 04:22:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823FAF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mMqmd1lF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWRDNq5qdWmEPer/1PCi2BOurFLTg36fwJDUEL1c+0jQBZN5yER5F/YqEquZMM8EwlxUTsm5l5Oh5ZO++eO6PYhiaNxo2K33hVlUY2WKiagRqzU9tFp3CyvbzaZe4B3YCypgmXh+z14Fh4xv8p5AWgoRfdM/oVclOBc9Puj2aN6JknxBy/fZ1Hs7KdQIoze5GPfEn2F01YzWuZ90t2WxAwNq+bFVQUWGbC3t33voODB+s1L3d/Fpbl19UvoQVKUsMHvkCa/chA2KdTqpSSC1jhRgiK1oBuBXmnB6ByRPhnRfMqAjbKUm/kTaKg3L/mQyN2TBG8VvHl8wwfxECt7N7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XH/zQQNEZzMfhpkCJiz5JeJw+q89TH6O5ykQrdLETbk=;
 b=ioX0xwDBMFNzV0P2jgUu+WBRUEg4wYqGhiVp0bf4FMCFVCXCMrM+T5VDJTd2JOWliGeJquehb3ZK0dmp/wEsc3SmHYaUbywX/cDUwk3QQAsJEhf0eN7jpFutVQknMR/PDuGahjArAIlMqtLL0V9GP9PDmVZ+kOTxoYC7mAv2M7qZ2mc2iS6BZIsttiDi6RjQyhHWPn/mUH/W8CxFN4cB8o1Yk2xHzZv5YaCE2bZrQNSx6ENm14ZVhnQ7L0vtHg7kj0v1pI2zeMGKO0rXxaia6D8X9Nnh4AfSX05KysMjgPDfN8dzKnY8NM2ENlNNuJKP3E23xQORz8+zKqj3e7J/YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XH/zQQNEZzMfhpkCJiz5JeJw+q89TH6O5ykQrdLETbk=;
 b=mMqmd1lFAlGj2H+V089HWT7O+QaFd5Zbyvvp+g4/wH32oM7dBbvlog9KlA09fzJMYWG3SAncqMXYIE4FjLYWwMLvzsyw8DGOXBUuGIPa4a3OFPKDiohEtCaA/83JwB2m7beyEwWk69iK3MshRQ0V20Gbzx4sf4QvKIDHcDYd/zE=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB6277.jpnprd01.prod.outlook.com
 (2603:1096:604:e8::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Thu, 4 Apr
 2024 02:22:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Thu, 4 Apr 2024
 02:22:24 +0000
Message-ID: <871q7l989r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
 Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav
 Kysela <perex@perex.cz>,	Jerome Brunet <jbrunet@baylibre.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Kevin Hilman <khilman@baylibre.com>,	Liam
 Girdwood <lgirdwood@gmail.com>,	Linus Walleij <linus.walleij@linaro.org>,
	Mark Brown <broonie@kernel.org>,	Maso Huang <maso.huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,	Neil Armstrong
 <neil.armstrong@linaro.org>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 13/16] ASoC: remove snd_soc_dai_link_set_capabilities()
In-Reply-To: <4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87h6gludmj.wl-kuninori.morimoto.gx@renesas.com>
	<54ace545-8cdc-49aa-8214-5f07bee0e2f6@linux.intel.com>
	<87y19w7gjq.wl-kuninori.morimoto.gx@renesas.com>
	<4c40b4bc-f2bd-45b7-8b14-456ddf1be94b@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Apr 2024 02:22:24 +0000
X-ClientProxiedBy: TYCP286CA0110.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB6277:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	K/wiB3On3Tta/jllxj74PSD2c0EdtFt1aA5wjwrv6SLu9TWwQyftsaFwN1mDUKLg2j9/U0ST9l8ypN+d0DnD31aSG+7y1O9C1yGWx9sqqHg/hxbM2QiThqzx0cYvu9ns4+GAi0KGAz8F+RWaxvyAKMh7Nh/b3d7iyFpkzhNKvwDGiVd1wujxnFuffnh4C8dr2JzpKQJuW5KBz32i0LAz1Lrimhh9nQmNZNSWsc1VvObZbjErWvoBSY9jk6QUz/Ng7WBOAOOj2K7sLFSKA5rEQo5qxW50fZi1gm+Lx/LDV2RGDE0OkP/6symB1OpB5ACka0LxeZ2/9czloRZbemDg/oJ4xD+GD/SMuRlWjN5m8jREkC/G/VICX2pf8E8na8u22OHtBwmXMPloRfb96qtr1uSBYrSGNW5qidN4P2meyQ7b4Y0I1iHLE8uvdpWC9fel/FvX0OYJ0WG5oPbF2heRYR5vZ22tWMW18TZOZ3rjRWFEFna/aEACKhEAvsjqn8f101TXuXdE4K8/y8xJfSY2YGDmD9GgXUgmA/zW6wOhFAVj1Q2LLU6swzZHRsfmiDmHlnPqBi5Kk3oTbhfrdE77Mojb4/b6LG8aZ5HnFfFGdoUWmcVEXWZx7tVqHXfnRAimYtvI3A+GZz1Iwpp0Vps1wReL5tO6Q8l5DKMxCre2f0VOfg4u8hjxAoJLfcL8LrVvaCoEr4dAoO9Zh6c5uwbeGP+cFesT222t/AjwDg2ZfRA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(52116005)(7416005)(376005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cAQhYpAgu+SqiUm6lGzi4h4VtmER4PQx5uc9OU1Fxs5YqtqH91eoABpmCo15?=
 =?us-ascii?Q?5YeO1Z1tbSWEVnZrjn1u5qsRx3ZRcHgfHy0reG+I+txlBDXjr2PHxzS31/cw?=
 =?us-ascii?Q?JaMWvaNX1s0dovplOdPQnabDMQJYMn/VBqRo9OUwMEuytTlnY0RXezERTi+w?=
 =?us-ascii?Q?taDL0idvef5YvYj5ZIKsPoX2pa/EN9/E5qxzH70AnucPexO1yNXbUPFxscnf?=
 =?us-ascii?Q?vM7/E2mYCPoMvpfJdjcbpcIz6Px5OqXEw+MjwBFoYXlpn4+CCB4eQFFbPol1?=
 =?us-ascii?Q?HN4lmJtT8QRc97k8D8igcWmmqCWX4AmzwKkRkW/X2NVV7KrV3Ds7aJw9Wf6/?=
 =?us-ascii?Q?t0+DnefkPSJyvRkeNjCCVipHXmOlWdNdnZ8N32vdLCA7lSpk5D+cMTisjC/S?=
 =?us-ascii?Q?hXwkL77xkUY5oOcQwuho6xS09sAN298E17Q4n3x3tR1XhSISs/Eh7+UGh9Qm?=
 =?us-ascii?Q?k5lvMFp5cl1mn2OAwPmf/+97ccRz1gquGCXunpIkoAsgPbF2nnClgLF13GR5?=
 =?us-ascii?Q?9CvkAxRTJbU46ALdAcpsJ8ncytpwffai3NtN5WyTvZQ94qJtzFoKnMDCvLpr?=
 =?us-ascii?Q?KwAttmPk7v0y1gjfCyyFJMRLm1SWvIGrP3AHVQGk0b+E1GuC3hZ5X745NrG4?=
 =?us-ascii?Q?ze1m9EW9QT10aUBWTXzSTTAK4CHm+AQeSCDu/R1rhIDFobvLBbcI2Yo1zac7?=
 =?us-ascii?Q?heF3aarPJLvg/wQCZddBgPEWfFuikk1wqVNLk8Zhz1zSFjRlfHRSVNSi1ilY?=
 =?us-ascii?Q?ppvEPJk/6KbJHZVFRuUdqEiEK5pr9QbMQSi0RlSorPSD95eel0vNTET2j2mX?=
 =?us-ascii?Q?QhzWj3ckwK7IpKrY1u3VhTDaz5bg0xqrvabjhlcvmu1ePn9yeghRhMMNATUh?=
 =?us-ascii?Q?bdUImtFfNBLPF3pBn8cEkS/DMtGSrp+Ks3WvcgTJpY5xb05ae/uGrr7BBOGh?=
 =?us-ascii?Q?o077U4Jl/xxpFO4Ne1VJ1kSgP2L4CuOad1D0KkzM2zF3Y+xqRNREKWaLfMCC?=
 =?us-ascii?Q?Q/d7/HV/sUZHji0fnodt/7/Uv7veRpnQvAp2jf4JLXj3Dh4A9bk235MwNUub?=
 =?us-ascii?Q?swFv2/BufIXKhb2HBxK8kZVBBj/C/NhMMtZtkDzGiLE6ZSNOEGal1cIgI4Yh?=
 =?us-ascii?Q?SryzcOVURsy3PjWA47ktUvZeFQNezY8CwhlBjczGbzZxLBXMzUxZhaYrY9SR?=
 =?us-ascii?Q?BStirjheptsYXJbsKOD51vg1iRVJr2++3EzFW2hTMWLTfpSqXidz80cll8GK?=
 =?us-ascii?Q?i5H39NDVR1YTyV4urTLZLXYUCUjZYk/jYa7RqM+eIv69CJdvcEUMykdj6Mfl?=
 =?us-ascii?Q?k/XcIiecgj8pTUo0NPqDuZ3gQGInbdWdC3FRFF8FPp2/11jquqTEQcNIEHXm?=
 =?us-ascii?Q?rfOhd0UVvaUpLKvkrnXWkKAUSAJFuu66L9DxRfvOoOlqpc69SAsMTv2HHyau?=
 =?us-ascii?Q?D0U8kKYuP8PJ121PDE0jUZTX7B1I8BU8P+fYYZ4xRepQfQboF+M+MdpauGbA?=
 =?us-ascii?Q?qYdsp7ZFlcTPTNmWZWtxBJZg40kNds3yyLr93hzd2HScd1OFT7RQOsaTNoW8?=
 =?us-ascii?Q?P9QI+By5B9bmkbluaPb6g6m0+wlM39Fp9Sx/Y1gvn31aSM62w7ABdRgoTQXG?=
 =?us-ascii?Q?ll7WpwnHXLJxS1BtmWXDEhQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 44aa97f9-2faf-44b9-875c-08dc544e10c0
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2024 02:22:24.6409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LhtESW9P8mUE+HLcgZA6AXFwB+a86LEeW8RwjBfGPluILUxiiX8JMJSqhVFHTUfqohpE39C9rRdhV/sbFfwgPpYoB+cd8O0/2Y4IKzsWdhjShTgR8rA9+EjnQ1ZKp5KG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6277
Message-ID-Hash: 2EA2ZB7IBKGUVWOUVMGCYO77MJICLCVI
X-Message-ID-Hash: 2EA2ZB7IBKGUVWOUVMGCYO77MJICLCVI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2EA2ZB7IBKGUVWOUVMGCYO77MJICLCVI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

Thank you for your feedback.

> >>> 	void snd_soc_dai_link_set_capabilities(...)
> >>> 	{
> >>> 		...
> >>> (X)		for_each_pcm_streams(direction) {
> >>> 			...
> >>> (Y)			for_each_link_cpus(dai_link, i, cpu) {
> >>> 				...
> >>> (A)				if (... snd_soc_dai_stream_valid(...)) {
> >>> 					...
> >>> 				}
> >>> 			}
> >>> (Z)			for_each_link_codecs(dai_link, i, codec) {
> >>> 				...
> >>> (A)				if (... snd_soc_dai_stream_valid(...)) {
> >>> 					...
> >>> 				}
> >>> 			}
> >>> 			...
> >>> 		}
> >>>
> >>> (a)		dai_link->dpcm_playback = supported[...];
> >>> (a)		dai_link->dpcm_capture  = supported[...];
> >>> 	}
(snip)
> It's very hard to review because it comes as the 13th patch of a series
> and you've already removed similar code earlier which precisely checked
> the consistency between dailink and dais.

Ah, OK, I see.
Indeed this patch can be merged into [01/16] patch, or can be [02/16].

> In this function, it's a similar case btw where the settings provided by
> the machine drivers are overridden by the framework, so that's another
> case of collision between machine driver and framework. Which of the two
> should be trusted?

I couldn't understand this comment, either.

	In this function, it's a similar case btw where the settings
	provided by the machine drivers are overridden by the framework,

Do you mean dai_link->dpcm_xxx which was set by machine drivers
is overridden/overwritten by this function
(= snd_soc_dai_link_set_capabilities()) ??

I think CPU/Codec driver can't set dai_link. And this function is
basically called from Card driver, not from framework.
And dpcm_xxx is no longer needed anyway, no collision happen any more by
this patch. But am I misunderstanding ?

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
