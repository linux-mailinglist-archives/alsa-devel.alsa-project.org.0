Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9852DD485
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Dec 2020 16:45:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 097FD1919;
	Thu, 17 Dec 2020 16:44:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 097FD1919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608219930;
	bh=qLjVaxe16toUFN36XdlVAcoCBF6bzG7R0RANYcorbWY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HXeo4iVZmUu5WiRjVrHXxzFZ95409BOqMv7l8c8fMbP84tNySrzAPiiSRj3j7sdlF
	 7XUZNYzo1Ht5ZwINsHe9H/NTbd5kkUXX5MSTlyd23zsT165Mq4McIjKjc+4C9fEY/I
	 yUg17Fmwm/h9jfeQuAaj5j5qWIRokhNSmclaHLA4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2845F804F2;
	Thu, 17 Dec 2020 16:42:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD3CBF804DF; Thu, 17 Dec 2020 16:42:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE273F804AE
 for <alsa-devel@alsa-project.org>; Thu, 17 Dec 2020 16:41:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE273F804AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="PhDew2Qz"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BHFPi99001634; Thu, 17 Dec 2020 09:41:48 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=kFii/MLnvZEwlPNsABvyhf+yyvhxWU0C00Yc/1VrVIs=;
 b=PhDew2QzyUdRHZvRsWOiVdMZEXD0Fn81WNu1ldgtJyFonvQluUc049buxY7mbVnGdyPX
 RTiu3F9EsQ6HitkqLUe+Ac7Ym3aOad1TvxUMuv8TWUkGaf/k5S06RhrOG84qyqOAERXV
 hlWBlvRRzpS+ZF68b6aLMxTYofKxRc/38sN6B4/+EMIyuGGC5T374hqZ0xglUcwiO+AH
 ldnmQigljbLFnpVUrfK9JM6BMZgz6iDdtGvGwLI/D0WcH1yvisZwAlzXvnVHSOIWDJ4k
 thKl8Gl/LpslBTNkK75/eF03Rdc0WhoJUlckcF/u1WcqoTN5jXBGDanamDzipLj51UAH IA== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5rxy90-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 17 Dec 2020 09:41:48 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Thu, 17 Dec
 2020 15:41:47 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Thu, 17 Dec 2020 15:41:47 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.236])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B0B2111CC;
 Thu, 17 Dec 2020 15:41:46 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>
Subject: [PATCH v3 3/6] ASoC: audio-graph-card: Support setting component plls
 and sysclks
Date: Thu, 17 Dec 2020 15:41:39 +0000
Message-ID: <20201217154142.24301-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201217154142.24301-1-rf@opensource.cirrus.com>
References: <20201217154142.24301-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012170108
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
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
deadlock.

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
 include/sound/simple_card_utils.h     |  25 +++
 sound/soc/generic/audio-graph-card.c  |  16 +-
 sound/soc/generic/simple-card-utils.c | 236 ++++++++++++++++++++++++++
 3 files changed, 275 insertions(+), 2 deletions(-)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 86a1e956991e..0f9296e09ad3 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -38,6 +38,16 @@ struct asoc_simple_jack {
 	struct snd_soc_jack_gpio gpio;
 };
 
+struct asoc_simple_sysclk_pll {
+	struct device_node *node;
+	struct clk *clk;
+	int id;
+	int source;
+	unsigned int freq_out;
+	int dir;
+	bool enabled;
+};
+
 struct asoc_simple_priv {
 	struct snd_soc_card snd_card;
 	struct simple_dai_props {
@@ -56,6 +66,11 @@ struct asoc_simple_priv {
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
@@ -94,6 +109,14 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream);
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
 
@@ -128,6 +151,8 @@ int asoc_simple_parse_widgets(struct snd_soc_card *card,
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
index 6cada4c1e283..5733a2955cb2 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -399,6 +399,162 @@ int asoc_simple_dai_init(struct snd_soc_pcm_runtime *rtd)
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
+		/*
+		 * A component's PLLs normally supply its SYSCLKs so enable
+		 * the PLLs first.
+		 */
+		for (i = 0; i < priv->num_plls; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->plls[i].node))
+				continue;
+
+			ret = clk_prepare_enable(priv->plls[i].clk);
+			if (ret) {
+				dev_err(card->dev,
+					"(%s) failed to enable pll %d parent clock: %d\n",
+					component->name, priv->plls[i].id, ret);
+				return ret;
+			}
+
+			ret = snd_soc_component_set_pll(component,
+							priv->plls[i].id,
+							priv->plls[i].source,
+							clk_get_rate(priv->plls[i].clk),
+							priv->plls[i].freq_out);
+			if (ret) {
+				dev_err(card->dev, "(%s) failed to set pll %d: %d\n",
+					component->name, priv->plls[i].id, ret);
+
+				clk_disable_unprepare(priv->plls[i].clk);
+				return ret;
+			}
+
+			priv->plls[i].enabled = true;
+		}
+
+		for (i = 0; i < priv->num_sysclks; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->sysclks[i].node))
+				continue;
+
+			ret = clk_prepare_enable(priv->sysclks[i].clk);
+			if (ret) {
+				dev_err(card->dev,
+					"(%s) failed to enable sysclk %d parent clock: %d\n",
+					component->name, priv->sysclks[i].id, ret);
+				return ret;
+			}
+
+			ret = snd_soc_component_set_sysclk(component,
+							   priv->sysclks[i].id,
+							   priv->sysclks[i].source,
+							   clk_get_rate(priv->sysclks[i].clk),
+							   priv->sysclks[i].dir);
+			if (ret) {
+				dev_err(card->dev, "(%s) failed to set sysclk %d: %d\n",
+					component->name, priv->sysclks[i].id, ret);
+
+				clk_disable_unprepare(priv->sysclks[i].clk);
+				return ret;
+			}
+
+			priv->sysclks[i].enabled = true;
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
+			if (!priv->sysclks[i].enabled)
+				continue;
+
+			ret = snd_soc_component_set_sysclk(component,
+							   priv->sysclks[i].id,
+							   0,
+							   0,
+							   priv->sysclks[i].dir);
+			if (ret)
+				dev_warn(card->dev, "(%s) failed to disable sysclk %d: %d\n",
+					 component->name, priv->sysclks[i].id, ret);
+
+			clk_disable_unprepare(priv->sysclks[i].clk);
+			priv->sysclks[i].enabled = false;
+		}
+
+		for (i = 0; i < priv->num_plls; ++i) {
+			if (!asoc_simple_node_is_component(component, priv->plls[i].node))
+				continue;
+
+			if (!priv->plls[i].enabled)
+				continue;
+
+			ret = snd_soc_component_set_pll(component, priv->plls[i].id, 0, 0, 0);
+			if (ret)
+				dev_warn(card->dev, "(%s) failed to disable pll %d: %d\n",
+					 component->name, priv->plls[i].id, ret);
+
+			clk_disable_unprepare(priv->plls[i].clk);
+			priv->plls[i].enabled = false;
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
@@ -433,6 +589,7 @@ EXPORT_SYMBOL_GPL(asoc_simple_canonicalize_cpu);
 
 int asoc_simple_clean_reference(struct snd_soc_card *card)
 {
+	struct asoc_simple_priv *priv = snd_soc_card_get_drvdata(card);
 	struct snd_soc_dai_link *dai_link;
 	int i;
 
@@ -440,6 +597,13 @@ int asoc_simple_clean_reference(struct snd_soc_card *card)
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
@@ -538,6 +702,78 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
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
+	char clocks_prop[128];
+	const char *src_clk_name;
+	struct clk *in_clk;
+
+	if (!prefix)
+		prefix = "";
+
+	snprintf(prop, sizeof(prop), "%s%s", prefix, prop_root_name);
+	snprintf(clocks_prop, sizeof(clocks_prop), "%s-clocks", prop);
+	n_elem = of_count_phandle_with_fixed_args(node, prop, 3);
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
+	*out_count = 0;
+
+	for (i = 0; i < n_elem; ++i) {
+		ret = of_property_read_string_index(node, clocks_prop, i, &src_clk_name);
+		if (ret < 0)
+			return ret;
+
+		in_clk = devm_clk_get(dev, src_clk_name);
+		if (IS_ERR(in_clk))
+			return PTR_ERR(in_clk);
+
+		ret = of_parse_phandle_with_fixed_args(node, prop, 3, i, &args);
+		if (ret < 0)
+			return ret;
+
+		(*out)[i].node		= args.np;
+		(*out)[i].clk		= in_clk;
+		(*out)[i].id		= args.args[0];
+		(*out)[i].source	= args.args[1];
+		(*out)[i].dir		= args.args[2]; /* for sysclks */
+		(*out)[i].freq_out	= args.args[2]; /* for plls */
+		++*out_count;
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

