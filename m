Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FA370CEC5
	for <lists+alsa-devel@lfdr.de>; Tue, 23 May 2023 01:51:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B43FA1ED;
	Tue, 23 May 2023 01:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B43FA1ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684799475;
	bh=VeREy9klkRcio2mKr5xpx8fcPzFNUaYUGOBWvLrQ+B0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FcH+IvuCEhAVK0Gnul5MMi5MxxDhrg2u3b5e6cVHKVPBxw4bWsEZlrxaD089CrTCI
	 X1VQu4dHd/ucgVlBEeChISevd/XnIoBMz4zktxv3oZIVgZOuIYY+Y2jqUfFKNI+LfT
	 VNjLSK2+FkkXYFpskPwkVMtYGKGAuSwq9jw/jxXU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E439BF80425; Tue, 23 May 2023 01:50:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51826F80249;
	Tue, 23 May 2023 01:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3730F8024E; Tue, 23 May 2023 01:50:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20710.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::710])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 82A3AF80086
	for <alsa-devel@alsa-project.org>; Tue, 23 May 2023 01:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82A3AF80086
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gbD05Uny
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyrpG1nBMQAsdSLqzuf8zQNB/lurw3UmtC2rFyFkgo+W6+b+inQxi5Mg1pE6p1IVZxT3QvmA03LoiVTPJl9wJsP9nA7X0Ax66aKKnpA+d10iIoYmLv3ZFAB59Hy001CcvM2ZcTNIBnUrRbrAa5mgHyDyg7LuYgUPG8YBsHcg1j8YtTYOH8Jo3kdHrEKGwlkO8A222mszzGXTxqqasFtv4Uz3v4N/gPy/5OCU3/x3R+6MoOsUC1dOA/dTrXaqpeQpPnR8e+g1scF9R8LS1FcSERze0uTwjjB+HbHChcgRRMr/XM3Z/jFLqBvJPgjVg2hyvK7/P+/lKM/YYcMw3Ph58Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xr+hL1n5EbP9TURNqpFk8WXyRITx2eugoBC5NcQVPa4=;
 b=lyeczzTnqry0so2BUKP9IxSrThQmCnu4ayGvhPjjEuZT6f9tAhtzjRLm5kaaz5WLXFM0xa6dL/YXaYuFtYC1GQyaK0x3Z91PLUv0s/puVX0cQrlV7b3IeVzQ6+hJjnFSto84SuCUjKmTDCQEHVM4r3PjI5o2zS0+6YfVEzk9GvqhBEnrCzdvX3erkVf/J3ukY0n4FZ/b79SLFqX8SWludPebg85WC4tHybxGDuV2D4cay3mbhZp1sX+OL6qmUA6SUqUaYqaK3BpGTYPAg0Q8xuMV2lgZW3nHbueDgOSqcquTTNwGp+KILyfUgHWTwIZ85Xc4D8HlnLsqZXaEHRgiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xr+hL1n5EbP9TURNqpFk8WXyRITx2eugoBC5NcQVPa4=;
 b=gbD05Uny0uQEYkVAKfwIswQHVmBHaZ1yrZ8geqdtHEhyLOF5hb5HGtQMIEtzqz0G2hBticZC/n96qHk1/8a2TqHuw4jYDyO0ByIfJTHyj3EC0JzImBYPaQ51kzlC2oPSYdR5NIJt74SiitGML0AtUSYkRxvVSnAD4ErmP0RGuxY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB12059.jpnprd01.prod.outlook.com (2603:1096:400:43a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 23:49:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.021; Mon, 22 May 2023
 23:49:59 +0000
Message-ID: <87wn10ncyi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
In-Reply-To: <8f977a29-14c2-a160-5eea-10fce6a73742@linux.intel.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
	<87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
	<2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
	<87lehh2db4.wl-kuninori.morimoto.gx@renesas.com>
	<8f977a29-14c2-a160-5eea-10fce6a73742@linux.intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 22 May 2023 23:49:58 +0000
X-ClientProxiedBy: TYCP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB12059:EE_
X-MS-Office365-Filtering-Correlation-Id: 942d1d37-5f0c-483f-bd09-08db5b1f406a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Bl9U+GWAazFM8nfUESFGM78boEPOHY3PRwEOjA3GfWLkrWNSEdKbB4gcajApctSYAJm291ONiGfY+JZTUh0qV89ZGtnGLBhpg9/tDDBv5M18isQDDGSPERKHG64NRq9iLfz9U7RLwL7mUMeLqyPHjJrFOgEZ2JrL2GzNUOaCPO4I2+18+eHxNsYJ1Bp0SIHqBQworuckDqiHrubL/APdmR64k1GZ08srlii/XUoCvzSHTvfVXHgQcuhVLwIPcw3/an1wmscfLXZigO20sEJtwmdCv+b2GWb7zBaufnMlsAXkIzrBND8axVDothftHVLek8nAKSlJfyqCxQxh+vEAGQQI1YsGQ4MPphodaT1v4qu4hbj0tB2Nyq/3qEQGDoQnzoMZ4HvUQoZlCVuMrx0OLWC9bOAwxdDeBcSuVaJY38XlZ9OmbkxLNkhFaQL3nsLVLbTYL4l72xmbBpLoUU9zu3pfEeR0vkVvDrvzgSgZZBhReh4awMb0eU3y8q+f4Vz06gyU4m6i0xwCnB1NyrmPm9P0hxyAJSYG5FHr/qctwguFr5fD3MzRWCKlLG/kyy79JGyaYFAn3rG2ccXxEO5SszixPoqemmWLjMcTaTVARaE0Kc6rg2MjfWjuI0jCsIpt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(5660300002)(83380400001)(6512007)(186003)(6506007)(26005)(2616005)(86362001)(38100700002)(38350700002)(478600001)(52116002)(41300700001)(66476007)(6916009)(4326008)(36756003)(66946007)(6486002)(66556008)(316002)(54906003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/stzmROGyt0xtz/LtMa4Cx1y8TyODX5BmOoT5V3SMGOZ4488DX1Jr9Vs/+y8?=
 =?us-ascii?Q?LKa31dUoB0Qem7hurA24fQXF7QlA1antSLVdRoEYe5UDJZ+vQnxyQxpAa7EU?=
 =?us-ascii?Q?MyA4G5cRNZPV4RRMVII/3x7IElG1HTaLJEv+oO4AQ28rOB8RgcVy9+BUx5kw?=
 =?us-ascii?Q?IoICi9o+5n4rtKDDGEikDNYotpjk76uaK2FoNglGmf+E1uiWAdBuaR82E+0K?=
 =?us-ascii?Q?A9qKuEmnWbrayuRpFBV/C1asD25Rt4JWt2wrVRaH7e2bGp+dSyassFfo4o6N?=
 =?us-ascii?Q?yRJz5udT3U5pG7QPTjGl3X8sHDz9xFoaAWE7GMNqAyH05IohyifAsPxw2S04?=
 =?us-ascii?Q?kQztoKBDa5FRt6uLc2vMPjWuSDNIHw5QeXQtD7+HqdrbduiCIOD3KUQFWcuO?=
 =?us-ascii?Q?uUpjhXfMTwGOCF/uMMhGkyWAt1NTExagWR2hNJ2p6DGzoh76J01iepgQNK+n?=
 =?us-ascii?Q?ykpxHF1sQlvY3gxHjxivrHPrRAw8BqxevspVG1LxXa9WGM4s6wprPJRFY2Mt?=
 =?us-ascii?Q?ulgIxcQNLDxgi0sqi2YTZKAI+4wimjC1EuYMsLIgLtAwDqgyU4E0tYL5SckE?=
 =?us-ascii?Q?Sk6rLMXMQ0TIs2HxEIbv1wXZCcSYdNf7sL7Q9Sa9dbHub/2+7W5V4A/YtQNg?=
 =?us-ascii?Q?NURgnaB/SZ3HaQP1Ext2x36aBaKrthGPN/ldHEargGWoCIOqOfxox+Z5Jw7M?=
 =?us-ascii?Q?QwfcWy/mY2bfFWlUT8vr+OxZpuFYsJrzDMQTZRTfGpo1cei1puvrQViDOCL/?=
 =?us-ascii?Q?ObytLFDyc+CHh+PWy0ddIk2fmxQNPxQ1ES2oNG4xRDfFIzCeKAuRdWpJkjSb?=
 =?us-ascii?Q?M1ZjA7QW/Hjr+1h6Lu+YrrjG4i93G1c8KNqg3P5tikXDYDR6ov2CarW/pbyy?=
 =?us-ascii?Q?Qow0u2ayGDgJtKVQnHlqyC4BQDveop3KUtya49vEoEy1uK6jmHCQ9iO1D4mc?=
 =?us-ascii?Q?wDbCqgRCM8/xnlcSAsC1ts3osdVsdNlHxi8z4wGCaqcyIMvHhFzVvpF8pKSR?=
 =?us-ascii?Q?h9G3kMleXCOxNRVgcUEXtTJx26M9XdEOCh8zcblBCceSS+7PfOJHI/g+Zfhn?=
 =?us-ascii?Q?/yIRjLai8dEHscd5XOnoLqkq21L3t9/v+EnneNZmewCUSk2yrM7hKwK29kY2?=
 =?us-ascii?Q?1cPYfVUme1v09axNd1ug/2LCaksAx0b5WZoyarS08VNNwj6y8xIJVf99n/T8?=
 =?us-ascii?Q?VjjPak6fLMLOg+yokp5BnKZOHeehMl0fOHu8yt5DVY/0Axrsx+yxhuMwlHXM?=
 =?us-ascii?Q?6xo5Hs6WclbfR9p9ZHqb1V+YndD/KPELS89ob8USG3Awoypuiw2deKX0NnS8?=
 =?us-ascii?Q?b6FFnoN500je6T/qk7IlfDMf1kIqafUXtVicywCHydFuBG5sbXMCLWDJrZWW?=
 =?us-ascii?Q?uD3T98LO5aQ9SLzImkOagFWXKRbPxCNx9tOmwadFIcZh/ZecRWRPUv5pWbCQ?=
 =?us-ascii?Q?O1/mRcHfv+BnNJccfGQgMk7EKvpJOYJSn93PFUv2lvwK3Pmjh6eKGMH+8ufn?=
 =?us-ascii?Q?FGBWveCQFjga3DYRgzoKaFZ5EKo8kezMHB3x2+CpXO86jTvzodhHsY0t82tS?=
 =?us-ascii?Q?yiklI5m/yWiVihtnCrLYU29qbHYeFlVQcCZr5PYB/lgtUjsE3BWKd2X4Xa0p?=
 =?us-ascii?Q?VjyWxXikG43/mNHsCNUoEVk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 942d1d37-5f0c-483f-bd09-08db5b1f406a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 23:49:59.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 9Rky6Q0o9vV1L4njgnV5T1qe585F5cczcPVccLRZ2z1tR0dgjRe0chnKx753rqEsKAeGWSHaY07MetY/6sBl94NUkEp5R9RRkbBVDceKrtz3A7+qZTlySUIdrKo1ofgn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB12059
Message-ID-Hash: RR2FSBUCQFJX4WG5CUAE4UY5IDNFWEZG
X-Message-ID-Hash: RR2FSBUCQFJX4WG5CUAE4UY5IDNFWEZG
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RR2FSBUCQFJX4WG5CUAE4UY5IDNFWEZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


Hi Amadeusz

> > static int soc_get_playback_capture(...)
> > {
> > 	...
> > (A)	if (dai_link->dynamic || dai_link->no_pcm) {
> > 		...
> > 		if (dai_link->dpcm_playback) {
> > 			...
> > (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> > 				...
> > 			}
> > 			...
> > 		}
> > 		if (dai_link->dpcm_capture) {
> > 			...
> > (B)			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> > 				...
> > 			}
> > 		}
> > 		...
> > 	}
> > }
> > 
> > It checks CPU (B) when no_pcm (A) on original.
> > But I think "no_pcm - CPU" is dummy DAI -> above check is no meaning.
> > After the patch, it checks both CPU/Codec.
(snip)
> > I wonder is your Codec which is connected to no_pcm DAI valid ?
> 
> I'm not sure what do you mean, if it is valid? It works fine before this 
> patch ;)

Ah, sorry, let me explain detail.

	static int soc_get_playback_capture(...)
	{
		...
(A)		if (dai_link->dynamic || dai_link->no_pcm) {
			int stream;

			if (dai_link->dpcm_playback) {
				stream = SNDRV_PCM_STREAM_PLAYBACK;

(B)				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
(C)					if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
						has_playback = 1;
						break;
					}
				}
			...
	}

Before appling the patch, in DPCM case (A), it checks CPU valid only (B)/(C).
In many case, DPCM is like this

	dynamic			no_pcm
	[CPU/dummy-Codec] - [dummy-CPU/Codec]

I noticed that before the patch, it checks dummy DAI only for no_pcm case.
But after appling the patch, it will check both CPU and Codec
valid (X)/(Y)/(Z).

I think this was changed after patch.
So, my question was what happen for snd_soc_dai_stream_valid() on your Codec.

# I notcied that avs_create_dai_links() is not using dummy CPU on no_pcm case...


	static int soc_get_playback_capture(...)
	{
		...
(X)		for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
(Y)			codec_dai = asoc_rtd_to_codec(rtd, i); /* get paired codec */

(Z)			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
(Z)			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
				has_playback = 1;
(Z)			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
(Z)			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
				has_capture = 1;
		}
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
