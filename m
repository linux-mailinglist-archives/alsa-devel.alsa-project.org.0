Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E71894798
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 01:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4F54218D;
	Tue,  2 Apr 2024 01:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4F54218D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712013619;
	bh=iDr1MdGX5+vyiocWTxj3gJZSYuz9jSJJQir3nQeONGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EiSD8kI6nm5BucD23iRinxL4YxjsvSzZ4Ypu8Chtm1KGGPYNrt27/Yasa172Whj7J
	 KXBbhBoaJi8AWZcbwnUJQohXpYkUsQQ2UdLkBuyVP+CiXdgI8WFGHqmFKb8VB5WD77
	 Z6gaU/wnK+a6UIpx+l/vw1RT/wChWwhLydsHU0FM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E603AF805AC; Tue,  2 Apr 2024 01:19:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ADC6F8057E;
	Tue,  2 Apr 2024 01:19:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5FDAF80236; Tue,  2 Apr 2024 01:19:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CB41F8016E
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 01:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CB41F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=X8c0adqL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNWjAU+abYb7hboZA5n9KOVWwFCI/quQNczS4GvV4+r/sl+VjPcaHEv5Sip0SAdBaW7HRZO/eprGJ+EJVTQJp6BUg6Fx1J5Yv9K66KZM7mO0Fl9eiqMLY9mtcNuIcUpGKTZE9G6a/aEOCop1K9mUZ71iesdwWGPfoA1d5mySrGGfkD5EqKqGLqmSW8q1xfuJqdumliDvr9joTVXDxdLGMNktD0l4OBwQV+/l7iMlUkXfs7yjVcn9Z+8OiyhORN2RLW0j0Q82nFR5EXl72IrZ2gaGPVzyncgIc1ruC0d3th7LP81WzX4w9wP5I6usKVrmxCh8tDKuGgg6ZI6UpWSmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/5mlR15R8VC0wJl3E8YVHGt/l2EoHGDDLiL7yRnnbI=;
 b=HA/jRHtI0dHqgR3ZyM1CwPED/7e+VWAE3BQJHYOed2GtwAhiJGbfTB84Z5nbMf9ISeiyG1iLrDKDjQgJHbSaQbJYW5lBe+TNi1Xw65dxjVUQC4EfpGcjkl3mo7C0fDHBROPRLI194GMN2VLXW6svnH5KGLmW0nA5o+Qo3umI+f7daFxi/hUI+TvA2Hmwgt0wxuwPJTl4QzDiXPnsqT5AZQnaZf5hee9YW3FCDzhq+fqSHkTUzdAdwie+L37fSeLnKJH8/reAZweEnCvEkqCR2q6stNODQA2rzsBYyTIe4tHx9odTiq/7UdToE2DPHEaEeoFzTn5YM43udhJHpeQXQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/5mlR15R8VC0wJl3E8YVHGt/l2EoHGDDLiL7yRnnbI=;
 b=X8c0adqLaNPA3NaxTNhu5yb0bSxJxtic4CloCe+OMhjZ3mRlVKjekin/CF/LqegJ1Y1vP/cqsTEHD0MWBj9gLPxLpinMYOiwqXlGEOw8ZuSRLJcoRjpZeR9L7KEVKd0p9tMLIkuNjqub25buugFlKd6pSho3+vpdDyUYivm4Baw=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYBPR01MB5534.jpnprd01.prod.outlook.com
 (2603:1096:404:8027::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Mon, 1 Apr
 2024 23:19:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Mon, 1 Apr 2024
 23:19:23 +0000
Message-ID: <8734s48ydp.wl-kuninori.morimoto.gx@renesas.com>
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
Subject: Re: [PATCH v2 04/16] ASoC: sof: Replace dpcm_playback/capture to
 playback/capture_only
In-Reply-To: <2b75ffc8-cb97-4a5a-bb3d-34b9e9fc3bc5@linux.intel.com>
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
	<87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
	<2b75ffc8-cb97-4a5a-bb3d-34b9e9fc3bc5@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Apr 2024 23:19:22 +0000
X-ClientProxiedBy: TYCP286CA0264.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYBPR01MB5534:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Qx6sjt1AGn6cpUinmtaYQvKTjcYuk/689A6GSj9lxFD19kujQTiAFJgedNTrZd3fFjz4foPejzPnekUYG6sOS0UNiLlW5iNqW9zqPbc00sCLKdKRlqyZ+UIG0npoeNEOM6uCc/GS/cZy3oUMQzkMQKjpiQUUgQzXidpCcVgDRrUP3o4AuvAe1Kf3pETHoGC81/sA/7z/s/OMwEMhIKFmitw/tXZHd29N2NtrYtGuIt3rNuRXuCxZJQhzBW2851pU3luJ1EE9u8NHyzvrWdBQOm3rIODbZKfzFUbHzuYH4MUzcSxAYOz3xaRs4RDeJjZBwVNjK17dEGA+QRIu+6uABYtMtFlHUkwiGBc06D0JKOVMt23QbcWd7mVIeJ3eahq0gug+y6CNvBi4O3+U7mdUKX26aVPHV1kHH4efb/Z8YSbvy8fAVrrpuKoqIve5M+k0wjfqdjtVF9cEEDcLXo+LKgN0ZHPKfnFUui0iD9CxdSXI8EF+olRVj8NNMPc+a/8CZD1VUNT3GGRfGy1CbcX+UNQeaOer+e+C5ynpNiVz1gshAqj0N4zEXhz7bE68WGsvbLRrilWhHIDgdNinbXdaI64YY7WMtyQ0TYUDf0oBx2Q9YEA9sqCJvmgJxm1lzwSgSXKGlC35rNuwIz4PcMSQlklFbK73LyKwLgJiYYEotgjGr1G+Abf3CAmleEn+fIpkJU8ofzgNi5cD9N8g5wbU4gyyFhPzfgS6bxDbL19gbu0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(366007)(7416005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iqK6qYtrHpBnDFY3rwDnrZwj8fA+aYxDMnivDdwvRNx7qa5xvdnb0RLNbFdm?=
 =?us-ascii?Q?xSxWn9U2StyiUlaUkn6UerqnX00MQLXArD70dl31vlg6OzBcbcus+fdE95Au?=
 =?us-ascii?Q?6OG4jWrQ5QtPPkR/CQsuIhLBvCrS0LX1Wa3iRb1ujhmC1B5JMhCkxLo/n3W4?=
 =?us-ascii?Q?UHbWh1u0b4q68z9c1ic4yhZQqGCqVXpC2rq7l7Hhg5XdZl8ol5Mtwg1NgPLC?=
 =?us-ascii?Q?6QBwXlA0OB7n7mYvSQNLsHbqSjhUVVgUBn+vwctwy0vod2+rHHaj0hf0MMdt?=
 =?us-ascii?Q?22mY50HeY1LPQxTIEVwDIfSnqNnvg6WDak6Cj0sWDFc+BKAQgTaNAZObqjnm?=
 =?us-ascii?Q?quGUtnG5tiaKSLALju2cF2jYZeYDOgh33t2QXw7DsM+85y5QkEBDJtpD4zuu?=
 =?us-ascii?Q?DSS9aC2c7sVSrgK1zTZZ/D3caovor31ZwJ46RdSr0QrvwJ+f2auQ9ozBntlu?=
 =?us-ascii?Q?f4oWEEtccZ7fi3OP9oiqRmj1IV3SzlZmKNCGuOJ5cGZGe+zAOEh98SuHQ3I+?=
 =?us-ascii?Q?wA0h7HjfdL5k3FlJ7qc3EOkEMFP0laPfMCBFNafXKj1SMkmkl6g4VXeJrzkW?=
 =?us-ascii?Q?w7bS2qnKC1uISgAgBmLkfF5ZLITzmu89EQCSL85qZRfDSPN9ZllJvQIE6KoX?=
 =?us-ascii?Q?rPght81ZK+ZiRnST2lDbkT5cISBcy3kKJBuJPZ7wzKC4EEE6rs/wLV3KbI22?=
 =?us-ascii?Q?UGqxgZwHBhLoGI9BSeFnxDZg+In5bUH1pye/je6KuNtHLXjAf9gpXZRD3EX1?=
 =?us-ascii?Q?NUrtO8kQygmNFm+bOe8lY3S9tWzRp7NDT8obiGNHbFwFHA6eTGmCtTbEMKCB?=
 =?us-ascii?Q?pF7oOJnu8JvT5+ywmQaTJEnkyA9Z6gnRuTXybHpKPdcCTjJG8Bo9z8VtcPL9?=
 =?us-ascii?Q?omjtuYsyaED1NjgqAfqpNUDq/oin96HpOWQTOHLcHRuVyfyyimccfx4wGX7N?=
 =?us-ascii?Q?4Iuur0gvr/HSQbCEimPjsT5vB0Oo1zYwRz7GMtjJOKzyASuo0Q2dn1GHqu3/?=
 =?us-ascii?Q?5+4PwBbxVLmD1pHoWQOQQxDG3LFDiwBF554EQHp4eTfENoRGTakGA8UdVPHl?=
 =?us-ascii?Q?BOm92guF0SZv04b80m7GCVvJl7aa+9o87kfIzcsAK4N9w8drIK2VrIu/AVGb?=
 =?us-ascii?Q?hk4F5B1Y+GeHl9GJhB+brABum1rdlTgejudcSIvpaPXHuGoDQ31/lHq0r3nG?=
 =?us-ascii?Q?+CjnU5NbagRX9fZwbpvkW2W3YF8smzpMd0bKoMftjHjbt6jN895uO0vu2zae?=
 =?us-ascii?Q?gDwOS6qXJAE2nG1ts3H7PQoFndSg0ZsNJYTVUqisUhP7kOoOySLq3WVUYP7/?=
 =?us-ascii?Q?ocLe2qOdpTjbUXhhllKWVEFzvHlst7pSQiWv0S2F0/aVga3hvJW9mbk4DWeb?=
 =?us-ascii?Q?q9KzIH1ZQchcLRasjTuM4ESdJVIx8jgw/0xjuKS6GoWMuypja43HR8jFJWvC?=
 =?us-ascii?Q?eZciBLGPGuTHUWADrSFCVrMD0bfGNFTykXuk6kjwwduyTeghBKjUODy/S8V5?=
 =?us-ascii?Q?HSKRefKXih71DjqKcFlnPHWcrPLo0L3jlOcXZVFfOuISg3QiG2A6Tla5gKkn?=
 =?us-ascii?Q?MXLg69gGnZcT8kaXP9LdSQoHZo9vkufkd0rAaXh1l3wsBRp6MzibyvuvwPzm?=
 =?us-ascii?Q?oiSRLow7uYVF+em5ef0bX+s=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b295f133-68f5-46d0-5029-08dc52a22a82
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2024 23:19:23.2076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 QgLMdafsLtd7usNDaK1HmIbyUV+AyA4WWTnq9+RXXlVbjdnh5vyVV76zUmuRR7Whq3W7POWnhVU4hK3V+BKm/L8d3EshHqUAhW4K1axhv+KQB4PPTceflYqZ/kcoFFh6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5534
Message-ID-Hash: BVVADHU6NJGY5AQWSEWTOFJ6WFDKNYVA
X-Message-ID-Hash: BVVADHU6NJGY5AQWSEWTOFJ6WFDKNYVA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVVADHU6NJGY5AQWSEWTOFJ6WFDKNYVA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Pierre-Louis

> > soc_get_playback_capture() is now handling DPCM and normal comprehensively
> > for playback/capture stream. We can use playback/capture_only flag
> > instead of using dpcm_playback/capture. This patch replace these.
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
(snip)
> > -		if (drv[i].playback.channels_min)
> > -			links[i].dpcm_playback = 1;
> > -		if (drv[i].capture.channels_min)
> > -			links[i].dpcm_capture = 1;
> 
> Sorry, I don't see where this functionality is now moved?
> soc_get_playback_capture() doesn't seem to have any logic based on the
> channels_min value?

snd_soc_dai_stream_valid() is judging based on channels_min



Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
