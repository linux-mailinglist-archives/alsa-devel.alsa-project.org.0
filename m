Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE735774ED1
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 00:59:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86E6EE73;
	Wed,  9 Aug 2023 00:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86E6EE73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535589;
	bh=hQYni/gxt7JLymewevPtfkGHVGxU5v3a+ckiQ8icSHo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Tmf/XMAq3uRXbHMZ/mQt/0Sd1V3M7CB8rj9E60jjGg82P+ftT67+0TTR+LEDRzwbR
	 vi18AX24Ww/zLZ23C5/9gu2dcNcVT3od1o9PlBrhbMJ4ql6IOLEwnRMmfwpizV3rWr
	 CFz68lV1nCBsF7+vxvbMykeEHI3pAy9K1wT8ammI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4CE96F8057D; Wed,  9 Aug 2023 00:56:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 783ACF805FB;
	Wed,  9 Aug 2023 00:56:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0615F80600; Wed,  9 Aug 2023 00:56:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 16D90F80589
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16D90F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OF943EJi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGfkdG3rnLK4XZRqyJJt1otkCMe8dlYCzMUlZ3gTQPUre9TmO+G9JLoVlV+B8748chOJQon9ee5qY1CYD6pFPF5zYITTvpat476mG9rC3wrFNUCh2H6Od+eqrKZ0KrVYdPpx1hMo7sKR6taJdhS3Pz0NQJLWvCj6dvEJnm1CiyFp6vMHX7ffsluPzC9I48CVScHz3O8xjr9Fy8aUWYklXerlSy3A2EybRRdis6ZcIZPLRLxhEwtC+2BYjY4DOoskTm7xglqaiezUOX6T3Sa5Q0EdykyQNJNjo58LdoC92nlqykJ7Meb55Ny6iv9NVy85qAYyGvx/u0LsMRORHHVIEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FU4RAmCNy5jZYBxSn0JjlWwVDjc4LtjdpnM0azAG53w=;
 b=CkhzgqlNRbz2iD3ok6Z7FHIAx4Q4ASBE1Yx4DZP5bR4knMM4Fsn3keUB6e4NB4THyugFQOOmDmU+Im3VB/gNmhev2nqED2X1LHkCQX47dSdWUVeVLzBV5jfKK4LShnDAmP8E8/bFyeBot568j7JAjiea1UXFYg+QI3a81i8o/Lw49AXSXMdlEHFrndEsSTY+TW5w3hXaq8Db0xRubhVZRDzbAtKbbwHf3baycGHtXRZax6tkq5ZlOH2frSWQ50SOOb824D5FPvJSLw21nztuglRGzav7jORk8BRwYWkmkgwThhVMLHPeU+Bgqi9czYI01DprrAtinsuhGOE5iZooqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FU4RAmCNy5jZYBxSn0JjlWwVDjc4LtjdpnM0azAG53w=;
 b=OF943EJi7ilhI//cfyKRGBxTx2sLet4p0eM+bfzGH8bIgPVfP/sq+oqa1DhyzHM/j1Y4Am0nM9LLFFkNZogF8MhkOrVfUsvMTzHO72Ig0oC2sT6/Y1pLneGdMbkxFsBG3D/jtfeb/P+hRcegxSb6UO3bKuquFj2cAk/T8DvoibE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:17 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:17 +0000
Message-ID: <87edkdb0tq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 13/39] ASoC: stm: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:17 +0000
X-ClientProxiedBy: TYAPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: a5d9f4d8-3d46-46fe-74e2-08db9862acc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wlToLXyTfQfx/KHBxjSAU9mQzpr0e6LkfuEx6+lPpwnUomMbO9JIbBFhSdPptEo44IBbwf/BOw5io/Oko6h1QWUn0AStbS5DPq9chnfKxz1Yavh1lnPsQN1p6EkqZDFqrjV+cjHHM2KE1i9g1ns1LoVas6dPomgR85GjH4UXhdzuXmgqp0KHbjyVKXeKUgeN7ku9Wltgmj+0rhjCD5Nj33nKzeYsozxncoMrItNTHeZaIADzs25f4C8g1CSgrhHMAy7zsPhE68U5mrqBThyORbTJxocFkgFWVj361bGxDarSZRz8yGMct5feimB7o6z2LPhhu0diPDVWNT7Df5cZSaED3dkMtT6zdLSwNBlLr4al1zdFjpu+tpLoGBZS03oaIpTZlYpjW0PAVRrBWVeS4x0Dewea53TLDtEC2ylHme/FJgITSrMX5anMlZkQWihcJaEWEuYYtL+m0BEj6PlH/umdVAlqVfczlElV/a8q3wOV+j6UK0eEjk4BceHiHkFGMAyaeGfIcyv7n23dU9BBEC/YkeKDGLQlMZBFQZVXdUfgZvliHKqljPSkxbjpZJrsO5cZfoWALPzir95knXgB1d0HjcytkaQ+9ftY22+B9a0cMWgHLlZvsrNM9QCQo9ZD
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?baXdhtkgi8Bc6TXDO4waOfR05QHRm3sxSP+qdgjtVcm47YgkncvkJhgwDK2c?=
 =?us-ascii?Q?FNVK8Z9Kq9DnCE29Ob6dTTXmYe8ySMUsErGQEMbxZKYJzGt3FbyeYyIJtG3+?=
 =?us-ascii?Q?iFOP5+cXz7UqlBpOYrHzrwfyrW/1ukOKG9Rh/1x+GXIWVC+7R7KoR4ajLj/x?=
 =?us-ascii?Q?K4uQB1MfmThCdtNhk3eFJLfukvSjeScVWfwxCVrrG8vZv+eaCUMdiN69pMNy?=
 =?us-ascii?Q?rL3R+1SqA/HklwlQjPjAnD19Y8toxcCE+p2myhtC90sgmdEePq6kAInyHg8K?=
 =?us-ascii?Q?EYWstCxPQgcAFLDzQMpOAshWrjYcrfQwAAjOt3KtxgVVRpA+lY8mfkdX1ZeK?=
 =?us-ascii?Q?AgYRHji6WLXGIxlVduegSb2ndRHmGyBAFLrGqhvj0++8upPKXdeEaYoyvFBL?=
 =?us-ascii?Q?PeGx1TKGOjwP2fmVGM4L1PyPTmW3mlhQpsVNnvi+hjT+9ayKrGxTmWU7hOQc?=
 =?us-ascii?Q?b6kS28EXc5dU1I3Cm3buw99tTNszzkaQy9sG3XsiahwLDQeWsuxQhWDm8D5u?=
 =?us-ascii?Q?wbGXpzWrRvBcZSNHwJwTB/UwfBqWtpykvPJLykXugt9hte5RPEGdOUxioWAy?=
 =?us-ascii?Q?eMXQa/YpNVFRBLuuYfIryMekJ8Lkvbz6gYevUzXozhSdEz6c3sVAazbH0/SD?=
 =?us-ascii?Q?XsiIf7sqLhyyBm7Ylmi4omYPl7/LUexCBpEj8C+l3c0uCq8JCc3W0isrzk3H?=
 =?us-ascii?Q?ahxe/6h+jLDQ6M1U0RPQcCxnMTqRTRia020feMLOjvzD4pkXO4jcZdsMxu53?=
 =?us-ascii?Q?QQQp71My0FJY3ZnHgDjmMJOhXGk1EYFwc/Z4Z1mQs+YCfGjW0n0N3EB8GgyJ?=
 =?us-ascii?Q?7s35RxQ6ta+fK59FsX6jRI4C5Fj5RL0SGnPmYAAlp/NyZp0JTkhOXtKJQLbH?=
 =?us-ascii?Q?1ggB7yatZObjg5kPFOkKq7VUbBfRKTC8K6YCtkiRgcxZSk9bJ7D6ZlZkGt4S?=
 =?us-ascii?Q?OAfJWbwf6HDd/QZzaOMmDsy1/oe8+hlBsVEUfseF6FVMpJLtyVmmXA3YjKuQ?=
 =?us-ascii?Q?L20TXMGPcGw9krS9SGvMLBZVNS6G3UHLaVcqkFVjIGRHl2noSBUH0Ke7I0M4?=
 =?us-ascii?Q?FSX+4W21NikY5N0s8MwJpaomtt3wk3narGkwcdFXYjAlPCYtLsRcovlQxIEq?=
 =?us-ascii?Q?S4ope7IzqjMdZxLYLOf/yAIUCZUHA0yW3pfE5NjOngpPEtJKV+GhZEDa9Fs1?=
 =?us-ascii?Q?U0fIve8qleqOo6yyB0ck5L1huBvTHZ7+U7BlmNUbe8+qrhPM0DQfPfOi1Xhg?=
 =?us-ascii?Q?i8dyChzDQ8Y1pZ+rxwv1cUxaH/aIZD5Jc8HOMczlxEmhF1szpyWMVSR4Kcdu?=
 =?us-ascii?Q?XsfEaivYVQbpI6mv0C7lKOBMoDfxQHJPa6Zf4lP7Tpwb0AjqTisBbDtKOicy?=
 =?us-ascii?Q?9nh8JgkGkVqMPJfAzE6RCkDkgXBd+Ivi6ltpj/aZXh0o/WGZCJrO6IveFSln?=
 =?us-ascii?Q?eDL9biFnYsU7kUhNpgJwpTm2yh7aP/HHHCo30IpWscyJr+CQGq3BzskKFaWe?=
 =?us-ascii?Q?/qEaNqGH03TaZQ0Z6Fpz6346qJJ4sW495s3rxNWtsk/JlcuN8gzc90rsiZJD?=
 =?us-ascii?Q?elyhvbd891F+oKToR7xe252vL+TtK6kQCj/Asvu6QgkutD0uAv0lHgfCQN8b?=
 =?us-ascii?Q?su0h6kZ3mrSGaukR6B4kQfc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a5d9f4d8-3d46-46fe-74e2-08db9862acc5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:17.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7EGAEjRUq9U2//6vDNQ5CQc1c9kO3ZomSzw8H7sQ4kK1W1pwt9RudhIMuWsidY9C8qefMb5JyQY3ZpuBvnILNJ+IsYLUQqZ43sCAdJMKB2vA0cA6lLNlgzcd0NcWBIvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: BQVITOJNF4D4VEHFOGUPTLLXWEJDBCAQ
X-Message-ID-Hash: BQVITOJNF4D4VEHFOGUPTLLXWEJDBCAQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BQVITOJNF4D4VEHFOGUPTLLXWEJDBCAQ/>
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
 sound/soc/stm/stm32_i2s.c     |  2 +-
 sound/soc/stm/stm32_sai_sub.c | 18 ++++++++++++++----
 sound/soc/stm/stm32_spdifrx.c |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 387130701960..06a42130f5e4 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -953,6 +953,7 @@ static const struct regmap_config stm32_h7_i2s_regmap_conf = {
 };
 
 static const struct snd_soc_dai_ops stm32_i2s_pcm_dai_ops = {
+	.probe		= stm32_i2s_dai_probe,
 	.set_sysclk	= stm32_i2s_set_sysclk,
 	.set_fmt	= stm32_i2s_set_dai_fmt,
 	.startup	= stm32_i2s_startup,
@@ -1002,7 +1003,6 @@ static int stm32_i2s_dais_init(struct platform_device *pdev,
 	if (!dai_ptr)
 		return -ENOMEM;
 
-	dai_ptr->probe = stm32_i2s_dai_probe;
 	dai_ptr->ops = &stm32_i2s_pcm_dai_ops;
 	dai_ptr->id = 1;
 	stm32_i2s_dai_init(&dai_ptr->playback, "playback");
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 271ec5b3378d..42d67b7a68e8 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1222,6 +1222,19 @@ static int stm32_sai_dai_probe(struct snd_soc_dai *cpu_dai)
 }
 
 static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops = {
+	.probe		= stm32_sai_dai_probe,
+	.set_sysclk	= stm32_sai_set_sysclk,
+	.set_fmt	= stm32_sai_set_dai_fmt,
+	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
+	.startup	= stm32_sai_startup,
+	.hw_params	= stm32_sai_hw_params,
+	.trigger	= stm32_sai_trigger,
+	.shutdown	= stm32_sai_shutdown,
+	.pcm_new	= stm32_sai_pcm_new,
+};
+
+static const struct snd_soc_dai_ops stm32_sai_pcm_dai_ops2 = {
+	.probe		= stm32_sai_dai_probe,
 	.set_sysclk	= stm32_sai_set_sysclk,
 	.set_fmt	= stm32_sai_set_dai_fmt,
 	.set_tdm_slot	= stm32_sai_set_dai_tdm_slot,
@@ -1287,8 +1300,6 @@ static const struct snd_pcm_hardware stm32_sai_pcm_hw = {
 };
 
 static struct snd_soc_dai_driver stm32_sai_playback_dai = {
-		.probe = stm32_sai_dai_probe,
-		.pcm_new = stm32_sai_pcm_new,
 		.id = 1, /* avoid call to fmt_single_name() */
 		.playback = {
 			.channels_min = 1,
@@ -1306,7 +1317,6 @@ static struct snd_soc_dai_driver stm32_sai_playback_dai = {
 };
 
 static struct snd_soc_dai_driver stm32_sai_capture_dai = {
-		.probe = stm32_sai_dai_probe,
 		.id = 1, /* avoid call to fmt_single_name() */
 		.capture = {
 			.channels_min = 1,
@@ -1320,7 +1330,7 @@ static struct snd_soc_dai_driver stm32_sai_capture_dai = {
 				SNDRV_PCM_FMTBIT_S16_LE |
 				SNDRV_PCM_FMTBIT_S32_LE,
 		},
-		.ops = &stm32_sai_pcm_dai_ops,
+		.ops = &stm32_sai_pcm_dai_ops2,
 };
 
 static const struct snd_dmaengine_pcm_config stm32_sai_pcm_config = {
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index a4066f271f2d..a359b528b26b 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -856,6 +856,7 @@ static void stm32_spdifrx_shutdown(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops stm32_spdifrx_pcm_dai_ops = {
+	.probe		= stm32_spdifrx_dai_probe,
 	.startup	= stm32_spdifrx_startup,
 	.hw_params	= stm32_spdifrx_hw_params,
 	.trigger	= stm32_spdifrx_trigger,
@@ -864,7 +865,6 @@ static const struct snd_soc_dai_ops stm32_spdifrx_pcm_dai_ops = {
 
 static struct snd_soc_dai_driver stm32_spdifrx_dai[] = {
 	{
-		.probe = stm32_spdifrx_dai_probe,
 		.capture = {
 			.stream_name = "CPU-Capture",
 			.channels_min = 1,
-- 
2.25.1

