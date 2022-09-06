Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B395AF14F
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Sep 2022 18:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 226BE84B;
	Tue,  6 Sep 2022 18:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 226BE84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662483440;
	bh=KTWaSOMFFJlyi9IO8ZYcdfOVL7tRLhPZ+ZaZ6qfq5Sc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AFW0nfS5/lBp9sVO9QTVHzn51vXAnnkyuv/zknlK4uQr/3Ib+/9FQ6AXxECmlmzCL
	 8+IbpNPd93MJCGfp7Hyf/OE11WlvDxoVzLTFHQZuujzDUqfgvNcfj4SZRhNbkcXwW1
	 xm8eSmZMcg7x7d+Bgp0m6skMx58wrLUvmq1l/xvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BE8DF80548;
	Tue,  6 Sep 2022 18:55:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E5C5F80533; Tue,  6 Sep 2022 18:55:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D681AF8047B
 for <alsa-devel@alsa-project.org>; Tue,  6 Sep 2022 18:55:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D681AF8047B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BwhoiV5d"
Received: by mail-wm1-x32b.google.com with SMTP id
 k6-20020a05600c1c8600b003a54ecc62f6so7818698wms.5
 for <alsa-devel@alsa-project.org>; Tue, 06 Sep 2022 09:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=WvuZYrGa0jtvDXGuyfKiMnbv6L38h+/6yJ1AOqEznXI=;
 b=BwhoiV5dYhkW9YnxIq9S+ISXFUoqXhnRjmvuyRelfrCIwyyvAiMUrnkVpgA3FViiUD
 eczUh8ujWNjIYlclOfVtoN4rZbfbubYMAzS/H5WbolwoOamMD3J5SzgJlTwBqKpTKzWY
 pE62esYOUKGIFcCbrojRnI6OrCM6dOlhvozWEl2MhhBSGx/H88+U50uY+r3FtAfnBIcp
 JQXfxfwRlDTFDcPmOn1FjoMHHIVwq2gMfL5oAgAb2zWFGqCa2upKA0zoixSluxZfd6M5
 02NIrzqLVDlXHiDqkz3iUAS38BKCRP1RaDRtsOgMMBBZRYSPlhJTrKlG5vMgNBA1Gf5J
 qm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=WvuZYrGa0jtvDXGuyfKiMnbv6L38h+/6yJ1AOqEznXI=;
 b=ai3KFPE4dCOD9PyeNpH0k6UHwhw092v0eJ6Z+oV+s8Oni4oaE6JqO6MXeeFO/Jh96d
 xfg/lI2KvQ8hxBE4kzSp6JBd0YOcM0RWQCJsyE4BePSy7Fk9SY/b45QAUgovEl36b+iH
 nWeUIcmhINdGjHkrIR0uYNYhxAvDCY995ZpzrbckS470grQIGb+6PCW3xaP71jgvpElL
 Kdc6j0aOjWGvP8MujlBwzXcSu8ZqttD2C8RA559zOnnKnQJtM4mrcPJNOLblos10Ey/w
 gZIiQfN+ZxxmZJKri/hDBJsPJJO3NjJNbRsVf9HE2J3HEme/cWh5w8y+dCj+1SNHSJg8
 36Sw==
X-Gm-Message-State: ACgBeo2JrrxqtnUWHGabjl650URlNOJnVGl+9+Fv4uZVeBGxx1t7O//s
 Z95POWFoouEuzqagO/0NlHhOcg==
X-Google-Smtp-Source: AA6agR4CMK8AM5pr+hTEaj+zqWONNhA0RbRjWkgJTSwF2M66Isrr3nn9StObeB1vnbyhy7l0BPXZaQ==
X-Received: by 2002:a05:600c:2cc5:b0:3a5:4fae:1288 with SMTP id
 l5-20020a05600c2cc500b003a54fae1288mr14684770wmc.79.1662483317889; 
 Tue, 06 Sep 2022 09:55:17 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 co4-20020a0560000a0400b0021eed2414c9sm13775906wrb.40.2022.09.06.09.55.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 09:55:17 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 3/4] ASoC: qcom: sm8250: move some code to common
Date: Tue,  6 Sep 2022 17:55:07 +0100
Message-Id: <20220906165508.30801-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
References: <20220906165508.30801-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, bgoswami@quicinc.com,
 linux-kernel@vger.kernel.org
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

SM8450 machine driver code can be reused across multiple Qualcomm SoCs,
atleast another 2 of them for now (SM8450 and SM8250XP).

Move some of the common SoundWire stream specific code to common file
so that other drivers can use it instead of duplicating.

This patch is to prepare the common driver to be able to add new SoCs support
with less dupication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/common.c | 169 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  12 +++
 sound/soc/qcom/sm8250.c | 152 ++----------------------------------
 3 files changed, 188 insertions(+), 145 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e53ad84f8ff5..49c74c1662a3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -3,6 +3,9 @@
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
 #include <linux/module.h>
+#include <sound/jack.h>
+#include <linux/input-event-codes.h>
+#include "qdsp6/q6afe.h"
 #include "common.h"
 
 int qcom_snd_parse_of(struct snd_soc_card *card)
@@ -177,4 +180,170 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *sruntime,
+			 bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		break;
+	default:
+		return 0;
+	}
+
+	if (*stream_prepared) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		*stream_prepared = false;
+	}
+
+	ret = sdw_prepare_stream(sruntime);
+	if (ret)
+		return ret;
+
+	/**
+	 * NOTE: there is a strict hw requirement about the ordering of port
+	 * enables and actual WSA881x PA enable. PA enable should only happen
+	 * after soundwire ports are enabled if not DC on the line is
+	 * accumulated resulting in Click/Pop Noise
+	 * PA enable/mute are handled as part of codec DAPM and digital mute.
+	 */
+
+	ret = sdw_enable_stream(sruntime);
+	if (ret) {
+		sdw_deprepare_stream(sruntime);
+		return ret;
+	}
+	*stream_prepared  = true;
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
+
+int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct sdw_stream_runtime **psruntime)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct sdw_stream_runtime *sruntime;
+	int i;
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
+			if (sruntime != ERR_PTR(-ENOTSUPP))
+				*psruntime = sruntime;
+		}
+		break;
+	}
+
+	return 0;
+
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_params);
+
+int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case WSA_CODEC_DMA_RX_0:
+	case WSA_CODEC_DMA_RX_1:
+	case RX_CODEC_DMA_RX_0:
+	case RX_CODEC_DMA_RX_1:
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		if (sruntime && *stream_prepared) {
+			sdw_disable_stream(sruntime);
+			sdw_deprepare_stream(sruntime);
+			*stream_prepared = false;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
+
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	int rval, i;
+
+	if (!*jack_setup) {
+		rval = snd_soc_card_jack_new(card, "Headset Jack",
+					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
+					     SND_JACK_MECHANICAL |
+					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
+					     jack);
+
+		if (rval < 0) {
+			dev_err(card->dev, "Unable to add Headphone Jack\n");
+			return rval;
+		}
+
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_MEDIA);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+		snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+		*jack_setup = true;
+	}
+
+	switch (cpu_dai->id) {
+	case TX_CODEC_DMA_TX_0:
+	case TX_CODEC_DMA_TX_1:
+	case TX_CODEC_DMA_TX_2:
+	case TX_CODEC_DMA_TX_3:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			rval = snd_soc_component_set_jack(codec_dai->component,
+							  jack, NULL);
+			if (rval != 0 && rval != -ENOTSUPP) {
+				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+				return rval;
+			}
+		}
+
+		break;
+	default:
+		break;
+	}
+
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index f05c05b12bd7..0ab8d13ef44e 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -5,7 +5,19 @@
 #define __QCOM_SND_COMMON_H__
 
 #include <sound/soc.h>
+#include <linux/soundwire/sdw.h>
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *runtime,
+			 bool *stream_prepared);
+int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct sdw_stream_runtime **psruntime);
+int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *sruntime,
+			 bool *stream_prepared);
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
 
 #endif
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 98a2fde9e004..8dbe9ef41b1c 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -27,57 +27,8 @@ struct sm8250_snd_data {
 static int sm8250_snd_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_card *card = rtd->card;
-	int rval, i;
-
-	if (!data->jack_setup) {
-		struct snd_jack *jack;
-
-		rval = snd_soc_card_jack_new(card, "Headset Jack",
-					     SND_JACK_HEADSET | SND_JACK_LINEOUT |
-					     SND_JACK_MECHANICAL |
-					     SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-					     SND_JACK_BTN_2 | SND_JACK_BTN_3 |
-					     SND_JACK_BTN_4 | SND_JACK_BTN_5,
-					     &data->jack);
-
-		if (rval < 0) {
-			dev_err(card->dev, "Unable to add Headphone Jack\n");
-			return rval;
-		}
-
-		jack = data->jack.jack;
-
-		snd_jack_set_key(jack, SND_JACK_BTN_0, KEY_MEDIA);
-		snd_jack_set_key(jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
-		snd_jack_set_key(jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
-		snd_jack_set_key(jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
-		data->jack_setup = true;
-	}
-
-	switch (cpu_dai->id) {
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			rval = snd_soc_component_set_jack(codec_dai->component,
-							  &data->jack, NULL);
-			if (rval != 0 && rval != -ENOTSUPP) {
-				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
-				return rval;
-			}
-		}
-
-		break;
-	default:
-		break;
-	}
 
-
-	return 0;
+	return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
 }
 
 static int sm8250_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
@@ -121,92 +72,21 @@ static int sm8250_snd_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
-	struct sdw_stream_runtime *sruntime;
-	int i;
-
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			sruntime = snd_soc_dai_get_stream(codec_dai,
-							  substream->stream);
-			if (sruntime != ERR_PTR(-ENOTSUPP))
-				pdata->sruntime[cpu_dai->id] = sruntime;
-		}
-		break;
-	}
-
-	return 0;
 
+	return qcom_snd_sdw_hw_params(substream, params, &pdata->sruntime[cpu_dai->id]);
 }
 
-static int sm8250_snd_wsa_dma_prepare(struct snd_pcm_substream *substream)
+static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sm8250_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
-	int ret;
-
-	if (!sruntime)
-		return 0;
 
-	if (data->stream_prepared[cpu_dai->id]) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		data->stream_prepared[cpu_dai->id] = false;
-	}
-
-	ret = sdw_prepare_stream(sruntime);
-	if (ret)
-		return ret;
-
-	/**
-	 * NOTE: there is a strict hw requirement about the ordering of port
-	 * enables and actual WSA881x PA enable. PA enable should only happen
-	 * after soundwire ports are enabled if not DC on the line is
-	 * accumulated resulting in Click/Pop Noise
-	 * PA enable/mute are handled as part of codec DAPM and digital mute.
-	 */
-
-	ret = sdw_enable_stream(sruntime);
-	if (ret) {
-		sdw_deprepare_stream(sruntime);
-		return ret;
-	}
-	data->stream_prepared[cpu_dai->id]  = true;
-
-	return ret;
-}
-
-static int sm8250_snd_prepare(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case WSA_CODEC_DMA_RX_1:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		return sm8250_snd_wsa_dma_prepare(substream);
-	default:
-		break;
-	}
-
-	return 0;
+	return qcom_snd_sdw_prepare(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
 }
 
 static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
@@ -216,26 +96,8 @@ static int sm8250_snd_hw_free(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
 
-	switch (cpu_dai->id) {
-	case WSA_CODEC_DMA_RX_0:
-	case WSA_CODEC_DMA_RX_1:
-	case RX_CODEC_DMA_RX_0:
-	case RX_CODEC_DMA_RX_1:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		if (sruntime && data->stream_prepared[cpu_dai->id]) {
-			sdw_disable_stream(sruntime);
-			sdw_deprepare_stream(sruntime);
-			data->stream_prepared[cpu_dai->id] = false;
-		}
-		break;
-	default:
-		break;
-	}
-
-	return 0;
+	return qcom_snd_sdw_hw_free(substream, sruntime,
+				    &data->stream_prepared[cpu_dai->id]);
 }
 
 static const struct snd_soc_ops sm8250_be_ops = {
-- 
2.21.0

