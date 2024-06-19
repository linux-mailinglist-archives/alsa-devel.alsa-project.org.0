Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A700F90E10B
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Jun 2024 03:00:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78A65B65;
	Wed, 19 Jun 2024 03:00:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78A65B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718758841;
	bh=wLEnguiVh5P0JFYMkVszPYGrdn5zCdD+t9NF4SHT6vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r9dBLKb4gyqfCvlyD5qbOQDSi2XwwRql8AWJLwuOy7qx45H2MrLbFBsQVYUuDqRpV
	 1P1O+43+Qs/1rSwDnZOpeEHapVDUtCSJKZJZuOdMGb6Zy/e90cUGm0fTjuEx+XN9H8
	 zUfVc0pkvz8D4y0boCWpGACrtR8XrkEcfwVrfK0I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 399A6F8059F; Wed, 19 Jun 2024 03:00:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E779F80269;
	Wed, 19 Jun 2024 03:00:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4B779F80266; Wed, 19 Jun 2024 03:00:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F2C63F80236
	for <alsa-devel@alsa-project.org>; Wed, 19 Jun 2024 02:59:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2C63F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Vno7FKHa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jS679xV/PiQnckExkP8eD3Rbbniz0LwIA2YPwYkah/VyWDk7z15lGZJniLtAH1OfnS1QuqU3V5j7Mo0WSTdz6EfBSrCcXndYuWg3/QDg1lxvGhFFuCITNv9jjqXRauRcTzifzRdrk2BjZbbzHNQHNLD0GcuOceGLdK+zNVGCh6Pwh5t+sf36Xy8D5j+U+p2EqjbIeNnkk+Z928fVZTZlvgKJ2AH/l3D8wZHoZYvWCrhqhqdOGlK1ssZRIjhmIJWf+UyNLJWayJoF3AuRaDYbOJnh4J638fhuwBCKsxTNzkkGemCIV+1gwKl1dqHnc97StSr4PudaHW334s7Rtpv1wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jfA1alUdyTwIxoaf76Ec4ZPqYpQBgdJpujWTkPKgcZY=;
 b=Pt8rhqAPxkg80NvIscwtJTfcVETXWpw8/6g0TAoDcsWkv4Z7g+4+LqYL0JjLrjGPAAFBmKETIFx1Kycx5RmC7RSzkrrjQfBuQjHvdhqFuqbnRT+75YNKaDpCo/bfDz5o3qo4uQENT/U3qFhUJAXZX6AMRmtqIIkmCYAZQuYvS3+Wxb0TfdiZvTD5Xp6Nl1Rt2GA06G+Ah1bDsReLFgIuupuw2RcGFn/18WrI8NzB9Jyp94XTDTpnHMlWLghgCnhmPniRl0N4QDpHvkdf3/S3UGfCvBD+BPZF6NE8lS1DooLT0xctYPXxfyxcj0v7F27tIqi/WtduwXWGKTaba2h+IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfA1alUdyTwIxoaf76Ec4ZPqYpQBgdJpujWTkPKgcZY=;
 b=Vno7FKHanr+G9v6pxMRmhApZa5g2in0whEFPaBSA4H0zRO+TpGHfOJXRN74csipQHOGeJE+9vXts9Z6sZms8ofQAZu8ATOk5QKeaZ0CsnOu3sDBBRzPe/O0/6yyKJLR3EgjnXCKih9YYs6PY5PJko6tNrX5I5nmUE2PaQrpNOEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB11207.jpnprd01.prod.outlook.com
 (2603:1096:400:3bf::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 00:59:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Wed, 19 Jun 2024
 00:59:37 +0000
Message-ID: <87iky5wxvr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 1/2] ASoC: Add ak4619 codec support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <87jzilwxxd.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzilwxxd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Jun 2024 00:59:36 +0000
X-ClientProxiedBy: TYCP286CA0352.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB11207:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bcaee7f-d99a-419c-db16-08dc8ffb1746
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|52116011|376011|366013|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gY0ihGWRsZG4M3eiLugTZjaUYIsxXiOMSbAXsz3VgaegyoTf9ECifNCzlb3z?=
 =?us-ascii?Q?3H9ydCQd5RXse72/hWMeJGr8p6BGNeL7Lnl3DxkjY0IJQdCRTKUqrSnI6SM1?=
 =?us-ascii?Q?eV04ry2f6hyH9SmiksoRjRWA/KmLeiDPUN8jE6SSbv6Hv/5u3QdLBdpKAoh7?=
 =?us-ascii?Q?YpaTirMI+d8yKTFt+lJYUkBIYd+3KHkcZ+ojxVWM7uVcKT7o9xhyW9Uj7RYA?=
 =?us-ascii?Q?+KcZXSeOlHkmcAaqyAA5xsWP4PDXbvToW1ZU/wsRGUlJuic1pkzWZJGuoQnK?=
 =?us-ascii?Q?5U9uiHOh22UvMK9qq6j68s+9QkDjRQiTLfBOYsERpCCluC/uJOYqTWO+rH0g?=
 =?us-ascii?Q?kMGOCp2RqLjp69G+cpfxSiHZ9G+XFBFg7tj0NrcmELAXs+V7NDi9qM/uyfwx?=
 =?us-ascii?Q?BgJy62/IWGrVAPpLpgpQg0PSq0XPFvzFTvzxYY7/qfS5FYFMYK52GC9iYFFS?=
 =?us-ascii?Q?wtG0UVMgwXSLuGt36L/CgnYYHY+O6TID49VEfD9/fFCGnS4t22WIu8NhMIfy?=
 =?us-ascii?Q?EaZ62cSs4w3nBjPrSvdM7ZguON/2rQ7aGGm2LhDnuTSF2fbJzqK8rPVT7CGj?=
 =?us-ascii?Q?/HxSbc2Zil34hxSYMhY0pRuGtOd3+QbfrhG1kIyPoJBk5tINaMQO/iSwxRmz?=
 =?us-ascii?Q?KlsDINhoy9jamAS6km9Xuz8EOd4snOvrsPaGUplICvI1UxWIAva9oa2N5lYT?=
 =?us-ascii?Q?NlnsJLLZMD3+G5MN0qa1KG5WxJ0F3QwaSE5MYm+nqekjQS2erFXvOkssORyV?=
 =?us-ascii?Q?iOgRZmqOlfC05eTPkl5MbgXLjk+kOWp5MTFLGqL2bWmh++ss7bYpwzaOaIkP?=
 =?us-ascii?Q?lsEzhiWVVl1e2T06b0n86Cc6O5Om3YamT3bkgL5cg0tVJf07uRoTMG5shU5k?=
 =?us-ascii?Q?lMZvX6ycRd6duDK5iASzYXwusVRcwDRYWke5EitDBdu0fyugfCgRK7TsDtQT?=
 =?us-ascii?Q?zekYFhUXCGJRZc8czdiysuZ8qpQrtdvZ76Vm10YpSsldeP3xp9mf4OJ015mQ?=
 =?us-ascii?Q?kQ7pQrLigH+kChcGYczOmQJfyQdAXAPiEH4gbjmUSuHYUIub5/1yZffbX28D?=
 =?us-ascii?Q?6Yw4vDWCVvzLErWUfVBEjlSCf41hZ64wJWwnfGLn76QWDF+q3vSuJNjsNR9U?=
 =?us-ascii?Q?HqFAqztChRaY+t1r8ApUy524dZNSnzIqSJk43FbbgV/7cmvdQCAsduIRs0tp?=
 =?us-ascii?Q?D25i/FoRmdHM/1hFvUZQrGgL6om26H/J2ULIgDSgwu9ovBF8RvV2MrFoZYs/?=
 =?us-ascii?Q?kgqSMUwUyg5NceA4LtFve/Zfk9NzMqTsuWvQZeTsZtnhP32Dw8RM1pHSBFme?=
 =?us-ascii?Q?Cj85eb76LO6Qw6T+Q5l33XHD1rBCXqA2PZy8Cb1am6EohsdhAHxQ+Ob6ykrc?=
 =?us-ascii?Q?f0unsQQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(52116011)(376011)(366013)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YNTBT4Aq4FMRURhJZb6DvrRWhVDXc9yOQzJkLTdWrB4EMhPnVR5xq9nHloxb?=
 =?us-ascii?Q?yGx74Nq30viWDwTsPFFFaC5OtldHFb+tIAvHPLpUjy4x7Fs20kv9NhMI6L+9?=
 =?us-ascii?Q?mGYosi/BRw4OiCPWxkBUKdtdMiC4kgan1NXMUXuIqOnNtDFFA9XIRDpxicZE?=
 =?us-ascii?Q?EHgfi2TBDlwqfDwnga/Htb5zyCje9H+Ki45rRDJxMxM/A/mJg/RI8D/fuwVY?=
 =?us-ascii?Q?XwA4SuveGBsG3TDjS+FEDSIgpwSI7ni/uHzoYIQazamIH5Sh5KXPajU89fUJ?=
 =?us-ascii?Q?MmVmXyTa+asNFVBnZ1Itjsc5lspUwSDmDjexTAo2iJ8NEeJIeRkBNTe+WOQS?=
 =?us-ascii?Q?wcxWKfGOSMJXya7olqurQiKTuIDR/kNHr7tXL6izY0J8Pl/i7gmdffCvqAN/?=
 =?us-ascii?Q?TPvgmIsz16klqIuzo+FaqglTUdgqE6FOl6sc7AEcpFxa7fcs5H6gcN75EzCA?=
 =?us-ascii?Q?Z/xfVWRxfMiBF1NtduVLJKKjWjg+yPSKcU6KGCwaSS0NvtOpGWx4IVmwDsCw?=
 =?us-ascii?Q?xe0X3G83cWHTck6vHDO82y3jFS1E0l7YW84oxz3F2+Mj+c/WpyeBsdPXPRvU?=
 =?us-ascii?Q?BI6d1IoUgMSPjGcI+wVu0qP7tQKj/5NhaCxEuYhkD0rq8IZpeSCLLUJkW5iN?=
 =?us-ascii?Q?Kk1mRUmm19h19fOqTuImpyX2pU7dEwsvVfd+z+7BO9dNDVe+EfnwE8GVj7sE?=
 =?us-ascii?Q?pD/F1wsu/KQ53RetAlcL4YUMKr0Ifj54bp8krpw4KzN4dHT6KI93n+NVCT9X?=
 =?us-ascii?Q?514yVrnOOoY/HnNUbGfgNlHqsqihT3GSlPvndQtgK1OPlYj9fqp8/pMj3IXn?=
 =?us-ascii?Q?vzjRdQ3+Trq9QDKJ4KdDcLljmmBytKQeHdrI1/FZvrkf2rzH/r3vPbtHgOmg?=
 =?us-ascii?Q?FxucBTQCKaswe1JIC/5c21NwX0E7MtdLuRbNezhSqpmWWDLEg7hyCEX4I5UP?=
 =?us-ascii?Q?sm4dsus2FUTr6yn8fa0z3GHySWDeediKknaK8af+WscdnPafv/xLzlR+c8m7?=
 =?us-ascii?Q?8EZKDQegCc86t/qKdwaJJKWz29xpv99OxRKkBAMvBZXA8bJPaaOs8qFlHrvP?=
 =?us-ascii?Q?PP6Dkp8CxXUtoBJtttdkx/u1pcYcgk/1EM8tRor1curtQwKuvVtdtd9ssbIz?=
 =?us-ascii?Q?Yk8/LjHI73q0qMiOQ5stJNlin0rVy6AfJusAT1uQlJ99u37xm5sRofiRM+97?=
 =?us-ascii?Q?1ufFPM50OzftxdxsqkvpvlrSKUQvetpgubaSiIIbzyln2E0mHQ4LjmJXCdXc?=
 =?us-ascii?Q?Hy8p2NSnmRUporHkO8f74h7tPtAGHLl5swWFHnfTMrn1/2c20ezXbfzKwU4X?=
 =?us-ascii?Q?cKpX3cyQ66YPB+gPmEjs0jmJOLyoFfoSa9B++52tNgSYf/I1z2nlCauMPWQY?=
 =?us-ascii?Q?TiBnHfzi6QDXSa5uk/3hsfJphb8eKAnigzrKURzE3ZUjkvNso8CvvySbrSoq?=
 =?us-ascii?Q?sXpv/eOeXVWbgGhmAZ9WmnMMqT4M/XIzucqSh8emDf/duZEZLFoU+M4xvUYv?=
 =?us-ascii?Q?7F4IZ5NfYQOHwz8hrHPG49PMQFT+EztFVLXNg9pK6jkzWRmY6tDmXXdpdiGM?=
 =?us-ascii?Q?6p/Y7Y2U71ywk0HWDOgk/wSQhOn1M8gSV590AatWDB+DLX3IIftBJhD5JHOD?=
 =?us-ascii?Q?Ti3d7KB0iaEsNuRmu9MG810=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0bcaee7f-d99a-419c-db16-08dc8ffb1746
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 00:59:37.1242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hGCVRPWOMdAvYQO5rJ+03J8uW1wL6YHBDGVpRjbHHM1OJmDdPGrGR6CPjsZ9K2Om81oaG0tNNqQ2e0HN7XGRdI6oWcHfY6u+u/xl4KgaKu490t4ldnsvV9WHWNgSg9xZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11207
Message-ID-Hash: 6P4LF4DLH4A7CQTMSO5Q5YYX7D34WHRP
X-Message-ID-Hash: 6P4LF4DLH4A7CQTMSO5Q5YYX7D34WHRP
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6P4LF4DLH4A7CQTMSO5Q5YYX7D34WHRP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Khanh Le <khanh.le.xr@renesas.com>

Add support for the Asahi Kasei AK4619 audio codec.

[Kuninori cleanuped and adjusted to upstream code]

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/Kconfig  |   5 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/ak4619.c | 912 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 919 insertions(+)
 create mode 100644 sound/soc/codecs/ak4619.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7b99556f24d3..910303adef70 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -45,6 +45,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AK4535
 	imply SND_SOC_AK4554
 	imply SND_SOC_AK4613
+	imply SND_SOC_AK4619
 	imply SND_SOC_AK4641
 	imply SND_SOC_AK4642
 	imply SND_SOC_AK4671
@@ -598,6 +599,10 @@ config SND_SOC_AK4613
 	tristate "AKM AK4613 CODEC"
 	depends on I2C
 
+config SND_SOC_AK4619
+        tristate "AKM AK4619 CODEC"
+        depends on I2C
+
 config SND_SOC_AK4641
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ca69f35cc0f7..2db7760d2aac 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -39,6 +39,7 @@ snd-soc-ak4458-y := ak4458.o
 snd-soc-ak4535-y := ak4535.o
 snd-soc-ak4554-y := ak4554.o
 snd-soc-ak4613-y := ak4613.o
+snd-soc-ak4619-y := ak4619.o
 snd-soc-ak4641-y := ak4641.o
 snd-soc-ak4642-y := ak4642.o
 snd-soc-ak4671-y := ak4671.o
@@ -439,6 +440,7 @@ obj-$(CONFIG_SND_SOC_AK4458)	+= snd-soc-ak4458.o
 obj-$(CONFIG_SND_SOC_AK4535)	+= snd-soc-ak4535.o
 obj-$(CONFIG_SND_SOC_AK4554)	+= snd-soc-ak4554.o
 obj-$(CONFIG_SND_SOC_AK4613)	+= snd-soc-ak4613.o
+obj-$(CONFIG_SND_SOC_AK4619)	+= snd-soc-ak4619.o
 obj-$(CONFIG_SND_SOC_AK4641)	+= snd-soc-ak4641.o
 obj-$(CONFIG_SND_SOC_AK4642)	+= snd-soc-ak4642.o
 obj-$(CONFIG_SND_SOC_AK4671)	+= snd-soc-ak4671.o
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
new file mode 100644
index 000000000000..cbe27abe1f50
--- /dev/null
+++ b/sound/soc/codecs/ak4619.c
@@ -0,0 +1,912 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ak4619.c -- Asahi Kasei ALSA SoC Audio driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ * Khanh Le <khanh.le.xr@renesas.com>
+ *
+ * Based on ak4613.c by Kuninori Morimoto
+ * Based on da7213.c by Adam Thomson
+ * Based on ak4641.c by Harald Welte
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+
+/*
+ * Registers
+ */
+
+#define PWR_MGMT	0x00	/* Power Management */
+#define AU_IFF1		0x01	/* Audio I/F Format */
+#define AU_IFF2		0x02	/* Audio I/F Format (Extended) */
+#define SYS_CLK		0x03	/* System Clock Setting */
+#define MIC_AMP1	0x04	/* MIC AMP Gain 1 */
+#define MIC_AMP2	0x05	/* MIC AMP Gain 2 */
+#define LADC1		0x06	/* ADC1 Lch Digital Volume */
+#define RADC1		0x07	/* ADC1 Rch Digital Volume */
+#define LADC2		0x08	/* ADC2 Lch Digital Volume */
+#define RADC2		0x09	/* ADC2 Rch Digital Volume */
+#define ADC_DF		0x0a	/* ADC Digital Filter Setting */
+#define ADC_AI		0x0b	/* ADC Analog Input Setting */
+#define ADC_MHPF	0x0D	/* ADC Mute & HPF Control */
+#define LDAC1		0x0E	/* DAC1 Lch Digital Volume */
+#define RDAC1		0x0F	/* DAC1 Rch Digital Volume */
+#define LDAC2		0x10	/* DAC2 Lch Digital Volume */
+#define RDAC2		0x11	/* DAC2 Rch Digital Volume */
+#define DAC_IS		0x12	/* DAC Input Select Setting */
+#define DAC_DEMP	0x13	/* DAC De-Emphasis Setting */
+#define DAC_MF		0x14	/* DAC Mute & Filter Setting */
+
+/*
+ * Bit fields
+ */
+
+/* Power Management */
+#define PMAD2		BIT(5)
+#define PMAD1		BIT(4)
+#define PMDA2		BIT(2)
+#define PMDA1		BIT(1)
+#define RSTN		BIT(0)
+
+/* Audio_I/F Format */
+#define DCF_STEREO_I2S	(0x0 << 4)
+#define DCF_STEREO_MSB	(0x5 << 4)
+#define DCF_PCM_SF	(0x6 << 4)
+#define DCF_PCM_LF	(0x7 << 4)
+#define DSL_32		(0x3 << 2)
+#define DCF_MASK	(0x7 << 4)
+#define DSL_MASK	(0x3 << 2)
+#define BCKP		BIT(1)
+
+/* Audio_I/F Format (Extended) */
+#define DIDL_24		(0x0 << 2)
+#define DIDL_20		(0x1 << 2)
+#define DIDL_16		(0x2 << 2)
+#define DIDL_32		(0x3 << 2)
+#define DODL_24		(0x0 << 0)
+#define DODL_20		(0x1 << 0)
+#define DODL_16		(0x2 << 0)
+#define DIDL_MASK	(0x3 << 2)
+#define DODL_MASK	(0x3 << 0)
+#define SLOT            BIT(4)
+
+/* System Clock Setting */
+#define FS_MASK		0x7
+
+/* MIC AMP Gain */
+#define MGNL_SHIFT	4
+#define MGNR_SHIFT	0
+#define MGN_MAX		0xB
+
+/* ADC Digital Volume */
+#define VOLAD_SHIFT	0
+#define VOLAD_MAX	0xFF
+
+/* ADC Digital Filter Setting */
+#define AD1SL_SHIFT	0
+#define AD2SL_SHIFT	4
+
+/* Analog Input Select */
+#define AD1LSEL_SHIFT	6
+#define AD1RSEL_SHIFT	4
+#define AD2LSEL_SHIFT	2
+#define AD2RSEL_SHIFT	0
+
+/* ADC Mute & HPF Control */
+#define ATSPAD_SHIFT	7
+#define AD1MUTE_SHIFT	5
+#define AD2MUTE_SHIFT	6
+#define AD1MUTE_MAX	1
+#define AD2MUTE_MAX	1
+#define AD1MUTE_EN	BIT(5)
+#define AD2MUTE_EN	BIT(6)
+#define AD1HPFN_SHIFT	1
+#define AD1HPFN_MAX	1
+#define AD2HPFN_SHIFT	2
+#define AD2HPFN_MAX	1
+
+/* DAC Digital Volume */
+#define VOLDA_SHIFT	0
+#define VOLDA_MAX	0xFF
+
+/* DAC Input Select Setting */
+#define DAC1SEL_SHIFT	0
+#define DAC2SEL_SHIFT	2
+
+/* DAC De-Emphasis Setting */
+#define DEM1_32000	(0x3 << 0)
+#define DEM1_44100	(0x0 << 0)
+#define DEM1_48000	(0x2 << 0)
+#define DEM1_OFF	(0x1 << 0)
+#define DEM2_32000	(0x3 << 2)
+#define DEM2_44100	(0x0 << 2)
+#define DEM2_48000	(0x2 << 2)
+#define DEM2_OFF	(0x1 << 2)
+#define DEM1_MASK	(0x3 << 0)
+#define DEM2_MASK	(0x3 << 2)
+#define DEM1_SHIFT	0
+#define DEM2_SHIFT	2
+
+/* DAC Mute & Filter Setting */
+#define DA1MUTE_SHIFT	4
+#define DA1MUTE_MAX	1
+#define DA2MUTE_SHIFT	5
+#define DA2MUTE_MAX	1
+#define DA1MUTE_EN	BIT(4)
+#define DA2MUTE_EN	BIT(5)
+#define ATSPDA_SHIFT	7
+#define DA1SL_SHIFT	0
+#define DA2SL_SHIFT	2
+
+/* Codec private data */
+struct ak4619_priv {
+	struct regmap *regmap;
+	struct snd_pcm_hw_constraint_list constraint;
+	int deemph_en;
+	unsigned int playback_rate;
+	unsigned int sysclk;
+};
+
+/*
+ * DAC Volume
+ *
+ * max : 0x00 : +12.0 dB
+ *	( 0.5 dB step )
+ * min : 0xFE : -115.0 dB
+ * mute: 0xFF
+ */
+static const DECLARE_TLV_DB_SCALE(dac_tlv, -11550, 50, 1);
+
+/*
+ * MIC Volume
+ *
+ * max : 0x0B : +27.0 dB
+ *	( 3 dB step )
+ * min: 0x00 : -6.0 dB
+ */
+static const DECLARE_TLV_DB_SCALE(mic_tlv, -600, 300, 0);
+
+/*
+ * ADC Volume
+ *
+ * max : 0x00 : +24.0 dB
+ *	( 0.5 dB step )
+ * min : 0xFE : -103.0 dB
+ * mute: 0xFF
+ */
+static const DECLARE_TLV_DB_SCALE(adc_tlv, -10350, 50, 1);
+
+/* ADC & DAC Volume Level Transition Time select */
+static const char * const ak4619_vol_trans_txt[] = {
+	"4/fs", "16/fs"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_vol_trans, ADC_MHPF, ATSPAD_SHIFT, ak4619_vol_trans_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_vol_trans, DAC_MF,   ATSPDA_SHIFT, ak4619_vol_trans_txt);
+
+/* ADC Digital Filter select */
+static const char * const ak4619_adc_digi_fil_txt[] = {
+	"Sharp Roll-Off Filter",
+	"Slow Roll-Off Filter",
+	"Short Delay Sharp Roll-Off Filter",
+	"Short Delay Slow Roll-Off Filter",
+	"Voice Filter"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_1_digi_fil, ADC_DF, AD1SL_SHIFT, ak4619_adc_digi_fil_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_2_digi_fil, ADC_DF, AD2SL_SHIFT, ak4619_adc_digi_fil_txt);
+
+/* DAC De-Emphasis Filter select */
+static const char * const ak4619_dac_de_emp_txt[] = {
+	"44.1kHz", "OFF", "48kHz", "32kHz"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_de_emp, DAC_DEMP, DEM1_SHIFT, ak4619_dac_de_emp_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_de_emp, DAC_DEMP, DEM2_SHIFT, ak4619_dac_de_emp_txt);
+
+/* DAC Digital Filter select */
+static const char * const ak4619_dac_digi_fil_txt[] = {
+	"Sharp Roll-Off Filter",
+	"Slow Roll-Off Filter",
+	"Short Delay Sharp Roll-Off Filter",
+	"Short Delay Slow Roll-Off Filter"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_digi_fil, DAC_MF, DA1SL_SHIFT, ak4619_dac_digi_fil_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_digi_fil, DAC_MF, DA2SL_SHIFT, ak4619_dac_digi_fil_txt);
+
+/*
+ * Control functions
+ */
+
+static void ak4619_set_deemph(struct snd_soc_component *component)
+{
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	u8 dem = 0;
+
+	if (!ak4619->deemph_en)
+		return;
+
+	switch (ak4619->playback_rate) {
+	case 32000:
+		dem |= DEM1_32000 | DEM2_32000;
+		break;
+	case 44100:
+		dem |= DEM1_44100 | DEM2_44100;
+		break;
+	case 48000:
+		dem |= DEM1_48000 | DEM2_48000;
+		break;
+	default:
+		dem |= DEM1_OFF | DEM2_OFF;
+		break;
+	}
+	snd_soc_component_update_bits(component, DAC_DEMP, DEM1_MASK | DEM2_MASK, dem);
+}
+
+static int ak4619_put_deemph(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	int deemph_en = ucontrol->value.integer.value[0];
+	int ret = 0;
+
+	switch (deemph_en) {
+	case 0:
+	case 1:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ak4619->deemph_en != deemph_en)
+		ret = 1; /* The value changed */
+
+	ak4619->deemph_en = deemph_en;
+	ak4619_set_deemph(component);
+
+	return ret;
+}
+
+static int ak4619_get_deemph(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = ak4619->deemph_en;
+
+	return 0;
+};
+
+/*
+ * KControls
+ */
+static const struct snd_kcontrol_new ak4619_snd_controls[] = {
+
+	/* Volume controls */
+	SOC_DOUBLE_R_TLV("DAC 1 Volume", LDAC1, RDAC1, VOLDA_SHIFT, VOLDA_MAX, 1, dac_tlv),
+	SOC_DOUBLE_R_TLV("DAC 2 Volume", LDAC2, RDAC2, VOLDA_SHIFT, VOLDA_MAX, 1, dac_tlv),
+	SOC_DOUBLE_R_TLV("ADC 1 Volume", LADC1, RADC1, VOLAD_SHIFT, VOLAD_MAX, 1, adc_tlv),
+	SOC_DOUBLE_R_TLV("ADC 2 Volume", LADC2, RADC2, VOLAD_SHIFT, VOLAD_MAX, 1, adc_tlv),
+
+	SOC_DOUBLE_TLV("Mic 1 Volume", MIC_AMP1, MGNL_SHIFT, MGNR_SHIFT, MGN_MAX, 0, mic_tlv),
+	SOC_DOUBLE_TLV("Mic 2 Volume", MIC_AMP2, MGNL_SHIFT, MGNR_SHIFT, MGN_MAX, 0, mic_tlv),
+
+	/* Volume Level Transition Time controls */
+	SOC_ENUM("ADC Volume Level Transition Time", ak4619_adc_vol_trans),
+	SOC_ENUM("DAC Volume Level Transition Time", ak4619_dac_vol_trans),
+
+	/* Mute controls */
+	SOC_SINGLE("DAC 1 Switch", DAC_MF, DA1MUTE_SHIFT, DA1MUTE_MAX, 1),
+	SOC_SINGLE("DAC 2 Switch", DAC_MF, DA2MUTE_SHIFT, DA2MUTE_MAX, 1),
+
+	SOC_SINGLE("ADC 1 Switch", ADC_MHPF, AD1MUTE_SHIFT, AD1MUTE_MAX, 1),
+	SOC_SINGLE("ADC 2 Switch", ADC_MHPF, AD2MUTE_SHIFT, AD2MUTE_MAX, 1),
+
+	/* Filter controls */
+	SOC_ENUM("ADC 1 Digital Filter", ak4619_adc_1_digi_fil),
+	SOC_ENUM("ADC 2 Digital Filter", ak4619_adc_2_digi_fil),
+
+	SOC_SINGLE("ADC 1 HPF", ADC_MHPF, AD1HPFN_SHIFT, AD1HPFN_MAX, 1),
+	SOC_SINGLE("ADC 2 HPF", ADC_MHPF, AD2HPFN_SHIFT, AD2HPFN_MAX, 1),
+
+	SOC_ENUM("DAC 1 De-Emphasis Filter", ak4619_dac_1_de_emp),
+	SOC_ENUM("DAC 2 De-Emphasis Filter", ak4619_dac_2_de_emp),
+
+	SOC_ENUM("DAC 1 Digital Filter", ak4619_dac_1_digi_fil),
+	SOC_ENUM("DAC 2 Digital Filter", ak4619_dac_2_digi_fil),
+
+	SOC_SINGLE_BOOL_EXT("Playback De-Emphasis Switch", 0, ak4619_get_deemph, ak4619_put_deemph),
+};
+
+/*
+ * DAPM
+ */
+
+/* Analog input mode */
+static const char * const ak4619_analog_in_txt[] = {
+	"Differential", "Single-Ended1", "Single-Ended2", "Pseudo Differential"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_1_left_in,  ADC_AI, AD1LSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_1_right_in, ADC_AI, AD1RSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_2_left_in,  ADC_AI, AD2LSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_2_right_in, ADC_AI, AD2RSEL_SHIFT, ak4619_analog_in_txt);
+
+static const struct snd_kcontrol_new ak4619_ad_1_left_in_mux =
+	SOC_DAPM_ENUM("Analog Input 1 Left MUX",  ak4619_ad_1_left_in);
+static const struct snd_kcontrol_new ak4619_ad_1_right_in_mux =
+	SOC_DAPM_ENUM("Analog Input 1 Right MUX", ak4619_ad_1_right_in);
+static const struct snd_kcontrol_new ak4619_ad_2_left_in_mux =
+	SOC_DAPM_ENUM("Analog Input 2 Left MUX",  ak4619_ad_2_left_in);
+static const struct snd_kcontrol_new ak4619_ad_2_right_in_mux =
+	SOC_DAPM_ENUM("Analog Input 2 Right MUX", ak4619_ad_2_right_in);
+
+/* DAC source mux */
+static const char * const ak4619_dac_in_txt[] = {
+	"SDIN1", "SDIN2", "SDOUT1", "SDOUT2"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_in, DAC_IS, DAC1SEL_SHIFT, ak4619_dac_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_in, DAC_IS, DAC2SEL_SHIFT, ak4619_dac_in_txt);
+
+static const struct snd_kcontrol_new ak4619_dac_1_in_mux =
+	SOC_DAPM_ENUM("DAC 1 Source MUX", ak4619_dac_1_in);
+static const struct snd_kcontrol_new ak4619_dac_2_in_mux =
+	SOC_DAPM_ENUM("DAC 2 Source MUX", ak4619_dac_2_in);
+
+static const struct snd_soc_dapm_widget ak4619_dapm_widgets[] = {
+
+	/* DACs */
+	SND_SOC_DAPM_DAC("DAC1", NULL, PWR_MGMT, 1, 0),
+	SND_SOC_DAPM_DAC("DAC2", NULL, PWR_MGMT, 2, 0),
+
+	/* ADCs */
+	SND_SOC_DAPM_ADC("ADC1", NULL, PWR_MGMT, 4, 0),
+	SND_SOC_DAPM_ADC("ADC2", NULL, PWR_MGMT, 5, 0),
+
+	/* Outputs */
+	SND_SOC_DAPM_OUTPUT("AOUT1L"),
+	SND_SOC_DAPM_OUTPUT("AOUT2L"),
+
+	SND_SOC_DAPM_OUTPUT("AOUT1R"),
+	SND_SOC_DAPM_OUTPUT("AOUT2R"),
+
+	/* Inputs */
+	SND_SOC_DAPM_INPUT("AIN1L"),
+	SND_SOC_DAPM_INPUT("AIN2L"),
+	SND_SOC_DAPM_INPUT("AIN4L"),
+	SND_SOC_DAPM_INPUT("AIN5L"),
+
+	SND_SOC_DAPM_INPUT("AIN1R"),
+	SND_SOC_DAPM_INPUT("AIN2R"),
+	SND_SOC_DAPM_INPUT("AIN4R"),
+	SND_SOC_DAPM_INPUT("AIN5R"),
+
+	SND_SOC_DAPM_INPUT("MIC1L"),
+	SND_SOC_DAPM_INPUT("MIC1R"),
+	SND_SOC_DAPM_INPUT("MIC2L"),
+	SND_SOC_DAPM_INPUT("MIC2R"),
+
+	/* DAI */
+	SND_SOC_DAPM_AIF_IN("SDIN1",  "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN2",  "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SDOUT1", "Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SDOUT2", "Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	/* MUXs for Mic PGA source selection */
+	SND_SOC_DAPM_MUX("Analog Input 1 Left MUX",  SND_SOC_NOPM, 0, 0, &ak4619_ad_1_left_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 1 Right MUX", SND_SOC_NOPM, 0, 0, &ak4619_ad_1_right_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 2 Left MUX",  SND_SOC_NOPM, 0, 0, &ak4619_ad_2_left_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 2 Right MUX", SND_SOC_NOPM, 0, 0, &ak4619_ad_2_right_in_mux),
+
+	/* MUXs for DAC source selection */
+	SND_SOC_DAPM_MUX("DAC 1 Source MUX", SND_SOC_NOPM, 0, 0, &ak4619_dac_1_in_mux),
+	SND_SOC_DAPM_MUX("DAC 2 Source MUX", SND_SOC_NOPM, 0, 0, &ak4619_dac_2_in_mux),
+};
+
+static const struct snd_soc_dapm_route ak4619_intercon[] = {
+	/* Dest       Connecting Widget    Source */
+
+	/* Output path */
+	{"AOUT1L", NULL, "DAC1"},
+	{"AOUT2L", NULL, "DAC2"},
+
+	{"AOUT1R", NULL, "DAC1"},
+	{"AOUT2R", NULL, "DAC2"},
+
+	{"DAC1", NULL, "DAC 1 Source MUX"},
+	{"DAC2", NULL, "DAC 2 Source MUX"},
+
+	{"DAC 1 Source MUX", "SDIN1",  "SDIN1"},
+	{"DAC 1 Source MUX", "SDIN2",  "SDIN2"},
+	{"DAC 1 Source MUX", "SDOUT1", "SDOUT1"},
+	{"DAC 1 Source MUX", "SDOUT2", "SDOUT2"},
+
+	{"DAC 2 Source MUX", "SDIN1",  "SDIN1"},
+	{"DAC 2 Source MUX", "SDIN2",  "SDIN2"},
+	{"DAC 2 Source MUX", "SDOUT1", "SDOUT1"},
+	{"DAC 2 Source MUX", "SDOUT2", "SDOUT2"},
+
+	/* Input path */
+	{"SDOUT1", NULL, "ADC1"},
+	{"SDOUT2", NULL, "ADC2"},
+
+	{"ADC1", NULL, "Analog Input 1 Left MUX"},
+	{"ADC1", NULL, "Analog Input 1 Right MUX"},
+
+	{"ADC2", NULL, "Analog Input 2 Left MUX"},
+	{"ADC2", NULL, "Analog Input 2 Right MUX"},
+
+	{"Analog Input 1 Left MUX", "Differential",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Single-Ended1",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Single-Ended2",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Pseudo Differential",	"MIC1L"},
+
+	{"Analog Input 1 Right MUX", "Differential",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Single-Ended1",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Single-Ended2",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Pseudo Differential",	"MIC1R"},
+
+	{"Analog Input 2 Left MUX", "Differential",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Single-Ended1",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Single-Ended2",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Pseudo Differential",	"MIC2L"},
+
+	{"Analog Input 2 Right MUX", "Differential",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Single-Ended1",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Single-Ended2",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Pseudo Differential",	"MIC2R"},
+
+	{"MIC1L", NULL, "AIN1L"},
+	{"MIC1L", NULL, "AIN2L"},
+
+	{"MIC1R", NULL, "AIN1R"},
+	{"MIC1R", NULL, "AIN2R"},
+
+	{"MIC2L", NULL, "AIN4L"},
+	{"MIC2L", NULL, "AIN5L"},
+
+	{"MIC2R", NULL, "AIN4R"},
+	{"MIC2R", NULL, "AIN5R"},
+};
+
+static const struct reg_default ak4619_reg_defaults[] = {
+	{ PWR_MGMT,	0x00 },
+	{ AU_IFF1,	0x0C },
+	{ AU_IFF2,	0x0C },
+	{ SYS_CLK,	0x00 },
+	{ MIC_AMP1,	0x22 },
+	{ MIC_AMP2,	0x22 },
+	{ LADC1,	0x30 },
+	{ RADC1,	0x30 },
+	{ LADC2,	0x30 },
+	{ RADC2,	0x30 },
+	{ ADC_DF,	0x00 },
+	{ ADC_AI,	0x00 },
+	{ ADC_MHPF,	0x00 },
+	{ LDAC1,	0x18 },
+	{ RDAC1,	0x18 },
+	{ LDAC2,	0x18 },
+	{ RDAC2,	0x18 },
+	{ DAC_IS,	0x04 },
+	{ DAC_DEMP,	0x05 },
+	{ DAC_MF,	0x0A },
+};
+
+static int ak4619_set_bias_level(struct snd_soc_component *component,
+				 enum snd_soc_bias_level level)
+{
+	u8 pwr_ctrl = 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		pwr_ctrl |= RSTN;
+		fallthrough;
+	case SND_SOC_BIAS_PREPARE:
+		pwr_ctrl |= PMAD1 | PMAD2 | PMDA1 | PMDA2;
+		fallthrough;
+	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_OFF:
+	default:
+		break;
+	}
+
+	snd_soc_component_write(component, PWR_MGMT, pwr_ctrl);
+
+	return 0;
+}
+
+static int ak4619_dai_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	unsigned int width;
+	unsigned int rate;
+	unsigned int fs;
+	bool is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u8 dai_ctrl = 0;
+	u8 clk_mode = 0;
+
+	width = params_width(params);
+	switch (width) {
+	case 16:
+		dai_ctrl |= is_play ? DIDL_16 : DODL_16;
+		break;
+	case 20:
+		dai_ctrl |= is_play ? DIDL_20 : DODL_20;
+		break;
+	case 24:
+		dai_ctrl |= is_play ? DIDL_24 : DODL_24;
+		break;
+	case 32:
+		if (is_play)
+			dai_ctrl |= DIDL_32;
+		else
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rate = params_rate(params);
+	if (rate)
+		fs = ak4619->sysclk / rate;
+	else
+		return -EINVAL;
+
+	switch (rate) {
+	case  8000:
+	case 11025:
+	case 12000:
+	case 16000:
+	case 22050:
+	case 24000:
+	case 32000:
+	case 44100:
+	case 48000:
+		switch (fs) {
+		case 256:
+			clk_mode |= (0x0 << 0);
+			break;
+		case 384:
+			clk_mode |= (0x2 << 0);
+			break;
+		case 512:
+			clk_mode |= (0x3 << 0);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case 64000:
+	case 88200:
+	case 96000:
+		if (fs == 256)
+			clk_mode |= (0x1 << 0);
+		else
+			return -EINVAL;
+		break;
+	case 176400:
+	case 192000:
+		if (fs == 128)
+			clk_mode |= (0x4 << 0);
+		else
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, SYS_CLK, FS_MASK, clk_mode);
+	snd_soc_component_update_bits(component, AU_IFF2,
+				      is_play ? DIDL_MASK : DODL_MASK, dai_ctrl);
+
+	if (is_play) {
+		ak4619->playback_rate = rate;
+		ak4619_set_deemph(component);
+	}
+
+	return 0;
+}
+
+static int ak4619_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	u8 dai_fmt1 = 0;
+	u8 dai_fmt2 = 0;
+
+	/* Set clock normal/inverted */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		dai_fmt1 |= BCKP;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+	case SND_SOC_DAIFMT_IB_IF:
+	default:
+		return -EINVAL;
+	}
+
+	/* Only Stereo modes are supported */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		dai_fmt1 |= DCF_STEREO_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		dai_fmt1 |= DCF_STEREO_MSB;
+		break;
+	case SND_SOC_DAIFMT_DSP_A: /* L data MSB after FRM LRC */
+		dai_fmt1 |= DCF_PCM_SF;
+		dai_fmt2 |= SLOT;
+		break;
+	case SND_SOC_DAIFMT_DSP_B: /* L data MSB during FRM LRC */
+		dai_fmt1 |= DCF_PCM_LF;
+		dai_fmt2 |= SLOT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Only slave mode is support */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* By default only 64 BICK per LRCLK is supported */
+	dai_fmt1 |= DSL_32;
+
+	snd_soc_component_update_bits(component, AU_IFF1, DCF_MASK |
+					DSL_MASK | BCKP, dai_fmt1);
+	snd_soc_component_update_bits(component, AU_IFF2, SLOT, dai_fmt2);
+
+	return 0;
+}
+
+static int ak4619_dai_set_sysclk(struct snd_soc_dai *codec_dai,
+				 int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ak4619->sysclk = freq;
+
+	return 0;
+}
+
+static int ak4619_dai_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *component = dai->component;
+
+	snd_soc_component_update_bits(component, DAC_MF, DA1MUTE_EN, mute ? DA1MUTE_EN : 0);
+	snd_soc_component_update_bits(component, DAC_MF, DA2MUTE_EN, mute ? DA2MUTE_EN : 0);
+
+	return 0;
+}
+
+static void ak4619_hw_constraints(struct ak4619_priv *ak4619,
+				  struct snd_pcm_runtime *runtime)
+{
+	struct snd_pcm_hw_constraint_list *constraint = &ak4619->constraint;
+	int ak4619_rate_mask = 0;
+	unsigned int fs;
+	int i;
+	static const unsigned int ak4619_sr[] = {
+		  8000,
+		 11025,
+		 12000,
+		 16000,
+		 22050,
+		 24000,
+		 32000,
+		 44100,
+		 48000,
+		 64000,
+		 88200,
+		 96000,
+		176400,
+		192000,
+	};
+
+	/*
+	 *	[8kHz - 48kHz]		: 256fs, 384fs or 512fs
+	 *	[64kHz - 96kHz]		: 256fs
+	 *	[176.4kHz, 192kHz]	: 128fs
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(ak4619_sr); i++) {
+		fs = ak4619->sysclk / ak4619_sr[i];
+
+		switch (fs) {
+		case 512:
+		case 384:
+		case 256:
+			ak4619_rate_mask |= (1 << i);
+			break;
+		case 128:
+			switch (i) {
+			case (ARRAY_SIZE(ak4619_sr) - 1):
+			case (ARRAY_SIZE(ak4619_sr) - 2):
+				ak4619_rate_mask |= (1 << i);
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			break;
+		}
+	};
+
+	constraint->list	= ak4619_sr;
+	constraint->mask	= ak4619_rate_mask;
+	constraint->count	= ARRAY_SIZE(ak4619_sr);
+
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, constraint);
+};
+
+#define PLAYBACK_MODE	0
+#define CAPTURE_MODE	1
+
+static int ak4619_dai_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ak4619_hw_constraints(ak4619, substream->runtime);
+
+	return 0;
+}
+
+static u64 ak4619_dai_formats[] = {
+	/*
+	 * Select below from Sound Card, not here
+	 *	SND_SOC_DAIFMT_CBC_CFC
+	 *	SND_SOC_DAIFMT_CBP_CFP
+	 */
+
+	/* First Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
+
+	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+};
+
+static const struct snd_soc_dai_ops ak4619_dai_ops = {
+	.startup			= ak4619_dai_startup,
+	.set_sysclk			= ak4619_dai_set_sysclk,
+	.set_fmt			= ak4619_dai_set_fmt,
+	.hw_params			= ak4619_dai_hw_params,
+	.mute_stream			= ak4619_dai_mute,
+	.auto_selectable_formats	= ak4619_dai_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(ak4619_dai_formats),
+};
+
+static const struct snd_soc_component_driver soc_component_dev_ak4619 = {
+	.set_bias_level		= ak4619_set_bias_level,
+	.controls		= ak4619_snd_controls,
+	.num_controls		= ARRAY_SIZE(ak4619_snd_controls),
+	.dapm_widgets		= ak4619_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(ak4619_dapm_widgets),
+	.dapm_routes		= ak4619_intercon,
+	.num_dapm_routes	= ARRAY_SIZE(ak4619_intercon),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+static const struct regmap_config ak4619_regmap_cfg = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= 0x14,
+	.reg_defaults		= ak4619_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(ak4619_reg_defaults),
+	.cache_type		= REGCACHE_MAPLE,
+};
+
+static const struct of_device_id ak4619_of_match[] = {
+	{ .compatible = "asahi-kasei,ak4619",	.data = &ak4619_regmap_cfg },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ak4619_of_match);
+
+static const struct i2c_device_id ak4619_i2c_id[] = {
+	{ "ak4619", (kernel_ulong_t)&ak4619_regmap_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ak4619_i2c_id);
+
+#define AK4619_RATES	SNDRV_PCM_RATE_8000_192000
+
+#define AK4619_DAC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S20_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE |\
+				 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define AK4619_ADC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S20_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE)
+
+static struct snd_soc_dai_driver ak4619_dai = {
+	.name = "ak4619-hifi",
+	.playback = {
+		.stream_name	= "Playback",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= AK4619_RATES,
+		.formats	= AK4619_DAC_FORMATS,
+	},
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= AK4619_RATES,
+		.formats	= AK4619_ADC_FORMATS,
+	},
+	.ops			= &ak4619_dai_ops,
+	.symmetric_rate		= 1,
+};
+
+static int ak4619_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct ak4619_priv *ak4619;
+	int ret;
+
+	ak4619 = devm_kzalloc(dev, sizeof(*ak4619), GFP_KERNEL);
+	if (!ak4619)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, ak4619);
+
+	ak4619->regmap = devm_regmap_init_i2c(i2c, &ak4619_regmap_cfg);
+	if (IS_ERR(ak4619->regmap)) {
+		ret = PTR_ERR(ak4619->regmap);
+		dev_err(dev, "regmap_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(dev, &soc_component_dev_ak4619,
+				      &ak4619_dai, 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register ak4619 component: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct i2c_driver ak4619_i2c_driver = {
+	.driver = {
+		.name = "ak4619-codec",
+		.of_match_table = ak4619_of_match,
+	},
+	.probe		= ak4619_i2c_probe,
+	.id_table	= ak4619_i2c_id,
+};
+module_i2c_driver(ak4619_i2c_driver);
+
+MODULE_DESCRIPTION("SoC AK4619 driver");
+MODULE_AUTHOR("Khanh Le <khanh.le.xr@renesas.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.43.0

