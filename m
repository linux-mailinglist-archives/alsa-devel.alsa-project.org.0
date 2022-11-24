Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89729637B0A
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 15:05:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A6CE16B1;
	Thu, 24 Nov 2022 15:04:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A6CE16B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669298705;
	bh=y4j0MpPL26pUHPec2CqMvpAGne5rRw1OQusu7QCuZc4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XghtW9/bvBImc/bq0WwH+fy03xhkjtWzUq/veXL1fYj4dnqcBQUc/xFh+0xhd9d3u
	 iCGjaVhLIo27JLL5UnQQ8weA9l/YAKS8sCnCy3er5CoKKkzYWuaVVfZDkHC9oWYEI7
	 h978QSyAU8Dv7lhE0SGFBy221D6OtS9q4u5/ZEVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E74EF80115;
	Thu, 24 Nov 2022 15:04:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E35FF80431; Thu, 24 Nov 2022 15:04:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25CFEF8014E
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 15:04:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25CFEF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="FPmS9nYj"
Received: by mail-wr1-x430.google.com with SMTP id i12so2685794wrb.0
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 06:04:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UPLDM1X+4+BmpiYXGN4fQwA4bV0V/bRkxj3ZJr22X8k=;
 b=FPmS9nYjtoWgaoEzjnzqpYOb3E6RaXUxbohz6HY6hDlqg2cTb0jwsKgyfR45NAx/RS
 u6YN9AXh8zo5Z4Cu60tyc5SSpSVXw2HxVEOSkEmVMg6qPyPtY5wy/OWxjsE2Pv+T0ODY
 f1xMqg5Ty+fjT59BdtwRgwo/UtCpO+3Nj30oRh1gfkkxRh/q0eGCrDwgrATm3AZgiNvT
 /VBPw3OU2l2DcKloq7OpLbTdjgEd28EevM7x/QeMWMIKeZocB87dM6grxXiGIsFLtP4P
 A+/9yaNFyxNhRsDEPKZJAYzZsBJBTizqwV5JKskLRvDhVd2nQvuwGtD/4Nn4VqzotHRY
 qXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UPLDM1X+4+BmpiYXGN4fQwA4bV0V/bRkxj3ZJr22X8k=;
 b=3Sw2AFk5M3OvCVkc5MmVHFpqxzMtdW+ctC14KlZw1pEl9v8qvfp0tURkRgaM3N1c1b
 5zsLulElxffxhOXwtomdqjbJX1V9U6nFlrTDWUSYaD8/gba8gx5EbKVaj2vjFMKia8Bs
 CYfBMAAkuNMJ+tEs52NP6raTX4py45b9ForWxFFb+BgUeDqSrZdQIO1dWF1LWmMASToS
 vbIxMos9wC1BFNoKlrxRMUqyLfHdU+FrP92fB3Z0epKBgqC9mwD8oyMJ5w2J01zbjLzg
 uPgfN76gbti9BuvA+1eb+AF2WtdlDBAGBZKNl3r9Lbr/0c8spo8w/9vRdoKjujaoDdAN
 tj6w==
X-Gm-Message-State: ANoB5pmNGq4bxsFOThRfdOyuDrM0FRtes2VBpqKU5jzlA2Buu0hUV7Zf
 TjqWW1lIw5Ej6nFVLfLRZaHpOUVivf4cvw==
X-Google-Smtp-Source: AA0mqf6Ez3aJB3hwGRDNPb4zZPBCNg0+cXL7s32xoUdXbrKzgxBfhDVeW0r6N0XwN8b9v7lV2AyWRA==
X-Received: by 2002:adf:ea82:0:b0:241:e749:f75c with SMTP id
 s2-20020adfea82000000b00241e749f75cmr6978278wrm.609.1669298640229; 
 Thu, 24 Nov 2022 06:04:00 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
 by smtp.gmail.com with ESMTPSA id
 m29-20020a05600c3b1d00b003c6b7f5567csm11770720wms.0.2022.11.24.06.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Nov 2022 06:03:59 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH] ASoC: qcom: cleanup and fix dependency of QCOM_COMMON
Date: Thu, 24 Nov 2022 14:03:51 +0000
Message-Id: <20221124140351.407506-1-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel test robot <lkp@intel.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

SND_SOC_QCOM_COMMON depends on SOUNDWIRE for some symbols but this
is not explicitly specified using Kconfig depends. On the other hand
SND_SOC_QCOM_COMMON is also directly selected by the sound card
Kconfigs, this could result in various combinations and some symbols
ending up in modules and soundcard that uses those symbols as in-build
driver.

Fix these issues by explicitly specifying the dependencies of
SND_SOC_QCOM_COMMON and also use imply a to select SND_SOC_QCOM_COMMON
so that the symbol is selected based on its dependencies.

Also remove dummy stubs in common.c around CONFIG_SOUNDWIRE

Fixes: 3bd975f3ae0a ("ASoC: qcom: sm8250: move some code to common")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig  | 16 +++++++++-------
 sound/soc/qcom/common.c |  2 --
 sound/soc/qcom/common.h | 23 -----------------------
 3 files changed, 9 insertions(+), 32 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 8c7398bc1ca8..96a6d4731e6f 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -2,6 +2,7 @@
 menuconfig SND_SOC_QCOM
 	tristate "ASoC support for QCOM platforms"
 	depends on ARCH_QCOM || COMPILE_TEST
+	imply SND_SOC_QCOM_COMMON
 	help
 	  Say Y or M if you want to add support to use audio devices
 	  in Qualcomm Technologies SOC-based platforms.
@@ -59,13 +60,14 @@ config SND_SOC_STORM
 config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
 	select SND_SOC_LPASS_APQ8016
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	help
 	  Support for Qualcomm Technologies LPASS audio block in
 	  APQ8016 SOC-based systems.
 	  Say Y if you want to use audio devices on MI2S.
 
 config SND_SOC_QCOM_COMMON
+	depends on SOUNDWIRE
 	tristate
 
 config SND_SOC_QDSP6_COMMON
@@ -142,7 +144,7 @@ config SND_SOC_MSM8996
 	depends on QCOM_APR
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	help
 	  Support for Qualcomm Technologies LPASS audio block in
 	  APQ8096 SoC-based systems.
@@ -153,7 +155,7 @@ config SND_SOC_SDM845
 	depends on QCOM_APR && I2C && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
 	imply SND_SOC_CROS_EC_CODEC
@@ -167,7 +169,7 @@ config SND_SOC_SM8250
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SM8250 SoC-based systems.
@@ -178,7 +180,7 @@ config SND_SOC_SC8280XP
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SC8280XP SoC-based systems.
@@ -188,7 +190,7 @@ config SND_SOC_SC7180
 	tristate "SoC Machine driver for SC7180 boards"
 	depends on I2C && GPIOLIB
 	depends on SOUNDWIRE || SOUNDWIRE=n
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682_I2C
@@ -202,7 +204,7 @@ config SND_SOC_SC7180
 config SND_SOC_SC7280
 	tristate "SoC Machine driver for SC7280 boards"
 	depends on I2C && SOUNDWIRE
-	select SND_SOC_QCOM_COMMON
+	depends on SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X_SDW
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 69dd3b504e20..49c74c1662a3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -180,7 +180,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
-#if IS_ENABLED(CONFIG_SOUNDWIRE)
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared)
@@ -294,7 +293,6 @@ int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-#endif
 
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index c5472a642de0..3ef5bb6d12df 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -11,7 +11,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 
-#if IS_ENABLED(CONFIG_SOUNDWIRE)
 int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *runtime,
 			 bool *stream_prepared);
@@ -21,26 +20,4 @@ int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
 int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
 			 struct sdw_stream_runtime *sruntime,
 			 bool *stream_prepared);
-#else
-static inline int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-				       struct sdw_stream_runtime *runtime,
-				       bool *stream_prepared)
-{
-	return -ENOTSUPP;
-}
-
-static inline int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-					 struct snd_pcm_hw_params *params,
-					 struct sdw_stream_runtime **psruntime)
-{
-	return -ENOTSUPP;
-}
-
-static inline int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
-				       struct sdw_stream_runtime *sruntime,
-				       bool *stream_prepared)
-{
-	return -ENOTSUPP;
-}
-#endif
 #endif
-- 
2.25.1

