Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9951736069
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:07:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E859384B;
	Tue, 20 Jun 2023 02:06:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E859384B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219633;
	bh=BLqmRJUn9F1nBCyX2JY7SsN8RIv1UIo3YK91Y/UcbXE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hedEBLMDVhwLS9tNaJO2L6Lnq+DmZjN6Jwn0hNxJbrhgNeiPCXoncU53bLJA3G7OC
	 rPG//js3Vnxvz6ZLKCi/pvywTKwVAQ+eCGbkkVABqc07vS4Z+Ms+pPOFq2nzH+oMKA
	 FLKqnK/Oa4J3OrWWBY2ogTEygmsPseZljZKFyQWQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12891F80571; Tue, 20 Jun 2023 02:06:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D1A8F80549;
	Tue, 20 Jun 2023 02:06:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EE20CF80548; Tue, 20 Jun 2023 02:05:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7CB64F8057D
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:05:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CB64F8057D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BmHGAsLL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxBFrySZ5CcEsYidoU5RjUqNlVlrfZwbVPLH4bbd0OoUga6Mx/j5ftB/ajuIzRdZ2zqY8+xDumyEcjWJskBm/F4fZ3fZJnNE5nT167cVqlLPEUPut+NwHV3WDTf22aVttXtiOFsWAtgwhczUBiGjjZI9KdDYHkJOazZzo9M69DbrnX6cz2dAr+KtqZlr7+3Xn3n2ysbZjmHfYWxn7rmfnTDghrYQpKBHauErNLCBNd6RRQVB6efkSYkcZpuUs+ZIyFVs9rT4ZCFAIa8iBTE3C1oJCc+c30H6fp/AO1RHi5aZUxoOL3g0LYD30TRvakFUbl37wlSPuCh0HSm24vMH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iu6kPir9btboSwNg9Q7irlnTLvxdf78Kp7Djbicz90=;
 b=clBUJ4niTSf43bv21GUqC3NTRC6g5TWG7hjN0VCjVzLzKkXj/pkcoVaqRJqAXU5MFzPrwVsa75lFhjV6ap8qFyNblEkXGMXA8W30y0F4jeosWKNX7I0X1Ok2Hx75k162dktq0i1v/9APV3w9Vpv+wJb+2Y25DNC1azU3jTPkkJz+RubSUShhMXAxrC5XmICsfWMpVO+Vv7BleomwujyV9RTjFztHY+vNFmIgXXO/+X+7g2R+6koFNjtnzWFDOh0klwf+i+uKDtxlgPY87InhGV0XDE4VSGt6KJfzDUDlFNWDEp+wJBCC+OCoHpRCP7x+vum+MFHIu2XqkS2NomtVBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iu6kPir9btboSwNg9Q7irlnTLvxdf78Kp7Djbicz90=;
 b=BmHGAsLLWhZofDmSKGx+SV0/SwUhO/BcZQNYQTy4sjq8hbP6qhH9VJioWZ/MzHF7nJP7LeFyig0Yb6D0NmutEBvhIgbeHSuYaQm4VGcGDZ23o0FqruaJdfR1yu5VWQ9EdDmoHQY6/OOt4Pk+7eIx9iBprWgkUHhwhPQbIlIlDZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10176.jpnprd01.prod.outlook.com (2603:1096:400:1e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:05:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:05:37 +0000
Message-ID: <87352ndmlq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Yingkun Meng <mengyingkun@loongson.cn>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 7/9] ASoC: loongson: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:05:37 +0000
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10176:EE_
X-MS-Office365-Filtering-Correlation-Id: 140990e7-c97b-4940-6d1f-08db712213c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	UQbZH50ndrKY39klO26h6JbDZzewhve9h7UhHNMYN7ecnTA2KXYKVsvBaDCCdGZ/bpqFRDGVUVgP5eMJpfRSJwKVcS7MF86GOkoEkNDirT0M2biT0yqvUtMSwAAeXSH12qiPdImoV+Q7DBcU2M4rVJ1sNicbnVbdPp5i3muoyyfb/y0nwVN+VvIdfM+ffHYhB3+CXeTwsZQyT7RdBqsAWd49dwOX/J6dPxdDAXfACDADGmWhCmtwbCTpZramAVLla7PxAGk4sz52RjJcGIAV8gKFNQoHckvfEQUDmxu399ckvhaKtSiXivt8UAtimOrVbEc7HGY1niFt5BAOPVkRhkv+gKISXD9xXP0e9t47fXEby3SYyrX/A+kmtF3wkSIYb2OJxVl0JN9317AACrpSzeHcJEDRtkWw5RASTI3Q/LMJbirq6B8K4W6rdUn+iY+X9wZTDzv2bEv1arut/wiJWmKyIg3/HwPfPZABexc7F+fqKF3AENE8ZjIgbicuLsbgqfpXqf0No8JbZspJkoVkF15gYXB3v8rGS4gQLukf5Q5TR6xrY1iD1XIUIDi88F/gl4jqtRY24JOfjXoH9j0OLhdvC526H0ohCzIcPt50qEhItY4oT+ZXtFZNR+SE3Lq5
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(366004)(136003)(396003)(451199021)(2906002)(52116002)(6486002)(38100700002)(38350700002)(2616005)(83380400001)(26005)(6506007)(6512007)(186003)(41300700001)(110136005)(86362001)(478600001)(316002)(36756003)(4326008)(66476007)(66556008)(66946007)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LXWiBJe6Xt124iSRSqFf+1SFZzRDttdHaTbqXEtcKwZs16FXQ8Tvrd9MQvaK?=
 =?us-ascii?Q?qTyvR3foT6AlpZIsx5cmtZvXPcDxwhRoZJ1SgDRDQNQrptAmby9SZaXGFfvV?=
 =?us-ascii?Q?5R85o32c3vkCp707xhhwRDreANDwYh/d6+XQ6iwYfLSlRkMiVUokCWB6+V9e?=
 =?us-ascii?Q?xOm6NJlFYqfT7ImVOiOl4XsrK1Yzrbu2N+y9yi9uBc4wkwkSgRxODcz0/nQv?=
 =?us-ascii?Q?MlTPUqCeSNVTxcv4E6Nj6icAKTd07riCfHmWrAicwj5SvgPsOA8q/cxqh5Nh?=
 =?us-ascii?Q?qYu3nX75Jj7Mw5oeZVO1ZC/n5QQbXe/Dowgv8g/+S1vsrHSNRNvxuGt1Ogc9?=
 =?us-ascii?Q?xhMcRJR69bFmZDh6nib4fgkcbtkDoOod0hyKtDxWjiZD0BBxiu+c7w4rlkps?=
 =?us-ascii?Q?jew39JcfjCOzoNG3HLTz8MYOvWL7EdUW11UG+NPE6hfj2oq3VhSzFUHtpI8o?=
 =?us-ascii?Q?B5++zM9Y3BrcryJZqZo6js1jBwnlVKc7vwXsYoggKtO8tLSsIS6dwB2stm/w?=
 =?us-ascii?Q?TLL94HexNcZB+fJ3P//AhYPaq1mynyFILBwkg1NN3pRdzOLQJZ3Y99SXPg2O?=
 =?us-ascii?Q?dc7idzlcarwnfYkimzlaj9Tb9CqdbyiU5mrN4FlJvB+KujT3i17E92t6DBFf?=
 =?us-ascii?Q?MJZqt+Yhx+o1w3do1FshHp5wQUNuMjSayoZfuGhkG6VKQvcL9ZGI7vrbzm+K?=
 =?us-ascii?Q?RlfESHEqJWblKGd4SvMROJeEsywPARseEPN1QI7DY9rIbmlTIFGqKfBSN+HM?=
 =?us-ascii?Q?BovUlB4BDH5pDeQjrMfVHn+UYXioZCNZ1I/jyadhagkd9QqY9NSi04mxm8ym?=
 =?us-ascii?Q?hCl2M1SoBAPhbiFhKrVZnVdJWjDGr+tuNKfPnKMZqFJytGNVqNPM6aACrRNq?=
 =?us-ascii?Q?Q70oiGRJGSWYHLtlhpPUbEe8N4USYaZ/E+oqoTFl4lUmuJ62ac7PzpaPq/bi?=
 =?us-ascii?Q?eMfl20oUsPNnHuSTKGc7AB+xVXiMN8XGcziR5ZyC0AFq0OXx3ewAizO1Y3Gi?=
 =?us-ascii?Q?u1YkJQYAdukHzQXJMKFNyxFXOExC7LAtRMT5hgpaxqtu2iZvhtrbBrPpIYOa?=
 =?us-ascii?Q?0zlTObyouMr/O6RXSiKwvR/vQJn7fLtvpuJeDi53xRlS5DKY0Ha1gvqlq/oi?=
 =?us-ascii?Q?WySC2OZ51XSRGkyeIVIHWQ495cKZPByI5qL24Goqldftt6Gtitob8+wKrrIt?=
 =?us-ascii?Q?cG6IEn8QkzUqT/ibjM1/VSYhcG4Qr4gwLL1AJjKOahlU0pESTglbvSw2lc2G?=
 =?us-ascii?Q?iK3lBvxBaqzDvONyLzXkcsS32+WOE/ofxDw2Yn/qKi/+soKHYh+D864tMl7R?=
 =?us-ascii?Q?rkHls76OE95XECILF3cN3m+5L8sHb8WVzTeJqzFUEs4sAN1zafnmP9FlTT6r?=
 =?us-ascii?Q?H+vaUUCWeofjJfl4IRbaELYpmo0Y+Up3keZ1L5HQiYrLm3GBIdKBVEEh0FzT?=
 =?us-ascii?Q?2qUzQoLSEVTtg4OUGIYxHKC4kLQSr5fl49Zp8PAJlmfpCjq+uat5zpAX0IMj?=
 =?us-ascii?Q?9/mWHaXL1xAsXojO3wbd0RPsgRo/TFLJkcrKJSyztJlWLa1DUN7Yv9ytFVXg?=
 =?us-ascii?Q?ZQKSBFwL95L2hbBpIOTuzkpy8sYs76ATIxrpVbfzDm3QfmSi35DPtuVNBU/q?=
 =?us-ascii?Q?Ij/qJ6+vGbEq3VUZ1MsqZkw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 140990e7-c97b-4940-6d1f-08db712213c5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:05:37.8543
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m6wU586yidzhECPDmMnN3I5VEaJO/nSdBHOcGgJ/F8ETrLqF54AWuhLj6MUTezsLf3byRdpm/YIOKHiReDOjivyf3OlG6FccIDV2gIFJxm8NNgHr5bffkOA7wQZeW2AA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10176
Message-ID-Hash: TWZBTXBOS7S6D3S3LL6YVTNLCJSFGLCV
X-Message-ID-Hash: TWZBTXBOS7S6D3S3LL6YVTNLCJSFGLCV
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWZBTXBOS7S6D3S3LL6YVTNLCJSFGLCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/loongson/loongson_card.c | 34 ++++++++++--------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 08df05cb4328..9ded16329747 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -114,11 +114,9 @@ static int loongson_card_parse_acpi(struct loongson_card_data *data)
 
 static int loongson_card_parse_of(struct loongson_card_data *data)
 {
-	const char *cpu_dai_name, *codec_dai_name;
 	struct device_node *cpu, *codec;
 	struct snd_soc_card *card = &data->snd_card;
 	struct device *dev = card->dev;
-	struct of_phandle_args args;
 	int ret, i;
 
 	cpu = of_get_child_by_name(dev->of_node, "cpu");
@@ -133,30 +131,20 @@ static int loongson_card_parse_of(struct loongson_card_data *data)
 		goto err;
 	}
 
-	ret = of_parse_phandle_with_args(cpu, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		dev_err(dev, "codec node missing #sound-dai-cells\n");
-		goto err;
-	}
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].cpus->of_node = args.np;
+	for (i = 0; i < card->num_links; i++) {
+		ret = snd_soc_of_get_dlc(cpu, NULL, loongson_dai_links[i].cpus, 0);
+		if (ret < 0) {
+			dev_err(dev, "getting cpu dlc error (%d)\n", ret);
+			goto err;
+		}
 
-	ret = of_parse_phandle_with_args(codec, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		dev_err(dev, "codec node missing #sound-dai-cells\n");
-		goto err;
+		ret = snd_soc_of_get_dlc(codec, NULL, loongson_dai_links[i].codecs, 0);
+		if (ret < 0) {
+			dev_err(dev, "getting codec dlc error (%d)\n", ret);
+			goto err;
+		}
 	}
-	for (i = 0; i < card->num_links; i++)
-		loongson_dai_links[i].codecs->of_node = args.np;
 
-	snd_soc_of_get_dai_name(cpu, &cpu_dai_name);
-	snd_soc_of_get_dai_name(codec, &codec_dai_name);
-	for (i = 0; i < card->num_links; i++) {
-		loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
-		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
-	}
 	of_node_put(cpu);
 	of_node_put(codec);
 
-- 
2.25.1

