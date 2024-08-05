Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B3D947286
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:46:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 554234B9B;
	Mon,  5 Aug 2024 02:45:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 554234B9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818719;
	bh=i+H+QQwiJLoD8qFPk+b4VJ2qHaZScLVWFztzbLv8GRA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rwO2rWl6Rj97lWVKOgt1PkZYVq5t6HZ81ADzOZU5y8MacnP+5KvZTSaXDc4sLaWSp
	 N8OQcWvWHZ3z9ODXtYGe1DkhmAbEk3yg/lxZe0l4Gf/Xb8zDlA2yWree0RVsaJCJ5Y
	 IRc/fTXLe0Kd4mEWhulGO3H04Ve6AZnB9uhZ98c4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A4C5F8061A; Mon,  5 Aug 2024 02:39:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83486F89768;
	Mon,  5 Aug 2024 02:39:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0EA30F802DB; Mon,  5 Aug 2024 02:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 73D51F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:36:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 73D51F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=X+PH1z0z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zMhq2l8l55HrNNsrRqmlNMd1agYBfMxhEn+uZ8+S+jKIp0Ernz1HoBFi+3LRSEjdm9jU9IQihN8PIqhbtND2ibiqJUfolATBv3cMMNzzSQcmNo2Kr105x/aWyMvI3fTSP/kzykvo9r7gALfP209/KYfgyE+2lWjkL0L/wGrD3U8lCgUto0fAUfOVBrmIQseJ3ZOyjqnISt8JhLQKtp1/7G8g02GZlu/dLmk1Jv9P401SPRUDOS4Bu9FPEIM69R/15CIkr6qkcI4NXPOHyVLXjlNUwBOwXjNbP+c0mgBBs2+jAUMb0GstDusEtvSDwFqIakyOxSejNW7bpFT7wJokyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQLJLkHykyf+9tjtwn6ySZkkW916yfItHvW05IKs/pg=;
 b=t9dNUrOzEu/oehNq0lQJP1vAqe1p/DA5oy4EGrX7YDmbKI4jXn5q9Z/LsP61NcSxwGStmKuxxR257i/YxaAUSRmTsreDrkxKX87XMT8x2FUtAYHmGBNxodeAVgjT3W0wTIaL8rOgAGPWGJwUOz37674D7vKnIgpC3kp+wb54pPP9cXECRWhzn/JQi6d9HwFBn2rMMrObA/j0NL4gHalLBUhz49rtBmL5keAA+UHbe0Ct1KbtjTuvZwREM+D4rHD57bZEfPntAFQtuAgewChO7snm1sq+dhmfTZY2QgMwRsPCLTOFv8BQelppiKKhBCqk97uybxjXRXOCu2AZ8E5vqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jQLJLkHykyf+9tjtwn6ySZkkW916yfItHvW05IKs/pg=;
 b=X+PH1z0zqRDsqJt34C4MZ8gIi10f1v1o9GjtGMzUY0pitO/XjC33rFb9UKZO3gcMzew/R/pZ4tGmr2KnJg+oPaQ90NQW/Xk3nC1vXJIqBO4wQX69wNU5c155/8Xv6TjUnkThDSCICntavC6QS8BN/fxvXZpdT6ugkp3y8g5zXRI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:32 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:32 +0000
Message-ID: <877ccv24c0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 023/113] ALSA: pci: ice1712: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:31 +0000
X-ClientProxiedBy: TYCPR01CA0202.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: 78d6a4ff-92a3-4130-9b8c-08dcb4e6a728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fZHuL7fdJZHxKZV4nw2JPbrVYngMZNBCqO1Brz17cNsDp1xE1O6+WBbQPRbn?=
 =?us-ascii?Q?Gic612CzuIHCmoPDboZJrdeQUEbUnghqLPBPG/RONW2ijSv3GFLlstdE6O+q?=
 =?us-ascii?Q?ui3sumir6UGnJ+glw5W1WjSc4xZu/EjouQUk+c0bN9R9UPbJU58HP8MAL4Et?=
 =?us-ascii?Q?AV0Ga2+s0YMn2u376pYUGwGPUt16X0vTh+7JvWhR5FqDYLzZ9haGMctPAIDA?=
 =?us-ascii?Q?zeaaUD/69TYFRRVYwy7RYbHyvqng/3SqNVyFYeGgopba+gZqiH3E2XvMhYZi?=
 =?us-ascii?Q?ktQR/WfgaMX8M3BMueof3+ClJaY/0D4uAHN3jCErhdP1JRj1rxWKqEHrBPDf?=
 =?us-ascii?Q?I8sYhsvXol5ZuXM1fDs0IvArWd8W0h08gJbGidoW9mBqz8HCoeSk6mxVDx+7?=
 =?us-ascii?Q?83PN54/4+hGey1zvRHGYYNQIrRN/YuoWYoM2IgDkbXTXPfhUHerC4hBcu/kz?=
 =?us-ascii?Q?vO9u4hdU3dQnA3TfHr+W2DJZafWjAJ8F3gHgihZlV44ebI5nIvGPuxw2WqSc?=
 =?us-ascii?Q?EwG43Y1hr83M1bez9SkJRs4FE1Z92SxUz0PaijLZjYWnpi8r8fsOHTIlgNth?=
 =?us-ascii?Q?mStxrnc3tegIMOBxyroLkYDohBD6XpoHCKdCZDUt/tfhwEzwalQqMvwtJe7B?=
 =?us-ascii?Q?gTWV2IaAaciQRwGgZoH6i6M218cBXnmRKUBlFhgzqYQHsvmqqdcoNoh2RtYl?=
 =?us-ascii?Q?hZpGlBD6huoPQrF/Zj9JLH3oO99IMQOIu9HCuvnsfmIjhdM+lsyafNwxnaNy?=
 =?us-ascii?Q?WoTWOkiGfNSGGprhhkoztHbJIFLXiRpsS8LLv0rChi28bN8kYfu2pkJUtmkv?=
 =?us-ascii?Q?D8KEg8M0l7vebMheDvMsgNl651gBQ+vyGu60BhpSW3c5FQwedORcTYy24j6a?=
 =?us-ascii?Q?vn09XsW5duKn0TpDIvbC8oBCyk7iWYij9mO+3SO+6/Tfj3WoQ8Va/PafQUR7?=
 =?us-ascii?Q?aF0azXDnFlrDiYbzzPidxJCyfDougPI1XyuLLUTYmyHM/KH8ym3qrHMhzsWk?=
 =?us-ascii?Q?q/vuuf3kUpVgE61JK1frf34mOlKhOiMDq4h/DjWtWUMQY6io26W3rvZuR79v?=
 =?us-ascii?Q?UvlzQPRKFjeT/BOlVL3AJjXq0Lmu40PZ87tYe5wAkw1ZS81f7Kbg4LDnyj3h?=
 =?us-ascii?Q?zGgD6CS703TB6P4k1DOPHe6bk4LAoEFmtGQ8+nZqm1gHEVQ+f6VcX+6irGBi?=
 =?us-ascii?Q?imgBeF2Fm1XrZ6Kxza0BxWxHchN2O9bn5wr5MmNxINUFyD3DTDXtC8cZCPTO?=
 =?us-ascii?Q?y/tAE4VtR/UV+m3PUN1wixyJ9F28rSNBm+GRRFHN5C5n+HMCIlMwJN3AGjLw?=
 =?us-ascii?Q?v1SrQjRI52vCuBbUZjBhCReKOrX4+fzvKtkntQ0if3y0cPak2cOXDYwwkde3?=
 =?us-ascii?Q?XGWmSxptOIRcdQVk0kxCF8SaKfO/P1Sbc3Yr1EHRxX4DUDt5wA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6lQpQiZNoT2+xBAY2TmeMHO6S36eN0vQLkCjKWjefAyc2+7tezHEcJsmAL/Y?=
 =?us-ascii?Q?nRyKtlALvHHdgjxoVb3MorK884u5TviQnQbAHwV5ht1OuzXlkdRygDIWmjcF?=
 =?us-ascii?Q?Pw/3WGthuXh5fsL/1sgQd/dfV+jp3dK1g8T8mdXVY5cetRgNr+T3S9T6sLaT?=
 =?us-ascii?Q?od5MoOS+e0zucOdhtxxs2AiTggecQXZd/tiAGV82qBIhRcPzb9Ju8Or+E7pk?=
 =?us-ascii?Q?piVzSThOozamGPAqYzUXwbGK1RwaOzsrlN6WcqwB8RKx/N/wtnEFRZocYwAP?=
 =?us-ascii?Q?RC/JRN+6bauCz0AHtJ14GbmrjTR5IAxllJpQ5+v8LoT2FlGcXCLlTTTpHnrZ?=
 =?us-ascii?Q?cPdx8OBPC2L3VhfSVTLhX/DLm2AktLuxn4px2S35x2IPfvr/xNdR6B11J4B6?=
 =?us-ascii?Q?1vki+oxPtj+e/pVHuG1Q4LrusJOGwqUK9rH49EtOg27RQGjO9Os7vMERb8Me?=
 =?us-ascii?Q?bsxlwywQe8r56OHxjVLtwA+9h954Tk81FdcGLg9dAYBWfGLHiwgEZcVBeF0d?=
 =?us-ascii?Q?P5j1gd1UhetEndPRnEmvpt+7+xBZo89wSyiQqZG9SBEeKbTt55cIWlD51bWx?=
 =?us-ascii?Q?zPizlblxAOXK5INoXt9NbFNSC7p+DZZWWFp0kbJpSsDfJoSt1Osard8ePrfe?=
 =?us-ascii?Q?sJ+RQv4hvs7YhJFgdWGBTQM+cRkiO7citeKmDzWdyAleBSHY291wJAau81Yi?=
 =?us-ascii?Q?uKHlri3mZmbhg2z9HZ4RODdnIVzgkEusLSKjN36QAce88UeO+kvEVH+qVUGA?=
 =?us-ascii?Q?VCAHUWT8cEBjIFUopp3R0ZHdAZ0aR636Ve3fsoVbOxJFBFy4GUvjhlUu1oei?=
 =?us-ascii?Q?MO+T5fEh98RxJCi+a1IuvradSmmbFJjRTBbkqNbq3og6In1gls9ob22RF/WP?=
 =?us-ascii?Q?oOhUD4XCEtzAU9AHajsSyoHvTYRKHHDCJEcA1+q1acIAJ5LGM7g5Q41ykBvV?=
 =?us-ascii?Q?hCC0nJEbyS9hEN6eCzI1IB3yVUQb8FAUqErc+U66VH1O9+apxHnbHIKqmgaU?=
 =?us-ascii?Q?TSmY1IskrKluY9M8pLikxLUmDw3cIFTao8Ym7Veaay+wJcmnLox69kbLM/C1?=
 =?us-ascii?Q?fdtiOPFDZBl1Kr6Jdu89Ng/l9PX8jF4+Cy6Aqqspi5Y/zpZ19bBl4aiLx0dF?=
 =?us-ascii?Q?cI5Ue0r1KJ22CceeFw+FoW8C/55YmIDtBy6RhHlUe2siQUfww3OsQ5F67qCR?=
 =?us-ascii?Q?xNcttUBj1MW9o88ZeZvZ8zxUUGxrRAYGR4QbKWPq8eVehRJjHt9IKK8U36yk?=
 =?us-ascii?Q?ot3LF2CuoDaIz0XcDBh2KcEZiwB4rF8pitnuTVk5O+ZVML1e4nkpIju5aDU+?=
 =?us-ascii?Q?PPotjr4YtL+uyGpXtee1cHAFE0xZ9anbpTAeQB1w8wuxTKpwFnUpOlySRpXD?=
 =?us-ascii?Q?1z6C7lHok2RUCd1ybgmQ9FKK2RkqtFav84LtUXsKCkOpF9sokmuTs2cmzUCU?=
 =?us-ascii?Q?iiMWAgM3giJuMnxbk2tAzNAIxiw+cg3iCu5nkkP5axS1fGE5P+lry8xku6RV?=
 =?us-ascii?Q?KjThgk0QFgHhDp24xDeTR/jRKOKBlNz6Rm8iI6GZH2ntVm2tDAR4NgSagFpe?=
 =?us-ascii?Q?rRl9V+5nV+dekkWKfLNYyM0knCoILHaj2kNqrwA02mz3YKYjCKg1yWvV7U4y?=
 =?us-ascii?Q?HtGbQx0P9Q1mUrCUzGOhxY0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78d6a4ff-92a3-4130-9b8c-08dcb4e6a728
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:32.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pTjX+w+omXanEO5R8pcYgOk/YiVP4f+LiPDGHhqxEdXFYdgywD+U9cWKcFL+wxmwPvb6uSJDC8Eje6ePgmGyd1iF91bU1Ub+K6BXXLDhu+Wgmp16N3PBcI0YlwpyTVmY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: HRKKOJLXTU4SLSALXEKIYHV6R2ORHQJR
X-Message-ID-Hash: HRKKOJLXTU4SLSALXEKIYHV6R2ORHQJR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HRKKOJLXTU4SLSALXEKIYHV6R2ORHQJR/>
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
 sound/pci/ice1712/ice1712.c | 2 +-
 sound/pci/ice1712/juli.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 3b0c3e70987b9..12f0cd9b8fbb1 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -907,7 +907,7 @@ static int snd_ice1712_pro_trigger(struct snd_pcm_substream *substream,
 	{
 		unsigned int what;
 		unsigned int old;
-		if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+		if (!snd_pcm_is_playback(substream))
 			return -EINVAL;
 		what = ICE1712_PLAYBACK_PAUSE;
 		snd_pcm_trigger_done(substream, substream);
diff --git a/sound/pci/ice1712/juli.c b/sound/pci/ice1712/juli.c
index d679842ae1bd7..b52426540c529 100644
--- a/sound/pci/ice1712/juli.c
+++ b/sound/pci/ice1712/juli.c
@@ -170,7 +170,7 @@ static void juli_spdif_in_open(struct snd_ice1712 *ice,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int rate;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK ||
+	if (snd_pcm_is_playback(substream) ||
 			!ice->is_spdif_master(ice))
 		return;
 	rate = snd_ak4114_external_rate(spec->ak4114);
-- 
2.43.0

