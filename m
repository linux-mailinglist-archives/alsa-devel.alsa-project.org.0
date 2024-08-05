Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBF394725F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:43:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3163AD4;
	Mon,  5 Aug 2024 02:42:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3163AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818530;
	bh=JwQeLh87k0ZNtRknOiUIThCvZPhfU3EM06MuKtk58XE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IEeh8AqtD1KWLn0d3ICT1bqm0tYDB2T2MDSSxxqPLYKvAuOzAgWLkq56xCjO2bvdu
	 RF+kHnC6xUIMaUieOOhfjbGn7nuWO4oR2xgxyj2UaYEfeoJIH5mAcwPDORFLk8mzfG
	 yJJ7wjG8eZLGumSFU/cARLaMwi9xfw2YofYj5yEE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB212F8075B; Mon,  5 Aug 2024 02:38:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56BB3F80798;
	Mon,  5 Aug 2024 02:38:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 163A7F802DB; Mon,  5 Aug 2024 02:35:28 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 87B4EF800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87B4EF800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Gtnln2sF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehg1XoSvYHTHK/F4R1PDG8elfgnHn56wkio4g1RGNjiwOr1oVOxThIiwhjAOsXd3ToApku29PB5KLB1nUucEwRwetyECVrlMdUDLxWCqc8x21ACUBCwFzpjuxud3B5+uuGIIIEIVVlu124JccIHUYDOmw6ZJOIP4zPNr/MnUMXp+oHYdOfwgqLK48Fi1ts4XP8mgvGNlK1dNZryq/xoxfHUR+pQadKQubCiZG9TrJM0J2oTYjmHwja0tYJkkNfiQQtYh1UuqlP8BAaNmfuN97e8SaXy423R/M+rTd1tZSgauw6LG4KVW2H7xL333os75K0nBvbmOa2PNI6elItXSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ea3L6+QvxQ1xHG0ZXSmOuAoPAivQwWvTxu8sAonKpFY=;
 b=Be6rq9Fd2NwphZ65a0wyGma0mqFRvw1PtY6uyRhcv595XrAjBnINqoVa3MpjxfGQZKlemY5y+gIyhAYJGKoDF02Md4r9mKPVeThjIhjqi/Eev0sVItFHjQTgeqLMNJm/0jfQvPwhzpz0dV7s+24YoiIhnaxTRq/ggAKiusDPr/ByfXNOisQS4yHagszbIPC4xUNSf+7deQmqYLBQN5Zl5BTzjUtbEfo53IbhM61bDI+CD0xWuoX1OqsiXL7xptJHjkFKtN/eT91mtAG9s6FeCRSy8OMlOwrtu16SwIePVNHGC+S2q1JEKsKXK1jpxwxL4FCIyJ1T7rXHP7PRzhW4+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ea3L6+QvxQ1xHG0ZXSmOuAoPAivQwWvTxu8sAonKpFY=;
 b=Gtnln2sFxCVkWpJPU/fh67kFYKKJnwzPAfEtvRjvx3MZQz8IPoiRvyNVOBAPNVWWXP5W5C+/7iC1iZtn9o8JLeGIbfs7g6jA2H2FxUzHmCzSBkmvCdPizw5bI6PFG2PBvw2kc/gzQIy3/CtRdkd7u72ENTEHwiqnZpgcYnb2g+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:19 +0000
Message-ID: <87o76724e2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 011/113] ALSA: arm: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:18 +0000
X-ClientProxiedBy: TYAPR01CA0141.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f04f71c-9cfc-463d-0573-08dcb4e67b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eaBvDsn2rWNShIww+ZmeAKZ+qc24PzHLkD0HCI8BnxPoIh/9pR4+B2bFHZpT?=
 =?us-ascii?Q?pRY4HxBTFJzsDIrTkAhurhkyy2CFHsfMda46PoL0kaJuQ7LrsmZx+eOkX2kI?=
 =?us-ascii?Q?ht5qcNDNW+VU7npRQpLPbFYlk7MiA3Nnakg8lYiAsqeJzJEWmdIilBqSU7Kd?=
 =?us-ascii?Q?Kv0OEbwWvOLE0h0DleamEKNR+uy5xG48yQJMXLgetXQ8xUP+CV+1QKnEhG5P?=
 =?us-ascii?Q?URzTsqDq7EWyni2JHs6211JiwQmvUz9ZXtYJQzFZLLJ8kk9qP3CJGozA3RCd?=
 =?us-ascii?Q?I4zqDosevEkI1xGg9uM/9SZ4iuZbmTM0O8mKh6PMQGV3a/bWvxk3ecqxbQFW?=
 =?us-ascii?Q?ZBUstLuddC6/IBVMbX4VBODFs5g324QVV7m2M58SWwDbFHLHybD6PWU2N2qL?=
 =?us-ascii?Q?iorN6ilF5A0YrNeBnzoROV3JCLCGgMNlR/wjrqMMyRzVAuc6MOgXDxxhe9BV?=
 =?us-ascii?Q?M4ODXcW0gVzAAYPznGNZ0qvH9ptbg0G6VbDxYOCPM0PhOwEHvvHUvLAa7g4P?=
 =?us-ascii?Q?KscKdhhtL0aD9coxoBEBsFje0VY9tB2kqGMQd3s0gNZzdcKIrSGdAIYkr0I2?=
 =?us-ascii?Q?PFHin3b3WMIfgHgrHd7vpfh7rQGlZJV0JugwLyOIIXUBPeNvs7QmDRyId9Sd?=
 =?us-ascii?Q?8qeNd62u8J2mVB0AQO3S8d7YsdmbVJ6OYYV3IvLUJblX84ZA0WcuYnNPfwXc?=
 =?us-ascii?Q?Wp9Q58ZEmrI51QQc0POO3AfN40oXaFDkO9HJGSE+apv2h68SrZB84fezTkKi?=
 =?us-ascii?Q?Rjjl+MTurmy1vrphACvijKNbSQCkkQEz9K1GJRSQfGBk/RcVZB0adkNYsbUr?=
 =?us-ascii?Q?ONdzLHtKY+Zg0FXlRanyOOUtl7wL9Ie6Z+J3Q+5pkFoC3PHI+cbzpr7tLYIe?=
 =?us-ascii?Q?O2XQ3COBwVDG9vUQMN+cX06IJPG0IcCO1yxQXOTZK5ILmCyQgpO0JKqjCx+c?=
 =?us-ascii?Q?LS/Bos1NmC8rGhODEhQ20od70PmAKiM3XRnYmqPbe3ary//NliaUericF2em?=
 =?us-ascii?Q?UCsqr3PqNQIvJmEkVGaWk+m2gd6xLX8wu2eEJQT4wHgLuFRDJWMz4nA1p9gU?=
 =?us-ascii?Q?/7Y6rYqfjiCpvZbElQjwJ0RQLoyvYovvUOU3xvAkUClP5ExO2+Ne2jC7prjI?=
 =?us-ascii?Q?2CsWSHvZvuZR18YpTw312A2SgfqpzqgdyqxZNE47GTBHxSXMO7Tl0rpj99gZ?=
 =?us-ascii?Q?zqZiledSfCUYKyu8YTj3H0esoswnInCOFM2FSbtBK3yL/0uSeppVy6HmQ36I?=
 =?us-ascii?Q?XA95YNXg9OaC+DALJGVpNeoi5mxWsOX7Xqww8JcZ904aTu4pzwmrid+cQ6Sr?=
 =?us-ascii?Q?7Au1oKlJ8baIInTL3lRC74f8JeODjBzQNoIaJm5uBf3JazpT66r8e/VCQzXY?=
 =?us-ascii?Q?4rvvisABnotPF2XWCuaPB8IgoNmHfCDx1cH2D1MrxJOC4FHxuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5LFQl6s4Gh99UsR8ZfikY5tfztW6g4gN5TtP3tkX/ZAJliFMTjRa1P90TdcD?=
 =?us-ascii?Q?ZH7RGHfI0OK36jki+SbANvbX841kOn6xdXOErsGbUJfakTn7SqyFAMhNJNBV?=
 =?us-ascii?Q?4jOI3Sbe3UJiiLorEPI/Rwkg3UfHvPRatg4HY1ABgRV3lILbsXDBDutXNxKz?=
 =?us-ascii?Q?2k3hAnJwzWEfZCqShfs/HQR7XYuOSjULNC0d9G1QOxXSXzsU6iElQH1ohKmd?=
 =?us-ascii?Q?krBJq7p576TC+s3XAyY3zNJuSDfOcejgFNzKEr9E/HQhkylaTr58nymi4A0x?=
 =?us-ascii?Q?4P6FwhOGkmmS2oaZPpldhvVKo06/4D+4R876+HuqU5BgPBB8XrztE2yStIeW?=
 =?us-ascii?Q?vLE9t38l5LUNk+OVujSVjLef0/GxDjPeJRQqTeTQQIVn+wDp0V9Ifac+rfHm?=
 =?us-ascii?Q?Qxvcb9gsUEa0/d2ny5TiiD7QvEYPVeQBmUTMNu9yGfxJP2wkmv9dwNsx04e/?=
 =?us-ascii?Q?vX3SCSHhpeihbv5+s+2JJO3qVt1v1B49MU4NBF5LSei0Ymcm/kO47ARc9K+6?=
 =?us-ascii?Q?xqlYkrrZh/33476aXdGDZQDkccOs+dBQJLBYVEMxS86Dd7dQJzvwMHN8ZDOh?=
 =?us-ascii?Q?xihNscvSnDFD9iaz6fZ9itPQsuaN0f2dU8conaASc/9FmcrgAOg6aGVqrelb?=
 =?us-ascii?Q?KxzgcBcq0v7+lsCyQ3GLhlgTjcihmgiPBWSzJDyki7xuNnfkA5ELeJ3VT7XB?=
 =?us-ascii?Q?tjM7Pgn8klDyT5DwiQ+h5XqHuqMw8OHyzl10XI42kZNd2lblgqp2nrthNsgo?=
 =?us-ascii?Q?1gbgeJv4hd32rmomgIZn65+CflbMnav/N003JsbpOB+pHt1P5k9WnOLb2gS2?=
 =?us-ascii?Q?/la+jhG5IL5aJ0IKfqoPYZOgq/BKfxjdvQ1yET+PlWpgftvvU1U11lOmY0rd?=
 =?us-ascii?Q?WmL5jcbJFiRsY8Y+iUBQxwaeSOlgj9cyFtrvZZ4ZXRLSCej1/b4shKVVvEAJ?=
 =?us-ascii?Q?sr5sLYOSZahLEUWrEhnQS+ajQgmhMQGkG1zqEvOQDBkLG9y7XZKinVH5E5yK?=
 =?us-ascii?Q?SrdDzrrMpe2jQ0XcJaZR46RoMfdHTT3jXvCqFyHYC9HTp9v8wAdcl6DrPFUx?=
 =?us-ascii?Q?5QDEWI8oBxN/VsOaTZdyPiIwsMTytf/1dC4a6g4eBftV08NsTYTFoCW/Z6Pm?=
 =?us-ascii?Q?Wv2osc20X2oZpA0BGzViFnfRzM6D0KHP52gqWNS0gfpbnLCWX0hgPdevbUtr?=
 =?us-ascii?Q?sTcKqMvFdCxnF58hDbAN4NSUfUYJ6+YCeAcGX8Yv2Ii5sUWrM8enN7c5Emjm?=
 =?us-ascii?Q?08Gk9el4PVHS1OFWbAwfUmjlJZZ3KOh/o0ttlxxq7JZBeZKpjcPPzN5tR+tA?=
 =?us-ascii?Q?Kk6suB4+7Azi9qRTxoNsiQ3Nc5I8a7gIx2RX0WkXdXRHM8o9iKizV4qYUTTg?=
 =?us-ascii?Q?i1BniS4ui8DtD7hOYKntO10wvp0oLtwBG9S555ETU+SHxxVLCBkId+/ZTIGt?=
 =?us-ascii?Q?qE+fRw2NlcSZ+Ym08WNm2UL6KF0riKLnjVCNjFVEK/IDa3RSQ6wznN2HT4bT?=
 =?us-ascii?Q?jOrdFnMq4o7Cbmzeq034t1aMMOx0oKI+BhEVQwU/O9F4apCDGIRI4Cm30os+?=
 =?us-ascii?Q?QCefbgjb6eqfVCj913/YdCFLo16FJD9AWWGaUb0AKx2+Lg+q9Li8MoxD5AZd?=
 =?us-ascii?Q?1ANW9HlMebMR+0WyYCn/Mw0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1f04f71c-9cfc-463d-0573-08dcb4e67b94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:18.9645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /F++eu/7fZcjwMvqFHqoQR0KX3M2CRkkkTXfph3PlzppuHNgxPkDPOWRlvQ8gyX0V/Fb8GkdtSG2rxDEBOm03HUkudxuBlITtBpmNv2uUtuWxDgFbulrhR8TFXR0DYQ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: 2AXZSRKODUK24KC5UVMAAQDM2FV7ZLTH
X-Message-ID-Hash: 2AXZSRKODUK24KC5UVMAAQDM2FV7ZLTH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2AXZSRKODUK24KC5UVMAAQDM2FV7ZLTH/>
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
 sound/arm/aaci.c        | 4 ++--
 sound/arm/pxa2xx-ac97.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/arm/aaci.c b/sound/arm/aaci.c
index c3340b8ff3daf..5542c18cf2191 100644
--- a/sound/arm/aaci.c
+++ b/sound/arm/aaci.c
@@ -403,7 +403,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 	struct aaci_runtime *aacirun;
 	int ret = 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		aacirun = &aaci->playback;
 	} else {
 		aacirun = &aaci->capture;
@@ -415,7 +415,7 @@ static int aaci_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw.rates = aacirun->pcm->rates;
 	snd_pcm_limit_hw_rates(runtime);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		runtime->hw.channels_max = 6;
 
 		/* Add rule describing channel dependency. */
diff --git a/sound/arm/pxa2xx-ac97.c b/sound/arm/pxa2xx-ac97.c
index 4c367e73b2c9b..bce0c7ca4b707 100644
--- a/sound/arm/pxa2xx-ac97.c
+++ b/sound/arm/pxa2xx-ac97.c
@@ -71,7 +71,7 @@ static int pxa2xx_ac97_pcm_open(struct snd_pcm_substream *substream)
 	runtime->hw.channels_min = 2;
 	runtime->hw.channels_max = 2;
 
-	i = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	i = (snd_pcm_is_playback(substream)) ?
 		AC97_RATES_FRONT_DAC : AC97_RATES_ADC;
 	runtime->hw.rates = pxa2xx_ac97_ac97->rates[i];
 	snd_pcm_limit_hw_rates(runtime);
@@ -100,7 +100,7 @@ static int pxa2xx_ac97_pcm_close(struct snd_pcm_substream *substream)
 static int pxa2xx_ac97_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	int reg = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	int reg = snd_pcm_is_playback(substream) ?
 		  AC97_PCM_FRONT_DAC_RATE : AC97_PCM_LR_ADC_RATE;
 	int ret;
 
-- 
2.43.0

