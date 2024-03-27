Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B39EF88F356
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Mar 2024 00:45:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1D3A2C78;
	Thu, 28 Mar 2024 00:45:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1D3A2C78
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711583157;
	bh=4I9lcgckFbuTynI2eTd22KTu3YO23GXEcls4DBPupxQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=brvD3sPw647CcKby0KupN3lw6NP49srYWdeKo7Wde7NOyg5EamkbAJr0LZZqeaKol
	 FmOQ+ErUl51R8Wu/FAiLMNSQIZxsmUkfQ1EVESmuWdRoLRsQP26ltK2HwzNN0tuOOb
	 Ml2f/KEANYB+y2nfFo/Cg6oETwqUhMkFNpQ7gbO4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EFA8F80580; Thu, 28 Mar 2024 00:45:24 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2001F80570;
	Thu, 28 Mar 2024 00:45:24 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C73D4F8025F; Thu, 28 Mar 2024 00:45:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170110000.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A821F801EB
	for <alsa-devel@alsa-project.org>; Thu, 28 Mar 2024 00:45:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A821F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bV/LI9E6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ypj9sFjlwihjeLj0zrDUSw5ryKZEFAC0rkCjGGf87re4lqTCqz4NCkGf70DMgM0kl/wN49kEp/wUOD0kUv9Nsztd3OenCUIkPYnsIS4ZcOWpT/eVyOMMnKDM8MvK8sebxQytGA9nZJGty05O+2YvHEaj80pv/cbmcPOV42f/uUNYC8nBuiWd1Xin/nWHjmqjyoR4ComwxF8hqo4Kq87h6S0ylOUkf+GN3250GYbVPvk88OIin0OOh+DtKoO0+1tkStwvxcZL2U9u+MZxCoFr0w//91yGNmMGWy3yqZoyTMmFaBILvMTCwZy5+ERmy1hASr24tfambJ3U6GJZ/aaN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sm1x6atxman+df0+eqBw/r9TvNKUY4uDsPw2QAnH5BE=;
 b=kAz9OlACCclahlB5NnT21XN62qryiIyyyBDrmumw/GIXyPDzsdkkRDw9Kxham++5MRtLV9f3VWQz+aVsZTmphdwF42oaq4WC7tKYEpmy+1xvBSBzxvrcWykw8MC8DNDngN8T7WaF3Cdng4rrj5Va43St8pFGC22zD8CHkNM6CA7gYuMizYZ4ocieAAv3KHgzrOPBaPcELJz953Vp761e21qyyebhZh9oUd9TkND9g56eB5vJVbvnko4zxS7Z5a3csKmEiIgejgB87pJmvTKVAsYrhPLN6pD4+zUF3JoR6JLRWQf8wvAjLrEBRExNgUeSiLjyDAK7j/fST3ANvl0tYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sm1x6atxman+df0+eqBw/r9TvNKUY4uDsPw2QAnH5BE=;
 b=bV/LI9E6TRPIWB6LBuwFvDbgXGNfIvWjxDAijBCc2WZjAjMvmO9AekDYiDdVXYM/da1BJ5ekITkYftfnwoW0NuA7nnKUGMQwX6QSQoUTVHHzH/UgDY9xDieddLiQ0W4MwCAf3RB0b6ufMdQCZfV6+tgw7U4JDFBsuTCwamXGAsg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10863.jpnprd01.prod.outlook.com
 (2603:1096:400:2ab::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Wed, 27 Mar
 2024 23:44:56 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Wed, 27 Mar 2024
 23:44:56 +0000
Message-ID: <87r0fvutn6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>,	Alper Nebi Yasak
 <alpernebiyasak@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Banajit Goswami
 <bgoswami@quicinc.com>,	Bard Liao <yung-chuan.liao@linux.intel.com>,	Brent
  Lu <brent.lu@intel.com>,	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,	Daniel Baluta
 <daniel.baluta@nxp.com>,	Hans de Goede <hdegoede@redhat.com>,	Jaroslav  
 Kysela <perex@perex.cz>,	Kai Vehmanen <kai.vehmanen@linux.intel.com>,	Kevin
  Hilman <khilman@baylibre.com>,	Liam  Girdwood <lgirdwood@gmail.com>,
	Linus  Walleij <linus.walleij@linaro.org>,	Mark Brown <broonie@kernel.org>,
	Maso  Huang <maso.huang@mediatek.com>,	Matthias Brugger
 <matthias.bgg@gmail.com>,	Neil Armstrong <neil.armstrong@linaro.org>,	Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,	Sylwester Nawrocki
 <s.nawrocki@samsung.com>,	Takashi Iwai <tiwai@suse.com>,	Trevor Wu
 <trevor.wu@mediatek.com>,	Vinod Koul <vkoul@kernel.org>,	Xiubo Li
 <Xiubo.Lee@gmail.com>,	alsa-devel@alsa-project.org,	imx@lists.linux.dev,
	linux-sound@vger.kernel.org,	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 15/15] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
In-Reply-To: <1jcyrfal6f.fsf@starbuckisacylon.baylibre.com>
References: <87o7b353of.wl-kuninori.morimoto.gx@renesas.com>
	<8734sf53kv.wl-kuninori.morimoto.gx@renesas.com>
	<1j7chp9gbb.fsf@starbuckisacylon.baylibre.com>
	<87v858cwki.wl-kuninori.morimoto.gx@renesas.com>
	<1jcyrfal6f.fsf@starbuckisacylon.baylibre.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 27 Mar 2024 23:44:55 +0000
X-ClientProxiedBy: TY2PR02CA0056.apcprd02.prod.outlook.com
 (2603:1096:404:e2::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10863:EE_
X-MS-Office365-Filtering-Correlation-Id: ec643778-df40-4935-8d82-08dc4eb7e80a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZTGO6lUyk/RZaQhYkVypfut7Qvxk/n/Qtc568GpTIq0xTrQbGNeLt1+cM8yi4cZiqJ48tU7HiXrNG1goV9282bfeG4vKpmZTyc7NZhXxnZ2zAdN4zC0FAUzwmRSrRSFUv8UoRMDquKa9cxU/5QA3YWkmxXEzKAiCQN+Apr0wfw/JHeTmzrEpQr5nacJ3TaCHdGkvZQIQcXnN1OfOASC9oJL4J9XB4N7QnSArAezlTRC3bPA1OW706YUWpP6A8jnQ2slH+Zs2u9/c0Tc55sDIW+8ghkn/avuvin8/QYLyR4M1QWFC9TtiaEub50E9SdBYqvyG87AOTJ1zgEpqMVp6YWpV0NIVa22o8Xy8WyJoUUNmiPN/QIWVU5Dh+r0VPLWkoCBn6w0IyFlNqBwpRLQFz1njEnmJWOfbM+JDlQJquNgF+ySeBiibzj2WCBPewqdY47T2x9BbhykadHYxtsuTq3S2MaPchEZXimIX35LYVUccKqjVgP84FRoFtkx8CAj6zALeA62ylCHWFaYdWJ8rIKMmezKXyPlpE3SPyoUTRiSWvU89ujxtqX9iZJocXMoLp0OlKSJhMwk9rYmzV2w0JDJGwumrepGZp2pNXK1E310I6dihD8FJfAm6Y20mDLlZKmlW0JY84FBsruIvDTKqIpgq7mt13d/J6rCJ7LvF3UvyAr4TM8X2fBZeAIMnLV9VJ8PSTnCypLZYfdZqrClk9c2gy3nlBIKUd5u7CsSjl0g=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(7416005)(52116005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xDpzGCviusO0ajR1ufrblcE59g6C02XJPPYxsxNvoOUPmP7k6v0nTfUE2zdd?=
 =?us-ascii?Q?kGmlSyrDzwtzjSyCLKM4SWUqZWtAlyKmzI0Wgt2FEn7CFAIDuoygVN/LY+7I?=
 =?us-ascii?Q?B60kOZGuwBWWh7sEGso8DlTMSwjybGgfpaEtOcuEH1kGxpqOLvG4zThqqL4Y?=
 =?us-ascii?Q?smp+RjKBvF2hcJfOMoJnY+f/MXBrWvvWzdFgA9JQp9dx8V4UYo4uhGnu9atl?=
 =?us-ascii?Q?iEq6Ae7ZGczYuhSH7UGarxzZJ1Dhj+PoxW9ujrHkDc9N27W+b5XjQRMjxlee?=
 =?us-ascii?Q?fjgkHrb5+YBA5B+JoIR4NRfHcPaM8cfAI2nXJMKM8U42U/TBE0srwXNJdhe6?=
 =?us-ascii?Q?wmuf5446dOhkilVYy6TJ4Yn6zap3PU76toN4n3Q+2r08uTb9FmQ2LMN5f1kp?=
 =?us-ascii?Q?IHIfToD8rm7o3BteVh6d7LMeYpgwWSTXSN5rn7KnLHwNIRSxJ9K4y1lxrmfh?=
 =?us-ascii?Q?VkJYlPBZvcZmEbpxiUgCKypqu9/KCtr1Roi9O607SBzGY7BLTB3eQP3GiDYT?=
 =?us-ascii?Q?XMXm88K5PzT7X6OCw5ymTgC5E9Slfv7nYtFQiQKX8PlBoo11pm/AXSq3a8iJ?=
 =?us-ascii?Q?EyLSBtBjWn6Fh5cdV7peZY0bZSyHSTcZgTEHdmfEpSRSCue40KVrN7AiWys8?=
 =?us-ascii?Q?GzGUZzz/VV0rmlG02mW/XRsJprYA6mEvNmG/SLe2Jf1tKlvBbeQfFU1njiFr?=
 =?us-ascii?Q?hQhdB5gCd52R0L5b3g8Hb2/0xC9r4ReHgQGEjevUs5RMOeZIE8k4UHXR3+Oq?=
 =?us-ascii?Q?rnvg9wmFNv1x8jAz8/CgA1Jh/BbXuqVAdLD8/5V0x1QdmoYAUypjrI1fAC8w?=
 =?us-ascii?Q?G+P6p8mQ1FvN7FV5svclfzZH+kRMyoruy8XQ6lEQdH7t+yYbXjUmo9stiU/p?=
 =?us-ascii?Q?aTCuRxfxlql3dmOa5RDZ89z+MlzJht+vLP0ne6RAVassKIn8u428R0sohkvK?=
 =?us-ascii?Q?D5Rz1ncBv4LFe2g68+apaPnI02j0JGAMm7XdXqB7Mq430EgMBAnmbIiUq1/9?=
 =?us-ascii?Q?qYIrOM/dibn6Dj2ukzcsaMdf6Vop37OOq6vCGOpULIokxYk5O4SEep4Kp0er?=
 =?us-ascii?Q?8HRPhc0fXJLuAtaOm8nBkM9hqrmPRB0OiMbQK6rgheWUtIy42olYDQ/Lyr8+?=
 =?us-ascii?Q?CM2NRdS9mnn+nyMgYnJAHW3UEtW0QiTK47iIcMTMW2ukJv8TMNMweuXMIH0w?=
 =?us-ascii?Q?E4i1t3BHeMVyIAdRzuPbapWoqToesBCc4VyfzOULzte2I0JKGT3vyOqLvtKG?=
 =?us-ascii?Q?IccYKgAS5uzt04alryQ30DFVfi21KDt5yrSAEkmFsQjS3x2yhoXy0FeG0MFS?=
 =?us-ascii?Q?MoS/tScmLPNUE9UObyYlkCaZmOB8+/ILR5tGY8Jm55UBYI57e0eqS+qvAhKR?=
 =?us-ascii?Q?DlJgd62N0MWhZjLGTgwvDa6+QjMI7rXqIAp+CzaFlk/B34ygTTc6nSN0tetM?=
 =?us-ascii?Q?Xz6Kh4qNF+w+WW4otZJCcDEGbuhq8NB5FIa/w2l/AUHeYg93bWhKdA1sd1cw?=
 =?us-ascii?Q?5eU3d0kENA8TOukK3jolYS6hApurzv0TgtXUN5fauDXVnjRgfkdpVFHlZqeA?=
 =?us-ascii?Q?B5V+13QWPr/99a/n63ucUWbmvKIyU39emBW+XG/lC3bdT2lOlRWtZ7M1FudR?=
 =?us-ascii?Q?kbY+FZyU2oj7ENhTkTV3hTA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ec643778-df40-4935-8d82-08dc4eb7e80a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2024 23:44:56.0165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 K+y88cZrD/Y/hpzAxIn/sjhhXPijF0ZQsJs7z+6s7guZ2SQTj8oClTvT+ld/sZE2PhbVzbPV8s3o6jkIiouRZwiH97pa9mpJg6iTDIw7t0X80CzibjsYHCtkondkSCyW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10863
Message-ID-Hash: 7LKJ7PB3ENIDX4QL3YBKMA7ILA25IAL6
X-Message-ID-Hash: 7LKJ7PB3ENIDX4QL3YBKMA7ILA25IAL6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7LKJ7PB3ENIDX4QL3YBKMA7ILA25IAL6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Jerome

Thank you for your feedback

> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^                   (A)
(snip)
> 	DPCM
> 		[CPU/xxxx]-[xxxx/Codec]
> 		^^^^^^^^^   ^^^^^^^^^^ (B)
(snip)
> > 	if ((dai_link->no_pcm) &&
>                          ^ Actually my comment applies to all links, DPCM backend or not
(snip)
> A codec that does not support playback and does not support capture does
> not support much, does it ? ;)

Unfortunately, some codec which is used on DPCM BE doesn't have
.channels_min = 1 settings which is used on snd_soc_dai_stream_valid().
At least Intel is using it. For both Playback/Capture.

But it *was* no problem, because (A) part was not checked before.

Because of this background, [01/15] patch is using dummy Codec
to avoid (B) check.

[15/15] patch will indicate WARNING for such codec driver
instead of just avoiding.
At least, below are the drivers. It is mentioned in git-log.

	sound/soc/codecs/hda.c
	sound/pci/hda/patch_hdmi.c

dai_link->no_pcm only is OK I think, because it needs to keep
compatibility and try to indicates warning for (A) and/or (B) part.
If such things happen on FE side, it is just error, not warning.

>           (!cpu_play_t && !codec_capture_t)) { 
>
> Then at first glance, maybe ... CPU and codec seem to exclude each other but
> that will only work as long as DCPM is limited to a single CPU per link.

Hmm ?? I'm confusing
Did you copy-and-paste miss ??
I have never indicate this pair

+ I have indicated before
- I have not

+	( cpu_capture_t && !codec_capture_t)	// in [15/15] patch
+	(!codec_play_t  && !codec_capture_t)	// in previous mail
-	(!cpu_play_t    && !codec_capture_t)

and I'm sorry but I can't understand what you want to tell me.
Do you mean Multi-CPU case ?
If you can indicate Image or code, it can more help me.

Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
