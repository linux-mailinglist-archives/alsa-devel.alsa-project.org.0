Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82ED14B8EEE
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Feb 2022 18:16:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D915717DA;
	Wed, 16 Feb 2022 18:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D915717DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645031765;
	bh=UJB9DXI1qJjCvNuMSrVoJ33jB9yqXQ4j/rpGu7PW63o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fIKBawotCi84bPzzQ4XwX0Q67+t6GviZNjOpoVoU651ZrMpu6XfpQ0mYmQZ9Cbs9z
	 AT0k4AJxqOkAbjBNK5gd8E7U8vaSlWKKv+DgvhMJz3BXEaxzMzFZpDK3cE0iLgEx/c
	 gp5Z278mBw4BU+HHLMpEV9ReSZA+6PzZOc0YNRLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FBBAF804F3;
	Wed, 16 Feb 2022 18:14:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BB740F80245; Wed, 16 Feb 2022 18:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1AA23F800D8
 for <alsa-devel@alsa-project.org>; Wed, 16 Feb 2022 18:14:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1AA23F800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="dvwp7kDR"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 21G9uJV2008610;
 Wed, 16 Feb 2022 11:14:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=33vqaw4OMqIg+THa03UUOG1n/gnvCXtRmFHkVk9Gw2A=;
 b=dvwp7kDR8mpNCHBu2+U20GV2xQQEaWNiBWwDokjTqKolWgTtpfxTnZKbaRXJYCOJY7P2
 fCaKH/gTFVZxFAQ/4qnPpZpJ6UAZO+3N5tpl9Shht4QZMugx1T4xAWq0szDi3jZZdrg+
 BJXrYi8cvmLUnHI/gTztImfhseSEx7iyAucbTsh6Pqwe1yr7PHP6IuZQhQkhvx47AIdR
 /Q4YQUQO7L0GdNZsjGADj5Xv7/agTv2fOjEd0Az5FpvXM/B5FGrUDsUAU8ACWrlVoZdc
 oVdRWbVkrm1xT7vlHt8oxU4JI4yV5rFJjlyjjRS3DCQ3WC7fXa1iBROeJwG823BiJGZW uA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3e8nrah4gr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 16 Feb 2022 11:14:15 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Feb
 2022 17:14:13 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Wed, 16 Feb 2022 17:14:13 +0000
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.199])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 909FB459;
 Wed, 16 Feb 2022 17:14:13 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <robh+dt@kernel.org>,
 <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: audio_graph_card2: Add support for variable slot
 widths
Date: Wed, 16 Feb 2022 17:14:08 +0000
Message-ID: <20220216171408.265605-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220216171408.265605-1-rf@opensource.cirrus.com>
References: <20220216171408.265605-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: BmFtjN7WAIqI9Sq_9KwVaQVh_6YETDSk
X-Proofpoint-GUID: BmFtjN7WAIqI9Sq_9KwVaQVh_6YETDSk
X-Proofpoint-Spam-Reason: safe
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
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

Some audio hardware cannot support a fixed slot width or a slot width
equal to the sample width in all cases. This is usually due either to
limitations of the audio serial port or system clocking restrictions.
A typical example would be:

- 16-bit samples in 16-bit slots
- 24-bit samples in 32-bit slots

The new dai-tdm-slot-width-map property allows setting a mapping of
sample widths and the corresponding tdm slot widths. The content is
an array of integers. Each pair of values are the sample_width and
the corresponding slot width.

The property is added to each endpoint node that needs the restriction.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/simple_card_utils.h     | 11 ++++
 sound/soc/generic/audio-graph-card2.c |  4 ++
 sound/soc/generic/simple-card-utils.c | 95 +++++++++++++++++++++++++++
 3 files changed, 110 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 5ee269c59aac..1c966efe0187 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -16,6 +16,11 @@
 #define asoc_simple_init_mic(card, sjack, prefix) \
 	asoc_simple_init_jack(card, sjack, 0, prefix, NULL)
 
+struct asoc_simple_tdm_width_map {
+	int sample_bits;
+	int slot_width;
+};
+
 struct asoc_simple_dai {
 	const char *name;
 	unsigned int sysclk;
@@ -26,6 +31,9 @@ struct asoc_simple_dai {
 	unsigned int rx_slot_mask;
 	struct clk *clk;
 	bool clk_fixed;
+	struct asoc_simple_tdm_width_map *tdm_width_map;
+	int n_tdm_widths;
+	struct snd_soc_dai *dai;
 };
 
 struct asoc_simple_data {
@@ -132,6 +140,9 @@ int asoc_simple_parse_daifmt(struct device *dev,
 			     struct device_node *codec,
 			     char *prefix,
 			     unsigned int *retfmt);
+int asoc_simple_parse_tdm_width_map(struct device *dev, struct device_node *np,
+				    struct asoc_simple_dai *dai);
+
 __printf(3, 4)
 int asoc_simple_set_dailink_name(struct device *dev,
 				 struct snd_soc_dai_link *dai_link,
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index c3947347dda3..c0f3907a01fd 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -503,6 +503,10 @@ static int __graph_parse_node(struct asoc_simple_priv *priv,
 	if (ret < 0)
 		return ret;
 
+	ret = asoc_simple_parse_tdm_width_map(dev, ep, dai);
+	if (ret < 0)
+		return ret;
+
 	ret = asoc_simple_parse_clk(dev, ep, dai, dlc);
 	if (ret < 0)
 		return ret;
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index a4babfb63175..60653d7d7ae7 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -12,6 +12,7 @@
 #include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <sound/jack.h>
+#include <sound/pcm_params.h>
 #include <sound/simple_card_utils.h>
 
 void asoc_simple_convert_fixup(struct asoc_simple_data *data,
@@ -87,6 +88,49 @@ int asoc_simple_parse_daifmt(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(asoc_simple_parse_daifmt);
 
+int asoc_simple_parse_tdm_width_map(struct device *dev, struct device_node *np,
+				    struct asoc_simple_dai *dai)
+{
+	u32 *array_values;
+	int n, i, ret;
+
+	if (!of_property_read_bool(np, "dai-tdm-slot-width-map"))
+		return 0;
+
+	n = of_property_count_elems_of_size(np, "dai-tdm-slot-width-map", sizeof(u32));
+	if (n % 1) {
+		dev_err(dev, "Invalid number of cells for dai-tdm-slot-width-map\n");
+		return -EINVAL;
+	}
+
+	dai->tdm_width_map = devm_kcalloc(dev, n, sizeof(*dai->tdm_width_map), GFP_KERNEL);
+	if (!dai->tdm_width_map)
+		return -ENOMEM;
+
+	array_values = kcalloc(n, sizeof(*array_values), GFP_KERNEL);
+	if (!array_values)
+		return -ENOMEM;
+
+	ret = of_property_read_u32_array(np, "dai-tdm-slot-width-map", array_values, n);
+	if (ret < 0) {
+		dev_err(dev, "Could not read dai-tdm-slot-width-map: %d\n", ret);
+		goto out;
+	}
+
+	for (i = 0; i < n; i += 2) {
+		dai->tdm_width_map[i / 2].sample_bits = array_values[i];
+		dai->tdm_width_map[i / 2].slot_width = array_values[i + 1];
+	}
+
+	dai->n_tdm_widths = n / 2;
+	ret = 0;
+out:
+	kfree(array_values);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(asoc_simple_parse_tdm_width_map);
+
 int asoc_simple_set_dailink_name(struct device *dev,
 				 struct snd_soc_dai_link *dai_link,
 				 const char *fmt, ...)
@@ -309,6 +353,42 @@ static int asoc_simple_set_clk_rate(struct device *dev,
 	return clk_set_rate(simple_dai->clk, rate);
 }
 
+static int asoc_simple_set_tdm(struct asoc_simple_dai *simple_dai,
+				struct snd_pcm_hw_params *params)
+{
+	int slot_width = params_width(params);
+	int sample_bits = params_width(params);
+	int i, ret;
+
+	if (!simple_dai)
+		return 0;
+
+	if (!simple_dai->dai || !simple_dai->tdm_width_map)
+		return 0;
+
+	if (simple_dai->slot_width)
+		slot_width = simple_dai->slot_width;
+
+	for (i = 0; i < simple_dai->n_tdm_widths; ++i) {
+		if (simple_dai->tdm_width_map[i].sample_bits == sample_bits) {
+			slot_width = simple_dai->tdm_width_map[i].slot_width;
+			break;
+		}
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(simple_dai->dai,
+				       simple_dai->tx_slot_mask,
+				       simple_dai->rx_slot_mask,
+				       simple_dai->slots,
+				       slot_width);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(simple_dai->dai->dev, "simple-card: set_tdm_slot error: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 			  struct snd_pcm_hw_params *params)
 {
@@ -362,6 +442,19 @@ int asoc_simple_hw_params(struct snd_pcm_substream *substream,
 				return ret;
 		}
 	}
+
+	for_each_prop_dai_codec(props, i, pdai) {
+		ret = asoc_simple_set_tdm(pdai, params);
+		if (ret < 0)
+			return ret;
+	}
+
+	for_each_prop_dai_cpu(props, i, pdai) {
+		ret = asoc_simple_set_tdm(pdai, params);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(asoc_simple_hw_params);
@@ -386,6 +479,8 @@ static int asoc_simple_init_dai(struct snd_soc_dai *dai,
 	if (!simple_dai)
 		return 0;
 
+	simple_dai->dai = dai;
+
 	if (simple_dai->sysclk) {
 		ret = snd_soc_dai_set_sysclk(dai, 0, simple_dai->sysclk,
 					     simple_dai->clk_direction);
-- 
2.30.2

