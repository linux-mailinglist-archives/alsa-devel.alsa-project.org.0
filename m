Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F7291797E
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jun 2024 09:18:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D6FE69;
	Wed, 26 Jun 2024 09:18:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D6FE69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719386314;
	bh=phMajaCgPMrdygg95XGWsoqmGYUzgAwYjPQJ+mQkKtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bq0OU2RmLSBXmi8ceUdnqLfgMj6OPXmHXG/uyCa6dvrP3vMnF8QW0TuwrIaF/CacK
	 xmJCEah+x0Piegb1QBn8ZfyxxCv2LuZ/wTXjU+R6upEvTwR2n5sGPGYIfRNs8qWQJZ
	 KA4mNLKR3zC2XXHn5AN7JUvq0Fp+JAJWNiVQ0lBw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 739A1F805E0; Wed, 26 Jun 2024 09:17:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C7F0F805D7;
	Wed, 26 Jun 2024 09:17:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 22BBEF80423; Wed, 26 Jun 2024 09:12:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::61a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23087F8016E
	for <alsa-devel@alsa-project.org>; Wed, 26 Jun 2024 09:12:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23087F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=RMLaHmnP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z526IhPYrAhgzCknBljrAh1Cnent239oF21fqgm9g79J6NiupXq8IC3zTbrLTNiI+21Z+PIoLKOs9fIMGHw4ZV3I7ZVIvO0YM0zjAQJBQYtxAWJrONxd+I6nkE4MsDOPv2ztVha3E7wS1i3LmMMQ+VJEeLwQQS1uool8DkWiJ8osfFWbySugtHOjMP46ocx5Wl5Z0o+ag2z/OitQE7HZB6SBTV0izl73w/TJSZwWCa3BMLyZCRhfJXdmNVWNVNJC6Pqry7JzZ207WWt9A0jamkWzQxJgCKqycpO1BqEuVnRtVz+mIzrwG7oFxUavOtgnwWYAbckTJYb2Forb5yAThQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBG5T7H2uwT6F8Boex1R5ZyhXkTEGjCjeMrmJN6/rN8=;
 b=Ki0S9BxVvHvYORlQs+sI4odjmOtXJzLZBrR+ue0IcPTU6270uz77Qqvwg8OaWteTVG3KrwzeWr9YbOK5EKnZt183Od/LmJP0XMf5VTtD0iX8Vvz7hXnx3BbZZLdbbjRsdvN1zNtmlDXp6pPUKAwOVLcJL4PfpyKG25w5dFXOan0Z9l2QSVri+OxG2JXEEj9vr6KsuqSrbE3IdGG8qBRldokOgn+3necwgYcxCW6tjkM2mcwaBJr870sSdW7zs1HIY1IJQXhm3DLsugR7si4+sra8Z7iutg8OXPmJqxWBL2gyesP480HMaskk23oTpgzCe1Koa2N8tD0M2OcNmDTlyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBG5T7H2uwT6F8Boex1R5ZyhXkTEGjCjeMrmJN6/rN8=;
 b=RMLaHmnPRrPiiohfnOxobRcNVPBm1h5iA+lVj5Ztfu2eX4/UNiGLOoZqvaG67OeXGYYemKft23DK5d+6e39yyKLjSKCTRDpkNEfprkBSm4P1qpD29yhuul44vZL0Gb/hwbSjDdjB/U5IG7CUbpw8Hu66DWRAvsruAkm3k1NaL0Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 07:12:30 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%7]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 07:12:30 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 2/2] ASoC: fsl_rpmsg: Add support for i.MX95 platform
Date: Wed, 26 Jun 2024 16:12:02 +0900
Message-ID: <20240626071202.7149-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240626071202.7149-1-chancel.liu@nxp.com>
References: <20240626071202.7149-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0023.apcprd02.prod.outlook.com
 (2603:1096:3:17::35) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AS8PR04MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 301af129-03ad-47a4-c143-08dc95af57ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230038|1800799022|376012|7416012|52116012|366014|38350700012|921018;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z7R86+zZHyBhqENVi8w2Dr1M/99zpXqpmmEIYCbykzqqiPRwjC53Hm04u8xm?=
 =?us-ascii?Q?uW4dt7m4zKasdE8dKYbGhu0GFf23tJFtpUPjjYlWKmV2xCSDvB7a4J7jKomo?=
 =?us-ascii?Q?/NKEgFN6B7+LQ80jWRghJYbkVmWpH6cPxYAW+S00OOFhRPgzwTDQ/86/Imay?=
 =?us-ascii?Q?Bf1pMKsZXPQrJ7X40Fn+ycD3JbZiK/9KdYaI7++i1vv3CwDCm05+EgYFg/R4?=
 =?us-ascii?Q?EA1x3T459/oLQrN9baA/3QY6sNBXniM+vN/LQALvvRvFsgl2XcZ7HLRpKgTC?=
 =?us-ascii?Q?jswHnmu2ymlB9FpCCeK2nYo6TaDFlxdE1ptRXZcCpQwnhN4KTQ/iFqenFCB6?=
 =?us-ascii?Q?PGN9+bwB5StBnYjZP16vwUQ48HwgT+T1MiKxSNAkl1YuHHAhdeNTErWPeCPQ?=
 =?us-ascii?Q?4nG69q8XNPZBm3GNw+SAKPt0KYWlwwjxaIhejYbCsEXwHtiXOyMutUzA5RKk?=
 =?us-ascii?Q?+t7CLFoXOqB0OaIs1XSIxPIZZ1DMxkNvz7GbgfQwjgiq473jMmtzvsp3DsA4?=
 =?us-ascii?Q?6m8oMTQdgd1gzelU3w//bxnI3gVHTCZECdMBGZY1sXWwhaPek5JO3QcRdAQR?=
 =?us-ascii?Q?Qdp4bhRIdOkd/o1RQJ4LZRgEzryQuJxUzx75/z955T2OONYiIYrocztP+Qmx?=
 =?us-ascii?Q?Y0jmQ5ZPgpi4VZIMFfdkHqcCZp4UElF/ENUGxNiz6PofG9bQzuSr3ZCu5RZg?=
 =?us-ascii?Q?IclnnzQiims/Ks8FxzTQkVWmuq/Bg0r0cIIeXt94RlqjpZWlDNRJw9vzSyE9?=
 =?us-ascii?Q?6i2oQuHyCgOkfY6bhar6h14NyuF/qgcBSgHhpx43+Axc9CkQSXi5besimXXl?=
 =?us-ascii?Q?0ldElNlvjWTtaHxknSzVR15JU6I6xup80wsq/6oKv3iIMPHwKtxvQnLACFkH?=
 =?us-ascii?Q?T5JgQQssYQgAir5k0Npo5ICvrFNVxqZ5xbursdXvYX8qKBmbDrvvyTMXmx11?=
 =?us-ascii?Q?bDeKs9URGsFFW2e++Ljq0s3ajteXqaq2ONmhp4fsLASntObgDIwRpbG1PAwk?=
 =?us-ascii?Q?iqHHmvDDnX/Na68RCOFQz+HMBQvWYuySMa7yn15HPtzZTTwoDf3TaNjJ7Va7?=
 =?us-ascii?Q?/nZwCz4V9AKe0782JVrC2Q9llSUaxqABrUdIpP4UTioDaX3SBAUsAeUI2cEU?=
 =?us-ascii?Q?cxFUarY6VgbMiXtSu5AGRqIVLf/yWTPzyhBt7VBYPOHCBYCyoLVcafHu1nli?=
 =?us-ascii?Q?b2YUNlJhlNhfUf/BWNzck4H3034inKOWGiSh3YCwh3CQYPLaoG9EVKAr6FPJ?=
 =?us-ascii?Q?Xbs92pEPgLKDy8K9PWr5Gw3Hpt4g8vMKBy5hXbnnAd0A79+zhJBOWPJuQFvY?=
 =?us-ascii?Q?deIWdMfS3PlYSCm6NLq6qErqkDmxGxFvwa8PG24ufIidWWsPX8uC4VkIiBXz?=
 =?us-ascii?Q?1x+jpcf2GF6GljZGzGepcr9KGwc62kHrUPPzTRbzksQvTKVfUxhwpLJdIxRt?=
 =?us-ascii?Q?B9LFstF0IAA=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230038)(1800799022)(376012)(7416012)(52116012)(366014)(38350700012)(921018);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?RFHkBkc/GFTHljpA5gY5STv6IgSTJ6sztbs4kXafgj2k6xTouUp4dMDsbSr+?=
 =?us-ascii?Q?+npcqRWcBFSZqgcCIXobSl4Gm5o6OD/vAJCUC9QD9359Y4X1IL6d4B6tkeau?=
 =?us-ascii?Q?wKFvkt+UXBPFju0Vx5t1UF1N61QFJc/7aiGZSb56o9HC53qqnilSQvZUU5Jd?=
 =?us-ascii?Q?jtynPgTONSnvtDks+Zeu1kAUtUm5VSwRjQwzn24rJhhyQ728YEpEiy1NF10L?=
 =?us-ascii?Q?GoLZirxAupcnol7RenX09cjDaTbyfq1a+D6MiNopxfnvmTk+JtPutO0M70XX?=
 =?us-ascii?Q?crmD0zVUbKsCIYfeEaZDBQJcxoZvieMguHl88G71zWQ4R6qriOPihPY4FfNC?=
 =?us-ascii?Q?1DeKh+2JheeXaElMAzt2RoABCuvDc1mM9caL/uGdcbDE28TjK99ToGb0kyk1?=
 =?us-ascii?Q?5CQTVCtp1ILjafZL614gLTy85ayLhIWgWv3K3WAks9mTjofLjPQFj6sa9uvW?=
 =?us-ascii?Q?zS0+NrOBRhRvKSRyLshRTYU2vKybbEodlP82A3o4PdyotFYGPmh5jPc4g+8d?=
 =?us-ascii?Q?UJzw4qbKCvkp9NHD4risDaNf0oaQVbqJachHIQCmBPjvQPiXcubp1NQhPRWY?=
 =?us-ascii?Q?Hon2Vf1QaiWIhYUQ0ipKn46Iyhms0B9Oe7d9xz8n23cDXaprl1MaALF7EApT?=
 =?us-ascii?Q?lCWJP2LfSlg1DoEgFgRX4T92p9HV3KFSCVXZp/DSx0vv9w1TEFK/EGq4knla?=
 =?us-ascii?Q?+aUWBfO2vmLvSAH3mktz6FaFZ7zCcHW9BW9Po/IUWhDdyF8/dUmt19eW+pui?=
 =?us-ascii?Q?mdWP1dkIAzFcXhEEerr/sINkJNXCaNpWR2XT2RysG4+sv6YUFETbagVelXm0?=
 =?us-ascii?Q?VAObRRm5loNtFLTVAN10N7fyJREGAiUyY1X57DMp/KRophEjSH2BJFS97588?=
 =?us-ascii?Q?SfPcVK05D8a1f7o8Z+AtDr09MAXXKdbjPhtLOW/Y4SPXfcRELfSCTacI6nSD?=
 =?us-ascii?Q?ICH/XOxQIbAMBuhP0t/bjNcuDY4Miv8tWr0XeyTST2JZNhWxZtg2x9aSdaVQ?=
 =?us-ascii?Q?GquD1BhuqDKx9oVvpnysqzXVgjInvy7JktzOFiBzJoM1K4RMkCMHYOYcGVnh?=
 =?us-ascii?Q?MMTvqbCg+GrKAday832Sf3CbV8JnQ+t1FUiv44wCPnD55R+DpSpC/ztAdJXB?=
 =?us-ascii?Q?WVq9Ux9jeqh877+EB7piBk54ImoTc7I0gPY8kPRNUO9hH3m5hlRh3s+57+dN?=
 =?us-ascii?Q?SiLBZKZZryh8SISAfmnoykHxdNixlrS/WGwJLq7CR3ULwnZU4t8qxNHGkXBU?=
 =?us-ascii?Q?Z3AZ5PEIwgJW/i9w/76QJhAEUrDOGIJDSAukR7E0E905OflFyqNCH1kNYrTh?=
 =?us-ascii?Q?Gk06HGX61TaDOjas+NBslIqN3H7zLbRSvabhLtwfSu4TtO2cWdhBVmywgMvl?=
 =?us-ascii?Q?QUz0iN6deqshOJcvvW6wlgfG4JOJlR1tOiBiQfD6LyvNxaBFMv4hWb3/7TTE?=
 =?us-ascii?Q?2NV7Hk1eVw0uV7NoPuv9TcAKYplTP7jZNVkSgB6/oxSN6An+NNZABrl36M6k?=
 =?us-ascii?Q?3FAz8GpuDBaR3AmrQeyNbiBYxWet9Sj/8+n0iwLOHF6ZNGlIEWIZz3Uyaj+9?=
 =?us-ascii?Q?oLZ+eESqSUV+yapwa93LizM8KAldVC4nQeiW+Flw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 301af129-03ad-47a4-c143-08dc95af57ee
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 07:12:30.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GcObEc6rqc7m6kUKFFYl/jMLT9DFu1xzLVe1Z0p9Juba7fVNXgASXnIyYiZvUNuhZJYuDSvd6lFzjfqbuJAmLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
Message-ID-Hash: 4JUMHMQVJ25LUXFZ6ECPVIIJVIB2L2FD
X-Message-ID-Hash: 4JUMHMQVJ25LUXFZ6ECPVIIJVIB2L2FD
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4JUMHMQVJ25LUXFZ6ECPVIIJVIB2L2FD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add compatible string and specific soc data to support rpmsg sound card
on i.MX95 platform.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index bc41a0666856..467d6bc9f956 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -175,6 +175,14 @@ static const struct fsl_rpmsg_soc_data imx93_data = {
 		   SNDRV_PCM_FMTBIT_S32_LE,
 };
 
+static const struct fsl_rpmsg_soc_data imx95_data = {
+	.rates = SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 |
+		 SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
+		 SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
 static const struct of_device_id fsl_rpmsg_ids[] = {
 	{ .compatible = "fsl,imx7ulp-rpmsg-audio", .data = &imx7ulp_data},
 	{ .compatible = "fsl,imx8mm-rpmsg-audio", .data = &imx8mm_data},
@@ -182,6 +190,7 @@ static const struct of_device_id fsl_rpmsg_ids[] = {
 	{ .compatible = "fsl,imx8mp-rpmsg-audio", .data = &imx8mp_data},
 	{ .compatible = "fsl,imx8ulp-rpmsg-audio", .data = &imx7ulp_data},
 	{ .compatible = "fsl,imx93-rpmsg-audio", .data = &imx93_data},
+	{ .compatible = "fsl,imx95-rpmsg-audio", .data = &imx95_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
-- 
2.43.0

