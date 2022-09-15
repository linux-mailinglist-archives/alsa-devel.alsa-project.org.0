Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F21D85B9B77
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Sep 2022 14:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C7CF1A5F;
	Thu, 15 Sep 2022 14:57:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C7CF1A5F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663246696;
	bh=h6oZLOpmp17MbOmCoqNHoRaDbxfPPtJBvsAkF1KrELs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sL2xX4DsH2tAYx7NKEZvZ31mSQDVyi07niSzeJl/ckmch8TQeJ6SeudZ7Fvra8bnr
	 i+rzqA7wt6KRcs+1TC/XYQTzrY0HrhciUnXcJBz0v3XMu8v99mQo2FUYPrd2Pwg957
	 PuXra8DCC0fCYz0WdKpqqFRSVDkD8n4QiMijMH9w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43898F8053B;
	Thu, 15 Sep 2022 14:56:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4ACFF8053A; Thu, 15 Sep 2022 14:56:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2C35F80424
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 14:56:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2C35F80424
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="SmFosRB0"
Received: by mail-wr1-x42b.google.com with SMTP id t7so30711941wrm.10
 for <alsa-devel@alsa-project.org>; Thu, 15 Sep 2022 05:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qfjx5468iY6BgxENdNaGg9dCfUDL2sfRlO++u9vOlfo=;
 b=SmFosRB0YdPxyy6Uvy8UfVvMEqOzT4WemYQvEHGS3kqkJ+g5PccuyI0VLx1URTFt80
 TWsInpPdq/Uw1D4hgYBlW+x04nXfzCMgyfkLYaU1ZdPSetNEtuaLUT4uWQ6MI8MpIDiI
 x4diDiZ0pxh6zIu0oMk765wXKFg7lIKNB4nb8T16pU6c1BNJKxKpF/l4/dRYLauYFeZw
 yQEu5Et93tM56l7AFP7YCP+SL86PD5o20JTqOyzvQw6oG+G7je+57l0htnCOiAr0ZV4O
 7HYSHRgHzbzndiOTTY8mOzXbuE2jsx9OElYlTvSr4MYEle/qRUqun8E76rA+8JfsAED6
 pYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qfjx5468iY6BgxENdNaGg9dCfUDL2sfRlO++u9vOlfo=;
 b=rVGP39MAJzr3TY/PqULK+n2HRgIhNBxI2enl0RJynCnbOmRnBBU2Z+A3HmY4bE7WES
 2Re7ZXBTsvkFioQ4c1ild0TJgsNidTgNn/r2qgimiHsUQgUyjd1fqU4XA/WJ7sNh3NPQ
 h1tNq27bAfdtbEmeWtvlsCojBwgC7llLke7JDCibfp5lk/DE/LLIp5Dsc37P4iJ9+/cK
 A3xoD6Exkli0Y2HPzEkRk56zIQH7pCaBy/JZFspPWk7BDQj9JjFABB2Dj/0x2Vx17pqz
 gxOSUs3ZIvSHriO+mExt+LsYTRw2FqXz/sUE3exqhFY+OQ5oCmFOTof0vO0rtOTXCWsq
 i5uA==
X-Gm-Message-State: ACrzQf2fHjoeTNdBu3TBTgQiixWK+l/XTWzFrzNAi8rWp9BOuKSyIfgp
 sPgZOCysXMvD6/e8PIrcESTHEg==
X-Google-Smtp-Source: AMsMyM4PGSV4YgkSU+94Pe5Qz0efMADE65JGdF6AuZ625jabUC2nBUzOdt5PQITAPqH10tYcp4R2pA==
X-Received: by 2002:a5d:6985:0:b0:22a:d169:6fce with SMTP id
 g5-20020a5d6985000000b0022ad1696fcemr1932193wru.717.1663246586201; 
 Thu, 15 Sep 2022 05:56:26 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id
 o11-20020a05600c510b00b003a845621c5bsm2764776wms.34.2022.09.15.05.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Sep 2022 05:56:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v4 3/4] ASoC: qcom: sm8250: move some code to common
Date: Thu, 15 Sep 2022 13:56:10 +0100
Message-Id: <20220915125611.22473-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
References: <20220915125611.22473-1-srinivas.kandagatla@linaro.org>
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
At least another 2 of them for now (SM8450 and SM8250XP).

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

