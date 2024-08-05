Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC49472CB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E31F3289;
	Mon,  5 Aug 2024 03:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E31F3289
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819644;
	bh=eHc0IA89H5dGyNCld9zIKcIGc5kTMyrh/c8uZmblVL8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=k2HbB4HPT7zSVpQF4LKY164KrhReSSaBPfg+qFfjELP/l8HTSMijHrbqs7eeKQB2Y
	 eFbH4+Ziw/jVE0+r4rbdZzYthHmT7i5S4R1t8Vpnlci4qebfXcCPgtTTBJvDahxRtq
	 Xw+9rY+aaSxTGl/qk6YC4EDnA5yNH0l05K/fIymM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 288F3F8080E; Mon,  5 Aug 2024 02:42:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 75074F8076D;
	Mon,  5 Aug 2024 02:42:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9AEE0F80841; Mon,  5 Aug 2024 02:42:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0B26EF80580
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B26EF80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VfHqBBxE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPNR6ENAUiAJDXzwZR4rrHVPTptDD6L/CxJLqi/2ROYQ2n16Uabt5VtK3AoXrSMnRq0RIp4oAt0iICQd365baZgam6BwmB1a0pH4x4qmvtTcme4Ye5EbEC73wr9LMphyYhR/JiKif+vZdWvxkpuNUlMSQBIxdGyxSsqcR0sFfq90yeh6iWDS/SH+j7P8UCO/WpXOF/LUqoYMbpKaul7IDdVdbWuCHe7g5YroJNbctlptDUDwTlNRsBFMgDeNrTjXGsrJpzL1ZAFGUflNBZi98h6JzDKrdn2rHq5qyZ+1jvta/VB5wX9QR2iShcEg7V2PqcPkKneW1wvcqldno1GDOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tRUozKlejGwEKAtGbBxAHzFkFIpBOaNQqY5DlT+OePs=;
 b=Dcl4WuNLX/YScZOg4IJRIDmruBu4qfL9chDZNEzpVHaRmePxettQxkU8BuIDwVbbGtezOJjYxRWUpWY6NfRZnagsAfgrRung38WbfhQrlFWwVA9dLq1xdMbW0W4aejGMQBjOQiV9UYS659mEakobfaE0d7PIontQVG7C85qfV5KXCwUcY7KoKIS7je/XpYdtaTC/2cDTstQiaT7DUQUUCdhPTb620Ozv4E6jp9iD6RaNnkPICogtvt5sVNF7EOfad46Ps6NbluutFIEvdN90ESzC1nLt54sZ15gAeI/XdpZ6JmzaHFFnhOWKlvtB3bohDFp4ZLtQIw23GX5SGXfJNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tRUozKlejGwEKAtGbBxAHzFkFIpBOaNQqY5DlT+OePs=;
 b=VfHqBBxEMpcM2e7u4PCZPI53WetEyffS5NJTrvNMtl83RksHom9O3WGSC/LceDn0y82oVQRLAVdGVyRDNt4Zf/J+rtTu4oIZPLLWq4mXObOnNPlygpaDLA4zPaswE06CC5oTjDZRzR3fZcRxvyrZd78bgyz3Wmhq+TlnOQ6dtWo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:42:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:07 +0000
Message-ID: <87wmkvx0kj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 080/113] ASoC: codecs: jz47xx: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:05 +0000
X-ClientProxiedBy: TY2PR06CA0028.apcprd06.prod.outlook.com
 (2603:1096:404:2e::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b6ec1a-9c38-4959-3d62-08dcb4e76dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ygmmRPUVIv/nMf40UaGIYEGTMDqx/6anaDuVvMeE0qmtpky6XnFAMKBe4ZAl?=
 =?us-ascii?Q?LyOa9A5yWpVzt/ec+kSKkq7OhMQzv3FFitofmoOwLEyOqub9Cp9Avgwb+ysP?=
 =?us-ascii?Q?25Kds/VoPQDSUrMhvB5PbOT9VlXgaKXndMk6i8Zh9lz0SG31iacYV3gr1pnm?=
 =?us-ascii?Q?q29SPKGUYMTdXYyTvKnQPiKCHKJWiQzW6GG/Xp4Yf3Y2ALfT9qB6VnaQ9e1P?=
 =?us-ascii?Q?cwmw4uBtlHy1O0kyxHte73I3T3dDa/7fBuvONkGckmIWFgmZ67rjvbRux96X?=
 =?us-ascii?Q?NrOSvcT9Rm7zyR2XcVg8lMADfqxwZU0mY3s+sK3xYKStkZTQFiXX90OKBZq2?=
 =?us-ascii?Q?iXDrCPW2f4CWGXjIWmlO6kM19z8qfch5KtNwWQZIsYPHbgoplHM+4kJBT9KQ?=
 =?us-ascii?Q?PXB4pAXTwEIXqIuc9aBVI1X9GsEwYdXXmtaDZcvznkqfIF750yX2MBPh6LhU?=
 =?us-ascii?Q?isBdrtKOdkI9bE4QUOTX0Oeuotn8lHje9GTpEWpLDYIeKX6U0xZ10qYK1nkn?=
 =?us-ascii?Q?OfIZQ4uVo7BZbMsH36FgrR9ftNBczXp/GS3ymqxhckwY8lQJzh5hZCiIPf0p?=
 =?us-ascii?Q?nykoCpQwniwny12Oj55OX+6Fm9wD7znXjxIfhfIJoxiPeTiPk+DlnASTjeuu?=
 =?us-ascii?Q?NFHtD/+SFsGJ62KCFXiZtYmclJp4hIvUu89j5IVTIMifYXmKLAIpTs6A0kFO?=
 =?us-ascii?Q?IvoTE2w6Ov6upTRNHKUV/JwO08lVRJX81LQuROYU8Tv2cXrOo4Ub30zJabXy?=
 =?us-ascii?Q?Vgn5wAyRrV9R37r9SyD1XzGOOAT948SxKfpSqObzoXyiThVt+F9MumQnABTP?=
 =?us-ascii?Q?5dVVqBchV4x7gi22j15D9ZCKzAoUmhidVDPgsEXs251j+1CWUjNbpPW84FqD?=
 =?us-ascii?Q?tA/l5D6Dsi/7EpI5/b3oU99cVkx/lVCOHtFRlydXahpNpgMRTuyuWjSxvCsg?=
 =?us-ascii?Q?V32nDsBtHFsnNyzXAhBJYbuP7iTFNidWETlFLBhGYGyzGPPC9GLHemmz07O4?=
 =?us-ascii?Q?CB72zD+g55S7CrC1qQrU63XFDsGohIgnwcR46OFyphUtXnTfd3PQxAv/kf3X?=
 =?us-ascii?Q?04/VhhQRxQtz1Pf0MaC0TqE0F9NwI/cQURWiPIWsyzOyXeOlY18yT0wlc1Ip?=
 =?us-ascii?Q?PgDG3xbxGrruyb3XU3nGQUBNmmU0Er38Tw/g4VbhtoFTujRmGa7uC8j8FHJL?=
 =?us-ascii?Q?Ac37oUycNjoDFxe5BP8CO4JUO+AdgylLxLdbKOxKMogPza6ZrG0cZShWoPUC?=
 =?us-ascii?Q?dk8O8GMrDLmGv+mTuevxeKTpfwEc9jgjgcJvYlNWlKcKyeFJ+t2wsse4MYHY?=
 =?us-ascii?Q?ZgMXgFsFRGAonYAEgV18e1Ase3DVhSBuNHPfQGR2/eBUuDj3Nu9EOmmBxmB0?=
 =?us-ascii?Q?wJd9VkU1CAtDwEjglucr6ZebEpU8RgsQSkgDZHcS4P0ilRdZtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KQmBvdZGI0RuxF8p552d3QfvRZgnq183lNrGJFj1KJUnpLngn9gjkbSbHoap?=
 =?us-ascii?Q?xmbvGAnzzGqxwIFmMgRenjzCa7HjAlfTpHIP/XAT9Ln88P0Wci2JfvikUNvO?=
 =?us-ascii?Q?B2K9aCFUQrGUChlACGWOkHsjtqXxd/55Ehw11aHSmgQdL0wC10U0J7KI0GaI?=
 =?us-ascii?Q?Fe/sd0DRbLJLMjXKXaoXH4klufwl5OI3UjoHtkWK1gTQJFFSoalvP0/5TgbK?=
 =?us-ascii?Q?VO2tu/viZok3+0rc5E8/qj47756O2A4bCogHZC5Fb3XgPW+zlVW/0C8+wCru?=
 =?us-ascii?Q?wbmwkgGtZ6NG72H3HnXDrnzSLm2Ehs0iBIYJ3JB1XgVTXnIE3EoLdnnrO0O9?=
 =?us-ascii?Q?nCb+ywi0eVmz6yc4WsGQHkU681qUYMFy/xW8YJCXHoapashfZ9R2VdfC9hDF?=
 =?us-ascii?Q?uzK9WkA8LiwSICCZxHAXiX3Tos2IqOirvWuhIQKPVQiHD0+ouCSEqJ5zdQmG?=
 =?us-ascii?Q?XtfH+EOmf6/P/f0rCLLrf8Xu8a48BRbsCwN98qbaAIWGj7Pyw0mB+eFpPlQp?=
 =?us-ascii?Q?QSW2FrApC6uWxPRlqXeW75fh5ejSKU+1N7ojKfQugw3qJpWHjYMzDstoNaM6?=
 =?us-ascii?Q?jr4x4tjOu7QuphbnQqDe8OE7D9ypFPwDSRBNxW2OP6PwMVP28W0n/zfSVlJW?=
 =?us-ascii?Q?YRBk+ZfTkwdl3wbzQmHzsFfvQZ+IQxeC6qSFFhZmC+B+RcYDM+JN1PDqJ1hv?=
 =?us-ascii?Q?+gNpbHJuPldOR+9qNGWyYv8FNHkIk+zUB06ITTZ41I6jN1bR9IESawOd2ESS?=
 =?us-ascii?Q?wn37MQJeUm3IyHMMw5ZRMhY9VBjbX+l8f1IscXUad0JTEs7SrohzwN9naERE?=
 =?us-ascii?Q?1/afcXEIEz5PmgGql4pSwzraNuu4G6JutnPzRTftiOoIhOLRdXBtwA+yBOAr?=
 =?us-ascii?Q?tC3wIPVgM9WsHPiNtoOQiJgOZa285PJ2UyiWWaQniNXC8VIAJLbkSzb/n8qk?=
 =?us-ascii?Q?dTuR0n9Vyrg1/5oQICacZO0TxiIpNlVyoSwpk2v1rfUsw6P0RIgwBTmKFLqa?=
 =?us-ascii?Q?mFjGPhpYf1ZxjOgiTdOjNXPeSkZ+0Ce4N5wZq2iXbP90NubramPTdVtpmJ4/?=
 =?us-ascii?Q?Ncy5zQM3xle1rZh0OXjET+VhbMWnISh9hSIg7IjD31h4fBO6SNEPsHX9Euw1?=
 =?us-ascii?Q?iDQHw9ljPkAy1mTlp5tJ9I+3tvUSLjFY06EGkKzl/mmh4AFwlkfB5MwbHe6M?=
 =?us-ascii?Q?mfA+H6Pl+Q5d3kCubgambv58NxD5pdBACks91hkjGufuutGYuv7uSOo23SCj?=
 =?us-ascii?Q?msa5g7dv3H0EfdItApebTLGPWjdVytkfRTLDxrcItQjB3Zn5OYs+lOw3xJ4k?=
 =?us-ascii?Q?8B+gBsgJPLvwnDIOpRyovzqNGA256ju4KZqyr1cc8phGBcuANZZYgXWXnMqg?=
 =?us-ascii?Q?ZUF3AabuHbLu75ty2mEOIWE7t7B3BtrEJCykrnufkt5Y6oxqBb7W7cC14IKu?=
 =?us-ascii?Q?/VCKeJuwaEJJdUSSZX3+CZvs4UMQnNjidwS0P0sXCf4ytYXjTlaN1tqTw66a?=
 =?us-ascii?Q?WMahzYqtPtS9uLuIO98e077hwKm4erkneHYCKvi70BlHt+h4xMEqj7dSzxjc?=
 =?us-ascii?Q?YM+4KwNzu9dEF5GfO/SkeBMBPqxapwp7lFVKhbyf8jHq5UsQ9ctb3hASNhDd?=
 =?us-ascii?Q?RbHKw7D8GHncC3pBAhbMQ8o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 99b6ec1a-9c38-4959-3d62-08dcb4e76dc1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:06.4884
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 M9YpIXzEX/410y3gNnXlI9xJy76qU2WxDvepLbKEuT9FAmr0p8M5ivAasL5Q+CgSbHCFuOC681AKFzMFDUYrTxtgCuIblryd5tVJHd6WcgD6MBgGEYmgIkhr1XnMLNRs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: VDPCNGYX2UN3E6ALE44UFGIP42A7PKJC
X-Message-ID-Hash: VDPCNGYX2UN3E6ALE44UFGIP42A7PKJC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VDPCNGYX2UN3E6ALE44UFGIP42A7PKJC/>
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
 sound/soc/codecs/jz4725b.c | 2 +-
 sound/soc/codecs/jz4760.c  | 8 ++++----
 sound/soc/codecs/jz4770.c  | 8 ++++----
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/jz4725b.c b/sound/soc/codecs/jz4725b.c
index 39cebaa167beb..7add57e5c4bac 100644
--- a/sound/soc/codecs/jz4725b.c
+++ b/sound/soc/codecs/jz4725b.c
@@ -476,7 +476,7 @@ static int jz4725b_codec_hw_params(struct snd_pcm_substream *substream,
 	if (rate == ARRAY_SIZE(jz4725b_codec_sample_rates))
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(icdc->regmap,
 				   JZ4725B_CODEC_REG_CR2,
 				   REG_CR2_DAC_ADWL_MASK,
diff --git a/sound/soc/codecs/jz4760.c b/sound/soc/codecs/jz4760.c
index 6217e611259fe..f39bb0dc93e02 100644
--- a/sound/soc/codecs/jz4760.c
+++ b/sound/soc/codecs/jz4760.c
@@ -205,7 +205,7 @@ static int jz4760_codec_startup(struct snd_pcm_substream *substream,
 	 * DMA transfer going during playback when all audible outputs have
 	 * been disabled.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ret = snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
 	return ret;
 }
@@ -216,7 +216,7 @@ static void jz4760_codec_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_component *codec = dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_soc_dapm_disable_pin(dapm, "SYSCLK");
 }
 
@@ -231,7 +231,7 @@ static int jz4760_codec_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		if (!snd_pcm_is_playback(substream))
 			snd_soc_component_force_bias_level(codec, SND_SOC_BIAS_ON);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
@@ -693,7 +693,7 @@ static int jz4760_codec_hw_params(struct snd_pcm_substream *substream,
 	if (rate == ARRAY_SIZE(jz4760_codec_sample_rates))
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(codec->regmap, JZ4760_CODEC_REG_AICR,
 				   REG_AICR_DAC_ADWL_MASK,
 				   FIELD_PREP(REG_AICR_DAC_ADWL_MASK, bit_width));
diff --git a/sound/soc/codecs/jz4770.c b/sound/soc/codecs/jz4770.c
index acb9eaa7ea1c5..740b4e926c76c 100644
--- a/sound/soc/codecs/jz4770.c
+++ b/sound/soc/codecs/jz4770.c
@@ -224,7 +224,7 @@ static int jz4770_codec_startup(struct snd_pcm_substream *substream,
 	 * DMA transfer going during playback when all audible outputs have
 	 * been disabled.
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_soc_dapm_force_enable_pin(dapm, "SYSCLK");
 
 	return 0;
@@ -236,7 +236,7 @@ static void jz4770_codec_shutdown(struct snd_pcm_substream *substream,
 	struct snd_soc_component *codec = dai->component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		snd_soc_dapm_disable_pin(dapm, "SYSCLK");
 }
 
@@ -251,7 +251,7 @@ static int jz4770_codec_pcm_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		if (!snd_pcm_is_playback(substream))
 			snd_soc_component_force_bias_level(codec,
 							   SND_SOC_BIAS_ON);
 		break;
@@ -730,7 +730,7 @@ static int jz4770_codec_hw_params(struct snd_pcm_substream *substream,
 	if (rate == ARRAY_SIZE(jz4770_codec_sample_rates))
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		regmap_update_bits(codec->regmap, JZ4770_CODEC_REG_AICR_DAC,
 				   REG_AICR_DAC_ADWL_MASK,
 				   bit_width << REG_AICR_DAC_ADWL_OFFSET);
-- 
2.43.0

