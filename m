Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B11774EF3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:05:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B278BEB0;
	Wed,  9 Aug 2023 01:04:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B278BEB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535928;
	bh=UM7zh+tVcLgJiiosxWM3wWW/ZzD8GO/vXxINOnvQz5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T4WOcIulFiWXkJ1dCvqD81hSkhLthoJltVbtMRAdRb0OlNH6csHAFkeAHogsR/tUY
	 9SxNz2eTBUlEFJAHmeRdgmywDUd1+rQT0UODdyxM5OgVXm4cdOdUPpBxqdyKBI4HtC
	 9KSGrfRd0fsC4ZVQcIi3RDwwCqDsf4tRebSxnqWI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2A2B6F80601; Wed,  9 Aug 2023 00:58:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9AE1F80606;
	Wed,  9 Aug 2023 00:58:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 343A3F805F2; Wed,  9 Aug 2023 00:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAAAEF805E5
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAAAEF805E5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=qB69Nlj7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMn0cctktMSvrppbR2L0h5UXvpJcD3M7pFh4TTHkYLyFBPpg99UWGokvW163yS43a1FPhtAP+SFnSBl4MOwez3T58+vQafXSLGt26PravwzV7AamftcK5/TYXOhp6dmhpJMS27GDiGSrYI3krFZt31zlpuEkopKHEgBMtW8gh1cDsvmZXbmTWOjmm3G+MWHXC4qhs4InNOBf7kn4BZAXQYO5u4KYGrIpET4/Z4Jk7FK3L6quVod28lhRO/JGGLzUzjXO18QYnKw6pgaMMEFqOz1ev4TioKAzVUHJ8CjUe/u/Qb8iwXWzbG5OCbIYK7TnRWsIdSIWMt2ym2BwVL2wHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hxzCxhO25b7kmHG7qelgCvoD/z8ZwNpUrn/0QslTleM=;
 b=L5zbU2cOib2UJAwKNk5dFcfUkgr66og2M8iIrWRBHmIL3Fq27MGgb0tDIKfMkkTwfxhlTdCEfkY+NY+y/yzhTDCev6csHkxYlXeUUN8dVPudiwQYQocmb6VedYQhf6Wusyd4+2vbkKctNSpFPOHgmt08r1O3Wdt/Iqa4Q3xbwzZnBgXbu54lGWJKeriQbGg8rn90GoFiFItzcxjLKlY7fhYqF685q2jiVGe2eWI8uAVLRHcGNNlmhgxpMoNuQDgctIxuPBb7mORd32OYmezrSWHJ2IhVZnU0z17Mq13TRlNheXjBidfA0hcqKduxdypuf3x9Zj5biZImE0MM9vxCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hxzCxhO25b7kmHG7qelgCvoD/z8ZwNpUrn/0QslTleM=;
 b=qB69Nlj7ioOzADPkHA4twivh+VZ48lykTDTCPh7aqG0HR/MiiyjhfwI2wVK6NL6EwubHnZVv3Baj5iHpmCHKDCUtSmjjrP/prhb4gMCopFYUpDM9Dnt/lF2ywUh96blZJLTtWVH40k6qzDkwLHDyx+AqKMi6TiML6I4xYOu8yIQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:36 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:36 +0000
Message-ID: <87jzu59m5f.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Takashi
 Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 34/39] ASoC: codecs/wm*: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:36 +0000
X-ClientProxiedBy: TYCPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::18) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: a589918b-069f-4e89-328c-08db9862ff94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Eg0BBKW3ynHTpm1SyoLrdZ3dthxsHzMFYORo4R6R7h1ZZuLx/kRPtWhPtuTSdv38FbEMdAsFMZyN6fNjrSNs61e7Nnf+2Q3XXNR5pcFbV9j3+r6pSWenXWEGXpTSXzBgTNayq9EGDrAajKQVsKfl63Jmdr5O73wyf3BJHB0iTMR5LgvN/RMIYYqW2hOQPCbz10A5Jc/jod/llRvwdVXVHWpNeWhFnO8JIuEF+32Y7sa9+2WWvNKo5RE4In8QsVpNVF3zkX35NZZuFiXNW+1+85wUnHCKef/6zr25i6OXL+fiiUr4sn53sBYoVTe5fGh4z+6p+R3fRHEAeFnoQckAkJJphe8EIjksRUW6WCx7IN3PdQ3GDhOe3nj99kkLR0HXkBlC/lhXdhW3niUIvfufJTtx/fP0ar07RzQDyKS0LjyvmHQQ6ZQlerbP9yCcV1HIrGsqiePDz/I6K01AHuA5FsL7m8CAHqpr5JAYHj87hYK+3NXvRjibZkZsLyIxJ1z+0rD/rakzsm2/DPU4rXIcBWp8FyYlMKUzkWQd0CnK4qMnGcUPrsSWDra4Vv44ottCGAT51Xa/zY3+oiSkOq0Pu0ZsrPlnB1u96qkS3tQpaIFVmlWysBoAjpBUB+JXh5II
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MBMApq3Vlyf9RVDYrCjmR4CNX3AswXUD+RHz25+uah4P9PwsZl2NAOf6Sue9?=
 =?us-ascii?Q?3r5VsGR8Or2DT7/MIlOdb5cF1t28cfwhCOmhllxO9yn1W7ei/z4tZ6zOEV/K?=
 =?us-ascii?Q?Nr8uxVmnodORjROVLY8ZzOp+TqNGc0ErS6fVcxusRUW2p2S2b5QE6Dyayov2?=
 =?us-ascii?Q?E8uxCh1hq4TLdJa/fI37qY5/nJ0BtHz/IlnnjF0/8b7MR9PqXRuMVagLulD7?=
 =?us-ascii?Q?N/qngtzFoyQEs6G4adKcBk+6yj+OBGvbupfgXWVBWBIlsSB1urcBtV9cJINQ?=
 =?us-ascii?Q?PV4l0wbUiUtEqk/T1SIkmKKz5/+OY2yy5tQvmUeT1sS3s7NcEE57q2dyIkk7?=
 =?us-ascii?Q?X7cWZK8mMRh5ln1eIYiPvUHYp6s+TIjqC9TmKhgJCq5MwBbBn6bRKtEofeBl?=
 =?us-ascii?Q?I7mYufvWj4m9NQsYXmL0cx2GJA2O0/Fh+rQXQniGWk1vBnL8CKnCCKsSLQpB?=
 =?us-ascii?Q?s1h6Ddtq/X17mhuNJ/FH4cbAAice+Srw+KKcxnwvrLAz134ouIdmf6n6lUsm?=
 =?us-ascii?Q?TItjgWVvfTQJEyh2v6tJxb6WUHwwrBw3fRtnlcuYvLSyoMu7NvfaAy0qBAiR?=
 =?us-ascii?Q?+1OFmvkBhzuO0faqkRjiJJ/Ng0kIESlfCm9/24yIV10pHmQvgc7ZZbLv5P1G?=
 =?us-ascii?Q?Qz8cAb8NoA7Pmw88CLJ4dCxWZPFUpafAHQWIs6I3/HsYM8XO47BTWV2kgEDD?=
 =?us-ascii?Q?QoJd8ZMdd5jMKEfAqOUkItwP33ImkwSWoEaRXRgRNeW0CRmwm42adSlT5M2n?=
 =?us-ascii?Q?HWl69DCCM5/scA9NvRmbqd5xeWwdgNFYYH+Vb7xsFCvUZOkLItayjMM+Znqu?=
 =?us-ascii?Q?u2AEgSAimnIvkHh0cy7RK+C8j0qwJCPGA5drKMCP0vLdBRBptj96V48GLrZA?=
 =?us-ascii?Q?FX5sfITfip6K8DdOBINI5RO1IoBVLbQ8pIeuIS9BI0D8r9rVJi2Y5WHE1fOr?=
 =?us-ascii?Q?rWsUGvyxQKb+isGE9A2+w9gFcsEpMSgIu2U0yT17skgYxYZjsWVouMNlcXT6?=
 =?us-ascii?Q?vkqHYx47kp0PAWAJ6nGNqy9oF9Nk/QxO0s6FZu3i3FD0HBVe4SFwwaiatSi9?=
 =?us-ascii?Q?5mfLqnPmu2EzAEa1utrj3o0BMa6YhXBFMjGqRE7XMTsl065QHTBJiwBOOekw?=
 =?us-ascii?Q?8pfasdfdTi8Q6jttFgkTbbai0eNPNDUns047EQ5CqR8Dzie9K8I0h+M/z8VT?=
 =?us-ascii?Q?cxF+Repl5D4qlTr/YPUXqoB57XiwgfFMmG3EobRzhVEIeAUKU2bxPpKToa2Q?=
 =?us-ascii?Q?vSePTMCdYBoQb6N1koE4Q/MzK3v4pU/JzjMOl2svrFD2023gJzNT5fGHN6GE?=
 =?us-ascii?Q?sFcThk7OPTi3vj7romyyYW6sitzrut4BGjTu6fhErl3T8S+j5zCyh0IxzAtE?=
 =?us-ascii?Q?oDHnhWNSyh64W0WjMhy/aMv1qgBasNSpVPDcCnB2zZqXdH7mgDGG2epSmXNm?=
 =?us-ascii?Q?8LreVKzJh4dyMgPNp2jBMcULOLyzS9k9I+UyAyDYnNzMQArwrdrbJcxczDXX?=
 =?us-ascii?Q?9OI6XNXfig+2n1r/CfvX31xq5pF6TVsqOMPOtnHYkrmnY9o5eRgQxXwAc/sR?=
 =?us-ascii?Q?a9+R/staGLCHDsED7ttcNz9Q4aqhWfKWUHrpl6oZvK5J1vLIZdHkpI+KHv25?=
 =?us-ascii?Q?h2rGGT2pAf8AB6Iy04Lk1b4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a589918b-069f-4e89-328c-08db9862ff94
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:36.5928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 cscNIbUYrQ7IQ2H/yfKK1O/sFixFs9uFNlKenoXg1Dgw+4Lu1A2kdT5ls5CUIYjx7RjH5xmuarP7cQQ3CGwnyHWlDteAGN85RiOH7I4IqtVD4CqGZ9vbDj3intJg8Bf6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: QVDIFDHASAWCKGWRDHA4JHL2YTZVQA4B
X-Message-ID-Hash: QVDIFDHASAWCKGWRDHA4JHL2YTZVQA4B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVDIFDHASAWCKGWRDHA4JHL2YTZVQA4B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm2200.c | 12 ++++++------
 sound/soc/codecs/wm5102.c |  6 +++++-
 sound/soc/codecs/wm5110.c |  8 ++++++--
 sound/soc/codecs/wm8994.c |  2 +-
 4 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/wm2200.c b/sound/soc/codecs/wm2200.c
index 36cdf97993a5..9679906c6bd5 100644
--- a/sound/soc/codecs/wm2200.c
+++ b/sound/soc/codecs/wm2200.c
@@ -1770,11 +1770,6 @@ static int wm2200_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops wm2200_dai_ops = {
-	.set_fmt = wm2200_set_fmt,
-	.hw_params = wm2200_hw_params,
-};
-
 static int wm2200_set_sysclk(struct snd_soc_component *component, int clk_id,
 			     int source, unsigned int freq, int dir)
 {
@@ -2068,6 +2063,12 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops wm2200_dai_ops = {
+	.probe = wm2200_dai_probe,
+	.set_fmt = wm2200_set_fmt,
+	.hw_params = wm2200_hw_params,
+};
+
 #define WM2200_RATES SNDRV_PCM_RATE_8000_48000
 
 #define WM2200_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
@@ -2075,7 +2076,6 @@ static int wm2200_dai_probe(struct snd_soc_dai *dai)
 
 static struct snd_soc_dai_driver wm2200_dai = {
 	.name = "wm2200",
-	.probe = wm2200_dai_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 3bdbdf3770b5..4ecf07c7448c 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -1773,6 +1773,10 @@ static int wm5102_set_fll(struct snd_soc_component *component, int fll_id,
 #define WM5102_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops wm5102_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver wm5102_dai[] = {
 	{
 		.name = "wm5102-aif1",
@@ -1906,7 +1910,7 @@ static struct snd_soc_dai_driver wm5102_dai[] = {
 			.rates = WM5102_RATES,
 			.formats = WM5102_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5102_dai_ops,
 	},
 	{
 		.name = "wm5102-dsp-trace",
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index ad670300de8d..ac1f2c850346 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2073,6 +2073,10 @@ static int wm5110_set_fll(struct snd_soc_component *component, int fll_id,
 #define WM5110_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops wm5110_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver wm5110_dai[] = {
 	{
 		.name = "wm5110-aif1",
@@ -2206,7 +2210,7 @@ static struct snd_soc_dai_driver wm5110_dai[] = {
 			.rates = WM5110_RATES,
 			.formats = WM5110_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5110_dai_ops,
 	},
 	{
 		.name = "wm5110-dsp-voicectrl",
@@ -2227,7 +2231,7 @@ static struct snd_soc_dai_driver wm5110_dai[] = {
 			.rates = WM5110_RATES,
 			.formats = WM5110_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &wm5110_dai_ops,
 	},
 	{
 		.name = "wm5110-dsp-trace",
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index bca3ebe0dac4..a48e904a9740 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -3215,6 +3215,7 @@ static const struct snd_soc_dai_ops wm8994_aif1_dai_ops = {
 };
 
 static const struct snd_soc_dai_ops wm8994_aif2_dai_ops = {
+	.probe		= wm8994_aif2_probe,
 	.set_sysclk	= wm8994_set_dai_sysclk,
 	.set_fmt	= wm8994_set_dai_fmt,
 	.hw_params	= wm8994_hw_params,
@@ -3269,7 +3270,6 @@ static struct snd_soc_dai_driver wm8994_dai[] = {
 			.formats = WM8994_FORMATS,
 			.sig_bits = 24,
 		},
-		.probe = wm8994_aif2_probe,
 		.ops = &wm8994_aif2_dai_ops,
 	},
 	{
-- 
2.25.1

