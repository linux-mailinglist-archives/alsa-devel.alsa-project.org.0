Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3F69472DA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:08:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB58959DE;
	Mon,  5 Aug 2024 03:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB58959DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819881;
	bh=u6tIJFDkXh1OP5nlFWrzz6DqfeS5FEcmwonep8FKSfE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhctD53cHXZ8x7DPvsNKy0Nh2QrYc6oWF5l/yNISXsc9sef1a4pvS0OFKvB4DVSk/
	 TlXdMVizTxUtP+B/pw6cfTFyCt+3LFAHfY/VYOBS9j/26DC4oXEg868D4fqVWAgjfI
	 4JOH+PiLsJFVHtTRmOJAYxMNcgKuXMguZKJRVZ1c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36F8FF896E8; Mon,  5 Aug 2024 02:43:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5857F89E5B;
	Mon,  5 Aug 2024 02:43:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6725F89E4F; Mon,  5 Aug 2024 02:43:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8EDBDF89E19
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EDBDF89E19
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RJ2imFv1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dz5MS0j7rdYatYNwjr8Z1C8iEmC7ktYkWOzaOsIwcQ1NKVUhnx/crZkDtz9/5sdYIoa1BMr23dXVbkjhKPPyIoKo7m4PVItcR1XhmcHs4SSB3o/SutdYJMLSZd/ES5yVJqVeSctDXl0a+pTG1p9VJOw0bjLvl+Ya4zJCzzP6E8WAPi+We7xLbRG1upzUtD6bw7tPSzllDJfzMHXBpwJrRWPYTTP3Id82oj0xEtUgmzsQ63/Ota3NKbei+MC64PX0Sb55M7m+hXYxkRdpaHX8rPrGhr7vtVCRFYQK7tsiVc/S5BeuU1ReF1Mpg7qkeWDW+IsaKO0E+qac2QWcKOhOqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8dr4G+0sYwrd0WHD2Il3ADwYOpp02ml/lfpQOzekkaU=;
 b=udXeyr0eHrD6jZy2xtVMM9Csn69ew62I5tzNXNdKAFJmB/QpoU+7nXezXkVZS0ixHmdnPn8KSv6ZKeF8we2x+5XaY5JZWvwVnpIHG+qUS96rrXPD56ZJZcS9x6367N/XuuvZbmWtJV5nSuZ0y2Bl0Pj90LXOSCQhf46h5fwVdeAxETgY3PcsIVZESAEYPqvKX8b5XwSUxWVeLZCVIWN5rPOgaVxAuLCOMSc5T/FBD1XJyt4qOXKmpBHqzrSVCZfuuHsaaCnHn9ZIOTM8KRkiIDV/9pnLeLQiJulHsfb3sZx8+Z3N36ayqzA+FgByZLL8iWRybA3a9NaA/K2cAS0ylg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8dr4G+0sYwrd0WHD2Il3ADwYOpp02ml/lfpQOzekkaU=;
 b=RJ2imFv18sSKOTfmvEQcFeuhp+Ut0192rbEE06qt/fUeLzWqLjWxRYRfle+23fEyeAdlFr+rPHNOrep/uRGSkzadepbhZiJHjvuFeiP6FqjGeF4eBXg9o/zheZ6+SC2d42boo+2l8JUM9b4p9u4lWcnhxB4og0Y8xt11EbzvHrw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:20 +0000
Message-ID: <87bk27x0ig.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 095/113] ASoC: codecs: hdac_hda: use
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
Date: Mon, 5 Aug 2024 00:43:19 +0000
X-ClientProxiedBy: TYCP286CA0192.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb16494-a9ad-4362-a830-08dcb4e79a54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7FbEV7a0vP+CI8HI6S7qSdjs7harDfaP6v0AoEcbBLssEKuh/IZQLIP/W+oA?=
 =?us-ascii?Q?9K9YaKj6vMI3qc7zOqMYs5ghhVHrmAI8opjYMVb1ij6rWhJj03tXAhXSxy8O?=
 =?us-ascii?Q?uec0uobSgp8JLPeJAQmdvQFxoHwMcMb1g0Wlf121aQeCLQwaJejZgSj8Tn4B?=
 =?us-ascii?Q?9F9NTTJ0PqA12PydH9lPOV3/QYmZt5fZPIO7Xzg8oW6FWmve85H3RTKxWm6n?=
 =?us-ascii?Q?SXjAgQGzV+IBLcWhgKZlNuSIyPcerN3jKyDphsqv9tAz1kDSITYxaLP4wZ/E?=
 =?us-ascii?Q?ZxC6aw0QkgrjldRo3Vn/RQFsWN1y9/2bVag6YgeqRH4dUr8t6zwy6qRuPAjs?=
 =?us-ascii?Q?x8oPNplLPRy9jgYRGbS8Op6QhXgVNRH3AjTTjq0xUwimLQvTT/4qGhJC5msK?=
 =?us-ascii?Q?y6rCbkthH4oh6iIDt6UWdQKs0eOtZ/5u5dhVs0d4xCy8Fxw1jSKdmbgF0/Ub?=
 =?us-ascii?Q?dMfYrUNPtnxps2CKmBMK/utZI1hOa2a1AReGinWkUS5cAHYyi1I9PoOAejzn?=
 =?us-ascii?Q?SCY61RPh7rmsKhO45Abq0v90NAZOlPw31SmOQyyKCbq89ykqPuE7CA2X3j+T?=
 =?us-ascii?Q?HIWFDIvInRlRoMXo1jqKoNjwGCPNzfNSO7Y/fpne+yJDjbPZhPmze2Wj2gF5?=
 =?us-ascii?Q?IvpuarLTNXNZb5FcsmeKO+ixb/X84JlStQPPIoM4ELWijF+Ffo6Ge/356Vn6?=
 =?us-ascii?Q?Nr1VVC2FFkt5JaoZ2+UOfJBDOPgJL0Xjn0vQhClaEhIdzYObb3rQgZy7ovBM?=
 =?us-ascii?Q?o3F7/N40UWWDR3PR6kENDlvw1RQsai77mtl/FSxH/YaqrDu3A+lzqCCvjcNU?=
 =?us-ascii?Q?36M5Tn1NgKuX6DPmg1sWjK6rNtbK0ypWbU1jj8phiE4TkT6WlWRNxggRZtcr?=
 =?us-ascii?Q?sGVSzaty0o3ocRt1pGVfzhtWLGM4fGX3l75V/8GQnXGTO2asMvaTr5r+Xd9T?=
 =?us-ascii?Q?ih1CbrY9RLu3vrs2TZLkOs1vK1/m2EzkrENa/y02FVpKj/TnDSOKn/qvLE0b?=
 =?us-ascii?Q?tGkBQWIFZWA7ZVQNnRhlel1gsUOpaAhvwt9vio9LEEhLuRz/ILuEj5IoDN2g?=
 =?us-ascii?Q?l5md7H5q/EC576Luonip3jaybP/4Mm0iQ7uFKFPVSJW6PKcolUEocEL2s+xI?=
 =?us-ascii?Q?6vyxO8WtIzjJl6xtzQTmywIW8UXy9Ug8HgUHsQRMLjRAOwpiavUVPoacRPmO?=
 =?us-ascii?Q?q3T3rh9StPuL63nbZlfxSNU1kgzVyH6RJufC5xApwnRPGAn1buY9lM0Z6Rc8?=
 =?us-ascii?Q?pomuXP8GcZK4NK0JUXsxyCeONJeaQ64WiFyJZnzJGL5zZtUxm27Zza/uCgCq?=
 =?us-ascii?Q?H45Atog8lmU7b5348bteeCeWFn667grMYv94mVyHiBWuD2mvoPmjqPKi98jH?=
 =?us-ascii?Q?Uzrsw3IM79LEktDNRZXpAAO4ifF6dDoBxdlPa5wGPgQPJygAeg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9e2QWo/jkArR27pmUzTni7ZgzDkjdeWccLisBV8e7gxSuADEt0iXg1buQVMY?=
 =?us-ascii?Q?qIc+s7q8fFroo6/Rkl/1O/jK5GXS+vfrNbHNYxTuUrj427rGDuAQQo1zoik4?=
 =?us-ascii?Q?0/7LU50seNSgO7Bq+FgRtSqFSaGqg1zWKHk83Ay/j8KYB4mHwBOJ9zGHtoeY?=
 =?us-ascii?Q?Ah9ZPH5wJxwTdvxuoXBSsN2OduEde6A+LhR4zUPO3hSaRde8XcJUc2GtIHbh?=
 =?us-ascii?Q?doPwIioSwLPy6k2eH/4kWIZLff+fuuFFWcQUtuhIpfwNSKq0okhkZvAobeki?=
 =?us-ascii?Q?molgShbzYg18qgpYa11saLQK+A571u5+mJGBg3cAoxJ5N3bTyDwQILAGRzeA?=
 =?us-ascii?Q?bYYEI5rA+64Z4O09d0w/Ivcj0Fyb9q0ysEiTYrQFCK92h+EFZx1M0EZYj2Wc?=
 =?us-ascii?Q?8rbbG1FHeFH+k0nFnWLv6RRP+43mf9B4PzOh+d+a0OgABVlHNUXeMv6sF5rd?=
 =?us-ascii?Q?2fcW4xpKGqgHotRtJMPlJahb6MfWDhJXjNMnOL2yyZn/jtQR3SvmeDqtGMcY?=
 =?us-ascii?Q?P3NMm5MSfH5vGU2CGpcnlWaqVAb4FFgjpqOKSJ/cqTlBAnuJkNJkXSD1Eapx?=
 =?us-ascii?Q?hkKO8H0lxP8uioLh+nAHM7+JHSUu/fc+vIRCtvPgRHSTf4P/BMQw/+k9R1+5?=
 =?us-ascii?Q?S6opNRj5A+IsCxPreBV/zgffgT/sdMxYQatea4hAPVZTrKr2OuLP35CeNNcc?=
 =?us-ascii?Q?pd+g+tg06jeKTjQGFeS+fyrXjVKjl5Y3NG9bS+M8rwr7ZqlyYDlJ2M9BTLF/?=
 =?us-ascii?Q?lL1EfoYwzisGhTAbj9dU67RYLf0KJUo6gurREHtsOpexeUzrC4CRkZOgAGCu?=
 =?us-ascii?Q?EL+yVRExvgX0fxy54ZscGMhE3+XNz1IVrhVHofSYf2YTY9yP9PsGGQwe7QLA?=
 =?us-ascii?Q?Be8VsIr+CKfwodlQJ0FZSHJogrmmQOuEdE6yykUpYBZqZDnP3SfHan22JQaF?=
 =?us-ascii?Q?inzjrpYhWccKxJvLhRR3tx+1x6hyfGXTw239mt0qFRjp948FGVPH0Md7Kk7n?=
 =?us-ascii?Q?L1Ep1t+eEl4AQKFxWpKQ2E5il5VtCs/cbxit0mHC6hGLSw0o5nkZfKOuEIwA?=
 =?us-ascii?Q?msHm2P5Snrq24E5Sp7G01FxiNde5UhCdfhAj5tk/fPR2yuLU3huxGi/34LCc?=
 =?us-ascii?Q?1eMO46j0uGhLzSClE5Sg9ZaSnl6NMR5telmtlsXrKRkfN35cJwKHrNVLdV6S?=
 =?us-ascii?Q?FXuzVuzBcWi+wG11lDv53IIxv9KqcLQB5bWBJLBK7a7tDYw1Ab5RhymiYJg/?=
 =?us-ascii?Q?GqTX7cAQ4eJe1hrXBBrI+E//+0Gz3e/dhTmmaDLwXTIkCXR7mjk5qKyyCM8y?=
 =?us-ascii?Q?2uUoy2xb4Ynw0XhlxCTtYGBuB1L8AN+RwYI7QVHPwMlrjNz2cdVJIwQ4QRZf?=
 =?us-ascii?Q?drUaQrpAtyZJYOCJgxLz6P64VgyJ7cOp1dlAJdYqX8xFcZRB4ho+DmTggo82?=
 =?us-ascii?Q?pVsEmIa7pGqtISNUyOM5/7elJY4NZSRdy3hkHFTTsO85Id8x1H5Scx3+MFoc?=
 =?us-ascii?Q?8o+LSk63o4dUPerABt1LUXL2HLzZlPU0L8RED2ypxBuC6sM0VaQGFhHhPKvg?=
 =?us-ascii?Q?cNuVsn/SsxaCVJfm/Prf/zg3HcACu5kjF8/C3UUNGhwZpF7X0TGT+T6Kdpx5?=
 =?us-ascii?Q?D9htzc1D/pa7xlBwCYgNBgk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0fb16494-a9ad-4362-a830-08dcb4e79a54
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:20.0214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CeO3AnC7Jl/Z0XEHtg+30lijfdALLLAlvo4aYg4jn+bY+v6F2BFMcLZOOD7vE+eselYRlV07bWRF+QZQ/Cuus67jla6QX4OW4qSn5FKMwSBgzd3zb9azu0TILobKkJ7k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: RZWDAAMLEW5Z4ALQC6XEIJQFCVFSNY3Z
X-Message-ID-Hash: RZWDAAMLEW5Z4ALQC6XEIJQFCVFSNY3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RZWDAAMLEW5Z4ALQC6XEIJQFCVFSNY3Z/>
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
 sound/soc/codecs/hdac_hda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 29c88de5508b8..d5b72afd82709 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -220,7 +220,7 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	unsigned int maxbps;
 	unsigned int bits;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		maxbps = dai->driver->playback.sig_bits;
 	else
 		maxbps = dai->driver->capture.sig_bits;
-- 
2.43.0

