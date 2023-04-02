Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8180F6D3AD9
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BD311F0;
	Mon,  3 Apr 2023 00:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BD311F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476108;
	bh=sz4iDCXT7PTAagtpGIPuVXTbUYqkkdcrBXrS3KwaCaQ=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=r6d1QFsDFNPbkt79r+cUAnE3IJRG5ZwVXTPDWVs7oHe5PABzggeIZXj5I3BAkcDME
	 OiWjL0orcD0CVgC3wLF+yFyI/RJcn5/sG4nXFEsu/0XQZpUJGdrNOX9q/vGIfSFg3b
	 3ExLlMNQqnWXgQP4v2TIDEznsdSaFN5dkRedkbKA=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DEA4DF80249;
	Mon,  3 Apr 2023 00:54:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 465ACF80482; Mon,  3 Apr 2023 00:45:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C3511F8024C
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3511F8024C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gbrB4IOM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pr3p4Eo1qGBziaiFBDw8VbTTY73IMApF7iwZW6sgwJsych400wwWPYqsvfr7RwV1WPfF61M/7sKdcwx0O4zhxyj1of0P/UhHwRGgoguGfCD+BwZu9U6lYfhP9vMu/7dPRgzOW6BB4I6gMOnJGC3aVojEFOWYYkMBh0b7BIwEXH2MkoOuDuz2bItzAKYPE69ATJ6cP0AOdBhp9ZPp3zkb7nVlcvkYS9ignslVpQBNkLKRVOE/mtvu2xj5XQ9ABf03nysFT1Mgo01xZCHwMU8dt9G/mshHNLX44rN4Jsnq5jO4+b6J2xOpsCEjrwwQcYNqRD/Km8ZuJYA2fDOws1IPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Re20iW0tU6v5wpjprpsqbONIhGHGeYlys1G/xOzAsII=;
 b=mgJbsiCOPDNVWs3q4F0XZymvB8uqxMiICH2oCSUb8vaoWidXhVA7asrP9imCQClPDWQGeQz6kqcLkIoBXTIUzUUjdjwZICWPUXU26+nzmqiqI/GmSUtI2VnEy6lsga6z2rmH/83uNrF6qUcLXLlpMDju2KBkbr45kgVE3cDVjOCAc+f+ZO7Me2fi9P0lTpqbCVK+0yRzBVRJ8PKxmqUYFebwB+HxkkYTmtVdvh27rDF/zlnZM09EnsFTp4cvxM1f3cXiEI7Qt0cyctZWMOuf98bzhTlv0Ffp1uBia6EA5Ttyg/nD29SVXSMmxkeYYdyvDPf6jfM+nyc+bEzYih+a1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Re20iW0tU6v5wpjprpsqbONIhGHGeYlys1G/xOzAsII=;
 b=gbrB4IOMv7/1pfba2v9Qlsw4tck6dYpeGHntH4r3Xh/bNsH/DDhOwz2FO/ejzLdtGZiUhZlOUVo2epJN0B0dZXRDE5n5UL+T2iHv5gVD/ZISw79OO+tUr8RqcEnmyp4YNBFGmKZrsSFUml4Aa0hSLZjgq8VesBLutveZhhJBN3M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:41:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:41:49 +0000
Message-ID: <87wn2tc3f6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 2/5] ASoC: audio-graph-card2: switch to use c2c_params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:41:49 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f125fa5-cdf1-42a2-e862-08db33cb729a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2UHuFS/OC7kl11UylRBJm1XVnwu0biNg5IR7TOs79B/OjeTFwXvCOu9ajA3kVHfSOA7qI2mn1dmPKZvp3o6AhN+/Bvj4OqQ7FCZxEaeDP5VedVARQJWNAJJVi9ZhsOFLIVoXfuUWjY+lghxQY2OZ8N+SxNMD8O7EqqlTwOQxN494LN+bOIXwblzV1uje1mUHGkXwK6liLcT+auFUyG9MZ5lLVI5BIEowlv67DJuVg2YYb89vA6QUZbE5ZMvVUCDuN4sNs/lHlemfF2l/iqZDO8qfHg5VRic7XCcZT/bpIkrW5dRUFwMZ5EShc6XxDiQOghRLC00cJy0y3vkvmlUDiPwGGH7+XSVjXpTIDGP3TMy+ZRnoZvfZZrouVTy2aUCZ/UieBBV5Yfq5VbQ7TmvUnJ+q6xmUklokm6ifTD5pIzRjA+1u9xXXnrDYpGelwflRM+verSNiCzK6saRBMNU8teZOm65b9o9ztwqYAmgvmkIKlE2yCKe1kfRO7zBGHsEDa2eDGuJj1Mw/Y/TqMtC3EIV5I5DE5LElpVAN2we7P/D0zFSKmigN97Dr/HnvWfSvvb5CSireGp/3DWenTywmuc+FZQbV4/wXtwzpScLxnmaaanEoxHSorwbDACLcluhc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YSit5/BWBxUiLO3OlMndIeJkuaMfbNuH3tH3jbYMoNm4NDCua8HYKUcQgoWD?=
 =?us-ascii?Q?wHFZe5SduCLJxHwxhvjNEVGO03meM7SPL/PqpEhLZS1u+7f8V2tEGjphYMn8?=
 =?us-ascii?Q?HP6OQjdrfidCxEiAR6Pfv9xaWGV3HzZlwuK2bEfav+5/mOQejJaRfwIafmNz?=
 =?us-ascii?Q?RKuJx710ENEcpxlQMl0XUzBV3vUGoY3ce6QBpXw5hjQctyQS+rKn19B6JEDX?=
 =?us-ascii?Q?4Yg6OefHc2Zs+ygAUsrZUeUExWF6+Zmw9TaDPu4DGmkVQgqcZMlf33BRWf0b?=
 =?us-ascii?Q?1+Kln4xtqKoWC4L7GAM/8YUHwUr0vuCHlxxEIgEVLF+eTIHoKdyMi3iEdPCj?=
 =?us-ascii?Q?dEDQ9nniafI3C0TrmMFaoMe8qjbWieQcgqX8JAzbpCJLeklYT0NZPKTfBHr1?=
 =?us-ascii?Q?vqlmZsgPzRXxmSOBKfuSHJD5gvLup+hrQ0SdTK2a2rnXxRl1TSnniNVat/bk?=
 =?us-ascii?Q?7zFrafoPhoMdB2OW3pvTmNApO1RjgwEUKgoc7obUyZUvR8c+QUwNoxyp/HX7?=
 =?us-ascii?Q?fqOrUrwnIds4zE+37MU3whZUdV64WUXCL6sHFs8x+J5d3I8ItGTSos+/Po9y?=
 =?us-ascii?Q?C6PlOAcxgwRyXjz2ygQpb+I7aI3nyli5U9Rbx+YXLNqgIyE8OYQ+uoYQWBjt?=
 =?us-ascii?Q?wWGktHzfamapnKrFeYv5O6GRvOlE/RpAP6H1acRW6WS+P32oem7BNZky2R4S?=
 =?us-ascii?Q?jcpgFEL8NWfOMIpjM46Z5+7pL3VW2YEzFcUV7BcFxR08wAV88jf5b73CxVUN?=
 =?us-ascii?Q?W4ZqJhWlV5nFy0OjRWqLQZiCN+p2CCHykBdSRZCckAYZ2bJsNfcXhnduWkJM?=
 =?us-ascii?Q?Wsf7eJ+iJNcQjHQ192LvQ1vjSPFjiWg2zKdFiDxoD2RSLOBVCHtDOSp14fcj?=
 =?us-ascii?Q?uAuZkzg/uW59qzEmuw2r6rrabDNyBxKMAOhDbYtTx8V9eHeIYW+6ggOOiWq5?=
 =?us-ascii?Q?ZsUR91mDB7sIJGebywm8nNpPht5A2uKAgke1YVErYJIkxNNhgkq2wdzrhlz/?=
 =?us-ascii?Q?2TpeZl25MfHzY1HdWvanIh8ZAioNfEJs/4QBtoL6yjuAayIyIK9CBmb5vgan?=
 =?us-ascii?Q?Xs0wQDRJ6hx7HO3727j7Gtcp4NlPQqUnG9syx69CgmWKgcDRUj2chwOATJJJ?=
 =?us-ascii?Q?cWQQi73bQC0i9oTzhvlUKu7u69Nc4i2ECslReud2AikRmlbhmPk1pFLY1V6C?=
 =?us-ascii?Q?v3Dua1d5QJVWbaoUReIObo883bkusRxwsDRVk3VtgWuH2k20eGtIBP89GEkW?=
 =?us-ascii?Q?B4DF0asO+bk0BsPkNYVFI1WI+JoLycnvVTVKgL02RyXXfr8Jl95GqOlsM9CC?=
 =?us-ascii?Q?WlCcU+91tPk/4MX45of3lA7WHWU6QikhrMzaIeBtkSW6sEJsUnNmVXGxpW5W?=
 =?us-ascii?Q?pSSbFH8TmbNeSUSS02yQV/4jsjRLiv4exC12aCRammiT/4KEvgrUndKcra9z?=
 =?us-ascii?Q?CqeifCx0sU9HLNYEwbHwNRI/wCTqKxOGd5lV/BUFK1/qyeHg0KyJgOgSNpDG?=
 =?us-ascii?Q?6LNVHzzhcPfjtNm4MXb5aV09HqSBRJDQNvrXAC8HOw1J5ab4dgU11+D0k8E3?=
 =?us-ascii?Q?0GMxmmFWEjBgDPfehDUKLnRlI9yhDgLlXtr3+hUk1Ew9CSVZFyZaRP3I6+Mz?=
 =?us-ascii?Q?fDwOtNcnhoirlsbHGpqnxN8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9f125fa5-cdf1-42a2-e862-08db33cb729a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:41:49.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 lYXMVqmyvZnM8GEjvjzT/REBImRNBlY85g0RN73bsrjqdxUwOMgfFx8Uz7A6JIsgkST9ChkhMM/naiPQeHUlQOzX3D2JveUSOlr8kFlaIZBlBnHZ/g7qB25/30+rgNEu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: JBECPYVX3DINERMFMGYIVS4LC4TTE43R
X-Message-ID-Hash: JBECPYVX3DINERMFMGYIVS4LC4TTE43R
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBECPYVX3DINERMFMGYIVS4LC4TTE43R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 instead of params

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

