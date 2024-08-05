Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FC79472BA
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:00:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C5582DE3;
	Mon,  5 Aug 2024 02:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C5582DE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819401;
	bh=w4POZFC8qzCasyoyfYf3hhQyxmo2cgU4bohFHq6IT5w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qg3pR/WJ4dAUHf8pz68czGO72yfPU4z1mIs4bF74Ahk965DbObuUnz1BsHMS52a/A
	 471KXRxsDtghgla+deyL2B8cTo1IYaBVqlFlLuj+eQ+VV4hV8vpOOvm1y5vD+nEktl
	 7+Tn1TtICyzcU7a/IiyPEuIH+TY+VYMhYT0+07EQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38A0AF806AF; Mon,  5 Aug 2024 02:41:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9592EF89BB8;
	Mon,  5 Aug 2024 02:41:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD14DF80673; Mon,  5 Aug 2024 02:40:43 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 89606F89A8E
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89606F89A8E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=F7vE0YF1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+RFLlhGwVMLN2h4Onx88gqsk5Sed6WLPuepHHHwNZpzIO7eJXTa+HiHl5rBjKWVppIF7uDMw4xSva90xPa1hacIae4MqxnB2cbbyx8RDO0A/f+oMLOPwoCkUNxx8Ynh6nIIIXUPhOQeNzetXYmHTnTtjBMCPQ+22Gg1Jk/isEKyKHJUWzxEnXqxV3doNHHLm10bBOpyBFqmJZzn3ziDC975BMu8ryge12ze00JyxnuIiUdAFH2XA8BNyGCWxKwNsHo/bxE5tIyFc4YuY8RR/yETrBr7wttBP6EsgyLqO1bM387EhxVnPxFwepS63FbMSso5L0S6WyoHQVCO0uKeBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HvUe/NFKSULjc/2Zipssjdlc2fWORF+gcJjjGqjJb8=;
 b=uLbpIyelGBhDTPYDRDheRiRHgWu+dpCW7NqPxJ56/Tmj2AGUKplx5HOtmrfT8NBlf19CuQrh8grV+ZZ1a16y9jFpUaULcRgvLMLMFJH0klmPbV0UhtU7Ov5oGsqGeOIA196OefGFUGeXREjBKoe7n2rYbwtxJLATNOwrEh4bVPHXqDezobjJdKQJNQdJHBNP6dXRB62yB2edNeSmiCn22lD1Jy6OJ76CA5S3xyFJvT3hDCuuc/NxBw1gaQNua0PP53WiV1n+gFWgh/ovfbFxvjgJG0ijDx7j+njRup1oUt3qpQOXNRxS0d9qxTIcfnYq/pd8nlvMTNzlkR1RLIc70A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6HvUe/NFKSULjc/2Zipssjdlc2fWORF+gcJjjGqjJb8=;
 b=F7vE0YF1Ov8+D+uNUf1NsiXUnrGh7q3CM0oH6eEf44zMxXyyDaFm3zB5CQ9JhDY9mziU55eoYYLS1mzeXWAZYQrwqjdM0KFlMuuRUxTmJzxKnzzPMbxwxAOcB+RS6cGZvKeIic82VkqQDbxELlHMDJoN8hBfSC8mfW6gn0EdppU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:27 +0000
Message-ID: <87ikwfyf7p.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 065/113] ASoC: sunxi: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:26 +0000
X-ClientProxiedBy: TYCP286CA0358.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 87160f72-7a33-4688-7048-08dcb4e732ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+RBiRCky5A4H5LRKyAeDNkYDBEAyxyK597MQ6HSdI2r+hrDpinMgmSY8UjZF?=
 =?us-ascii?Q?QAHtSk02Ml1ZMnfBMidD57OmTqGtbZ1IFCHH+NFlZdtoHQa7ewh+mmUVGdp6?=
 =?us-ascii?Q?EU+JLhWk+YSPT/elo5rbsERWR5fDFEPH2yJfi1e31dOKYoU/GKPSsh2H3lo3?=
 =?us-ascii?Q?bKsfuZubp4FgYH0nSBPXJeuk5jiD2cK3pj9/MjieFImFuQ7ZA2bUnSo6mviA?=
 =?us-ascii?Q?RW54QUIS+2jhdvJXHauzW+waZBPysAdmBaD9iui1E6anJ6yO7dG6essmAqv9?=
 =?us-ascii?Q?Y9DWiakCCxo2l9iQK9BfeIIeziD9J1ixz+7Uzn2Fhg3LLSt0IY9BRlHt1xfG?=
 =?us-ascii?Q?BtB0QQc1igAnNVJBjbx15dK93293j8R3YYUK2Ljik+Hh2nfgxy/jpG/1g7KF?=
 =?us-ascii?Q?E7+QbfQKK7rZLIlWKUMeUYC5KYrSKSUY3S/PBU73xTCwSPczAg7SMe2QbQ8O?=
 =?us-ascii?Q?v2wgdm5rYolVSzQY11JMjumaoUuasFpFeNvtHtjjGQMBuZ2DhoC1bMIflQaQ?=
 =?us-ascii?Q?dO9Ud5oJ0eq77akKYBmkoOJNvMSw/A2YPHG6b/nSF3QfOKypUI+rZ+EFPesf?=
 =?us-ascii?Q?Z00eSXWMth7mutmOcDrdA7PInUa90K05pGIdUd0QLX4XvyLfTAyIrIBi6fSS?=
 =?us-ascii?Q?1dO9RwBEQXnGnRWaVubcyjhv1Eh6b3DkudTf5f/sY32vXyt/UZGTQWjksCYI?=
 =?us-ascii?Q?RBPdRTEHMNf2sMiamzbU9JoiKE19y9AnkmD4sB6gWR3saANJfzoamaKe86UB?=
 =?us-ascii?Q?1RUSZVUPZKOjKJ89W8TA3cAtgvoGtnEi6U2rb8Fb/X1xdpsObEP5H1PcdA9z?=
 =?us-ascii?Q?VKqXcX33bjn+t1le8UNR15pNgtFA+H3yFwN/41okbWrdFmiVdr9XxxtWeqpX?=
 =?us-ascii?Q?VHMIff4frEyMazbsVfIX8+fGC/YbDRR5Sv9I5YAw+W5lRYsRX9GBoFqO3ZeP?=
 =?us-ascii?Q?+FAZw6SDbNiDhJ8fnN2Zy3ZkCczojkHYZ0parXDGYtvbE75ZGKSdHn/efL4a?=
 =?us-ascii?Q?4GW6MKF3akTYMKGF0GxniqVzPfKuq5YqxYmn4L8H9aUQWlgi0jft1p1rIN6I?=
 =?us-ascii?Q?dO5/o3m5iJI2C41n3eVKhFW/i2fz9Ym8fMkQ2bjOaWCO/AF73xUu9n/rI2T3?=
 =?us-ascii?Q?Ym2fa8sJqTOT9Jh3LelaZQ5n9pc/O4Jy9nSFhuBJaureCmwdCGoYX+TybJT7?=
 =?us-ascii?Q?YnLdY3P1o+pz9nvNNMnHURfllN6Nd4I9iok28afI4GEwgAYP3kQLcbIgdjft?=
 =?us-ascii?Q?qRC+Ngs5tbD7QIf0PvN+zmc6fJXOLJ/spLbW6NuSCFmab1skkNrk00yTim+J?=
 =?us-ascii?Q?JZvhf1N/zkAi9Qil64qz1O5ol1522PQSHHpaTEBd9NSJVXKp/tfVPRJHjbtv?=
 =?us-ascii?Q?IQ20yY1mXuvrMunZtQcW4qyRltntUOSbkiIlRfscelqxqwg5tQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wcx0lVzeLPUAKDE7bqkCnAQ+7htTmprUamEtPV0mjdh3MHXUNRGzTWhyc1Y1?=
 =?us-ascii?Q?CsvIq3PZeL4zGlKpWynlc33UGPvfGn5qL/RlNWe0zR68pcXDNBNe1Y0vRYv6?=
 =?us-ascii?Q?/FkX2fJYbfWAbX6VEjFgEQef1m+clhSdMdjM0kjr4Mp3qfRjFvYTQlsuDSpD?=
 =?us-ascii?Q?z4QF6APheqX29XjWc6U2H/TrF+KrJfCs6Q1nBbRsNMl3qyZixH9BPhjaSHCn?=
 =?us-ascii?Q?faEatxmLM6fw+JdM5IKKOSvpj4o0FhV/pIbUhcpGkQQPYOL/x8yYGIkEDTC9?=
 =?us-ascii?Q?eQYjP/WryormikLfU+XTU+ExAQBKMuvrU5WaZWOo34bn0sYVCIPZrCWCLa97?=
 =?us-ascii?Q?tcWwwpB5Z1VJY9SIeJAx+MrtMTvc5cjaJ0sm+hr91WqDMecKFPyeQdDsRLA4?=
 =?us-ascii?Q?ajYfVTVLHVeaZeVJiWaP/ZiDaKI64buVnsBPHLVVgoABXF3fdyOxuVnaHxrE?=
 =?us-ascii?Q?hGMcw9eTGwTv7DZ51xZ5V1LpuV5wHceg6Ss7SVigDctD/vkTtJPww0b0kta5?=
 =?us-ascii?Q?cJJRkmprcqBRjGjR+11a8vDleGG/sd7yZamFO0pw4LBWCXZyAwxIodW5mGvi?=
 =?us-ascii?Q?6mwsRsSoHsvxrXox89wWzom65krXrwzGrBpQ0yGKqrR9vtVauQb9HnROroTv?=
 =?us-ascii?Q?8bR2e7O54DdEgKOnMcnJx/ZnWiVSWgAScTe8t+IfAWvLxIAaGN0aqqOb9o83?=
 =?us-ascii?Q?pM9k2xsOVlfRJ6KBbGyh/ewHEYuK4eDCsDnGCR9146cno1JP1X1fu0BHSSAK?=
 =?us-ascii?Q?K7Lj7+/YYkAFAuuRA/Kv3LqEjc57E6iEgy2GqYkkYIqP1nnK4cnup0/V3adZ?=
 =?us-ascii?Q?ZPcgO3sefrvDOYbvzLAMjwySBL6TavrVu5ec/GaAi67pIG0XF+qFl+p5L+ED?=
 =?us-ascii?Q?p2ou6HL5xw73ls4bgDGjGkzUWGEc3k/zfIhczNG7blg5XuRK7MgNWOOwMhtG?=
 =?us-ascii?Q?rRK8W+FCrt1vwKxJ2/W/70THNaFdNSoWt6Gt4dvzzK//fwjcjlZqo+3TlBSB?=
 =?us-ascii?Q?OLZAZHL92+VPzZ51aauRJL4D0Op9VFFEvWllqCSetwx3SVg4jMrPVxNwtWqE?=
 =?us-ascii?Q?mId0SYqBunYW+RGWES6ZhJ935BSoddQj8DlLkiEUtQjsny4K+tORX5CczyWw?=
 =?us-ascii?Q?o1VAhGN1GRRCSrfWhbx/z7pkuVaw47OMIMzoU1rAj3w/flRocyw5/OaeV+cF?=
 =?us-ascii?Q?E1jDqq8/1FP8HXHfjF/EywWxwNhYmF9MS1jSmsWroSXvek2YJ7P0dxMp3gBK?=
 =?us-ascii?Q?LNoyleA0vNELNOe7PLRWN8/neAF5m1a9XA6xybwZQCvWgTrc458q1kL6Sov0?=
 =?us-ascii?Q?tuIb9YeSFz1zRuyAKYn53aLXkLevFbShKG5ML8SN/DEx06np0z0WTTP/cSIl?=
 =?us-ascii?Q?HLv/IZiihQcdvjdD0qmdZvONYjDHD+mUo9ZjmcLGFH0iV1t+GJ7IMpgnaKAS?=
 =?us-ascii?Q?aQgN0f8bIQ0bA/U1R3l7i+ZmiKfF4pulHrl60inF43xjgccaVDp+7rIT0JAK?=
 =?us-ascii?Q?W3GNGm8siq5ltA/Mf1jXP6lckR0p8B/QaoZYMU3b35SsZud4ZiT4HqLDmQMS?=
 =?us-ascii?Q?BKaHuNwCIdusKsJ+kDdPeIDv21E241Mlh5xBrxLnSgtRzdi07uU+vj5yBix1?=
 =?us-ascii?Q?ZTgZzpa3xCTX/gSMEfLsGDc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87160f72-7a33-4688-7048-08dcb4e732ff
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:26.6593
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oDP6SxeL8XwQdgjj/cTa/3zn+WXr7wR+6U6K6Z4L2cl4rZOmNa+RX/ytR0u0kQWpcqqr7b3f+Ox/FIwmcH68NwD23JTBg6myLDjpn8fRvQXPKNVq9qlZ8lwBDv8anN1z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: LSAZS4OGI2TBAPJJXS2TBKHT5QV3CTCC
X-Message-ID-Hash: LSAZS4OGI2TBAPJJXS2TBKHT5QV3CTCC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSAZS4OGI2TBAPJJXS2TBKHT5QV3CTCC/>
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
 sound/soc/sunxi/sun4i-codec.c | 8 ++++----
 sound/soc/sunxi/sun4i-i2s.c   | 4 ++--
 sound/soc/sunxi/sun4i-spdif.c | 4 ++--
 sound/soc/sunxi/sun50i-dmic.c | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index a2618ed650b00..edde5cb84ab61 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -285,7 +285,7 @@ static int sun4i_codec_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			sun4i_codec_start_playback(scodec);
 		else
 			sun4i_codec_start_capture(scodec);
@@ -294,7 +294,7 @@ static int sun4i_codec_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			sun4i_codec_stop_playback(scodec);
 		else
 			sun4i_codec_stop_capture(scodec);
@@ -385,7 +385,7 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 static int sun4i_codec_prepare(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return sun4i_codec_prepare_playback(substream, dai);
 
 	return sun4i_codec_prepare_capture(substream, dai);
@@ -569,7 +569,7 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 	if (hwrate < 0)
 		return hwrate;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		return sun4i_codec_hw_params_playback(scodec, params,
 						      hwrate);
 
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 5f8d979585b69..0b1bce325f04e 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1033,7 +1033,7 @@ static int sun4i_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 	case SNDRV_PCM_TRIGGER_RESUME:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			sun4i_i2s_start_playback(i2s);
 		else
 			sun4i_i2s_start_capture(i2s);
@@ -1042,7 +1042,7 @@ static int sun4i_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			sun4i_i2s_stop_playback(i2s);
 		else
 			sun4i_i2s_stop_capture(i2s);
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f41c309558579..989cebb55798f 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -248,7 +248,7 @@ static int sun4i_spdif_startup(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	sun4i_spdif_configure(host);
@@ -364,7 +364,7 @@ static int sun4i_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0;
 	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(dai);
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	switch (cmd) {
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 884394ddaf86b..1b662b40b7b6c 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -90,7 +90,7 @@ static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return -EINVAL;
 
 	regmap_update_bits(host->regmap, SUN50I_DMIC_RXFIFO_CTL,
@@ -205,7 +205,7 @@ static int sun50i_dmic_trigger(struct snd_pcm_substream *substream, int cmd,
 	int ret = 0;
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(dai);
 
-	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
+	if (!snd_pcm_is_capture(substream))
 		return -EINVAL;
 
 	switch (cmd) {
-- 
2.43.0

