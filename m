Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C3C9472EF
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:14:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65D7554B0;
	Mon,  5 Aug 2024 03:09:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65D7554B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820157;
	bh=oqAZo2jNs3ZSGL9laaVmjn/iHxf2kyqpUv2k8OAzn08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pPZ41DmAt+OM4DasIxAAqjyztqTP8eoJoJYtHcTn5SuhhFxQTez9ijXH1rRvVo09y
	 OuN8FEhndUHgIL6jJMY4Wb6mJg9UNY75/wR325rxqOkjJ4Zgpdga+D1VEe7zuL4xNZ
	 lLGw2HmFiFyAg5ACf3y9RK6W8C7fzj535Bx6f4K0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99F8BF80C06; Mon,  5 Aug 2024 02:44:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE79F80C32;
	Mon,  5 Aug 2024 02:44:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6259BF89711; Mon,  5 Aug 2024 02:44:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 349E6F89F91
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 349E6F89F91
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iCTnlZ8d
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrJmDTCFMWybkV1F9vZ/56TC3PkLwo+Ro0PDJtdvB+gh9QAZ6HbjBzTkWH8QmiHdnm+dTyBA1Ht3uxcdUyFEFVFjQcHtlW+RiIAQ1UHi8eCzAfYZhNehyH69dKc78KevN3evQkWVhdeu1Zi22gq8KN+GcUjUQYBuEWOClgZN/2vgcgt0x4DF4P/vYwWgazW1/0ONoNf3aq6KyS7DtvTPcr/iYuMSzGKprpgeHLrXX31m4MPqV4U+3/5YKFUT2gn6/WPsWrh5ayKvgfKen1bL23riEYvfzWIWRkm4s/RpW2zWcu1JJ0iBmSVGyZWF6yagqi/dkISnMlTUmfNQuABVWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+FDt0zQg654JzDyXUZ5gDWAJp/otcxnDwet1mgZwM+0=;
 b=Pxy16Ytrf2W41L3LQZOzzSqWXu94AtuJMXwU5exPRavpoBGxdMuYgXLpqxXIkSoC4ZV22Tea2WTTGgOVe08hA0gYMMF4K9R6/WJPn4oOYPhYjZZEWG6tJQpVBJgm4q29O9wh52oBagOpD7CKyoZkEEsGTm56pi6uCAnFGwzgihpG3/KqYb/KMSJq6ny63VjPlUL2ZFmPgaBt7MOnxCV6wFB087OY5RPVFbCplVyqjTZurlgtFjBFBxTObx2JNp7Pu/lQ7RHWbuLFdvjLANn2XBS4vCqC4XyKLAKu8iF+osCOebil5blLHzyEHj2Kbzmov015x+MaqK4klxyii9I9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+FDt0zQg654JzDyXUZ5gDWAJp/otcxnDwet1mgZwM+0=;
 b=iCTnlZ8dcfjiYTgi0c7zePTn/MjyIJzJv87nu08hQoH27dmO/PRBWN/cKeAGa3JGdVVX/weWiMmBTVpg1doUYvhnGPMwOjhegPXFVPh6OT2IfWAhoiWM8bNJsjQiE9oHZ5E/c/p5UZN2lIIDr+wXaLPN3HI3lS1eqTLsY3+Vnrg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:44:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:44:31 +0000
Message-ID: <87mslrvlw1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 112/113] ASoC: hisilicon: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:44:31 +0000
X-ClientProxiedBy: TYCPR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:2::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d2d503b-60d5-44b8-210e-08dcb4e7c4ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OM7sXm9UGrBXmm2gkYntzZvu/T7JIHQB5t0g4hXCTGCUpSWxnWarUqM6ozxt?=
 =?us-ascii?Q?f5kiP1hf+ib95Oih7dJ5UgQPbRBQS/M8zgqM3if11nR6pMLcGWfnjY2q1o1G?=
 =?us-ascii?Q?FX2YLQ7Mrls9hec2w++6Vwma71h5q62C7NxJqYU5I8t7KNawTPgzAnRnkbbx?=
 =?us-ascii?Q?5QX5xhulS6A0EynrM70reaYRgPBb/Z5V0R+5MwFDbOBja2G1Vn8VktzS/9CY?=
 =?us-ascii?Q?dN8hxmPi8j0LQkYgPUkwVpP7D1aFBuDSQhkrFoEY3fAZcWQz1x8Pr8PUbkSq?=
 =?us-ascii?Q?3d/r5QAUX/7cn0Z9DN5/nbSGre76xL2MxtCaQAbq2ihS1Fw0FsFRCq/J3Nnx?=
 =?us-ascii?Q?w4RtaDtXHpeK4McYx8T4++oKmp7qfKWKAMT8fvw8yG5VVvMtSDUIllcUquty?=
 =?us-ascii?Q?c7MlWQlw+Ti+vZj5pW23dG6klPV1tg8RxVzDMFvb5zQnrUMVuxvVQCG8dOqj?=
 =?us-ascii?Q?hTWEvdpz5qp60X6l0CY0KZcdQXtUSWe+4huClQ1ZEn8o1HmOzgYuGOe0KohN?=
 =?us-ascii?Q?LGXEX7dikp4ZsoKHLozR8+/sIqEVJawboM8OUF5Ox9THArKUzX/RyO4/HqKU?=
 =?us-ascii?Q?pSMD74n2N58Ihl2B98PkBL70MQGNnMUdzDIT9AJiJtf+Ku/UdTfp7CF7iX5u?=
 =?us-ascii?Q?/Qi3Q/VDgdSSh2NDGzF2ova6gL7CY5xwPSItxecbQ/xyF35NSm+JwPr+5hwE?=
 =?us-ascii?Q?GF0BxNFIjESFFNnxP0vGj9COmoDahkqbuxHd4wDdgjiGuhmbfuEIVcMa8TbF?=
 =?us-ascii?Q?I/ezhazc35Ai2Vo8qBClEtA+PWYZY3LF5VYkMnJPgoF80bJZNRGlnnItLYgY?=
 =?us-ascii?Q?1P6jHVyFKdW7kGQ1RTnuG8y/KDI0TyAenMKMlJxdVCu0MvCzuRtoO6BiKMOt?=
 =?us-ascii?Q?07ystQLzyVMbw75nzkP5GlMpr3cjVXrKgJzFmEiCQXPPit1nj54VuQs+u13B?=
 =?us-ascii?Q?MZpYEP5c5XMC1JcC7T4lSKRoH/tY0vDU9jvAnlfDy5JXRnxUnY7evZOmV+A3?=
 =?us-ascii?Q?buHmfpTG+7IaYVas87mB195e/CkF7+IzZrvLzE4AllEZiRK87IuYp8EdMWhh?=
 =?us-ascii?Q?tVR2ptfYqc8ua3NUMXqCRBgVE1B6lX47ZETaYPpk3P8LczZcTsNB0aXozylE?=
 =?us-ascii?Q?u2EkxyRu+B0PMckSpnQQ9gV5mBr8XwffyQ1jBZ207kbx/jvc/i3Oaie1h7Lw?=
 =?us-ascii?Q?kHD7mVj+g3FGv58mthCYfouDbjSf0y6sQNOuBWdolWzn8sS/B8KNC0m5hupj?=
 =?us-ascii?Q?rj3Zz/BJ6seHzV23w1J+pDk44CfO/1NI/Qi05kx5UsYWZmtbsM+nMK08X6no?=
 =?us-ascii?Q?s/QA+GRY11gCUIfbcelOxDh0ZjNT0cQO+minOdD3mSEhkhX8+8PNGZTDhPit?=
 =?us-ascii?Q?ltV6UbKZdJqFTuQGXbISwyOTkEgFK8NdITMMgHRVzjPlFuHIbw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZbgSi9t6gLnEqzMNUUTMd8LJRn/uzBbhIOQOXd7rDBXOqKSR5VX8uJAyD7fL?=
 =?us-ascii?Q?tlmF5Xn8aT/q4/3HS1TViQwdSmKBLERtPJf2F4kUzEJ4dcUC0173aVefQF1F?=
 =?us-ascii?Q?2pRHtw3uB2IqMShCi7eIW33HoBV2bpyqmmEeoTzMOdACHojyYdHAj+bmHXxQ?=
 =?us-ascii?Q?nOYC3NU30/u8xVFDn8pUURUoIn/sP1M34o5d6tEft0E4Q/MrtIpHr8h14euG?=
 =?us-ascii?Q?tuFNGE4xQK8SYJT9xb/76Uu2EhwCjiaZ9iL8bzNscXRp7OPV8tMvTrVKO0vc?=
 =?us-ascii?Q?gQXRO/sh6+jvjtpB+OMMyj/4D4/gRWB5egj5JR18D3foIx486mqlFA633trD?=
 =?us-ascii?Q?hMwGXOcDoAeRJwMRYihxgxNFGEUfj0xG3bmjGmxKWsFEjl12x0tTs5x++3cS?=
 =?us-ascii?Q?B8K9KzwipwiRvmCtDwX3iX1fWHnk/CrZBi9ibb8gwVkZQZdidqGtHIB3nUgb?=
 =?us-ascii?Q?PfEGM+KPdv0k9rwbtmSo05+PDjngbVv+7j3yo5h+rDULrl10pVw9aUiYgagl?=
 =?us-ascii?Q?srsdlHD6zOsUt5EnQhAX6fqiKuP5vIlq/O1jw3huzRPyrvjSd6djFo5vkIFB?=
 =?us-ascii?Q?xDibeY50wvhA5E1PCviH6uuqzZy6nO3phq62Y27CsB2Ydzd71+JFH3PUJKIY?=
 =?us-ascii?Q?GjjoyKnXD2wB+cDuQDknfgxy722ObKdXX351yTdQpnnVishohsmpR26o5JgF?=
 =?us-ascii?Q?qvEo3TISOuk2Nwzgp5pq1p3wh3qRK7keb5G/73X2PhNHRwUXZmgodj0nFyHG?=
 =?us-ascii?Q?PhVCiGXzmgOnM1D2FB37wPRxzYsGiaHPwAaN8r0YFQtQMMQfLAVcWkz5AY1p?=
 =?us-ascii?Q?k7+GRshU5hbfzonZ57ZaHAv/6dw18WAGTWj6q2XEnZGpW9omf+JYICHrp+bP?=
 =?us-ascii?Q?Y9gBK+VmFBOrYKfbkh0pD1q+BpU4A0HhN0onel+cvdVpRM6tetJfiVlzvmU3?=
 =?us-ascii?Q?g2KTQGoGC5SlpP+40KEoEkdd7necx37xDqky+juhLXMxQ5CxU3ufe0I3Vsy2?=
 =?us-ascii?Q?B5teai3tYuxOK9/q81SAyj3MOj7hg2lBoNUkVKEloqs3wqCYYA6fClmMrZwf?=
 =?us-ascii?Q?jlBu9OFpDhXHzqmGa1UH6ddoMOvcbz8IfOmK3rGHoGNbm8Zy54wGUYGRwP1I?=
 =?us-ascii?Q?TdujD2e4y6qJKt7hwtVmdrw/8fZLWkm+SP090NPk16Qx6PkPy9xRVjQzAqO1?=
 =?us-ascii?Q?5fng4t/g3jimKh4OBcJ4fzpGM3nyJ5+0JRwhxIqnaDdUbh+bJmR69iaptLr7?=
 =?us-ascii?Q?rI1qxaGNLs52MCtW82d/hlVCR8tZ+d+tPhuNhiL9o4Al3lAL2uGSYqAap4ae?=
 =?us-ascii?Q?f0dRtkjlL6W5fXuBP9KDKZS+lIqPGh+qsAc8FjobiKonMIbufWF6FjwW03bL?=
 =?us-ascii?Q?oi6h75zkYNW2zzbILCbcLnCfC7sr+e3sLCBa89DLE0K2LVaH5iuWycDfRh1v?=
 =?us-ascii?Q?Y/JtY2VOhsh1S/qgNURO9Z9VyZm7cxwxAgsSHUpaaw03BgKNqG+8h8NYInDH?=
 =?us-ascii?Q?GC/MrmRceMEpN2+pTNv9mzS7TSCcQQZgLESQaKjGAsMAW4XaVSfQ5squl+FU?=
 =?us-ascii?Q?H2H/h2F4ihxT76D7EfKlgFFvTIpEKkXRuF+3mBMN+9amp3aPtMmZqk/ub8aJ?=
 =?us-ascii?Q?B7gqqPN4wC1celWzXRXIau8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7d2d503b-60d5-44b8-210e-08dcb4e7c4ba
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:44:31.1521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CDZ0XpQPLwsZsT9HgsMCJDCVTaRV/yflatXDovVnvDVNIN3nb0zVW9WoUV8feJtjTuS2eoppvo9CtQauqwS+1acbUyNu4svqzTVDwcMSJnMIfLPabOL1O0WDz8GlqtCn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
Message-ID-Hash: RQBSBXY6MHZCFPAMZW6MJ4LCWUQSUYFF
X-Message-ID-Hash: RQBSBXY6MHZCFPAMZW6MJ4LCWUQSUYFF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RQBSBXY6MHZCFPAMZW6MJ4LCWUQSUYFF/>
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
 sound/soc/hisilicon/hi6210-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/hisilicon/hi6210-i2s.c b/sound/soc/hisilicon/hi6210-i2s.c
index 250ae3781d140..37ffec8ff721f 100644
--- a/sound/soc/hisilicon/hi6210-i2s.c
+++ b/sound/soc/hisilicon/hi6210-i2s.c
@@ -421,7 +421,7 @@ static int hi6210_i2s_hw_params(struct snd_pcm_substream *substream,
 
 	dma_data->maxburst = 2;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dma_data->addr = i2s->base_phys + HII2S_ST_DL_CHANNEL;
 	else
 		dma_data->addr = i2s->base_phys + HII2S_STEREO_UPLINK_CHANNEL;
@@ -478,14 +478,14 @@ static int hi6210_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			hi6210_i2s_rxctrl(cpu_dai, 1);
 		else
 			hi6210_i2s_txctrl(cpu_dai, 1);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			hi6210_i2s_rxctrl(cpu_dai, 0);
 		else
 			hi6210_i2s_txctrl(cpu_dai, 0);
-- 
2.43.0

