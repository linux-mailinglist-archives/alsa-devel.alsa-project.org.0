Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9036EA080
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 02:13:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A467ED0;
	Fri, 21 Apr 2023 02:12:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A467ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682035981;
	bh=3+VeNJgKqqdMKqRhG3e7UNX3+WqIJo3eD8l2xEMNUH4=;
	h=To:In-Reply-To:References:From:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=InO8TIzYVaNqskQlSzTN9qah7Xhv9r7dl+Kdn146qDw1VU4CNwCWhjhpv6mkZiDmE
	 BCXfRSxtjTyM0/RIhba8Ix3/G7IW76ceSHNzU/XSzsAkRDE/AlACWjGiNJp17nYmw4
	 aNm3wbX6VWRGyj1+0HeqsA54icOd8d4GsOze+NLc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BEA1F80549;
	Fri, 21 Apr 2023 02:11:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8641DF80551; Fri, 21 Apr 2023 02:11:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0D758F80533
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 02:11:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D758F80533
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aRAT2cSm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UP2m5sdWfsZqJ8zL5ZwudzEV57ZA/zJnk1oJWCjBC8nWV8BVRW+X+rfuFFPymZLG7cRrXbwdp/NtD3i2YVBcC4qFZ4lzfEdR64JQwitb375rddG6pkeRTNR+smp3Sb/aCFJ1W7mOzaMM0qmR8iqZvOSyXZLPBorZs0AQX/8wh1bko/t8dmJKo8cwZAOELx2FeecCa0fzml5WkLCjRpqXiWHT1k3WyM0N0vxWZCOmj1HVLW5Za6ZUBXsoSoFpagNIKeFuw9EgQletvImHwjgUPxT/4rLdqCvVlDukfKQVgoYCwt/+A7TM6TL0xhc/GK2DPDPrCVlD92fN7jxlNM/5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4JwbrpdLePau2RWXvqT/cQxygUeIn/NqAFH6mR2B60=;
 b=d9sPQQ9NBYEBA5i/z0KKARjvywuERQUyPJGQ0XBfG59MZMnzmd5yXowXn8zj7Yg7ognpO2Fxpl9IjKjWTNgZtvQE4s8wQQhVIZUB+rfs2s/qgmqYbS7ciGMJiXfIH85GGznArEDtrnPkztpM44zplE9Vxq4AmowahTaiGBZhEe3pxLnRmCFjGOgAdt+xVDZm6qjlNuDqjiP5U5Djhf8f5RuWI3eri60ba4YXFllBJ60vu3iFaPyC2GLZBdxQfuPRPHKQkv7OKr1S9xpLcClJhqK1HZKwHQqvIEcjaLTHqFc30dDfnCNd0dJbhmcxvHz+wDT6kd036ZwmA6113LHBJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4JwbrpdLePau2RWXvqT/cQxygUeIn/NqAFH6mR2B60=;
 b=aRAT2cSmMNj350cutAElhj4CZvvm6VoV2g2ynhbXVp+EKYdzT2s6PbRkxAYiwmVDDL2UdDNo/fKlcmnvbdtG+zWO9SH6fmQpQaR8F5/cgp4kROn5VEj4DDX0KEWTHNULWJsX6fMWaDD/fpiimqpFmuDsgJQPdxpEB38ZrtwxDqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11167.jpnprd01.prod.outlook.com (2603:1096:400:3f4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Fri, 21 Apr
 2023 00:11:21 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Fri, 21 Apr 2023
 00:11:21 +0000
Message-ID: <878remf61j.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz3yf631.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [RFC][PATCH 3/4] ASoC: fsl: imx-audmix: cleanup platform which is
 using Generic DMA
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 21 Apr 2023 00:11:21 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11167:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ae140ca-b6fa-46d0-811c-08db41fcefb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	azHFXwDIKZ52tY/YHcqjbmbTcPryghu219XPZ3OPMXhi7Sq0CPmu/xT1UMBW1RJGZYM1RyNXrDPZLq02OTFNtJ5f1xh2z9G+lxz78viVSrJdfLJBKMQH8IVzPqn6Axdggeu3ccwaMZvFmTb4VLD4TGA1mwMDpb1MvVAVbQQIWtdlEhzDwR8Hc+IlJ9Bcqc0N9cd6HUPbztxKczhdsNG7UvmGeIkDnYcpeIk/+kMZKePNfkWWlGa5BDsrG7RPdpPMaNChHKiIAW3TxdmTcHdPvWjG8KOYiBHRX/ruDabktDF9/ho+X7QvgWstCi1aSnAs/4jy6B+FCWL+zshZMOVOCOzk3jXESitMYqsgaYfk/byM3h0kcVBzIKhaTXhhuMDaSqnghxXtORCmF/XpoPe2kTKlVoeYDyBTX2XCvlFnzAWLjp74mv+Svm96DURtG0bD1//JTMj9hAVixGF1qd0sTJXvsZMQvVc4f+tm1ao8Q6vdvOeDzWKtY88xjuco0ro9INn5mTjCE1B8wYXgOXKRGDLJhKivx03sLqYJqctqR8LJdjENt1Yup3uCrlhvyvQGCLJXvNE224DlF6AO29R8BczECCEIAdepAMBrddETRDRQjellyguPwXhn5rKl0t/7E3e6GlCbI2y1L1u3s96hRg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(451199021)(36756003)(2906002)(38100700002)(8936002)(8676002)(38350700002)(5660300002)(86362001)(6486002)(52116002)(6512007)(26005)(6506007)(54906003)(478600001)(2616005)(83380400001)(186003)(66476007)(66946007)(316002)(66556008)(41300700001)(4326008)(6916009)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?z1bDyk22pjdFuWtWoe0fEvrxoSn/mOV0aAtdTLmzaDFqlJURVpcHO9weYmd/?=
 =?us-ascii?Q?Rj1n0nDHBbfMnOERK55ZrE4vJ/Jtmquyn/68ZgB6X/aPbWJJ+kUgTmNEeX4a?=
 =?us-ascii?Q?/dwur9jGvtL9UQqFAm6kkFRjZqN9axoFEGMrtEE5+C4KrVnVicOnXU92Bavs?=
 =?us-ascii?Q?n6mJBATojhZxokqLj0m4D/6qmtXp3rATYGQwiD4dScOct1Qm64Oy0rwKMHKv?=
 =?us-ascii?Q?VSgVYxUAvsgpiSsBMIPnGs+MClkTp7XAUORPc/avDBrzn5a/UqPIEI28fzyI?=
 =?us-ascii?Q?pCFP+FWvW3l+NOBapZcajhryQmys528hIpdr8T7IeluaGy6V29lQTCyGJTyt?=
 =?us-ascii?Q?2sF+7D+4Rt46STg3UK+K4chsYV2O5t0jeK8iaB3leEQF1COwyUgyZRSJOKsm?=
 =?us-ascii?Q?HdFE6RFbChop0VIOuHJbruM4UwiEBEKd4wbCUK0EAGTYGzzkSDWaB2mHLK0R?=
 =?us-ascii?Q?hZoPJrvnplO/0nlEFcGXV4sBySQVXV3kECohtvOdQM/gm1lHfQMhJymUM8XP?=
 =?us-ascii?Q?E5gm2dAk7aj5NNViz5NbcVRIR2UqdisP778PXPRJjMzwxPtT3E0ljQTogJ5x?=
 =?us-ascii?Q?KN9+O9AhZPX/6fRMzTW3k8iWiHAW9hVJv/TIw8OgBTyzWC0v3GkpkfLXuYzz?=
 =?us-ascii?Q?nPF8Wy5du++FZOvJtXfTmt2Dr01oQuETdZUGAtI8YscM19uP+RwpTEjqWJh4?=
 =?us-ascii?Q?xnrtqKXVJdzSHj748pNHjCKrHJ2ir7jn2c6+gb/1pb5SRij8AAxPU7gvs+Cw?=
 =?us-ascii?Q?QkYUBLUUhYXhBewdZRCqf032E4IeHKodG14yPx02T3iJ6jBiAQmFr9j/fogu?=
 =?us-ascii?Q?MYlJu5K4yxR78SK7Rc3UnHqKO0FhwPoIoQ/k1BvfdZ9hkXQToeBE8rwDvxX9?=
 =?us-ascii?Q?8T+jkBX172KivnHVl/z7DbtEA8vfNAdKwdopabbGotqtqekkCtiH7xUVKwIj?=
 =?us-ascii?Q?2USgfG/o+4waeHEnaQ60eIhvv3+GBsEk7M6iLEdxyotXAzAGyTAY13zNZeDh?=
 =?us-ascii?Q?yURQVfw6cBOPrnfrqIxOwIkuB6+zfOnXg8XY/YqYToVjaQlN+2X4bu26fPqi?=
 =?us-ascii?Q?/F6FAM+uNLlFLudFi7KyaOQre1GLCowh32m7HtXAmh8IMfgE9PI2VeVxTOmm?=
 =?us-ascii?Q?uF7B7t0RncsHKisTTdNoYW98k0+vHf/cfjkPhvrfps/OcPKwqNQ8a9wXMY8F?=
 =?us-ascii?Q?cyAq8YFOnQ8rFYbLbnSXyLXUQ5vs5d+u4xQiKNrzmkkLfp/VSbtAzUfsWee+?=
 =?us-ascii?Q?YZT3oOp4B5OtWVZlo6CywyoOMYQecPuwPNkaOE/NXFXNrkIQGYPfOjU5/ypj?=
 =?us-ascii?Q?TAR7LZq932boTDE0iUGgDO7ltoenvVY6wF5uRvz8CNNUGghjTdzM70enxmUu?=
 =?us-ascii?Q?k2XhdkhPzYcak9pivmDStNyFHpPoqtNVyT5DYXNXQ3e0gCJ9NDyECECmNOxD?=
 =?us-ascii?Q?nhr9V8+Bqb1WdBIIG9WPRRsUlbW++LHo8SD6YChrSkN4bCLNW+LPxtRI6tyF?=
 =?us-ascii?Q?nwklmsSCgDm9ACagfkATqpiAwnx5te4V6lSuW+i3hs33e7bwAPRjAIkLv0tg?=
 =?us-ascii?Q?C1nC/QmA4x8zk7VwalpBEpiV1Z7t4F4Lj996WQsRb26gy/s2OHMh1QT+ib0K?=
 =?us-ascii?Q?7+FgQTfT6m7TJqTetlBYI1I=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ae140ca-b6fa-46d0-811c-08db41fcefb1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2023 00:11:21.3500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 a+YPqgezfatCefnZVy4rtJVMC3kLhD+U+HUmGEXAeFMMDz18Rk9LIceC83Mx2GV50ZSJumZ7E29rkyuZfwiET6qQKjfIIRdjRY3Jtcr8USXzGFShK2hKYQLQsNX/HjN5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11167
Message-ID-Hash: THIMCQN7PADSDKVNL2ZB65EYLRO377SI
X-Message-ID-Hash: THIMCQN7PADSDKVNL2ZB65EYLRO377SI
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/THIMCQN7PADSDKVNL2ZB65EYLRO377SI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

If CPU is using soc-generic-dmaengine-pcm, Platform Component will be
same as CPU Component. In this case, we can use CPU dlc for Platform dlc.
This patch shares CPU dlc with Platform, and add comment.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-audmix.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 1292a845c424..cabef0de3891 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec/Platform x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 6, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU/Codec x 2 + Platform */
+		dlc = devm_kcalloc(&pdev->dev, 5, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -238,9 +238,13 @@ static int imx_audmix_probe(struct platform_device *pdev)
 					       dai_name, "CPU-Capture");
 		}
 
-		priv->dai[i].cpus = &dlc[0];
-		priv->dai[i].codecs = &dlc[1];
-		priv->dai[i].platforms = &dlc[2];
+		/*
+		 * CPU == Platform
+		 * platform is using soc-generic-dmaengine-pcm
+		 */
+		priv->dai[i].cpus	=
+		priv->dai[i].platforms	= &dlc[0];
+		priv->dai[i].codecs	= &dlc[1];
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
@@ -252,7 +256,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
-		priv->dai[i].platforms->of_node = args.np;
 		priv->dai[i].dynamic = 1;
 		priv->dai[i].dpcm_playback = 1;
 		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
@@ -267,9 +270,9 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus = &dlc[3];
-		priv->dai[num_dai + i].codecs = &dlc[4];
-		priv->dai[num_dai + i].platforms = &dlc[5];
+		priv->dai[num_dai + i].cpus	= &dlc[2];
+		priv->dai[num_dai + i].codecs	= &dlc[3];
+		priv->dai[num_dai + i].platforms = &dlc[4];
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
-- 
2.25.1

