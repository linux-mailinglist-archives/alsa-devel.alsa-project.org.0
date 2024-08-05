Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 046CD94724F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03AE549DD;
	Mon,  5 Aug 2024 02:41:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03AE549DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818491;
	bh=WeFjavISzMSFH/srSndOZpGAOt4ap9JGSkD0M1q5alA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QfZtWniiP0qKXsFwwY2sB2T1SI2ayu6v69TUmHn7FnNcYzk3tbC1d9+QV7f/NGWrg
	 hnnJKJhVRuzmwYSFNP1XlZcmRTz3nwl3YIIjKI1ApZolUdKOPEx/sRaxvOQgjXS2df
	 bAWCu7UK6e3m0JVbnbjMbS0b828lWzA10H1aSIvw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB67BF8085B; Mon,  5 Aug 2024 02:38:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E14AF806A4;
	Mon,  5 Aug 2024 02:38:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C441DF802DB; Mon,  5 Aug 2024 02:34:46 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E0E3CF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0E3CF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=K3tzODYG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cP/8041kwRR0t5zWnHrlcTgyvXKV8JqBYMPeG/2+J9lwUCC+vl3Kar0p8cOg3YXQ+SQsmSqPV8JHbhn8B+8DULOXYv1L54JVQr788JF6XNfEuIFUPEjlhsUy4wwieB5nlCkrMTlq+TR7V1PiYzYMYjNV/Llf0BSLNHH4vk+y3n92vEzjGBXSCjof0of+ExGHpjS1cPSbuTeJgkNsOwFjIS23WCGK7jTg+3/9zvlPPGq+kp1jAaorV0mkWloV8PAE7h6tMXOUeR1Xa3eeFPltCFrP5z8xT/R/vmPloGJ86C/evDwfLhhk6ApE3VCe8jNoGerVTzMKifoBlGrTvRYhJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jA9TzAfqUrRxp8P6/tcc0m8ON2s+ManXGlpk2hx2ncs=;
 b=qyWFX6XTvlRFBmxY/Es85HO/km913Dr0eMKW1SU8qWOVIR0JFbggpbbRE+IpFp4OMxIAFDywsWpiK6cT4fT4uQRcQJBAkxa2Smipw//95h+cAvn/LuzpYJjR9bhbDhHzQbjqQe3AVlANwvLP+pistfCBmPzsaDVIMfuwcBUHlCE/ufe5BL/WAdy1u2eypdNBDJuW+zNpoTnlPk9MzOFowtQSi2iF2HPD+p1DDtPwy0m+MwzpcHiblNxKiepGkSQBDMCIXNoYZkFdftdgqelyhCt9xYWKmGXujn0fj4fMDCkYzxZYYIDr1mtCVP+HP00tAdi7TVU8MFxhezb0BDJfeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jA9TzAfqUrRxp8P6/tcc0m8ON2s+ManXGlpk2hx2ncs=;
 b=K3tzODYGL3l3TKPH3A1qyZxepiu9IxcTUBt2ORuCg9Fw9HZhe19fZMBHIxhgYrBYyW/ozzHoelX+z/BdzbA9Ka6Q0TgFcSaqRFonqkK5NU9xAvA98SJb9rx/0MvwcNbKoEnO/hyui0vOew8kpjYZLyLr7jSRrEVOmdIebxJ+CFs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:41 +0000
Message-ID: <87v80f24f3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 006/113] soundwire: intel: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:34:40 +0000
X-ClientProxiedBy: TYCP286CA0078.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 18bb4f58-52d1-4826-f27e-08dcb4e6651b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?g2LLp72OHdvK+YWLb5CFCzJ8WEkjX6yhfGeT3VLyro/pT0QRCHAWOjUcOb1t?=
 =?us-ascii?Q?tp/I9tGNxtV2XxfeMhrmPCloE4PlJShJpiiF9T8Xaon8XJTJr4SRo4Xpa3sA?=
 =?us-ascii?Q?c7Dwbgy8nl8iDorarbGjN/jOB2o47jmvbYy3TXWJAMBuLoqf3H6LkZk8rB3w?=
 =?us-ascii?Q?ajRPYGxB2cyKdmTUiabtp8jJkb4hvaAfIi+GZeW5UAGjIbFU/yfZ24mkqYIN?=
 =?us-ascii?Q?tOjMPkJmxWTwsvmT/I03EqAF9oc9F8/ghkyiwr2DuA5zMo8vNYM/M+IaRN4k?=
 =?us-ascii?Q?pwTzTxCVKMUQh5sGOaJ5WZB+qt0/rd1Gs9RXReprkjK9nrLQTR9B4v7L25ay?=
 =?us-ascii?Q?KdGkThxqDO+Ol1qj6ueaM6PPjadaTjgQu9Bw346FPCMWWsiarQsWPphxYV9S?=
 =?us-ascii?Q?VOrOj9FoZJXxEw2cMJAegt1ZBSWh+gbZQMFC8/kUx3V1q6xRXmGuZBRhgXoH?=
 =?us-ascii?Q?8i13UeRHmGs3iBO4XvJ8cTjvNfcHErpl0R4NJxytmjHUmqnNDOubHM1/ouwy?=
 =?us-ascii?Q?VDPB5KDHbhzOL0CuVcAeOWUyeKCR8UsYwuZiQ3Rd+VAPgH9JISBI3W8KaipY?=
 =?us-ascii?Q?l0L8rGlEJ0LGUMqfzvCLJvHYHOOimFYpxG+i/kvMfSqRB+8rRKX9se3N8Os9?=
 =?us-ascii?Q?b7Jopy7cyw1k6PXINogJfYconRb1rlJCFcrs3CYr+iXv20MO+JBb5mromOdE?=
 =?us-ascii?Q?biLtXpTP7Cxw9mP8YsaSJ/yxuipwL3Txj9h0y88RKhYjurTD7nEeNUwh5S5s?=
 =?us-ascii?Q?7rjv+a/PskWvymHFcwhsz3q/jDB3XqqCp1s224EWXV8OL2pPiq2vACxVbWXq?=
 =?us-ascii?Q?czfZsI2JoL+0f3pKoSNEOcMB4Dd6LPJNd3hoDAnmicP7v7wT8jspA8IXDSzj?=
 =?us-ascii?Q?BiEZ2SQ+jOFNgQTN+x7xXtVGhXX+jzA7pcWd+Dhxw9eqsUfBOya9mdJ05mZz?=
 =?us-ascii?Q?APwF1WYlA1+TDNYMdheo5NUyZaAHCC5uZY1I6EvYpjNmcvbmTgLhzq+px0LF?=
 =?us-ascii?Q?YO8/2TU2QAU7kpGs9YCv4keJ9Thk5/Du9GQtKT3Tut6LFZJbqo1nVz0ufLtf?=
 =?us-ascii?Q?x/LS+Bft/C2DTEstnYI+Q7Yw76MFDqmEiSkNhvTO6upUecVk12Sg0eTncS2B?=
 =?us-ascii?Q?yt3urF1pLHtA9pNOIq8ETtniABz/auk0xvGpi0yOhxM9a1FiZcpD4wa/2ViT?=
 =?us-ascii?Q?sutY/kLLTEBGAAKZ/QmtrtmCHTOhgOkKMI8bwhv0xHj9YubF1SOI0nIPa0sW?=
 =?us-ascii?Q?2qVtC3Y7o3aYohwghUqZXiQ8RoaT46PW0YjDUNubND7IVple/9DRRB4DlmOB?=
 =?us-ascii?Q?F4PPpqMaP41fbwsRl3HQu/BU71+08j8FfLYTkgZMYVBIp01qVM3SK4yGUQo5?=
 =?us-ascii?Q?6mCNi3PmhPsfLpcLowRvz2OBwOZ+tZsEObwCaDVvEkEYIfgw4Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fvMWKfIPCtx1yJ+McZY2gSNVE2IUXnuwcRnKJ5RxvRgUoFERzb3GwfDyaUx3?=
 =?us-ascii?Q?x5UTZ1BbE698T1B2+O1hOjO1ua++LMsNSxUM0RcgNBdE/WNlSKS7uLIDvZYv?=
 =?us-ascii?Q?xKBmUhK0gDibZGlAYnfzbJVqCyXaPiItXfB10yDAfUDigM8hfst254tDfg7z?=
 =?us-ascii?Q?oJCpCBuxv0qZ1yDQdyog4jV3qbYpbgac9VpCY/wTGjf/BeLVyKqjDbxEZ486?=
 =?us-ascii?Q?eVnitOJesmOUoln/voC3/4CuqmODCfFp11zl17u2xAUaRokEpgU+1SgA/2mM?=
 =?us-ascii?Q?dItkClgb3W9zh3uLysQH9wA+r8fKuctePSEM5e+8vqMqLAUB0FvBMuHKweUG?=
 =?us-ascii?Q?+6RUrmxD0kdhaUFVs5aWdy8kWHJt8Dul1VVDJ4zqZbGBs+fug7UkZ+y3upee?=
 =?us-ascii?Q?RdD1AREBoeX71EpGHRBb+fe6VHgu/Iq/1e2vn1TR66RqfYQR1W3NxwN0kcuQ?=
 =?us-ascii?Q?90KIiPvDkSvMks4bO9562Xv2V7tWSZyQfXSazuYTu0LGT3Po9tO3SabPVzWO?=
 =?us-ascii?Q?91Plpl+8Vq4JlNUnKPtZke2OifRaIvJ0TLaq/lUEQkntpDDI4zX2lZAwdg7/?=
 =?us-ascii?Q?MeYRY5wFRr42ge0+oKDH7wiPCr1G9Dlho28B/YlrM8HCTvi7FMhp+67yZuRJ?=
 =?us-ascii?Q?d5Pcy9v1A9TxGLGYP+6koZLdB11XIzbo9OCtqUP7nzq/G8IQkr4w2osbtvvV?=
 =?us-ascii?Q?OukXKvlZXOhdqDORUQd9t+jW3KQBCR/ckv84yGLjPUt4FBdlruiHQozPrreh?=
 =?us-ascii?Q?LSLWQ7tQd/4cHIBr7p9devPPghfcx4cTUs8ztsLDIonV+iLvPwbH9kzytGVS?=
 =?us-ascii?Q?QwGmjxSc9tNREezhWZfuXdV1CEW8Bf/oA0WRXaNmEQB+8Vy1LrGyTpowaCwI?=
 =?us-ascii?Q?1/SYSt6J1LXML3TFEioIqggyk3qbaEiEUV5r449lyCNNOPcLWwzxlFBjUrFk?=
 =?us-ascii?Q?06g4MZq6BN0BGoXA+ArpLIgYWNFO0e4SmH6wh6MwPbWQstuoLosW02DRtRUs?=
 =?us-ascii?Q?Uuj7I7n97OuMjROdtlOBcaSqBJyBIhYPwGjJK2JQQjVJaWJmXE39PFMMKwPF?=
 =?us-ascii?Q?TWcFgQtnRgNkeFTvxYDcdLGWdRZTp1H6e3QUcw2I/xaX5bQLSOeR7Y1DWuAX?=
 =?us-ascii?Q?F4vDH4ygRkF8Vx0hnJRHqh+eHEDfrzm2+C8G3ZOeEE4+6ZEsMwI+Vr4R0XV2?=
 =?us-ascii?Q?S7Db3/mA3NOVp6XPF39UonDzeS5s7AzMnjbWWbUi53Zo6ayuioi0GpP2Z9pG?=
 =?us-ascii?Q?f+ya1Nvunkx4yKIBNHT7a1JtgDX0VOVxBNXokZ4iVqhD/FHol3ivNIy3UL0h?=
 =?us-ascii?Q?1zofZR9icGCdSzHWbjNwgyccjXMNGeqht2WxKPzMxStt1e5J5yjRXVAP2dwn?=
 =?us-ascii?Q?gy51Ve8quF/TYmlRg0UNxf8WFhtnoxrJx++aNIRfJTI3RorGje6a2xBEyskF?=
 =?us-ascii?Q?pPSL4Bz3ZIgeH+274fuNQtj5oDBoqwUERsSCR+7fJ0vTqd0SMCa5fUX1TSnt?=
 =?us-ascii?Q?AXr6uVjSR48KL4kGoC3plExleUmZgk6PHdTSdDUtUCtUebRDC8SdxWeNPZCy?=
 =?us-ascii?Q?zlpjCDxKC9ZrnH9r/Rc8dd+DFBoGIYS1V1IiaoTkxUGleYuQc2NjrOZRFU8W?=
 =?us-ascii?Q?R1fOsQj1wsuSRncWGrkjOg4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 18bb4f58-52d1-4826-f27e-08dcb4e6651b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:41.2478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mtUgCcyc/kSIZRhpz9h1Y41Z3o8/nH5Ant3AhlqKCtIonbRRrcRHXRbIhyH44ZSItum/qN3YNY4mllreKlzBfWnSqLo0uiBEHNYlGgft8/EMGGvfzAcuh9mLw8fW6uPP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: LVGNL3T6MHZU5SAO2LAT5QN3YV5EQ6VJ
X-Message-ID-Hash: LVGNL3T6MHZU5SAO2LAT5QN3YV5EQ6VJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVGNL3T6MHZU5SAO2LAT5QN3YV5EQ6VJ/>
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
 drivers/soundwire/intel.c       | 4 ++--
 drivers/soundwire/intel_ace2x.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index 421da0f86fad6..17bad341f2336 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -734,7 +734,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		return -EIO;
 
 	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		dir = SDW_DATA_DIR_RX;
 	else
 		dir = SDW_DATA_DIR_TX;
@@ -819,7 +819,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 
 		/* configure stream */
 		ch = params_channels(hw_params);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			dir = SDW_DATA_DIR_RX;
 		else
 			dir = SDW_DATA_DIR_TX;
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
index 781fe0aefa68f..b1cc9041ff917 100644
--- a/drivers/soundwire/intel_ace2x.c
+++ b/drivers/soundwire/intel_ace2x.c
@@ -319,7 +319,7 @@ static int intel_hw_params(struct snd_pcm_substream *substream,
 		return -EIO;
 
 	ch = params_channels(params);
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(substream))
 		dir = SDW_DATA_DIR_RX;
 	else
 		dir = SDW_DATA_DIR_TX;
@@ -407,7 +407,7 @@ static int intel_prepare(struct snd_pcm_substream *substream,
 
 		/* configure stream */
 		ch = params_channels(hw_params);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			dir = SDW_DATA_DIR_RX;
 		else
 			dir = SDW_DATA_DIR_TX;
-- 
2.43.0

