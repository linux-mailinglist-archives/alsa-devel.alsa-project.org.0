Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D869472E9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:12:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF9E4BAA;
	Mon,  5 Aug 2024 03:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF9E4BAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820062;
	bh=D8BpZn3x8VRsEcVVXQrMjzMFl2E1oOXNqsu0aFfDGXA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nipGCQvEyLRFVeWyZB8O3bY87nPHEp+HTBSl9XK9SCgty3zjo89/VMxhachEAuUyF
	 crQcYLvu31i1AeyeaYtOwPAXNl/PHs9+HIElCzF7dnOSactE2Kj12MyNO1frYCQ5vB
	 CaWSyxujhXPbv0Thdptt5xEPutGfZkleRPELOGiY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09D18F80C8F; Mon,  5 Aug 2024 02:44:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A195AF89F59;
	Mon,  5 Aug 2024 02:44:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1222F89728; Mon,  5 Aug 2024 02:44:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 79A26F805D7
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79A26F805D7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=B3jJqSBV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xibJcTNciPaN9ULQx0x22gY1iC3PWud5zKHkviQ4hCQYuKVIihlmvZm9VNlBLqZQz0LekR2g56Q0y3sHV81XXcjSie/fNHvvWnUCl2AT11dHpwHCODtngx1g5nCKXKyq6DmOfI5YFvZLC04sz8byW8fv5dMuU8v24sgAObqtZQCa55NHmRiItqfFB5uFcVHZAHrzTMe8fCRBLlw5Aw/F7AJKMyJdsOZ8A9m1NsnDyiZnCACuq0ZrXiztsn2zcl38W6gaVuTufTQ1QzT676Pu4eNGVVGg9vhGEeui7Hj1pGGWlNuNCUJE13NCW5A7cJtl2Za9oDC6qnUz5Q1l1JCfeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHw1WLibZN/L50QnInpxqE7BExor7mE9XBYyT4WZzPI=;
 b=qSBqHmcB+9OidArbQFObKnkzqoCvi0E70MzEgVxQOvVn8a2rivCormBX3Xv+svOaRTujqNC0wirS8ATFGgh8XAXVQbu82iFsTu9kRivOLYL5oHEFfL+A5NKltq+Q54WKw57h8zGiWauDrHq5Jk4qA3mgYRjH0mHiUmSEJITNM1xbCW6FjhUz3ESaYoZE49+clhdMo4YXDHyeknZRiY3CeLR6+pbJvpDrUOfDQcRUuAbV1Mfoa4Cz/Q3ytOktpVPotPAsS25Qi4A3gjC9aIgyPb74K/xVoMrS22cr4zHjyQBUTZvmk3Vo9cfr6UimEuTey1NIHhxujxlV4cTOm8Qbnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHw1WLibZN/L50QnInpxqE7BExor7mE9XBYyT4WZzPI=;
 b=B3jJqSBVIK6z3hHcsXGf5KbYCNVu4RFnXWz5E920kCLPz2LyESO8yzFglieds9AkX3W3uMvOE0T7sWt6VDhpbc6LLCvDWUfJeV4vzI92bm45lVWIVaSL7E4KWl3qWAElmApUjkcgZtqVYY8Y8mesXqeKBH2uK1nq0B7Q5Bqt8nI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:06 +0000
Message-ID: <87v80fvlwq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 106/113] ASoC: kirkwood: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:06 +0000
X-ClientProxiedBy: TYCPR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:4::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 27809676-bba0-47da-8ae5-08dcb4e7b5ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Mfzt7vEu3n+aMRvJ5BQu3avaNeZUzaBJhu9iJ8hCd7XPlN+FBFS67KS3xJ5L?=
 =?us-ascii?Q?I50GqZo6nL68038ikfFcvcNH1kybWMARFOjw/hlYc4Rv77ijnU5OCwI5hla3?=
 =?us-ascii?Q?0Gv0RV8zgQmDCDyDc2H2aecW5R2580wOYOdypX01l3cf+69pfGYT6h9ssCaP?=
 =?us-ascii?Q?pQ6WDSUbbjWa7z9NaFstxiLSx9WZVZfxMbVYsUpTmqkIuX9KwJXtFdM0H0Q2?=
 =?us-ascii?Q?FZK4twtsL2Ohn5qmBH4KZaUTgJbTpXb6u4ChT2QYeNc1GkjojDCbCVMN2ncc?=
 =?us-ascii?Q?1jU8qDjeyWBj6SYQ8VfT8US2Y542dS2azo/tiGLxyHRp7eZpqVSm7lLgbhHO?=
 =?us-ascii?Q?TjGguKqo2iiQ/ldp9ktw32lRI0jmxiB5xhpwxhq0LamFLOIQMGqNHC2A6fcW?=
 =?us-ascii?Q?X6Ifeh15jX/2XeAacF4aji+hv1ljtVNfMHJZAAa7H4dtahGhtjX1OQIRAa5U?=
 =?us-ascii?Q?jpxwzDxPXs/VXL3JbM/R3DM8v0s07HccgtDAFPp6ijic270Dvdf0RoYGUf9r?=
 =?us-ascii?Q?7x5M6p8rktyMhC16+RDVozZpU4jPRc/tkeMJiHVP+S47tGcmjG7Qo/VLAW6s?=
 =?us-ascii?Q?oBlakY6e9rUmwGXJP6hqMsxAkRZX9yAmfMCZUpbjc0Ht51b1TlmVXqBhX8Pp?=
 =?us-ascii?Q?jDIX8/lxTTgGiqU8ozkTKXEwgJ8A4ss/BpLYjTmJ4mK9w9wxU/EuAQFXtWgL?=
 =?us-ascii?Q?s7uUTAn/2yf8adv9jspSqQASgEtdO9sA2nDU7mZy2S+u9bCuozBf+mDFuNT7?=
 =?us-ascii?Q?BOgX9thffmQBBE9vqXtySONfXrNL8APotIBhLh/JNOzgaQ0y2fkWkGhnG/cr?=
 =?us-ascii?Q?NPWWUzlE7XKPgp6DTMCqNIfX3hKd/AMcVTAfOBWWbdIvszEO9EuVtN9DDW3n?=
 =?us-ascii?Q?D8jBmc/awzVVce9tJiZOjoWhq7qBr5lMZ7MJcdTCrI2KWO0FlwsppSctMH9u?=
 =?us-ascii?Q?adMiwkHwRAVp4MmzZ6D4gbysXp7w7PkG7Jfu8LCFfGmVEGi9jZmtg9YqOS6j?=
 =?us-ascii?Q?RSEbv0IF2YjPZbedlHey6gT/+qU8phPlSkvWTjFzXbovKrtDUcko1i0rYHjI?=
 =?us-ascii?Q?psuZ1YNOMVGRGAYknttNYHrBX7q6CETN5zrRc88km6rsouFmqQ7JAa0aQmEv?=
 =?us-ascii?Q?V6OEjOSuSrL/9ZBj2xy099wcJmoUJjsZmHL/wz8Jhght32VUw5BX8hZytVpn?=
 =?us-ascii?Q?eZMJz6V3wzo9p3GU3sBVu8zyrI43S1va7yIh71zNPEIipCRoo/93hjBQA0y3?=
 =?us-ascii?Q?IobAQ+laiBYPHONjCf0y74g+jBMwprwYqgv4GuVT+1IAqGs08mgqcqr5Gkaa?=
 =?us-ascii?Q?io/6lXlV6rd8/nfOgPLnsa8lrjjAktYtQU2CuEX/FKozdEvFJkNNEC1hRdD9?=
 =?us-ascii?Q?YtGZGOfasYV5RIrndX1gZgfbB/+6NjMWEsLQN7XivApzCORxmw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2y4nwKv+QoPT5OY1pcJdrNLrMqiaulPHQY1CtW+mpLsqnGiWdQLY4vgpRgdP?=
 =?us-ascii?Q?TPEJWxygLeo2XbTYvmVrwawG29k9c/X3B5rdT5ga85rI5RVsuvA5E5cAzS0I?=
 =?us-ascii?Q?u7Q86iBoCEKX9ovacobkuXQKPA0KRfHJX0eX4EKlJo1V6DsnnBrovu+twRxT?=
 =?us-ascii?Q?fB01Q1J3BATfUYu8k+ba6nnK5hcrp/thC3L8MaSkdzVH2Z+0oNos+2+lUR9V?=
 =?us-ascii?Q?aih2a/t+hjJnwj8IU2oJIPVjnETGwEiTxIWTdV+0cMKvKgPizXmPqY/mdFAO?=
 =?us-ascii?Q?uvEcUB+r49ojjXQkvZyr1TTBhPT6cidKK3xbWDK1KyW1MTzSRE1AhZTitnXs?=
 =?us-ascii?Q?Qu5caLt7pboS2oNuAdGnPJA+4keW72Bor03zTDsG+jUYPE/QBs8vRETLSzxW?=
 =?us-ascii?Q?aTf5HZ1NBmKk7ybMa2PM2/t+pPbVFAT8iBg5DKdQGOSoIuKZPRKe2Cx9KCDJ?=
 =?us-ascii?Q?bkowlwyxUsHk/XTcShSC61bis4MAWEzOeDgDT+WJ+iYXrhadG7Erl/8FXh8X?=
 =?us-ascii?Q?tiGOJVW0fqTiww8tlewMOiiS3pksayH2HzWb7+80JiJae1gwk93gphiaoFOm?=
 =?us-ascii?Q?hGAdKadsJYBuJxSO0M4jnwNP5kUKeoS024vkgy1bGvPpgnvxOxlDmBoamj57?=
 =?us-ascii?Q?/9EyGMUZo9B8MhvYmBnrQiGPazQM6Tl2fG2J7r81wOlT0AzhG4FrbW2QlFTT?=
 =?us-ascii?Q?UCPERKKoVCLFDAnKkeNziK5gRAZihEmQIvvx4kgirknRrFwid1biCkiVnO1h?=
 =?us-ascii?Q?4VHqRgUYZxSCWmfsB509i+E9mi14sqAaqxGB/YnUUxe0bHJgjY0IaeY4oKmM?=
 =?us-ascii?Q?qFX67goljWm1n2PAxSDNRDbHgSPlxQofPzHjA0CDMpTz1fnVvbpE1+uDqbfO?=
 =?us-ascii?Q?F5I/xabAKzBaOtitEkPzrprzSHbO4+KMacEA5JI7EFRX0/0Z6aX0KWCRJwYJ?=
 =?us-ascii?Q?joxBDvVFlm4U7dqSsDT6Ymvp0othdh8NsYkpzhPcsynXrlnOqlGax+YgaiSf?=
 =?us-ascii?Q?Q0YFiyZjVBsBrA4ds0xIF6voz0qQ1RXsGjqEAC2HEwxgoXbXMs8HQADMviGk?=
 =?us-ascii?Q?pLBur9EfLLH7KZqaVa7HMBOKx004cVEoYkQzF3RV1rtINHmZW7wXsMEI91Tz?=
 =?us-ascii?Q?HwYTaP/JsakDR9AsQpEWBQU9goU06CDaXlKwrtWPyBPIlo5BbiUtha9R0zUp?=
 =?us-ascii?Q?Kv+OdYI95UqOl5YSp6APZO+fH4awp+xz08Ry0yRGEo2d0fWQHXTBTK7/DcaK?=
 =?us-ascii?Q?6xsXKyS9LcvvIN7pQAcxLnfBtZ9uqhRoIiK+jBte3NhZv4sZ7XLQdTHgqSzP?=
 =?us-ascii?Q?P1fC2PoogS9c2NRK3BF6m3eu7KFNDk1+ib63u1OeubD/JYnq933aaFfbZVb8?=
 =?us-ascii?Q?E0N+qkeRyyXeDH26NvJffciEggIybumDndoc4DdgaKHk3nVRXCz1+k5Lg5OK?=
 =?us-ascii?Q?bBSdi3oYoTW3qBYTTw3qQLzPnhMThLKJ9Ih8ejGAU6T8HxywikrWwmK8LW5F?=
 =?us-ascii?Q?hb6jOjPHOca1IVcmcPyc1FTXUt/PxrHiNCt/j2zJhiuPPprUGjxPVrJf0U2l?=
 =?us-ascii?Q?yOw2euw5Ualax7sFjQDU072yiNxGvkJvCsAPXGvX8W+dmmlhVMWn8CJ4LX7N?=
 =?us-ascii?Q?ewPc6762zkVmDyzinExt4ag=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 27809676-bba0-47da-8ae5-08dcb4e7b5ea
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:06.3034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ov4GVVYB+9mK5edwXt0hr3DVHJyILjOcMuI4854pQD/sFPYSPYtSMjXsCHvmk00Pslt/GLvITfZq1VKO/Lr6sxO8jEARQgm7j7Cbc2c1YlOuCvIKasobOZabHXZwK+sP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
Message-ID-Hash: U4UOCSIEWFG4P2WD5WIEMWPEFHG2PHRT
X-Message-ID-Hash: U4UOCSIEWFG4P2WD5WIEMWPEFHG2PHRT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4UOCSIEWFG4P2WD5WIEMWPEFHG2PHRT/>
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
 sound/soc/kirkwood/kirkwood-dma.c | 10 +++++-----
 sound/soc/kirkwood/kirkwood-i2s.c |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index 036b42058272f..1a3749b50d0be 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -140,7 +140,7 @@ static int kirkwood_dma_open(struct snd_soc_component *component,
 		writel((unsigned int)-1, priv->io + KIRKWOOD_ERR_MASK);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (priv->substream_play)
 			return -EBUSY;
 		priv->substream_play = substream;
@@ -161,7 +161,7 @@ static int kirkwood_dma_close(struct snd_soc_component *component,
 	if (!priv)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		priv->substream_play = NULL;
 	else
 		priv->substream_rec = NULL;
@@ -185,7 +185,7 @@ static int kirkwood_dma_hw_params(struct snd_soc_component *component,
 	if (!dram)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		kirkwood_dma_conf_mbus_windows(priv->io,
 			KIRKWOOD_PLAYBACK_WIN, addr, dram);
 	else
@@ -206,7 +206,7 @@ static int kirkwood_dma_prepare(struct snd_soc_component *component,
 	size = (size>>2)-1;
 	count = snd_pcm_lib_period_bytes(substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		writel(count, priv->io + KIRKWOOD_PLAY_BYTE_INT_COUNT);
 		writel(runtime->dma_addr, priv->io + KIRKWOOD_PLAY_BUF_ADDR);
 		writel(size, priv->io + KIRKWOOD_PLAY_BUF_SIZE);
@@ -227,7 +227,7 @@ static snd_pcm_uframes_t kirkwood_dma_pointer(
 	struct kirkwood_dma_data *priv = kirkwood_priv(substream);
 	snd_pcm_uframes_t count;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		count = bytes_to_frames(substream->runtime,
 			readl(priv->io + KIRKWOOD_PLAY_BYTE_COUNT));
 	else
diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index d1eb90310afa2..5d43924bc1caf 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -258,7 +258,7 @@ static int kirkwood_i2s_hw_params(struct snd_pcm_substream *substream,
 	unsigned int i2s_reg;
 	unsigned long i2s_value;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		i2s_reg = KIRKWOOD_I2S_PLAYCTL;
 	} else {
 		i2s_reg = KIRKWOOD_I2S_RECCTL;
@@ -314,7 +314,7 @@ static int kirkwood_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (params_channels(params) == 1)
 			ctl_play |= KIRKWOOD_PLAYCTL_MONO_BOTH;
 		else
@@ -501,7 +501,7 @@ static int kirkwood_i2s_rec_trigger(struct snd_pcm_substream *substream,
 static int kirkwood_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return kirkwood_i2s_play_trigger(substream, cmd, dai);
 	else
 		return kirkwood_i2s_rec_trigger(substream, cmd, dai);
-- 
2.43.0

