Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC1C6C98EE
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:11:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C135EDFA;
	Mon, 27 Mar 2023 02:10:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C135EDFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875901;
	bh=uZOiz0EvDzOGXbOG302o/6FMFBpooFFKvDCAzLi+u2g=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W/0dkH7YLxgIrGJsAZfS5N38hwAoF+hTwHJ9+XJVfwTGDPwKLMUaFYq2kVmnv+V3V
	 MyhIAVGBCLsBx+hYbpZizHwMnUfGSy6iyb1dAhnJnzPmJC69uHBXVnTLHZ31g+FLEl
	 Kc5mSBaEP1eHyOYYQ8KWeAV/ailxQQjPyyYXVvIM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C83DF8052D;
	Mon, 27 Mar 2023 02:10:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7E098F80482; Mon, 27 Mar 2023 02:10:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 060D5F8024E
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:10:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 060D5F8024E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WZ/DXm66
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFUYTxc6uvTLJpAWFbKKHGNabbDOjj2u6Br/g/GmlkifJLh+R3kfOS/iP8/p1HVz/H+3w2uOkv7gRwOcSkcdAVskwkqQ0l2/7hdEK2g3mPdAprmAvbBBPmAB2ZgBstSvIuk6PRzGz3Si/4HfmSBbHmTUya+SfPicVrXbCj6VlHBDhsfoEdCw6pUn6WJiacyRpJH2WQTC+0YHKvOlJ/h+4rkOhHKsi1ksmNuvm33Eu1+w1aT09G7cxfgtp3zTnUa9zeqRLiXVYJkBG8FEhCoqMMM45PkbH69lqrI65XbYa7Q+2XIsyH1NUKwgnScYbRKC0WKLRuGouTQydEUEFmpz1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uTafix4X+1IgMA9p/NXnzXVqzP3/3rq4CxkBvcmszVw=;
 b=AuJ4BvfKhplhyl4Y/bUV/dl30sgIAPxVTVeQaglh2OvL1I0+4K2WAg4vp7es/MDFQnw1KAjtX2TwTk6ZDhYlzPdrzIlEApiVhM5vVZuLjtTqvupfIJ9MituROEA4sFu1h+WPHLndxiTeyOgdwcAux7OBFFes5ppXesR7Ollc5AHEWNrxaScJ71a6Q7Takhgq0hhnu1UNcMmvNEjCXkGB3HYbLFqTK2guo+0jg4IDMtbWYiFXHZmr4Z4DWFDWWt1/9buqLu9ksi1jO6do+nl3ljL+LVy7JkUkoubJIb2dSI33sjf/kLWESPNMj64mNH/4f6h8M5+FwHGBR8Rgcjnv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uTafix4X+1IgMA9p/NXnzXVqzP3/3rq4CxkBvcmszVw=;
 b=WZ/DXm66aUQqFQIOi1szUB8W0EdlBWvQV6VHlVF8juobvqD0SbI0j1TPMhYRvlVTcBRiC0jT7D3JLi89OXaZsg68pI5cNFAfWjFLD1Yvrvyhr8DtcnUEPVpRrnnTgoKUZY4rmE8+rNTwKdLz4/C5h9ThxfCBzvJixmJaYppJnIY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 00:10:03 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:10:03 +0000
Message-ID: <87o7of6omd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: audio-graph-card2: switch to use c2c_params instead
 of params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:10:02 +0000
X-ClientProxiedBy: TY2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:404:a6::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: 951f7f03-25ec-4220-f4c3-08db2e579cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rKzWjTAj5TlMK2jbTlblGuLnyM87B6adR/MPuCbs7ZCAjaMPIP1AUOCkfEcxnKuSzQljg+TT4jV2CP5BupXg3YwS4Pziw0eR4TPKi8MiCAGsBJc/G31xH+aUhuuvCsHf5odi3Q1ScGhEN4q3RN1/Y1VwKcvbqGTA/xI9Zvb57p84R+gV94rbZkkIPG0KorRiiiqolZNurKhsixOsd4iFAU5ze7INaTNhIm3J44fj0mori9fiCgyoKMB/kDoLhMr1uORT30eO4l2dr9pfxqONfThwlAScP4SSWNmZl4iZgBC0ooFw0RsZLm7M1U29BNGjalAdANte3cL+BVL4hlS0DlmAzV/Jz5L5lHven1+lGaE7Pz87/SjvZPkjO4s0rhmGutGTSKgp+ICIKx2hP2jVT/2sVVdaNEhnPcE3DBwR+oYwJRU/JGb7Lju4luWAuEOANzkxiikvs3ZI0pxChauf73a4lcrSFaNj6jsFU5+RgytVdr1qNrSajT/z7xD9CB0+ihLult0oVugJHCeVX5GaOz2V4e/mhpxvX7LcYyLjjU5vU4chulnz/9HcNw3vJS97iWgUNI3KkoXLXuaWsBoHBIp8YnH4swIwu60lfwilP0I+RZ0Z+OnDIKpuMQg5YiHz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BctzYhxdwJqNVYHG8KNGCltaNCQb6Or4t+O21J4eXUiclDeKuhuwYnjQpxWs?=
 =?us-ascii?Q?e8JkQK8VBSLc/mij3T4jP6sJ9N+Um86XXZemQI9T6XJtBKWNkUAjr5zxehOy?=
 =?us-ascii?Q?C5taxE6BfETP2U2oAu4DPiI1Wssr2yB7zEIaHfIfkz6VvWQwigqN4zPOpl+n?=
 =?us-ascii?Q?UGzeG9/jPaZ6X0UIjYMLt66ltb4w7Gj05q48GpnTNEtlq8nEQQTlxiUjs9sw?=
 =?us-ascii?Q?BuZczKeqmsZhsC+XMX5t6A1Gu9Bk1vNNO/tuvvRgKfLgnYOJoWjNHQkrP4vz?=
 =?us-ascii?Q?9qMTU1lEmudjldRsl/vbQMqo5EGpuTVM77/dloDLhEOzFEE9R0UV195BeDu9?=
 =?us-ascii?Q?1BSAncvWxq1fP1zxVfeD7I9RrYw7d0yo9VnXfLf/tHzOXUTvTJWhXbsynWal?=
 =?us-ascii?Q?OmoixBYkiDg14V8fU1w3XQkdNdnYCFHfPcgxA90hXGRCCVgUZCU43NszT14X?=
 =?us-ascii?Q?+Dyf54kxH7O/rqHRTKmX1Bcs7XDFNU+oxZeYPNT1CBLpydgBQW/ZvPP9X2Tk?=
 =?us-ascii?Q?vLfY3AqtYROvnsGJmftWwLXiOOkZcwoExfrJi4YfpX8FpJs6XzA1UncMb8TC?=
 =?us-ascii?Q?L75Ziucrzc6SMgdK5aLpA7ZAfa9C1ZhWlwsik3z8V7h+dUfCEvdXSsrA9+db?=
 =?us-ascii?Q?jqkIsfDM4AP5RcUfBhpWUx2vwSRU7vTWkvQ2Llvi6/SUHhRh4FQvWnv5UWsF?=
 =?us-ascii?Q?RcxZziC52ulOXAM1oDvcW/MK+Z3oWjHGWED4sT9pTPgiXnOfKh0zqQZw173N?=
 =?us-ascii?Q?nysCvChQbLIdIrdUe0JdUZR48dIrmXi27QwJnabUS9L6KDdhOzWImP0T0WOc?=
 =?us-ascii?Q?aGZ7wDME7AXBQ9rSnSdjyVLOftVbFRTwRrZOE0qJcEV2mSqudvy0+yhvAw4p?=
 =?us-ascii?Q?O9O1LX1MqkqKf4YFp/MWSGAnpPbXTjsdkPiZ6s9KRgUAZCMNOL4oKhwpwZ5D?=
 =?us-ascii?Q?WS2yxNsDBxx3R2MTz61clhj/MQpMOvzl2YpryUNmZ0OxtoyGJ4XFbQRtpJ1/?=
 =?us-ascii?Q?CWuaR9z4DL7ULyQNCrcdhdd4QhCMqssGhxrBaJrbrp++tRmltrwRxwEgOIaz?=
 =?us-ascii?Q?u0Z65B2K6rfOSGtNBpU4PoDa7fteSOZL+4ZIYwtpubS6tw4f4FPY/CDY4Chc?=
 =?us-ascii?Q?WaxBLyA0d/tw7/x+QbMQEm8g0dSFHg4il6rXQGXO0qU4bT7BJ+g/DJIBm70Y?=
 =?us-ascii?Q?vm78cphztIKIH6AKEHOZvHuBdlJyyN9nZZ1aOpo4mtDZHMdNnYL7i+a/6OH3?=
 =?us-ascii?Q?MWf+kvM+qXNtWhGB3cyTEGzJ8AtrAA/VmlwqAAPWqUWGuSiQRX8VLEhPABOc?=
 =?us-ascii?Q?mGVpmQV2siNoupNxGKCEtu+raa4T8J3QX/oJt5B12xN/7pfVkNo13xCRGZIk?=
 =?us-ascii?Q?Z/NIGg0C8cIs4YankyofGmO5aHaXWyH5e3fzGDUyQXvBc+w5BJa3Df7a7r/o?=
 =?us-ascii?Q?+GDyNIR0YwLWIZczxktFLZbmHlzI3DzTSLHbwJ7cTtPq4rnDV1bJdBuCQP9S?=
 =?us-ascii?Q?9HO8FwmExdA7ROoYGkWoMnVyQXHlkzH/2g2mT2TDdNTFOXbEr6UAzzEBrqaI?=
 =?us-ascii?Q?w+ViqiTSA5poIyIQNLWGRiNWIxA2dKY3Kzvo9NpoNX/O0WYHzdnU0jTNJHeE?=
 =?us-ascii?Q?cE+aqFe95N2XRO9+LVzbcdk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 951f7f03-25ec-4220-f4c3-08db2e579cb6
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:10:03.1266
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FK9oG7LIKXxD3QY/7PNcfypxDPyPrsp7MpdIq6jmt4kVWsJ5Uq8iJ3d2p+MiXECrwr8a6n4ywoCRGWKS2M+V7hVOO13WnIBz47s1psMyGEG7I+w4mqxKeyLpWqXy8ukc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
Message-ID-Hash: GU5R4RH7FVCGOIX33QD5WFSBHSD7WFA7
X-Message-ID-Hash: GU5R4RH7FVCGOIX33QD5WFSBHSD7WFA7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now using c2c_params instead of params.
This patch replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/audio-graph-card2.c |  4 ++--
 sound/soc/generic/simple-card-utils.c | 24 ++++++++++++------------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index d145b74d41e4..25aa79dd55b3 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -920,8 +920,8 @@ int audio_graph2_link_c2c(struct asoc_simple_priv *priv,
 		c2c_conf->channels_min	=
 		c2c_conf->channels_max	= 2; /* update ME */
 
-		dai_link->params	= c2c_conf;
-		dai_link->num_params	= 1;
+		dai_link->c2c_params		= c2c_conf;
+		dai_link->num_c2c_params	= 1;
 	}
 
 	ep0 = port_to_endpoint(port0);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 34a9b91e676f..467edd96eae5 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -562,12 +562,12 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 {
 	struct snd_soc_dai_link *dai_link = rtd->dai_link;
 	struct snd_soc_component *component;
-	struct snd_soc_pcm_stream *params;
+	struct snd_soc_pcm_stream *c2c_params;
 	struct snd_pcm_hardware hw;
 	int i, ret, stream;
 
 	/* Do nothing if it already has Codec2Codec settings */
-	if (dai_link->params)
+	if (dai_link->c2c_params)
 		return 0;
 
 	/* Do nothing if it was DPCM :: BE */
@@ -592,19 +592,19 @@ static int asoc_simple_init_for_codec2codec(struct snd_soc_pcm_runtime *rtd,
 		return ret;
 	}
 
-	params = devm_kzalloc(rtd->dev, sizeof(*params), GFP_KERNEL);
-	if (!params)
+	c2c_params = devm_kzalloc(rtd->dev, sizeof(*c2c_params), GFP_KERNEL);
+	if (!c2c_params)
 		return -ENOMEM;
 
-	params->formats = hw.formats;
-	params->rates = hw.rates;
-	params->rate_min = hw.rate_min;
-	params->rate_max = hw.rate_max;
-	params->channels_min = hw.channels_min;
-	params->channels_max = hw.channels_max;
+	c2c_params->formats		= hw.formats;
+	c2c_params->rates		= hw.rates;
+	c2c_params->rate_min		= hw.rate_min;
+	c2c_params->rate_max		= hw.rate_max;
+	c2c_params->channels_min	= hw.channels_min;
+	c2c_params->channels_max	= hw.channels_max;
 
-	dai_link->params = params;
-	dai_link->num_params = 1;
+	dai_link->c2c_params		= c2c_params;
+	dai_link->num_c2c_params	= 1;
 
 	return 0;
 }
-- 
2.25.1

