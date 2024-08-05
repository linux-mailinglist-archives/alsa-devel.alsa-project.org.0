Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 293419472BE
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:01:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 385074D1F;
	Mon,  5 Aug 2024 02:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 385074D1F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819470;
	bh=A2DFeQzgOPJ8fIwuRwR3jWIDQPuwvVLfj0YNcmFVjf0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D/sSppGQRS/9ra17FSi+Af20EnogSYYUvuRvpnVnX0HauhvkNT0BiQ74gmMoDEi3j
	 xVrXwJEYtxXZV2iromY2rLM243KqOYuhko03mD9oLXi6dMuKv9DpMxDUW7xeQFhIyV
	 QSXPAyEaiKKPSc4nLuEvf4Jui0BU3Bk4keexiuN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9388AF89C3F; Mon,  5 Aug 2024 02:41:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B5FF89C3C;
	Mon,  5 Aug 2024 02:41:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDFF7F806DA; Mon,  5 Aug 2024 02:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C4D1F89B0C
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C4D1F89B0C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YiCqy7x6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JSEddH9Q0BWumYZ64KIdS28CP/j8cgQZUTqMYE0kxygKMcA/WDeolPgJ7zNk2Suf2JKNTXWMeZ7Q5hwilt2G99ss3SL/9/x/uJraGXBoCLiyGOEZ1gkdwmKYGraxbC4/OumZtJJL/CPmwjSh0/19775sTr3PCiQ/L4Z/X/9YqdT0PUXdBz68uegoMXN5TjnpAGA0a2T2OGbcY2xpL+H9utNYomIP2oegCjtYMFBBldJIF5/UQ9P8QONhiOeIBxiTw4DeJQ/IxFSW+b7p53c4wgylACIRJofR1p4WEuAtXPeahhG0btQap/roypwaqawfCJpJaCPfcwD8KuGQ+WkS0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EFmMAJmEu/yqoYFvs64zEs1aRIIgfZmhvAsXUNEJqOs=;
 b=tnthdQUQVizrwK8nT6V65qKPmd0oyeV0iZ61E8T1OHBon4xQC1ufq3Z9AXNLs1Z5JU01Mfz0BCAa5f/Dt+gzaa7LiiR17/6nRQ+WnpGmb4Wv4tYYVwv+pXIuWAvn2lCUADzG0Q7j65G4O4dwcxl7HcAYkHreuGuTUlV429bNEqlFp44NHPRMBFSdJovbhLXEDPoVz4E7nxwpCyRoBnMubdzk8D+WbV4dqhGu4i4e1XsLxxde8VT/kKsJWmT26FvYg+kQuw7mvp2HSOSgoUULibla4NVRw4SJuoGImuSaspE0SPtsp1hb1LbfcbE7U8Y7XiOoyNoVBXLThWqYJCQqRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EFmMAJmEu/yqoYFvs64zEs1aRIIgfZmhvAsXUNEJqOs=;
 b=YiCqy7x6uOGGAJk4qMdGOuJDPBGSKpMpXYgnogwIH1Wx5/+Nl5sMIusYw44EKnShLjo7un52DEXpjMQbag7QZQRaMHXNhQzog8Dwr/2E7KWVXo5ySlACRHt414XzuMiruuNmuyv4xSTUTXcIQ0WVdvS+BZIMwFoZMlxhTcNYzuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:40 +0000
Message-ID: <87ed73yf7c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 068/113] ASoC: cirrus: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:39 +0000
X-ClientProxiedBy: TY2PR06CA0022.apcprd06.prod.outlook.com
 (2603:1096:404:42::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9406a4-ebc0-4885-8318-08dcb4e73aff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wNTSUpfqXtwL2pcf3Ah6WRtzbSb3n5Ub7ngD0RN+GvP8WaT6RfolzOTkhG2J?=
 =?us-ascii?Q?rk0ngDzzYckGB2Z170gNbD9LxJuijUrsto03/fpfzrt62OE3RsMxrr0+H+61?=
 =?us-ascii?Q?NlblRWpIDYqBe64qaVfx+6ClU19JFCp/0tTz2AQleI561kCN9HMAQaiXV2Pl?=
 =?us-ascii?Q?r20UaODvHgUt+HL6wvOvf/qvZRn4/w5CODNeXiAS0L0wDqh6OcDiy/7oOVRC?=
 =?us-ascii?Q?2HihzioG9ZGYGUhLv69p9CIMGLAuPOUykxpBfdCchyWEsNGMU/FR6YfCwcZE?=
 =?us-ascii?Q?3frndkrtSME+f0r1TBofbU7jeppKMAqXmlWB1pqO/iidAA8IGWIPgNfneUbe?=
 =?us-ascii?Q?1e/slZ7F2Dk3vdprwz5bAH1+js893R2G26zcUOCVs+6PYoJza154UTqxLUfN?=
 =?us-ascii?Q?8pnP0ZR/sUB1ELsuuXEwgFQT3BEfUA2+JZpZYvFbDgCxqbOsW9mcB2lGtDCz?=
 =?us-ascii?Q?/htb3uo73gTgjxaPoXx2AOHrTe4sSnyIH9iAo2fzquOFEZUD0Pgyly8fXIHD?=
 =?us-ascii?Q?VyLOAo+gJwc36r7bWeXLVI7HSEeaaCk9AFw/BxHge0iumatp2oXOQ8HvsqaM?=
 =?us-ascii?Q?yWZArBXRkRUboGncCh9ZOUDBSr675Dd/44otJtlcfEGux4Xuc7GvWNni4Q3N?=
 =?us-ascii?Q?+CSDdWUy0yRYCK5vk7unaGbosmQlDKvdP6UJp5kdWWZh3YpC1WPUnPH3o7Fm?=
 =?us-ascii?Q?I/WN6LvTDTwSWbLgSc0dzRnvCQK16Fn0FX68aUEG6hkZRzzZHGW9Bj/WOqkU?=
 =?us-ascii?Q?VY2KF+hzcse/S1MJm9Gumi6itKyIWUYsjYkYDPSodznx7VWzENxv5X12RbMb?=
 =?us-ascii?Q?6wQDaj7ftoT2Ey8Ym/OeEuxvgyijYj5UwfzhYk5STT+ZbilZSewEYV6N70pK?=
 =?us-ascii?Q?1JpWcPpk+ZaS1v29IosbLQ6DXgBaQ5I/vB8wu9A7tGueZdxumuz9mfYzh3xB?=
 =?us-ascii?Q?iHWaOmUOWq9sn6KqOCaLbflrRAdl5Al54r92ZNrqfclQIr91EO8mALci9G1i?=
 =?us-ascii?Q?NTFqaxm2E2qKxrMIH3OAFAS9bR8XAa/rqbLIHHRAIjTEaXVwx7W8QOlSgzAo?=
 =?us-ascii?Q?hUvF5MkyztVQglfP533jfuZh7tEX+UKLvsHCIkQcnvF0E/e+HCiKAMyHv8yU?=
 =?us-ascii?Q?tAPdpgw+uAFF6b7tkhpYWHVB40r1Py9H29gxFg+JpKK9KPb6aQaIBO0uUr4P?=
 =?us-ascii?Q?/MNaJdC0CUSDqD7p+8JDO1JFaKUFoGjjacjc0B3pW5/48hmyx13hfq6qm7/e?=
 =?us-ascii?Q?FeCFngWhHrRc/Q7sCLhW65ju07mf6YoKScHBaWKzcfP01nwmLmoU0JK7j8GA?=
 =?us-ascii?Q?GnQOSA9qjcMTGwm4RnGwB0inwpSX2ZON2zOBXXw9vHJ8KZOIZ7AFq9B2TFYl?=
 =?us-ascii?Q?68uRcUwCCUvTyID5gZsqsgZNiorCwkHds215X/yZXh+8qMwhxw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oxF7VMn/5FjRbjs0XLjKKES+5FjzC2b1CmLputF7dIs8rwCTTk3Baq6nVN7w?=
 =?us-ascii?Q?a83OTt9k7wIK8jMbMFDZRtzcPTfvJFqm5IEubRcri57VJ4WDb2G0K6YRNhg7?=
 =?us-ascii?Q?ndXPqI7aOJhe/ormEpKjijLlfEBIAEXwVcNIbZwl7kVkRPKlYcckWkDXHoYM?=
 =?us-ascii?Q?NxseuGDgyuDg8nfI4rsAmAOtMaXp8hfgL+wqwV068vbUFLpWwQvB6Z3WUENr?=
 =?us-ascii?Q?DrCqp8LSxWdK8xYxSXmH3zVH1qpj4Py/2p92dj8cdKbwqSVdRHAvUbTR6PCc?=
 =?us-ascii?Q?H+GFof/n/NqdXbJ115q+aD2yO7h1u7GUEi+Nr3xESKLT0lCN/WvpaZ9jCUAV?=
 =?us-ascii?Q?ZJ5X1CDsUxVAsWt4O7YELhnicGde7b84PRLVgy57AEUjIN7IHicVXUUFDhy9?=
 =?us-ascii?Q?011bGrfjJ1djg9khQqhjlIx7bQtgCckrrPuz2SsSjBfD0v0G4FrjJGSHR6pQ?=
 =?us-ascii?Q?LBZVJa4bljjt9D285fa1Vbdw4EylDMsQJr2sFbk7F9wvD/HdPArpt36F29eN?=
 =?us-ascii?Q?IzkE8gw3Pv11kgRZik0y6pHtODZSKh/Sa/pCTCGg7zDbQNFf9vpkmG6oVgml?=
 =?us-ascii?Q?QxbBjYwEucplhuqdrY9GDjX9k3CH7V0DhlS+nkC5yv7Owrne9i4FKTkDltIa?=
 =?us-ascii?Q?0q5JX/iQTEgyinzPNNt8VVTdWQHwE6/usSzKnjPwmuH6VKLlcmCtzLS/WIAd?=
 =?us-ascii?Q?Dc8rdlx+do8dptLDkfMIsZFQyJCKji+6+zsJsXg2moy18S5+cmBX2U5XxOHe?=
 =?us-ascii?Q?TS5FXGOyfzTHOJZxPV8guif6zQbvWcYaDhKIJy7IKdUeyiGlSXomN3CESpg7?=
 =?us-ascii?Q?wPcvDK3IQWVA9TV3gbXYJA/DbcTOnUdTa+V8JuX1Z+4qhmXlJrRmzboDFL4F?=
 =?us-ascii?Q?71OaT+wXxn9+cvij67fHfqpZVjE2OOPxZ+1aVabOJiEdTLJe4sUDZr3HjT9o?=
 =?us-ascii?Q?5SO84CxrwIp0yw86I7d1rtP+IfrffanZHvaqYh37YF5drgZz3vTjcIvS0tLE?=
 =?us-ascii?Q?n99vVLyrh4kubA1sb1slk6xvvC9eCGpCLxrc0+Q42pTY7OukX698OUrGAY9W?=
 =?us-ascii?Q?M7v4Emj1ipwU+PPDSGoYupuULyqeiAoyTWU76XFfB6AbTgXVbyF1ZyRIwzjD?=
 =?us-ascii?Q?4HctVKoqBwJhwOV9aCbSWhIMoh8xnD6sNPquxikVGQnhwvevcJkx7KFvq/Es?=
 =?us-ascii?Q?JymbETRQqINRSgHxFa7BXi4OUNEtIB4jknPWC3WH8vreEoVVUSxGCfXC6RE7?=
 =?us-ascii?Q?J7LwkKi6MHaeUIMA+BgewErQrjg0+hEvjQLjJCP5gumjJ/5K9hkFRwfz7roq?=
 =?us-ascii?Q?H86Qri/VmTbLROQHlIDk9Mew60Sxcntf1u4AyieCma4HznicooYuSH+cJCCv?=
 =?us-ascii?Q?mNDFhQyVjAoMW///HI3zC/C9EyQ6x7vENXp1UUCNdKI5NFLCKlalFq7dWrsX?=
 =?us-ascii?Q?RMBU0f/OXoe6NM7MkZVCS6H1Z5B/nNfEQvRZcbrUV1i8h8NWfuRPyGpOE4wB?=
 =?us-ascii?Q?JAMor6CMk4ekwBW+7Z9Qj23Vec292QkndNXK6Cllp0PB/cBkB3xlL3Zdlovl?=
 =?us-ascii?Q?iZd2ax4G8uaVfl7AyDC1Zt+cyvuhNkiUXngrhQJtrOXCWYMP+ujdfaEI4tJP?=
 =?us-ascii?Q?TGue6fM2X/Tz7H1U6WIUY3c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5a9406a4-ebc0-4885-8318-08dcb4e73aff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:40.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zNw/FD8CNg+2wCHJ4LP326fDqjJbpVxJrPX5Slb+OzdrOcEn3f2V1NtRmKc/r7+EFHS8NVOjL52ZBn3zNGxgfKYQQMHl/WDe+QHzkA5A1ZktgHOD22dEgasKaPw8P7tL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: OYXYLN3AORKRL3H66IJRX26R5OCLN4WT
X-Message-ID-Hash: OYXYLN3AORKRL3H66IJRX26R5OCLN4WT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYXYLN3AORKRL3H66IJRX26R5OCLN4WT/>
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
 sound/soc/cirrus/ep93xx-i2s.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 522de4b802939..cb652b273b7e7 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -121,7 +121,7 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 	}
 
 	/* Enable fifo */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		base_reg = EP93XX_I2S_TX0EN;
 	else
 		base_reg = EP93XX_I2S_RX0EN;
@@ -129,7 +129,7 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 
 	/* Enable TX IRQs (FIFO empty or underflow) */
 	if (IS_ENABLED(CONFIG_SND_EP93XX_SOC_I2S_WATCHDOG) &&
-	    stream == SNDRV_PCM_STREAM_PLAYBACK)
+	    snd_pcm_is_playback(stream))
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_TXCTRL,
 				     EP93XX_I2S_TXCTRL_TXEMPTY_LVL |
 				     EP93XX_I2S_TXCTRL_TXUFIE);
@@ -141,11 +141,11 @@ static void ep93xx_i2s_disable(struct ep93xx_i2s_info *info, int stream)
 
 	/* Disable IRQs */
 	if (IS_ENABLED(CONFIG_SND_EP93XX_SOC_I2S_WATCHDOG) &&
-	    stream == SNDRV_PCM_STREAM_PLAYBACK)
+	    snd_pcm_is_playback(stream))
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_TXCTRL, 0);
 
 	/* Disable fifo */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		base_reg = EP93XX_I2S_TX0EN;
 	else
 		base_reg = EP93XX_I2S_RX0EN;
@@ -328,7 +328,7 @@ static int ep93xx_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_TXWRDLEN, word_len);
 	else
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_RXWRDLEN, word_len);
-- 
2.43.0

