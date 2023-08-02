Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BA776C1C0
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:57:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 668B014E;
	Wed,  2 Aug 2023 02:56:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 668B014E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937862;
	bh=qwACQQge03dflkh40phCAj4Zi1/szbx5zSl5Z8yA+kA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=e1PkBOG21kYGpY/VeCYED+ubgeNKGim3rGLCiPE4/RDmN8e6cUdgZnKDq9H6HstXI
	 bcF7PcdLUYxwR6p1c7hZRlw8W7nuUbG9A6cDAl2xvLt+tE/yg8K8J1dGmjeN+jnbOs
	 FzBR/TaSgmhTXEU+3IIHERZTsMKbYHJjE+6N8PRs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37E44F8058C; Wed,  2 Aug 2023 02:54:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E9E31F80425;
	Wed,  2 Aug 2023 02:54:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53408F8057C; Wed,  2 Aug 2023 02:54:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20724.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::724])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C6737F80578
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:54:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6737F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oJlYZtrj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cRxhTo6wqdSdBLJEvCllYnzHJTSBYNSUyNAGf+koGKjVPoqZKJ05HLwhvMJhCdV6svRaWdKaeR1aQqByXlyHLYIPb64WRtu5Gc5xagaz+VUtwLd5HjTZYtXqr44stbmEUjUJlvMn8SNKLhqVAnD+Xg+60xI8lmJgr0aO+/7BWoh33yalsUApB+29tbRdDwmrXaIaQ3loaKqlDgKmQEo/A07aic0jCj84MP5EbTO+11aAXxVEt1E2ssyhb4CdeQTp/ydTg025/HrT9m2/WSlpKLCRiaZxcDX4WgxFfN9pFBEItdyDcI89d/HLsQpG3fLdF0UCGYfdoKgbTpCpP7/HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qofU/XLmHGPsiHn1xk4R1WS+XQXJndsBoXm3ArnVjMU=;
 b=P0NBfo+9sVnlSiRJiHAmvR8WE4S7uhwll40ksnwxdCFatDdaa0UYb+5TVAF9ypbFTOfLt5n4EBsVB2LYwSWugNLqYp/Pz81eDxgsjYN3HBXdVCPPsc7XFgrl3yQWWsLf25vNsCQ+EiErMQcmJy8ehGlJahD5GT3yhWE34zjRuWKDCiyQXTm3irM+AJQnITZI2cKpw3fcFUZZv2J1RNgk8fWfBxdBcbi52mqLWZRcBh9+3T9yVscCkAjHwe9IGopweYpKKdpIyWCDp6jFwLdr3Eia8tg+62rbp3qax8V3ew13Sprq/GKsAeOmSV//wqhor4409dJ5ubUtzmIv57XqrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qofU/XLmHGPsiHn1xk4R1WS+XQXJndsBoXm3ArnVjMU=;
 b=oJlYZtrjiAhl80sFRYwdO4iuimdtu7O1gKX14A/GhnzktTmYRQGGEtnw+1ntViQdem/oqeOh4Z5e4hpTdvkp/RqmiITDeaf3bpbyMwzIV1awP3OR10zBb95U1+DIgsuIsErBmAd/pBwa+r8cu8ZO45SYo5WtLTNyQ2Y66RAJu/E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:54:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:54:33 +0000
Message-ID: <87mszatgae.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 16/38] ASoC: qcom: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:54:33 +0000
X-ClientProxiedBy: TYCPR01CA0143.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f7d3bd7-680c-4b75-406f-08db92f30991
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aApRLWjaXt6Bal5qQsXlpOG/6tGMO7nLSyl6h4Zs1yYCxEtPlg8tMOKM010BZsNYtnDI4y4kQKKKY0dhDkkF9U9Ah/PmqggKqrp4d7pJrvDNt6bi75hiVEHY8spIrS1mu5TARgIpIrgPm/h1wG4tWWhDxmUyNcqpGAyicpct4EFljcldmN5ThhMyGoG4+KNcLekO9vC5WezADjf2mxAAKDnjSgY+b4GJqo7FyAlZg09g9fux5clVL+4XrUWZlCs6gnAkDyd+XR/9bfJOpngW17pR7HpvCGim/oQ342cg2meM8+J0XflYCjEPEjkH1gTsq21ad9CErgkbKG17rymlSJZW3JnB4YI+AQ/0rOIX0U2SuhTiZ2f2tQcecq2qxj4oOSCHOiKP93bOxTCDmjxEIBq9eeE/CYuBs0AOg2v7wWstc+oCZ8/hnnT8QslOEgloqlHzRW7JuBiRJky5N2PUFn/eY151GX+REVDc1fZY9pLHYj/zVZzWmC077yBraXGdlzyuxJArNm4rTQIA/lzSWfWYM9ae+L9aHa0Qr5l9I22LLfNT3qVQyPRdBI4zKbqW4eeG+BfckY6DFl3A1cDHzhGPUX9dJ9Wgmqa8PFscVf3Vu2wThiEhRWrxP9vLDJ1M
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(30864003)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Eq2kR7fMLzXniWqApEtL6XDLwqitdXyvrfQXLBYeKYmW2JbIzNJeEnx4cHaf?=
 =?us-ascii?Q?PysXIk7pOvKJ2w4FiJk134HYaY4HL3Muym9Y5g/38BRYFcHCCtoyuCq4Nyll?=
 =?us-ascii?Q?k3H4VEFgbxY2a8QdvrwCGwm/LrLwG3OR7av+qXG9Bf/vVTtZG7+ExlOakAYD?=
 =?us-ascii?Q?ZTxY9yg71j37rbEgjFOWKh2MLJFD6zjM2JFV39HbN/uiHsgfvUf2GbyawQP4?=
 =?us-ascii?Q?xkil3xvb31O90OKl8ZjDWw4sIQSrTtlFv/XQC93ONk3CUMfeHvLqYPXJ3N/N?=
 =?us-ascii?Q?SCTWYrCLNTiJjbAmx6oGn/S3ZnfIJ1rO7710gabN6bmwUye2v9cCt358bCpl?=
 =?us-ascii?Q?8Mmz8VnuRkIWVcixBVxCfqPTtGOiB1D9ymB2yVIwSo/prJpQwkkY7q8JFvvc?=
 =?us-ascii?Q?2S5dST5FAt5xPDaJGtTYMWrms7tn6zSiZBmNc2P3e/z7yTYNwRxhmVcl0FPj?=
 =?us-ascii?Q?LFniurU/30NYO7R0q1iNZscK1op+cKuJKemfVlVVKU0+ix9mTWEotUajf8MW?=
 =?us-ascii?Q?ebNt2BgnIHaGTPSFnwykEBAt6IGB7+7yStz7mGpH7z3nqY4gT3jBcrND9awm?=
 =?us-ascii?Q?nJoX3QL057OCoYV2Xr4AJP1a/z+QRCQ/NoGFpHoAA3PXroHz+Udou9XNaMIR?=
 =?us-ascii?Q?tS27bg4HuzIj+zf+wYUC0EBtqDM37Um/xq9FvbX+NLH5RXpwP3baIlkDBqD2?=
 =?us-ascii?Q?A5Ok3XIy3NEn1t41/4x3H1MyS1fmjboi3ekXeTHC3rtW2XSGGnCEY14R3Ncy?=
 =?us-ascii?Q?+ZDCRK1TUaYAfJEVoPeY4zXFLKTid6B/DaB/Iyv/PHUHOtfm+wltqenqrujP?=
 =?us-ascii?Q?z9jvdp7ycIOA/8wuaGSCIWXqLF20qDbFLrynAomG45zeqvZh61/Nf90smILG?=
 =?us-ascii?Q?HiaEzCBvF/N/m7MqT0D4iNmNUvzzLxNh3q/z8wk31ugwKCYMMz1YljUj+qXq?=
 =?us-ascii?Q?4vv/P32HptceZSNXcMbq86629Z9EL/ryHykNun3L0K7iZxcXQYAGKVIc3iYC?=
 =?us-ascii?Q?bNMVHhgEse9eN+MB+FiNXHeSq+URKvFwGnCXVtYC2HEWVDqvE6x2OoA5uyCk?=
 =?us-ascii?Q?PNGMPgkIJbgF9dYFO6khtUkb4oXo3X85o21xvILSj10UQo7qRqzfNvuInP8s?=
 =?us-ascii?Q?pJ40P8UWEBeIkFfpGA0hFbYc8Xu57a0NJHKtoSl+/DNuh+AG65R3BQQJ16Mr?=
 =?us-ascii?Q?PdtskoX3BroCQaPt8gdkv8D4xmFWLVW9wcBOijO//i4hbtSItK75BlJ4+QZp?=
 =?us-ascii?Q?UReGqcShL4PS6KTUGPYcm9DB7hPvqeJJ1yQlAOnm1V5dNdOt3H8E3Fe3SW8D?=
 =?us-ascii?Q?Bsj7HaylgUqFIKe6jJI93St6VFQMqRXOwYHx6vgOYtHplO8g5N76xy+DakT8?=
 =?us-ascii?Q?VVfTVUTkRWuWYRLKD1ycOuuaF0sa5DLKaaPXpxBhq8qfamPLCTf1POsz/dhY?=
 =?us-ascii?Q?zbdRboy/3+XQ1nHFDEKXRANX1uX4nTs40mGsxTr3C6ykw7Syr3kY5RY7aeCh?=
 =?us-ascii?Q?GVNbGY/GDg3XJtZ9iKIw1gWoz3EGjASXUPpIcG4wFcLwAHrh2jZKQB/9uvIy?=
 =?us-ascii?Q?cR+K2AleK+fKgElOXoMY2ViXJq9pxo7HVOTfakx2hweOmg1f4lydEdoZFELB?=
 =?us-ascii?Q?shDl69+pXR8ld1N8iVp8CUs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0f7d3bd7-680c-4b75-406f-08db92f30991
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:54:33.9087
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 EZNdOE4r+dR55iZfXiis7G8m8FQK/FXujJCBPhVMg21JmRb9n/JW8nQrw+EYgGEy6dHXK7M/1UOBH+k/U3SlnpH7Xc5yY+mx6EGuR+3L5nSF9u5XdBmwakZsSrB39y0x
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: 5KVIBSG6JMTMOLPA6JSQF3UPUGERSMD5
X-Message-ID-Hash: 5KVIBSG6JMTMOLPA6JSQF3UPUGERSMD5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5KVIBSG6JMTMOLPA6JSQF3UPUGERSMD5/>
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
 sound/soc/qcom/lpass-apq8016.c           |  4 --
 sound/soc/qcom/lpass-cpu.c               | 40 +++++++----
 sound/soc/qcom/lpass-ipq806x.c           |  1 -
 sound/soc/qcom/lpass-sc7180.c            |  5 +-
 sound/soc/qcom/lpass-sc7280.c            |  2 -
 sound/soc/qcom/lpass.h                   |  4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c         | 88 +++++++++++++-----------
 sound/soc/qcom/qdsp6/q6asm-dai.c         |  6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  3 -
 9 files changed, 80 insertions(+), 73 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index abaf694ee9a3..f919d46e18ca 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -41,7 +41,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_SECONDARY] =  {
@@ -62,7 +61,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_TERTIARY] =  {
@@ -83,7 +81,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_QUATERNARY] =  {
@@ -119,7 +116,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 };
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbdaaa85ce48..39571fed4001 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -404,18 +404,7 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
-	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
-	.startup	= lpass_cpu_daiops_startup,
-	.shutdown	= lpass_cpu_daiops_shutdown,
-	.hw_params	= lpass_cpu_daiops_hw_params,
-	.trigger	= lpass_cpu_daiops_trigger,
-	.prepare	= lpass_cpu_daiops_prepare,
-};
-EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
-
-int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
-				struct snd_soc_dai *dai)
+static int lpass_cpu_daiops_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	int ret;
 	struct snd_soc_dai_driver *drv = dai->driver;
@@ -431,9 +420,8 @@ int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
 
-int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
+static int lpass_cpu_daiops_probe(struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	int ret;
@@ -446,7 +434,29 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_probe);
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
+	.probe		= lpass_cpu_daiops_probe,
+	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
+	.startup	= lpass_cpu_daiops_startup,
+	.shutdown	= lpass_cpu_daiops_shutdown,
+	.hw_params	= lpass_cpu_daiops_hw_params,
+	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
+	.pcm_new	= lpass_cpu_daiops_pcm_new,
+	.probe		= lpass_cpu_daiops_probe,
+	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
+	.startup	= lpass_cpu_daiops_startup,
+	.shutdown	= lpass_cpu_daiops_shutdown,
+	.hw_params	= lpass_cpu_daiops_hw_params,
+	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
 static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 				   const struct of_phandle_args *args,
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index ef8a7984f232..2c97f295e394 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -51,7 +51,6 @@ static struct snd_soc_dai_driver ipq806x_lpass_cpu_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 	},
-	.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 	.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 };
 
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 56db852f4eab..d16c0d83aaad 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -43,7 +43,6 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = MI2S_SECONDARY,
@@ -57,9 +56,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
-		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
-		.pcm_new = lpass_cpu_pcm_new,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops2,
 	}, {
 		.id = LPASS_DP_RX,
 		.name = "Hdmi",
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index bcf18fe8e14d..6b2eb25ed939 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -38,7 +38,6 @@ static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = MI2S_SECONDARY,
@@ -52,7 +51,6 @@ static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = LPASS_DP_RX,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index dd78600fc7b0..bdfe66ec3314 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -402,10 +402,8 @@ int asoc_qcom_lpass_platform_register(struct platform_device *);
 int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
 void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
-int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
-int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
-				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2;
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops;
 
 #endif /* __LPASS_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index dbff55a97162..3faa7e0eb0dd 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -619,44 +619,6 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"RX_CODEC_DMA_RX_7 Playback", NULL, "RX_CODEC_DMA_RX_7"},
 };
 
-static const struct snd_soc_dai_ops q6hdmi_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6hdmi_hw_params,
-	.shutdown	= q6afe_dai_shutdown,
-};
-
-static const struct snd_soc_dai_ops q6i2s_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6i2s_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-};
-
-static const struct snd_soc_dai_ops q6slim_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6slim_hw_params,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_channel_map = q6slim_set_channel_map,
-};
-
-static const struct snd_soc_dai_ops q6tdm_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-	.set_tdm_slot     = q6tdm_set_tdm_slot,
-	.set_channel_map  = q6tdm_set_channel_map,
-	.hw_params        = q6tdm_hw_params,
-};
-
-static const struct snd_soc_dai_ops q6dma_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-	.set_channel_map  = q6dma_set_channel_map,
-	.hw_params        = q6dma_hw_params,
-};
-
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -682,6 +644,54 @@ static int msm_dai_q6_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops q6hdmi_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6hdmi_hw_params,
+	.shutdown		= q6afe_dai_shutdown,
+};
+
+static const struct snd_soc_dai_ops q6i2s_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6i2s_hw_params,
+	.set_fmt		= q6i2s_set_fmt,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+};
+
+static const struct snd_soc_dai_ops q6slim_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6slim_hw_params,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_channel_map	= q6slim_set_channel_map,
+};
+
+static const struct snd_soc_dai_ops q6tdm_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+	.set_tdm_slot		= q6tdm_set_tdm_slot,
+	.set_channel_map	= q6tdm_set_channel_map,
+	.hw_params		= q6tdm_hw_params,
+};
+
+static const struct snd_soc_dai_ops q6dma_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+	.set_channel_map	= q6dma_set_channel_map,
+	.hw_params		= q6dma_hw_params,
+};
+
 static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("HDMI_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SLIMBUS_0_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -1041,8 +1051,6 @@ static int q6afe_dai_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dai_data);
 	of_q6afe_parse_dai_data(dev, dai_data);
 
-	cfg.probe = msm_dai_q6_dai_probe;
-	cfg.remove = msm_dai_q6_dai_remove;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
 	cfg.q6slim_ops = &q6slim_ops;
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5fc8088e63c8..fe0666e9fd23 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1230,6 +1230,10 @@ static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
 	Q6ASM_FEDAI_DRIVER(8),
 };
 
+static const struct snd_soc_dai_ops q6asm_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static int of_q6asm_parse_dai_data(struct device *dev,
 				    struct q6asm_dai_data *pdata)
 {
@@ -1272,7 +1276,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
 			dai_drv->playback = empty_stream;
 
 		if (of_property_read_bool(node, "is-compress-dai"))
-			dai_drv->compress_new = snd_soc_new_compress;
+			dai_drv->ops = &q6asm_dai_ops;
 	}
 
 	return 0;
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index ac937a6bf909..4919001de08b 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -603,9 +603,6 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 	int i;
 
 	for (i = 0; i  < ARRAY_SIZE(q6dsp_audio_fe_dais); i++) {
-		q6dsp_audio_fe_dais[i].probe = cfg->probe;
-		q6dsp_audio_fe_dais[i].remove = cfg->remove;
-
 		switch (q6dsp_audio_fe_dais[i].id) {
 		case HDMI_RX:
 		case DISPLAY_PORT_RX:
-- 
2.25.1

