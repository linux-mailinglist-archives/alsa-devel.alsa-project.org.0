Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB1A93AB4C
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 04:42:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7125EE8E;
	Wed, 24 Jul 2024 04:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7125EE8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721788931;
	bh=CaYz35U0BrwmCo0iOY5skcYXkbmMfwDHib/aBG/5a3E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cCYFcAhsiKGg7s102eHSoj5rDSPDUMG5fr/FE2zxBf0UuA1qV8QvOAjFAFkyJEx7W
	 YmucoqfK3Q/i8Na3zfBvehhOAYb688/XehPQcoKGI0Ttn8mwkG9RdWJduX025SBJw9
	 xpnO6465rQjiL0VQ6lJ8HWTzBxOYPW6EdZid/v8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA87EF8026D; Wed, 24 Jul 2024 04:41:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 240E6F805AE;
	Wed, 24 Jul 2024 04:41:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DEBFF8007E; Wed, 24 Jul 2024 04:07:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8C0BF8007E
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 04:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C0BF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hpQTYKiy
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pOdwdBkYhI6ye0lGSOyrqeI5xA/HDy0jgzKElXkboCNfRsDnEx2bHb9y6cKdpqlVb/ENfSAnZU/Wlps4VEXn6Q8A05kOol72LBO4+7mXs6fdL0xecMgwfjRM4hv+x1leJ/eB7d8Or0BCXqtOoG9abdZPUlNwQR/o1dETObI8Y0wqYA5fnmjPexMM9kDfvjCQl7ePVXsxaunIfkKEYKkqScIYYBtD9uZa+HOwspAsZb8x7XLro+Wfhe4abUwEaTMqx1VGo70lnf1BJIyJpGpGOEL29WGh2Ex7XrnI+Iu4JdJ8NN2xbHPv69bqLNL/Lp4OOTD//biDcnU5b76YQi8T6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j5aejhi9EUF5c3ufjhP9ssq/Ihfsj+f/SlWVNf6wNVA=;
 b=l+pLWLMQtwKVtcmDgj+QpF1+A7KlZm1mpVgmcaOEnVDRnq/jUa585cVuFubu9d8uoltRSL7gyVYrGZUb4xR76e3RMrBO0rzAA1zuM575mwANFanok9wC5r515cvnDKx7u2Jney6il/SdB15IwGlq+fRgtWQUMHgEPah17iT/KJHMGsef0xka0eqxl20xMp+eFh1kuFcq6ejt0CtWdEEsYr7/o9gU8KrflvUHhihqFhXngXfoGatMqWgtifEel92ONf+6XJ6oT3NBdsesmLYlClBMmSZGVK7LILuWpQ4alcGM56To7Y/db7V6KgpQXT9jckB0gccFkjMkPd4HsftHSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5aejhi9EUF5c3ufjhP9ssq/Ihfsj+f/SlWVNf6wNVA=;
 b=hpQTYKiyyuDnNJ7ocJRyKDUmhAz6lsEAB7shSkjbpg4piZwfdspPzVmd4rN3VLiBucnxSF2DnOaJ6cMSKpy55NcTN6CxJlDWBYBxcAYNjGRvZU7NHucCHSunwBHAqH1NFCtLnDM/kGIk0iKoOpZZz6HKys+PcppmzrLVLv7YhVc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10388.jpnprd01.prod.outlook.com
 (2603:1096:604:1f8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 02:00:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 02:00:11 +0000
Message-ID: <87le1rft1x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 027/112] ALSA: pci: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 02:00:10 +0000
X-ClientProxiedBy: TYCP286CA0183.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: 42939cdb-d55c-4085-0551-08dcab8459ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mzFtLxnA4TgJfItbMeQ1Mz6O5UgrE1xE5R4HAmyfL14OQVW7nE3GnOtM1POt?=
 =?us-ascii?Q?ldRfHh3SKqe+M1XvHdQZC8rwiqioRqNCtdERE1aMsbYqR3CN073OwcNGCeGC?=
 =?us-ascii?Q?rYq1P8Ck6LJKJRsJTuMJGiPbrBFaDAPPsuPnp467GSEU3HE0gtg+WlPFaUMU?=
 =?us-ascii?Q?w2ndN68jQRdI8XZ9jF/k99HUmRrlXpAAA1UWpMS/AuUwwmC1e3DgQlZJHF0W?=
 =?us-ascii?Q?O8g/PYCeerdHA+szQ6Y1BnopD0Fzgd3WKnO+7h5qLzwyNX1IvMANj4TAA1wS?=
 =?us-ascii?Q?QCSewp7im1WO4v9Nbx1onRGPaU2O2OoxefDsGJir6fYShS0GQuBKWXBsKjVV?=
 =?us-ascii?Q?htC31i9cOKothpa/G/zxcr3qw8AClHt5Aa/WnFrivJ+xaGexfsDJoET1DEF8?=
 =?us-ascii?Q?RZClTFC9snFEr26dfGro6IPxr3lYETU/kCCpFf3VUzOgrIquqgX/HXTbs0gv?=
 =?us-ascii?Q?WNIzFZE0T0hATr7KQFjAKt0wwYz49ZaYXF2tn061k1pu8XQ2XqPq+RHXr2ER?=
 =?us-ascii?Q?DFizuvCYH2FKaDg1em/jRlDhgJX2VLJhCPE30KsjNIeUz7ClTvDwBgQD1wiD?=
 =?us-ascii?Q?/oQuoDdkXte1rKqXL5iAtvm+u/vT85CHcwpLNkF3iZKJGAdAD63k9D8kXGJS?=
 =?us-ascii?Q?uh0vSIVpJG6eXNJw5kNZCOmxwf6ROw7tR3NtMf3A988zqc/gs4SPRuk09D11?=
 =?us-ascii?Q?lOqpAUlkn/lb30EdESkS9cn8v3l3h8G4ZhWUBIdaU/zQ/0YCd9tvDJ968pNF?=
 =?us-ascii?Q?YWGahKTetSRtFjwVBs9k8PJr2u12wGEeU1SuCEUhevG7La91kt30fdJ82qc+?=
 =?us-ascii?Q?urrxFHuD5z2bf/2bN0LYetms8YPyduIv1hcT4hQzj6OwAprRxQI4T3k1aJLH?=
 =?us-ascii?Q?1WhZDXvsa8l2VaCUPthTbDrGDAY401aYAcnq+hlgMt1sDGXTFOuQVS5sLptN?=
 =?us-ascii?Q?yVkYmwrACV4O70Lkcmw4RwC3q5J4IBsWja0aVGGnqGwoi5fTup6Ga00XwwSp?=
 =?us-ascii?Q?jfOwkIY9bCg2PMLl6H11ftIATYyxubO2RZqBXvsqFEaPJR1PquRBj0QySRRd?=
 =?us-ascii?Q?RG8sGzAU4hraOmwRUXXxgtXznPFQAsDzgQQiwQ3OgKw14jd5wM8o3jgktZE1?=
 =?us-ascii?Q?jPIhpCjGCaypsJPRkAzCATewDe6rflAxAKjtVZEHWvnFqC+RY0IVRlW4pXvL?=
 =?us-ascii?Q?RWxzItvvGfCQEfBsaqGAxK9eePAdRh7kXAw8KX+U3GHRNVIWxKczwFJKkr6B?=
 =?us-ascii?Q?gqN05g6fb9M2Nw9R8L0NH3W+z9gr+tvCZdMCeXy0GQHOlYPyDNV6DAclGiX7?=
 =?us-ascii?Q?6aZbm+IM55EkMW9CstpW7se901jnDBU7tQXXIm9AVp+ofmJSL0/if4zxhUuq?=
 =?us-ascii?Q?QHGM3P4niW4QFg/iC1Kj+eUj1qOmmbwEbN1XFOcb85E1N+Sd5Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yBSXQ9YHaOcKinHaBTf6lnZriRN0SlV0IMOj6g/w0O0JTrGbWCniekzybNF/?=
 =?us-ascii?Q?ug9AygzZTg76r4VuFONUpOff5axSDFAIDwpWL8v6bFrf01Xysw/JlwOhCDlj?=
 =?us-ascii?Q?mBkhb8DCd4p1AGg5XmYS0uoyO/gJ29GdOFx1HiXIPSTZxio/Pbqe2yatdIcy?=
 =?us-ascii?Q?6WOsREQC6NGPe/PNmDkWpW6hel2Cb+iPLYBITfMNzdvcgo3RUmaTeLz0fHzw?=
 =?us-ascii?Q?jFvWHIZT3mVqdf9RcTWCS+ZEog4ZpGFdktk2e7Wqf4sC8IWleIzDZu/KA27C?=
 =?us-ascii?Q?pYZFhz3Of1czOD6e8s09oMHgJJyVWhNKZBNDIu88o2liZYYZRw1jF2iMTBZq?=
 =?us-ascii?Q?PhCYeetwBlvZtcqFRJMVsRZ7DS5V8ldfjg+zU+xkG9mdPwFnFLxgDKL4Ikkq?=
 =?us-ascii?Q?gR/Xi+dCI49eeSxNs/I+yN7+izIl67Y999kWT3AYjK/GehxXgPtdramhpJk/?=
 =?us-ascii?Q?Ez7tu2yiPDItNLI3PpptDBbBTmyc9gN/DZTP+JCqykcbYzH+rW2zdHtCXKbf?=
 =?us-ascii?Q?P9gSGVdvpvaifGPHiHYWKl55DLGOrSeAekMN3KmQOooRdvNmMezlDyLsP0wt?=
 =?us-ascii?Q?ibJirOtpcgi0LpjL2KHWuEShRaxjWTMRlyRCMCeO6PX88hEgDRyEWtgL/C1v?=
 =?us-ascii?Q?dd4p1YasgRuRq2VjvV1JvMX2IoBoFzRAhEwalmZ41W14G2BZDwPY6MlMMfr8?=
 =?us-ascii?Q?zDS53oD3W8clC/PyofxBR2fZgNzVVz+BhuRYsjOZz9GY81U0OtKhgbInF5up?=
 =?us-ascii?Q?aUOYl4RiMolQTstxNgBb9ssYfl584Mb0MgrZAIJe7pW4aDpMODrVjiQbDR2a?=
 =?us-ascii?Q?V4qZnIHXpabjAtQc77iSdIQntJ3SgnaiF2uWgGO0F0Uj+4j+AMkyf0NNLUnH?=
 =?us-ascii?Q?ulk63LAOZqz3y0Y/Ik2GbCNfriXzwOd18KHNyZo5RMDL4g3abkvkDWk/zBlv?=
 =?us-ascii?Q?B14FR6TRohY+KQ6zbfsZ/HEEOYQQmP4SmcqK/dCGLkJIWL2Mn/ig/gAYG3ls?=
 =?us-ascii?Q?V4tzPolTjAWWmkMd67P97eq5Ka6YIRWF084QdrDMmB9JRc/LXCQxmareqfqg?=
 =?us-ascii?Q?NuG9Vy8lOh4o6CWW5dxUrzmj9PC9uZjNAskDjYJJ06Et0gzDurT1auXok+ow?=
 =?us-ascii?Q?DImv57IXQh2s2IyrjnWZYSM1ehe9J9+/4Ofz8uBn63lJG/s3QOBb2clltFi5?=
 =?us-ascii?Q?IMz7vJYuuQ2OlPqKMZskck5KGOCX4jC1W0TfqBPVr/gu+FWzsmqw++XRXeZW?=
 =?us-ascii?Q?nzaZqxnD2YDfaREMbCWGtPmPdk92iuPb0jX4cOuUFerbdk8LDJpMaWbafQEL?=
 =?us-ascii?Q?AY2NA+00LM8MoAm5bCEx220hsML0tRMtJpq3VouTIycDtvdRd8rdUO+rgMja?=
 =?us-ascii?Q?3MLywjYypfFycBYyf8Wd43uTFYlBLTeVTqxCfse+uQAoBfjHvtRbqZvBK+Re?=
 =?us-ascii?Q?/jVJER7+GbAkGsQRqA+bTLdk1ETSyy4pE3yV2FvXFcmt4n9dBa5LAptTbOao?=
 =?us-ascii?Q?DCFhw68kfUrTdQR2f/q65b2Vo6sWY34lJg9KTCNsijQUImeViyvXTV3ZABcC?=
 =?us-ascii?Q?e45xS39mmgnL5ILCBUBPmwxhfeBmXgtCs/5lG38WVdxZj1dMJnd+kBVAFoZJ?=
 =?us-ascii?Q?IkAjzFzgMwWxu8pZoD/Bcf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 42939cdb-d55c-4085-0551-08dcab8459ba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 02:00:11.0275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 BmTncYD/fF6lv1ZrGY9BKu0GWE8GTavfb7AnH+LNxh5UPbzTuIcLnrCHXu0vnopOdSNvCkoSxjCXwl+vC15s4fCCKAZxH7KDWGVVeO1MJFW3T6YRrgHhrkuE4SBetXTr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
Message-ID-Hash: LHJLZFXVTZX4ANGCCIT5Y64EB4FI4HIU
X-Message-ID-Hash: LHJLZFXVTZX4ANGCCIT5Y64EB4FI4HIU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHJLZFXVTZX4ANGCCIT5Y64EB4FI4HIU/>
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
 sound/pci/intel8x0.c | 2 +-
 sound/pci/maestro3.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index dae3e15ba534d..d9a6a9477bccc 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -838,7 +838,7 @@ static int snd_intel8x0_ali_trigger(struct snd_pcm_substream *substream, int cmd
 		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			/* clear FIFO for synchronization of channels */
 			fifo = igetdword(chip, fiforeg[ichdev->ali_slot / 4]);
 			fifo &= ~(0xff << (ichdev->ali_slot % 4));  
diff --git a/sound/pci/maestro3.c b/sound/pci/maestro3.c
index f4d211970d7ec..28634b2d8e5bd 100644
--- a/sound/pci/maestro3.c
+++ b/sound/pci/maestro3.c
@@ -1130,7 +1130,7 @@ snd_m3_pcm_setup1(struct snd_m3 *chip, struct m3_dma *s, struct snd_pcm_substrea
 	int dsp_in_size, dsp_out_size, dsp_in_buffer, dsp_out_buffer;
 	struct snd_pcm_runtime *runtime = subs->runtime;
 
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs)) {
 		dsp_in_size = MINISRC_IN_BUFFER_SIZE - (0x20 * 2);
 		dsp_out_size = MINISRC_OUT_BUFFER_SIZE - (0x20 * 2);
 	} else {
@@ -1416,7 +1416,7 @@ snd_m3_pcm_prepare(struct snd_pcm_substream *subs)
 
 	snd_m3_pcm_setup1(chip, s, subs);
 
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(subs))
 		snd_m3_playback_setup(chip, s, subs);
 	else
 		snd_m3_capture_setup(chip, s, subs);
@@ -1724,7 +1724,7 @@ snd_m3_substream_open(struct snd_m3 *chip, struct snd_pcm_substream *subs)
 	s->substream = subs;
 
 	/* set list owners */
-	if (subs->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(subs)) {
 		s->index_list[0] = &chip->mixer_list;
 	} else
 		s->index_list[0] = &chip->adc1_list;
-- 
2.43.0

