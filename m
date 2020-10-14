Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA9228E2A6
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 16:56:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43811170C;
	Wed, 14 Oct 2020 16:55:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43811170C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602687389;
	bh=ZOGC66dD5XS7NfyU7caKHgexpElECZ8Tb4YjUI9rf/I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gOAM3opolFcm9R+khOsfR+iT/xzxh4ZKDaprXqNBF2qrtU/vlWjAJ1FwCizlIhxt0
	 GfFQvkAapoEdviaL/6b6I+OFaYY3dLFeULmCHdbPDXN39D5OrKLeOCeYkTRlCNkB0B
	 K+ZVxX91R7ZcD3WsR2N0anOF2HYGH+SFBhr6aliU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9C8F8026B;
	Wed, 14 Oct 2020 16:54:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A77AF8026C; Wed, 14 Oct 2020 16:54:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABFC3F80217
 for <alsa-devel@alsa-project.org>; Wed, 14 Oct 2020 16:54:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFC3F80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="efVzKBfs"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 09EEpi83023902; Wed, 14 Oct 2020 09:54:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fh+4rgHS0VmfLr4b6wdcLFhs1aYljIYED2WfDhiIjMQ=;
 b=efVzKBfsPYDai7Q3hc5q8+pxVQyK4DepbRAvhSii08BQBBmvfV8dwmj/DZ5BWeuleivp
 IIghH8/ZgjdGP9kIV1bD2bAqpksh7CSnmipgh3JXcWpEd+mbQrbsMWY3zjcFsttpMOaw
 AAZk/A0QSpahAP5Jkn/kump8LW7NWXHLLEVje0vfIFCcyzmNHaihCxRsJrw2eu4eWmbM
 Hsy1QEEI+JeMcmfCxwCO6t/lov5nhXAodkkAM+YrRuU26VUpaXvUqFJWj1+8VgRILi/b
 Ob+nX3m/XaYoNK2X/V6bTfOiufoS1UbbVif4P4ldGHZI+TwJipKsUHaNqC1Zt6S/GkfH 6Q== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0a-001ae601.pphosted.com with ESMTP id 343ac1wbwc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 14 Oct 2020 09:54:36 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Wed, 14 Oct
 2020 15:54:34 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Wed, 14 Oct 2020 15:54:34 +0100
Received: from AUSNPC0LSNW1-debian.ad.cirrus.com (ausnpc0lsnw1.ad.cirrus.com
 [198.61.64.143])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id A46C22C6;
 Wed, 14 Oct 2020 14:54:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>, <nsaenzjulienne@suse.de>
Subject: [PATCH 3/7] ASoC: simple-card: Support setting component plls and
 sysclks
Date: Wed, 14 Oct 2020 15:54:14 +0100
Message-ID: <20201014145418.31838-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201014145418.31838-1-rf@opensource.cirrus.com>
References: <20201014145418.31838-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140108
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
The plls and sysclks are enabled when the card bia level moves to STANDBY
and disabled when it moved to OFF.

As this is a _simple_ machine driver, the code does not attempt to handle
specifying complex clock ordering interdependencies between components. The
plls and sysclks are applied to a component as it is passed to the card
set_bias_level/set_bias_level_post callbacks. It follows from this that the
order components are configured is the order that they are passed to those
callbacks.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/simple_card_utils.h     |  24 ++++
 sound/soc/generic/simple-card-utils.c | 184 ++++++++++++++++++++++++++
 sound/soc/generic/simple-card.c       |  14 +-
 3 files changed, 221 insertions(+), 1 deletion(-)

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
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 75365c7bb393..52c5f737f350 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -475,6 +475,14 @@ static int simple_parse_of(struct asoc_simple_priv *priv)
 
 	ret = snd_soc_of_parse_aux_devs(card, PREFIX "aux-devs");
 
+	ret = asoc_simple_parse_sysclks(priv, PREFIX);
+	if (ret < 0)
+		return ret;
+
+	ret = asoc_simple_parse_plls(priv, PREFIX);
+	if (ret < 0)
+		return ret;
+
 	return ret;
 }
 
@@ -604,6 +612,7 @@ static int asoc_simple_probe(struct platform_device *pdev)
 	card->owner		= THIS_MODULE;
 	card->dev		= dev;
 	card->probe		= simple_soc_probe;
+	snd_soc_card_set_drvdata(card, priv);
 
 	memset(&li, 0, sizeof(li));
 	simple_get_dais_count(priv, &li);
@@ -672,7 +681,10 @@ static int asoc_simple_probe(struct platform_device *pdev)
 					sizeof(*dai_props->codec_dai));
 	}
 
-	snd_soc_card_set_drvdata(card, priv);
+	if (priv->num_sysclks || priv->num_plls) {
+		card->set_bias_level = asoc_simple_set_bias_level;
+		card->set_bias_level_post = asoc_simple_set_bias_level_post;
+	}
 
 	asoc_simple_debug_info(priv);
 
-- 
2.20.1

