Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 117CE9A578D
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:00:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C1A4B6A;
	Mon, 21 Oct 2024 01:59:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C1A4B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468799;
	bh=GgGhujaI0woWlgYqdJG4tJyAc+dIuukpTkAfJ3dobUU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Isc/e5knYFu8iHRkdo7qVM2AwifApb1t9qpFzmBdQ2i9F+rhdkAaKnsxWPNYYaEjH
	 QReGlE9qRHhvx1xnMLlNP+0bUK8VJZpgDfd2iBBO7tlFUR5r+wnWptrMYRNgSnyMpO
	 tpXKrBWuPdKpFdGBc8ywSxJ9cjzcqNhNVJfbvhQI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBEA1F80616; Mon, 21 Oct 2024 01:59:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5BF88F8061C;
	Mon, 21 Oct 2024 01:59:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2BA7AF80604; Mon, 21 Oct 2024 01:58:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6187EF805F9
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6187EF805F9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=TRuSkeZq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aeswmdhxmTRtN9ciC/UGfwRKwcDYWFS4reFhG3K8gvq0xL1q4P4iyX9qT2sC1gptbV2qEn4dml7CTK5kx4GxMq9/FbmM7W8XgiHOkVgAZk0lSPKzl+ltl2bijj3xaoXfbz75iKvgxXF1duPQTTfxr2gLPW+VnPk4Bxvw320ep9GngL61+W1DWQE1cqI/6jd+Hw8ASIwgEXtV+Dvi4s8Qt8vkUmCzvFG9jdhZeQXq8ouw51gVwnB6hWQvw6fxr/FKmXc4HroFIfK3EzRCo6WBJIsDFRd6Hrf6MVCYHD6feHPIdNQ/+QQVaerOtfqsGDnYHSwsO5FsAoyabFuaybLSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=HJlTrMrp8glYfZ3/ZULwVZ4TalX1PR7DB5OGq8GojI0FCAnunoHRyI1heWjDAv7pl+w3Pmx5u66G0Tf/7dyHGYw4VOmUXppAzSMFZP7phmk6Gn/fQd288j8elfmijM33+tMSlLt4pJynGrrwAZiVdJIaXFyn8oGbFsOCucw9xNzZO4kXYDdtvYl66NYqpkz3BPomqhLD4Pii4yuxfZuIedhCJAAcEmsJlcY3ZOKSpKqE91sk+7PAbbgifA6Z/J7folW7w66pTOgW4mjjcf5H6od5Aov1oc7rmF/yacCXxvSfCvHSv07nH3nuhQdbKzsb6E2oVoowj2TPHjfZMzU3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZAxs4yzTaa6Dg7lirfzVAAaYESTfbXLM12N5GBpcfg=;
 b=TRuSkeZqvphrD6ub2kTIBtqO7ycWtm+RfQZeb0K38do4zDMSf8k5C+FYRsarCIcMeGyUN0cCZzR1/iXl7Km6B9XP3UyfnKvacjvTl79TcmljgvpjJQnvn7i7cqrUnH0Zn+uzwxOT2iVh92nF9d2Z60s2En4HMPqNTRtyfySzYAo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:58:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:58:50 +0000
Message-ID: <87h6969vie.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 03/13] ASoC: sof: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:58:49 +0000
X-ClientProxiedBy: TY2PR06CA0044.apcprd06.prod.outlook.com
 (2603:1096:404:2e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 198cc547-d884-47fa-71dd-08dcf16324b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l/58rUk8c48GUGCJ8NBX02KJo9HW3Pxrpf6vVpT5Hcq8AYljy5pirXC03lz6?=
 =?us-ascii?Q?E4D9+sojRnNEbEKwt2+4rxVEPCMiDmYvtlw60fCAAnaYvih4t8IIrDH64X1U?=
 =?us-ascii?Q?VWpMXqCV8rxz+sgH5Lyi80IOQVxCqLU6PsmHYCtT/JBzbrcgF4Vh1uV5ZsFB?=
 =?us-ascii?Q?Unr8kUEblh0rKgdQgv/HXWO8N0cGWlCU+z28oFTgjD7v9iYo+nyqQ+jOQjDM?=
 =?us-ascii?Q?AqMjWM1IKXjPFSOvwI2uUxnpCYmRselsinzKvnFNDapx6ELhUyxl7UyEbnBB?=
 =?us-ascii?Q?s6c+bWEmDLWBT3g4MFOTjRf/V1uYI9hlKrBkvhHTqVTHoTOFL0TzRq+Gd0bb?=
 =?us-ascii?Q?/nxKYz5vQolfHzYnk5amGGpGU+w0/O0aUuJnenTUOpnip+/qPqvQHNy1wpQT?=
 =?us-ascii?Q?XnM1q0vlfAGKbmsA9ghvWjaGAy6bOTS+UNpFD0hugKpDybR4Q2gnjbxWhr9H?=
 =?us-ascii?Q?wkrSFTIRgcv2vQuiWvgzmNLNarGI6unNtAOG99WgE/Ky1xjxv5McHRp/cNrq?=
 =?us-ascii?Q?cfkYAo3lE5yznn80+CSTLLxjP1i8zEWqYD5MYL1Gk+8Ei2LWIPiTFyNFgpu8?=
 =?us-ascii?Q?+1DAtfKij4UF6nSudWdVgJ8aMj611qW6v4/Pg6lwulAyEmm4FLXnOExqob+J?=
 =?us-ascii?Q?VxZfEX112sbEr9Dle79PTiMOa/rdattQmArMbuVDXAZNhlAqWfS5cl4MPZc0?=
 =?us-ascii?Q?/fRH3JQ6iet/DJWCMqznrLlqe2o57w5egzRRNPInTqs4x9SREyoukp5PH8qA?=
 =?us-ascii?Q?czUtI4OgtSd9FmLcolmWHm2clIX2GlZsLyOeQYeDDrKYL6Rhc7NYuFbABkPs?=
 =?us-ascii?Q?2nIyCs0JjhP2vf8xPMI+jayv079xjyNiE1xJlWpLJdXnfqhNAqA1beFojfbZ?=
 =?us-ascii?Q?hI0a7NLu9DDz48/INO3fiE7jqq4guTAJ0xJUnR6k3oKSLbpshH6RdYg5stXC?=
 =?us-ascii?Q?yrpYWH4GeATyc4pdn6Gu/77L2gDB6Q6VH2ZQw574PVTqbO0uNlrmcj5rg6NW?=
 =?us-ascii?Q?K83p8+mvQy6PooRcU1GJYB49ZRsk9z2Hcr+7RsmBXISBgbeuP9MArmDAeRj5?=
 =?us-ascii?Q?Baz7kIj7H1On6PsSNbRuE1Z+RV9GWAV/KcwKS+R2ZFb3juwH8Rb/ehg0HXOz?=
 =?us-ascii?Q?fHXoDsLW02QuqWas5weld0nvC6W+6WxHAF0kq56tD0+JnXyahxMGxwi16GKI?=
 =?us-ascii?Q?FR52jfUH4l/yXevSdyOJjYsIODfWL+9yUIRlqOk4bcV0DYCOKmEbhlKPtYgw?=
 =?us-ascii?Q?YV4lCOKluUxo/vqtcKb3q1+P8LzO3hZRYW62T4Wvk3d42I9WkgQK7P9Hsl6k?=
 =?us-ascii?Q?0iXIBkVgQA+zwPpbTDzZThjsA3iEaNI42QCdMHaRBy0NF27SfVaHnjtUlROa?=
 =?us-ascii?Q?OSG0G2E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3I3h1ZqX3bcBaPVB40kXAjyNMkWx8KRYCREtWNA0leEHQQDNJI+rrDdn8rUk?=
 =?us-ascii?Q?YLLpL3wszodO1ZQSj9fd0PvmeHb9dAhLbSxnqJlxXjuXv1eCrRw4WG+/+Ms9?=
 =?us-ascii?Q?UJd7s9xDxGK8fZcN5gjKuBbX03xVLQLsZB2q4SFt9gC4P1eGOhqKgTm598sY?=
 =?us-ascii?Q?nanDOEJYwSi1FXTuOoB8hYVjFRYQpTEPNGzJTbOyEnmUiEjrLTOsTyqKsAU0?=
 =?us-ascii?Q?1EbiBMlI31Fw5aoE3Oa/CjlIL7ip+Nbda+ifrYO+TsjGjCVif2x2N6CGhAdr?=
 =?us-ascii?Q?3R30gQw5nKr6buz+fxO9K/BjzVPAeyntk82bmUpw2wBxdAFLv3BKIKbUMaTO?=
 =?us-ascii?Q?64+O5+OKaG8a43q5C6xF17OrjaLHF66c+gMkLQVI35AjXbtoOjHIz8AAeX5E?=
 =?us-ascii?Q?S9yZaS4YRAp3wMAGb2pjF5TexOFD4dYbbwP45Hf1uDArZP5ZQ6FBWZTmclBz?=
 =?us-ascii?Q?t07pczVVm65osjGR2qX/GlmFCH4N8tuCx3qEA3ky25ZtlEcUGK2VBoy8CYxv?=
 =?us-ascii?Q?+7S1FrM6+ZwNWFRatGWSP17FBueSUOEbgiHYtNudPxZ+z4Ss66+0VeWlV2yi?=
 =?us-ascii?Q?H2TM5UvTK027W5DIQY/c4Xeyw5zHV1UlsJpyJufyq/DTg4BVeEyoxMlw2Jti?=
 =?us-ascii?Q?tvWAZYnX7keknmoY4Ri6grjQ8yzUN7dRvpjdBpFM1oemZ6/l5wFSOre3g2D6?=
 =?us-ascii?Q?8lo5VWDz61f2qOr8JVO95XFG56CxaG9oXG/jSuE7Gckcqk8WQ2/c5GO3/xeG?=
 =?us-ascii?Q?o9Q9VDEdXFTXa2rIbT855f9EIwDfm/NTAN3J/tNEDPs/cnp5Goe/KkgsgW0o?=
 =?us-ascii?Q?zxAeTwayUunjFb+9AkNZob2fYMl3pUXVuOBnYZTmvvS097CYRO4XJuExcEf8?=
 =?us-ascii?Q?f4g1Fc6LLzWNxEhVVkhOgWOwtM8B0cV/c4oHA6cbohCn3HQ7xkE/qrghD2ne?=
 =?us-ascii?Q?2zIDoo9NfbaoZ6aqacKO0voFOAcNF0BSAjFOjJkjT1yjid3ZG4kfeoNznTXo?=
 =?us-ascii?Q?k5cXXnuXt4jNjUM/HF37+Q5P1ny3ESoOqeN8zJrGHeUpcxtjOAQNGVXQW+05?=
 =?us-ascii?Q?cRssTlrDqz4NdVVye1Jl923e3X4Lx1nRgjWZjahME6Wism12+Y41IJSQ3iGh?=
 =?us-ascii?Q?JI9SADn//R/HL7EJ4qR1l0Ai1G4LhqzAFubkGawwyjyxCYz+O54UtTCw1lPo?=
 =?us-ascii?Q?2OqLKXbCySBCXecVFCtTtA0+Xm15xqZGGaSIZCspztlb0IvUhgRwTeBnECut?=
 =?us-ascii?Q?yLz/nwGN9bGofThqH14CpkOrFo+xgzxc70QrlrN68abD6qKyK/nbx8UOlQIR?=
 =?us-ascii?Q?zeJE6k1d8pZLfVceUjSl0QEOSd+Sv+L1E4wyGWuoRE9yycyF0KEf+XyMOFEo?=
 =?us-ascii?Q?JqC0YuvFyhQGkPTckl4evq3VP90ASbvbYqddwJUCFpULh8ViAQf/oM8vyuib?=
 =?us-ascii?Q?PKl+3Cu8u0+DQAlhMq1EFgKasmIycy1wT1qWabQdJQ+9XUtprfzCv/tLUjZB?=
 =?us-ascii?Q?NQrYqwA0zZkiMXH5X8kHIXhfVy9kt1ADvbayffAmmSRQrlYJQ85s+JWZGmy1?=
 =?us-ascii?Q?tN0YOOqrusGGQWaCpcnhu5ovus0AfE0SWm5pOyMZFB7L6J/maLhKbVyvswDa?=
 =?us-ascii?Q?K5z0B+vTL/TfHer4UkNAaYA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 198cc547-d884-47fa-71dd-08dcf16324b6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:58:50.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8a7S6C/6YiGQdZrGWv2E1buJomf7ssIAtONcw3CsxM5CdOZ1ntcwh9mV49iW8e5TJSzbKX+sc0K4u7jiHtWnmXMvVUz2p8a001k33d2nIxOt113OeiXGolWlK60FZvb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: FWUOFYVEYMIFFKIDQEUWGQZZUKNDTHXY
X-Message-ID-Hash: FWUOFYVEYMIFFKIDQEUWGQZZUKNDTHXY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FWUOFYVEYMIFFKIDQEUWGQZZUKNDTHXY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sof/nocodec.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index b12b3d865ae30..c0c906a78ebae 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -55,10 +55,9 @@ static int sof_nocodec_bes_setup(struct device *dev,
 		links[i].no_pcm = 1;
 		links[i].cpus->dai_name = drv[i].name;
 		links[i].platforms->name = dev_name(dev->parent);
-		if (drv[i].playback.channels_min)
-			links[i].dpcm_playback = 1;
-		if (drv[i].capture.channels_min)
-			links[i].dpcm_capture = 1;
+
+		links[i].playback_only =  drv[i].playback.channels_min && !drv[i].capture.channels_min;
+		links[i].capture_only  = !drv[i].playback.channels_min &&  drv[i].capture.channels_min;
 
 		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
 	}
-- 
2.43.0

