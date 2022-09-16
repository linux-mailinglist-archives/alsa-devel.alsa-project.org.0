Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9560F5BAE1E
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Sep 2022 15:26:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5341AB5;
	Fri, 16 Sep 2022 15:25:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5341AB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663334786;
	bh=+rqMB6EhWAkXd8HDT9fs79SAlcU7C0BK/Z0y89kl6ZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WyAQQYHA4jBP4bHiA0H6pIuYwhsS9P6lUWhrrw8AR3Ph2pptX2ERHMJCHMpSf5C/S
	 XcW9sCR0ys6qTynocINY8YHZKEzz7WqDc1ntVhh1Ram8aFj/GrBY9JNhU0QMMY8DIM
	 3GjdzCbU3fhqDD2TNDsaoQRLBCPb/FO99bZVgX0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 02586F8053B;
	Fri, 16 Sep 2022 15:24:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3689CF80536; Fri, 16 Sep 2022 15:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAF6F80528
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 15:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCAF6F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="xex+n6aR"
Received: by mail-wm1-x329.google.com with SMTP id
 c2-20020a1c3502000000b003b2973dafb7so19867602wma.2
 for <alsa-devel@alsa-project.org>; Fri, 16 Sep 2022 06:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=d8iWZYaJT+rnp0UvauvgX0TvZ6+8AX1ykX2N58BlPI8=;
 b=xex+n6aRK01/zOiRE/HAth4jn7hnfonSLIk3FejGaXEkLSQ+UCJFk9+8kfxCpdCfnU
 JkBH12VfVuRFhCwQlsX9kmSMt4iA6onxkYmWLrDZhzQ8vp26k8p4uGTijOcNTgzZl+8/
 /ic3ge++fPj8tm+SIugYmI1Z+zoCPVxj0lFLoa21JSgMxPO6aWQR7Iq+7bxx4iQZ1Trn
 BmdpL3q5b6umivUTO/AoFtsAJhgQ2PChG69Or7P8IEnAvOeVYJLSEYTdyrZ0Rmjpndg/
 wttof57CiHc6t0PIWeLxbC4Z+iWbacv33NoSyGGf2DD7ySO4eStyVfnP+QYOuri8W+4e
 khFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=d8iWZYaJT+rnp0UvauvgX0TvZ6+8AX1ykX2N58BlPI8=;
 b=XToG11FSET2GXznmqCk2K4VCKs5qvqZfBp5enOwFF4wxPfAmxJb8YMyDzYojUSq3nc
 isiJePwYPFg0QlyTSwZ8J6kiUfThyIPSMblP7RfQOfcKqYh2ZEqacU059tzCrKjKcant
 rnT3KHVb4RKwQrAZXqSr9Ohqy43JMT1YgBMqe9N+bCxZPHw0yRoZVPNvLUQmz7zYIrsw
 bE157aWdZVaJaviZJ/S/vZVfPoy0N/UwfH5YZcHDOt3bXCgG08j7r4CXxzQ0h5/KVS4t
 liR1WIILKyI71oIOyPKE8lPK++EYweqTUpmG4nSXNRkYMag1FlgfEDXjCRquR/kewwka
 3S3A==
X-Gm-Message-State: ACrzQf16ETqGZBhVlkSmoVVENOLAmILGB+U0eEZqO9M2AD1DsnpoqQ3D
 U2QFjyDgzXIayKSreK8nKmxkLhLSPd+Svg==
X-Google-Smtp-Source: AMsMyM7VG9wa/7TpDPzZX3ReblfQ8iFdEAoQBtwKlO4G3CYMe4LsafMBZ+unX3M77L7K4GzCy/8sBQ==
X-Received: by 2002:a05:600c:3b8f:b0:3b4:9cdc:dbd8 with SMTP id
 n15-20020a05600c3b8f00b003b49cdcdbd8mr3383786wms.148.1663334683021; 
 Fri, 16 Sep 2022 06:24:43 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a05600c358500b003a608d69a64sm2387061wmq.21.2022.09.16.06.24.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Sep 2022 06:24:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v5 4/5] ASoC: qcom: sm8250: move some code to common
Date: Fri, 16 Sep 2022 14:24:26 +0100
Message-Id: <20220916132427.1845-5-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
References: <20220916132427.1845-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
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
At least another 2 of them for now (SM8450 and SC8250XP).

Move some of the common SoundWire stream specific code to common file
so that other drivers can use it instead of duplication.

This patch is to prepare the common driver to be able to add new SoCs support
with less dupication.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/qcom/common.c | 171 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  35 ++++++++
 sound/soc/qcom/sm8250.c | 152 ++---------------------------------
 3 files changed, 213 insertions(+), 145 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index e53ad84f8ff5..69dd3b504e20 100644
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
@@ -177,4 +180,172 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE)
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
+#endif
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
index f05c05b12bd7..c5472a642de0 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -5,7 +5,42 @@
 #define __QCOM_SND_COMMON_H__
 
 #include <sound/soc.h>
+#include <linux/soundwire/sdw.h>
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
+int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
+			    struct snd_soc_jack *jack, bool *jack_setup);
 
+#if IS_ENABLED(CONFIG_SOUNDWIRE)
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *runtime,
+			 bool *stream_prepared);
+int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct sdw_stream_runtime **psruntime);
+int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *sruntime,
+			 bool *stream_prepared);
+#else
+static inline int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+				       struct sdw_stream_runtime *runtime,
+				       bool *stream_prepared)
+{
+	return -ENOTSUPP;
+}
+
+static inline int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+					 struct snd_pcm_hw_params *params,
+					 struct sdw_stream_runtime **psruntime)
+{
+	return -ENOTSUPP;
+}
+
+static inline int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
+				       struct sdw_stream_runtime *sruntime,
+				       bool *stream_prepared)
+{
+	return -ENOTSUPP;
+}
+#endif
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

