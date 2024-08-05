Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CBD9472E1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:10:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B98AD5BC1;
	Mon,  5 Aug 2024 03:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B98AD5BC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819985;
	bh=Q81pCqUO4aa7U8lgHwBBj5fc+S+dicndBm3xS5CcBh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n7BnDXoUvK9TBe7JUoTktbKw7Fq54DB6hgRuGg7xS1yRA0Ff5UkLfBuUcCoBRHoSc
	 35mCFRZc8CBiM412H9OofCbHdIlP4g4a5ba/ywDLBNnn4BsTxNPDuCMnBz58bJkUm/
	 dKuuBP6awwZ17bxMC3hDyHs1LkF4o8RjQdv4C0aI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51F10F89ED7; Mon,  5 Aug 2024 02:44:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 94911F89EDC;
	Mon,  5 Aug 2024 02:44:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59717F80C8D; Mon,  5 Aug 2024 02:43:58 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 4669EF80C77
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:43:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4669EF80C77
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lfikx99S
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngxFxpcuntWFVltYF5WQ3sGBoeWi7TUexSqaUdf7Q+pcFWslKRWoqRwsqgOHxOL0H6zjmPXwn1B+G7NvRGvw8iwgAGPHRzuH68aDxTFUbiec8nnqPVrHyJGc1jBZw/aBA2PxcwaQVYJhw34ZAnN3+HowCZ5QQfu+9O8RYUCbCLbEgtsCZTJ0vPK5CFFkyo6kMgPO2MwgaOEtYLA4ZR5nYyPGx5LiP3AX9osP0Ih9IhviPmZFsv8D3O0adet/xansWdK8LpXMndpWQ33sUrL3PHsTYk/XrNlc9Vbe1ww3FHVu2S/bx90pHLfU7qEP8LeHpVZmpLeeb7743dJQo0kx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHufUcx/MhWFy0eEyzpe2knYlbDXhXmEVUBykvY6yOI=;
 b=aAyC7agyvO7bSBUkKr5dZkcppFscW9XkWMsdTCpmm/mBKmpKWQ+6w+wRR2muJG6yHUk1mDkBA+HFPrimj6gc7Q15Yh63J4iTKE//Ma0niz/1SW0+HlgwSt0AaxAGULbwBxpRS3Ohku1X3ukkjP/LUZIsaOiIrfBw/gkiLmLifeA4+8pFNnO3zxlsZUK/gn8nJE0SsEzPb0wFdFOhM2ga2B14sQN9siD7aDhMc7gNsHNVGAZZepLl8O03FIF6kh2IfmIhhMK2pyfx5BBx0lrnirDxilnd4vpwxGTMVoa/SaTVLgoutdanMN4sgWgrsbRU0ayI1cighhzZw5hjfThzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHufUcx/MhWFy0eEyzpe2knYlbDXhXmEVUBykvY6yOI=;
 b=lfikx99SvUNra1K+o5sQlBqeDXUWFrJee6nSyTAgl4+CQSRwvo3ycxQp6bkSAjgQbhaTVtNkn1PBiDNHO4d9ANdfJHWWgm7wvbmVbUlbj9+dk1uRGOVgndumN3jVuBIwRCsxtbeyE7XGnpfYhRQq7/ZwqMdEE2TFG9TIPZTdcB8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:49 +0000
Message-ID: <871q33x0hm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 102/113] ASoC: codecs: hdmi-codec: use
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
Date: Mon, 5 Aug 2024 00:43:49 +0000
X-ClientProxiedBy: TYWP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: c8d6bb71-35f1-40d4-d20d-08dcb4e7abfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Kh9wCFFH/UBjXHgWXbPFEPc8o91mPwQPRG9kejfBkiyShpPl04TYsdhFghgo?=
 =?us-ascii?Q?jIc+NAgKu6qA/OHhPTHkJYh05iwEGNrFX7Sba7W+N1c9+VFOHLOCZHdo3SUp?=
 =?us-ascii?Q?xnBp1h79lWQKZ5y1S+a0kxLKrMYp+ACLP7HoFmPr5l5QuZ2sY1FnSBahydq7?=
 =?us-ascii?Q?/g0bOaaDJhsTOdv8TaElDQP858RAs3CWy/vZV6BQXEUeCno3cAOlkRjwvgpr?=
 =?us-ascii?Q?GhHtlDQ+Dk0ScHO0Y8eiIfgrWmNqNyq3C86TsR+YAwhGUSNAOF/RZ/ihsCtq?=
 =?us-ascii?Q?EvCwAWEGJN55XsUfU0Fo/ZNqJCk/yuJ+f7W8EMkBuJv2eEox54epdMeMQcH6?=
 =?us-ascii?Q?4AVKwRsIMZsTxoODet3XeJ6EEsV23K6uWqQ0pRJa1hNhyndwS9PsFldlWsQk?=
 =?us-ascii?Q?9emDU6ddh3/N2URYwWkQ5q7NmCHXFQhiXCR5pW0XHUpLakT9NvtiY92I0rum?=
 =?us-ascii?Q?o3fjUmMFOa/Fqr1nORogymvYuS/6MhGeQk6HRCc6zreZYN//81eFnZrczOZw?=
 =?us-ascii?Q?yeefaue21/NHqA/1r0riGxwUSLDJaHG8NymRaPUly0h+x2ulsSnka7DYHG40?=
 =?us-ascii?Q?QLsbCMu9UYzmukAdyU6ZuK1YRLy7QWL8ehmQTISG0oJzzfWH3sXGTB1gRi1a?=
 =?us-ascii?Q?1DqqeJtZY6YuQBE0v2y7JpyNF/aSPm122u0CYhd0HAvEnhgiv9j0xNSVnsGp?=
 =?us-ascii?Q?sYmQ86s95iiU8UbQ41WWOoo99/j9U4tbrHyARBycR2sg+NtDiXVhNSJwuSJg?=
 =?us-ascii?Q?bWMuJyyhvI9Mfkyul5pkbaq/LS0YrNt2JJT/+GbEu0vlb1vOG/Th32gOrWzB?=
 =?us-ascii?Q?q1BZDpl/t8d+DIYIRaqQEMnblVfEGbCo/MvPK3/q7igy4CjvTSSgS9uZHtag?=
 =?us-ascii?Q?Nc0CikIrObpoB2bTdkqCjjWpVR/xu0vOe1QYndnal1mvxp5pNTwi1OItKj77?=
 =?us-ascii?Q?ceqNi7ug1r99Ttfx3wcBPTCa8HOv8sxcdSSVoDurko55i9bJIycOo2vZ9Eib?=
 =?us-ascii?Q?FRZWrVcXXZbi8C5MfenPYPrhZ7dQHyk2kpmzSeMZ7p8d/85gxCTBPeH/wZ6g?=
 =?us-ascii?Q?qp4Mv6WVHva2P2byugCxnc14NTlfQoKEsNiibkTaV36VTWXV770xXWpDknVz?=
 =?us-ascii?Q?DtLWfgrlcdnOi87VzVKpBM/yznQNjm75qFEdXhVetbEmuccAA3ZXb/jsBaNq?=
 =?us-ascii?Q?RHFLTJ9oY2ZA49AkUcR+chvhEdopnuXXjC/xizsRehXc0eTtVU4gCLcQmPQ4?=
 =?us-ascii?Q?q1HN8WkFg8XJAVsgVRQzBWr7ARQ0eIEwTDyX+kmUyZyXdQxd3q6IrVbdqJFr?=
 =?us-ascii?Q?mw9lQ8HOTs5j/tH2aQv+y2H4NJOCJw/FP+4qIQNEYGTuu+f/U4QjHh+qQwLI?=
 =?us-ascii?Q?UgfDvhHCMz+NhTwDO9YayeP7fzbCN+PDuGl93a7u5mGvfGLQ1g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6/zAFN21kODBimZwV3YQQbUCldaWCODHJr6x60KVfbT1hWQaE0XyN8+r8YZP?=
 =?us-ascii?Q?AmXy+G+0SzAvcZiIjmxZWsL+kACfyWhUakxk17hjKDPRJ9U7hz1emPjwD9hB?=
 =?us-ascii?Q?EHazyeicVhEqNvuisWOyeE25pw3CbCJbUYJmcEpXT4Fj+EZWAshsNFlVBTQ+?=
 =?us-ascii?Q?Knb5yOJsIJ/8dyyhnn99tGlfhU+vJxgEOR43zooMH21HALhBRnuVERxdq9QW?=
 =?us-ascii?Q?0koCQjoD1YCmuckiE8Pr8O23eup/cDg5vIvb9SrM27rk0iXDXJwj+AdMiqcE?=
 =?us-ascii?Q?1NH6CQTWwuOQ+9PdMprRvVk6JwMfDDoFPHSGV+fCA8K8JoQaTvRAznM6kbxS?=
 =?us-ascii?Q?6riHfxW/09I9oradbOHhjDC3rBnzNjv/+XuY81AuPjoIxebD7o+ZCq4W05oP?=
 =?us-ascii?Q?J8wv/DMcwvvs7lwOv+4Ij34BBaJlDpzTTqX6idgE8IisKQ1D4U1LoMspvOEW?=
 =?us-ascii?Q?c4G2fKYfZs3gSIxXiqiyZuVsLzzFIiPgYv9Fk6S+SHwmwz5zeG3099xZULhO?=
 =?us-ascii?Q?4xvWIQ/Uo1mMypZLXxY3HPHgXY43VZXJieiw/h01fXHIaozIhIlb+8RDjB/1?=
 =?us-ascii?Q?5Ia6Bl5pc3o8GggImSJEG/xAvn1ojAOP8i1Fw/mohLYEmLd5/4pigrXPSA2z?=
 =?us-ascii?Q?/FZc1WQoittVx+NF7TzRKOGzW62WhF0UdxBKDKZDHd2KHXhDUjy+0Z4NCyCp?=
 =?us-ascii?Q?LBv1EnbmnCpJNrB99l2SdEKDiDJp6EhIFyNoc3P3mTyHfwtYDGWkz2ANkQVv?=
 =?us-ascii?Q?3U8wQx50Np1qhjdT1TBm2jm9FW44oSn3QtUDJxZsFn+Z6uPYKHU8SR0ektNk?=
 =?us-ascii?Q?zuAce9M11vMxqA0Ob+nwWqqTspnRiPQiW0WlLD1oT97bWNVlh76vWPMOfJbu?=
 =?us-ascii?Q?GYallSxD1jTZ7h5GXxbPrp71Cj8/dIOalnuZJCA6noBdQJPK6aFjLH6l743E?=
 =?us-ascii?Q?Y96GZ61U2XAsOoQl2MrZZuJ9yNRkBJv/E7He9WHizNCf7YVEoOF1n5tIOznl?=
 =?us-ascii?Q?lcbEoG7Tu9aSgEoX5YL3PaEr68UifpTJm5yBTEheg+zM2JBOvaJI/gc15IFm?=
 =?us-ascii?Q?rpbOGizuwAlb9ozn7CvnOXUtILISd5zp7RoAfYjf/w3L0Xn4Eb00PcEk9UJK?=
 =?us-ascii?Q?b60soCd6rV4b1l1j5PKW4PmHXh1VI70RLA/bodq7Eaw4UDZsWdv6D6l/Am71?=
 =?us-ascii?Q?LxxDS15Rx7qWoljz++R9ii+th3IEAKZAMZvfS58hVv8zrglTZd8Y2iENCKU0?=
 =?us-ascii?Q?qclsx1bHgu1VgHXoUdEtvLN+xCAzXP7wKCBXYA0a1RPOY06VQfyOo3taj+2M?=
 =?us-ascii?Q?CJLHhw+BROKEhpbSdT3eQA+FyhnUWfcpBIoLgiGbcQHrxdQUa24bKjwg33KB?=
 =?us-ascii?Q?Semq8UkSH89N8cwaLFAbpH0ZNMuKLM3agPQzpDIAfvWPrkbUFnH6w7PcM1tJ?=
 =?us-ascii?Q?R2oLjgPpwDfS1490vHhiwOdT7yGZKwCXoWY4H7mLAzayHhKveLaTe0Xef1Fw?=
 =?us-ascii?Q?w5GCjMWWZnWo/osgqRPeNBXOo5PnLYTkc8Zq10R226DRTMsekMBgyqEKfxsi?=
 =?us-ascii?Q?eyrX+PwQ7aRifUPe82SKna7SOqKbWSpRlEVupTdbfxuebOc6le/Mtf8CRH8L?=
 =?us-ascii?Q?2zDWYS1b013KxU0+CyTwc+w=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c8d6bb71-35f1-40d4-d20d-08dcb4e7abfd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:49.6463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OKl/Sa4txoC7bC/nRQ9i96+mfeKfnVogolgRA+NVyo7Plw7f5S9JhFwZzXzhfQyDimM81hnfbnnOibu1dKVcfrYCoc1GNkcZFVrmp1mTQrqgcz0gtRuL/Kj8gazZJHEk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: DSWRVUOZ7V4ZVPY42MJJ5FAEDCFBC4BV
X-Message-ID-Hash: DSWRVUOZ7V4ZVPY42MJJ5FAEDCFBC4BV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DSWRVUOZ7V4ZVPY42MJJ5FAEDCFBC4BV/>
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
 sound/soc/codecs/hdmi-codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index 74caae52e1273..f8a4a1b62698e 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -428,7 +428,7 @@ static int hdmi_codec_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	bool has_capture = !hcp->hcd.no_i2s_capture;
 	bool has_playback = !hcp->hcd.no_i2s_playback;
 	int ret = 0;
@@ -474,7 +474,7 @@ static void hdmi_codec_shutdown(struct snd_pcm_substream *substream,
 				struct snd_soc_dai *dai)
 {
 	struct hdmi_codec_priv *hcp = snd_soc_dai_get_drvdata(dai);
-	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool tx = snd_pcm_is_playback(substream);
 	bool has_capture = !hcp->hcd.no_i2s_capture;
 	bool has_playback = !hcp->hcd.no_i2s_playback;
 
@@ -699,7 +699,7 @@ static int hdmi_codec_mute(struct snd_soc_dai *dai, int mute, int direction)
 	 *	snd_soc_dai_digital_mute()
 	 */
 	if (hcp->hcd.ops->mute_stream &&
-	    (direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    (snd_pcm_is_playback(direction) ||
 	     !hcp->hcd.ops->no_capture_mute))
 		return hcp->hcd.ops->mute_stream(dai->dev->parent,
 						 hcp->hcd.data,
-- 
2.43.0

