Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CBB290AE4
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Oct 2020 19:38:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C04D21802;
	Fri, 16 Oct 2020 19:37:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C04D21802
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602869902;
	bh=u6m/MY1H6EBgvb1i5E4RjVW+hSC1gLJDN9evTy/gflU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hl/8S6mJ0h+HEzFf5PCnXl0AzUKUZiyWiOCgE6b8P23zdLeXZypVNrVFzwXpdBCpm
	 jm/E4NmNnTpYKpR63ov+dXT4pRnEYVR6xok8A7RJUiPsd94M5uoC/o1OA9pkm7ooH+
	 TcaK5sPZrS8P7YdGTiNVFDxo11KVKUkaYq2z2NJM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67FD1F8027B;
	Fri, 16 Oct 2020 19:36:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01DEAF8027D; Fri, 16 Oct 2020 19:35:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E6FEF8012A
 for <alsa-devel@alsa-project.org>; Fri, 16 Oct 2020 19:35:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E6FEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j3GLQ5Ly"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09GHQNpO024410; Fri, 16 Oct 2020 12:35:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=o1Ui4Al7CRXvoftoD8jPT8CJ4BDziydeva1AES9YxXA=;
 b=j3GLQ5LyAOI9QsCEVXgMjqrrzPiiabn2plmh/g00YV5MUE3JY5UK2k1s3gQcGWQ0eGZF
 XI3+0WItHH5HYeCAtpusvz1wHaj/zYSHP7Nh4R0OYRofji03thW5howNXXgvym6S88Pr
 0kJf+1NeUl6rUAglIOHPHMCmN5gKx9GqvDDYKNZitU2myUOQadtaUAD26o3KfqgN4Gl5
 kS7FjXqNUK25Isk+/UaO4Aca1zO4KRyoDkSzjCWcxYWJTQGUbpsuEJdSbYG/e4rIoTuK
 PZ665a1FnnH2CBwstEPEfwEglAjJjrV82nb7tRnk7kvp4SyLtOvWXuNlSZZQHoXy9zH0 uA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac20jk9-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 16 Oct 2020 12:35:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 16 Oct
 2020 18:35:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 16 Oct 2020 18:35:45 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8AB4C2C1;
 Fri, 16 Oct 2020 17:35:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH v2 3/7] ASoC: audio-graph-card: Support setting component plls
 and sysclks
Date: Fri, 16 Oct 2020 18:35:37 +0100
Message-ID: <20201016173541.21180-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201016173541.21180-1-rf@opensource.cirrus.com>
References: <20201016173541.21180-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010160130
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

Some codecs need plls and/or sysclks to be configured using the
snd_soc_component_set_[sysclk|pll] functions. These drivers cannot
necessarily be converted to use the clock framework. If the codec is on
a I2C/SPI bus, a nested clk_get would be needed to enable the bus clock.
But the clock framework does not support nested operations and this would
deadlock. So it isn't possible to implement I2C/SPI connected pll/clock
hardware through the clock framework.

This patch adds new dt properties that list phandles of components with
the pll/sysclk settings to be applied. Multiple settings can be given for
the same phandle to allow for components with multiple clocks and plls.
The plls and sysclks are enabled when the card bias level moves to STANDBY
and disabled when it moves to OFF.

The implementation does not attempt to handle specifying complex clock
ordering interdependencies between components. The plls and sysclks are
applied to a component as it is passed to the card set_bias_level/
set_bias_level_post callbacks. It follows from this that the order
components are configured is the order that they are passed to those
callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/simple_card_utils.h     |  24 ++++
 sound/soc/generic/audio-graph-card.c  |  16 ++-
 sound/soc/generic/simple-card-utils.c | 184 ++++++++++++++++++++++++++
 3 files changed, 222 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 86a1e956991e..67e9034ed807 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -38,6 +38,15 @@ struct asoc_simple_jack {
 	struct snd_soc_jack_gpio gpio;
 };
 
+struct asoc_simple_sysclk_pll {
+	struct device_node *node;
+	int id;
+	int source;
+	unsigned int freq_in;
+	unsigned int freq_out;
+	int dir;
+};
+
 struct asoc_simple_priv {
 	struct snd_soc_card snd_card;
 	struct simple_dai_props {
@@ -56,6 +65,11 @@ struct asoc_simple_priv {
 	struct asoc_simple_dai *dais;
 	struct snd_soc_codec_conf *codec_conf;
 	struct gpio_desc *pa_gpio;
+
+	struct asoc_simple_sysclk_pll *sysclks;
+	int num_sysclks;
+	struct asoc_simple_sysclk_pll *plls;
+	int num_plls;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
@@ -94,6 +108,14 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream);
 int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params);
 int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd);
+
+int asoc_simple_set_bias_level(struct snd_soc_card *card,
+			       struct snd_soc_dapm_context *dapm,
+			       enum snd_soc_bias_level level);
+int asoc_simple_set_bias_level_post(struct snd_soc_card *card,
+				    struct snd_soc_dapm_context *dapm,
+				    enum snd_soc_bias_level level);
+
 int asoc_simple_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 				   struct snd_pcm_hw_params *params);
 
@@ -128,6 +150,8 @@ int asoc_simple_parse_widgets(struct snd_soc_card *card,
 				      char *prefix);
 int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix);
+int asoc_simple_parse_sysclks(struct asoc_simple_priv *priv, char *prefix);
+int asoc_simple_parse_plls(struct asoc_simple_priv *priv, char *prefix);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			       struct asoc_simple_jack *sjack,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 97b4f5480a31..c56a3a19a22f 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -509,6 +509,14 @@ static int graph_parse_of(struct asoc_simple_priv *priv)
 			return ret;
 	}
 
+	ret = asoc_simple_parse_sysclks(priv, NULL);
+	if (ret < 0)
+		return ret;
+
+	ret = asoc_simple_parse_plls(priv, NULL);
+	if (ret < 0)
+		return ret;
+
 	return asoc_simple_parse_card_name(card, NULL);
 }
 
@@ -642,6 +650,7 @@ static int graph_probe(struct platform_device *pdev)
 	card->dapm_widgets	= graph_dapm_widgets;
 	card->num_dapm_widgets	= ARRAY_SIZE(graph_dapm_widgets);
 	card->probe		= graph_card_probe;
+	snd_soc_card_set_drvdata(card, priv);
 
 	memset(&li, 0, sizeof(li));
 	graph_get_dais_count(priv, &li);
@@ -666,10 +675,13 @@ static int graph_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	snd_soc_card_set_drvdata(card, priv);
-
 	asoc_simple_debug_info(priv);
 
+	if (priv->num_sysclks || priv->num_plls) {
+		card->set_bias_level = asoc_simple_set_bias_level;
+		card->set_bias_level_post = asoc_simple_set_bias_level_post;
+	}
+
 	ret = devm_snd_soc_register_card(dev, card);
 	if (ret < 0)
 		goto err;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 6cada4c1e283..6c0675187285 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -399,6 +399,123 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_GPL(asoc_simple_dai_init);
 
+static bool asoc_simple_node_is_component(struct snd_soc_component *component,
+					  struct device_node *node)
+{
+	struct device_node *comp_node;
+
+	comp_node = component->dev->of_node;
+	if (!comp_node && component->dev->parent)
+		comp_node = component->dev->parent->of_node;
+
+	return (comp_node == node);
+}
+
+int asoc_simple_set_bias_level(struct snd_soc_card *card,
+			       struct snd_soc_dapm_context *dapm,
+			       enum snd_soc_bias_level level)
+{
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = dapm->component;
+	int i, ret;
+
+	if (!component)
+		return 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_STANDBY:
+		if (dapm->bias_level != SND_SOC_BIAS_OFF)
+			break;
+
+		/* PLLs normally supply SYSCLKs so enable the PLLs first. */
+		for (i = 0; i < priv->num_plls; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->plls[i].node))
+				continue;
+
+			ret = snd_soc_component_set_pll(component,
+							priv->plls[i].id,
+							priv->plls[i].source,
+							priv->plls[i].freq_in,
+							priv->plls[i].freq_out);
+			if (ret) {
+				dev_err(card->dev, "Failed to set pll for %s: %d\n",
+					component->name, ret);
+				return ret;
+			}
+		}
+
+		for (i = 0; i < priv->num_sysclks; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->sysclks[i].node))
+				continue;
+
+			ret = snd_soc_component_set_sysclk(component,
+							   priv->sysclks[i].id,
+							   priv->sysclks[i].source,
+							   priv->sysclks[i].freq_in,
+							   priv->sysclks[i].dir);
+			if (ret) {
+				dev_err(card->dev, "Failed to set sysclk for %s: %d\n",
+					component->name, ret);
+				return ret;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_set_bias_level);
+
+int asoc_simple_set_bias_level_post(struct snd_soc_card *card,
+				    struct snd_soc_dapm_context *dapm,
+				    enum snd_soc_bias_level level)
+{
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = dapm->component;
+	int i, ret;
+
+	if (!component)
+		goto out;
+
+	switch (level) {
+	case SND_SOC_BIAS_OFF:
+		for (i = 0; i < priv->num_sysclks; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->sysclks[i].node))
+				continue;
+
+			ret = snd_soc_component_set_sysclk(component,
+							   priv->sysclks[i].id,
+							   0,
+							   0,
+							   priv->sysclks[i].dir);
+			if (ret)
+				dev_warn(card->dev, "Failed to set sysclk for %s: %d\n",
+					 component->name, ret);
+		}
+
+		for (i = 0; i < priv->num_plls; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->plls[i].node))
+				continue;
+
+			ret = snd_soc_component_set_pll(component, priv->plls[i].id, 0, 0, 0);
+			if (ret)
+				dev_warn(card->dev, "Failed to set pll for %s: %d\n",
+					 component->name, ret);
+		}
+		break;
+	default:
+		break;
+	}
+
+out:
+	dapm->bias_level = level;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_set_bias_level_post);
+
 void asoc_simple_canonicalize_platform(struct snd_soc_dai_link *dai_link)
 {
 	/* Assumes platform == cpu */
@@ -433,6 +550,7 @@ EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_cpu);
 
 int asoc_simple_clean_reference(struct snd_soc_card *card)
 {
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *dai_link;
 	int i;
 
@@ -440,6 +558,13 @@ int asoc_simple_clean_reference(struct snd_soc_card *card)
 		of_node_put(dai_link->cpus->of_node);
 		of_node_put(dai_link->codecs->of_node);
 	}
+
+	for (i = 0; i < priv->num_sysclks; ++i)
+		of_node_put(priv->sysclks[i].node);
+
+	for (i = 0; i < priv->num_plls; ++i)
+		of_node_put(priv->plls[i].node);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_clean_reference);
@@ -538,6 +663,65 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_pin_switches);
 
+static int asoc_simple_parse_sysclks_plls(struct asoc_simple_priv *priv,
+					  char *prefix,
+					  char *prop_root_name,
+					  struct asoc_simple_sysclk_pll **out,
+					  int *out_count)
+{
+	struct device *dev = priv->snd_card.dev;
+	struct device_node *node = dev->of_node;
+	struct of_phandle_args args;
+	int n_elem, i, ret;
+	char prop[128];
+
+	if (!prefix)
+		prefix = "";
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, prop_root_name);
+	n_elem = of_count_phandle_with_fixed_args(node, prop, 4);
+	if (n_elem == -ENOENT || n_elem == 0) {
+		return 0;
+	} else if (n_elem < 0) {
+		dev_err(dev, "Failed to parse %s: %d\n", prop, n_elem);
+		return n_elem;
+	}
+
+	*out = devm_kcalloc(dev, n_elem, sizeof(**out), GFP_KERNEL);
+	if (!*out)
+		return -ENOMEM;
+	*out_count = n_elem;
+
+	for (i = 0; i < n_elem; ++i) {
+		ret = of_parse_phandle_with_fixed_args(node, prop, 4, i, &args);
+		if (ret < 0)
+			return ret;
+
+		(*out)[i].node		= args.np;
+		(*out)[i].id		= args.args[0];
+		(*out)[i].source	= args.args[1];
+		(*out)[i].freq_in	= args.args[2];
+		(*out)[i].dir		= args.args[3]; /* for sysclks */
+		(*out)[i].freq_out	= args.args[3]; /* for plls */
+	}
+
+	return 0;
+}
+
+int asoc_simple_parse_sysclks(struct asoc_simple_priv *priv, char *prefix)
+{
+	return asoc_simple_parse_sysclks_plls(priv, prefix, "sysclks",
+					      &priv->sysclks, &priv->num_sysclks);
+}
+EXPORT_SYMBOL_GPL(asoc_simple_parse_sysclks);
+
+int asoc_simple_parse_plls(struct asoc_simple_priv *priv, char *prefix)
+{
+	return asoc_simple_parse_sysclks_plls(priv, prefix, "plls",
+					      &priv->plls, &priv->num_plls);
+}
+EXPORT_SYMBOL_GPL(asoc_simple_parse_plls);
+
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			  struct asoc_simple_jack *sjack,
 			  int is_hp, char *prefix,
-- 
2.20.1

