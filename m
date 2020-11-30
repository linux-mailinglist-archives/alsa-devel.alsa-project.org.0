Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9D2C7D87
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Nov 2020 05:07:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9116E175E;
	Mon, 30 Nov 2020 05:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9116E175E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606709230;
	bh=7DvGdJVQ90+MK6QoVE9CzxoWwmWGxb57inbFsWleS3w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aQU9V8jXl2EBaa/nZvOQUZeuW8sxbg1mTnd+dR1L6dVxIxBWKy3yjFqKtn+RKzCKc
	 2jpRbfl68GoHT+Q9k+LwmSDqM4c/QR9vlJSFyJwTyCVRmrd1fnQE2XSAjyIUJTYn9S
	 EZth4+CvkkwlZ9wJeGiYz/0LAir3BsWG5yobMr50=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CAD6F804A9;
	Mon, 30 Nov 2020 05:05:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 830A8F8025F; Mon, 30 Nov 2020 05:05:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1B30F80247
 for <alsa-devel@alsa-project.org>; Mon, 30 Nov 2020 05:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B30F80247
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2473C20074A;
 Mon, 30 Nov 2020 05:05:16 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0922320073E;
 Mon, 30 Nov 2020 05:05:11 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C89D540326;
 Mon, 30 Nov 2020 05:05:04 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/2] ASoC: fsl-asoc-card: Add support for si476x codec
Date: Mon, 30 Nov 2020 11:57:47 +0800
Message-Id: <1606708668-28786-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The si476x codec is used for FM radio function on i.MX6
auto board, it only supports recording function.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl-asoc-card.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index a2dd3b6b7fec..f62f81ceab0d 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -131,6 +131,13 @@ static const struct snd_soc_dapm_route audio_map_tx[] = {
 	{"CPU-Playback",  NULL, "ASRC-Playback"},
 };
 
+static const struct snd_soc_dapm_route audio_map_rx[] = {
+	/* 1st half -- Normal DAPM routes */
+	{"CPU-Capture",  NULL, "Capture"},
+	/* 2nd half -- ASRC DAPM routes */
+	{"ASRC-Capture",  NULL, "CPU-Capture"},
+};
+
 /* Add all possible widgets into here without being redundant */
 static const struct snd_soc_dapm_widget fsl_asoc_card_dapm_widgets[] = {
 	SND_SOC_DAPM_LINE("Line Out Jack", NULL),
@@ -653,6 +660,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
+	} else if (of_device_is_compatible(np, "fsl,imx-audio-si476x")) {
+		codec_dai_name = "si476x-codec";
+		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
+		priv->card.dapm_routes = audio_map_rx;
+		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	} else {
 		dev_err(&pdev->dev, "unknown Device Tree compatible\n");
 		ret = -EINVAL;
@@ -869,6 +881,7 @@ static const struct of_device_id fsl_asoc_card_dt_ids[] = {
 	{ .compatible = "fsl,imx-audio-wm8960", },
 	{ .compatible = "fsl,imx-audio-mqs", },
 	{ .compatible = "fsl,imx-audio-wm8524", },
+	{ .compatible = "fsl,imx-audio-si476x", },
 	{}
 };
 MODULE_DEVICE_TABLE(of, fsl_asoc_card_dt_ids);
-- 
2.27.0

