Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6096C9472AA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:56:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25E244C64;
	Mon,  5 Aug 2024 02:53:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25E244C64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819209;
	bh=AEYQUOgiS5yuT+dBqJNW/fvf2fI9wTxUFOXKEwt/mzk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QXjfu9eMMJ1+W7EYDwYZia8HJTC5J0/gkoeS7We3WibfnLpF/cdwcL5F7QEel67dF
	 SHUnJVpNSCHA1ZV0wnzeAtLT1UhyZnPq1185eDcqlVEvFQkzarH1CyQV2fyuMF7zSo
	 dWuTxEKhdZkq8MAzLZ3H5+gXyrLtse8FN33cjSas=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B9CDF89A81; Mon,  5 Aug 2024 02:40:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF83DF89A76;
	Mon,  5 Aug 2024 02:40:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF198F899E7; Mon,  5 Aug 2024 02:39:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id AC39CF89716
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC39CF89716
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=UztbJTu4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xrq7aWdyE5CGPTjjte8GgaUvtlXWxwCFCkHxi2ibglleeGVOcR4okhroid7By4DZMZE9GCGBmOCqqsuOGRjnvgQCiGsERtpC6BPn/GS6JFkVJPjAUZ35JowXQWiU/ZpnRI/bdJNxEEOU74cI7A3E1JfFwI79SHsLZJcgOe2aL9B4ZAE2LUCD5M/5Td2jlYklX7nen8w0pzL4K0Hu6hWNsNQUTSuUTXpjKhNVmJeiV7k37HSIbJLroH7eRHGEwhEh9GRvo1fjAds+3Tn7C66RP410F296sLJzpl1XFpamIAmT7/Rjbt9tXU7XwKvHKKsfbHoN8ClJk8J6t2zkPID9ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NXzQS+bnHre3ul5uJipiQYpp/sXDiGAFdpM9yOOK8E=;
 b=EjjLWI0qrq09lwKqs5A2T6h7+Yk1Ao8tUNGgXNXRnSc5wTq39JonSGFDlgS08b4GtYdpCNIkb8BnsCQ5807lsgK4L48c4/r9zvfunV5fTbdrqWNWxo32uu4p8ojg/hP/YrCHRTr8fyU2IO6so/ydS8Nyw9JuhF794dAwXWWe6H5IgJbm6jpaOKiBRQit3UfdfanemmjOsnKmxwEaCz5Bpcm2xvKks0Cw0y1J3WnAQeWF0CRKgsJxNvmydo3oJ6oq1C2kLBUobE/0xAhCOMnYnVrG2a/+vM0ba4znWLpFxdlNkdk1XmoXeHGQPAXmKXnadF1EQzL0kkWXp3/Mi/X+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NXzQS+bnHre3ul5uJipiQYpp/sXDiGAFdpM9yOOK8E=;
 b=UztbJTu4MmIo8CCyr3HwyCjuwwKobyKptVmWo2wph1PWf5pP2l4FRbUnOiHXBWPsnlK/kMmzTEGTV26kDVdB53YDxQc2X30kFdtHwrI2v1KKwDcqH2keXzYbG1Q+N5kqCx1Kj/4RgalHF2+A/Sul348PtAjYcRGxdW8+h3lChmE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:08 +0000
Message-ID: <875xsfztub.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 049/113] ASoC: fsl: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:08 +0000
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 0106e995-1011-4c9b-899c-08dcb4e704a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NUUKWmhMkFK8eOBmS/7Nzm8iqcx5oFDwmc2vSdDCe4/47NlpBpsjKEz4iZg+?=
 =?us-ascii?Q?GpgIObrLpddJeIOnMgytm9bdhL6KSk2X0KSX1sVX4OXWcxpTEeIFyvgZAK4w?=
 =?us-ascii?Q?L4BJD/XiBhO0THZPlNvddr2kZoWG5mq0CBABqXg3ISnaoBxhwBE/hSaaztDQ?=
 =?us-ascii?Q?BiTvWr+18YUm+Wd0yVD9S58Gos91voyQzChVLOvObIM51DgA33sV8t9TPJsY?=
 =?us-ascii?Q?j66SmKxt/iqquC5Xd6N4ujtjJjxasBOkSvdH1rPTMouyF+GvbDKkJtNsiqH8?=
 =?us-ascii?Q?M2XqKclGGv/7s7LilEAiETtyH6F74DnorY5rRjDzzoS8Gtu9JleN67qmt/gX?=
 =?us-ascii?Q?5ne0yyB+jZIMUss8AgMVADvkhtNtLKvEa1Y2wnxyw042vco8EMRalNGBaEH1?=
 =?us-ascii?Q?BttTNWLvjty7hQEsmriyVlg95jnDxENFxync2e90wd9kuDlYLayQKKdm7ksN?=
 =?us-ascii?Q?u2va3rY/zGf1gJbq64Y0Knwol66Gwh0idH0Q1XcDP8NXdXRm6P0gYyrRQcV6?=
 =?us-ascii?Q?viQ9d421yT24YzkraeDEYHoVB9cuQZ7kLPEaat/MWkySAq3yVsrnPi7FzPcq?=
 =?us-ascii?Q?40G2Kp+eD87wu26DjxljSCx57hK9xmMk8aWmg4BwdfR3fWpMtI3zl3tgcOTA?=
 =?us-ascii?Q?IeHUJ6zJRQBNUg2BUUj8sNs4isHq8un0F8fGCa30Y8rLWOq+zAvPHxm69SL3?=
 =?us-ascii?Q?HbHurFdyq1niX92Q+YoMQXTfSFt4m+jXHGyy8GC0AgcemAgV1VqnIgp1Vdo4?=
 =?us-ascii?Q?mhjH+vWu/jwL5ZQE1fBmTi4bpIsDXVa8W9EOD2y9t+3xo55ZBwg4jlIkVgT0?=
 =?us-ascii?Q?hARj1QJqD1BIraaIg/3Kq1kGTwwsq2nSlmYJC/g1bPJPc+IUtVZRFuAAngr0?=
 =?us-ascii?Q?oGh96KD7i0dvfCLhebk9dcyU45YkxboErzj8Rnq6CwBszPA6NJLHY8xIxJ8b?=
 =?us-ascii?Q?XamTFoSW64NCz8s366U8BsPlImyAAHXiJClcQxlI2NyTYi8YYjvpyWnH4OMP?=
 =?us-ascii?Q?c0Y/CYCPRXsEeSQTiTDlA4E/RyVXn5/u+83y8LOoRXJKSQE9QpUmJFOEK0sM?=
 =?us-ascii?Q?inXJBmC3ZYYKDXHhKRu54EwNOHGSeSCa5NaFdh+c/y+XHW1zTrBGxQvCc+Jg?=
 =?us-ascii?Q?3xC8LNUZcy38jEHzQvkPPQCSVVahhRw3aCSlARV4MPd9ez6J+8z3eMQowFJs?=
 =?us-ascii?Q?lOpxwH9atDJ6172IVLYSJm/2ZnvqqGBJeFxG+D4fgxuf3BlNynxf35CBJ5fK?=
 =?us-ascii?Q?+6yiC9P/05JKIgKRqWJtKWgMhYXVUP2UxxJi5+ZECiAU9bxfqSozRPZoxZ8c?=
 =?us-ascii?Q?WS28GSczBqf820trH+YwxICoVrCPGqFVLM6zcw/G7iY3pmOP604Z4hXjzr+b?=
 =?us-ascii?Q?0fPcJqfSWgxZIOVM/sbGuKaUfZxp8rLhTdpTH52ydfafQFlKPg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zvUMPAygg8e/ZVOGgMjlDT1Abj2TCqsPxxhTXJlrGYhENwkifb+rdXykoRe8?=
 =?us-ascii?Q?4BO5MIJ7e1E2CgTZ8pg0EcguYXohO19kZ2XI1mrQH+KU9zSGdSK2CYCwkS0G?=
 =?us-ascii?Q?qwUbYohl2n+R+wQwgwoab3Sb7JmZtzj6IvrSuOpZGSAXM1aV0+lgwK3pa6HC?=
 =?us-ascii?Q?scXwxTk38x/yJMimLi/3S8Pq/m6tHfpnM0lhgr2txVCWqOUFIW3046Madfah?=
 =?us-ascii?Q?jClNAAPPskHegtiUOolNGU7gejfXsh4OzW/IOYqKwtxbmwKgzDWPoLRYfnLB?=
 =?us-ascii?Q?AocJTb+fhCGpx4sJEyUfACDWfpPnIHXp1+ffE6WpMpqGicgkHk9r0WR/8qop?=
 =?us-ascii?Q?WmC4LRBMO7RWS+sKWsZI2BTzVhcppZ0Bl1AbbUMBWHN1d1d4l5yIcMnBKX7x?=
 =?us-ascii?Q?2iqNg/p5OLyc2aB0eKOBCga817QoniGELRENR/6h6VQ2BRV6uRwWxSnVIhC8?=
 =?us-ascii?Q?gQwMT6xabgcEQd7aQWnPnmIPg0/bT/SLr0cHu7HDRDQNdH9bjY34UmIXoL4k?=
 =?us-ascii?Q?UXARIlA5Jp0tztm2acXLp+879+vdFsikPyo2Z4TcX6e2eJM+PrPp2aXm4/ht?=
 =?us-ascii?Q?OUxq5eUnnAsKrOpn/DUxbShD6p6w6qGLgSoiWXmSD/7FZu0yVX7z8MX4kygf?=
 =?us-ascii?Q?WAafUkMrBL5t7GAmTvgTotWT7bUgT6dU3wGk7sBpNrb8zYkb+5kstk5vNhls?=
 =?us-ascii?Q?6nSYs7EswyZkZadZZ8yTYMFpnDe+RAjaJUmgcqe0I3AL+K/JYgBXREXeS+NZ?=
 =?us-ascii?Q?P1j1UGfWi+EW53+ZGzoH9YtBGLXAvgBlSLvPpwIO83PSREqHiIwXTfWCWH9I?=
 =?us-ascii?Q?+WHfRL822mnxemOguuNuXqUktVmRpESeQ1HeUkVrU85kf1+7XXOUoTzNtNqA?=
 =?us-ascii?Q?I2TqQVFPrgPZ7AqEp3iYIvZN3SHW7LUyldbzp7kHG1wx/fpTAzf73rCYRNAo?=
 =?us-ascii?Q?tvtCxjgXf+2UAZVkiSxbSzUqTEvVqdKdinjHW2+ldCBuiNusFSroY1oVEO40?=
 =?us-ascii?Q?yKFHaQhPHclW27+32cp20n4xGpKiDD0JsSiH/N6sNCQ9mXnpTE4Qk9926y3z?=
 =?us-ascii?Q?LVUQYqOizCwBts70KcUG3IZaN75N9Jk4p5IIdNGzAPlC5hv66j65GrP3HGQ+?=
 =?us-ascii?Q?ZBqTsJBoJpuvcoxlW31dMQHmb07pzuUGRqFfnLWAKF9MlL+mEsrW1Kvj80gV?=
 =?us-ascii?Q?rFNwwttOdMnliP2tIMFyks7UzX1RqxJyKwizFNX6/oiXV9/iqc6sccBvt20v?=
 =?us-ascii?Q?beCJJlRy3/ZJwH/WbNiQ/FTOkAaAdw22Nrl56lHxI9zsnmsVZvNWDVvztB9A?=
 =?us-ascii?Q?yXxPI2oqUb8GFUz9UgYhPpzJhsSxOEwiY6KP/KoZ8csfmuuyxTZ/8jBVVcQW?=
 =?us-ascii?Q?4zSrftMonXxt32qSNuXslBpTMSlal4Tq8IAip+32XlTmvMoGTln22MJGoDZZ?=
 =?us-ascii?Q?hrfPn/h/8Ue+NjRrxu/ATtiXPwJ8D0gqnM48VXCfmmHUMOPhkpu/b+hJkXyJ?=
 =?us-ascii?Q?TV/LCKyJAvAUmDffKOGvHuqh0loqP3wo34X4qebkbgkESwSznlE1AFcLyE4Y?=
 =?us-ascii?Q?5e0xBf2tOpM1e/UrhfitQkilZNoAqL5qkYtD/OYdoWBryzMlDHLlbxPDUGUv?=
 =?us-ascii?Q?0DND2vDVaBWi0nP6n+WOfAw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0106e995-1011-4c9b-899c-08dcb4e704a3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:08.8920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FOXmqjkN2OydSOk2wCSh4kUqIHXRC9QCQcPOJsi/Bk/8kjYbftmSQgY2vT5weHR4VVYXiQSXUQbWm5b/6WomXKgeJZofmbCL4HJNOa0E2vMdI3VUBCsH3sTS76rfgn/z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: N4LP6CBLFWR5NQC7DVQY3Q34MGKMKKZA
X-Message-ID-Hash: N4LP6CBLFWR5NQC7DVQY3Q34MGKMKKZA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4LP6CBLFWR5NQC7DVQY3Q34MGKMKKZA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/fsl-asoc-card.c    |  2 +-
 sound/soc/fsl/fsl_asrc.c         |  2 +-
 sound/soc/fsl/fsl_asrc_dma.c     |  8 ++++----
 sound/soc/fsl/fsl_audmix.c       |  2 +-
 sound/soc/fsl/fsl_dma.c          | 10 +++++-----
 sound/soc/fsl/fsl_easrc.c        |  2 +-
 sound/soc/fsl/fsl_esai.c         |  4 ++--
 sound/soc/fsl/fsl_qmc_audio.c    | 10 +++++-----
 sound/soc/fsl/fsl_sai.c          |  8 ++++----
 sound/soc/fsl/fsl_spdif.c        |  8 ++++----
 sound/soc/fsl/fsl_ssi.c          |  6 +++---
 sound/soc/fsl/fsl_xcvr.c         |  8 ++++----
 sound/soc/fsl/imx-audmix.c       |  4 ++--
 sound/soc/fsl/imx-hdmi.c         |  2 +-
 sound/soc/fsl/imx-pcm-fiq.c      |  8 ++++----
 sound/soc/fsl/imx-pcm-rpmsg.c    | 24 ++++++++++++------------
 sound/soc/fsl/lpc3xxx-i2s.c      | 10 +++++-----
 sound/soc/fsl/mpc5200_dma.c      | 10 +++++-----
 sound/soc/fsl/mpc5200_dma.h      |  2 +-
 sound/soc/fsl/mpc5200_psc_ac97.c |  2 +-
 20 files changed, 66 insertions(+), 66 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8ea..29f32bf65c19f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -171,7 +171,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	struct codec_priv *codec_priv;
 	struct snd_soc_dai *codec_dai;
 	struct cpu_priv *cpu_priv = &priv->cpu_priv;
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b793263291dc8..42d08db984e17 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -719,7 +719,7 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
 	config.pair = pair->index;
 	config.channel_num = channels;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		config.input_format   = params_format(params);
 		config.output_format  = asrc->asrc_format;
 		config.input_sample_rate  = rate;
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index f501f47242fb0..abde5badf8383 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -55,7 +55,7 @@ static void fsl_asrc_dma_complete(void *arg)
 static int fsl_asrc_dma_prepare_and_submit(struct snd_pcm_substream *substream,
 					   struct snd_soc_component *component)
 {
-	u8 dir = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? OUT : IN;
+	u8 dir = snd_pcm_is_playback(substream) ? OUT : IN;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	struct device *dev = component->dev;
@@ -131,7 +131,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
 	enum sdma_peripheral_type be_peripheral_type = IMX_DMATYPE_SSI;
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
 	struct snd_dmaengine_dai_dma_data *dma_params_be = NULL;
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -308,7 +308,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	u8 dir = tx ? OUT : IN;
@@ -329,7 +329,7 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 static int fsl_asrc_dma_startup(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_data;
diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index 1671a3037c604..1ee3f8f919695 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -283,7 +283,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 	unsigned long lock_flags;
 
 	/* Capture stream shall not be handled */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		return 0;
 
 	switch (cmd) {
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index c4bc9395dff7d..6754ea7372da0 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -166,7 +166,7 @@ static void fsl_dma_update_pointers(struct fsl_dma_private *dma_private)
 	 * system, we also need to update the ESAD bits.  We also set (keep) the
 	 * snoop bits.  See the comments in fsl_dma_hw_params() about snooping.
 	 */
-	if (dma_private->substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(dma_private->substream)) {
 		link->source_addr = cpu_to_be32(dma_private->dma_buf_next);
 #ifdef CONFIG_PHYS_64BIT
 		link->source_attr = cpu_to_be32(CCSR_DMA_ATR_SNOOP |
@@ -395,7 +395,7 @@ static int fsl_dma_open(struct snd_soc_component *component,
 		dev_err(dev, "can't allocate dma private data\n");
 		return -ENOMEM;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_private->ssi_sxx_phys = dma->ssi_stx_phys;
 	else
 		dma_private->ssi_sxx_phys = dma->ssi_srx_phys;
@@ -473,7 +473,7 @@ static int fsl_dma_open(struct snd_soc_component *component,
 
 	/* For playback, we want the destination address to be held.  For
 	   capture, set the source address to be held. */
-	mr |= (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	mr |= (snd_pcm_is_playback(substream)) ?
 		CCSR_DMA_MR_DAHE : CCSR_DMA_MR_SAHE;
 
 	out_be32(&dma_channel->mr, mr);
@@ -633,7 +633,7 @@ static int fsl_dma_hw_params(struct snd_soc_component *component,
 		 * get more performance by not snooping, and you'll still be
 		 * okay.  You'll need to update fsl_dma_update_pointers() also.
 		 */
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			link->source_addr = cpu_to_be32(temp_addr);
 			link->source_attr = cpu_to_be32(CCSR_DMA_ATR_SNOOP |
 				upper_32_bits(temp_addr));
@@ -683,7 +683,7 @@ static snd_pcm_uframes_t fsl_dma_pointer(struct snd_soc_component *component,
 	 * only have 32-bit DMA addresses.  This function is typically called
 	 * in interrupt context, so we need to optimize it.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		position = in_be32(&dma_channel->sar);
 #ifdef CONFIG_PHYS_64BIT
 		position |= (u64)(in_be32(&dma_channel->satr) &
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 962f309120918..ba577bd9ab477 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1461,7 +1461,7 @@ static int fsl_easrc_hw_params(struct snd_pcm_substream *substream,
 	 * Set the input and output ratio so we can compute
 	 * the resampling ratio in RS_LOW/HIGH
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ctx_priv->in_params.sample_rate = rate;
 		ctx_priv->in_params.sample_format = format;
 		ctx_priv->out_params.sample_rate = easrc->asrc_rate;
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index d0d8a01da9bdd..000abee37d0da 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -537,7 +537,7 @@ static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	u32 width = params_width(params);
 	u32 channels = params_channels(params);
 	u32 pins = DIV_ROUND_UP(channels, esai_priv->slots);
@@ -758,7 +758,7 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned long lock_flags;
 
 	esai_priv->channels[tx] = substream->runtime->channels;
diff --git a/sound/soc/fsl/fsl_qmc_audio.c b/sound/soc/fsl/fsl_qmc_audio.c
index 8668abd352080..bc7eef100c8ad 100644
--- a/sound/soc/fsl/fsl_qmc_audio.c
+++ b/sound/soc/fsl/fsl_qmc_audio.c
@@ -250,7 +250,7 @@ static int qmc_audio_pcm_trigger(struct snd_soc_component *component,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 		bitmap_zero(prtd->chans_pending, 64);
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			for (i = 0; i < prtd->channels; i++)
 				prtd->qmc_dai->chans[i].prtd_tx = prtd;
 
@@ -513,7 +513,7 @@ static int qmc_dai_constraints_interleaved(struct snd_pcm_substream *substream,
 	u64 access;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		hw_rule_channels_by_format = qmc_dai_hw_rule_capture_channels_by_format;
 		hw_rule_format_by_channels = qmc_dai_hw_rule_capture_format_by_channels;
 		frame_bits = qmc_dai->nb_rx_ts * 8;
@@ -566,7 +566,7 @@ static int qmc_dai_constraints_noninterleaved(struct snd_pcm_substream *substrea
 	u64 access;
 	int ret;
 
-	frame_bits = (substream->stream == SNDRV_PCM_STREAM_CAPTURE) ?
+	frame_bits = snd_pcm_is_capture(substream) ?
 			qmc_dai->nb_rx_ts * 8 : qmc_dai->nb_tx_ts * 8;
 	ret = snd_pcm_hw_constraint_single(substream->runtime,
 					   SNDRV_PCM_HW_PARAM_FRAME_BITS,
@@ -637,7 +637,7 @@ static int qmc_dai_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		chan_param.mode = QMC_TRANSPARENT;
 		chan_param.transp.max_rx_buf_size = params_period_bytes(params) / nb_chans_used;
 		for (i = 0; i < nb_chans_used; i++) {
@@ -672,7 +672,7 @@ static int qmc_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		direction = QMC_CHAN_WRITE;
 		nb_chans_used = qmc_dai->nb_chans_used_tx;
 	} else {
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d03b0172b8ad2..c0bc992e22b5f 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -525,7 +525,7 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int ofs = sai->soc_data->reg_offset;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned int channels = params_channels(params);
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	struct fsl_sai_dl_cfg *dl_cfg = sai->dl_cfg;
@@ -721,7 +721,7 @@ static int fsl_sai_hw_free(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned int ofs = sai->soc_data->reg_offset;
 
 	/* Clear xMR to avoid channel swap with mclk_with_tere enabled case */
@@ -783,7 +783,7 @@ static int fsl_sai_trigger(struct snd_pcm_substream *substream, int cmd,
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
 	unsigned int ofs = sai->soc_data->reg_offset;
 
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	int adir = tx ? RX : TX;
 	int dir = tx ? TX : RX;
 	u32 xcsr;
@@ -868,7 +868,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *cpu_dai)
 {
 	struct fsl_sai *sai = snd_soc_dai_get_drvdata(cpu_dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	int ret;
 
 	/*
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index a63121c888e02..d860e54b1f5e6 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -622,7 +622,7 @@ static int fsl_spdif_startup(struct snd_pcm_substream *substream,
 		regmap_update_bits(regmap, REG_SPDIF_SIE, 0xffffff, 0);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		scr = SCR_TXFIFO_AUTOSYNC | SCR_TXFIFO_CTRL_NORMAL |
 			SCR_TXSEL_NORMAL | SCR_USRC_SEL_CHIP |
 			SCR_TXFIFO_FSEL_IF8;
@@ -650,7 +650,7 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 	struct regmap *regmap = spdif_priv->regmap;
 	u32 scr, mask;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		scr = 0;
 		mask = SCR_TXFIFO_AUTOSYNC_MASK | SCR_TXFIFO_CTRL_MASK |
 			SCR_TXSEL_MASK | SCR_USRC_SEL_MASK |
@@ -706,7 +706,7 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 	u32 sample_rate = params_rate(params);
 	int ret = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ret = spdif_reparent_rootclk(spdif_priv, sample_rate);
 		if (ret) {
 			dev_err(&pdev->dev, "%s: reparent root clk failed: %d\n",
@@ -737,7 +737,7 @@ static int fsl_spdif_trigger(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_spdif_priv *spdif_priv = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct regmap *regmap = spdif_priv->regmap;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	u32 intr = SIE_INTR_FOR(tx);
 	u32 dmaen = SCR_DMA_xX_EN(tx);
 
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index 4ca3a16f7ac0d..ad02a9e0154ac 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -680,7 +680,7 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai,
 			    struct snd_pcm_hw_params *hw_params)
 {
-	bool tx2, tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx2, tx = snd_pcm_is_playback(substream);
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(dai);
 	struct regmap *regs = ssi->regs;
 	u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
@@ -805,7 +805,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *hw_params,
 			     struct snd_soc_dai *dai)
 {
-	bool tx2, tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx2, tx = snd_pcm_is_playback(substream);
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(dai);
 	struct fsl_ssi_regvals *vals = ssi->regvals;
 	struct regmap *regs = ssi->regs;
@@ -1109,7 +1109,7 @@ static int fsl_ssi_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index bf9a4e90978ef..f89f778a0d89a 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -437,7 +437,7 @@ static int fsl_xcvr_prepare(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	u32 m_ctl = 0, v_ctl = 0;
 	u32 r = substream->runtime->rate, ch = substream->runtime->channels;
 	u32 fout = 32 * r * ch * 10;
@@ -562,7 +562,7 @@ static int fsl_xcvr_startup(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	int ret = 0;
 
 	if (xcvr->streams & BIT(substream->stream)) {
@@ -614,7 +614,7 @@ static void fsl_xcvr_shutdown(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	u32 mask = 0, val = 0;
 	int ret;
 
@@ -662,7 +662,7 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_xcvr *xcvr = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	int ret;
 
 	switch (cmd) {
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0dea..8e03eadc33888 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -74,7 +74,7 @@ static int imx_audmix_fe_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->card->dev;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned int fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF;
 	u32 channels = params_channels(params);
 	int ret, dir;
@@ -113,7 +113,7 @@ static int imx_audmix_be_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct device *dev = rtd->card->dev;
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	unsigned int fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF;
 	int ret;
 
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index fe47b439a8183..b6ce395f91bbf 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -34,7 +34,7 @@ static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct device *dev = card->dev;
diff --git a/sound/soc/fsl/imx-pcm-fiq.c b/sound/soc/fsl/imx-pcm-fiq.c
index 3391430e42532..9005150012c15 100644
--- a/sound/soc/fsl/imx-pcm-fiq.c
+++ b/sound/soc/fsl/imx-pcm-fiq.c
@@ -53,7 +53,7 @@ static enum hrtimer_restart snd_hrtimer_callback(struct hrtimer *hrt)
 
 	get_fiq_regs(&regs);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		iprtd->offset = regs.ARM_r8 & 0xffff;
 	else
 		iprtd->offset = regs.ARM_r9 & 0xffff;
@@ -93,7 +93,7 @@ static int snd_imx_pcm_prepare(struct snd_soc_component *component,
 	struct pt_regs regs;
 
 	get_fiq_regs(&regs);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regs.ARM_r8 = (iprtd->period * iprtd->periods - 1) << 16;
 	else
 		regs.ARM_r9 = (iprtd->period * iprtd->periods - 1) << 16;
@@ -115,7 +115,7 @@ static int snd_imx_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			atomic_set(&iprtd->playing, 1);
 		else
 			atomic_set(&iprtd->capturing, 1);
@@ -127,7 +127,7 @@ static int snd_imx_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			atomic_set(&iprtd->playing, 0);
 		else
 			atomic_set(&iprtd->capturing, 0);
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b0944a07ab470..3653eed2d5bc9 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -142,7 +142,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_HW_PARAM];
 		msg->s_msg.header.cmd = TX_HW_PARAM;
 	} else {
@@ -195,7 +195,7 @@ static snd_pcm_uframes_t imx_rpmsg_pcm_pointer(struct snd_soc_component *compone
 	unsigned int pos = 0;
 	int buffer_tail = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
 	else
 		msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
@@ -214,7 +214,7 @@ static void imx_rpmsg_timer_callback(struct timer_list *t)
 	struct rpmsg_info *info = stream_timer->info;
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
 		msg->s_msg.header.cmd = TX_PERIOD_DONE;
 	} else {
@@ -237,7 +237,7 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component *component,
 	int ret = 0;
 	int cmd;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_OPEN];
 		msg->s_msg.header.cmd = TX_OPEN;
 
@@ -291,7 +291,7 @@ static int imx_rpmsg_pcm_close(struct snd_soc_component *component,
 	/* Flush work in workqueue to make TX_CLOSE is the last message */
 	flush_workqueue(info->rpmsg_wq);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_CLOSE];
 		msg->s_msg.header.cmd = TX_CLOSE;
 	} else {
@@ -353,7 +353,7 @@ static int imx_rpmsg_prepare_and_submit(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_BUFFER];
 		msg->s_msg.header.cmd = TX_BUFFER;
 	} else {
@@ -382,7 +382,7 @@ static int imx_rpmsg_async_issue_pending(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_START];
 		msg->s_msg.header.cmd = TX_START;
 	} else {
@@ -399,7 +399,7 @@ static int imx_rpmsg_restart(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_RESTART];
 		msg->s_msg.header.cmd = TX_RESTART;
 	} else {
@@ -416,7 +416,7 @@ static int imx_rpmsg_pause(struct snd_soc_component *component,
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);
 	struct rpmsg_msg *msg;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_PAUSE];
 		msg->s_msg.header.cmd = TX_PAUSE;
 	} else {
@@ -434,7 +434,7 @@ static int imx_rpmsg_terminate_all(struct snd_soc_component *component,
 	struct rpmsg_msg *msg;
 	int cmd;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_TERMINATE];
 		msg->s_msg.header.cmd = TX_TERMINATE;
 		/* Clear buffer count*/
@@ -530,7 +530,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 	if (!rpmsg->force_lpa)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
 		msg->s_msg.header.cmd = TX_PERIOD_DONE;
 	} else {
@@ -559,7 +559,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 		info->notify_updated[substream->stream] = true;
 		spin_unlock_irqrestore(&info->lock[substream->stream], flags);
 
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			avail = snd_pcm_playback_hw_avail(runtime);
 		else
 			avail = snd_pcm_capture_hw_avail(runtime);
diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index c65c17dfa1747..536ace6de0088 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -75,7 +75,7 @@ static int lpc3xxx_i2s_startup(struct snd_pcm_substream *substream, struct snd_s
 
 	guard(mutex)(&i2s_info_p->lock);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		flag = I2S_PLAYBACK_FLAG;
 	else
 		flag = I2S_CAPTURE_FLAG;
@@ -107,7 +107,7 @@ static void lpc3xxx_i2s_shutdown(struct snd_pcm_substream *substream, struct snd
 
 	guard(mutex)(&i2s_info_p->lock);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		flag = I2S_PLAYBACK_FLAG;
 		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, 0);
 		regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO, stop_bits, stop_bits);
@@ -197,7 +197,7 @@ static int lpc3xxx_i2s_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(dev, "Channels              : %d\n", params_channels(params));
 	dev_dbg(dev, "Data format           : %s\n", "I2S");
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_write(regs, LPC3XXX_REG_I2S_DMA1,
 			     LPC3XXX_I2S_DMA1_TX_EN | LPC3XXX_I2S_DMA0_TX_DEPTH(4));
 		regmap_write(regs, LPC3XXX_REG_I2S_TX_RATE, (clkx << 8) | clky);
@@ -223,7 +223,7 @@ static int lpc3xxx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO,
 					   LPC3XXX_I2S_STOP, LPC3XXX_I2S_STOP);
 		else
@@ -234,7 +234,7 @@ static int lpc3xxx_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			regmap_update_bits(regs, LPC3XXX_REG_I2S_DAO,
 					   (LPC3XXX_I2S_RESET | LPC3XXX_I2S_STOP), 0);
 		else
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 345f338251ace..07ddc3cd31890 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -137,7 +137,7 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 		 */
 		spin_lock_irqsave(&psc_dma->lock, flags);
 
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream->pstr->stream))
 			bcom_gen_bd_rx_reset(s->bcom_task);
 		else
 			bcom_gen_bd_tx_reset(s->bcom_task);
@@ -160,7 +160,7 @@ static int psc_dma_trigger(struct snd_soc_component *component,
 
 		spin_lock_irqsave(&psc_dma->lock, flags);
 		bcom_disable(s->bcom_task);
-		if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream->pstr->stream))
 			bcom_gen_bd_rx_reset(s->bcom_task);
 		else
 			bcom_gen_bd_tx_reset(s->bcom_task);
@@ -219,7 +219,7 @@ static int psc_dma_open(struct snd_soc_component *component,
 
 	dev_dbg(psc_dma->dev, "psc_dma_open(substream=%p)\n", substream);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		s = &psc_dma->capture;
 	else
 		s = &psc_dma->playback;
@@ -246,7 +246,7 @@ static int psc_dma_close(struct snd_soc_component *component,
 
 	dev_dbg(psc_dma->dev, "psc_dma_close(substream=%p)\n", substream);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		s = &psc_dma->capture;
 	else
 		s = &psc_dma->playback;
@@ -271,7 +271,7 @@ psc_dma_pointer(struct snd_soc_component *component,
 	struct psc_dma_stream *s;
 	dma_addr_t count;
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		s = &psc_dma->capture;
 	else
 		s = &psc_dma->playback;
diff --git a/sound/soc/fsl/mpc5200_dma.h b/sound/soc/fsl/mpc5200_dma.h
index d7ee33b5b9a8d..42460f2b3906d 100644
--- a/sound/soc/fsl/mpc5200_dma.h
+++ b/sound/soc/fsl/mpc5200_dma.h
@@ -77,7 +77,7 @@ struct psc_dma {
 static inline struct psc_dma_stream *
 to_psc_dma_stream(struct snd_pcm_substream *substream, struct psc_dma *psc_dma)
 {
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream->pstr->stream))
 		return &psc_dma->capture;
 	return &psc_dma->playback;
 }
diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 0423cf43c7a02..cb96b0ff74396 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -151,7 +151,7 @@ static int psc_ac97_hw_analog_params(struct snd_pcm_substream *substream,
 
 	/* Determine the set of enable bits to turn on */
 	s->ac97_slot_bits = (params_channels(params) == 1) ? 0x100 : 0x300;
-	if (substream->pstr->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream->pstr->stream))
 		s->ac97_slot_bits <<= 16;
 	return 0;
 }
-- 
2.43.0

