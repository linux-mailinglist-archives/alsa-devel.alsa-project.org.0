Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD529472DD
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D6295AB2;
	Mon,  5 Aug 2024 03:05:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D6295AB2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819933;
	bh=tPxPpdkxEvRSKwZnevgdaOiedUh4ldu+gIn3XeTuiVM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MAWVUJJZY6aXBXIvTb+8u7iu/98HC5LpkMD4l2bmZ36zclXGJQORIG6zoUG143xVi
	 XX/rov97VlHHHdmt/pp7hUVILYyS1sZ/QWm16etwLJgoiXGmToa5/NngzPU5B/wliK
	 M483l+s1UGSfMQ7p7GL+hVcQOCtg8QfF1/glD0mk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D666F89E9D; Mon,  5 Aug 2024 02:43:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0680F89E98;
	Mon,  5 Aug 2024 02:43:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C38B3F80CB7; Mon,  5 Aug 2024 02:43:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8966CF8049C
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:43:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8966CF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Bw/tRg/p
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yh5sCb/lC4fJtNQhBgnaf4mZe6mW2KczimctPz+TZhKTVl02jJ84rPkeL8cs8boBiJ0TnoZEDzLt0mzowzZBayORyEfMeeQp8XkN7D7dgb0+i1SYe6L2gKN4D/RgApFXh5QXZFdmEbATjbPBDC6ZACu0Eh/IrsaVtmpZ8n5bOWmTtR7lH3zWVi1Y+el/2nOy2hL3c00Twwx5Xk5SH8Y5M/FnwaOVp7GDgsfwnq7+ofyR0y7neQnRJ+e9yEsAkLZAPJt86DsjCrST5XxdOH0sE5rjBUQefL+5tdq+HZtRUYkqGFYfo2v6rzW9to/tXRvO0YSTxFa4Ev9iUpyRDe8JGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=esJxPO1JSV0CKFI9/GzSvyuUaId3bzbjJaY5+XQfPl0=;
 b=h0qY4Tw0APEQvcEXHx9y4241lo1L5UCxwpfNIqjBetqIzWFvWT6TLw/oLrIDE9Mpf62VBvxrv03bbyN3cj+51iAIfeqmiOeMPfvZmgfhej7HPtFyVHpn4Cf2hc+DrF4YpM59MbJCqNEtLC/d0TS2QUAevvsyIOn6Du+y2wNcSYalLlCHgiXTel0O8ZGUt9rSWmIpBw2jCutWnXoykeKxmlqXDouGehAkdlqED94+Q6kadXQPZqPTjastwG2+VsXU4UiOo3ZXOYhsRWuyrOTxWJ5rxi1aDAScJMHi7SwZyZ7aGOAPp8i2Uyo7NSk4St56WuB/KyOb9qai+xmsOTDaLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=esJxPO1JSV0CKFI9/GzSvyuUaId3bzbjJaY5+XQfPl0=;
 b=Bw/tRg/pELEpaxIjRuX/oeLpWIlFlVXr67XfmyQpEJ/OfyrwHNskkS0UWvPyD3IMW15uLmxEAZYJsOgLAgKxI1i4iaAerqJKmaFsuh8/5NfbvKBzjgDptGqAmt6olFIRBMilPLZxml5E6AvcxPgkuNm8yjXEmoqt8M65WyLRHfM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:33 +0000
Message-ID: <877ccvx0i3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 098/113] ASoC: codecs: stac9766: use
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
Date: Mon, 5 Aug 2024 00:43:33 +0000
X-ClientProxiedBy: TYWPR01CA0020.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: aa0a4f52-a6e3-4cae-5a17-08dcb4e7a239
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8sU8QyXjK0MwHvm/2hrbykPGOqiQ1QjgTPwv79mahEdsz0J+LW25LAhyStwW?=
 =?us-ascii?Q?03Qlzud+BAbrBaSIXqRaysE9AVMPzZFmN3pUrFDt0tiIk4tbImoy0kUe1+jJ?=
 =?us-ascii?Q?Z3XzihvI1DLr6UJkL1jQB/47CQh8SkarjpWlS8tJAbBIxYwwBVf2HRudQGFF?=
 =?us-ascii?Q?8T1SWhA7vkakcOyNBJNawJ/RFvOVfdHo6vHyHdC4tYS65xl+ATex3/INTO59?=
 =?us-ascii?Q?3pUFvRfdaGJWVulsmuaD/5Aqi4GYeBp8G15qTBzpxsA3xDCY9MGOdWbrszgZ?=
 =?us-ascii?Q?BfIFhJNLXOE4vVf1oa2FPsJVmcC2hsrKbQfmYXuRslgnaU8+46AQ4cZpaSsh?=
 =?us-ascii?Q?YfsS/wglp2cfNTKyb7MO/gRejmpZFiQmMkkFtCMWNwhzEak7BMFHzh1x43e5?=
 =?us-ascii?Q?txErTY2y6GayBZIDloJRIbBs90zmKPYhGJyYkO3f7L+BcjZY3zSNvRNLugyc?=
 =?us-ascii?Q?PQyhN7uL7c0YdZLPse3Qq3Bx04cHIcfrJbut7Mn+cB1+TQ16RkXSIPKGS7pW?=
 =?us-ascii?Q?1VP+RVGpwiA83R7FBvoWmD5K+zG5eWLSldIrL7oReeacFhIvJPXk1Mp4qW1R?=
 =?us-ascii?Q?HiDKG6VJgE3Uu4VGvm852NL0SOQ4ZL7af2+Iv3t63loB6cIpum4WeBzR86kJ?=
 =?us-ascii?Q?hD9yFBc59CZT7MCoj9kIeZ6b++HyiE7io/y8Jrrx3eaWZcUmP8A4LOyuySjF?=
 =?us-ascii?Q?5qgsZBHT8RPOu5hgRFau7A1gRqHnY4wZ3zwZdS8EiGj/XLt7NHocag2KghKd?=
 =?us-ascii?Q?Sv4KkwRtR1g002gUGRUmoJ+Nbj/G0I14Qo/ZJftyU0K15aJrv3LxATbK+CrI?=
 =?us-ascii?Q?Dsxc5od48nEZwWNcXHMG817u2bHvMVnUqzQr3U8legTw6Pqsbc4yKhJr75Ad?=
 =?us-ascii?Q?0ZPnvSFzg6zxB9hWLzqtolg9av4w12TdqfUDp+PZmrWvg+FRE5YQ1/zPGJBY?=
 =?us-ascii?Q?iAloCpxyB0pneVmtuHWn1yszPK4XSwMx78rE+y/AtiwfZ98LvU3I3moO3IUq?=
 =?us-ascii?Q?Ll5dCcdULEP7cwxpeLa3zuceNGeIKWr5aI03v+sez8Jf8NdxO4Tq89Bw1dCY?=
 =?us-ascii?Q?b80R9TXgoPv4ZGXt/XooUwp7slDxGzpsS3RliIslcE6L2Z9f4pIOm8yiUWFJ?=
 =?us-ascii?Q?lsKJmsdGPmfNJG32FIr4Ct+ZTCKyweh1DTP3simYDRP6drXQkirtPJ/t2c43?=
 =?us-ascii?Q?RT+ltGM2S60pDP6/65LD2I+DGtPZ2xlLWB0I0zrZENpuWkMlyJ1SGk6Xhjqr?=
 =?us-ascii?Q?wGT9Y88qR6WMC9OJwK/iYf0yapttK0LAgTyu4z3Q7aXgwcrptiqCrwVGEF7h?=
 =?us-ascii?Q?I8ft1kOAcKt3mzaD/DOB4kwUe0+Cq2FX2UB91wkqw8Y3IZ93yuuQJ+y1N299?=
 =?us-ascii?Q?ZTOJGvp2Nw9XENu+4lcYOHtVpWOhDt2Yz7faonlDEosMqQNsrA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Vp0ZUpoSAzb9iuZQOuSBFUZ966hvayMxpaUYOeU7oez7UqYafidYW1NSGqVs?=
 =?us-ascii?Q?E7ry9qxp+tS5TK76nDkqROfJ7nW+Ge4Yk20Pzbd26nqwjS1LKgAhLd3hO0av?=
 =?us-ascii?Q?LkJVkepu2PXHPKJ589Xddpe1/gcI29GMSsw8gtsTN9mb2j5PMP+O718hO2yD?=
 =?us-ascii?Q?6af7Xyh7pm1OGxIcfFwYu5dSMk1TW+0yoy8RvuABwconVVcAakVsBVI/YbCY?=
 =?us-ascii?Q?FYnf+F/RqemZiBonomdwt5nrNkR+pJXoS7TYtCLDxoRiXKE0FXy3XYIXQixC?=
 =?us-ascii?Q?JILW0gjZLctkeZTke990PlYRuCIGOI5ZL80UY98Y1Yc4mHzYRqdfQaEkXbEb?=
 =?us-ascii?Q?E3lilV0ypP05QeFMMZFg4vBJ+dgS8oF9PaDLl+WDNBRHmi2MSu/5m5ysHIc8?=
 =?us-ascii?Q?ERTEwfrsP5IAiULFdAerY5FeiRXmIQUz2aF934hfDC9YASrIOB6/BVzDDUAQ?=
 =?us-ascii?Q?PWi3bQ4KHWJYG1nCCwOWyRWyr2uuXnFgkbYEdOBPh2loJhbWtw2jtN4JE0Rj?=
 =?us-ascii?Q?BbN0My0TJvI3ta3e5uUD01hBO7e9nPJd7HS4Q7OPmxTck9uc48Rrn6uNe+x/?=
 =?us-ascii?Q?sNOhLXPi+9kzZ9uOQqKNYKn1X4n1HQ7YG+fIdQkqwDDqcogD3h3ZN1vnc1+e?=
 =?us-ascii?Q?aEXIQl0vQditmkLiSDkREAc4fZo2Zeanl7yhUKlqANrDPfSEX96ryeQbbGe5?=
 =?us-ascii?Q?VZ3hUnELE5DWXnkHxxxGwYwkx877SSTCOB+DjxX4NzAnQ5tGDSjTyT4bcRb0?=
 =?us-ascii?Q?1iO2QQKOhvXfQXJiArPZK1BFePMIKzGr0iynpEgXuZqL/hbLmOlR2jEfhqMZ?=
 =?us-ascii?Q?wM+OsDZSIyPraJVVDgMVkQV50r3f/Y+BuEMc1KKFSbvDIM93M6gaFQs1mmDo?=
 =?us-ascii?Q?nOas/sSDd0w+SVvJ3kgFqHi3lzGmaDkKdhTb7EeaSfRTHpjW01dulyCyzZqB?=
 =?us-ascii?Q?fC/h5b3PtLyekXaK9jqGsG1yP2MCX/b3d58He5oqc0JOe9zUeVukQcGf5qLh?=
 =?us-ascii?Q?rxmHVJVLvjYOuWT/gQFd8MzU0A/9Rj076+gdA9uvLa1o/JUezdPmppR+gyEO?=
 =?us-ascii?Q?snxp60+qMUBpahtsoPaMb142SnffROodw+t+xH/uDC8VuQ2ssVe7corIn09v?=
 =?us-ascii?Q?YTF/KoOvdUcyebm3/Wlz6eriNXtphpPkwPt5uBv5DthMcYpKO7KxRZ5Zo6c2?=
 =?us-ascii?Q?xiK88uQLbiufMZqEJ5zJb5JNtBcS32ZhlGHATWBKfwANIA/+TYWZQfZL+mnY?=
 =?us-ascii?Q?w4BwUUr+bwew8zV9Q1xKNrQ8hWrBGZScblQdISo8yW1cjleUn2RqYyFIWmRf?=
 =?us-ascii?Q?U8EB5aL8SdUEFbkQjA5u+n382MeHmIg3wjfH0TVsVb7kfrXmqAmWu4VHtdTy?=
 =?us-ascii?Q?gyHmoLFwL9q9aZBu8i3n9w6ov3QZaY1d4UMX6/S06DJsVc/+ZAM5UTLy9fyR?=
 =?us-ascii?Q?3Tukk14h26t8FlHWZ9oZlmdnN+y36gKsAID90IvdZJ9m8urN+BThRz6FLhxE?=
 =?us-ascii?Q?57fld+amM0zlB8Va3ovWRAAr0WwGbvh9Ccc/UJM7cXkfdKYNpomqOmPe0afM?=
 =?us-ascii?Q?aWY1Px4pGo7ayfMGrUNPby777q/fN/FHbSwHkKvaZMUJLe0VfOgaf3horFYa?=
 =?us-ascii?Q?m2/QuQBOGN9ns13AbGaHOBk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 aa0a4f52-a6e3-4cae-5a17-08dcb4e7a239
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:33.2613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jTD3tlFItDTOSV0AKoknALXoqEBhyA5K7FgtODdtWd39AvE63RwasYkRGK3Qb1crhcxicZAk8ZM5ZOa5J5vanCXOHSuvqtpBQJ/OrWFTfsr4v38Ld6jvXnxz3SgD2C4i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: YIHX2IUJAWNQ6G5UU3QHJUB7PQDMWY5C
X-Message-ID-Hash: YIHX2IUJAWNQ6G5UU3QHJUB7PQDMWY5C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YIHX2IUJAWNQ6G5UU3QHJUB7PQDMWY5C/>
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
 sound/soc/codecs/stac9766.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/stac9766.c b/sound/soc/codecs/stac9766.c
index 2f9f10a4dfed9..3511776af8f95 100644
--- a/sound/soc/codecs/stac9766.c
+++ b/sound/soc/codecs/stac9766.c
@@ -171,7 +171,7 @@ static int ac97_analog_prepare(struct snd_pcm_substream *substream,
 	/* enable variable rate audio, disable SPDIF output */
 	snd_soc_component_update_bits(component, AC97_EXTENDED_STATUS, 0x5, 0x1);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		reg = AC97_PCM_FRONT_DAC_RATE;
 	else
 		reg = AC97_PCM_LR_ADC_RATE;
-- 
2.43.0

