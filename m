Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB6B65A3D7
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Dec 2022 12:57:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77AB23412;
	Sat, 31 Dec 2022 12:57:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77AB23412
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672487870;
	bh=Khv6y9PijmDeEVZUvIpGkW55QM3DSj23+ovWfcCPEZE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=mMAGNqnGUhf3n7jPKOYahRk54L8f1sUshZF3IFDbC6BYr9dRGpoyPs6Gqw3y4NjzA
	 xSrzJsZqgnohfHsEOnN7AWzFwzlYbgxom4rr0MLMHeccO5Csda2MFb1JntTUxlSdMJ
	 zVRpVXjjjxm4DdHePXpgAeky3E6qNXth8oXqXBxg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3896F804E4;
	Sat, 31 Dec 2022 12:56:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10A6DF804E4; Sat, 31 Dec 2022 12:56:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
 [85.215.255.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 198E1F80310
 for <alsa-devel@alsa-project.org>; Sat, 31 Dec 2022 12:56:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 198E1F80310
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=gerhold.net header.i=@gerhold.net header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=JWZXFFWA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1672487803;
 s=strato-dkim-0002; d=gerhold.net;
 h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
 bh=rVkt3cegtnjnCyd2kXxCABkbCBg6DAtk/679/sN/Qk4=;
 b=JWZXFFWAr7yBKXE4wSpnjU1wxCJxFJQai/pr7lcQ/jhUJGmplF7yT1kzCURdjpnHzz
 0ZJLAyHyHb9gbEZtguh5duRCVvEZnnw4HjCNiCT0sNcnjRzOBw3kiHjpnYIEsgx4nQC3
 clukLJ9yq9XQLHmxpMWiLE9Qf/SU+zxub9EOklVDA4+XYVlbMvMSPAiBvhvUu5eCntcP
 sjaOU1YTkrYi1dF2vBvFGDgAyyktTvPciX2S2UwVnpsL5ZB6AYkEsISJF1UUHRh8aroZ
 5Al6XYn9LzuGumfCkwPPiqJimEU+jO70st4Ymcek6T/3Dl59bgaEW6oKRZqvLJX83P2h
 MfAA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXTbAOHjRHIRvweFeA4co="
X-RZG-CLASS-ID: mo00
Received: from droid.. by smtp.strato.de (RZmta 48.2.1 DYNA|AUTH)
 with ESMTPSA id Yce349yBVBufaQC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 31 Dec 2022 12:56:41 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: qcom: Fix building APQ8016 machine driver without
 SOUNDWIRE
Date: Sat, 31 Dec 2022 12:55:06 +0100
Message-Id: <20221231115506.82991-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Banajit Goswami <bgoswami@quicinc.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Older Qualcomm platforms like APQ8016 do not have hardware support for
SoundWire, so kernel configurations made specifically for those platforms
will usually not have CONFIG_SOUNDWIRE enabled.

Unfortunately commit 8d89cf6ff229 ("ASoC: qcom: cleanup and fix
dependency of QCOM_COMMON") breaks those kernel configurations, because
SOUNDWIRE is now a required dependency for SND_SOC_QCOM_COMMON (and in
turn also SND_SOC_APQ8016_SBC). Trying to migrate such a kernel config
silently disables SND_SOC_APQ8016_SBC and breaks audio functionality.

The soundwire helpers in common.c are only used by two of the Qualcomm
audio machine drivers, so building and requiring CONFIG_SOUNDWIRE for
all platforms is unnecessary.

There is no need to stuff all common code into a single module. Fix the
issue by moving the soundwire helpers to a separate SND_SOC_QCOM_SDW
module/option that is selected only by the machine drivers that make
use of them. This also allows reverting the imply/depends changes from
the previous fix because both SM8250 and SC8280XP already depend on
SOUNDWIRE, so the soundwire helpers will be only built if SOUNDWIRE
is really enabled.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Fixes: 8d89cf6ff229 ("ASoC: qcom: cleanup and fix dependency of QCOM_COMMON")
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 sound/soc/qcom/Kconfig    |  21 ++++---
 sound/soc/qcom/Makefile   |   2 +
 sound/soc/qcom/common.c   | 114 -----------------------------------
 sound/soc/qcom/common.h   |  10 ----
 sound/soc/qcom/sc8280xp.c |   1 +
 sound/soc/qcom/sdw.c      | 123 ++++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/sdw.h      |  18 ++++++
 sound/soc/qcom/sm8250.c   |   1 +
 8 files changed, 157 insertions(+), 133 deletions(-)
 create mode 100644 sound/soc/qcom/sdw.c
 create mode 100644 sound/soc/qcom/sdw.h

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 96a6d4731e6f..e7b00d1d9e99 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -2,7 +2,6 @@
 menuconfig SND_SOC_QCOM
 	tristate "ASoC support for QCOM platforms"
 	depends on ARCH_QCOM || COMPILE_TEST
-	imply SND_SOC_QCOM_COMMON
 	help
 	  Say Y or M if you want to add support to use audio devices
 	  in Qualcomm Technologies SOC-based platforms.
@@ -60,14 +59,16 @@ config SND_SOC_STORM
 config SND_SOC_APQ8016_SBC
 	tristate "SoC Audio support for APQ8016 SBC platforms"
 	select SND_SOC_LPASS_APQ8016
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
 	help
 	  Support for Qualcomm Technologies LPASS audio block in
 	  APQ8016 SOC-based systems.
 	  Say Y if you want to use audio devices on MI2S.
 
 config SND_SOC_QCOM_COMMON
-	depends on SOUNDWIRE
+	tristate
+
+config SND_SOC_QCOM_SDW
 	tristate
 
 config SND_SOC_QDSP6_COMMON
@@ -144,7 +145,7 @@ config SND_SOC_MSM8996
 	depends on QCOM_APR
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
 	help
 	  Support for Qualcomm Technologies LPASS audio block in
 	  APQ8096 SoC-based systems.
@@ -155,7 +156,7 @@ config SND_SOC_SDM845
 	depends on QCOM_APR && I2C && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
 	select SND_SOC_MAX98927
 	imply SND_SOC_CROS_EC_CODEC
@@ -169,7 +170,8 @@ config SND_SOC_SM8250
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SM8250 SoC-based systems.
@@ -180,7 +182,8 @@ config SND_SOC_SC8280XP
 	depends on QCOM_APR && SOUNDWIRE
 	depends on COMMON_CLK
 	select SND_SOC_QDSP6
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_SDW
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SC8280XP SoC-based systems.
@@ -190,7 +193,7 @@ config SND_SOC_SC7180
 	tristate "SoC Machine driver for SC7180 boards"
 	depends on I2C && GPIOLIB
 	depends on SOUNDWIRE || SOUNDWIRE=n
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682_I2C
@@ -204,7 +207,7 @@ config SND_SOC_SC7180
 config SND_SOC_SC7280
 	tristate "SoC Machine driver for SC7280 boards"
 	depends on I2C && SOUNDWIRE
-	depends on SND_SOC_QCOM_COMMON
+	select SND_SOC_QCOM_COMMON
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X_SDW
diff --git a/sound/soc/qcom/Makefile b/sound/soc/qcom/Makefile
index 8b97172cf990..254350d9dc06 100644
--- a/sound/soc/qcom/Makefile
+++ b/sound/soc/qcom/Makefile
@@ -28,6 +28,7 @@ snd-soc-sdm845-objs := sdm845.o
 snd-soc-sm8250-objs := sm8250.o
 snd-soc-sc8280xp-objs := sc8280xp.o
 snd-soc-qcom-common-objs := common.o
+snd-soc-qcom-sdw-objs := sdw.o
 
 obj-$(CONFIG_SND_SOC_STORM) += snd-soc-storm.o
 obj-$(CONFIG_SND_SOC_APQ8016_SBC) += snd-soc-apq8016-sbc.o
@@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_SC8280XP) += snd-soc-sc8280xp.o
 obj-$(CONFIG_SND_SOC_SDM845) += snd-soc-sdm845.o
 obj-$(CONFIG_SND_SOC_SM8250) += snd-soc-sm8250.o
 obj-$(CONFIG_SND_SOC_QCOM_COMMON) += snd-soc-qcom-common.o
+obj-$(CONFIG_SND_SOC_QCOM_SDW) += snd-soc-qcom-sdw.o
 
 #DSP lib
 obj-$(CONFIG_SND_SOC_QDSP6) += qdsp6/
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 49c74c1662a3..96fe80241fb4 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -180,120 +180,6 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_parse_of);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime,
-			 bool *stream_prepared)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
-	int ret;
-
-	if (!sruntime)
-		return 0;
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
-		break;
-	default:
-		return 0;
-	}
-
-	if (*stream_prepared) {
-		sdw_disable_stream(sruntime);
-		sdw_deprepare_stream(sruntime);
-		*stream_prepared = false;
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
-	*stream_prepared  = true;
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_prepare);
-
-int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-			   struct snd_pcm_hw_params *params,
-			   struct sdw_stream_runtime **psruntime)
-{
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
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
-			sruntime = snd_soc_dai_get_stream(codec_dai, substream->stream);
-			if (sruntime != ERR_PTR(-ENOTSUPP))
-				*psruntime = sruntime;
-		}
-		break;
-	}
-
-	return 0;
-
-}
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_params);
-
-int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime, bool *stream_prepared)
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
-		if (sruntime && *stream_prepared) {
-			sdw_disable_stream(sruntime);
-			sdw_deprepare_stream(sruntime);
-			*stream_prepared = false;
-		}
-		break;
-	default:
-		break;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(qcom_snd_sdw_hw_free);
-
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup)
 {
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 3ef5bb6d12df..d7f80ee5ae26 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -5,19 +5,9 @@
 #define __QCOM_SND_COMMON_H__
 
 #include <sound/soc.h>
-#include <linux/soundwire/sdw.h>
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
 
-int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *runtime,
-			 bool *stream_prepared);
-int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
-			   struct snd_pcm_hw_params *params,
-			   struct sdw_stream_runtime **psruntime);
-int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
-			 struct sdw_stream_runtime *sruntime,
-			 bool *stream_prepared);
 #endif
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ade44ad7c585..14d9fea33d16 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "sdw.h"
 
 #define DRIVER_NAME		"sc8280xp"
 
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
new file mode 100644
index 000000000000..10249519a39e
--- /dev/null
+++ b/sound/soc/qcom/sdw.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2018, Linaro Limited.
+// Copyright (c) 2018, The Linux Foundation. All rights reserved.
+
+#include <linux/module.h>
+#include <sound/soc.h>
+#include "qdsp6/q6afe.h"
+#include "sdw.h"
+
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
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/qcom/sdw.h b/sound/soc/qcom/sdw.h
new file mode 100644
index 000000000000..d74cbb84da13
--- /dev/null
+++ b/sound/soc/qcom/sdw.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+// Copyright (c) 2018, The Linux Foundation. All rights reserved.
+
+#ifndef __QCOM_SND_SDW_H__
+#define __QCOM_SND_SDW_H__
+
+#include <linux/soundwire/sdw.h>
+
+int qcom_snd_sdw_prepare(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *runtime,
+			 bool *stream_prepared);
+int qcom_snd_sdw_hw_params(struct snd_pcm_substream *substream,
+			   struct snd_pcm_hw_params *params,
+			   struct sdw_stream_runtime **psruntime);
+int qcom_snd_sdw_hw_free(struct snd_pcm_substream *substream,
+			 struct sdw_stream_runtime *sruntime,
+			 bool *stream_prepared);
+#endif
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 8dbe9ef41b1c..9626a9ef78c2 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -12,6 +12,7 @@
 #include <linux/input-event-codes.h>
 #include "qdsp6/q6afe.h"
 #include "common.h"
+#include "sdw.h"
 
 #define DRIVER_NAME		"sm8250"
 #define MI2S_BCLK_RATE		1536000
-- 
2.39.0

