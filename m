Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC396C98EF
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:11:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47E3D84C;
	Mon, 27 Mar 2023 02:11:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47E3D84C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875913;
	bh=EX6JdDVAFcvDm+hApKAYAafoynFntiKdzTGEiqNXisY=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ibqsMOL13O4uZgSkvFR2FSbdjEga/jJMIEKaZQ45N7J8zIKWLKAeNMW3aQmjOdttN
	 AbTXeG5e1szEPbnO3vHzdFcgyGFvwM1jN9Jokt25YO51PlQLDaJX8kTggdbLhwuEkT
	 mWBC/dnj2V684eGOcO1JnQ96pRxTPixkb0sYJ754=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6618EF80548;
	Mon, 27 Mar 2023 02:10:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07EFAF8052E; Mon, 27 Mar 2023 02:10:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDDCEF8032D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:10:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDDCEF8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DvF4wy08
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hyz72RE5XFHySOnmUgcyuBmypn4yhGh8a1CFJ8paXcMa+67CSduTOC5PfCnwZhGlqsINMWz1TU5hd8VpkEZq8C+WITqY4f2jWddtj1/n9JJNWW2r+sKD5pFWm6lO8Wu6dyWjkj80Ap5j+nl5jIviSBYuqK6o/Qy/UXUNqHA4EIcgLlI5ArSUEmiI2ogdIw148YskLtacrPTler3hQnjbfK8I7Ibmftya8osiYaWe9rMYF53l+snFVMIwVOLXgO9zGW+62j4uK7z4xpx+e5HFczRAjGCbf1jwGDoAOJyBUZ/VI/Zym2KJ0ulPUFyuTkrGvatBlGfT7UMz0qcjxq86IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/sZ1aSJboDjo3tjQG8+qjHYxNuAdIvV1BceQpoDqm8=;
 b=ONyAD4Ap2tBh+XuZwRqRf8zLqUY6hIfUAAaDY3T+Gx5CEFHD1fXQgbnoU852stkKRnrQzKdiVwP6dtj7id8Ul8GGk8zkxc+uk41Fg3g1I9BTpKBaxIvJeSFmDLCnlM/cf5vi5F8L1fK7GYz5HwDlkyw49ZtC/Rslr5E4r49ASbXYBb9xrGmJIzQzXcLn+JwvUzE1NFLSXwjP3xgMBnGnMdfb2JShoDETBqie+C/POMe9mu3uOXG1VDUpHvPJLXU2QQEWXuDFrKuX/p1q6j73neqrzIfFaq4b5ERfSRT1pqL9WiR+S9mgfjesVZxfkXHabHJJJr89zab981Yr2B40Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/sZ1aSJboDjo3tjQG8+qjHYxNuAdIvV1BceQpoDqm8=;
 b=DvF4wy08V4lrfvHlo5/mcF/UZsl9e3eVv4a6X6KeCVtXaxQRGMdgnhp9kuvy7V2b0t8hEKy5bjTzd4kYnf2B+hYj+FYY4rnrUIcYYIIODOhfemMGiEKS3spdHwiSFyy1cR2LcO+d195IQAzDX++GvVDcnyPZlvr1V3h5rmK13Bg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 00:10:09 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:10:09 +0000
Message-ID: <87mt3z6om6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: meson: switch to use c2c_params instead of params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:10:09 +0000
X-ClientProxiedBy: TY2PR06CA0034.apcprd06.prod.outlook.com
 (2603:1096:404:2e::22) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: 923f7569-3905-4bc8-e177-08db2e57a0a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9zavJvfGOciEsdO9opMKC/qQITUimmLBkMplC8qb770Ns+PC4bMijvTIJ+w1/ANWank3a/2TJvMkWCjMyAl0Bpnxsr+P/M0VLmWsme51YhafM8SAFnyyJy1bV6dLYbof4Jh9IIAkNimwh947niM/EJ5yNDXyVU119qdF0NlWEaIem14dg91sJ6Dz8QPFJGjnBOmrsZjJdXEWlHoUV5zlAxlxw5i7beKw8jRHL3T0znTT2U3Nxqo5oS0DZkPd7mGP4t2kd2xjuVTxKgXk9MNzNcUl5oZCeKCIstklFYtAR9NbvY080WmX9vyUF8zf0wHb3+teUBEpSr20ZPJ3fNTBNsHUZ0cDkjjxlCfXM94dwhvivwU2/SJplQtUubrB40oit3o7KxTU3O8vrDe4P8XN1RfzpCXEezqf0WuSfD33/flqvZZ6SVf6qocBg8ZZNA7WyDgQPCftCukcg0eey/POtln0oW16WWGHxdZJ7+gtFPTAKQKCb2/s/2ewFGPxkK/vQ0G/dDS4vwSBjflGDVYdZ/Gd/WakjpzBUFp8cRGR/45CTSyGVpu+UYmF8+Ek70xynlMaBxvJ3YKrQ1JFoHL4nBuKOcFl6CSsrbH8JJOuYfLR8Lgok3XTGBNSovvQJE61
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?biMMPEuHKkItszSuCEY3tAr7fYtbfqVWnrMK7wnifhjgAxQOX2Xt25REgnYl?=
 =?us-ascii?Q?ygHIMSg89YyPmrWZoEi/siMKlBW28TutBaYum1wcHe5nSRPJZ0EXICCP1T8R?=
 =?us-ascii?Q?Oc4mlO0iYqLrc8IPK+5sYOaGmLi1RHD5UYQAbcPQeZE4p2INJqtuxZgsoyhj?=
 =?us-ascii?Q?qFhpnveZ1V9DMVj5yQA1XAY1v5X0MvydDCXyJ3PIF7kxmUZ5+jyVNIhJ1o6q?=
 =?us-ascii?Q?IC7ONEAYhbDLvNzF9oUwIF4mLnf24fPO30zJtg23bznq67aB/omDkWknPwHA?=
 =?us-ascii?Q?looigU7VuHT1HlovSJBDsu+GQERsGKy11hnsILhaq3GqCvYRtreBtyHkhoB0?=
 =?us-ascii?Q?DqfihC0OIcUETiFHkt9AiWl9vGiSxPdk5N+sn2bg7tjX1vTrRQhl9RneGe74?=
 =?us-ascii?Q?6vZiWRexzXqlAGt+j1+yqp6UNn1YHO/6szNhJH0NA6ZJw/WRcS/6e4E9JogW?=
 =?us-ascii?Q?etRzK8d5tubGJV8NHHm/aKRHbD529l0ZoIgiKV6qrf7ENy80GdWUg6f2gU7x?=
 =?us-ascii?Q?QK9x+9MnO/SAO3QOsjjwvRGnpMHst6+yeP1iaW7xJvWDc0Js5gH3ioCLzdOC?=
 =?us-ascii?Q?kNkkTvpPijCmR58TazJQUMpHBsOl4bGfdXkpX/D8NZEaX7dFDiShCODXFhVu?=
 =?us-ascii?Q?UxoGrNaG1zliWjVY9QBhd3WW2ZaG4YBQx1bpxP4OJrE5Xbybl0rFG85YtNtM?=
 =?us-ascii?Q?+HC1RBkABdnSOwW2gJnfD9PeKn0SaBo9xARUXPUT5BJH3wp9tjwBUavY6aLX?=
 =?us-ascii?Q?B4AqJUtODM5isKX4c+GrmEf7R6qO4r/1/RTmZcIhbWaRCDqJsLVDlhLf8lHM?=
 =?us-ascii?Q?zByT1nn1KFWn3tK1HaV96gsgGFJnxIEvSzXns9PNV/nFsUswyH6mcOkBzWG2?=
 =?us-ascii?Q?bQG/LENbX7ez6mIDCHzPaNsZ6yncPScPUurnhtxcyVkW4ZFqTvaSTDGNeWoE?=
 =?us-ascii?Q?fKrexz2hoGla7ngN/9gKHo+kzUTB4ja51W1/irFwmHzlAz0ecjLeuOoTMexS?=
 =?us-ascii?Q?ppIJWp2V/dw4dpVpKBtzF522fVfzeySfME0Q4ZndurDNTthnwVG4McWE4p8w?=
 =?us-ascii?Q?f0xaRKzDtye2nqbHOvR7POtKZBUNY5fYQXV8+iAJAnK/ZFjTtiXqPWi6bv0Y?=
 =?us-ascii?Q?LypDI8IQbcfwy7OgB3cXk10QigSXVende0QieMxYby4xxFNmG/3i3680vUTt?=
 =?us-ascii?Q?PEqFUZ3XF0JvJFSHT8r6J+nc1u+lIIH1SXV3F3rd/qliyny2v4elPofwBnKF?=
 =?us-ascii?Q?DXBqHVtSGRYjkUL/N7LGFfXQ3v/5KMx4n/B9RaiaNpo/QiBg6WVneG57anAG?=
 =?us-ascii?Q?wdTsByZrsc8guF7kmUlKwc4nOki+0epflwIEoLLp5VUEazteEjC02hRX2knc?=
 =?us-ascii?Q?Zij68HdkfC5VYwZA6W6gwmvNWgyAwQgrrt2ImnYCKIJwPModHTMUb8Zh81MC?=
 =?us-ascii?Q?h527Icq4qx1tJy0oh1sA5aOlWZcU31ZLXHRNw+VeMOXIfEqnr2Iy9T3Cu4bU?=
 =?us-ascii?Q?8mlVab7vuuzFSjrldf0TzlfpUi6KMzuz6J3LNSGdTC2eBZ+wXqELe7Z0H+PC?=
 =?us-ascii?Q?DSDjqIsG1Ige/PhptU1l4Om3HZ2ZI0zAyCEwH0cBsLrGNbNVKS1ijIhF2F85?=
 =?us-ascii?Q?mZR4i6ukpHdSg/1o73WQkZ0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 923f7569-3905-4bc8-e177-08db2e57a0a0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:10:09.6530
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 axRpnPaSlMPCrjoNAW0kaPEnZvWsCa9fKY6As66PyuOSYf6XYLyQpzUjkrDPE/6TfeumllG4RHdmAjOpE1uqNTXtMK8uyY2KnjdbS85wqUwj2imGnLCdbGLzxk8DGH8L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
Message-ID-Hash: 5BCLZYHOVLNQA52ZA3VM7YMJJC7TCYTD
X-Message-ID-Hash: 5BCLZYHOVLNQA52ZA3VM7YMJJC7TCYTD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5BCLZYHOVLNQA52ZA3VM7YMJJC7TCYTD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 3 ++-
 sound/soc/meson/gx-card.c          | 3 ++-
 sound/soc/meson/meson-codec-glue.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 2b77010c2c5c..a25c397c66c5 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -337,7 +337,8 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 5119434a81c4..58c411d3c489 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -104,7 +104,8 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	/* Or apply codec to codec params if necessary */
 	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 5913486c43ab..e702d408ee96 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -105,13 +105,14 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 	if (!in_data)
 		return -ENODEV;
 
-	if (WARN_ON(!rtd->dai_link->params)) {
+	if (WARN_ON(!rtd->dai_link->c2c_params)) {
 		dev_warn(dai->dev, "codec2codec link expected\n");
 		return -EINVAL;
 	}
 
 	/* Replace link params with the input params */
-	rtd->dai_link->params = &in_data->params;
+	rtd->dai_link->c2c_params = &in_data->params;
+	rtd->dai_link->num_c2c_params = 1;
 
 	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
 }
-- 
2.25.1

