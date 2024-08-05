Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCE9472B3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:57:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859FD5239;
	Mon,  5 Aug 2024 02:54:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859FD5239
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819278;
	bh=8kSWrJH9g+DEF4SgSHltqiTQ27G3P+Pe/lIHu44ik14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gTYiIYgd1pqF0b0Y7+5W3armMCrXOAn/F1hPBteJMJepW8D5Cidb2QNLKGpLNApBJ
	 fYLOfmB3PgeE0R9dmSPLaJ2JC9AQC9UXdllAKWZ/dEXGMibd06o7FsDMfJxpVKbzZB
	 n26oDhW/kq2ss8KB0089fM5Cib10i8tyjXe/JFmE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E337F89B15; Mon,  5 Aug 2024 02:40:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0E41F89AEB;
	Mon,  5 Aug 2024 02:40:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30A92F89A86; Mon,  5 Aug 2024 02:40:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F37BBF89A45
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F37BBF89A45
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=caKFOYEj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzihHn9CoA8nBYK7J6K1ExRJ+49PXpNvUl7Ews2T5Y0XyJbsVVkbg68QEGcBSIvvqyFdMR5WfQEZ+sATTNHR1eTYlhyFZYopq/nIv5INBV58w5PHcMOlgkim1oLHla04LNFg+JHrcYkiXaS3/ycy1NPAzOQQd9OZiX5njFi4eWgOKGWV8DQntnKuoSvIEEcCwK9oSJngpWuzO5UC1u/OB3z+ERpY7Vvj62OGFJzkuD204tLxwpnsxWqJt6kI32oHKwhfyCPBTH2qNcqLjYCNGocODo6GdPbBdWlx8y5xnHHj7zLDWWVUnLUENYAwwqVfZDMK8A5mEK4+hmSBLtp4lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SiyklXxnwCuOFLk8+hLoD2v6lvVgqnyvDraGVcT1JCs=;
 b=U6yaAp7UABlXXk4W+KKfxvSGUU+UR7xeJhEDXg7oTSM1u0TlKDpJ8F/WJpVOUJINF3yzp6AU0qqjdFFGlntTO0V6uzHBojdqFtcPB2TpO8ECuALtyJo1TjaTBvelBmjfzrII/Hbe30cDiiQMrjr5bY+KhszaDpQvbf/MlLIKE3EBjIH5sGRNRh5amV5aADREhdhy9xzt1u567YWlhZcP5KzCv4VfTw7VeD5i+5mmS6kAa+EuVU9MJ75OTJ0wWlPuHqP+gjr/O6U4HeO2eOtK/VFb6CJgE+ACwJhFnrfXRU87xIrjAwN+qBKWHg8Ep4t53ynQN4rsC3goiX8e3gSBAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SiyklXxnwCuOFLk8+hLoD2v6lvVgqnyvDraGVcT1JCs=;
 b=caKFOYEjfKjksY+itmlXZq73JhMaTfzYNhenx2uQTffDkb3JsYPPeuIrS4sAN2k3CG5n9Nv76SiSrYN5fL/WdSky0RaLz2eAmqrbYkDTTwhJakbc1/haN6ibQVUG8BDSFAdNup4U6WxMmLs26NUcY2Y81Tcf9chpa+jvKmtvMos=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:08 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:08 +0000
Message-ID: <87o767yf87.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 061/113] ASoC: intel: avs: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:08 +0000
X-ClientProxiedBy: TYAPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bcacd8-a320-432e-c5f4-08dcb4e72820
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4AWmwySw9KvSjuYHRzWb790mi/PwbSEokXXePSw4eAFoVP6eRMu9BGAsHMBN?=
 =?us-ascii?Q?/qxt2hbSnToX6yAAtGlDIN65S1Wu/46oOOM9mzZijXMgL9MSggNHrtoblPZ4?=
 =?us-ascii?Q?mTPhfHcxzRC1K90G0SF2aQ9XFj2aj5C1dg0ZaKoxMfSi2AvbvsFucUy9pB+L?=
 =?us-ascii?Q?4OydEHI5lFuscpXZyqBbsMxrYjlIBL/fNQ1pm3aWepeWXtvYn2to4tMuqRcv?=
 =?us-ascii?Q?GtqaOyGs0NcL66hkmRyXZjFVlGCCrg27HyMfgVLLbT6iiRzWM2bmJ5jF231h?=
 =?us-ascii?Q?w3w4nV8oJf6QIfvkT4+BMwYPdJhx0WA8f8q50up+YCob9VdNRVgGpGMLIY70?=
 =?us-ascii?Q?/Lor7OFuPIRZtNVtIK+GD15DbEF8yoQ8kiavxpEdLUxlbsPeqP7m01xP3tje?=
 =?us-ascii?Q?hizFOqQgZ6LpS5cnKwbiO0Ir0ZHmal7CB1fig45azU5lskFNKzRB/oL8zjgz?=
 =?us-ascii?Q?x3lFSQjAXCrW1Sx/X152LLZ7QSuDbBy0XUUWbaEKJQL1I4c/l8s7PbU42iH0?=
 =?us-ascii?Q?CzoR+MDC81W1Et5x+jUv4w18Q1WNZ6QRFNWZ9TV81xMJla8i9hvTlbcRJb9C?=
 =?us-ascii?Q?58iniUiCYWoWt3EzlxNPz8hc64ZbgcMg6V9DsUEd+YsII7C0U9TKpe8JWeyP?=
 =?us-ascii?Q?nRij19RYW9cndlvp4LrAOyPv4Zt+xt7qwwmn6r/XuO351Mo2UGpVPX6+lJxB?=
 =?us-ascii?Q?DDY1ITJFSTrMi02+XHtbY3F39h4gcCnA1it+MTSvf8zBf1mRVA51qIENQu9g?=
 =?us-ascii?Q?UErrTt1UL230WJPgPFu7WubYlmvOSWc6/rT+m6QCGr6+VNai1I0xzGKN2VrS?=
 =?us-ascii?Q?corFaTuZj2DbOoRXNa88nz6SbOUk1mFxmhFyssO+Z7LOT+NvSDQ19sHTLUtW?=
 =?us-ascii?Q?iGi85Yqur6JbqRVQRfoZiWAhl0bJ9uJh2sNj1e3wahM2Q3QjW4XumvaI4KUf?=
 =?us-ascii?Q?JyJ5W8y3DV2pwhrjj/eqHynqH7IKLwdrfaeSYXkPa0lOzRhZMOGomv0PiT0u?=
 =?us-ascii?Q?GMP9fSSvID+b8DclMAcoWWUXPKrEhkqHJaqMsp6pNY5B2D7Pny6nbzzeXiAc?=
 =?us-ascii?Q?FajaGDUS8tl52hnBkcte4itCjt1EUyqOSzwmSn+X/Ag4UcCvTszi6GuBz3Zy?=
 =?us-ascii?Q?LY0Wb+H5dvlh/T21xZf1a0TA88ueyUzsDS36oqU25USp1mFi+Mt6oZuaADkZ?=
 =?us-ascii?Q?xCxdsbsxq0Q8YOTPXtlV9+goM5PN2BrBR9m4FE4jfZUrfufMjG330ILmVpfo?=
 =?us-ascii?Q?c22hMVcFIT4tAjcqVaepB6elgmwh2cXkCf64VPIiNG224+cPdlsadHMEVS2s?=
 =?us-ascii?Q?TufnQ30wMSVD8Rjy22iB9Bz1eVj5DoeSMpAc2//aIbgyjmgUS1h1cVGwyFmb?=
 =?us-ascii?Q?f4ilYitfl91V8GhZafF7mo1Qv8jYbDIFZGQdymIcSnQtaXm/mg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Fw14Sqy8LPHJM62fYepnx7qF7QbVUtB7GloxC076fMCY6AdPp9avDdu48ejW?=
 =?us-ascii?Q?4ivv0fN3vzweyxtiTbV6blbr11/EL+qa59vvhfCenbUoIlNSAP/17TZJTqfl?=
 =?us-ascii?Q?fxMbU6Ve01q/DWPNd0jqNne6h2o1bT5xz2H7RfjqpIVQK+Z6YG7veGLjILYo?=
 =?us-ascii?Q?vS4T16MZQndZTmpdUDaBDqj5hQPab0kulQ6f/mN5qK/noP3vF6UFuBjPBzkS?=
 =?us-ascii?Q?/4vDFrse7B0dKnWp2a50OlDVuh8fciJ9AMybCLjbC1zKWe++kMoZYnjrkNFW?=
 =?us-ascii?Q?CGwhd98w2CXcXzP/rH6Fh/RFYMm296IS1y/ty0KVUOcCMEIIfRrAdkKUG+L3?=
 =?us-ascii?Q?kEDT2RhF0XB4fwJVKCPAjEAhlz7kd8FUfFYakihXn66F90taPwNPMtdwbU6m?=
 =?us-ascii?Q?oDjIUs1YhLOGx7D/mnpoPTF/VliV5CbHjLkJ9IPLl58fqJuBfyiGf+HTbCQI?=
 =?us-ascii?Q?nQDs4ylXIC3X+fE5ownyJIPlRYky8Ljqq60ELQs31bWJkE4RILQnb3RqTK1A?=
 =?us-ascii?Q?11qb4Gy3cn2dZiF7u4kKLx3sIgfh3WFZ8wuxaqr4QNl+EPoi0BOlS2hbIg7b?=
 =?us-ascii?Q?NcehoTjgHfiMzxuy02rBzcNeddodGmGZPf4oMq077+wGEki3Ml1DkmcA5vRY?=
 =?us-ascii?Q?GLrhw1BDkEvYNliEvvubogOJ7O9hEC1kkeUg/mTsfbsJMkuIuhVrfR67mhGP?=
 =?us-ascii?Q?hxdXbWU2Zm8Noq2Hra8AzYXl/I5X5j0Bt8b+sFliGBZ389PBCeFhgT3NDdUC?=
 =?us-ascii?Q?rIoN2PIpzLN16ApC6ZSIjjwjpFQgxyiXRUIvGZoLi4I6HHr5cZFxP9FCaWoC?=
 =?us-ascii?Q?q6bCKLgPtG+Le3vQ5RstcclEuUzl4OGsEeXM/dMMpUyVsJBI/dQXml0vqCK7?=
 =?us-ascii?Q?h6wNvISDG5cgrrEp1HziKtRefDRZ9SQWqAjG9fcXHTkQpj502kngFz8MDpII?=
 =?us-ascii?Q?oxdf+PqsdoFbofPd/srfiMtFeud2GjvtUBpYk3eFH6d6FDDjUMQ2dSNCCGVD?=
 =?us-ascii?Q?SYMrwFQfbxpvrOHzp17F3042agI5FiE8362MwHSeX1svU2EFJa/MJmwzA0la?=
 =?us-ascii?Q?u3PTjIORCzB9+hB18P5Wqnm0eNRESnAxpHeRFApM2MaIamCF5SVc3hcXE+Hs?=
 =?us-ascii?Q?ObfOqT7hUkE7C1l1+wA1qKdnLluxq3XwcqFjVyfHIzZh1QiKT4Is6CHfYYZq?=
 =?us-ascii?Q?/klhd1UJ98m3byZN8knNsIoWTjGDAW3/8OOe9F3zEoCJz8XW+iyDJFcp8PCH?=
 =?us-ascii?Q?zaAxqykVl23Ofs5b9xsKRgOaRXUo7OcN7CEufOMB1eqVN7pPGfwa9sTy12RW?=
 =?us-ascii?Q?wP1/o6D2woKjQ/eFNmq74/adPif9/m9vdXWpdpEiYvjwleY9XBf1XRzvhbrT?=
 =?us-ascii?Q?WM7elVaWxfYX83X2PM2dhmURO1B5IPQbA9E4x545o+kAeECozbsX/lUJM9Yv?=
 =?us-ascii?Q?DWL8c4oNoYgNlnbBpxNSxiGMohxZfyIzZHu2NAERDPd5XRYbkxWxzIjjjnQ0?=
 =?us-ascii?Q?Rnkh7R4WgNgDkssR8pK/5tpXz/zHfcar9NhN0SMVfPRtnkK28UOtuR1Fc9Rx?=
 =?us-ascii?Q?/iu/QZ0AnyMcPeESZu2BFNWfm08vY5aB2tOd4I3Khup178a5axQ1B+r1qKzM?=
 =?us-ascii?Q?E2F4N+DGvLqLLsd3Gb5dkbY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78bcacd8-a320-432e-c5f4-08dcb4e72820
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:08.4313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 U0JrH+eeGxriQQQkPeBoc+Z2vMrlvqUuFTMsk4WKCm4n99RtAC7ogOHQnvQqiI/cOvPMoiUUkJ5Jd6x8ugUC9+nyBeDMXTMF6FIO3HoZ0BkR1cXi/NxMvXMYu1zhCen7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: 35SAE4YYEJUUEFA5BCPC37NLR3BGBB67
X-Message-ID-Hash: 35SAE4YYEJUUEFA5BCPC37NLR3BGBB67
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/35SAE4YYEJUUEFA5BCPC37NLR3BGBB67/>
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
 sound/soc/intel/avs/path.c |  2 +-
 sound/soc/intel/avs/pcm.c  | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index f31d5e2caa7b0..dab52a90f4c31 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -171,7 +171,7 @@ static int avs_copier_create(struct avs_dev *adev, struct avs_path_module *mod)
 
 		if (t->cfg_ext->copier.blob_fmt)
 			fmt = t->cfg_ext->copier.blob_fmt;
-		else if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		else if (snd_pcm_is_capture(direction))
 			fmt = t->in_fmt;
 		else
 			fmt = t->cfg_ext->copier.out_fmt;
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index c76b86254a8b4..df71a0292d4a6 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -40,7 +40,7 @@ avs_dai_find_path_template(struct snd_soc_dai *dai, bool is_fe, int direction)
 	struct snd_soc_dapm_path *dp;
 	enum snd_soc_dapm_direction dir;
 
-	if (direction == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(direction)) {
 		dir = is_fe ? SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN;
 	} else {
 		dir = is_fe ? SND_SOC_DAPM_DIR_IN : SND_SOC_DAPM_DIR_OUT;
@@ -331,7 +331,7 @@ static int avs_dai_hda_be_hw_free(struct snd_pcm_substream *substream, struct sn
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_hdac_ext_bus_link_clear_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	return 0;
@@ -372,7 +372,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (!link)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
 	ret = avs_dai_prepare(substream, dai);
@@ -695,7 +695,7 @@ static void avs_hda_stream_start(struct hdac_bus *bus, struct hdac_ext_stream *h
 	 * disable L1SEN to avoid sound clipping.
 	 */
 	if (!first_running) {
-		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(hdac_stream(host_stream)->direction))
 			avs_hda_l1sen_enable(adev, false);
 		snd_hdac_stream_start(hdac_stream(host_stream));
 		return;
@@ -707,7 +707,7 @@ static void avs_hda_stream_start(struct hdac_bus *bus, struct hdac_ext_stream *h
 	 * re-enable L1SEN.
 	 */
 	if (list_entry_is_head(pos, &bus->stream_list, list) &&
-	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+	    snd_pcm_is_capture(first_running->direction))
 		avs_hda_l1sen_enable(adev, true);
 }
 
@@ -733,7 +733,7 @@ static void avs_hda_stream_stop(struct hdac_bus *bus, struct hdac_ext_stream *ho
 	 */
 	if (!first_running) {
 		snd_hdac_stream_stop(hdac_stream(host_stream));
-		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(hdac_stream(host_stream)->direction))
 			avs_hda_l1sen_enable(adev, true);
 		return;
 	}
@@ -743,7 +743,7 @@ static void avs_hda_stream_stop(struct hdac_bus *bus, struct hdac_ext_stream *ho
 	 * left, disable L1SEN to avoid sound clipping.
 	 */
 	if (list_entry_is_head(pos, &bus->stream_list, list) &&
-	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+	    snd_pcm_is_capture(first_running->direction))
 		avs_hda_l1sen_enable(adev, false);
 
 	snd_hdac_stream_stop(hdac_stream(host_stream));
@@ -1602,7 +1602,7 @@ static int avs_component_hda_open(struct snd_soc_component *component,
 		}
 
 		/* RESUME unsupported for de-coupled HD-Audio capture. */
-		if (dir == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(dir))
 			hwparams.info &= ~SNDRV_PCM_INFO_RESUME;
 
 		return snd_soc_set_runtime_hwparams(substream, &hwparams);
-- 
2.43.0

