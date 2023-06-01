Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7B718FA4
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 02:44:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3C3F3E7;
	Thu,  1 Jun 2023 02:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3C3F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685580244;
	bh=ydVWKviOmTKO3p4ueF7MWB7eKntytPe/c/DYO0jh7Sg=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oy0VHQfQFGoNMOGuhIKo3yxpjehP3+ZVurD9oDl8WJ0OvNRvd2Squ3W8WkwWNpyEG
	 FZTfEd0NlbTrxs2Cub1O91+EaOK8tqVAucKmKq9D5tIwSBZWrdvL1lirnsaamapW9g
	 sUFvDYx6sqg9iOH8YDYBPgZk/PNGCtIX/p3xlnzw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B396EF80132; Thu,  1 Jun 2023 02:43:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17A72F80132;
	Thu,  1 Jun 2023 02:43:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 600D6F8016B; Thu,  1 Jun 2023 02:43:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No,
 score=-4.7 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 098BAF800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 02:42:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 098BAF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RNCJIEP4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vo6CInDruu31NAUpOPckaHZXPtbkmQCmD4sJsOqHoN1rHxuqD1Y1OI1i1lGO8feQGWf7hi9X0SXx1mBSqxAstrs05NaSLTMMF5EwPKN/Qeww2CGzv4tmtMZactPNC+OMffN/FycDVdTa10j5hkVyNy9NzVIwVl8tU/+DLrdFLxrSCVBuB7iTGd4rgGGK7FhMy+GRkt0mAPE+6FKpUjU+dbbB37CAP2RCAndNsaLHZDHmpRIKEGBbv5kwWrb7S6+MQ5X6kHy5JcpujGZuxleov/P4CR2q6QMJPu/65zBEA6O0TMESdLJ+HKnCHgA+mXmNPC7RIgTt6ffTwTjIfVC32w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw7ZaAgrHs633ne8POEdsdJJMo4CqCXhOswHG0NSeH0=;
 b=Qk7ai2lMgxI4j5ntmBsNN/PfhAUeYT8b946Cqo3A/UxX6pdILm/afKajPoxpxcJXhJ2a/NYN9nD056U+anfYk8WA9aMLizQjRvalwm5Ym/3VMWTyt3DrNp2W1doifLszx4lgvk8kYmEPRhDayL+5zs/Dztd8lBeURQLpbbLucuX9DK+Wju59lgQ7ioKAjPlYhovA8vPjgu7RGpYSLll6t7ZLKCQR2igJ+V9pVySDEXEeu4J1sf/BPLN1zpKlgl70BEkQhDaMO97Tv9zKG67rYJTvWxfU/ub7xx0crLnZKDia18UQqfR/VbY0JRV+aW9BMZ1DdOPMag4jLCTOEp8syw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw7ZaAgrHs633ne8POEdsdJJMo4CqCXhOswHG0NSeH0=;
 b=RNCJIEP4kUFAB42uyBClgJvgbc10r8eqlggJu0mg27jVH3Az+ZZweUscweSOrwGK4lSJJObWb7NQ+FGiB//nOg9HfSW4UCwUjpZUbW/f+HJGTt4L8l6WbGCwaukqLcyQyesQ4q2YMdyb1/6DoH4yl7zWy3nCQDA1sRdTSqZSnyg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYCPR01MB8737.jpnprd01.prod.outlook.com (2603:1096:400:10f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Thu, 1 Jun
 2023 00:42:49 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 00:42:49 +0000
Message-ID: <87fs7cj9mf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: add snd_soc_get_stream_cpu()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 1 Jun 2023 00:42:49 +0000
X-ClientProxiedBy: TYBP286CA0016.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:ce::28) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYCPR01MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 569967b9-aa13-4c4d-73f0-08db6239203f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	auI4FbZnh7/imzNEeM4h1Snss8iTPJtJUpXDGj+3nDwd/vJYDvwr0uQr2YflMmMGt/aEoDsMAxlN0we68NyJh4HcvKnzxbnFa0J3ME0WbpQ6NCPFNUK9MRhRD1WxyAiAAlp0d33U8dYRrVgP6xBGnrH8nnSFWR7iyWzsG0slZ3YrES1PDJkKtPrNl3NrZ5ZQAcrYHXhe72z1Y91N9Gh9lx1V7/YhbMbXq037eWLO6ZaO5YLA8xq3urlI7ukztgy34RgqOoqmpLG3iLr99Hqb01YHuxSvOqud25+Of7EmN0lWoKJPjOAnzrgaQ549xV8AiDanOOnELwJYh+kfse5xJZVq/dbnk9slXosHe5JayLMxJtFJ/1OG7r1jEnfntD762+iIqxg6hEQU4MlMDdcHT9Oylc4EtEdgHA+kv1sKzmnajMAZDicXVqjLscYlzhQX51voYhQ0w5DHmkRom/x5WQu7a/rTTVUeT6Yl1zNPk+/k2gIMb4xc3nOB2y/y+fW3ihxyv5blYI4/ZMpXNwLDvU14MpFDR7WXTReyQd0kXW78K/CBTzf7N5TebgXWes1frgILo0RCgMcovUxZNTPfR6uAmeYN93Mnrz4Z4//lmhpBK6ns2oCWAY4pNti98HDL
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(478600001)(52116002)(6486002)(5660300002)(2616005)(41300700001)(38100700002)(38350700002)(8936002)(2906002)(8676002)(83380400001)(86362001)(26005)(6506007)(66946007)(4326008)(6916009)(66556008)(66476007)(36756003)(6512007)(186003)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YLh5SLz0nZaYMC1pBKraQkjosjpGjtKWPsP/zTRzuGLmm6Cn+UAOmcm/5wRA?=
 =?us-ascii?Q?/8XBOQ1KaBi+lxtRYtR4mYmcnY+4DaR6av3khSgIQr6pFh1L0dbJ7gcigwYo?=
 =?us-ascii?Q?hPijC92HGEuknOsDbvXlFph1iwhT/OioiHMwM0Kdp6SlgqE2qFQRTOXbUdcI?=
 =?us-ascii?Q?vxlz2ecGveqipj5OkpPcA81tzGLVvRbFDTkJYfsiSsbvPnFKFYmiAd2iIpME?=
 =?us-ascii?Q?yRadp4tdcCGSRZ0+BgQEq0HhhmsC6hL6OSGOBv7kb6v5yg+jvizJ0QnwIWip?=
 =?us-ascii?Q?nHutj5FhhaRzisG5ATsgchsih5iJTPwpLbZKLzByWutql/UWFMzgYYwuAX9Y?=
 =?us-ascii?Q?3jk0D+LAuWqmu6ea8aPDtm+tYoPYxnUCDq1Gb/IuG/4zKha69LMAdqFjEbt1?=
 =?us-ascii?Q?z0wE2Gl5Ech19VHn0hzMzaW7mEe19tcy31tB2nPqRpWOvJ+m6i7xYDl6bZti?=
 =?us-ascii?Q?VSApMaqlFq7fiagTnpYDO7lw+8ZgzqLEflfnP1MRVjxQBIuI612VoEU2h7HI?=
 =?us-ascii?Q?Y/BsiJ6fFmeBsuscOIl+YRVaiOuVNWNe/MRRsbuZCsvyB2o/3BR+tH20Q01E?=
 =?us-ascii?Q?vPw7M48kHPgEAueD9VUbH2O2BcSgcocIFIHPhF/rbIkRWWzdhNJ+6RgtzqJE?=
 =?us-ascii?Q?hcbw17jUUtNfOqehppujF6SRnEvQajfPxUXBGOpIFLLufPlI8aMpyEPbbKwR?=
 =?us-ascii?Q?/vb4wHOUGyUFWTsWZSfvLEJf9uQfRWg7zyPQl/Cfm7FOXFV6WDlZjjGUaBiC?=
 =?us-ascii?Q?QezcQcIIp4iTubbgclO6NUeS8hWNsAc8SJNg72UUUsmYNsBEvpwJmf3k3tep?=
 =?us-ascii?Q?H8sEBMGY37cdtvQhNGLpmw5anP+h1eUDrbk3GBirKsP7hhijTTPCSP8vML30?=
 =?us-ascii?Q?Jx7vTX8NTrrY3QAWR30Yxnc1Rmk4v4t21kNo1zlVXp9/S3Y17nQu70++gQXv?=
 =?us-ascii?Q?rm5CySmLDsRQLauAc+zMVUF/Hu9dzn7LFUEb3MfLlWovaLBki/cQpDQYe/63?=
 =?us-ascii?Q?SdY+3b6QeBr39TXhoXGa8rtY+oDnmIWLSNfOWZC2/xl/62h3RV3gxHlJhi80?=
 =?us-ascii?Q?YRU1cOrsW6A8GJJLya4jJlyVbil+oNE9ULY6Ebrh/B2VQ56LULrMob2BUcZ+?=
 =?us-ascii?Q?FgMwdu1M3dT/BlcNPdyoKvUbWMsvRqrR9ybp7wunza2VBYtg+lGbP1H97c3e?=
 =?us-ascii?Q?b21ICuXr/c4KQZhxOKdRSQIrwuQnw4l2/U3CnUPZyT3kY5SgcVuTwx0FrngJ?=
 =?us-ascii?Q?oMVrDYiqYTWJvYjgdWGTWnphHtFsuNsoibcC7R+whB2bhqFyP/fvIuIRV6Uq?=
 =?us-ascii?Q?IfeQW7jY56PBu5mkdf7LP/nAe9Xc9RuUg8xxUv6IQZploPK799uOx2f8sEoj?=
 =?us-ascii?Q?Fvk2qmyqEJuT+JY+Ga65p1tFRkvkInaO29tiYryMzXH3L+Gw1itRFD1jyX+4?=
 =?us-ascii?Q?RDV8mVXDn9WpzMgBXjd9mtFLjjVEP46VqLjmzZwXdfR2UfKXeRRwd5eaCCvk?=
 =?us-ascii?Q?16FKRyNY7kMZRg7evQP6nAYhJpvSBNisbF986zODzbqflPJFSgaXnLDo6l4I?=
 =?us-ascii?Q?94Qlfd4bT3Z89oAyUv9mM/poMlm8ZlpwHyCEdrYu2+HTtsPNgqdvWoLvSL2g?=
 =?us-ascii?Q?MF+Bsvo9fJnnTKbCOHjNVNU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 569967b9-aa13-4c4d-73f0-08db6239203f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 00:42:49.8048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HEiyCR3rtEcJMBl6I7nnm0JE6qLZqiZciJBM/k39YZWOp91Oe1n3GCgrO1S+Z4e3FEKrsWtGM00CSGcnmD3ssVcvFpyhkBqXn/+FOy2QB0OCLGLwo0vzkh4Ua0bsZFeF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8737
Message-ID-Hash: JWV6YGXNHN6BI2WQIBZWF4HBGPAJE7A2
X-Message-ID-Hash: JWV6YGXNHN6BI2WQIBZWF4HBGPAJE7A2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JWV6YGXNHN6BI2WQIBZWF4HBGPAJE7A2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We are using get_stream_cpu() to get CPU stream which cares
Codec2Codec. But it is static function for now, and we want to use it
from other files. This patch makes it global function.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h  |  1 +
 sound/soc/soc-core.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/soc-dapm.c | 35 +----------------------------------
 sound/soc/soc-pcm.c  |  6 ++----
 4 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 533e553a343f..ed79b27b0392 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1292,6 +1292,7 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 	snd_soc_daifmt_clock_provider_from_bitmap(			\
 		snd_soc_daifmt_parse_clock_provider_as_bitmap(np, prefix))
 
+int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream);
 int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b48efc3a08d2..e8308926bd98 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3196,6 +3196,40 @@ unsigned int snd_soc_daifmt_parse_clock_provider_raw(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(snd_soc_daifmt_parse_clock_provider_raw);
 
+int snd_soc_get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream)
+{
+	/*
+	 * [Normal]
+	 *
+	 * Playback
+	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+	 *
+	 * Capture
+	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+	 */
+	if (!dai_link->c2c_params)
+		return stream;
+
+	/*
+	 * [Codec2Codec]
+	 *
+	 * Playback
+	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
+	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
+	 *
+	 * Capture
+	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
+	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
+	 */
+	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		return SNDRV_PCM_STREAM_PLAYBACK;
+
+	return SNDRV_PCM_STREAM_CAPTURE;
+}
+EXPORT_SYMBOL_GPL(snd_soc_get_stream_cpu);
+
 int snd_soc_get_dai_id(struct device_node *ep)
 {
 	struct snd_soc_component *component;
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index f2f04ce693a1..09a197ad6c2c 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4322,39 +4322,6 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
 	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
 }
 
-static int get_stream_cpu(struct snd_soc_dai_link *dai_link, int stream)
-{
-	/*
-	 * [Normal]
-	 *
-	 * Playback
-	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
-	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
-	 *
-	 * Playback
-	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
-	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
-	 */
-	if (!dai_link->c2c_params)
-		return stream;
-
-	/*
-	 * [Codec2Codec]
-	 *
-	 * Playback
-	 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
-	 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
-	 *
-	 * Capture
-	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
-	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
-	 */
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
-		return SNDRV_PCM_STREAM_PLAYBACK;
-
-	return SNDRV_PCM_STREAM_CAPTURE;
-}
-
 static void dapm_connect_dai_pair(struct snd_soc_card *card,
 				  struct snd_soc_pcm_runtime *rtd,
 				  struct snd_soc_dai *codec_dai,
@@ -4372,7 +4339,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	for_each_pcm_streams(stream) {
 		int stream_cpu, stream_codec;
 
-		stream_cpu	= get_stream_cpu(dai_link, stream);
+		stream_cpu	= snd_soc_get_stream_cpu(dai_link, stream);
 		stream_codec	= stream;
 
 		/* connect BE DAI playback if widgets are valid */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 2abeb6f6a4a8..f16402ee5a19 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2781,10 +2781,8 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
-		int cpu_capture = dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback = dai_link->c2c_params ?
-			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
+		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
+		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
 			if (dai_link->num_cpus == 1) {
-- 
2.25.1

