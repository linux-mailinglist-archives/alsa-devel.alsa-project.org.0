Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2799B678E25
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:18:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF4ECEC4;
	Tue, 24 Jan 2023 03:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF4ECEC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526714;
	bh=DqVeTXKXcPs08cYrnDAfKNz0u8s/17iD0wXY44mdbpI=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KQzr4xuPDjvOa3iJxmZdOzuOhn21Oa2p5FAh6+kKdq8rb97X4rdJC/LtOXCkfAjdA
	 leG+cd+bjKmniKT15ulGym4rlG7XauI8gF2MmGID8GQhAZZBLFufUZaowspcKeWnND
	 /xlNqo9wPG1ZH5DgwMocOw5e7SZxPn8DkgoyGFeg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B80EF8055A;
	Tue, 24 Jan 2023 03:17:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F5C8F8055A; Tue, 24 Jan 2023 03:17:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2096.outbound.protection.outlook.com [40.107.114.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43B0FF80549
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:17:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B0FF80549
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=f6z7IsvZ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j04R7e+k2BeZBKS2wQTBbh2gx8TnGGoC80XiWr81JDcG5baox56ssp5KgwRK3nZMrUsyV2AXadD9HfXRGvHY2FhCGvEaJMQAjMFOWFO2SzcMg/6VDhGT3X6sx5K87IxBb7ecmR4T9qbH09P83WmPynYq7pZuSjeeZJEp7OIy8WZRBkTnQPihfGA1v/OZBHCUGJFEgMe4Ylem8V7Lt4AV5gt/uKMwlvNR49dPCP3MMOlDUv1w11CvTeaXFmG/EIKi/MaM1SKCBy60QUhVvPdArhVgV12fG5XxfxSaj0nlSTlNy31n8iAFBrwuEGU9ewJj0bNfzsr3PQGtKP6I9JOGPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVMsoh3ErVqYgiv+oQeiaV4zpyJky2+omTZ2rTxvPEo=;
 b=a9QFTMECXgKxIw+R2ujtBvq2MFc9q7UcZe9T5jfcjRg13CQhzuczR9VdvFMu5QuBXdKzXHYpYxJYHgZCaulrM7vCLhjvwq3R5EIbW3hsZGrdYIFDLcJWupw05UIEhDBvBC1PtjTgAFKYZXxj+fSzG0ZmD/kRSWc/yfH9wiLzOmdWbbPVw6aAIa9vxn2JPz0hS6PMusxvCrAXrb/pksKqkgu0cj/YuKacKtN/BhVvuqytDbIZNHM3pDyWgs4TVKlQKESoBPGWeHuYhfg36Gbs8aNJT5UROQDoQF63BhqVXsGCGkeGaCjuGIAz9uTsHj7uhIwCzxT2cHWDZLWCAGCYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sVMsoh3ErVqYgiv+oQeiaV4zpyJky2+omTZ2rTxvPEo=;
 b=f6z7IsvZ1VoIgwINZTxozY2pwNqzk/fXHDH3xZWtMQ7q/1g3AZSqbZWZubVD4QXlVxId1EdSt4EDKxFDg/dRK7O7JVKP7ANIEiWjZHdue6ib1K/zUESS/LvR8GF+mmldnGvGtpJR+1ry+A+i0FwFUGq7wWg8JNpn2YXfTX3szXw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYBPR01MB5391.jpnprd01.prod.outlook.com (2603:1096:404:8021::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:17:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:17:13 +0000
Message-ID: <87y1pssml2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 25/25] ASoC: soc-dai.h: cleanup Playback/Capture data for
 snd_soc_dai
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:17:13 +0000
X-ClientProxiedBy: TYAPR01CA0186.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYBPR01MB5391:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1b503b-515b-4784-da85-08dafdb11b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8/fo08Xlagga5MEjgJexU+kJgbHFhM3ufpkHhB0fLsap1zlFPllKlwwUXvsBvvXcYXKyBHcObWnCgEsCqxHPZKw4y1veac7MtpR2UoReslRmgCCqMNCOmOWnjxMlrVR6Sh16ZMvt18ozvDQIdVq1j+kdM98HhUd1RwIS6uirQO0RY0PLVlayNH/uOHZpgmYeQIpnvOR6xR2h3Vb+9dRGPZQN6IDYo62nqWPjF+GbFMs3w0B+4BoxUuca3kL5rewkVFicezStIOB5kcPzj6v3OBxkZuWmeYG/zMLrVbq/aLSsOVFIz4pwjcQxOl6W26natGKqigm84t7pxkCU8IB0vEOdpQydjzRnoG48+V2AiIJks2ZKQYIZTlOh50cTjbndgzVv3lNWKSMPchn4cPdTazNwjYr4g8fGQadCLIfLP8sEybGrz1rhG9iVJ+XIStUes/d6bexAIt494P5bQTIYsZubvy47XyFa7BSITJ62CBfN0osi3/QEEkXGPzsaJprqYbZ9OUQsOgKtR0UathFWMWpJbmiewVU7qfejgP733PLIQxiGlIrwNGynalZErQNsyW0ZxLRVJ+tXyLgBM3cZyAEV2vHT5D94jw/V6/62RKK+G72PbxCBWRFTI9UemT0/piPmGkbLFDhEH801XwrOD74838BUR+0MNz31r8XPoXYHI5eI+r/QCXTxVx8v5lKGbIupLJOAoMJM7wtk55Xryw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(366004)(136003)(396003)(376002)(451199015)(36756003)(86362001)(2906002)(38350700002)(38100700002)(5660300002)(8936002)(83380400001)(4326008)(41300700001)(66476007)(6486002)(478600001)(52116002)(6512007)(6916009)(8676002)(186003)(26005)(6506007)(2616005)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eZLeM4waXVq7v+R+bigqAwSa5wA2FSr6ptaGiL7Eaq4U0KwVda3bQiIKe02R?=
 =?us-ascii?Q?Kyat8E4ntQwBSLJAs8FqRsL4xCNwwRcCcDt7eULpiDIjAvaVXm3gACI+2Fm2?=
 =?us-ascii?Q?LadIEhdxdqdygkqYCfqrdskFEZ+OxORYEibMIP6xlLOQ9AzrDX7shjY/TFHs?=
 =?us-ascii?Q?Y7I7sMS5FwGZsSZjgBgTdCxGMTKrrOh5LKhr2ZJiW9hGy6J7QrHZV7tAr0JP?=
 =?us-ascii?Q?84+QTMmZnr55sIfnAfraLhrsVAZbW3cAmEG5BC+Fv/uZ30RuV4GXqH5jRX39?=
 =?us-ascii?Q?LrWLdtCg2Gtby1TTHoEGk6C1cbGnZUabZRb392JZdCw686Fzgq81On4/Jxrc?=
 =?us-ascii?Q?8yBE2rOuKdPfIUQe4C+5G/JP/B9iWbycar+Eng5caVmLiLvQ/z85rH9DRcsC?=
 =?us-ascii?Q?lCA84xFJq23YQyiYh+6N6Me7ymNk2UBSDeLJt8wYAr0ylJskYJIym6HECC7I?=
 =?us-ascii?Q?3dIvOaVq/v16FaXJt/zt2eTvqCI24BV3uuCEpQEqTez3YjF+B8VxmAU0gGc0?=
 =?us-ascii?Q?Ulys3EY5RRsVfyMGWgUXu5QHYXxmoGnKOkx1If8B5sT0hjV6UHn4FXMmgCXz?=
 =?us-ascii?Q?by87zO4wCP7oZEiGUAP381iyD6gD1idqKZJpYl8lbl+m2wM3XU/cx4Qlv/5c?=
 =?us-ascii?Q?FHCo0fIVz9w6Lrz7kPPCXnUAt92/YnqiTn/vZJzMbzZqKXMYVe0qQ6sSkKBy?=
 =?us-ascii?Q?HQxX5uGUPShmc8FEDUExKy4ATE8hYHqY6QyrVyfC61rEXs+lGg6ZfynyjKt2?=
 =?us-ascii?Q?wRZR5xabk3h4ioThAba73GDKHYCEKmVC/tqECyO1UUh+M+fVfmMkArrMy4+G?=
 =?us-ascii?Q?Yb4f/6EbTndEOSNzcJ1ciwaq9mI9S2scUwqn1mI3a6djQVxNdvN3WtnkT8+C?=
 =?us-ascii?Q?uXPesKDl1bbLWPw88H10fgH0yxvZ2no5OgNdgiFhYx4GEvsH78y9TlawuSre?=
 =?us-ascii?Q?iIrHEaqk7uwrQ2rDikaom/Y5jKUrZg9sLqnpuRI5MGN/ja9y0oGP9YlHVcpl?=
 =?us-ascii?Q?ZW4sJe0k97o6SltqfxrYlnYeR2cqvOmMygPAFRIVQRS/KPNPmxMnr8i3fcWo?=
 =?us-ascii?Q?3/8UPdflOKk4bYKkJ0a+7iX8ijt8UHGoxzc7BvJqmSLz00eQRXhfDjq+wT18?=
 =?us-ascii?Q?3MJUnJ5HTWtG8b+2j+FSeTpGZIMKjCAJ/AXYTmOw4uQNjXD4FcIDkeLfUCTn?=
 =?us-ascii?Q?no1pSiw4N1ZM8vLZvfZj5HtH2tSCUm+jZBA9VkPtTCMFxA08UY1CHXFpGcue?=
 =?us-ascii?Q?rWcWm/PyWGymnH5UKOyMoriRrI4ocnOsv+GpUj4yOtvhMU114ZrsaDpjiLvU?=
 =?us-ascii?Q?1hdsZPyzcz6nfdYT+ypQBiZHLXL44U5pAAw0NGP1aVYy6uLsD0lh2prHF265?=
 =?us-ascii?Q?zSV7tN1zXSb6dTMZ7/RdzJHR/k4sPOCccRPF9uzKEjCgJMBEk7SGX/9LmfbR?=
 =?us-ascii?Q?paVsf81s6Gvll6P2hdQls4bEp5KbiIfu6fz9hAaIyR4WOig5kP9Gx2D0i+93?=
 =?us-ascii?Q?Ue1u4LMeO7ANIqVvRDx+8tVSD/O6D7c3JD2gnYdjnbMN6uHQIBO5wm5ojiGI?=
 =?us-ascii?Q?VwEsQT63DvoLhHdafepvsCZq+mrVVQAcLJFm6ncAw77JhTYBXbjYaarNW+MW?=
 =?us-ascii?Q?+zwQNbcktzJnth5Wdj/37XE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1b503b-515b-4784-da85-08dafdb11b55
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:17:13.7246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZzmVJS+LKjnn76ug9ImRmKjGmEIcN8c0heAyUNRpF8I7tewIZywXj3aObq38ZOxpPR5be4pn3Q7pnQZ6eWlfpANGHPjFCTVCwyk3gkI2/bQh4Pllmdnl5HYHbzWQ78AC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYBPR01MB5391
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current snd_soc_dai has data for Playback/Capture, but it is very
random. Someone is array (A), someone is playback/capture (B),
and someone is tx/rx (C);

	struct snd_soc_dai {
		...
(A)		unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1];

(B)		struct snd_soc_dapm_widget *playback_widget;
(B)		struct snd_soc_dapm_widget *capture_widget;

(B)		void *playback_dma_data;
(B)		void *capture_dma_data;

		...

(C)		unsigned int tx_mask;
(C)		unsigned int rx_mask;
	};

Because of it, the code was very complicated.
This patch creates new data structure to merge these into one,
and tidyup the code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 68 ++++++++++++++++-------------------------
 sound/soc/soc-dai.c     |  4 +--
 2 files changed, 28 insertions(+), 44 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 197dc1629708..e3906ecda740 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -423,6 +423,16 @@ struct snd_soc_dai_driver {
 	int remove_order;
 };
 
+/* for Playback/Capture */
+struct snd_soc_dai_stream {
+	struct snd_soc_dapm_widget *widget;
+
+	unsigned int active;	/* usage count */
+	unsigned int tdm_mask;	/* CODEC TDM slot masks and params (for fixup) */
+
+	void *dma_data;		/* DAI DMA data */
+};
+
 /*
  * Digital Audio Interface runtime data.
  *
@@ -437,14 +447,7 @@ struct snd_soc_dai {
 	struct snd_soc_dai_driver *driver;
 
 	/* DAI runtime info */
-	unsigned int stream_active[SNDRV_PCM_STREAM_LAST + 1]; /* usage count */
-
-	struct snd_soc_dapm_widget *playback_widget;
-	struct snd_soc_dapm_widget *capture_widget;
-
-	/* DAI DMA data */
-	void *playback_dma_data;
-	void *capture_dma_data;
+	struct snd_soc_dai_stream stream[SNDRV_PCM_STREAM_LAST + 1];
 
 	/* Symmetry data - only valid if symmetry is being enforced */
 	unsigned int rate;
@@ -454,10 +457,6 @@ struct snd_soc_dai {
 	/* parent platform/codec */
 	struct snd_soc_component *component;
 
-	/* CODEC TDM slot masks and params (for fixup) */
-	unsigned int tx_mask;
-	unsigned int rx_mask;
-
 	struct list_head list;
 
 	/* function mark */
@@ -482,8 +481,7 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 static inline
 struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		dai->playback_widget : dai->capture_widget;
+	return dai->stream[stream].widget;
 }
 
 #define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
@@ -491,10 +489,7 @@ struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int
 static inline
 void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_widget = widget;
-	else
-		dai->capture_widget  = widget;
+	dai->stream[stream].widget = widget;
 }
 
 #define snd_soc_dai_dma_data_get_playback(dai)	snd_soc_dai_dma_data_get(dai, SNDRV_PCM_STREAM_PLAYBACK)
@@ -502,8 +497,7 @@ void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_
 #define snd_soc_dai_get_dma_data(dai, ss)	snd_soc_dai_dma_data_get(dai, ss->stream)
 static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int stream)
 {
-	return (stream == SNDRV_PCM_STREAM_PLAYBACK) ?
-		dai->playback_dma_data : dai->capture_dma_data;
+	return dai->stream[stream].dma_data;
 }
 
 #define snd_soc_dai_dma_data_set_playback(dai, data)	snd_soc_dai_dma_data_set(dai, SNDRV_PCM_STREAM_PLAYBACK, data)
@@ -511,34 +505,30 @@ static inline void *snd_soc_dai_dma_data_get(const struct snd_soc_dai *dai, int
 #define snd_soc_dai_set_dma_data(dai, ss, data)		snd_soc_dai_dma_data_set(dai, ss->stream, data)
 static inline void snd_soc_dai_dma_data_set(struct snd_soc_dai *dai, int stream, void *data)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = data;
-	else
-		dai->capture_dma_data = data;
+	dai->stream[stream].dma_data = data;
 }
 
-static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai,
-					     void *playback, void *capture)
+static inline void snd_soc_dai_init_dma_data(struct snd_soc_dai *dai, void *playback, void *capture)
 {
-	dai->playback_dma_data = playback;
-	dai->capture_dma_data = capture;
+	snd_soc_dai_dma_data_set_playback(dai, playback);
+	snd_soc_dai_dma_data_set_capture(dai,  capture);
 }
 
 static inline unsigned int snd_soc_dai_tdm_mask_get(struct snd_soc_dai *dai, int stream)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		return dai->tx_mask;
-	else
-		return dai->rx_mask;
+	return dai->stream[stream].tdm_mask;
 }
 
 static inline void snd_soc_dai_tdm_mask_set(struct snd_soc_dai *dai, int stream,
 					    unsigned int tdm_mask)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->tx_mask = tdm_mask;
-	else
-		dai->rx_mask = tdm_mask;
+	dai->stream[stream].tdm_mask = tdm_mask;
+}
+
+static inline unsigned int snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
+{
+	/* see snd_soc_dai_action() for setup */
+	return dai->stream[stream].active;
 }
 
 static inline void snd_soc_dai_set_drvdata(struct snd_soc_dai *dai,
@@ -593,10 +583,4 @@ static inline void *snd_soc_dai_get_stream(struct snd_soc_dai *dai,
 		return ERR_PTR(-ENOTSUPP);
 }
 
-static inline unsigned int
-snd_soc_dai_stream_active(struct snd_soc_dai *dai, int stream)
-{
-	return dai->stream_active[stream];
-}
-
 #endif
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 69f534f0d4bf..0119afbd01fc 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -514,7 +514,7 @@ void snd_soc_dai_action(struct snd_soc_dai *dai,
 			int stream, int action)
 {
 	/* see snd_soc_dai_stream_active() */
-	dai->stream_active[stream]	+= action;
+	dai->stream[stream].active	+= action;
 
 	/* see snd_soc_component_active() */
 	dai->component->active		+= action;
@@ -527,7 +527,7 @@ int snd_soc_dai_active(struct snd_soc_dai *dai)
 
 	active = 0;
 	for_each_pcm_streams(stream)
-		active += dai->stream_active[stream];
+		active += dai->stream[stream].active;
 
 	return active;
 }
-- 
2.25.1

