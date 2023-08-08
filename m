Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9972D774EEF
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:04:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F1F8FE84;
	Wed,  9 Aug 2023 01:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F1F8FE84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535885;
	bh=uKfQyNc5+62XEquTEF2+VBOVmFrTfXLXfXLlhKy3QUM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ZZ1aItdLUJXhXxxvsmQk3ZKOSG+DuVO5OGACSux1RPPr6sGvduc6FlZTds6GK+VvK
	 xmaU/6Swf+8/91qQdUL/w2f+Bj9yJfb/2ze249YtJVxmlxT99zYgIIxRLoxxDXjvlK
	 +d/ZS3dhAHg/PgAJe4zLNyLjITXicc4k/9+u3Ni0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4136F806A3; Wed,  9 Aug 2023 00:58:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4B5AF80698;
	Wed,  9 Aug 2023 00:58:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 28BEDF805E1; Wed,  9 Aug 2023 00:58:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20728.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC2BAF805C8
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC2BAF805C8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=V+Dpqqy5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qcwtk2jYXJz8+JO0X+slNRyZ9vVahNgJ1N7A2NBEVaQUwlEBoCNW0kzWeMjqW/oLxHvykqnolCjwpOh9P3Pbb30wh16F45uiBkKXonaZZR6g+E7/0TS/npSz1N3eVXj6BpirR0xMbhfMOO3h4tnnzDhvDiVlVKyES6wz085knNcjqXW0gNPpFSesZR2sCKPzwO7XLEICdq/eQhCtvSOxEJfv/wZjYHvhY3dtAzUzV/JrA4SWldydpO6WG57vqszPCEGIjbEMJB7oTSBwyGBcGWIuy522JB/R6m9a6+JOm24HqRl7rJCJXtOcm+/MQlHLVgpHCXenftJXaz2qgJ4xzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zx7A86ORWQdai5Gxgnq5CDVJExNDHfiIR5ac/Zen4FA=;
 b=I0GkPLpPMilpAS5Bl/0PUNzDpMhu7Gji50k7CLNFVKs7TaO1OJ2DKXJB8899V3cU9WxuQGJY2ZmDweEmWkWJ9tvnVvMNJGYow5keJgnelJrY2SLpkoN6QK7wMCq+s+jJ8IA7PYX/T8dGGXQgSjr4ELJ0j1W3AmeABphDPPm3/CoQYYDrWFqoSQBVTvmi9wAwakMn2lQkHaDNBAuG+7Cgzuj65QKiHlmXOQuWU7HsMLHehEmQdDcXw56YEb9Phg7IFHvLkYpQUjT5ZQ7LX4srjKfypZLDaxnpFGMWpOir4r8RvyvNa9XZLm6YIy64W1k2xIFWFv7OfSySwKwOFlcy+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zx7A86ORWQdai5Gxgnq5CDVJExNDHfiIR5ac/Zen4FA=;
 b=V+Dpqqy5PalPgGiN68ebJWIqMvApSmjJgpdxpsn6n+mKh9Bf4V903+r1Awu0SvcnjklPY7tG2FjKnYR94KGrVyVpv37DA46zT7Htlm6G8VKex2lC4U8xhs/XRnkNiiC0lDWlV5yWx4CXVooWAe5zMTm9RzKccKvZcqvjoBWvdj8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:19 +0000
Message-ID: <87o7jh9m5w.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 31/39] ASoC: loongson: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:19 +0000
X-ClientProxiedBy: TYCP286CA0080.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 67f9f4cd-9485-4c7c-5b77-08db9862f583
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lEhUelKTX++cD7vhjoE7nWEgdo0eAbDrjJO+Advr89tvMgRlFiJlQJ4mUVtO6sp2VVOZzUSAi0KyBTb/65DmlXD7ZzkaGbNDwzukBtgU6B3G4CJY5+oKyQRjq7NI18CFeCDYt3q6AIP3GVbnsfatUv8ZdxvTUdWft04dgKKBvMPCzItVLUfcPkdeUX9PGZ7CVEccb4sMjCSoWVJBVdTlfryR9dLA5tB/r7Kg+wsQFj+zGwwRWzkMlUhzDky6vIwsry1YU9kSmythT6Qbw4DzPcIJvzYpNqhX1Ilk4w4bc+wo6a3ByKPBdcUV05rdy2PUUzDO8mVAGof4Gk/zNDHr+Ms8v5lZiT9ceKuHONQQAGibLZL6dMekXGqTNNZhBuj/is1lsFTtWE/TQFtWay4QsbbUhm9+dHZ8sbUvRTKPPu4PjrlGcWRkDBjTge0deXX7GtZUWVrZxzBEF/0u76P+nnxrrnsHbCTXzrN+FsEZCPnQIGB8rJK/vhLGDPQnRdzfQuCyISTBJGhhtKf0CeNJbNR+gWIah/GCEFLNi8vHC+hrg/Q56WQInJRbG0hzm4JnA4ibnqCBCHogyM3UsbAtha5I4gjdBlYrUwIt+jtFuJv7puH6KecwUzEX22j+nTIG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?QSBtCBBorTQE66i+yHeIxB4b1DvOQH07mAzcBQ6WV6MaNAR1tJV3cvp6Au7Q?=
 =?us-ascii?Q?qtKvm6avRHVO0LJ6eenOq1JYLtvb4UFj/Tx7HU3Uo6Vfmcw3Fm49Wk2YYje9?=
 =?us-ascii?Q?9G3bhpaslyyPQQk4brJR2Oh77gJN2+seGymqDOuMc5H9pCZlPytKj5N1tBqG?=
 =?us-ascii?Q?jOvIGO6rbNWogN42csmc/e4LHvTrEiMhcQvW+AJvhHypIGraRGuNTKXExxIr?=
 =?us-ascii?Q?E3m9sGbtXTXMFei15N1BNOuksA23gUf7FDiljzdLkakjnJB4Getq6E2GMbQi?=
 =?us-ascii?Q?p3d8w3FIno5gKXM3D7rjiA+bWAEcS+z26euNKEywjq0MBHJfQtKQVRv4TKVs?=
 =?us-ascii?Q?8XY928tgDr7RNGROFsNBEgjf91Eo1JG7ZqM2R7OmuxLy2yv8Io1cDTFAPM3j?=
 =?us-ascii?Q?nfyLQjJ7zXP7tNw4J99CwV5KBy0DPDh8I2V850B8+eOO8z7/3i1gKV9D8czW?=
 =?us-ascii?Q?v9PlTZpMfqT9OYGMHCO8BKSblbaAhmaSd+Mp/2KZXHkvQ57+omVvtdCwD080?=
 =?us-ascii?Q?lKkK2XS/XvQpUenlMUjWEjQe/4ECNZgO50z0omqGvfKu0z2NujCO1XVirJp+?=
 =?us-ascii?Q?xIBWRORXAyr6u6zOS0f2C1HWYhZhER25QE4s73e1O0/y68BTucKd2EipOjx+?=
 =?us-ascii?Q?c1YOx+rXlYx/S8L6NgZqraYRWXMlTmyQCPoSh59wq9/8Y5NmwAv5JgaSnQcb?=
 =?us-ascii?Q?1YRn6dnDMwBPzoOv7fsdJIqYtkYHTTNF98bnwbf/KexjiSSZwjfhRBd7pBHk?=
 =?us-ascii?Q?tD+QqWmzxvKwAHBuBMVXzIUkc3kTnWer5+kUW48SVHEP6oKeCBAYYIGVgKvT?=
 =?us-ascii?Q?euUYbYrLWmy9qvPCu04F6h6fQ7E0wdJ7EVz7f012jVyTfbx8IOd/4cNWE+FW?=
 =?us-ascii?Q?B8JxGQldP7cHI506k+66eRllCOTDqqxLlvvvDpkFVtiwf1o9Zs5rms+u1gT+?=
 =?us-ascii?Q?EKp7T7zUXDwOp9fBU6BkxJAwy4mNe6fvM6RWt8ymTHAA0iqIeyvuyLYZ6s2w?=
 =?us-ascii?Q?taESS0dhak3sZ+7ZzDGpPQpFFzpXdLib6kxq+u/wU+nS1JOZTYGK9E9YP/im?=
 =?us-ascii?Q?WepRwbTs+SfsHZgUKeKeBaKKrW0VdExPsKeU06+eGRozYsZVpBJhR+ffh7Aq?=
 =?us-ascii?Q?p0N71w/9qN8gLbFoMvXQrzinLyM6TfVcKCfKYK+kiTU0JaQtjalz8aBxUdti?=
 =?us-ascii?Q?/h8aBr3cgPicPTIrRuFR+XWOHPaJz/rlLb61dU7xLHwEb86LGWgUrgJWzRpF?=
 =?us-ascii?Q?xhCr9mPWPnMpdLcutiACuF/Rt1MTUtKPWsFCB26qC+K/ApIVhmgirkbH+hkb?=
 =?us-ascii?Q?enl2mdc6n4/gAN1Tl6tMXYrpoJcoV3xsTrSo/2KX0pkEAow0hqrHwWIl/43z?=
 =?us-ascii?Q?m/ocSJUnwrVwFs9E4wIa0oz+nAy26ndvSH/X14fpFsFXHXXBUGpu+m+RZ5oe?=
 =?us-ascii?Q?m4EAVXbF3MvwbiFIDidGHkZinI1f3l1ZbCZaWlg7RXXaEJ2BBlyIFEiqpBxu?=
 =?us-ascii?Q?c5MbInVrEMpsA6bnVTiJsjzuGG9ykDwZSnkyLW08YWtZ0kzyf+nvctY1/xBE?=
 =?us-ascii?Q?JH6hArxlA9PEcKDL0QEZYpKcWn3j/h77iJljc6YxMf1zSPxcdM1YKZfFrvm7?=
 =?us-ascii?Q?qM9/Zo3aNNdWbGx0KaIUs2E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 67f9f4cd-9485-4c7c-5b77-08db9862f583
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:19.6979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LnDuC49o6nUe6d5MaZNPzQ6RYr659AdusPew6uL6rF22/p/2PQUGZnCkN4aJwk8rP9PK9KSWb+rcBWR/ULu2Er3KBZhdq3BrYrJ8ufbRdLIgiRBFmnkXeFBPvHju3Lbx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: QMTW36RGJ6MIAV66JAODT5TUA2BWHRE5
X-Message-ID-Hash: QMTW36RGJ6MIAV66JAODT5TUA2BWHRE5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMTW36RGJ6MIAV66JAODT5TUA2BWHRE5/>
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
 sound/soc/loongson/loongson_i2s.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/loongson/loongson_i2s.c b/sound/soc/loongson/loongson_i2s.c
index b919f0fe8361..d45228a3a558 100644
--- a/sound/soc/loongson/loongson_i2s.c
+++ b/sound/soc/loongson/loongson_i2s.c
@@ -204,13 +204,6 @@ static int loongson_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
-	.trigger	= loongson_i2s_trigger,
-	.hw_params	= loongson_i2s_hw_params,
-	.set_sysclk	= loongson_i2s_set_dai_sysclk,
-	.set_fmt	= loongson_i2s_set_fmt,
-};
-
 static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 {
 	struct loongson_i2s *i2s = dev_get_drvdata(cpu_dai->dev);
@@ -222,9 +215,16 @@ static int loongson_i2s_dai_probe(struct snd_soc_dai *cpu_dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops loongson_i2s_dai_ops = {
+	.probe		= loongson_i2s_dai_probe,
+	.trigger	= loongson_i2s_trigger,
+	.hw_params	= loongson_i2s_hw_params,
+	.set_sysclk	= loongson_i2s_set_dai_sysclk,
+	.set_fmt	= loongson_i2s_set_fmt,
+};
+
 struct snd_soc_dai_driver loongson_i2s_dai = {
 	.name = "loongson-i2s",
-	.probe = loongson_i2s_dai_probe,
 	.playback = {
 		.stream_name = "CPU-Playback",
 		.channels_min = 1,
-- 
2.25.1

