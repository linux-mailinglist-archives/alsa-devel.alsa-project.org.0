Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661D76C1D7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:03:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B000E7B;
	Wed,  2 Aug 2023 03:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B000E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938207;
	bh=R41vi6JEkYsKun0uFQKPu+W9XUh/LPn3H/bf2DTeyq0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J/hf7YQhiKfBR90aS6FHvfzGGApRXtuolW0iTs+ZPyX8CnnwPHfC/PvHZzEPhkxBj
	 kU0tyQfceR8DnrpkOKsbr6ZOaBZ/fkqg4YYKt8j772o6seEUHCf28fB51fMas/MeOu
	 oYPsOs+m2W40403tu4aymm0xZ55iA7IUmbVa2GPQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42D9EF805BE; Wed,  2 Aug 2023 02:58:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFAFCF805BB;
	Wed,  2 Aug 2023 02:58:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00874F805AE; Wed,  2 Aug 2023 02:58:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27E22F805B1
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27E22F805B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VqNjIZV9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LdM/+fr5sxhQ3Hm0FFfFYNfwRt5fUI2KssXm4TrsiF7C29ot1zH5g61dUYLd+cbBFkzbE4L0iZdnLkp4vZPEFCLClg96kXFxOsc6LOC4w70vVm46rYwVgonQNASWdau9Ta1tlXo7gre10A6QswAP/8iu/TgnA3h6KqP1PB1mGjPyYjfTjR730xMJCMtCySBZbd+vQG5ovAKwHEXYLaAFzPefFzuFCXkTOO5CLqDQqpPA+6WfNa9j6QN8C4EUw6XlVlrnLxFUB9wF4vRh4e4/wgfMKIlLDeU5QU5BAbWpi6L9ejs0P76dWw89U2oRrJ6brwi30EY1bF2jGpb/Mw1xyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZVFTNgAZvVXXI153v0wytHlmhRuFGjCoO6U5VC1Hc6w=;
 b=Dfo62cYhe0dZibMS9+Q6Ap8eG7GCeRB+w3cQCNYDIlevgvLLkeu8shC9jDmdGhfjo6SrfUxFqeiG+au+3qBDkTp5AyRyKiRrGByR8+FtUGVNUHi6DwyAmIxleIRwaj6DhFg3ExkFff/0om9ljvV5rG2yQzs7jVMWKiFKMAkrysWVWy1u7F8qNPV34tv59NCdJE2QmeOuJ/Rx1N2YTKoXHRfQO2Mdcj8+ZOoC78pMsL2EwG4hoGI34VFywOjoaPU6x+tLmOw6u56O89KmOs0+8qOKBDURvk0Aq+qDtqTZ7izCgrKy0mI25iT13lyjf0aIKvSpOJ/UsEPafRBbwfyThA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZVFTNgAZvVXXI153v0wytHlmhRuFGjCoO6U5VC1Hc6w=;
 b=VqNjIZV9pZm5I6zR4fKd2IvFCiwsE6WVxV9PJudcrvwiMcrblFoAi9jr9L97DKwrWQeOuEohvQkHXaRQAZ/DAKi710D3WtZ9cFbrABYwDuODjz8zn7HVVY5XQAQ0cAyYd/pbNqdzg+z/HGNAf0RRC2DH4md/qRYiZFJ+RKfdpbo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:58:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:58:29 +0000
Message-ID: <87tttis1jf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 36/38] ASoC: codecs/cx2072x: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:58:29 +0000
X-ClientProxiedBy: TYAPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:404:28::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: f4a10b8e-b708-4eea-81f5-08db92f39616
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	SCiAUKgFrdQVOXkui4KPnTEEF5+2XfTId+AjfWNTJdHT8KEfQZVbXLTn7aqpGeTytCJqPxT6ZS5ERDjG9p1Jd78IvjMmX0/9Iz6Zn2kvhJ+UwfYmkMqUVVmdsO4imylpK8dZSOGFFBEmoklOGvNWr9W3/GVqXjAACvjqpvcgqpMGzQdj02qvGxOXlKI+/qbvwqHIYKBb/qKw9yJOkPqHtpVcjCC2d2mNGWy9cMBpYxIYdwNYie/rFuhY4V9Cu5IbSqhy1Qn4h9DOHSfC+tnQ3QnewevZM0NiosfmGTb6fPzOWEA2LLa6pPGFGUilU99op24hLf+dnlGDNQskMlIUyeJhg2nlo7VxHtRU2BYRnYcv17aCN5/pE9qsEw5v1lG+/Tooxim9BQWfZ9ug4BK2eSIHh2ryOdydG9T6pbGeQMpn0KTVQQjY9m9DoSpZVMLgQZ8CvHTzisG7uR+NEmTHqYKuXVoLebnwKt8O3YDMubIE4ixC/ADK/+1fHb3pcufEhF11N/ycgMc+75NNFJlIY3qSMCAJZ8rhISd5jL96VocQ1a+mMUPx82DrmvFFWsBh/7tkP4BJWeedXuzda3UK5bOcTve+/k+QGQzDkf+HZm+I+vZ8ZnWXg2CSpZFP3N1A
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4Clgf+Antg713hmhTdzcXATAAr4ce3B3a8+Rdf9Rf0LXYq/G3Ker5wy1dbLk?=
 =?us-ascii?Q?DguPQg8vpNjGlMHhzOpWFyh/ITpYCkNd1OLIyhXctegn/dfws2OzImEZLWm8?=
 =?us-ascii?Q?baOjy5KobgpeA0eaL1tIT/5i4ZTU9frOrXK3xDvra9F8PoMm5U1aB58h7FGQ?=
 =?us-ascii?Q?Xuth7tmNCqqaAMZNaDuYM/KzzwSUy01w6JYXcMSGd59xtewK1tzfkN83MOpe?=
 =?us-ascii?Q?fb+HOvcPtl8EDNgm04RtvEk1Q/KzB4aFCn9kbR2K+iW3rCtPluMAj6kTh8+7?=
 =?us-ascii?Q?iIGgYoH+UpRL4mW/xdr7pVuz+xHuS3ilBQNAM3i9SFuzwW/eVg+IEn2eUnHo?=
 =?us-ascii?Q?NTY6V5eEXRcdA0AUZeQRh2hvr9fBXElkgmAJUCDM1o0aXpBbTav7YNFP8uSU?=
 =?us-ascii?Q?Lu4KbnbmUC/Snjf3pWuVvYe99ffObw41vgBwvNH17+Kxy7p7Oc3Dkck16inh?=
 =?us-ascii?Q?6bn1cm0wUdysaQ50tsvh1fvyHAM3dhjQQ1uz+mJxdhNuepBsCPPm3QfQWZPJ?=
 =?us-ascii?Q?++722s1QtFSQIAfS8ucDCAZA962jSLcvAuIcQVo9mp+VSrweXjGvccW5NDzX?=
 =?us-ascii?Q?p6/EddiLdDhsLIIzEX6rA/wiL3y0DATioXjA2I4lc2AfRSfxi0YvQo2OZm9B?=
 =?us-ascii?Q?1SN/gBVuMGFL+JF1fxM/38cYxb8oo/qBRxa6A4NBLzGS29vCE5k3Ctd4jiR1?=
 =?us-ascii?Q?hIvksdyz2H5MLcpt0XRHMw0e/1/aAAPiN3cctMbQg6lqjXVmG5Vh2agPWpop?=
 =?us-ascii?Q?Lb2+7X+Ii2YeThuxGEYOm/Z5fyARJiCYoL2PEtxWbbQsCzmw7gmeatF88wKL?=
 =?us-ascii?Q?Uo4OrjmV+Mod5JIpsJSsj0Us5zk3Q88DYGaiWgjq3zCgBzefQ4ad0u2J7TVM?=
 =?us-ascii?Q?61zw9PdN944nIrLQXGGH6yx6ufnqvUI5qVpPKeJfYdUq3IeujXNyZo/KD3O4?=
 =?us-ascii?Q?cFdrMhNXZWQ61+Nqw2V9AHe7mGM1OM8UZp6F247oPiPCwh+348oelW71anmK?=
 =?us-ascii?Q?Awoz6HsllkZMf/su8sTRAgKP5DNnBtj6OnNWViyro/2cvyxb0limr6zov3BO?=
 =?us-ascii?Q?JOAvZOh5+o0UP7Al8g2BTBjeV8kO0yQsRIk49J/2u0tE9KHSImWqPdI/k88M?=
 =?us-ascii?Q?lBe982wek9afUUyt/CdWeIB3MNYrLBJLEjArTlBvH9KlNiy4d42KMhHybGAm?=
 =?us-ascii?Q?vjcJTRcAXqO2Vh1lR5OeEbwM3syVKqdnDsYwBaYDqg3sBeK6JFlgwheMkZz4?=
 =?us-ascii?Q?85BJpgGFloqY4sARkNTOTrsRiLVGM0ffQfrIcIAywlzHQffw7V96yblYZ6JL?=
 =?us-ascii?Q?6KgxCXr6/0LAFSoT5grahysdEdegCN335vbkfnetOnQDm04CPgasLkYSkf7R?=
 =?us-ascii?Q?AV3n0DVpmOTEpHLfp1cEjFr1in8gNswJ3WjoZAvk+mCxKYV7TwVH/K6vB2ZP?=
 =?us-ascii?Q?aTUg41d6xAyBWDb36X4xxYi8Ks3I1OC72A+oJbx6RIQ7UbXDDOARxTJ0TEyq?=
 =?us-ascii?Q?KxdJ4lx6IUr0GILNq0hHP3aifb30NHM7nhcag+/u+vQmhPhwdvohF1HfanEh?=
 =?us-ascii?Q?7gi6EPJTE3xNK+bUNr3jseVp05HzSgV6jfJtvy/srIrPSDwmJEsH2Mon2Ygb?=
 =?us-ascii?Q?TiG80RqpmB00eDkLDIzehfk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f4a10b8e-b708-4eea-81f5-08db92f39616
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:58:29.7851
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ICYPuLgeseovxgoMXDCZKQejfiUsBPWvYWk4UoPNunCROHG0j5KwvLttQ85kNila/KOZe5yh2aljMpBRIEngmmQe1Rw2iMYuJ9JGHs0UnnCrJ3osqyKkCfjJwZPNdWEm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: FPRWYDG2MCX2GUFBEPRBSVRBLXJNERBM
X-Message-ID-Hash: FPRWYDG2MCX2GUFBEPRBSVRBLXJNERBM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPRWYDG2MCX2GUFBEPRBSVRBLXJNERBM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cx2072x.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cx2072x.c b/sound/soc/codecs/cx2072x.c
index 082231088a26..f8b128084015 100644
--- a/sound/soc/codecs/cx2072x.c
+++ b/sound/soc/codecs/cx2072x.c
@@ -1546,6 +1546,14 @@ static int cx2072x_dsp_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops cx2072x_dai_ops2 = {
+	.probe		= cx2072x_dsp_dai_probe,
+	.set_sysclk	= cx2072x_set_dai_sysclk,
+	.set_fmt	= cx2072x_set_dai_fmt,
+	.hw_params	= cx2072x_hw_params,
+	.set_bclk_ratio	= cx2072x_set_dai_bclk_ratio,
+};
+
 #define CX2072X_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
@@ -1572,7 +1580,6 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 	{ /* plabayck only, return echo reference to Conexant DSP chip */
 		.name = "cx2072x-dsp",
 		.id	= CX2072X_DAI_DSP,
-		.probe = cx2072x_dsp_dai_probe,
 		.playback = {
 			.stream_name = "DSP Playback",
 			.channels_min = 2,
@@ -1580,7 +1587,7 @@ static struct snd_soc_dai_driver soc_codec_cx2072x_dai[] = {
 			.rates = CX2072X_RATES_DSP,
 			.formats = CX2072X_FORMATS,
 		},
-		.ops = &cx2072x_dai_ops,
+		.ops = &cx2072x_dai_ops2,
 	},
 	{ /* plabayck only, return echo reference through I2S TX */
 		.name = "cx2072x-aec",
-- 
2.25.1

