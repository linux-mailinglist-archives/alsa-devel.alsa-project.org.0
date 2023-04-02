Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8746D3AD8
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 00:51:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CFE98201;
	Mon,  3 Apr 2023 00:51:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CFE98201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680475918;
	bh=0+WZVoVIpK2i0wqRgbBM4Gq4aNjiyo+VEIa5yQeK444=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=t2+9Tpt1X1pq6gNMvrtHMGN85eCdvMtXVvUDgIIhpxU7ZXsb7Rd3g1aHAqehyV5RC
	 Q2FThQvYWrJBmh7+79fpkbDTmBoyHI6ucBNN/s2/nNCDPr+mJjsHVsE151fISY1jJ9
	 d1Y1b/rBuxSrEYRNqJMwxoWYPFOaLm9tGObOTVUU=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EED3FF8028B;
	Mon,  3 Apr 2023 00:50:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 816D4F80495; Mon,  3 Apr 2023 00:45:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E84A5F80171
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 00:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E84A5F80171
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jIeF4TXn
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U9fx0s8VYHLpYq4G/X+mt5zzMeXr3A5yWEO68BB5DgmzPxJHx/24bsK+Ok/5afGEIiZlYlCYJeYNNqoe43KoLGpdZlU2fcHB7dXOcyDQzTCPMZX8tgndp6EJIseg7RwM1bczb0RVtZj9SMTud7QCkh2fhFniG3j7RjkUsLaso4QFBzUe7Kz50n1QlHWyzukefPFFLOJyiIl5JDJ41iGGup1dxa1HSbAJyb3rCk3krpO2jND68i2VGpe9Aa4wk7jbM9omT4sdYcqeCqDmpILk/ltAVDTYFg9fHXFryEQSZBu0p3LMZosrDGFnuJbAy1HScyESYc+iwrvP33LTCyf9Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwBg/zOqtcmYF3TsCfY/mNktSUPO4DqpciFfU4x69xs=;
 b=h6AezMtTFkbesoFDA19JqiIUs82i+cD94ZIstecfJGa8P+cM6LclU7yP223Ga4dEtTD+syXOlugadVBAjYnONJ/Luquv7QC7fX1//+sao6hpGyUrURkFm6cLsJOL0ab0T7DuvSK1QEGWUvDaKwtBdXko7H26Y4J1nRL8VQL551DY3th8PL9UiiZNWs0mqd3ePsktX6Ide19/W13b6EaYvPQTDjgIfK7jhAqMcFlldDLRu5JbzWKSaefPunyjKXy5rlqJfGaYQ/dHxq19lnpfvgY43v0Nhh0+Hup9qAypkSQ/vCHxL2c/cTkc0/UOObwkwltY8szsbmTAtSE/5oVJ+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwBg/zOqtcmYF3TsCfY/mNktSUPO4DqpciFfU4x69xs=;
 b=jIeF4TXnn4tlm1iSPiO+takGi6SczKkiO0BmVjc5wllnx8D232dLzcFc2gDKaJA4Ca4nHqc1Z5BCUaGtCk03P46OssgU9pT2sjyykCM2ZB0IE9hzNOdgn7wvKvGAPh8sDsOBLE9jd9Y38zg2/BuXYj4kh85rqDlKyzpoF7ozryE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:41:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:41:45 +0000
Message-ID: <87y1n9c3fb.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 1/5] ASoC: soc.h: clarify Codec2Codec params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg7pc3fr.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:41:44 +0000
X-ClientProxiedBy: TYAPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:404:29::21) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11431:EE_
X-MS-Office365-Filtering-Correlation-Id: d6242f66-90ba-42b3-fdea-08db33cb6fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d4OAQdHC7zCq8fgeC5IiiB3p4I3GEtA3anTPrNifZmpyw5iPVCndS9pzW0ZjZ1W6CyodDv4twIY/szRx6bW9XldAj30t1+YZ/TuJg/vEYJla3gkW69kjUUagf7UE1P9vq0J7P1bBlBtI4K/bZ0AoLKNZCmlauE76ORlddtiDt+8gu7h72Ic5d0/dpuvIaOysBYBkut5ro9PeBo9vZTcLb/mNUlEJ4k+VwaePpT6juR2IkgNZ6UwhuhQvbrUuqX7yAzMuOVoK8FhhJIP8pABcZaVGWKgv1kpbQgZBtaAtMZPfDK61lfEhKDCejlon5sjRa10qzbp0Kv5ms9hSGajZ+Mzdu2OdW1U2OVDr4XTYldl0OAcbOQbNhLFq6Gk8WbcoiRmM1Ya7Lhe+TsNGz2V4Y6LXrM5sSgChG9PZf/b72aiJRk5y5MJlvlZ7/hfl36yZDjrNFbUR9OwtYpbJP5T0Q5AgwMSTK6GIxp6rcItjEM1iRBNmjI9nhEz3vTmG/8CGiUG7Y5/nAWT39+MiEyO3y1js5wNRKMEm4BfL5g0AkEPCljJ39mteCVN74qN4phBe+Jt7MOT1CIxgDg5RRLbfayhZCp3/X238oR/wjJFHSMGogXCs/vZBBEzpB6YVET0T
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(4326008)(6916009)(8676002)(66556008)(66476007)(66946007)(478600001)(316002)(8936002)(5660300002)(41300700001)(38100700002)(38350700002)(186003)(83380400001)(2616005)(52116002)(6486002)(6512007)(6506007)(26005)(86362001)(36756003)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?obr9jkl5gNuRxQb/9cgeBjaTToniaRFR3tf/E+U9jHxCRNmfRi5XNyhzBY09?=
 =?us-ascii?Q?JTegOwSBeprCELrJsVSAGogn54zrBq4vGH0FftGTgpce1y10hcx7Zml1Rr7u?=
 =?us-ascii?Q?kNk6aAjhJSjDDhEBqJ9Uxh7iHG8qDoWQv1WBZG1FJqLFcHzV3LTwLqFhFyv1?=
 =?us-ascii?Q?EwWQDmQlmakpkgstwc8s/bZjD3NdeI8KtQ2H/EQep7qRGLI/M4vhQrDJAD1c?=
 =?us-ascii?Q?i2oWDsSo5NGKTQBHOB/K99Khl25EIPnPzdtYqSray2h8wb7gmObCPH7ppwvC?=
 =?us-ascii?Q?GJKM6T0xhH2TSjyqGLytqo4/LxHYQaCCHvOAGHeXQCTxZQEw+ustC85FVVgQ?=
 =?us-ascii?Q?/jJs0VU4VZ1ielPnrdFZGvruc1VGgV/7qWRI52JT/4bJHyYMk6cZFzkQXMJx?=
 =?us-ascii?Q?kYSr+YMnC1qJWrWRU/7DmzurIrHa/m0PxM+TmuH5ZV2iWyxscwnkOSb1jhm/?=
 =?us-ascii?Q?nQPxyLCLHdnUcMvS/phSwbo2sKQhNH7goS8NsMlNvs/63k9d1OchoKpdLYMD?=
 =?us-ascii?Q?819IKQ40/GZSSqo2LjAeQnHjtE+Bkv99LGcESd+ukzJMCreQy4G+y7F5ZtRD?=
 =?us-ascii?Q?wGUBhL5AqCbhO5TH5Z1k7WW5v9/2SG0W0wInDCL/s3ed/dX5sZkpJ8A7ett8?=
 =?us-ascii?Q?ssNYXU6GUhp3c+cGu8JO6c+iCG16ccNZsXnVbLgzGB8P5ZE43SGdxYaVz9WQ?=
 =?us-ascii?Q?DHRP96EcBEUw5yDXK1Qb6P96asG338lfeqW+zmv+1XDhjn1n+uzlyD9hUrhD?=
 =?us-ascii?Q?KYxaTllZAxD+BDaQ35SctNpBQ0pVRdl5mY2BxGZbyXy16G/sy7uMR9epFjJm?=
 =?us-ascii?Q?CCYZM9Nn3hGY7vQtcBAKD9aXAAo/ZKkvS+9wL53wbnVCqvvsJ/yv5WdA3hfA?=
 =?us-ascii?Q?2usFaS5EWnc2FEWhTziGW9uU5XX2Wfd0zthgSe4xmMo/e+pbjNnQWRMm5FP4?=
 =?us-ascii?Q?3lyyyw7BxmOuY6f84HYLsVg9HG/797RZ/XPRmp29LNJpbf4oNy2Mx9yiD7B8?=
 =?us-ascii?Q?RZeX8s5WUMPoBJIiLEY2p0lmcgVkWDSIvAS7pPfEE3A6hinxherXGQBTSmiY?=
 =?us-ascii?Q?2FekHO9whZRHc4kVcHBfHy67CihNv/Ousz2l7IjTL44IoWyYeZC0aZmfYAjj?=
 =?us-ascii?Q?jdT+5Jjb885wPftmbk9afOWmQ3nmCPQeRoFIurW66/IKC4gu7hwziFJ0XGf7?=
 =?us-ascii?Q?WuSKSukrYv8y/5q1BHcdwHBz8cA81GgGAlH3J+LSs6LHims0chsrIO/MxvgP?=
 =?us-ascii?Q?IkwADaBRAiV5jdGZbXEGulJptDQhXF7RCZX+V3CmS10OIabzC0WVxX8uvzM5?=
 =?us-ascii?Q?9LwjzfG7K2ZMvpik3QitmB0AVrxnUg8nr2CgR9cq8+lPA3c66T//lYK2BA14?=
 =?us-ascii?Q?DOgzk16qfkfMRokWxgYkrJU08ZGXdlz4yk/J+Oup+x4srvrwB0RCccyRt5+X?=
 =?us-ascii?Q?Ljc2rsxfaeGJYpIYhZLxoFopBhaI4cmgX3J4hPZ65LPqMdLubxaRtJCxOYX8?=
 =?us-ascii?Q?fYZ4UtwPiC7nWyoK9pES70xJy5WUBCrHqcz6sHiwbby5LJKzOo8bVKI/akgn?=
 =?us-ascii?Q?8rzPwanornNfnzjvXJHL5DQDU2BS+0Ystkz+GZYr95Jg+4wZrmTDLWjW6iIq?=
 =?us-ascii?Q?QCHciZr8zr975hjaJQBhFzQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d6242f66-90ba-42b3-fdea-08db33cb6fbe
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:41:45.0143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ke+E5hfOYpHjgdpjVpkBQ9qECOyzkLUu1SsdtFinK0mHSHKrixGRLjgt2I7bOjpbtaIVKbXZURe+EsLbVRheKbvuiRkuYJ7qqrp+13HX9AXQhmvFbkx+x3yk9dDQ/Wk5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
Message-ID-Hash: 63F6A5XEOFWVUHA5HQV5DWK2WWOIGFS7
X-Message-ID-Hash: 63F6A5XEOFWVUHA5HQV5DWK2WWOIGFS7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/63F6A5XEOFWVUHA5HQV5DWK2WWOIGFS7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

snd_soc_dai_link has params/num_params, but it is unclear that
params for what. This patch clarify it is params for Codec2Codec.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  | 12 +++++++++---
 sound/soc/soc-core.c | 11 +++++++++++
 sound/soc/soc-dapm.c | 44 ++++++++++++++++++++++----------------------
 sound/soc/soc-pcm.c  | 10 +++++-----
 4 files changed, 47 insertions(+), 30 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 57c5786a625b..276afdb1f445 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -684,8 +684,14 @@ struct snd_soc_dai_link {
 
 	int id;	/* optional ID for machine driver link identification */
 
-	const struct snd_soc_pcm_stream *params;
-	unsigned int num_params;
+	/*
+	 * for Codec2Codec
+	 */
+	const struct snd_soc_pcm_stream *c2c_params;
+	unsigned int num_c2c_params;
+
+	const struct snd_soc_pcm_stream *params;	/* REMOVE ME */
+	unsigned int num_params;			/* REMOVE ME */
 
 	unsigned int dai_fmt;           /* format to set on init */
 
@@ -1065,7 +1071,7 @@ struct snd_soc_pcm_runtime {
 	struct snd_soc_dai_link *dai_link;
 	struct snd_pcm_ops ops;
 
-	unsigned int params_select; /* currently selected param for dai link */
+	unsigned int c2c_params_select; /* currently selected c2c_param for dai link */
 
 	/* Dynamic PCM BE runtime data */
 	struct snd_soc_dpcm_runtime dpcm[SNDRV_PCM_STREAM_LAST + 1];
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 9bbcff492c1e..04f1bc8a3128 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2294,6 +2294,9 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
  */
 int snd_soc_register_card(struct snd_soc_card *card)
 {
+	struct snd_soc_dai_link *dai_link;
+	int i;
+
 	if (!card->name || !card->dev)
 		return -EINVAL;
 
@@ -2314,6 +2317,14 @@ int snd_soc_register_card(struct snd_soc_card *card)
 	mutex_init(&card->dapm_mutex);
 	mutex_init(&card->pcm_mutex);
 
+	/* REMOVE ME */
+	for_each_card_prelinks(card, i, dai_link) {
+		if (!dai_link->c2c_params) {
+			dai_link->c2c_params	 = dai_link->params;
+			dai_link->num_c2c_params = dai_link->num_params;
+		}
+	}
+
 	return snd_soc_bind_card(card);
 }
 EXPORT_SYMBOL_GPL(snd_soc_register_card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 34fdcb7ee079..e7a0c28e0cb1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1075,7 +1075,7 @@ static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
 	struct snd_soc_pcm_runtime *rtd = w->priv;
 
 	/* create control for links with > 1 config */
-	if (rtd->dai_link->num_params <= 1)
+	if (rtd->dai_link->num_c2c_params <= 1)
 		return 0;
 
 	/* add kcontrol */
@@ -3864,7 +3864,7 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	 * either party on the link to alter the configuration if
 	 * necessary
 	 */
-	config = rtd->dai_link->params + rtd->params_select;
+	config = rtd->dai_link->c2c_params + rtd->c2c_params_select;
 	if (!config) {
 		dev_err(w->dapm->dev, "ASoC: link config missing\n");
 		ret = -EINVAL;
@@ -4010,7 +4010,7 @@ static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
 
-	ucontrol->value.enumerated.item[0] = rtd->params_select;
+	ucontrol->value.enumerated.item[0] = rtd->c2c_params_select;
 
 	return 0;
 }
@@ -4025,13 +4025,13 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 	if (w->power)
 		return -EBUSY;
 
-	if (ucontrol->value.enumerated.item[0] == rtd->params_select)
+	if (ucontrol->value.enumerated.item[0] == rtd->c2c_params_select)
 		return 0;
 
-	if (ucontrol->value.enumerated.item[0] >= rtd->dai_link->num_params)
+	if (ucontrol->value.enumerated.item[0] >= rtd->dai_link->num_c2c_params)
 		return -EINVAL;
 
-	rtd->params_select = ucontrol->value.enumerated.item[0];
+	rtd->c2c_params_select = ucontrol->value.enumerated.item[0];
 
 	return 1;
 }
@@ -4039,7 +4039,7 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 static void
 snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 			unsigned long *private_value,
-			int num_params,
+			int num_c2c_params,
 			const char **w_param_text)
 {
 	int count;
@@ -4049,7 +4049,7 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 	if (!w_param_text)
 		return;
 
-	for (count = 0 ; count < num_params; count++)
+	for (count = 0 ; count < num_c2c_params; count++)
 		devm_kfree(card->dev, (void *)w_param_text[count]);
 	devm_kfree(card->dev, w_param_text);
 }
@@ -4057,8 +4057,8 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 static struct snd_kcontrol_new *
 snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 			char *link_name,
-			const struct snd_soc_pcm_stream *params,
-			int num_params, const char **w_param_text,
+			const struct snd_soc_pcm_stream *c2c_params,
+			int num_c2c_params, const char **w_param_text,
 			unsigned long *private_value)
 {
 	struct soc_enum w_param_enum[] = {
@@ -4070,10 +4070,10 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 			     snd_soc_dapm_dai_link_put),
 	};
 	struct snd_kcontrol_new *kcontrol_news;
-	const struct snd_soc_pcm_stream *config = params;
+	const struct snd_soc_pcm_stream *config = c2c_params;
 	int count;
 
-	for (count = 0 ; count < num_params; count++) {
+	for (count = 0 ; count < num_c2c_params; count++) {
 		if (!config->stream_name) {
 			dev_warn(card->dapm.dev,
 				"ASoC: anonymous config %d for dai link %s\n",
@@ -4093,7 +4093,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 		config++;
 	}
 
-	w_param_enum[0].items = num_params;
+	w_param_enum[0].items = num_c2c_params;
 	w_param_enum[0].texts = w_param_text;
 
 	*private_value =
@@ -4118,7 +4118,7 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	return kcontrol_news;
 
 outfree_w_param:
-	snd_soc_dapm_free_kcontrol(card, private_value, num_params, w_param_text);
+	snd_soc_dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
 	return NULL;
 }
 
@@ -4146,17 +4146,17 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	w_param_text	= NULL;
 	kcontrol_news	= NULL;
 	num_kcontrols	= 0;
-	if (rtd->dai_link->num_params > 1) {
+	if (rtd->dai_link->num_c2c_params > 1) {
 		w_param_text = devm_kcalloc(card->dev,
-					    rtd->dai_link->num_params,
+					    rtd->dai_link->num_c2c_params,
 					    sizeof(char *), GFP_KERNEL);
 		if (!w_param_text)
 			goto param_fail;
 
 		num_kcontrols = 1;
 		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
-							    rtd->dai_link->params,
-							    rtd->dai_link->num_params,
+							    rtd->dai_link->c2c_params,
+							    rtd->dai_link->num_c2c_params,
 							    w_param_text, &private_value);
 		if (!kcontrol_news)
 			goto param_fail;
@@ -4187,7 +4187,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 outfree_kcontrol_news:
 	devm_kfree(card->dev, (void *)template.kcontrol_news);
 	snd_soc_dapm_free_kcontrol(card, &private_value,
-				   rtd->dai_link->num_params, w_param_text);
+				   rtd->dai_link->num_c2c_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
 name_fail:
@@ -4336,7 +4336,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	struct snd_pcm_str *streams = rtd->pcm->streams;
 	int stream;
 
-	if (dai_link->params) {
+	if (dai_link->c2c_params) {
 		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
 		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
 	} else {
@@ -4349,7 +4349,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (playback_cpu && codec) {
-		if (dai_link->params && !rtd->c2c_widget[stream]) {
+		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "playback");
 			if (IS_ERR(dai))
@@ -4368,7 +4368,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	codec = snd_soc_dai_get_widget(codec_dai, stream);
 
 	if (codec && capture_cpu) {
-		if (dai_link->params && !rtd->c2c_widget[stream]) {
+		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			substream = streams[stream].substream;
 			dai = snd_soc_dapm_new_dai(card, substream, "capture");
 			if (IS_ERR(dai))
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index b830a53ceacb..913a7d98e742 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2793,9 +2793,9 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-		int cpu_capture = rtd->dai_link->params ?
+		int cpu_capture = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = rtd->dai_link->params ?
+		int cpu_playback = rtd->dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -2839,7 +2839,7 @@ static int soc_create_pcm(struct snd_pcm **pcm,
 	int ret;
 
 	/* create the PCM */
-	if (rtd->dai_link->params) {
+	if (rtd->dai_link->c2c_params) {
 		snprintf(new_name, sizeof(new_name), "codec2codec(%s)",
 			 rtd->dai_link->stream_name);
 
@@ -2896,7 +2896,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	 * don't interface with the outside world or application layer
 	 * we don't have to do any special handling on close.
 	 */
-	if (!rtd->dai_link->params)
+	if (!rtd->dai_link->c2c_params)
 		rtd->close_delayed_work_func = snd_soc_close_delayed_work;
 
 	rtd->pcm = pcm;
@@ -2904,7 +2904,7 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	pcm->private_data = rtd;
 	pcm->no_device_suspend = true;
 
-	if (rtd->dai_link->no_pcm || rtd->dai_link->params) {
+	if (rtd->dai_link->no_pcm || rtd->dai_link->c2c_params) {
 		if (playback)
 			pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
 		if (capture)
-- 
2.25.1

