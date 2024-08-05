Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AE79472CC
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 089E6580C;
	Mon,  5 Aug 2024 03:00:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 089E6580C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819660;
	bh=2uQp1+GdQqrIe3QMXC2uWJ8THuLzo5nsI6/6nCPq+fw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q9MLFzTnITQl1qpxrJ3E4LbwlQTE8SJqZYcdZt42VM+ulHP4Sl67gY3V141RCI/AA
	 No3NsprGUd+GzGm0Xh+e1IrdmsoJ+2+HGI0BLxLzaS8qPL6V/6fniRKcstWGXZ0tpy
	 oupy/FCkSHXXo8mAYZr3PujcXLl6xMNrcfXs+/jY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C790F89D1C; Mon,  5 Aug 2024 02:42:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E67AAF89D12;
	Mon,  5 Aug 2024 02:42:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 711B2F8085D; Mon,  5 Aug 2024 02:42:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8A5CDF806B4
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A5CDF806B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KuKtt610
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j27ojQX+GugK6nc8fz/RmJLOt4NiME10eb0hMFkbLmCAsnM8KIGIJHYXrGdVXEfDi0Qm4rS3YsZqOIL8B31YeP/p7xcjP6CbleHB0unwsiptX8X8Gu/pMQG6RQ4lEZ8XxXW2/WW+t/CrMOVnqD6xMvLo9e2O2HcGwsaGf3260Wp42HJL9L4bs6jVMdaNgAdzy+Ruc8LcPMzv2rvp2eRmu0vZPJt7aZGs7I/hTU7Au92zamtaSWLdu2ZnITO5BljXscKgEHXoYGwAi39mCK0ha0HL90QeAyrADCkki5TRmlKhekRdN52yP8kB5pUKGBwbmYQXZr5vpZqxi4zVx7PdeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jgIRNEw4aX5CNxUlXsYtrSamuo8np2AeOh3Y3wtT858=;
 b=tf1E8mYc2leg6HkM9M0ldENg+xghnZtQ5bA+lN8cXIua511deMGtFpYdplVSuK7kIhYUbJ01N56ZEu3JLTJBxmHZQV0hMqFZ1zXpXyzsYCBtS18371g/h0wKkf6M3UuL/sctTlEaJ/tWzqWO/LLa2NHBj2ckGbC8e/rR0TqR+7gNZYhu5Xr1WK/40AhEuljqNBlW/DAPNhL5sBzv65nz2uM8jRMj3OTAamR20ATUbppWfAOc4h8Pd9pj8erRu3LrqkYUztTgE8VR28ON9VYS0GgotB2gFGFSo83NX7WJgfdDzDWU8cUE/3MbwjsWmAra74KQfOjTTR7q23kQCT2rzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jgIRNEw4aX5CNxUlXsYtrSamuo8np2AeOh3Y3wtT858=;
 b=KuKtt610JuS7ADdrrK/nZ1e4AcUm5HumZmQd4uV3X1B9BpXdslcHcHZwGMnZibV09WCW7Efey4M68RcPNVlRyDNNdDLaVW/t6WWauzBfabHsFmMjZ5KUZTRbEbhMTDHtHiHqFvMgdTY0YraFtax8CVmeLRbuKv6d62jM6BYOGik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:42:13 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:12 +0000
Message-ID: <87v80fx0kc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 081/113] ASoC: codecs: mt635x: use
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
Date: Mon, 5 Aug 2024 00:42:12 +0000
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: e659891e-0d53-4ad6-d70e-08dcb4e77206
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mrKGmK6Z5M+9UhVwLrLLYxhI9ysjdQMyL4wASiUN/jO6yOy9xJ0uJLX5O5qw?=
 =?us-ascii?Q?zzD8e3055PtTkmG2p/1TBEPfoK3ZEtaWAnqT4EPmZrM1yNDLWosqb0Uzfh/1?=
 =?us-ascii?Q?dL+DHavmdj/5qqIozruMKJ99yy2fZuxBEhTCs39P2dxBDnRtHPoqxrnZynA6?=
 =?us-ascii?Q?WTtLV1AGyvpECRHmqGv5UqXLr1vLzz2qlMqg/vGzJJuHT4JDjTSek7ToSb1N?=
 =?us-ascii?Q?cCfzmFglEKmX9utBCkEGClDQoeJHwjLwvDTQxDkL2rWQ7g6xaads4kAU+m2p?=
 =?us-ascii?Q?iYFeggk3WBnB632KrlqpLDZjUjlqo8/Phq2FME47Hb2P88b8cbS2k4Qu+F7S?=
 =?us-ascii?Q?QhLeNBy6KTu3yBlMAtrdILO2Gu2rOvp8o8jrwxXki2EUAyY9nKxcVbZrcAXw?=
 =?us-ascii?Q?BxGs9jzUOtlRUmP9cqOI/eG5rQif/bMXpyvh42avnexR4hwfSbxCIOk1Dhlt?=
 =?us-ascii?Q?IUhsh4vegPKX1RExnjHQl5UR7t1sqId97gJLYk9PO8M5z/tITLaE5izQ0Rkf?=
 =?us-ascii?Q?IWtvbXSCn24H8crddssM2qFDGUqT/mDAwSj5e8r2bKU4L0m6vrmOvu4gMjAL?=
 =?us-ascii?Q?YhMMp8mV0GO303pwSJYpwAiTw4IdvqsUvisPBvWK531pccQxjxRTT6fUgFow?=
 =?us-ascii?Q?ZeEWEh9/yCvnHCcfONOM5CIYKHdys4SLjiyhtU5FWQPtnvLw3MKQb4+5QnXp?=
 =?us-ascii?Q?VREauGKXfOtPyva25XREoyKFbeB1wZgiyNL7RH13Rki2kxE2SDIXzDJJEvA5?=
 =?us-ascii?Q?gswIYXER3IJKqXIuAZC8L1CzJWKEMO+acF8KCqa1ESTU3QuT6XnsGtLEf8Oh?=
 =?us-ascii?Q?RLFEdLPG6YSsiRofzhl4LyZVI3ISUFLmel3xka6snE2Afx4gnfLo/b9CwZya?=
 =?us-ascii?Q?uo6tKYsDVsNDwqz0gn7xwXwT2fReLv0rWKFpgtTxriVm6hCQZaHrIW4kSKrG?=
 =?us-ascii?Q?tNYGCWd3FF1sspwnBFuj2Oc2+fMuL8wnHnzHAFkf2K2aDdZbGvnqu0kzmKDK?=
 =?us-ascii?Q?g1xdG25R9IIp63EjLYyBVoJDD0LumDLeEbwFe0vQfOWUWtgjKM5feYBHo705?=
 =?us-ascii?Q?sQkpjm+fGvQtnWqAH9DMptalLUh6PnmlEhONmdVuC6+8MwrJWM6r1OTd6gav?=
 =?us-ascii?Q?ybh+mKHrdzFfNe355o+Fvu8G5BKnIOke5eUqpZGdX6Es/l1RuKSWoIqMZZiP?=
 =?us-ascii?Q?y85sioGidTw/kRZnu2xU89yMwjMe5VllWR/cYoSI+1nJGy/rix3TFtNXkTKj?=
 =?us-ascii?Q?LuFKYyYFebJ+iWMniWXmFu9f/9z9Q+Z7euqUXKFijxB6ZWgqpeBVrASZXBz0?=
 =?us-ascii?Q?7IgeOhIsaATSUwUgSWTCrK6pm3vSkVGBdvgAuz8tn8H7vRAhj30tDbByPcNn?=
 =?us-ascii?Q?YSMQ+XkZNTuetWD/UPKYStOHEVQU+aPnoMBAxhtvOW9FsGZCfg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pH9Zdr0GV/YygHJsp5tLDjHQYxlM1m4kmEN1VZBiFdxKyw7q2ewNFJvzCuU4?=
 =?us-ascii?Q?T71n9x2rquuK2lffY6Mc7nhLUjgYKEw99kN2QB05c3UlLsDfC7m4zl+uiuKK?=
 =?us-ascii?Q?EcXeEqR7PSeAEVwr5yz5Fg9RM06ANNBkGN1J/WdAbT7H34yuCxKDcZm0Xt5A?=
 =?us-ascii?Q?EzHDaRx3q0sqmu4XNlkMjJBR4ixOXoc2DXoHeJCQJiVYpiAI4mEXuBCd9+gR?=
 =?us-ascii?Q?rjh/GFBNybEpbKxKMKpPmAOoW29OawpvevumDIQHhsjefHPl5dki8Iy6oT5M?=
 =?us-ascii?Q?psqUULTAA03r0kBpBbBgdfQvOgZimYdKOQMe6TBTiYIb/4rvo6UnC5z7LEet?=
 =?us-ascii?Q?cmwguzln97N4MCTZ1zHUE+3iS91lzFO1GOxwTmUtHwE/eEXfzFC9wxtwDsfj?=
 =?us-ascii?Q?huc6nZR2to/zmh+YFZhYD/nbA7qvQoGs55MHr6bF89r80RCs8uX916DoJLt9?=
 =?us-ascii?Q?SgLHCZpsQkN1MyzVhT5Nincfe0xlBuQG1dVXWhvbwvECu4OCs913tImfFtkU?=
 =?us-ascii?Q?e6+Q5qrewgNBEo4GREdUnNUMbdJlhaGCVmk4szymnEAwZmYh/bn0iwpH9u0j?=
 =?us-ascii?Q?LLPbqOHoVA+gVijRkWXW5+j0P0rOcycu6zqfpkVoR2SS9pfDtvMXDmW2fkBz?=
 =?us-ascii?Q?v9Bt4C+h6ksQjBrAflPcJgWg+EXKHD6GLYmU7YMvVLOmLqc/xMlJCg6G6Qix?=
 =?us-ascii?Q?JqDyp5hpSVrLxto8idXPMJtMUifP96JGbmgObfZYqfgUS/XJ5lp8+o9AzNoD?=
 =?us-ascii?Q?47XjLDb55T8Y5Yo00j05gJ9SodJWGIpvyldiHb0e5PE5wGlfd4MF5aR5sS2C?=
 =?us-ascii?Q?DxRknVRO/dbQOQlvmdO7Ncwfzus2HVIktS9aDXQC06p2AdRNWqI1Yy/P5AF1?=
 =?us-ascii?Q?GqugnmaMfZMw+X43mBbwEA7TFLLQpHZhyNnLOqxEBye3UiZsUJTpGqwm1fGe?=
 =?us-ascii?Q?1JTQUCKHWVv8T0Sf8R9zcC8NZ930c2C8IZUsT3KRoIbKoS5fFTS8e9ioXevB?=
 =?us-ascii?Q?D/gcWGJO3Rz2oIbWs9DYIUJrtF5pLcj8dKsJe2vRKywLyAzldRu9Vjk8jDUB?=
 =?us-ascii?Q?8KZrM5mDLkn/cKiVG8eZ4YoUOdk+n7PRrsF+S3IDqlX5ojY4TNUxCsd++ZEv?=
 =?us-ascii?Q?11FmkdbuKABKve3QM+VOVdabHLfUqGzSak51MqSakXKIkgOZ3NjoqtPOUu9w?=
 =?us-ascii?Q?3IOL7GeaZoos1cPM3wygQhHjKOWnhf97X7pBYsHnFL1uGH9tbMtHp2YYLs4K?=
 =?us-ascii?Q?6QhHY0PVsEre7fcUyBy2IP3DG2xD/euM2EPKe6h8Vkf64qcefcmeaaPxGLKy?=
 =?us-ascii?Q?w4YigEM3ySGVVBwEwzPWn0c96ycw7OPpHcxuV2VsTWMVboGMLdo/rfOE8MCj?=
 =?us-ascii?Q?FSMBfpdejgdoXaLrnVjsawnY+cCad3Y6LglZniB/BYerNVZQbIV6xVP+l2Al?=
 =?us-ascii?Q?PL02d+1tN5mVBkQb1QaDQLItvBwA/CxqMdhuh7qUTpisX/dyqpF/WA+M04gK?=
 =?us-ascii?Q?1vZwHVbcxFpW+Jp7va0NkGZsduuoV0mKH4GJV29mjULQxdlXhEp8gO+7/FNU?=
 =?us-ascii?Q?dTRKun1LEY2rKuTg5pC/+ZGR8gWVM1yUnEsgO1xiIDUMvm0D4GOYdyDVXn3P?=
 =?us-ascii?Q?r1XSSHCCHehy7HFZu2SZQBA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e659891e-0d53-4ad6-d70e-08dcb4e77206
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:12.6850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6kMj/9SiPDvDX+3CazfnB9v7KX7dVLZ1DHl6HA17gz+xB+4sJL44GAvAOKoa02cNYFAMKDhsDYyThv50qTHIavYcXlSo2pONWWUvbphWBE6tiHhqmKNiFUzaH8rEToY0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: KFGCCAXYBKT4UYCNGFCVJEG2G4H6WRDM
X-Message-ID-Hash: KFGCCAXYBKT4UYCNGFCVJEG2G4H6WRDM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFGCCAXYBKT4UYCNGFCVJEG2G4H6WRDM/>
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
 sound/soc/codecs/mt6351.c |  4 ++--
 sound/soc/codecs/mt6358.c |  4 ++--
 sound/soc/codecs/mt6359.c | 12 ++++++------
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c
index 2a5e963fb2b57..7bc8a6fd88262 100644
--- a/sound/soc/codecs/mt6351.c
+++ b/sound/soc/codecs/mt6351.c
@@ -270,9 +270,9 @@ static int mt6351_codec_dai_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(priv->dev, "%s(), substream->stream %d, rate %d\n",
 		__func__, substream->stream, rate);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		priv->dl_rate = rate;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		priv->ul_rate = rate;
 
 	return 0;
diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 9247b90d1b99e..a0b34508f78f4 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -2363,9 +2363,9 @@ static int mt6358_codec_dai_hw_params(struct snd_pcm_substream *substream,
 		 rate,
 		 substream->number);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		priv->dl_rate = rate;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		priv->ul_rate = rate;
 
 	return 0;
diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 0b76a55664b03..8a302607316cc 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -2653,9 +2653,9 @@ static int mt6359_codec_dai_hw_params(struct snd_pcm_substream *substream,
 	dev_dbg(priv->dev, "%s(), id %d, substream->stream %d, rate %d, number %d\n",
 		__func__, id, substream->stream, rate, substream->number);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		priv->dl_rate[id] = rate;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		priv->ul_rate[id] = rate;
 
 	return 0;
@@ -2668,9 +2668,9 @@ static int mt6359_codec_dai_startup(struct snd_pcm_substream *substream,
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
 
 	dev_dbg(priv->dev, "%s stream %d\n", __func__, substream->stream);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		mt6359_set_playback_gpio(priv);
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		mt6359_set_capture_gpio(priv);
 
 	return 0;
@@ -2683,9 +2683,9 @@ static void mt6359_codec_dai_shutdown(struct snd_pcm_substream *substream,
 	struct mt6359_priv *priv = snd_soc_component_get_drvdata(cmpnt);
 
 	dev_dbg(priv->dev, "%s stream %d\n", __func__, substream->stream);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		mt6359_reset_playback_gpio(priv);
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+	else if (snd_pcm_is_capture(substream))
 		mt6359_reset_capture_gpio(priv);
 }
 
-- 
2.43.0

