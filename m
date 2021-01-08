Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE3F2EF586
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jan 2021 17:08:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B89021703;
	Fri,  8 Jan 2021 17:07:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B89021703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610122114;
	bh=RsTVQkPsUTtKbxovbX/QG2SzjG52ADZkuJTt1Tdx+s0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mfGRmn1cK4ypqO78xUaUMZth3tOmQQF9IOO6FxxxcKe3v6vmhlvCaVcJgP5xlfx4S
	 +t9aSprU9tMYb6QYUiArDzT0q78rdg+POdyTuxKGDKOFzczhRE2gVuKJ0nJIVALWMu
	 /Qh+0y5kBMf+8ybWGZH4HTzIMG5k2kCQ3xz0/o6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9188F804E6;
	Fri,  8 Jan 2021 17:05:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2EB0F804C3; Fri,  8 Jan 2021 17:05:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00715F8026F
 for <alsa-devel@alsa-project.org>; Fri,  8 Jan 2021 17:05:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00715F8026F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ddM3LJcG"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 108G2BWC031086; Fri, 8 Jan 2021 10:05:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=42pnSG0XijlsJoZl7LbbUTvg0aucn8KKA91v67tpRUo=;
 b=ddM3LJcGufoDxg+5NzzGAMQvJCFYV3PggDT9no/GlAZ5MkE0inNeJEFBQUptSIzFVfJ+
 OTWqJ987fZB8cxcBBeOKbSu1sOc5mbvZYw35mBtMmlmm/IAA78nVMXE/jntXmMByHX0g
 fLYa5StbK1HC9G2mFjORy4q2llt1kHk3dZGyBMGRRy0oj89kVeCYZElJlL8dbLENy+Hq
 Zmrqr+0ZxVlI8yJ23lhAqyhZwMgnjFtoZEWx5hCD5lWfwxHMGnrCffpPVbHxznw/aDXB
 Zi8OPjlZ8Uc/4MXwI+E9lLYP1hy2LKROln7lP6Kp8e04YC3PMZd18pWd8L/QCesW3avb og== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 35wqjm2gnm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 08 Jan 2021 10:05:10 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 8 Jan 2021
 16:05:08 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 8 Jan 2021 16:05:08 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.226])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 8B64211CB;
 Fri,  8 Jan 2021 16:05:07 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>, <nsaenzjulienne@suse.de>,
 <f.fainelli@gmail.com>
Subject: [PATCH v4 3/6] ASoC: audio-graph-card: Support setting component plls
 and sysclks
Date: Fri, 8 Jan 2021 16:04:58 +0000
Message-ID: <20210108160501.7638-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108160501.7638-1-rf@opensource.cirrus.com>
References: <20210108160501.7638-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 lowpriorityscore=0
 suspectscore=0 clxscore=1011 malwarescore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101080091
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
 sound/soc/generic/audio-graph-card.c  |  13 ++
 sound/soc/generic/simple-card-utils.c | 238 ++++++++++++++++++++++++++
 3 files changed, 276 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index ba4a3e1897b9..1f755250f9c7 100644
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
@@ -59,6 +69,11 @@ struct asoc_simple_priv {
 	const struct snd_soc_ops *ops;
 	unsigned int dpcm_selectable:1;
 	unsigned int force_dpcm:1;
+
+	struct asoc_simple_sysclk_pll *sysclks;
+	int num_sysclks;
+	struct asoc_simple_sysclk_pll *plls;
+	int num_plls;
 };
 #define simple_priv_to_card(priv)	(&(priv)->snd_card)
 #define simple_priv_to_props(priv, i)	((priv)->dai_props + (i))
@@ -97,6 +112,14 @@ void asoc_simple_shutdown(struct snd_pcm_substream *substream);
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
 
@@ -131,6 +154,8 @@ int asoc_simple_parse_widgets(struct snd_soc_card *card,
 				      char *prefix);
 int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
 				   char *prefix);
+int asoc_simple_parse_sysclks(struct asoc_simple_priv *priv, char *prefix);
+int asoc_simple_parse_plls(struct asoc_simple_priv *priv, char *prefix);
 
 int asoc_simple_init_jack(struct snd_soc_card *card,
 			       struct asoc_simple_jack *sjack,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 16a04a678828..9aa15d5ecbd0 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -592,6 +592,19 @@ int graph_parse_of(struct asoc_simple_priv *priv, struct device *dev)
 
 	snd_soc_card_set_drvdata(card, priv);
 
+	ret = asoc_simple_parse_sysclks(priv, NULL);
+	if (ret < 0)
+		goto err;
+
+	ret = asoc_simple_parse_plls(priv, NULL);
+	if (ret < 0)
+		goto err;
+
+	if (priv->num_sysclks || priv->num_plls) {
+		card->set_bias_level = asoc_simple_set_bias_level;
+		card->set_bias_level_post = asoc_simple_set_bias_level_post;
+	}
+
 	asoc_simple_debug_info(priv);
 
 	ret = devm_snd_soc_register_card(dev, card);
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index 6cada4c1e283..a9b1849e328b 100644
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
 
@@ -440,6 +597,15 @@ int asoc_simple_clean_reference(struct snd_soc_card *card)
 		of_node_put(dai_link->cpus->of_node);
 		of_node_put(dai_link->codecs->of_node);
 	}
+
+	if (priv) {
+		for (i = 0; i < priv->num_sysclks; ++i)
+			of_node_put(priv->sysclks[i].node);
+
+		for (i = 0; i < priv->num_plls; ++i)
+			of_node_put(priv->plls[i].node);
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_clean_reference);
@@ -538,6 +704,78 @@ int asoc_simple_parse_pin_switches(struct snd_soc_card *card,
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

