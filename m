Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED838AA671
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Apr 2024 03:10:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F230D1FF;
	Fri, 19 Apr 2024 03:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F230D1FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713489018;
	bh=/QP/77mYjTT7IO473cqzbItBE3x40OVpecupw+h36AU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HZf9au0uYG9gMm9BdqhBp2+hVJmNKwLqoxJdy0A8bVTuisjwx1k9xHqMBqjBhxehl
	 2GaflyXH/LcWLUzeP6RTFickSuaFuGhAF1R3z10WuefvA5D/SKP20VW6+oybLVWDdk
	 9hmB5GrzCxixpd55VwqKpQJe1dhSF66cYmFUQlyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17CC0F80587; Fri, 19 Apr 2024 03:09:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BC97F8057A;
	Fri, 19 Apr 2024 03:09:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1716F8025A; Fri, 19 Apr 2024 03:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 11CAEF8013D
	for <alsa-devel@alsa-project.org>; Fri, 19 Apr 2024 03:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11CAEF8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Hwh/u8Qm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQQNYeUkddFO7tvhrIg9T9N4oKgfgaf4XVV/6GaWScPZZoErWy5b2egwXs1osh9ioVph8DPoFemwnakKxL86h1rDAwGnN937qCkJRRpZgouB7U3YujbUYicLKI59cTrDD3Uf1EO0KjApm35KpWFwb2MjveP9bmMTmg7i4hkp3K2NHKUaywAdYMZUe3jufklwIkXzCJGa1sW3sxtIhDKBYhxgz9dqEXnAQoERZlrz9F5QFxUdlQABj9XjZxhG4PKykUJ6a0Fz0EwIQW+43Ko5xW8Vp11B9C6Z0vdLLil8c2so0LP/5udnmJiS8yr7PYlJyG54wtMMPad/5xxCI3x4Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYT8WVTB+I2Svg2+3BXjCp+C8IgBsz7JmMSEqMw3Tgw=;
 b=M2UzIO1VRhV78SEAH+XObAFJ9wi8ZLgFFq5ki8wC66GiOEPqJX1gBuYxIx4HRNGDcKBA7GyNoco1uSTW0TgpMeQEeXYZOY5SwQuHsHfbK8R9UKmDO3F4EzaWHIFdRis/6rn2utXIofEX5b2ycj9QgfsRdgDrrCuNp3SvUbkY0OpNrKj0EwAu5Uv1vF5pqz/sZ+eRuckCtwpKkA59MAraSItyTtE5cf7+jCnZApffpfI2Qji5RAtPz/DF0moXv+o/9gsC9U/c5RB0j1ytTCN03QwkgwOsbf6/h9XQt3cw3dyMbtC2v3iYphIzbOCdo9My1uBd+Rnx+alLW6U7TcFSZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KYT8WVTB+I2Svg2+3BXjCp+C8IgBsz7JmMSEqMw3Tgw=;
 b=Hwh/u8QmUqf1C5aYzqzSdMhYIhWEE22zfZ8UPugAQUIdmQkFQbPcgrgk7KP5NmsH4fC0a8nZmoTbttTe9DCIy/HnoCEEOR0C3SxLaW2FeAcfqbd6gatWNHTKkDiHsWPIORVoU7FfAOTXiRS10ih8pGI70Ulkqp86rkW9d3gfZ8M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8667.jpnprd01.prod.outlook.com
 (2603:1096:604:19b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 19 Apr
 2024 01:09:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 01:09:10 +0000
Message-ID: <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
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
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Vinod Koul
 <vkoul@kernel.org>,	Xiubo Li <Xiubo.Lee@gmail.com>,
	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-doc@vger.kernel.org,	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
In-Reply-To: <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
	<87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
	<a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 19 Apr 2024 01:09:10 +0000
X-ClientProxiedBy: TY2PR0101CA0042.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0977ea-42cf-400e-2a6e-08dc600d51dd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8IsxM2bIIBdKkVrmu3ktUN+Yzd/QIvdHzb5Uzz3Q5pZZ0z5V6NTZ0wwqTFiVy6P33QdpELZ3HWBJgSQw46/GSG4YoKLkSQczZjqCD7jpfqDkD9yzNBdAyefiUhz7fP+Gf99pDwr6imk/DR+Ih+XAK6CCo1NRBitkhFMjYlMm2Ui4pRzpQjNheq5yHHjWwuzyhSPWUvnXvBPD5cQGeD6Pfx0BvY/Uiv6s4xE1sPIhqTcoxOjGtYk/H2SpFJ5aebskcoMmobD61NDlayELwvdNoeoUgW8Gi5OhklcTyr2hSR5qhUWOqNcu525GV4kIZcAUd4AJTjAlVwtEoGnmOWa06sdxePxEn24ELeK03ry9vVhCmOTT9UucnAnNrSpq25DFdG//4mRmkJdXQ92X2QhQafy4VwdcDKLEd+Z3Ei1uviTbvNoND6ri6nMZE9G2RpGCELA6n+BX4j+o4rdrylzD942dxpHGYLwBfRWUr73ETzWSq5BxzJLa7JuiB9je/cR0lvcMy88BDxKiywb9v6rezu0g8gHbm1ExG++bai4A5fFjFylcvloEx+fghXPzNjdxg+isnpuc/u1E0B/tlljyB9BfQCKXjfwegXaw+hi2/7fwSKCQHdAMORUBnZGQgiKx8wsP8tey6thpIvZlozWrV83f/lpqx8d0NA0sovA5rq1P1TVJ2Q5bCGaB1eJwW6whmcDc4/hT3ZU2Y9J5ydaXWoD9rXFaVC5NNYlIV+/AJLQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(7416005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pPxh9egKltHA6rrSPEin4OLmPDAm0Td5nlyNTPhkiLBXUwiiJuZ4DIcpAAFW?=
 =?us-ascii?Q?8Tsqu/4MIjEVslTyXOfLK33oS0iDd3M5AHvB4OmTpV1JLpMvBp/CVDxrPujz?=
 =?us-ascii?Q?7BB6vk0SbI/G+OYTnT2fHqMZWw1JLEg4daRL2n2wQdrC7b3yMWNSAhShMjDD?=
 =?us-ascii?Q?V0rYLqJXv3O7LFK8rafOgOt5QsiC2LSBOL+2evkoCTlNf2zFvkQGgOiXmccX?=
 =?us-ascii?Q?Cmk8hsQWlv4ve1hFikftEcOC8uAjT7lwCS2WzD8upnNN2hT28G+Re554BpS1?=
 =?us-ascii?Q?Osz+4lqEPkJyPbiNUZNfrvVqPoQMRQejtGAwzPcKYf51fYHAxPIMbfGnzQ6U?=
 =?us-ascii?Q?aaw800fw9tovxxdrqdYhLyathOU768IYtAbDY/YG6FJZAPQBAIJzKlU3ASiM?=
 =?us-ascii?Q?7shVMCIIw6MigFTxZmx9L0myEd5eJGwjnBZSooDR1zdL57ywxOcUkHBrBPbu?=
 =?us-ascii?Q?xNcJv2bFTATzPpNs6OIGIlWhwSB8BvJEnTYdYqG3YCYGSFfKcCKiML9/Mlzr?=
 =?us-ascii?Q?pYoHPGqGGCQOuTvYwwsDk9MS10z5psUnPazaxi1AzWNUWXrWNCU1IptSa+rG?=
 =?us-ascii?Q?yL2FG5ZsRYronVOJa7bRxcAcN4+Y60IU3G0En4YP0MYU7c5drE4q08/CF8lt?=
 =?us-ascii?Q?l3ltZpm+Fie5ku6oUwvnZFg+wUQ5UluE6AzwnOnAukH3pfi4eakCPSQ/WQ7Z?=
 =?us-ascii?Q?oA2nzrV95rJVAP0XinkBceuphKV9wr59AAxlhb35WYjVK/ozwqu7bydbyX29?=
 =?us-ascii?Q?LA3oi/obRE0l4xWaXwQPDDWYfLajhWScNm7LhLte/tZn9ZDgm8ToaFBdOaok?=
 =?us-ascii?Q?4V0hq63fc6F79EFmkYHc+POgx4dMWJeL12kin+jmugK+L+ymZhSInzJTx7Ke?=
 =?us-ascii?Q?ERT/2pR1RoUyleY686rWVDqjx5ZsP1bbAjg2HW0KRRo+/3NG5KLDIdy3shIV?=
 =?us-ascii?Q?C1n4IADXC/maLMpYqPAYaqVJaCNTdpDfFjuQfwaZ4/HbCTRGZIQCoLxRPT8g?=
 =?us-ascii?Q?R5rYsBZFUPbqbMHg88v+QF73/4XcnKL5oJs8+RLFpwZqJITaimfvFw+W/SKC?=
 =?us-ascii?Q?oNxvt+DJuOFRaqEQwiF7caSLb1RTAR6HHp9llFDvMG/gX0Jgjbka9+ULcdoW?=
 =?us-ascii?Q?w1bqt3MuD2MHG8f3G/nseVjeHKbMEp/Tb3wN+0uLslTRRindUnt7YNeucBKy?=
 =?us-ascii?Q?hnKTRarnSTrp1aBdM29Hb/QsNCXDGBuklRyBuhDx7MVi15vMqdMnbPSylIub?=
 =?us-ascii?Q?B4bnltkRb4/5KitOL4Es8u/e0L+3NgKnJA9t6lMKoKLcD/MFpz+9/Uz3gzJr?=
 =?us-ascii?Q?Cegqv60vuQtiqpEkbucvqApRhHAtviVCH8fISReoUGzAMBvjDljBm81BoRHm?=
 =?us-ascii?Q?SWvkjZGUaW56LrvzTjuXLZ8xjwNSktMoAl8hXMlpXQ8qdXewcdkwq6WqBuy1?=
 =?us-ascii?Q?sQFGdXHeizUvEsHYaxx6aCuh6SlOxHTcjWV6+zl+EJTp3xsetna0SGRNnRiH?=
 =?us-ascii?Q?5I1AvpO8PjwY3m+3zyW98hgpQ7ssXCOLFh/VJhcZ8yE+OwND3hBTZGkAcdgV?=
 =?us-ascii?Q?W36bmX4+QUa8oYKx+fgMCXbhdaFxYcp5hSpRx11TaYyzi+EX9SvQTCwRcAom?=
 =?us-ascii?Q?KZjpAaImM8stBuHuv8CsPuI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f0977ea-42cf-400e-2a6e-08dc600d51dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2024 01:09:10.5506
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wvs+otRnFGBD4X7FhQJdMZiBGU02p8tY/y6DMlzabWS+2idq4Byg++IK6VGR0R9OqUqG8yiK6lg5i+cWSb23nXsta8Iaj3pOMZp4BXYbc/lTrwVogAQTfqp5ZlmWq83v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8667
Message-ID-Hash: CJSA3U7T6FJCI7264SC7I4KY6GRG5GI7
X-Message-ID-Hash: CJSA3U7T6FJCI7264SC7I4KY6GRG5GI7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CJSA3U7T6FJCI7264SC7I4KY6GRG5GI7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

> > (X) part is for DPCM, and it checks playback/capture availability
> > if dai_link has dpcm_playback/capture flag (a)(b).
> > This availability check should be available not only for DPCM, but for
> > all connections. But it is not mandatory option. Let's name it as
> > assertion.
> 
> I don't follow the 'not mandatory option'. Why not make these
> 'assertions' mandatory? What happens in case the the option is not present?

The big reason why "assertion flag" is not mandatory is that non-DPCM doesn't
have such flag before. I can't add such flags to all of non-DPCM,
because I don't know which direction (playback/capture) is available on
each DAIs.

> > In case of having assertion flag, non specific side will be disabled.
> 
> Not following the wording, multiple negatives and not clear on what
> 'side' refers to (direction or DPCM/non-DPCM).

How about this ?

	If either playback or capture assertion flag was presented,
	not presented direction will be disabled by ASoC even if
	it was available.

> I see a contradiction between "expanding the assertion to all
> connections" and "not mandatory".
(snip)
> again the 'not mandatory' and 'non specific side will be disabled' are
> confusing.
(snip)
> > +	/*
> > +	 * Assertion check
> > +	 *
> > +	 * playback_assertion = 0	No assertion check.
> > +	 * capture_assertion  = 0	ASoC will use detected playback/capture as-is.
> > +	 *				No playback, No capture will be error.
> 
> did you mean "this combination will be handled as an error" ?

Hmm... is it word selection issue ?? is "must_support" better ?

(playback_xxx, capture_xxx)

(0, 0) : Both are not must item. available direction is used as-is.
         But it will be error if nothing was available.

(1, 0) : DAI must support selected direction.
(0, 1)   Not selected direction will be disabled even though it was available

(1, 1) : Both must be supported.

> It's probably best to have a different presentation, to avoid
> confusions. Using multiple lines without a separator isn't great.
> 
> Suggested example:
> 
> playback_assertion = 0 capture_assertion  = 0
> this combination will be handled as an error
> 
> playback_assertion = 1 capture_assertion  = 0
> the DAIs in this dailink must support playback.
> ASoC will disable capture.
> In other words "playback_only"

Yeah, I agree

> > +	 * playback_assertion = 1	DAI must playback available. ASoC will disable capture.
> > +	 * capture_assertion  = 0	In other words "playback_only"
> > +	 *
> > +	 * playback_assertion = 0	DAI must capture available. ASoC will disable playback.
> > +	 * capture_assertion  = 1	In other words "capture_only"
> > +	 *
> > +	 * playback_assertion = 1	DAI must both playback/capture available.
> > +	 * capture_assertion  = 1
> 
> nit-pick: the 'must X available' does not read well, 'must support X' is
> probably what you meant.

Thanks. will fix in v4

> > +	if (dai_link->capture_assertion) {
> > +		if (!has_capture) {
> > +			dev_err(rtd->dev, "%s capture assertion check error\n", dai_link->stream_name);
> > +			return -EINVAL;
> > +		}
> > +		/* makes it capture only */
> > +		if (!dai_link->playback_assertion)
> > +			has_playback = 0;
> > +	}
> 
> we probably want a dev_ log when the has_playback/capture is overridden?

OK, will do in v4


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
