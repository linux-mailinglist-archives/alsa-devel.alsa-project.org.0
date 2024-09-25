Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4149869A6
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:39:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BAFBE64;
	Thu, 26 Sep 2024 01:39:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BAFBE64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307567;
	bh=HZ2bqo3ksv8T6EmUIGCC37GT84zN4xE4rRT2errJIqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ffDUN4pr5aNq5SiP5RWb9ttY1ep/pwixhKM90K2QiN2GrX14ueCP6dxj+QLbUVZBv
	 tEu+QSWFE+4peQVK9xILW0VBS9xBij6Q0ttcIgFa5idTvYxwhlgCdI+ZBWossKF1A2
	 K7NzX2/6Q7RqgvOl5HyO8862tC8v5GJXY3nikeIM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2148DF8060F; Thu, 26 Sep 2024 01:38:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A608F80602;
	Thu, 26 Sep 2024 01:38:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72CF6F805C1; Thu, 26 Sep 2024 01:38:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FB03F8010B
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FB03F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=OXbXmOOe
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed+/E1R7zjgiMCOaZ6TuKdr+NyKrZ7RFDIXMcJIOa/YEGdqwp/IwWQqm+6+Sq0zxk4Z3bjjhvhJEI9uaHU9gL+d1RWDvubwsUnIAMvFGPQzyLAC5L0LDqwxxRQDWGYQvk/jDwx1HbzcX+wq+FxoKUJ96/5GUq9OiEVhlEwP6FJN2F6SefcLsOIkW/H0tduovOpffPadyuLPiUxl+OdfNg0lGKEV5+fnrT69HI8xpniuXdEUOxewWmUHnRhEptctmHB9hGaKzfDYVbsxcmrsQLuuR4qj1dWeOWCtfTHSjXum+Uam8ogITHBAQMysmPZDXRkGY0c/oJQfLhNiquLafxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rI6P1L8Jm1/UeJH/CANI3T0jC80jDYfZjGdDvVOhVLs=;
 b=K6JDoo7GilfKm6EgbY/neRnqeIvgjxYNQSdu4EHMTLPH49RDmlYFUaxMLZdsYf6gTf5QRasMfUm+7U3Q+NeOUA7VE2R3spau1KWDRYOt8+VEVhV2V8K2DE3ARUHdr5gsyc9LlfuTc5ZPOnESReh/OEuAVB+D/Uq0yqDlU9IjQTwPQyKl0ss4gdvMSjKXDXrC3SD/9Kevlk4OqKYWiXuiyBC8KETr9Iy+ZD8R6AL9f8fXIES+81ezdZipva5K5qUWP8W5OpVCvPgbxlt5wkKU3DSI7gdWWMgQ6NwSxEBOSht8CYZ8kKGnfzmPiOxVvYiN72wtHWFudtd0sFsldK8Jsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rI6P1L8Jm1/UeJH/CANI3T0jC80jDYfZjGdDvVOhVLs=;
 b=OXbXmOOet1DpuMDsD7LcSFtGm+YJCRU+dbkPdzMSvtlCFDA9eJGPa8S2T2QCs1bPnWuvmqB1+gsSF+Pa4ikV1E6F6WxAn8N4SUvFwjQwZQdGH2ksfvnn7ZmPNSUFPFF9r4DMyNNvhfe6aRbeFZv5+frwCd017ELYSS7XrJEmOjQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:05 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:05 +0000
Message-ID: <87msjv9ugm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 03/13] ASoC: sof: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:36:41 +0000
X-ClientProxiedBy: TYWP286CA0009.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: d7a5513c-08bf-4669-1d5c-08dcddbae8c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eii9VMyUaL9vm/A/22kVr11nWFkcI1apaTacmSbuQq8JsyPV+kesEG5Fpbuy?=
 =?us-ascii?Q?uNDYDYcTgTCZfL5FFOmR2E2n1ypZIHC/l7C3m8AKgOPqn3a5zB5Kp9W94AdZ?=
 =?us-ascii?Q?00vOKnFvzE/sj6Hpt/Rvh0Zsp7VQa+ouU3GYajFLhb9KdySmlBAUNb2V851x?=
 =?us-ascii?Q?MoCZtFZGXWC+QK6nqOQBKSKlOrUA9pfmd970jq8JHgqr1cBT7lV5sdPH31+P?=
 =?us-ascii?Q?t0fb2Zn1GPqfEA5sjkRBP/wX3Gr7ue0kwhMH6pAvTSwOfk7nnvOHHTX2E958?=
 =?us-ascii?Q?FIw7tCUKtb4RWnRuF7MkkQ1Nkf3n71xmztxuXHGIh3iPAjtrwhEHbkPf4Fu6?=
 =?us-ascii?Q?zQHdj152wdAQN/xDudgUNNv0sNzZArpoAs4e4GFbupyMAjbhyqz/mPSglD8+?=
 =?us-ascii?Q?N3WSaQrdwENF7q+uE2uhrv82aERtuX78TWKITOXOPPEIGLIv0E/xG0uvmpH9?=
 =?us-ascii?Q?HPO4P640c12kYExUS1TJfRZlOkCcvLXqELI/KhueRnsdOCRDPZN33OZkA96k?=
 =?us-ascii?Q?WViTJ/jLtkN2kyjSKWD4Pyeed7Q3lFQ+9/g6eliUte1kBBbK8xcINB6l/E6X?=
 =?us-ascii?Q?SFO3aWjwqPV9fbo5+cL5t2cz0+tu8UZYZB4nEFUGTHmSDYs4JpOLHvUAWp6t?=
 =?us-ascii?Q?j325x0fs89KKG/0UCJcAg8YcnI9+5rAR+A7LdXIEM/aIgmeE96dF/WXXaxy6?=
 =?us-ascii?Q?r1AXrs+Iw2+3toIsRM5exBYz1Sqhh7gmZ99OYgeOY1enPWLrJ8aXsX+VAlMm?=
 =?us-ascii?Q?go4UrM9GSq7wC02Uk8dWpkU1LXFSZmDcKdf7WPLoLlOmtOYLaUA9cF4hTacS?=
 =?us-ascii?Q?vtF209P7P1AaDvlOp16NtiWp5Q7fB4+DS0drqiY1HWozz1uz5E10I/gTf87/?=
 =?us-ascii?Q?m8uO4TvFOblqrJ83XMnCFOn0dUAqX9W6d2ljX0+SaFJn9his2nqB9/lcSRyy?=
 =?us-ascii?Q?Cmq/impCE6ci9+lUWaO6H7tIeuRBdkZFkotvGksYIkVinPtn4gVn1IIgjzag?=
 =?us-ascii?Q?Drb6dj5lYhlU1CJ0aoxaz57hQAv+rAq/IfN7KF1L+XKaDoDf+gLVsH6njv4T?=
 =?us-ascii?Q?v8uGaccY0xApinHr6hRQvUkEqEZAPoW6EkpzSxO2zWnB/OAcD5NitZ9kj5BV?=
 =?us-ascii?Q?GLiFBxyAspGWchotXDmTLaRNoauIY/Lx3sZNxaLoZI7K13IBPmq9BERA3I9n?=
 =?us-ascii?Q?pUwrDlWY088/76nSD55VH2zFxKrWqs7gL7aJDJNahKwHx+dQCKJc/foG5fEX?=
 =?us-ascii?Q?aKJi/3JNU0mNBbN5nFRhuYN/Jn9XispQ8cGgFgmHJ/n4QGTrSkNrS5O7gmqC?=
 =?us-ascii?Q?nQ7BhQsN/ku3fRX3jvxwhh1LfBSVZtODMtiwBzwAdgE2tQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mhEQZpxewQJcR6c6+s8kO0yBfd6VEyaHm+aYQI/D2No6j1T8yrnxFys/qZQw?=
 =?us-ascii?Q?EmxV9gby+zPRDETnOWQmfcxoMlAeEdgpEPejUaVFR1zWG7jXHOP6oD1e3KYY?=
 =?us-ascii?Q?hABV0TbFbwyVLx8P9eTnBJmz1YO2hLRUwtR6uppgpFxE4FOmUDsQP9IFMvpv?=
 =?us-ascii?Q?qciclg48Zy+UL+YFjgeKuwApi02zKgVZnSPsvs3wH0UN0Ry0JowxQm/MSpoU?=
 =?us-ascii?Q?WoEsdQl+fcVt1qOlDODPXQMwLiKtCCxDwlKCr2pyCGp+lEELuDHowkMF8AHY?=
 =?us-ascii?Q?NK+C0hHJyMiAIW0nNIwuFA9e0jp08NyUIIq8+qdkXAvyQqmOChyEYkrTRAeu?=
 =?us-ascii?Q?Z6SSjJYYVi8H9mP5Ue58+vRgDXCIoJP0LWJlAVh+Ab6Q/sLTlSp89v3OJerw?=
 =?us-ascii?Q?YQUh4+qiOXkBAuQAsJaNvlmdcSbRj7CSoDwE/VjA+8BaNtXfx9YYZKpyZpX4?=
 =?us-ascii?Q?Ie8q3gSl2RWxjVjHuHtZZpjVGmbhyXr725/yQfLyJvNrbSvtoBlodxOp2Wmi?=
 =?us-ascii?Q?G0hq2UGok8+IR3wU/rMAL9w1MzwBZnztmgEtpvk+tD/DgD+RYq5KhAgEFzSD?=
 =?us-ascii?Q?6HsumyB+yz0STUKc3fQQ4hbyK5dDvE2+0p68Yfou+JS3EyuXQZyoCqjDzEo/?=
 =?us-ascii?Q?NxENqq/krmWLGwhqdtcn2n/FqoMPY6+suvZujF+LnvDGmYgoOHAQcKFBbj9H?=
 =?us-ascii?Q?8pb1DqV+/dqqk6huQebISH2wEQ49SGDZsxRahvH2OZjOOP+Ab437h/FciMaQ?=
 =?us-ascii?Q?bP4ui/zTJv4iotr+rXBFOMxpdFNrhJ1+GdyYuwaf+Zgn/ot7TMsfB7PjUwlK?=
 =?us-ascii?Q?cIylr1cYQ82msyIn0iaNXwVe8DZTca1FEMymCqVcy1x8HyNrvIXRoe3u7216?=
 =?us-ascii?Q?1rqU4f3D5fGNHACAvVbSRqOvEUFtdmlnVN4ymx5EZGIsHMbhBqphu8U62qJ2?=
 =?us-ascii?Q?vBgENFzqTH1BpugyqdN/TRsS2fsDgHUUlaw2xX/tY1hqvF/5MFoqDOA4N1GQ?=
 =?us-ascii?Q?GTibT+2y4juwntsLSUdDkjS3ODvcspvO/uMLCsCnCR0ugL7s1cz8xFiPrzcW?=
 =?us-ascii?Q?CgqugvCLj0lPmnteJhGCdcUJnK+8Gy8WmLzzmsuTBfLhF7W23em2W7tdxDJT?=
 =?us-ascii?Q?mSjpNyd8abjUd5RPK8AeUr+TFfNM3Bjn1NPIq2oQThb2rZ0uIGR/PmK/Wx0P?=
 =?us-ascii?Q?lj1feYuBW4bqbuu/vKEsQVa/E103gzc1/CJgNeGkSraen6rhHsu5OJKIVTBQ?=
 =?us-ascii?Q?BVMYzLWPtyt+qcBoi7p0yINpwgOaPjNPeuEHf6AKZXQcK57O2eucSKbh9owZ?=
 =?us-ascii?Q?GeO4i3dcgHE22zXHhGtmUPnXVQydWd7R5JeATh11TZErT2RAuRxF/6/FWNJq?=
 =?us-ascii?Q?EqYDy+9mrTltBtwDoMdAowhuTAb17wNUsfenuApi5kBfTxvwztXtGxQQo5mO?=
 =?us-ascii?Q?y/4VOvatILX2oK9PAEvOMPHb2OhJaPfAIRGeRc3b5uoGyiTdr5pCGM+5Xx1R?=
 =?us-ascii?Q?QQ+s/GRU4iAj02BnLPnfgfsYKJEuGsZQyd7SNVd27CkLoR9NGOutUFM61vDJ?=
 =?us-ascii?Q?25TGA0jVeJLxn97BATRMVepqTG5qKLUVOWF8vzSxeDXd6j3ndLEYEIzJDKmv?=
 =?us-ascii?Q?qhHnR9Gkm4HqYRILexoeNEo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7a5513c-08bf-4669-1d5c-08dcddbae8c9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:36:42.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Af9irRMCzarq5JNTvzKHoo0KmfGvFhxZmc067Q1//el7n+ygixDJfYFgkXZZGSZRUorps+E9y8Nhj7SJuhKhU/iQkcMga8Es3T+D69s5uJKhoqBU+Zz4oINubnnXYwei
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: MDED3E7YN42KAHH2BW7KR3BHFY56JR52
X-Message-ID-Hash: MDED3E7YN42KAHH2BW7KR3BHFY56JR52
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MDED3E7YN42KAHH2BW7KR3BHFY56JR52/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b12b3d865ae30..d59cbd3a69964 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.43.0

