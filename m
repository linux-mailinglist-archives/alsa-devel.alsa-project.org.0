Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C51502A2DDF
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Nov 2020 16:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B34D1754;
	Mon,  2 Nov 2020 16:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B34D1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604330143;
	bh=Z8bfA9BbzcEkxPbnigexZBl6vukS3cR0RFzgN9Hb108=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aSKbtvoRXjjdcWRID+lCEScYVpsUhRJJEXCFF/OZHiDEloNjqWN2VFhCMbm2+y5yp
	 2cgG/gaoiNRzAfrg/SvHKag0eMtiBxeeJwymyTJwYEyKQRlEYIVHLbxwud4vnEp1eV
	 k1wEEbmg8M0wWqXDSQxZV86H0X/ugxKaRTH3QdRM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28BDDF804FF;
	Mon,  2 Nov 2020 16:12:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E94EDF804EB; Mon,  2 Nov 2020 16:11:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92913F804E5
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 16:11:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92913F804E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="o+8PbK7P"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa021b70002>; Mon, 02 Nov 2020 07:11:51 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 2 Nov
 2020 15:11:44 +0000
Received: from audio.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Mon, 2 Nov 2020 15:11:40 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>,
 <kuninori.morimoto.gx@renesas.com>, <pierre-louis.bossart@linux.intel.com>,
 <perex@perex.cz>, <tiwai@suse.com>
Subject: [PATCH v5 7/7] ASoC: audio-graph: Expose helpers from audio graph
Date: Mon, 2 Nov 2020 20:40:14 +0530
Message-ID: <1604329814-24779-8-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604329911; bh=SoMKeCoV8TVlaACU5ff5aKWUGkjMo9+dcXMh6rCSWI8=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=o+8PbK7PneJXHkglm7NP4Bs0D4x/RVhi6fYvGpA8NXj0LiRAUao+0rC4Ge3jitMLr
 Txs+ObejYM7dM3Si1BYQZNIg3U9S5MaFWJfommKvZJ+fCsJX4Erru+PQWQvuBv9Qek
 XQ3BjuSjwA+bnJa/gS/C/MDCg4ULvpo/fynd5kYhSXXXMwcUb0BCeIK/LTF+iISndY
 6Vhe3JXEm64AdNo2YycPO1q0kUogNAT43sK1j5HwBZ3KxBsY4iMi9VIQEJK95sPwdQ
 2LTiSJZE2Z5WyO+ZUDeFKjbArijGbNwxlHRLXSc921k9zKjZVFOyab42NqxT3dalkA
 PRDbV8cbrcYEw==
Cc: alsa-devel@alsa-project.org, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, sharadg@nvidia.com,
 thierry.reding@gmail.com, linux-tegra@vger.kernel.org
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

This commit exposes following functions which can be used by a sound
card driver based on generic audio graph driver. Idea is vendors can
have a thin driver and re-use common stuff from audio graph driver.

 - graph_card_probe()
 - graph_parse_of()

In doing so a new header file is added for above. The graph_probe()
function is simplified by moving more common stuff to graph_parse_of().

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h           | 16 ++++++
 sound/soc/generic/audio-graph-card.c | 95 +++++++++++++++++++-----------------
 2 files changed, 66 insertions(+), 45 deletions(-)
 create mode 100644 include/sound/graph_card.h

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
new file mode 100644
index 0000000..bbb5a13
--- /dev/null
+++ b/include/sound/graph_card.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * ASoC audio graph card support
+ *
+ */
+
+#ifndef __GRAPH_CARD_H
+#define __GRAPH_CARD_H
+
+#include <sound/simple_card_utils.h>
+
+int graph_card_probe(struct snd_soc_card *card);
+
+int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+
+#endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 4db9c0e..16a04a6 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -18,7 +18,7 @@
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
-#include <sound/simple_card_utils.h>
+#include <sound/graph_card.h>
 
 #define DPCM_SELECTABLE 1
 
@@ -529,12 +529,34 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 	return 0;
 }
 
-static int graph_parse_of(struct asoc_simple_priv *priv)
+static void graph_get_dais_count(struct asoc_simple_priv *priv,
+				 struct link_info *li);
+
+int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info li;
 	int ret;
 
+	card->owner = THIS_MODULE;
+	card->dev = dev;
+
+	memset(&li, 0, sizeof(li));
+	graph_get_dais_count(priv, &li);
+	if (!li.link || !li.dais)
+		return -EINVAL;
+
+	ret = asoc_simple_init_priv(priv, &li);
+	if (ret < 0)
+		return ret;
+
+	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->pa_gpio)) {
+		ret = PTR_ERR(priv->pa_gpio);
+		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
+		return ret;
+	}
+
 	ret = asoc_simple_parse_widgets(card, NULL);
 	if (ret < 0)
 		return ret;
@@ -561,11 +583,32 @@ static int graph_parse_of(struct asoc_simple_priv *priv)
 					  graph_dai_link_of,
 					  graph_dai_link_of_dpcm);
 		if (ret < 0)
-			return ret;
+			goto err;
 	}
 
-	return asoc_simple_parse_card_name(card, NULL);
+	ret = asoc_simple_parse_card_name(card, NULL);
+	if (ret < 0)
+		goto err;
+
+	snd_soc_card_set_drvdata(card, priv);
+
+	asoc_simple_debug_info(priv);
+
+	ret = devm_snd_soc_register_card(dev, card);
+	if (ret < 0)
+		goto err;
+
+	return 0;
+
+err:
+	asoc_simple_clean_reference(card);
+
+	if (ret != -EPROBE_DEFER)
+		dev_err(dev, "parse error %d\n", ret);
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(graph_parse_of);
 
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
@@ -662,7 +705,7 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 		li->link, li->dais, li->conf);
 }
 
-static int graph_card_probe(struct snd_soc_card *card)
+int graph_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -677,14 +720,13 @@ static int graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(graph_card_probe);
 
 static int graph_probe(struct platform_device *pdev)
 {
 	struct asoc_simple_priv *priv;
 	struct device *dev = &pdev->dev;
 	struct snd_soc_card *card;
-	struct link_info li;
-	int ret;
 
 	/* Allocate the private data and the DAI link array */
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -692,8 +734,6 @@ static int graph_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card = simple_priv_to_card(priv);
-	card->owner		= THIS_MODULE;
-	card->dev		= dev;
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
@@ -701,42 +741,7 @@ static int graph_probe(struct platform_device *pdev)
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
 
-	memset(&li, 0, sizeof(li));
-	graph_get_dais_count(priv, &li);
-	if (!li.link || !li.dais)
-		return -EINVAL;
-
-	ret = asoc_simple_init_priv(priv, &li);
-	if (ret < 0)
-		return ret;
-
-	priv->pa_gpio = devm_gpiod_get_optional(dev, "pa", GPIOD_OUT_LOW);
-	if (IS_ERR(priv->pa_gpio)) {
-		ret = PTR_ERR(priv->pa_gpio);
-		dev_err(dev, "failed to get amplifier gpio: %d\n", ret);
-		return ret;
-	}
-
-	ret = graph_parse_of(priv);
-	if (ret < 0) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "parse error %d\n", ret);
-		goto err;
-	}
-
-	snd_soc_card_set_drvdata(card, priv);
-
-	asoc_simple_debug_info(priv);
-
-	ret = devm_snd_soc_register_card(dev, card);
-	if (ret < 0)
-		goto err;
-
-	return 0;
-err:
-	asoc_simple_clean_reference(card);
-
-	return ret;
+	return graph_parse_of(priv, dev);
 }
 
 static int graph_remove(struct platform_device *pdev)
-- 
2.7.4

