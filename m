Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7164715C568
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 16:57:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02A3E16B1;
	Thu, 13 Feb 2020 16:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02A3E16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581609444;
	bh=qqz0v2PrtHAAe2/dJgCF6d1P1gST0ENq43KZhVpHXT8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JGF9XQUXLOTf69FJlQIN4kmvaaCPDDI5bKBmAguqge9IdcFN+wu3XNXcYDX5PfJLc
	 BPISkCX6OQyjfDMdFYT/4bYh2dHdpwCVE+IRaIqo55cyJdVg4waM1Up2VE6TIIZOdo
	 Gd2fo1iqL87qcPh/g2cBW3rHLaOLir8Dq+95uyVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CCBBF802A0;
	Thu, 13 Feb 2020 16:52:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43825F8028D; Thu, 13 Feb 2020 16:52:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B41D8F80139
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 16:52:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B41D8F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="DMHZs9a0"
Received: by mail-wr1-x444.google.com with SMTP id y11so7281843wrt.6
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 07:52:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4WPEvhR2pAZfhX0aVsM50RbBRm4cA38Sd805YBkQtMk=;
 b=DMHZs9a0aAPx45wFQuTCbMAxf3DgDCmf1DbO/4S9iEFFrEaJMWH5wESyXzHow00Vdz
 9D5ccg59dXNV6Q1DHKBUDqlcMyTLJI/oc5iLul0hfHRvF9+afktNj6voH5wfKTUfKIVA
 9QJxTKFeT0S+fUew4dGeRv6OKGTL4vgh9M3x45hFytXe/yPCswPP04khE3sXApUGpmok
 1Bm9WKbfek9//iwCJ4CmVUJwFILKvAkuW5nVy9OpE8GpX9q7rCVyBnhSSpEv362ZDhwU
 v8dfxSXlVal5zunKIUhCdjW0rAFJhI/z8CMJfPJ36Se9QM7vHnyAx3IZyLoO3Ra3Z3Bv
 Ordg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4WPEvhR2pAZfhX0aVsM50RbBRm4cA38Sd805YBkQtMk=;
 b=jk/tsm0SRjf9aoai0wd0i/SG9S3YWNMSP5X5/9OE5U66coqN8A8xBQeJuP4m+oQIrM
 DcFz72hhVwRce+T4/BTsmDTPC01UeHeX/meYUOhk/fvZ2Z2m6r2Ko5gQONEAqS/7hMvp
 gtU9oCiB1jVTDUGbQ0/QU9ujs0jm47Dza9kgg8CfwWSX0lHR4VcgzTWnq7TU+wr3LF+n
 gTlgHmq8N0oiMQEIkqKchMIuUiCW8iMPMvNGz6n9s9iBEBRX2fDKn8K2GGfqNv8gA9iP
 +DEvY9TcggrK/NjN8GPs0nM9h88bAiHyPW9bjV/uYZDckWLSRSEUaQ5TaW7gKr17hcQH
 odIA==
X-Gm-Message-State: APjAAAXOhEb44W/ro4ZuLW2djYhoU14WhmHJLD6+6Ct9I+RQTzNQF0M3
 zNsOlrmyqQg+YcAMi8mE7kqdcQ==
X-Google-Smtp-Source: APXvYqyIkQB2/f1itZ4PHqKUh88XBFrRjwRtpuONmJqy6bgqVCo6U0/mH9vWSFXMdHq9RuFkA56RDA==
X-Received: by 2002:a5d:6082:: with SMTP id w2mr22444595wrt.300.1581609134905; 
 Thu, 13 Feb 2020 07:52:14 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id e1sm3319814wrt.84.2020.02.13.07.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2020 07:52:14 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Date: Thu, 13 Feb 2020 16:51:57 +0100
Message-Id: <20200213155159.3235792-8-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: [alsa-devel] [PATCH 7/9] ASoC: meson: axg: extract sound card utils
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This prepares the addition of the GX SoC family sound card driver.
The GX sound card, while slightly different, will be similar to the
AXG one. The purpose of this change is to share the utils common to
both sound card driver.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/Kconfig            |   4 +
 sound/soc/meson/Makefile           |   2 +
 sound/soc/meson/axg-card.c         | 403 ++---------------------------
 sound/soc/meson/meson-card-utils.c | 385 +++++++++++++++++++++++++++
 sound/soc/meson/meson-card.h       |  55 ++++
 5 files changed, 473 insertions(+), 376 deletions(-)
 create mode 100644 sound/soc/meson/meson-card-utils.c
 create mode 100644 sound/soc/meson/meson-card.h

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 19de97ae4ce9..347fa78e309a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -59,6 +59,7 @@ config SND_MESON_AXG_TDMOUT
 config SND_MESON_AXG_SOUND_CARD
 	tristate "Amlogic AXG Sound Card Support"
 	select SND_MESON_AXG_TDM_INTERFACE
+	select SND_MESON_CARD_UTILS
 	imply SND_MESON_AXG_FRDDR
 	imply SND_MESON_AXG_TODDR
 	imply SND_MESON_AXG_TDMIN
@@ -94,6 +95,9 @@ config SND_MESON_AXG_PDM
 	  Select Y or M to add support for PDM input embedded
 	  in the Amlogic AXG SoC family
 
+config SND_MESON_CARD_UTILS
+       tristate
+
 config SND_MESON_CODEC_GLUE
 	tristate
 
diff --git a/sound/soc/meson/Makefile b/sound/soc/meson/Makefile
index 80f9113701b3..bef2b72fd7a7 100644
--- a/sound/soc/meson/Makefile
+++ b/sound/soc/meson/Makefile
@@ -19,6 +19,7 @@ snd-soc-meson-axg-sound-card-objs := axg-card.o
 snd-soc-meson-axg-spdifin-objs := axg-spdifin.o
 snd-soc-meson-axg-spdifout-objs := axg-spdifout.o
 snd-soc-meson-axg-pdm-objs := axg-pdm.o
+snd-soc-meson-card-utils-objs := meson-card-utils.o
 snd-soc-meson-codec-glue-objs := meson-codec-glue.o
 snd-soc-meson-g12a-tohdmitx-objs := g12a-tohdmitx.o
 
@@ -34,5 +35,6 @@ obj-$(CONFIG_SND_MESON_AXG_SOUND_CARD) += snd-soc-meson-axg-sound-card.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFIN) += snd-soc-meson-axg-spdifin.o
 obj-$(CONFIG_SND_MESON_AXG_SPDIFOUT) += snd-soc-meson-axg-spdifout.o
 obj-$(CONFIG_SND_MESON_AXG_PDM) += snd-soc-meson-axg-pdm.o
+obj-$(CONFIG_SND_MESON_CARD_UTILS) += snd-soc-meson-card-utils.o
 obj-$(CONFIG_SND_MESON_CODEC_GLUE) += snd-soc-meson-codec-glue.o
 obj-$(CONFIG_SND_MESON_G12A_TOHDMITX) += snd-soc-meson-g12a-tohdmitx.o
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 1f698adde506..372dc696cc8e 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -9,11 +9,7 @@
 #include <sound/soc-dai.h>
 
 #include "axg-tdm.h"
-
-struct axg_card {
-	struct snd_soc_card card;
-	void **link_data;
-};
+#include "meson-card.h"
 
 struct axg_dai_link_tdm_mask {
 	u32 tx;
@@ -41,161 +37,15 @@ static const struct snd_soc_pcm_stream codec_params = {
 	.channels_max = 8,
 };
 
-#define PREFIX "amlogic,"
-
-static int axg_card_reallocate_links(struct axg_card *priv,
-				     unsigned int num_links)
-{
-	struct snd_soc_dai_link *links;
-	void **ldata;
-
-	links = krealloc(priv->card.dai_link,
-			 num_links * sizeof(*priv->card.dai_link),
-			 GFP_KERNEL | __GFP_ZERO);
-	ldata = krealloc(priv->link_data,
-			 num_links * sizeof(*priv->link_data),
-			 GFP_KERNEL | __GFP_ZERO);
-
-	if (!links || !ldata) {
-		dev_err(priv->card.dev, "failed to allocate links\n");
-		return -ENOMEM;
-	}
-
-	priv->card.dai_link = links;
-	priv->link_data = ldata;
-	priv->card.num_links = num_links;
-	return 0;
-}
-
-static int axg_card_parse_dai(struct snd_soc_card *card,
-			      struct device_node *node,
-			      struct device_node **dai_of_node,
-			      const char **dai_name)
-{
-	struct of_phandle_args args;
-	int ret;
-
-	if (!dai_name || !dai_of_node || !node)
-		return -EINVAL;
-
-	ret = of_parse_phandle_with_args(node, "sound-dai",
-					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(card->dev, "can't parse dai %d\n", ret);
-		return ret;
-	}
-	*dai_of_node = args.np;
-
-	return snd_soc_get_dai_name(&args, dai_name);
-}
-
-static int axg_card_set_link_name(struct snd_soc_card *card,
-				  struct snd_soc_dai_link *link,
-				  struct device_node *node,
-				  const char *prefix)
-{
-	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
-				    prefix, node->full_name);
-	if (!name)
-		return -ENOMEM;
-
-	link->name = name;
-	link->stream_name = name;
-
-	return 0;
-}
-
-static void axg_card_clean_references(struct axg_card *priv)
-{
-	struct snd_soc_card *card = &priv->card;
-	struct snd_soc_dai_link *link;
-	struct snd_soc_dai_link_component *codec;
-	struct snd_soc_aux_dev *aux;
-	int i, j;
-
-	if (card->dai_link) {
-		for_each_card_prelinks(card, i, link) {
-			if (link->cpus)
-				of_node_put(link->cpus->of_node);
-			for_each_link_codecs(link, j, codec)
-				of_node_put(codec->of_node);
-		}
-	}
-
-	if (card->aux_dev) {
-		for_each_card_pre_auxs(card, i, aux)
-			of_node_put(aux->dlc.of_node);
-	}
-
-	kfree(card->dai_link);
-	kfree(priv->link_data);
-}
-
-static int axg_card_add_aux_devices(struct snd_soc_card *card)
-{
-	struct device_node *node = card->dev->of_node;
-	struct snd_soc_aux_dev *aux;
-	int num, i;
-
-	num = of_count_phandle_with_args(node, "audio-aux-devs", NULL);
-	if (num == -ENOENT) {
-		/*
-		 * It is ok to have no auxiliary devices but for this card it
-		 * is a strange situtation. Let's warn the about it.
-		 */
-		dev_warn(card->dev, "card has no auxiliary devices\n");
-		return 0;
-	} else if (num < 0) {
-		dev_err(card->dev, "error getting auxiliary devices: %d\n",
-			num);
-		return num;
-	}
-
-	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
-	if (!aux)
-		return -ENOMEM;
-	card->aux_dev = aux;
-	card->num_aux_devs = num;
-
-	for_each_card_pre_auxs(card, i, aux) {
-		aux->dlc.of_node =
-			of_parse_phandle(node, "audio-aux-devs", i);
-		if (!aux->dlc.of_node)
-			return -EINVAL;
-	}
-
-	return 0;
-}
-
 static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct axg_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
 		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
-	struct snd_soc_dai *codec_dai;
-	unsigned int mclk;
-	int ret, i;
-
-	if (be->mclk_fs) {
-		mclk = params_rate(params) * be->mclk_fs;
-
-		for_each_rtd_codec_dai(rtd, i, codec_dai) {
-			ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
-						     SND_SOC_CLOCK_IN);
-			if (ret && ret != -ENOTSUPP)
-				return ret;
-		}
-
-		ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk,
-					     SND_SOC_CLOCK_OUT);
-		if (ret && ret != -ENOTSUPP)
-			return ret;
-	}
 
-	return 0;
+	return meson_card_i2s_set_sysclk(substream, params, be->mclk_fs);
 }
 
 static const struct snd_soc_ops axg_card_tdm_be_ops = {
@@ -204,7 +54,7 @@ static const struct snd_soc_ops axg_card_tdm_be_ops = {
 
 static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct axg_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
 		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
 	struct snd_soc_dai *codec_dai;
@@ -234,7 +84,7 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 
 static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct axg_card *priv = snd_soc_card_get_drvdata(rtd->card);
+	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
 		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
 	int ret;
@@ -253,14 +103,14 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 				     int *index)
 {
-	struct axg_card *priv = snd_soc_card_get_drvdata(card);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *pad = &card->dai_link[*index];
 	struct snd_soc_dai_link *lb;
 	struct snd_soc_dai_link_component *dlc;
 	int ret;
 
 	/* extend links */
-	ret = axg_card_reallocate_links(priv, card->num_links + 1);
+	ret = meson_card_reallocate_links(card, card->num_links + 1);
 	if (ret)
 		return ret;
 
@@ -304,32 +154,6 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	return 0;
 }
 
-static unsigned int axg_card_parse_daifmt(struct device_node *node,
-					  struct device_node *cpu_node)
-{
-	struct device_node *bitclkmaster = NULL;
-	struct device_node *framemaster = NULL;
-	unsigned int daifmt;
-
-	daifmt = snd_soc_of_parse_daifmt(node, PREFIX,
-					 &bitclkmaster, &framemaster);
-	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
-
-	/* If no master is provided, default to cpu master */
-	if (!bitclkmaster || bitclkmaster == cpu_node) {
-		daifmt |= (!framemaster || framemaster == cpu_node) ?
-			SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBS_CFM;
-	} else {
-		daifmt |= (!framemaster || framemaster == cpu_node) ?
-			SND_SOC_DAIFMT_CBM_CFS : SND_SOC_DAIFMT_CBM_CFM;
-	}
-
-	of_node_put(bitclkmaster);
-	of_node_put(framemaster);
-
-	return daifmt;
-}
-
 static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 					struct snd_soc_dai_link *link,
 					struct device_node *node,
@@ -424,7 +248,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 			      struct device_node *node,
 			      int *index)
 {
-	struct axg_card *priv = snd_soc_card_get_drvdata(card);
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *link = &card->dai_link[*index];
 	struct axg_dai_link_tdm_data *be;
 	int ret;
@@ -438,7 +262,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 	/* Setup tdm link */
 	link->ops = &axg_card_tdm_be_ops;
 	link->init = axg_card_tdm_dai_init;
-	link->dai_fmt = axg_card_parse_daifmt(node, link->cpus->of_node);
+	link->dai_fmt = meson_card_parse_daifmt(node, link->cpus->of_node);
 
 	of_property_read_u32(node, "mclk-fs", &be->mclk_fs);
 
@@ -462,97 +286,24 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 	return 0;
 }
 
-static int axg_card_set_be_link(struct snd_soc_card *card,
-				struct snd_soc_dai_link *link,
-				struct device_node *node)
-{
-	struct snd_soc_dai_link_component *codec;
-	struct device_node *np;
-	int ret, num_codecs;
-
-	link->no_pcm = 1;
-	link->dpcm_playback = 1;
-	link->dpcm_capture = 1;
-
-	num_codecs = of_get_child_count(node);
-	if (!num_codecs) {
-		dev_err(card->dev, "be link %s has no codec\n",
-			node->full_name);
-		return -EINVAL;
-	}
-
-	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
-	if (!codec)
-		return -ENOMEM;
-
-	link->codecs = codec;
-	link->num_codecs = num_codecs;
-
-	for_each_child_of_node(node, np) {
-		ret = axg_card_parse_dai(card, np, &codec->of_node,
-					 &codec->dai_name);
-		if (ret) {
-			of_node_put(np);
-			return ret;
-		}
-
-		codec++;
-	}
-
-	ret = axg_card_set_link_name(card, link, node, "be");
-	if (ret)
-		dev_err(card->dev, "error setting %pOFn link name\n", np);
-
-	return ret;
-}
-
-static int axg_card_set_fe_link(struct snd_soc_card *card,
-				struct snd_soc_dai_link *link,
-				struct device_node *node,
-				bool is_playback)
-{
-	struct snd_soc_dai_link_component *codec;
-
-	codec = devm_kzalloc(card->dev, sizeof(*codec), GFP_KERNEL);
-	if (!codec)
-		return -ENOMEM;
-
-	link->codecs = codec;
-	link->num_codecs = 1;
-
-	link->dynamic = 1;
-	link->dpcm_merged_format = 1;
-	link->dpcm_merged_chan = 1;
-	link->dpcm_merged_rate = 1;
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-	link->codecs->name = "snd-soc-dummy";
-
-	if (is_playback)
-		link->dpcm_playback = 1;
-	else
-		link->dpcm_capture = 1;
-
-	return axg_card_set_link_name(card, link, node, "fe");
-}
-
 static int axg_card_cpu_is_capture_fe(struct device_node *np)
 {
-	return of_device_is_compatible(np, PREFIX "axg-toddr");
+	return of_device_is_compatible(np, DT_PREFIX "axg-toddr");
 }
 
 static int axg_card_cpu_is_playback_fe(struct device_node *np)
 {
-	return of_device_is_compatible(np, PREFIX "axg-frddr");
+	return of_device_is_compatible(np, DT_PREFIX "axg-frddr");
 }
 
 static int axg_card_cpu_is_tdm_iface(struct device_node *np)
 {
-	return of_device_is_compatible(np, PREFIX "axg-tdm-iface");
+	return of_device_is_compatible(np, DT_PREFIX "axg-tdm-iface");
 }
 
 static int axg_card_cpu_is_codec(struct device_node *np)
 {
-	return of_device_is_compatible(np, PREFIX "g12a-tohdmitx");
+	return of_device_is_compatible(np, DT_PREFIX "g12a-tohdmitx");
 }
 
 static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
@@ -569,17 +320,17 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	dai_link->cpus = cpu;
 	dai_link->num_cpus = 1;
 
-	ret = axg_card_parse_dai(card, np, &dai_link->cpus->of_node,
-				 &dai_link->cpus->dai_name);
+	ret = meson_card_parse_dai(card, np, &dai_link->cpus->of_node,
+				   &dai_link->cpus->dai_name);
 	if (ret)
 		return ret;
 
 	if (axg_card_cpu_is_playback_fe(dai_link->cpus->of_node))
-		ret = axg_card_set_fe_link(card, dai_link, np, true);
+		ret = meson_card_set_fe_link(card, dai_link, np, true);
 	else if (axg_card_cpu_is_capture_fe(dai_link->cpus->of_node))
-		ret = axg_card_set_fe_link(card, dai_link, np, false);
+		ret = meson_card_set_fe_link(card, dai_link, np, false);
 	else
-		ret = axg_card_set_be_link(card, dai_link, np);
+		ret = meson_card_set_be_link(card, dai_link, np);
 
 	if (ret)
 		return ret;
@@ -592,121 +343,21 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	return ret;
 }
 
-static int axg_card_add_links(struct snd_soc_card *card)
-{
-	struct axg_card *priv = snd_soc_card_get_drvdata(card);
-	struct device_node *node = card->dev->of_node;
-	struct device_node *np;
-	int num, i, ret;
-
-	num = of_get_child_count(node);
-	if (!num) {
-		dev_err(card->dev, "card has no links\n");
-		return -EINVAL;
-	}
-
-	ret = axg_card_reallocate_links(priv, num);
-	if (ret)
-		return ret;
-
-	i = 0;
-	for_each_child_of_node(node, np) {
-		ret = axg_card_add_link(card, np, &i);
-		if (ret) {
-			of_node_put(np);
-			return ret;
-		}
-
-		i++;
-	}
-
-	return 0;
-}
-
-static int axg_card_parse_of_optional(struct snd_soc_card *card,
-				      const char *propname,
-				      int (*func)(struct snd_soc_card *c,
-						  const char *p))
-{
-	/* If property is not provided, don't fail ... */
-	if (!of_property_read_bool(card->dev->of_node, propname))
-		return 0;
-
-	/* ... but do fail if it is provided and the parsing fails */
-	return func(card, propname);
-}
+static const struct meson_card_match_data axg_card_match_data = {
+	.add_link = axg_card_add_link,
+};
 
 static const struct of_device_id axg_card_of_match[] = {
-	{ .compatible = "amlogic,axg-sound-card", },
-	{}
+	{
+		.compatible = "amlogic,axg-sound-card",
+		.data = &axg_card_match_data,
+	}, {}
 };
 MODULE_DEVICE_TABLE(of, axg_card_of_match);
 
-static int axg_card_probe(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct axg_card *priv;
-	int ret;
-
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	platform_set_drvdata(pdev, priv);
-	snd_soc_card_set_drvdata(&priv->card, priv);
-
-	priv->card.owner = THIS_MODULE;
-	priv->card.dev = dev;
-
-	ret = snd_soc_of_parse_card_name(&priv->card, "model");
-	if (ret < 0)
-		return ret;
-
-	ret = axg_card_parse_of_optional(&priv->card, "audio-routing",
-					 snd_soc_of_parse_audio_routing);
-	if (ret) {
-		dev_err(dev, "error while parsing routing\n");
-		return ret;
-	}
-
-	ret = axg_card_parse_of_optional(&priv->card, "audio-widgets",
-					 snd_soc_of_parse_audio_simple_widgets);
-	if (ret) {
-		dev_err(dev, "error while parsing widgets\n");
-		return ret;
-	}
-
-	ret = axg_card_add_links(&priv->card);
-	if (ret)
-		goto out_err;
-
-	ret = axg_card_add_aux_devices(&priv->card);
-	if (ret)
-		goto out_err;
-
-	ret = devm_snd_soc_register_card(dev, &priv->card);
-	if (ret)
-		goto out_err;
-
-	return 0;
-
-out_err:
-	axg_card_clean_references(priv);
-	return ret;
-}
-
-static int axg_card_remove(struct platform_device *pdev)
-{
-	struct axg_card *priv = platform_get_drvdata(pdev);
-
-	axg_card_clean_references(priv);
-
-	return 0;
-}
-
 static struct platform_driver axg_card_pdrv = {
-	.probe = axg_card_probe,
-	.remove = axg_card_remove,
+	.probe = meson_card_probe,
+	.remove = meson_card_remove,
 	.driver = {
 		.name = "axg-sound-card",
 		.of_match_table = axg_card_of_match,
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
new file mode 100644
index 000000000000..a70d244ef88b
--- /dev/null
+++ b/sound/soc/meson/meson-card-utils.c
@@ -0,0 +1,385 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright (c) 2020 BayLibre, SAS.
+// Author: Jerome Brunet <jbrunet@baylibre.com>
+
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <sound/soc.h>
+
+#include "meson-card.h"
+
+int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      unsigned int mclk_fs)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	unsigned int mclk;
+	int ret, i;
+
+	if (!mclk_fs)
+		return 0;
+
+	mclk = params_rate(params) * mclk_fs;
+
+	for_each_rtd_codec_dai(rtd, i, codec_dai) {
+		ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk,
+					     SND_SOC_CLOCK_IN);
+		if (ret && ret != -ENOTSUPP)
+			return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(rtd->cpu_dai, 0, mclk,
+				     SND_SOC_CLOCK_OUT);
+	if (ret && ret != -ENOTSUPP)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_card_i2s_set_sysclk);
+
+int meson_card_reallocate_links(struct snd_soc_card *card,
+				unsigned int num_links)
+{
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai_link *links;
+	void **ldata;
+
+	links = krealloc(priv->card.dai_link,
+			 num_links * sizeof(*priv->card.dai_link),
+			 GFP_KERNEL | __GFP_ZERO);
+	ldata = krealloc(priv->link_data,
+			 num_links * sizeof(*priv->link_data),
+			 GFP_KERNEL | __GFP_ZERO);
+
+	if (!links || !ldata) {
+		dev_err(priv->card.dev, "failed to allocate links\n");
+		return -ENOMEM;
+	}
+
+	priv->card.dai_link = links;
+	priv->link_data = ldata;
+	priv->card.num_links = num_links;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_card_reallocate_links);
+
+int meson_card_parse_dai(struct snd_soc_card *card,
+			 struct device_node *node,
+			 struct device_node **dai_of_node,
+			 const char **dai_name)
+{
+	struct of_phandle_args args;
+	int ret;
+
+	if (!dai_name || !dai_of_node || !node)
+		return -EINVAL;
+
+	ret = of_parse_phandle_with_args(node, "sound-dai",
+					 "#sound-dai-cells", 0, &args);
+	if (ret) {
+		if (ret != -EPROBE_DEFER)
+			dev_err(card->dev, "can't parse dai %d\n", ret);
+		return ret;
+	}
+	*dai_of_node = args.np;
+
+	return snd_soc_get_dai_name(&args, dai_name);
+}
+EXPORT_SYMBOL_GPL(meson_card_parse_dai);
+
+static int meson_card_set_link_name(struct snd_soc_card *card,
+				    struct snd_soc_dai_link *link,
+				    struct device_node *node,
+				    const char *prefix)
+{
+	char *name = devm_kasprintf(card->dev, GFP_KERNEL, "%s.%s",
+				    prefix, node->full_name);
+	if (!name)
+		return -ENOMEM;
+
+	link->name = name;
+	link->stream_name = name;
+
+	return 0;
+}
+
+unsigned int meson_card_parse_daifmt(struct device_node *node,
+				     struct device_node *cpu_node)
+{
+	struct device_node *bitclkmaster = NULL;
+	struct device_node *framemaster = NULL;
+	unsigned int daifmt;
+
+	daifmt = snd_soc_of_parse_daifmt(node, DT_PREFIX,
+					 &bitclkmaster, &framemaster);
+	daifmt &= ~SND_SOC_DAIFMT_MASTER_MASK;
+
+	/* If no master is provided, default to cpu master */
+	if (!bitclkmaster || bitclkmaster == cpu_node) {
+		daifmt |= (!framemaster || framemaster == cpu_node) ?
+			SND_SOC_DAIFMT_CBS_CFS : SND_SOC_DAIFMT_CBS_CFM;
+	} else {
+		daifmt |= (!framemaster || framemaster == cpu_node) ?
+			SND_SOC_DAIFMT_CBM_CFS : SND_SOC_DAIFMT_CBM_CFM;
+	}
+
+	of_node_put(bitclkmaster);
+	of_node_put(framemaster);
+
+	return daifmt;
+}
+EXPORT_SYMBOL_GPL(meson_card_parse_daifmt);
+
+int meson_card_set_be_link(struct snd_soc_card *card,
+			   struct snd_soc_dai_link *link,
+			   struct device_node *node)
+{
+	struct snd_soc_dai_link_component *codec;
+	struct device_node *np;
+	int ret, num_codecs;
+
+	link->no_pcm = 1;
+	link->dpcm_playback = 1;
+	link->dpcm_capture = 1;
+
+	num_codecs = of_get_child_count(node);
+	if (!num_codecs) {
+		dev_err(card->dev, "be link %s has no codec\n",
+			node->full_name);
+		return -EINVAL;
+	}
+
+	codec = devm_kcalloc(card->dev, num_codecs, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	link->codecs = codec;
+	link->num_codecs = num_codecs;
+
+	for_each_child_of_node(node, np) {
+		ret = meson_card_parse_dai(card, np, &codec->of_node,
+					   &codec->dai_name);
+		if (ret) {
+			of_node_put(np);
+			return ret;
+		}
+
+		codec++;
+	}
+
+	ret = meson_card_set_link_name(card, link, node, "be");
+	if (ret)
+		dev_err(card->dev, "error setting %pOFn link name\n", np);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(meson_card_set_be_link);
+
+int meson_card_set_fe_link(struct snd_soc_card *card,
+			   struct snd_soc_dai_link *link,
+			   struct device_node *node,
+			   bool is_playback)
+{
+	struct snd_soc_dai_link_component *codec;
+
+	codec = devm_kzalloc(card->dev, sizeof(*codec), GFP_KERNEL);
+	if (!codec)
+		return -ENOMEM;
+
+	link->codecs = codec;
+	link->num_codecs = 1;
+
+	link->dynamic = 1;
+	link->dpcm_merged_format = 1;
+	link->dpcm_merged_chan = 1;
+	link->dpcm_merged_rate = 1;
+	link->codecs->dai_name = "snd-soc-dummy-dai";
+	link->codecs->name = "snd-soc-dummy";
+
+	if (is_playback)
+		link->dpcm_playback = 1;
+	else
+		link->dpcm_capture = 1;
+
+	return meson_card_set_link_name(card, link, node, "fe");
+}
+EXPORT_SYMBOL_GPL(meson_card_set_fe_link);
+
+static int meson_card_add_links(struct snd_soc_card *card)
+{
+	struct meson_card *priv = snd_soc_card_get_drvdata(card);
+	struct device_node *node = card->dev->of_node;
+	struct device_node *np;
+	int num, i, ret;
+
+	num = of_get_child_count(node);
+	if (!num) {
+		dev_err(card->dev, "card has no links\n");
+		return -EINVAL;
+	}
+
+	ret = meson_card_reallocate_links(card, num);
+	if (ret)
+		return ret;
+
+	i = 0;
+	for_each_child_of_node(node, np) {
+		ret = priv->match_data->add_link(card, np, &i);
+		if (ret) {
+			of_node_put(np);
+			return ret;
+		}
+
+		i++;
+	}
+
+	return 0;
+}
+
+static int meson_card_parse_of_optional(struct snd_soc_card *card,
+					const char *propname,
+					int (*func)(struct snd_soc_card *c,
+						    const char *p))
+{
+	/* If property is not provided, don't fail ... */
+	if (!of_property_read_bool(card->dev->of_node, propname))
+		return 0;
+
+	/* ... but do fail if it is provided and the parsing fails */
+	return func(card, propname);
+}
+
+static int meson_card_add_aux_devices(struct snd_soc_card *card)
+{
+	struct device_node *node = card->dev->of_node;
+	struct snd_soc_aux_dev *aux;
+	int num, i;
+
+	num = of_count_phandle_with_args(node, "audio-aux-devs", NULL);
+	if (num == -ENOENT) {
+		return 0;
+	} else if (num < 0) {
+		dev_err(card->dev, "error getting auxiliary devices: %d\n",
+			num);
+		return num;
+	}
+
+	aux = devm_kcalloc(card->dev, num, sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return -ENOMEM;
+	card->aux_dev = aux;
+	card->num_aux_devs = num;
+
+	for_each_card_pre_auxs(card, i, aux) {
+		aux->dlc.of_node =
+			of_parse_phandle(node, "audio-aux-devs", i);
+		if (!aux->dlc.of_node)
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void meson_card_clean_references(struct meson_card *priv)
+{
+	struct snd_soc_card *card = &priv->card;
+	struct snd_soc_dai_link *link;
+	struct snd_soc_dai_link_component *codec;
+	struct snd_soc_aux_dev *aux;
+	int i, j;
+
+	if (card->dai_link) {
+		for_each_card_prelinks(card, i, link) {
+			if (link->cpus)
+				of_node_put(link->cpus->of_node);
+			for_each_link_codecs(link, j, codec)
+				of_node_put(codec->of_node);
+		}
+	}
+
+	if (card->aux_dev) {
+		for_each_card_pre_auxs(card, i, aux)
+			of_node_put(aux->dlc.of_node);
+	}
+
+	kfree(card->dai_link);
+	kfree(priv->link_data);
+}
+
+int meson_card_probe(struct platform_device *pdev)
+{
+	const struct meson_card_match_data *data;
+	struct device *dev = &pdev->dev;
+	struct meson_card *priv;
+	int ret;
+
+	data = of_device_get_match_data(dev);
+	if (!data) {
+		dev_err(dev, "failed to match device\n");
+		return -ENODEV;
+	}
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	snd_soc_card_set_drvdata(&priv->card, priv);
+
+	priv->card.owner = THIS_MODULE;
+	priv->card.dev = dev;
+	priv->match_data = data;
+
+	ret = snd_soc_of_parse_card_name(&priv->card, "model");
+	if (ret < 0)
+		return ret;
+
+	ret = meson_card_parse_of_optional(&priv->card, "audio-routing",
+					   snd_soc_of_parse_audio_routing);
+	if (ret) {
+		dev_err(dev, "error while parsing routing\n");
+		return ret;
+	}
+
+	ret = meson_card_parse_of_optional(&priv->card, "audio-widgets",
+					   snd_soc_of_parse_audio_simple_widgets);
+	if (ret) {
+		dev_err(dev, "error while parsing widgets\n");
+		return ret;
+	}
+
+	ret = meson_card_add_links(&priv->card);
+	if (ret)
+		goto out_err;
+
+	ret = meson_card_add_aux_devices(&priv->card);
+	if (ret)
+		goto out_err;
+
+	ret = devm_snd_soc_register_card(dev, &priv->card);
+	if (ret)
+		goto out_err;
+
+	return 0;
+
+out_err:
+	meson_card_clean_references(priv);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(meson_card_probe);
+
+int meson_card_remove(struct platform_device *pdev)
+{
+	struct meson_card *priv = platform_get_drvdata(pdev);
+
+	meson_card_clean_references(priv);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(meson_card_remove);
+
+MODULE_DESCRIPTION("Amlogic Sound Card Utils");
+MODULE_AUTHOR("Jerome Brunet <jbrunet@baylibre.com>");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/meson/meson-card.h b/sound/soc/meson/meson-card.h
new file mode 100644
index 000000000000..74314071c80d
--- /dev/null
+++ b/sound/soc/meson/meson-card.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2020 BayLibre, SAS.
+ * Author: Jerome Brunet <jbrunet@baylibre.com>
+ */
+
+#ifndef _MESON_SND_CARD_H
+#define _MESON_SND_CARD_H
+
+struct device_node;
+struct platform_device;
+
+struct snd_soc_card;
+struct snd_pcm_substream;
+struct snd_pcm_hw_params;
+
+#define DT_PREFIX "amlogic,"
+
+struct meson_card_match_data {
+	int (*add_link)(struct snd_soc_card *card,
+			struct device_node *node,
+			int *index);
+};
+
+struct meson_card {
+	const struct meson_card_match_data *match_data;
+	struct snd_soc_card card;
+	void **link_data;
+};
+
+unsigned int meson_card_parse_daifmt(struct device_node *node,
+				     struct device_node *cpu_node);
+
+int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      unsigned int mclk_fs);
+
+int meson_card_reallocate_links(struct snd_soc_card *card,
+				unsigned int num_links);
+int meson_card_parse_dai(struct snd_soc_card *card,
+			 struct device_node *node,
+			 struct device_node **dai_of_node,
+			 const char **dai_name);
+int meson_card_set_be_link(struct snd_soc_card *card,
+			   struct snd_soc_dai_link *link,
+			   struct device_node *node);
+int meson_card_set_fe_link(struct snd_soc_card *card,
+			   struct snd_soc_dai_link *link,
+			   struct device_node *node,
+			   bool is_playback);
+
+int meson_card_probe(struct platform_device *pdev);
+int meson_card_remove(struct platform_device *pdev);
+
+#endif /* _MESON_SND_CARD_H */
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
