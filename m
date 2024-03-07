Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF668748FC
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Mar 2024 08:46:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 39968850;
	Thu,  7 Mar 2024 08:46:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 39968850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709797572;
	bh=UdzpLy7t/M4jL8zY0CvNf54Yx25bprqtjbhvuOVzB7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=f1JbgCNZVrbjQQQ17dniueiYaqFerGMn0E4NtNGSz7Tqk1joBYlmRHd9mDlZ9TBUe
	 MF4RWPEcmxivOIphx7+9RiSMl/4dDqLATMn0qUrg9Ye2w8TQrDSVNgYdp0OrrUxaT0
	 pEuJBebm71cIaiTY3ome0AJuLnbaMgxF79k9qMDE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5632F805D5; Thu,  7 Mar 2024 08:45:26 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDADDF805C3;
	Thu,  7 Mar 2024 08:45:25 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E9CF805AE; Thu,  7 Mar 2024 08:45:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46839F80088
	for <alsa-devel@alsa-project.org>; Thu,  7 Mar 2024 08:45:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46839F80088
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=NtyTkus7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMfF68/AZjEs3zQT/IypkBL92taO5AHqB7VbaU4Z+Z29lfs2dXSdHUy1JQzcXoPZPH0BLP4Oqw7karJGJiPYlREY+3vclM/jJ2Jv+gJxL95V67/QUweTCAj5u36r5FEEBwm07TmpuJYFop4jEINc+4rXyXqSnec7yKgvlIpr8f5J9QDZGvnkhxxvLhueoqDuhL3oDY9zGlfZL2f8VqHHysvjEnO3hzpCNZw/0GHk+TOrFWIKrXY67OCZ4/2Lf6Xr0LK0BGnbqjhBomwVvd/G1Uyl/0vwmM/r5NoMv4xN7saZJb+jq9a7ALpex9pxU4T05S+bsSrI20IqE1asvpW64g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbsh0ootkphFdcrrwWuCS7B7NeWjjhCbN1sssmNZ460=;
 b=EYBS5AdrxceELNyPtffsz6X6ZNL2qCI3AlnInr0ZkcpOQT7W9Eu7iKKhL//hSKpLt+B42/kYCe1xGn1ByLTxS9gnSORWy54wZ8MNUK0R5zCz8LwthEwSZtBBkQBucthJsre7wGzK0DLLd1G1ve1ds8e5q4A8Vm3err2r67MKdxSEzpP5/RB63FPc3w83LsKMotSNZ6YbsOC3Y6efr5UB7iMUAspIhvMzZrJsHB5RUzsadgO5XtEoe3+5KRqp0ZGPCcNd9iuE2N7DU5LeOz7i3gB6jBDqns7+SK1G79cwMCEv2Vx8d2J/s0r1WjhpoQWUfE1oedCr294dmcvhQp61DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vbsh0ootkphFdcrrwWuCS7B7NeWjjhCbN1sssmNZ460=;
 b=NtyTkus7ajEI4UlnkzDCak+BMH5wMMMgKFsWHKZ7DdLE0Foxxlmxbx0o1GU6ZOpAj8YM2w5RUI/ejgE/MbOHallsJQp0rmlkWs3T8FCD+qaAXmmXCPA0DRDkBXSa73qkoSLdG4hmM6hBEBBYw+ozmVwtda2KaXmNC78SRmq7pas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by PA4PR04MB9464.eurprd04.prod.outlook.com (2603:10a6:102:2ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 07:45:12 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 07:45:12 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 1/4] ASoC: fsl: imx_pcm_rpmsg: Register component with
 rpmsg channel name
Date: Thu,  7 Mar 2024 16:44:34 +0900
Message-ID: <20240307074437.1472593-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307074437.1472593-1-chancel.liu@nxp.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|PA4PR04MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: 6987bb08-24fd-4219-9705-08dc3e7a8551
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5Qp0EF8+j2QdiSwvQ8CMamKp+Jsd3xu31+TzNoIb1r6uzPtpMlBsl2Jf2+ZLPzcSP+xUHtYY8Li+qHt6643S0GxHqHdpP0PzR+4aH8O/VdtydGEqAbeVVQn7VLBc4C+MR2KSIjzAy7Au830dYI7NR1AcB618qglgBGP7SfCqIddZt+L3UsEINQkWasebUEapCa8RCJfo08XrOyS8cmJPkqoH8Wosyhr+psINIhEFQW3hPjoWuAhyKk+splUoTxZ9zCECXmGbUONaNlRtcAau0j1n5XFKb3CfcIJnMBpuqPyIVQUmAbu3v7WQHcxypoBuhbj9wyYnmKTV0OCAWnGRJ9a5fzNrY+Xq/Wv41GHy9o0nsYQHfZK54zG32HGKkSBiw67w8YAoEoQJi0b1BNse2B+fcETh5jNgYbo8rog6c0i5iRg0l8ZJHeb4s6OvFh3a1DFAZU2lsYtg/fyoxQQAEEAaVpZrFKxgL3MfE7bH7775Vzy5U7Wfgv3wAUDHQvpVdxWUjHeikTOt7qg7w547qCBwKq66V+D1cwcwG/Dudb/qPPzRsBLKzElSxhSARxwwYVoBeGkKTqp+xnWVVQrQiA9ocIyCkWC6f7ihXIte3Oqg8OyZiQ4d/tF9aSFob3UUvbqP7iY8U7/lbrf0zPLmNq2MXBbqHZjrNtmwVWSZMNWAadm5HOE0kF2+NBPauMO1t3Kl2zKz7NpX+jxdzqa/Muurd3jup75hqDtNBl2YVCw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38350700005)(921011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q42qnkxxnTm5tET7tjx8dZJcXO17X0AkD8y4sYB0SGwFdsKKuNbWRMSvPnSr?=
 =?us-ascii?Q?QxQczhVn/FWPwIFyzK03RRtgomf9BwlR+VGJqc+0xXxiBiv2Oy3Yh34XwJ7F?=
 =?us-ascii?Q?TyIC1q2ZcsZcJq0hD56ySX+M44J+11Zfk32eT+Q7rRUycL3NBTI69BBqsziD?=
 =?us-ascii?Q?wYqYybXxV0OmUILd4DE/DFLfNebazbc3spS5xCEWvgR3LL+r5RSj6Sn/7aiU?=
 =?us-ascii?Q?6KJgrpSazlqxdPE7wvUexC5yBhkaLfl/mq8YCdmibWpsWoMH3PxhAxBW7O8u?=
 =?us-ascii?Q?vxnBIvqDYr6jEBHyL75lBuQGH1bq3A5Lz47gIJnOGNu1PjGeK524XqwwUkN8?=
 =?us-ascii?Q?8yl3i6WC9Qw4U1jB369vtOiHBnB/voGj0vs7gnpuHK6BZblMm+l/cag5YhAN?=
 =?us-ascii?Q?vXAZRI9xs9CHNx4U1jrEz2jvNkDxxDtdlzDYx7adUKvan4TvVOAK63LZ+f44?=
 =?us-ascii?Q?X5JhWt6S4BeHG4Gq/ayEA5z6F7NQ4HXlE/MKFkOH8PblLXYF/CTeIMvZW+yW?=
 =?us-ascii?Q?pTYGpnGY7HKZwFrGEcEm9GWUq0+trF4K4AnnEL+9U5fBXmXFGpWydl+YZ3+E?=
 =?us-ascii?Q?ZPqRGFbMSh8JusiUTy7PpFrnVRvqlJ0S10WsnGmwf+xeUURa9ZJjiiA9Aahm?=
 =?us-ascii?Q?Q7/QciljubnXHGCL1o5SCfejOOCNs2+S2SjU0d3gupl063pY6Qnua+TnVVfn?=
 =?us-ascii?Q?Iz/L2E0qmH10IjyAD1/LrfTpxhbjEclfdVMzpNUwMzqNwd6z1z0wyD1wEaG3?=
 =?us-ascii?Q?oLba4CHpdlQeW9m1cEkk7MEXTZJS1EIf2aYikRiDM3sTQy44VKKn3ixoInBt?=
 =?us-ascii?Q?jYvpaOXDlIufwNOMYdHZG4vUxpCJqli5eVRJMhdW3E22kbej9fUoZ+KLjtns?=
 =?us-ascii?Q?QHP6zauHiYUWvrCGkE/rSDzuCNnyy00z+fThfH/XhlmEwoDs62koUQQvmyLC?=
 =?us-ascii?Q?j6iCFdAeWJhm6ESIyQSbTSWQ6B13EnzEnkvsbNgo9ron6b8R8zEmGxYVYtpJ?=
 =?us-ascii?Q?t8DHoZSm3tURVOJ/GDYCXejs4T/UlTJQzYmvOLKkEld4l0BHfj0aiHelyDG1?=
 =?us-ascii?Q?Xz3ivOQF7jS01uQTT9C4O7wBmPC71I0EOoSK/dEZgkLCOKo6rdeVhdZPyosI?=
 =?us-ascii?Q?XW2TXSL7+QTiInvm5egB1yzL65NSuekek36kQeXNAbBY2A8HWxtJQoYWiO7v?=
 =?us-ascii?Q?/eXRi2E7h7XPE7CuiA0KHnwebC4Y7OiFg0e1JJ1zLU2/1BhtW2fS41knzM2+?=
 =?us-ascii?Q?jIyiMi5TIrGKUhzwLOOy+nToUpmpd4fH0A4gqA2KnKnaoPjdfNQzTwILrAMB?=
 =?us-ascii?Q?yBq0y112QTyrwmE7Mycwc8aiRI5XIyXTBMqL7BCeC57Gr+c2j8dsojr6orEs?=
 =?us-ascii?Q?a0P5tWS283QrmSyMxy58XzUeGr414jwdZiSrxxDL5Fa/7Jc+uZEZoaoOVZUv?=
 =?us-ascii?Q?CQ3pgmYveOPim7E4svG3VQNEZsq92Xt8d03hHwFVP1mtwna6R6GvwTOM10i3?=
 =?us-ascii?Q?Yt0qb7ksYc+bVvPAsbmQR/35awFhsr8N0pkAVxvaBlwTDxk19KCym5l7lCKh?=
 =?us-ascii?Q?iv8cJ7AX8VLWMkp9iV/2aeYDrrMpiElbzrN/VRvW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6987bb08-24fd-4219-9705-08dc3e7a8551
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:45:12.4927
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M9NBlHHcxqS2KpfLDr4SXPcmMgxJyM3etlZqx4ex/Ff0rS6fCd8MahDq1jaBEkN2+787q6i244fawwiFVIGBEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9464
Message-ID-Hash: QZRRCJTK53GOUJ2KGYCZ3OUD7JCDO4RG
X-Message-ID-Hash: QZRRCJTK53GOUJ2KGYCZ3OUD7JCDO4RG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QZRRCJTK53GOUJ2KGYCZ3OUD7JCDO4RG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Machine driver uses rpmsg channel name to link this platform component.
However if the component is re-registerd card will not find this new
created component in snd_soc_try_rebind_card().

Explicitly register this component with rpmsg channel name so that
card can always find this component.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index fb9244c1e9c5..2b9e4bb5e0f7 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -732,9 +732,6 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	/* platform component name is used by machine driver to link with */
-	component->name = info->rpdev->id.name;
-
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
@@ -822,9 +819,17 @@ static const struct dev_pm_ops imx_rpmsg_pcm_pm_ops = {
 				imx_rpmsg_pcm_resume)
 };
 
+static const struct platform_device_id imx_rpmsg_pcm_id_table[] = {
+	{ .name	= "rpmsg-audio-channel" },
+	{ .name	= "rpmsg-micfil-channel" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
+
 static struct platform_driver imx_pcm_rpmsg_driver = {
 	.probe  = imx_rpmsg_pcm_probe,
 	.remove_new = imx_rpmsg_pcm_remove,
+	.id_table = imx_rpmsg_pcm_id_table,
 	.driver = {
 		.name = IMX_PCM_DRV_NAME,
 		.pm = &imx_rpmsg_pcm_pm_ops,
-- 
2.43.0

