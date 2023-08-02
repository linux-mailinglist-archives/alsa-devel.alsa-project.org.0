Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C776C1D0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:02:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 322D3E7B;
	Wed,  2 Aug 2023 03:01:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 322D3E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938125;
	bh=GC6ckSKavXCqgT3e6GC7k7LQpOe9SifLTA/nZKY3/ZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LyMjjvuqM91EX0RmcsqPxkAAt7+iimSj2Wr+0ueVoYbEDyrHG0Xj/NVSNuL2SLexB
	 JiMApKjYzR+pp3AYw/SMJMZxxX7FS2fWH0JVS+L15ki7Vu7hlOmANKZH+WBADxGGtk
	 dhI9Cw2IDXcbz2MpfjL63ecr9Aj1052jpafxkSGM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 385A2F805E6; Wed,  2 Aug 2023 02:57:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 550ACF8057F;
	Wed,  2 Aug 2023 02:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A494F805E6; Wed,  2 Aug 2023 02:57:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 31A69F8057C
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31A69F8057C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OPfuodWR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ctophSdiVDw3NkXk2NReFQQRThpKoPtoeRF/jhbzr6usoBbR4sX6hCcmiWSFGh+iZphKJUx7gGQUjNsMj5jkbIyTkyPtJRuiwbFk2ooTc2Zf/Ag+SlTT9nhBEymW5wL1vwGRAMxE06ea0/r2CWhc8c5If6NlNrTzVz/C68edEaoLQMMhhaKRJKnA5LpKc29admSfDq6cJDNXk18T/phSXJ6D9o0hhzhKP4Wg+lFOwn8YO6304MSZ6cnKY/qrBiNqO+oIWvWhmJTVJHoQVEmfKRlZOjcMs4K5Nk6vWmZVAFx0C2QPfLVTq4iCIiRMB0rh3X4XQJneIJM9610roIgsBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9ORuKN5mWNV+joLtybTV/0duC72Fx+TEc0Ft7DKYRQ=;
 b=GXprjIUgnEj06rSQ9a5IbChALCC0kSgU2AlfMdfXzwsCqCJJ6oMYTarGc4o52furfLD1l8tihO1iJyyDehkDeefUkWvp71EVktr8/QeHzrsgjbmbxlfufAeQcOmDnGcJKGRoeYKClnrRVahQstnydTlZJS5gNj1RvqlkZR5pIeIaQ6PSXGf/W3Ik1A4UPnRhJhkEYjaWl1EJWb344XpSkVQSRON44le6IQrBf0vG4HgVNdG8lrwoMAvn3BnKznfuzx85nOdIopsJpIrRXZcmClxS+/CupYANpEOzcQlytTzGBz5NS5nqLhm8SAeg+rZxYWKXJpkmHRyBMpX355DkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9ORuKN5mWNV+joLtybTV/0duC72Fx+TEc0Ft7DKYRQ=;
 b=OPfuodWRyudl0Kzs58SN2KEjt/BBN+izG7zb5Ee3m41rMyDE8tjKDhMUTflbkcvZEwS7OBOKrDl1gD4uc/9lUmbZ8ZeeXZ1ZtyU/ps1A90genc//JCuOnuu9FsQGsll00rWH3hWQNJ5JuRFRcXKBxkyUC2UH/AJQGTeFxT28RhU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB7797.jpnprd01.prod.outlook.com (2603:1096:400:17b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:35 +0000
Message-ID: <871qgmtg5d.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Walker Chen <walker.chen@starfivetech.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 31/38] ASoC: starfive: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:34 +0000
X-ClientProxiedBy: TYCP286CA0215.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::6) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB7797:EE_
X-MS-Office365-Filtering-Correlation-Id: aebcffb0-d1ba-4dda-e5f8-08db92f37588
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	r7cMf/gnDUuvWhnh8jxi6rQtgzY1s0H3vplpYPMahJXIJm3jtTOqQeb0skkLnsFyjEZyqaz731oalUgeagxo5JwSmu8IuD1N8XJlPb+hTr1DLp2XLp3Uh96XjYVN+b07CL7vtd42VdnEiP4KrDyEpM/DgtvBv9QtZ0Dvd8xEAEXeC/Etg1qXwwiEyhuQaVm6hQI8w9ARhqIW0zjG3+P83QvEJdhPJiAuWGP9lqzcnZU2VtHGy5R3Y0EFuc1uGP20aos/0AVOObd2CeQOKXY8Zoq6OPZRwlp2PjO71bxLE8BqWDha42bmRqzrp8UFzYYWXt6wc2f1nKlzucUelk3I6v6bgUz6jiT9IflmOmo9zUi4jVepudvtZD1etB8Eb8K/s5ey4a7waILLK0kyg0ywtD7ZyfKb51OXNcr3HDZrRHHHxzdAZ6yZ4971vBvpjDLOtJtMVLJxK42eXyzfdAD9RC8IVx61NQEDklcLISj3ne0/PlJ3UqGiK5HDWXqsHxUqHrVau6D0vLdqxdzJ3h5/ctq3ufgnBTanGsgMmTGDdRkHBFaO9gPdg94k6Lno7hDo/Iy5fg5+yigA1Kjv30z2F6n35//tLJVHTq7B/TEYN92ul4RdrZyzsld4jfHtxZSg
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(52116002)(6512007)(6486002)(26005)(6506007)(186003)(2616005)(110136005)(478600001)(83380400001)(36756003)(38100700002)(2906002)(5660300002)(86362001)(8676002)(8936002)(66556008)(41300700001)(66476007)(66946007)(316002)(38350700002)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EmN2ggWph79Qs6u9lI7yeJD9XGhszCk7QF6oEu8lpZzXo10qS41sLTNGYUql?=
 =?us-ascii?Q?Xgeguh5xB4B4zl7bdgdT8f1rP/UraxjREBzo3FrAkaUpB5ENQMH2zE8vKUMa?=
 =?us-ascii?Q?vCnM8nJb6lrmFWJMM888wumcGv6AxTEssWYIfkyyHKJ8hiUTg8ieXLsAYKSm?=
 =?us-ascii?Q?ifDyaetL0bCHMb3DS4/a+WAJXMdDmmaD7OXjbx4/7KNFZmNkvjVYBVF/fXYd?=
 =?us-ascii?Q?uU7F2MuWBjTwxzDjqod29oKhiaQGO2MlmjN6hA+DN4qeaLu9GdW+nwEJOvnw?=
 =?us-ascii?Q?DJO2kdWaI93Hg/3je8JKhL6T67oFp8keLT6GkVvoacF+Die77n5zTIX5rW2z?=
 =?us-ascii?Q?JBBSPXwDu3iqn7FEylGkJpBJLiwJVxV5FYwGlw2YXNZB3OxuJmsYzeKRFp3d?=
 =?us-ascii?Q?Trqc3e8CBRmcFnmR0ckmq83x7hhNBThXCpcHKb5mbBrBbPsXaXekHTU2fnF5?=
 =?us-ascii?Q?X63C/zg+61U9VbhS/MFiIILXuEGWAdUS3e9xiBRMzQbvkPkUaaCETgbA+Obo?=
 =?us-ascii?Q?w1dlm+Le1vqg1B/Me8WctdTlhDrixgibmBy0JYPjdQuVP+FZfIld0Pv7l1Qm?=
 =?us-ascii?Q?4AZc3j/9mrMjcqCV7WMEf//i6Jur7YMSIFQQDEmykSsRpIL/xZNi0SmpF5sl?=
 =?us-ascii?Q?72hmtdIWNzmr1WPRYsJstDimLXxovSXPn+ch9fkw1tqdfrPu1CAvo8KozwZa?=
 =?us-ascii?Q?2UBnuxLPaQDbcLKfMXtc2IjSzpUSQ5CYk0e710772lpVuFDjGSatd5Tvq7jT?=
 =?us-ascii?Q?Xn6LiME2nqNUUO7PPCXyyozZ6Np32BfDtOY7qYYoq9nhBOMkqLycOuOT47rY?=
 =?us-ascii?Q?z+dY0bsM0zJR/PXaKrGms8l4sH3cfepUCafZ1WhDIybTERVvLUGcitJ7y8s4?=
 =?us-ascii?Q?4gJjBCYvDHTWJVHALg4fPq+vaVAo/utX3CJruCYdROa1oQTy/KhKBHGor5RA?=
 =?us-ascii?Q?EnD68uXWZ5k1syAU/wfcZYBuUnKssDnV/gcqOXvr9wZ2v+8cgzgy3WhjmBhs?=
 =?us-ascii?Q?U4P8XCJ2exjFgNbnCEHb90bfrC17vA8/HFfv+IgGuKWzFsuSdE1VqPHHSuJD?=
 =?us-ascii?Q?3lja7XVQw1zkkxCe3Hdd1deRzb1KXtnZerp0HAPxL7i/jYmypuAKDgbAF/6u?=
 =?us-ascii?Q?qLKj9kgbOhWrupyd+zoDpuD2H/73mhJ8YgwBMt4wMZ5wkmCIOsD7h/dxOBRx?=
 =?us-ascii?Q?ZL/9iSpZkqbjJ6zXtbU/3dPtoFlc4e7IG+TSoYKU75roy5B/I/S4zg/g9kxr?=
 =?us-ascii?Q?Qa2/Vs1Qkt54nyvMzLtfAqc0mIIz7f9/P9J8X0fEXUVsgCyrAU5S1As6DR92?=
 =?us-ascii?Q?FzeY61Q8yU5c8DrWhaIabtbIk5RNstlV2X/i6Gx3Kbe3sPiSPEJHbj8rbL+7?=
 =?us-ascii?Q?NFndlxHF1XM3ewnT6j8uZ1XhDtenOVDgneh1ngVDhlOSUvLBVZ1MkQa71SgR?=
 =?us-ascii?Q?MnfSIO1YKXsQR6RSpnB8s4srPBKoaalEg3CczOMzBhrKa0HFfE9naEpldr0/?=
 =?us-ascii?Q?3BB11G6KegOu5qVM0EqK/0LjBKep7k/n+uH8nEqKlDUpZWf0Ld87CYXWU8Qv?=
 =?us-ascii?Q?oYT/FLycmSS+lRL6UF76D45LaIAiVpi+rkiKoDA3KaaQJxkheB+DvYZCg4nE?=
 =?us-ascii?Q?j9Hhmq83IKmUTF5D4oAI6x0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aebcffb0-d1ba-4dda-e5f8-08db92f37588
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:35.4803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 10s1IpP0iG4SfPGHnm2ThCXAW15Y06GB5dMuS8NNuUNwY95zQHpYqpk0Kh7gzUTYdr7GtynLREQuhr/Qta3ZCy8OF47J2PYc0WNJEw6IXfL/rCoMISB/SsB2Xv+tMQgi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7797
Message-ID-Hash: H5D76OBHNIO72MSLWMSQPVOZGF2U2BOX
X-Message-ID-Hash: H5D76OBHNIO72MSLWMSQPVOZGF2U2BOX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H5D76OBHNIO72MSLWMSQPVOZGF2U2BOX/>
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
 sound/soc/starfive/jh7110_tdm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 705f1420097b..8c117794b028 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -463,13 +463,6 @@ static int jh7110_tdm_set_dai_fmt(struct snd_soc_dai *cpu_dai,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
-	.startup	= jh7110_tdm_startup,
-	.hw_params	= jh7110_tdm_hw_params,
-	.trigger	= jh7110_tdm_trigger,
-	.set_fmt	= jh7110_tdm_set_dai_fmt,
-};
-
 static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
 {
 	struct jh7110_tdm_dev *tdm = snd_soc_dai_get_drvdata(dai);
@@ -479,6 +472,14 @@ static int jh7110_tdm_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops jh7110_tdm_dai_ops = {
+	.probe		= jh7110_tdm_dai_probe,
+	.startup	= jh7110_tdm_startup,
+	.hw_params	= jh7110_tdm_hw_params,
+	.trigger	= jh7110_tdm_trigger,
+	.set_fmt	= jh7110_tdm_set_dai_fmt,
+};
+
 #define JH7110_TDM_RATES	SNDRV_PCM_RATE_8000_48000
 
 #define JH7110_TDM_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE | \
@@ -502,7 +503,6 @@ static struct snd_soc_dai_driver jh7110_tdm_dai = {
 		.formats        = JH7110_TDM_FORMATS,
 	},
 	.ops = &jh7110_tdm_dai_ops,
-	.probe = jh7110_tdm_dai_probe,
 	.symmetric_rate = 1,
 };
 
-- 
2.25.1

