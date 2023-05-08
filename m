Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AE96FBB9E
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:53:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0209711AC;
	Tue,  9 May 2023 01:52:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0209711AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589983;
	bh=TWyMJBcZyEF9SNRMcZUvCwEb7CjiJNoNibuvZhpJsKE=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Eu3YDCHZZjVApqLMlx5eCl2QUs4ohkFAx9zdeiEMRpHW6ZAwSTqaZyv12NJlo7kek
	 WPhKHWIxsvFEcx+jSZCUfQAolC7bwFXCofWenCvPrREkQJXfpIQOAmWs7xvfs2CG4s
	 cst3xmvHeewu9RLP2TK2whdgsKDKNnL3IJWooXjg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68581F8052E;
	Tue,  9 May 2023 01:51:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CC9CFF8053D; Tue,  9 May 2023 01:51:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC886F80534
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:51:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC886F80534
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=AtzQak1c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwIjoewCJ7otUFqj1DFGxytRayek3hCrRPUgMQY5d6LysMBkBPFqt6Q+TcIaFqviYdKL012phovEL14/kHnlvnYseJvKiHQuJt264LpvM6m+E/UK+cvpH4BslmoOiJ/sMWpFJrGn8dvk32Q/WHJHVU5YPXdO3Ldohnpx/QxvkKXtn927iNnvW/DCFF1/mFftiQSh6+kdkbYNDydaQ+RZZfgoQ8i7mkcq3J0+7rqsbmQpg3/uUC6JkhzUugyCQehNo3x9Ht19NAmZIo+kYugrzL9FRGmuyJYNAxgBymdYx5dvEeQMHXurhjYIG7Io7aljj6IBeAMfvRHPQRutpSN9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd2APHEbK+LWgfn/zoTh5Bk3d69NV1EG/b0RIT+4pU4=;
 b=EsdndqmEB+CNv2HVpI2ANiPDtvqYnzk84eATo3jp0fm5FWEWAt8XiAj7M7neV2DQBYw3EFc8I55obrddPf3GfnuXr/fxQGQLU9srfN3GwYYLpgZ+OeOKHK46NCKlpagPZy/qPlbh/H1JKiAw7svRiXUXla3j9wU9qHcfZmdbk/NZVzVYqvXY/FJaO4WYWS7x0F2Bzf6MamvQm7EkoNrkkb6ID4ZWgHaT0bTXS+/Gs3eMZTzkepJQ8lvauI2rDPSfjt4YxY+3bOQWOAWTjATZPdhtezKjy6zKSm7RK/rThih9//wK3rqeSpmlv8E1Nc4SnosicXMUN30uHmFSLQus6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd2APHEbK+LWgfn/zoTh5Bk3d69NV1EG/b0RIT+4pU4=;
 b=AtzQak1cUxNznzWRirakijCf1jJu2o27hD+5O04iIa9rBwgtF//gfYmbx6ESs/LpbKxhZCp7N2V5nouGSwnoskP+UYesp3zDWE/0/oztO7uTnukH7ZhUbLz35yw8mm0ZBrLIIF+UM49v5tBwppsXUtgarQ+HJhW+Pc6QGiyOpl4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:51:42 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:51:42 +0000
Message-ID: <878rdyl6uq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 05/13] ASoC: fsl: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:51:41 +0000
X-ClientProxiedBy: TYCPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::15) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a57532b-3f35-4e48-5912-08db501f2c54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oervk8Ed0MZys4vzWMwb6wdK3WpPhpyhebA9CBCO6OUS4GjxCPR65nipJvy1MBqKtL/fIMYTQMr3YKhlGIxpevfs9e8v0KF7AyYLzPf2UneUxXcZLyyh9ZPwVxCUkTEhQXiqPFrGWMBeZw67epB2+Kzzxd+4uwS96mkOQtz/T8z/XbqlnUVeDWwrqUcOXetPlEiyi67e3Ymo4N9K8TKAXaLXFOxFIpXUV0C48Ye0hz34DEuqxl4bwCXQ0fZvULxrT5i6Z69SpajUjItqKKI1havfY3OVICsn74ZkaNi3pYrI8afP6kY6S6yPwD/nBbKEms/CqGXAcSOaC2YAi4bZglQjKtVGm/n8ltGAZpSINiSgdjzBJBM+WCCpdNZ9Drzl945Xj68/1jITU9kUfx+eMJsuTfFKAxZFDGC8FJi01+sIIdnBtSp1uyhxZdByjUT3gXkBn0Tu9V10AGXeXg1Q+7etHdAaJSTMmMCNE3PJPteXXSinwsvHD415rf2VsQBkVUCoxe/ggEdjZHeGZerS8Wtk3BCy4nIXw8PXwTh47JweqnR3NCwMmylRIOXT2QUPiD84S6Ln4QdSd9WQEiIGm24SxtrZX9JLF5KhyETXTVGaXm1UcTbVKO4sPjiyO2MX
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(54906003)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(7416002)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nZ1D4w/9nMCf72Hz/TRLysm0mOENmQnYMToKVlR3LJl9isMaPmDAcRyZUA9b?=
 =?us-ascii?Q?1fRHq8ixqG1CZZEOXnZmAG/FmnpQEMGRTyyb8ssExNqwgpSnVbq+YchSwaF9?=
 =?us-ascii?Q?5dGQ6uBfa+hygTBv8rjQWVsoFvM2i4J2pLlMMkuU0LX43/e4Zwlbg5L7aZIo?=
 =?us-ascii?Q?QEiN4tcV5aRGZHZAtiK+wumPrQTt1EBpjTEIZWX/zt+dfKl52+GW0BjZctn5?=
 =?us-ascii?Q?wrkcVmoaOV9cJfaqnVNIiFc7+ZMUwR8dCm6Ub7f/4UTgDcAqfL2DuS//mePZ?=
 =?us-ascii?Q?e7mmCEuAQaMg+1jZWUw56SU4prkdHGLSUqxiAIShuIYKeT9bXOmyVO2eLp5b?=
 =?us-ascii?Q?qL/KloBkYeA+BIjdZ/EkQ1eGawNtMTZCfzkRocdt1T8FCfRTgNhpgZeYa8Cp?=
 =?us-ascii?Q?iJo195yLYWTfENrbwx7c6BypDsaB4G7B2VQbAaQ5ru+VTWXGTt5AkBT7vgnn?=
 =?us-ascii?Q?3dUDNrRNzpjC/s7sqTiLJ18KkBy35WtBt8FcFv+m05XKOg+bAKVhwMWS1f6D?=
 =?us-ascii?Q?1bJjqv3S1jorYc6+zY4Q5dhSxf8N7heJgFWUG29PA4ilyxJF5PC4lFwbnGMG?=
 =?us-ascii?Q?i5NTmv64/I1AvWLQQlVUxpo5jFUA/GKB4b0wTrMZy6CU6h5i4Lwr1DjXlPY0?=
 =?us-ascii?Q?zUybcd3J3iwzf8XRnNpZVe4BuckobA6EVpaMyy5FsUkFf11Mwx3RtmYwPpCG?=
 =?us-ascii?Q?oiEG5Wm6mc5zF6POk6xJDC5gnHLIYEdho5xW73wdduykEbZMVcpW5UTA0s9n?=
 =?us-ascii?Q?7QAS4KzZ6TAmKNUFLFzNpfGqXp6QYTBL4h2YTT7vY/ffhofulv1SWD1HcT9f?=
 =?us-ascii?Q?DUQF9l6eCHkO8JCbGuSF9n2dV3kkBCGpQuOSy8hPHY4q4DZmli83nehzr1sv?=
 =?us-ascii?Q?+eDQxH2rD/8vMmW1RvLeX+gF9BQCnT6zYhGyTfUlLJRECqSmrBy5v7JHzBFD?=
 =?us-ascii?Q?1nAJYxshlogU18UFmstUoFL0YUmBdmxl5L6Lu6WIMWP85cVRVWBQkseZbxTH?=
 =?us-ascii?Q?BGxZ/r7S98hNQiTxPEIany/e1wtezkRjWZivEciwBLB+kh9k4ZwKWpIEtgkT?=
 =?us-ascii?Q?nTRqmcVLUauBYuZ+nRdgxLDBoKbt0Fxbsm/1FRPn4odGHDix/+0va3Z5DbFl?=
 =?us-ascii?Q?rCrmljRHnxqWGNzqVChJumC5+RXrON4JfiXYd5wQqPZt3JLjnnEPq1kzDZip?=
 =?us-ascii?Q?ED0z9s0GingPWV757K9s47K88Mvfgv9tv3ZcMTWDR4miK8qpoWnWIL+vt0l4?=
 =?us-ascii?Q?TXM80RdFZcHqslBA5Nc0djJpVV9X7KewWt6oRmAyK2JEexlmrvrur/vetYhF?=
 =?us-ascii?Q?beKiJF5dViCc6WtsEflfl1EOs80E/ZWL1b+wdLQt+05jOehEl7hpTMVXG3bQ?=
 =?us-ascii?Q?xetCkZrKGZWDMnIWHR9+QwhAzgekykMBlnB+J6mj3MZbYw77SuobtT7I5U9F?=
 =?us-ascii?Q?v9M1yaxW9wIH4V3nfjCzNXV6us7QKLZFl2OAjxT2pvtazWdSlCVWJS4ZrCqJ?=
 =?us-ascii?Q?Mt9TOlWPzUWEBMK0H1+O7q6Yz9+kfec1bFoh7ZsifxlHMWkVtLpfeaA12f0D?=
 =?us-ascii?Q?oNX43Zq1yVabHrOQI4Q5Vj6ud6VeVkeuTAAOXchLHV0m/Sargxbuqio5UjH7?=
 =?us-ascii?Q?GwPs7kFObMlPQMnH8U7PVzU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2a57532b-3f35-4e48-5912-08db501f2c54
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:51:42.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /S4KT/jdXg6C3H4uHzt6Xv566YoW0IJOe5p3XOsjK/norGicqtDWw9ro3r3C2YJ3Bm4OroVl7FqmsGH+HIeSMunTgrex9Rpsd8UqOHe9gtzGmLdyNfJQ+leyq+1uyFqW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: PFDBKIGIUMKVCR57GBXRYEIZB46HV7VC
X-Message-ID-Hash: PFDBKIGIUMKVCR57GBXRYEIZB46HV7VC
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PFDBKIGIUMKVCR57GBXRYEIZB46HV7VC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-audmix.c | 14 +++++---------
 sound/soc/fsl/imx-card.c   | 11 +----------
 sound/soc/fsl/imx-rpmsg.c  |  3 +--
 sound/soc/fsl/imx-spdif.c  |  8 +++-----
 4 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index b2c5aca92c6b..efbcd4a65ca8 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -244,7 +244,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		 */
 		priv->dai[i].cpus	=
 		priv->dai[i].platforms	= &dlc[0];
-		priv->dai[i].codecs	= &dlc[1];
+		priv->dai[i].codecs	= &asoc_dummy_dlc;
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
@@ -252,8 +252,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
-		priv->dai[i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
@@ -270,15 +268,13 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus	= &dlc[2];
-		priv->dai[num_dai + i].codecs	= &dlc[3];
+		priv->dai[num_dai + i].cpus	= &dlc[1];
+		priv->dai[num_dai + i].codecs	= &asoc_dummy_dlc;
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
 
 		priv->dai[num_dai + i].name = be_name;
-		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 64a4d7e9db60..78e2e3932ba5 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -615,17 +615,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 
 		} else {
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 		}
 
 		if (!strncmp(link->name, "HiFi-ASRC-FE", 12)) {
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 89178106fe2c..93fc976e98dc 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -92,8 +92,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-		data->dai.codecs->name = "snd-soc-dummy";
+		*data->dai.codecs = asoc_dummy_dlc;
 	} else {
 		struct clk *clk;
 
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index ab978431ac98..44463f92e522 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,7 +26,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
@@ -37,8 +37,8 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	 * platform is using soc-generic-dmaengine-pcm
 	 */
 	data->dai.cpus		=
-	data->dai.platforms	= &comp[0];
-	data->dai.codecs	= &comp[1];
+	data->dai.platforms	= comp;
+	data->dai.codecs	= &asoc_dummy_dlc;
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
@@ -46,8 +46,6 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
-	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
-- 
2.25.1

