Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D6E774EDD
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:01:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66B87E91;
	Wed,  9 Aug 2023 01:00:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66B87E91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535676;
	bh=c9QwdzVvAVEKaFh+BX9yc7EyoWe0FmA+Vo18TSqvpOk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j/F1+UhsyzOi+DS6xuUS2la+6RDXxxhuES7sUmz7naq+TwHTyiMa8rkt8y9KHD6L5
	 cm5gIGNsSkK2bvPAN/87fLISGJ+DrMY7h41+3baPC9vJ8SqqDEP5ALzGJiU8zO1mXL
	 cVipx7kezvrh9r+MGrRnY1+HtP3/ZNjLDYS/MTVc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A278F80622; Wed,  9 Aug 2023 00:57:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97372F805A1;
	Wed,  9 Aug 2023 00:57:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 78842F805A1; Wed,  9 Aug 2023 00:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33BB4F805C1
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33BB4F805C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OSwM8ooQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCK+8hrn5HozrVQJ1MZLlzRkht9OStNIDvLTcybTJbB0Zhqb80W8ILT8nnB2H9DwOePfxavY1Z7XfYGKiZQ9bTKVFpI9NDkNvkPNVzl6M0RVerZvNu21IV5mdBsjVzxk7MLiDesYkvB+J+NI7MJl5dWeH3JM6byw8vp1tYJ4sJzVZ22rAejZIAbQzVG4kqM9+gc/1FuGZ523fl4OlKO+jxRR+7QM9tUQ5iezmYuAivTb3tf8G/GjAKpJ/pIrtuPVzlcHRzpm0EN48iy7hqR56w6Gbqnlsdb8l8J4aArrEPDpA6w4QKIcHNx7wXuPEKjn5ln1c8XZCOf2LdzUJnMZtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqI7bGgWZSE+Q59gSlBIfS0knXrYQ5s0pO9A2whdfa4=;
 b=PQ1NFNbxC25sA0l3v4VFPzT5hkpkqRgSPS5/O2ceqB/vZdFXy9IxmwgKm0Qp2+ZNABb6wtUqAt6QRUMTSUSFnwxIRtQ7TZhRYMFiIUXUddnt9/WuXbC+ElhpckFU4dnHpjoVVIEWr3Ab8XM1YEgsfoUgSMCeTD27XXnWrpKoKV8qVvHEPYOYe6iyCFHhvFdwgYz7dxwUVi7EB4nLjdsxji3BeSysa4ZH372jxngRmVL3R+7TYezGjH4lv82TmviEtLjqpop5YsXxaJiuxIDqk8/5ibaAqsng2NxSMpyk0WscabkEDG2B1I2tfP/UIVim1U1A5XfJ9miQ9NqsYDyWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqI7bGgWZSE+Q59gSlBIfS0knXrYQ5s0pO9A2whdfa4=;
 b=OSwM8ooQTVzAb7MKjPJzQisTdSVGYNOpUdca8RFqVyQdmJobih4aqo0RwVGSsw+vXF/PGO+PR3EK1HHHuFOliktWMNx8qXKHfWW17SUKy9K1Adzvzker7v/8zlZuTEkvKDqVi9bJEF3K4mr3cLpy9TgoslBkJuoghwXtid1bpGk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:53 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:53 +0000
Message-ID: <875y5pb0sr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Ban Tao <fengzheng923@gmail.com>, Chen-Yu
 Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Samuel Holland <samuel@sholland.org>, Takashi Iwai
 <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 19/39] ASoC: sunxi: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:52 +0000
X-ClientProxiedBy: TYCPR01CA0184.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: b86ecf09-5d34-4990-9ada-08db9862c1aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y3zARLJmfl06KWOq9s2RL9TVlYluzAGe/dC+YnHUtKG9L3ZVctaGZzmYcoK7VMvWZAychq178OEPu+c9rtpQ+dq/5OI01bkAuMimWXjELLoGfoQrGazWm7UuvtZs0OZmw9hjrban4SAU4crKZcOIR+Tke5ZwqpUCwibYhCkRpYgutcSyJ8zbUXj+iRcqjKWwqDEUWcC1zns2t6OA+/EF1tTDxQb/HMHLNEqzJGobKpyHzbUvOtSTN7zZkGGA+6bgeiGGOxugYLYq7c+7h4KXPb9SbwroXOr9cMm14YMLwIrN5FbelqCiEzjAAOOk7+3NxmfJJTMe4QaHDC2V3RUMKxihi12O3T6PZUtHlAUtwAg5ssrvneOIFEAUVEO4wakCRYQgSvIptsRRF2YNpDb/iN8IbvZpTxAW9lcbFg2TOSjNudNrRh8c+7HkJM3sDY5G5EqyG4e6Ht4nS9HMB7QCedpwbi/Eo3h+ntt9HSKVPAocreMf8gyr55VsMlcSPtDuoY4AFm2QXzt/Sr+O0hnaxdAvBu8ZqDvFPfqhyiZ9v4ktTsaB2bfLBywXboJVolToEfz6Xda6C7sSrR+MrFnxoDFZpngsjRvLBziSLSv6I8w6egp8GwuyWaCVIovCb7FE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(7416002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XMISlAiH/8qAmhOec0FKiiiqJBgl0xN5KMJvpxcavp5AARi6+5cmBQPR70Ro?=
 =?us-ascii?Q?roLSHXRd8X5DAyNrK9sVJPMI/OWMpcnzs2a5++lg52619sL83wzC8WeNXMFW?=
 =?us-ascii?Q?SPGKotRYWiZufsrYJe1qeP9L5eW2vb3DNIu+aDbJHkWkRGw1y+4sa9jWUbE5?=
 =?us-ascii?Q?ACanjaTczTw85NAsbyV4rDFdprdsFGQxowVmNVo4nMC7d3gBxCadUtcyd2Hk?=
 =?us-ascii?Q?pSX9CPYEJaBp+G/eevFA9NgmBGf4khX/sxMK4WTokW8zp/8tJtFi0bmtaKwC?=
 =?us-ascii?Q?9lGzzYsc9EqGyiXRoJdhFvCYz4ycR0KwbcbCaA6EwKZDNHDtDKQ4dvdsFB36?=
 =?us-ascii?Q?/DOSMxaB3Je7lRo0wp2d3Ll9xkbkR+V3DvyHp6+jQlyQPtNMzWJkich9Bdhh?=
 =?us-ascii?Q?xCyVBBAW4bWsvoTyJGCS0QuRCjrh3yzAV4yC5FtrIoUaeEPj7VdG69CU2o8y?=
 =?us-ascii?Q?ctfOySsucsnCF64FHrlQ5tYao/IBBKdaUTgdz5eJqUfkqEvNor6bYvAd9fSU?=
 =?us-ascii?Q?EWUX0LRbPQC8XpfZWBrG8AibdYSHUj9p8RL/tmKjvCxTfjKRCyNt+/cORz4s?=
 =?us-ascii?Q?10hnUrQTIfLTMs9hEYvbHj/zLKljFUquvS3wQTDjrS5tl8urM/lFzhxjAVPI?=
 =?us-ascii?Q?JCm1ae+m0iQy66fY9w5OSiPe+vQ12NRfOTdOHPv3jKKiEE0RPDC3e5BRMqaC?=
 =?us-ascii?Q?nvRPpPIGyZw5YDEmO9ekrx1k5x3usgg0UJWzDTrgxQBXHrN52kZWgY8KQMGJ?=
 =?us-ascii?Q?kcTnLFIlqt+Xw0M0TFD0VwagDce1HcTaM0nT4lVtaq7w6lArbMAnYeyvTJO+?=
 =?us-ascii?Q?o8bmtkZ8jpZSCjAqM8b6ZNm+o+rbq/gwtA4p4mJ/eQs75vNYyOtS4moY2rgd?=
 =?us-ascii?Q?MPl8/IbFl8gDjwhKBMhz1NGfYyLB8TTcdJRJPexxl+DR+WNg3kFt7WY2mTPy?=
 =?us-ascii?Q?s5IPIKWoqeJMApAYqs9MGFNKqRFRFQKbNQ6+Cw454lgJml2Nn8jfHKv/pANd?=
 =?us-ascii?Q?XrSQlV4WFjW7VwJaQboD8zE8k+T0r6D1gLVjYF87LMoxoxxMTV8Y+uGhYSxU?=
 =?us-ascii?Q?//Ei7T+axFYlFMC2+DDw8SekMPm+4bFJUpihBApUGOgLQgF/xBtU5N0x1VTM?=
 =?us-ascii?Q?cBGsP4MXpHFXn/5YcV8l0s3iuU1FIgwFU5cEntnham4JSX7tQPVo+Gl/qdxR?=
 =?us-ascii?Q?mWqsTAKWg85t7F7nWAH7GM9f2sf8oiLM9nTomgDASUHl6JC1K0kVBsetoTur?=
 =?us-ascii?Q?Vr5odW23HbgeabQWT0aNkdrfJ5yYOAFoxpdZaxMaZZfuTth8G+EIN45/QjHu?=
 =?us-ascii?Q?hx5pwHacMiYTYZ6JAvAaCjosHbXuiDRvL+VSoigBqLYx8uES/ND97ocaOy8i?=
 =?us-ascii?Q?XjVKDUQtHEyu0fOtPAU/RNNQOyTXzFXFn5PT8s7GX+DBf/gYlz6demTV59lF?=
 =?us-ascii?Q?Nh7yGHlyfpPIuKmNxMANG9ld72Xr5YtNRUX2HgejiRXBiTqJhGGgG/7NJGzW?=
 =?us-ascii?Q?BUtRbhA4nmA8OH1l0zV1XKSV6XKO4ZzrepWl+Q4xYs8aF6d6IzSG4tKNdBnh?=
 =?us-ascii?Q?/byVEG0YUv5YJDp2PTicba6HtBuoaLBqJJiFW9+SEB2heDYjakwIg8/khtn4?=
 =?us-ascii?Q?I+rs1OzoCAb4YULhKZRMS44=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b86ecf09-5d34-4990-9ada-08db9862c1aa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:53.3677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7bUnwKvVwwdCZ2l6XnONYK6cG7YIbcQpeBGbITz1z9dTM0CniIYn/sMRVM9DtcE8Pch8+4+8sFGiQ7ZWXpWrNjC7u9Jyr4sX+XF08xzWMtokbNXos0rspfOFpLTb6wy2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: 6RYJBYAN4TAN4HICTCOP2ICSXF3SQPGO
X-Message-ID-Hash: 6RYJBYAN4TAN4HICTCOP2ICSXF3SQPGO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6RYJBYAN4TAN4HICTCOP2ICSXF3SQPGO/>
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
Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 sound/soc/sunxi/sun4i-codec.c |  6 +++++-
 sound/soc/sunxi/sun4i-i2s.c   | 18 +++++++++---------
 sound/soc/sunxi/sun4i-spdif.c |  2 +-
 sound/soc/sunxi/sun50i-dmic.c |  2 +-
 4 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 55328850aef5..f0a5fd901101 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1252,9 +1252,12 @@ static int sun4i_codec_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops dummy_dai_ops = {
+	.probe	= sun4i_codec_dai_probe,
+};
+
 static struct snd_soc_dai_driver dummy_cpu_dai = {
 	.name	= "sun4i-codec-cpu-dai",
-	.probe	= sun4i_codec_dai_probe,
 	.playback = {
 		.stream_name	= "Playback",
 		.channels_min	= 1,
@@ -1271,6 +1274,7 @@ static struct snd_soc_dai_driver dummy_cpu_dai = {
 		.formats 	= SUN4I_CODEC_FORMATS,
 		.sig_bits	= 24,
 	 },
+	.ops = &dummy_dai_ops,
 };
 
 static struct snd_soc_dai_link *sun4i_codec_create_link(struct device *dev,
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 669d712bbe9f..5124b6c9ceb4 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1081,14 +1081,6 @@ static int sun4i_i2s_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
-	.hw_params	= sun4i_i2s_hw_params,
-	.set_fmt	= sun4i_i2s_set_fmt,
-	.set_sysclk	= sun4i_i2s_set_sysclk,
-	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
-	.trigger	= sun4i_i2s_trigger,
-};
-
 static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
@@ -1100,12 +1092,20 @@ static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
+	.probe		= sun4i_i2s_dai_probe,
+	.hw_params	= sun4i_i2s_hw_params,
+	.set_fmt	= sun4i_i2s_set_fmt,
+	.set_sysclk	= sun4i_i2s_set_sysclk,
+	.set_tdm_slot	= sun4i_i2s_set_tdm_slot,
+	.trigger	= sun4i_i2s_trigger,
+};
+
 #define SUN4I_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
 			 SNDRV_PCM_FMTBIT_S20_LE | \
 			 SNDRV_PCM_FMTBIT_S24_LE)
 
 static struct snd_soc_dai_driver sun4i_i2s_dai = {
-	.probe = sun4i_i2s_dai_probe,
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 1,
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index ff18d4113aac..28bf6f4dca46 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -508,6 +508,7 @@ static int sun4i_spdif_soc_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops sun4i_spdif_dai_ops = {
+	.probe		= sun4i_spdif_soc_dai_probe,
 	.startup	= sun4i_spdif_startup,
 	.trigger	= sun4i_spdif_trigger,
 	.hw_params	= sun4i_spdif_hw_params,
@@ -533,7 +534,6 @@ static struct snd_soc_dai_driver sun4i_spdif_dai = {
 		.rates = SUN4I_RATES,
 		.formats = SUN4I_FORMATS,
 	},
-	.probe = sun4i_spdif_soc_dai_probe,
 	.ops = &sun4i_spdif_dai_ops,
 	.name = "spdif",
 };
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c10439b9e0a2..2599683a582d 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -236,6 +236,7 @@ static int sun50i_dmic_soc_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops sun50i_dmic_dai_ops = {
+	.probe		= sun50i_dmic_soc_dai_probe,
 	.startup        = sun50i_dmic_startup,
 	.trigger        = sun50i_dmic_trigger,
 	.hw_params      = sun50i_dmic_hw_params,
@@ -260,7 +261,6 @@ static struct snd_soc_dai_driver sun50i_dmic_dai = {
 		.formats = SUN50I_DMIC_FORMATS,
 		.sig_bits = 21,
 	},
-	.probe = sun50i_dmic_soc_dai_probe,
 	.ops = &sun50i_dmic_dai_ops,
 	.name = "dmic",
 };
-- 
2.25.1

