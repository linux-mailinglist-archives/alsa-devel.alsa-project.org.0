Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1C5312672
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Feb 2021 18:39:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 054D81688;
	Sun,  7 Feb 2021 18:38:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 054D81688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612719543;
	bh=fP8lNR7g3GoXhGIQVeC7yQDbIMani4ZPA9FA1nTV57U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M+eOumw4J/MmyNLrAukGxmtwTppO+GndVPSdSALcUYlqNyR9CY29ETu6dRDjVCo0l
	 E6jUAXaHVQ4N9XMKtvd5NMqGLe71FATJdKM3xcGrqRaohfMEi7ZBtnj5NcXn+UuSy5
	 u6fcV/m2bNmIEl+6WUpWUPGGGwZNYwm8MBW4f4BY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68EC7F80139;
	Sun,  7 Feb 2021 18:37:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A680F8025F; Sun,  7 Feb 2021 18:37:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0FD4F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Feb 2021 18:37:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0FD4F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="TUMbdtqc"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602025470002>; Sun, 07 Feb 2021 09:37:11 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 7 Feb
 2021 17:37:10 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Sun, 7 Feb 2021 17:37:08 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>
Subject: [PATCH v3 1/2] ASoC: audio-graph: Rename functions needed for export
Date: Sun, 7 Feb 2021 23:06:57 +0530
Message-ID: <1612719418-5858-2-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
References: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1612719431; bh=QNOEKARjC18l+zl2o4mNJlCfnihZnl9yHW4AuVCikCc=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=TUMbdtqcIQ1x4CyaenmKFhySINP4EE5esWR76/Ys/Jz5x3wZHLntAur8gMdVGvEnB
 HStAPgD29wPnSWR+1blusi5zPucGUBGvPLtr51GKuldKm34zvSAVM5u7Bj0jQRi5dO
 LCx87tCEXHEjiDFRRxOKozF+DV6VUR1EIYOikEO/1PqttJMmIZ1TuLJ8RtRgUNqVkl
 0m4T62s9X5Fmi7c8DvI9Wc/Epu5vG/7wKWeGqvjb99Zjtvws4W75/C6leUJTWBiTa1
 jQCkXFT8SzbeUlfd0gzKaN/9kWZINQxMyFPz/oOrPV4CIC6Y/G2HG8/lE8IJtmpm2x
 9mxtVkAeV/u9w==
Cc: alsa-devel@alsa-project.org, kuninori.morimoto.gx@renesas.com,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 linux-tegra@vger.kernel.org
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

Following functions are renamed for a better global visibility.
  graph_card_probe() --> audio_graph_card_probe()
  graph_parse_of()   --> audio_graph_parse_of()
  graph_remove()     --> audio_graph_remove() [exported as well]

The references of these are updated in audio graph and Tegra audio
graph card drivers.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/graph_card.h               |  6 ++++--
 sound/soc/generic/audio-graph-card.c     | 17 +++++++++--------
 sound/soc/tegra/tegra_audio_graph_card.c |  6 +++---
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/include/sound/graph_card.h b/include/sound/graph_card.h
index bbb5a13..0137844 100644
--- a/include/sound/graph_card.h
+++ b/include/sound/graph_card.h
@@ -9,8 +9,10 @@
 
 #include <sound/simple_card_utils.h>
 
-int graph_card_probe(struct snd_soc_card *card);
+int audio_graph_card_probe(struct snd_soc_card *card);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev);
+
+int audio_graph_remove(struct platform_device *pdev);
 
 #endif /* __GRAPH_CARD_H */
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 16a04a6..8c5cdcd 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -532,7 +532,7 @@ static int graph_for_each_link(struct asoc_simple_priv *priv,
 static void graph_get_dais_count(struct asoc_simple_priv *priv,
 				 struct link_info *li);
 
-int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
+int audio_graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 {
 	struct snd_soc_card *card = simple_priv_to_card(priv);
 	struct link_info li;
@@ -608,7 +608,7 @@ int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(graph_parse_of);
+EXPORT_SYMBOL_GPL(audio_graph_parse_of);
 
 static int graph_count_noml(struct asoc_simple_priv *priv,
 			    struct device_node *cpu_ep,
@@ -705,7 +705,7 @@ static void graph_get_dais_count(struct asoc_simple_priv *priv,
 		li->link, li->dais, li->conf);
 }
 
-int graph_card_probe(struct snd_soc_card *card)
+int audio_graph_card_probe(struct snd_soc_card *card)
 {
 	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	int ret;
@@ -720,7 +720,7 @@ int graph_card_probe(struct snd_soc_card *card)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(graph_card_probe);
+EXPORT_SYMBOL_GPL(audio_graph_card_probe);
 
 static int graph_probe(struct platform_device *pdev)
 {
@@ -736,20 +736,21 @@ static int graph_probe(struct platform_device *pdev)
 	card = simple_priv_to_card(priv);
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
-	card->probe		= graph_card_probe;
+	card->probe		= audio_graph_card_probe;
 
 	if (of_device_get_match_data(dev))
 		priv->dpcm_selectable = 1;
 
-	return graph_parse_of(priv, dev);
+	return audio_graph_parse_of(priv, dev);
 }
 
-static int graph_remove(struct platform_device *pdev)
+int audio_graph_remove(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = platform_get_drvdata(pdev);
 
 	return asoc_simple_clean_reference(card);
 }
+EXPORT_SYMBOL_GPL(audio_graph_remove);
 
 static const struct of_device_id graph_of_match[] = {
 	{ .compatible = "audio-graph-card", },
@@ -766,7 +767,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove = graph_remove,
+	.remove = audio_graph_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 9e43f16..121e572 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -184,7 +184,7 @@ static int tegra_audio_graph_card_probe(struct snd_soc_card *card)
 		return PTR_ERR(priv->clk_plla_out0);
 	}
 
-	return graph_card_probe(card);
+	return audio_graph_card_probe(card);
 }
 
 static int tegra_audio_graph_probe(struct platform_device *pdev)
@@ -201,12 +201,12 @@ static int tegra_audio_graph_probe(struct platform_device *pdev)
 
 	card->probe = tegra_audio_graph_card_probe;
 
-	/* graph_parse_of() depends on below */
+	/* audio_graph_parse_of() depends on below */
 	card->component_chaining = 1;
 	priv->simple.ops = &tegra_audio_graph_ops;
 	priv->simple.force_dpcm = 1;
 
-	return graph_parse_of(&priv->simple, dev);
+	return audio_graph_parse_of(&priv->simple, dev);
 }
 
 static const struct tegra_audio_cdata tegra210_data = {
-- 
2.7.4

