Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF346E77E5
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 12:59:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3B69ED7;
	Wed, 19 Apr 2023 12:59:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3B69ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681901994;
	bh=AmolVCFgeMDWq8Kj2zHBtyGtG0oL5GdaoRIzqUSZl1k=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IIcydgDBaMZj6SfZLO4347uj+jB142VjpWUZYFhWDdO45ZY7iD+w98kNCZf0bPsaG
	 8pFskpjyncULRIWeuQl7r3cyPjHuRQSRfch4uIu4YUQzW3ZrZNJaRQYZVEPILa/qNE
	 iJY0Dr7GY+fEGme6+FCKBqUANiqAS1K3nutC70E4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25E7BF80149;
	Wed, 19 Apr 2023 12:59:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7460AF80155; Wed, 19 Apr 2023 12:58:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5063CF80053
	for <alsa-devel@alsa-project.org>; Wed, 19 Apr 2023 12:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5063CF80053
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ACAD1A11F6;
	Wed, 19 Apr 2023 12:58:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 168121A0F1F;
	Wed, 19 Apr 2023 12:58:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F73D1800254;
	Wed, 19 Apr 2023 18:58:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: kuninori.morimoto.gx@renesas.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
Date: Wed, 19 Apr 2023 18:29:18 +0800
Message-Id: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: IDJS6GE6R3DKW3HH7LHNHVA2FF7JESGE
X-Message-ID-Hash: IDJS6GE6R3DKW3HH7LHNHVA2FF7JESGE
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IDJS6GE6R3DKW3HH7LHNHVA2FF7JESGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.

dai_link->platform is needed. The platform component is
"snd_dmaengine_pcm", which is registered from cpu driver,

If dai_link->platform is not assigned, then platform
component will not be probed, then there will be issue:

aplay: main:831: audio open error: Invalid argument

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-audmix.c | 14 ++++++++++----
 sound/soc/fsl/imx-spdif.c  |  5 ++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2c57fe9d2d08..1292a845c424 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU/Codec/Platform x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 6, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -240,9 +240,11 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[i].cpus = &dlc[0];
 		priv->dai[i].codecs = &dlc[1];
+		priv->dai[i].platforms = &dlc[2];
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
+		priv->dai[i].num_platforms = 1;
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
@@ -250,6 +252,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
+		priv->dai[i].platforms->of_node = args.np;
 		priv->dai[i].dynamic = 1;
 		priv->dai[i].dpcm_playback = 1;
 		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
@@ -264,17 +267,20 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus = &dlc[2];
-		priv->dai[num_dai + i].codecs = &dlc[3];
+		priv->dai[num_dai + i].cpus = &dlc[3];
+		priv->dai[num_dai + i].codecs = &dlc[4];
+		priv->dai[num_dai + i].platforms = &dlc[5];
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
+		priv->dai[num_dai + i].num_platforms = 1;
 
 		priv->dai[num_dai + i].name = be_name;
 		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
 		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
+		priv->dai[num_dai + i].platforms->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].no_pcm = 1;
 		priv->dai[num_dai + i].dpcm_playback = 1;
 		priv->dai[num_dai + i].dpcm_capture  = 1;
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 114b49660193..4446fba755b9 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,7 +26,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
@@ -34,15 +34,18 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
+	data->dai.platforms	= &comp[2];
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
+	data->dai.num_platforms	= 1;
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
 	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
+	data->dai.platforms->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 
-- 
2.34.1

