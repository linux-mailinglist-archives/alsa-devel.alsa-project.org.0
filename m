Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D9C1888D0
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:14:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 522701773;
	Tue, 17 Mar 2020 16:13:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 522701773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584458082;
	bh=7MCy94sKpcFWzPADy3V0bLu0OFIsu5SWY3WTG54X1uQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GqJRh3qOBtMPB5CVizHQTvoL1m85lYBjat6McKqlBgLw03NTJhn687RX+3xX4OA51
	 oG0rkwfN4emlmPKgtRnxfqo5OVKhTvJApG7hZUV1mcCWpSqS/f6cj10ef+FW1veTTi
	 u7+KHppsUqR01o3wTxlKRK5JYK8RKREcFcQ8CR00=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 36E9BF80232;
	Tue, 17 Mar 2020 16:13:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9AEECF8023E; Tue, 17 Mar 2020 16:12:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4CC9F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:12:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CC9F80058
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="PO+VRhl6"
Received: by mail-wm1-x343.google.com with SMTP id 6so21867967wmi.5
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 08:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6OE0T7bJ5s9V3BgaE2gwgmd/QajU+WNA9/hfTCyPYzk=;
 b=PO+VRhl67KGSI9TyhWJJEGt+Sbh60tA8UgoP8OHHgVk1R9v7wHC0xgEPfZeL/4OP6o
 JS6e0B8qh2Ns0kzTvkTDI0z9u9QQInO6iFmUaM7zVbfSXK/fSot+JoztyawqqoWJ35za
 1kv/DGXYgfgNXcdPxrwug2optXmtJGdUZDGYM9sZLJ8TdHEn97xjKOdEG5JwDAadt7BR
 hwniIQ0Ni+ZVrgE1Vc7haTopp6kADOrcACTiICoL9vK9ZBRhX18OcyeEbugpz5Gu1iVh
 MAaLnqTfKzv+j7XENFyi5BSDNKdw1mYZAZ/uZ28ETuz9sKjlOF9qfRPXoKZOhBxtE4be
 Bd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6OE0T7bJ5s9V3BgaE2gwgmd/QajU+WNA9/hfTCyPYzk=;
 b=Un70h6unfmQvTCIuOmDeXYMch5Ft0w12vjN/8O6RBYj/xfKLOBKr/nm6uzFxY3yBDL
 2XzDhYG9Cp71E24Gj06WAMFy0Ko/75XkFlS6Ejzh7nU9rRFRXoLVCRU/1Kuy4zPpkamn
 ljKUCJLUXh7EkByJMfINmIv0LpyJUsOA8T13raeLgPXGBjnvC4TORTYR6hZoGfFgxqzm
 dLdYauzl2Bqa9C6zIXoOodrT6I0SvQJ2Vgc54U8ePCGUZOHOqMZW5nktMsgFC5xVaikN
 BE/Q4v85B9b1dfe8GHR6G3GM2tDtYQr7VPuBPFsdX7teIIpYc8dYd4Zo5ckl2XmA/iv6
 N+aQ==
X-Gm-Message-State: ANhLgQ0t/eGsI9c61kFGiEqIiUNZhgTw4P9tVkLMiCUXnaC/9wnrdfiu
 5mUmEsecwfc3YCB+uXHMkGGPAg==
X-Google-Smtp-Source: ADFU+vv+LodaySxOuG1XJtZX2h5nc4wtyXmEf/5onTSVqD960Mah8WApo/k4gaup/Hh2qM42ePe3tQ==
X-Received: by 2002:a05:600c:2c09:: with SMTP id
 q9mr5534902wmg.167.1584457972302; 
 Tue, 17 Mar 2020 08:12:52 -0700 (PDT)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id u8sm4711089wrn.69.2020.03.17.08.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 08:12:51 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH v2 1/2] ASoC: qcom: sdm845: handle soundwire stream
Date: Tue, 17 Mar 2020 15:12:32 +0000
Message-Id: <20200317151233.8763-2-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200317151233.8763-1-srinivas.kandagatla@linaro.org>
References: <20200317151233.8763-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 vkoul@kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

In existing setup WSA881x codec handles soundwire stream,
however DB845c and other machines based on SDM845c have 2
instances for WSA881x codec. This will force soundwire stream
to be prepared/enabled twice or multiple times.
Handling SoundWire Stream in machine driver would fix this issue.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/qcom/Kconfig  |  2 +-
 sound/soc/qcom/sdm845.c | 67 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 6530d2462a9e..f51b28d1b94d 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -99,7 +99,7 @@ config SND_SOC_MSM8996
 
 config SND_SOC_SDM845
 	tristate "SoC Machine driver for SDM845 boards"
-	depends on QCOM_APR && CROS_EC && I2C
+	depends on QCOM_APR && CROS_EC && I2C && SOUNDWIRE
 	select SND_SOC_QDSP6
 	select SND_SOC_QCOM_COMMON
 	select SND_SOC_RT5663
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 3ac02204a706..67a55edf755f 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -11,6 +11,7 @@
 #include <sound/pcm_params.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
+#include <linux/soundwire/sdw.h>
 #include <uapi/linux/input-event-codes.h>
 #include "common.h"
 #include "qdsp6/q6afe.h"
@@ -31,10 +32,12 @@
 struct sdm845_snd_data {
 	struct snd_soc_jack jack;
 	bool jack_setup;
+	bool stream_prepared[SLIM_MAX_RX_PORTS];
 	struct snd_soc_card *card;
 	uint32_t pri_mi2s_clk_count;
 	uint32_t sec_mi2s_clk_count;
 	uint32_t quat_tdm_clk_count;
+	struct sdw_stream_runtime *sruntime[SLIM_MAX_RX_PORTS];
 };
 
 static unsigned int tdm_slot_offset[8] = {0, 4, 8, 12, 16, 20, 24, 28};
@@ -45,11 +48,18 @@ static int sdm845_slim_snd_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
 	struct snd_soc_dai *codec_dai;
+	struct sdm845_snd_data *pdata = snd_soc_card_get_drvdata(rtd->card);
 	u32 rx_ch[SLIM_MAX_RX_PORTS], tx_ch[SLIM_MAX_TX_PORTS];
+	struct sdw_stream_runtime *sruntime;
 	u32 rx_ch_cnt = 0, tx_ch_cnt = 0;
 	int ret = 0, i;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		sruntime = snd_soc_dai_get_sdw_stream(codec_dai,
+						      substream->stream);
+		if (sruntime != ERR_PTR(-ENOTSUPP))
+			pdata->sruntime[cpu_dai->id] = sruntime;
+
 		ret = snd_soc_dai_get_channel_map(codec_dai,
 				&tx_ch_cnt, tx_ch, &rx_ch_cnt, rx_ch);
 
@@ -425,8 +435,65 @@ static void  sdm845_snd_shutdown(struct snd_pcm_substream *substream)
 	}
 }
 
+static int sdm845_snd_prepare(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+	int ret;
+
+	if (!sruntime)
+		return 0;
+
+	if (data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
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
+	data->stream_prepared[cpu_dai->id] = true;
+
+	return ret;
+}
+
+static int sdm845_snd_hw_free(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct sdm845_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = rtd->cpu_dai;
+	struct sdw_stream_runtime *sruntime = data->sruntime[cpu_dai->id];
+
+	if (sruntime && data->stream_prepared[cpu_dai->id]) {
+		sdw_disable_stream(sruntime);
+		sdw_deprepare_stream(sruntime);
+		data->stream_prepared[cpu_dai->id] = false;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_ops sdm845_be_ops = {
 	.hw_params = sdm845_snd_hw_params,
+	.hw_free = sdm845_snd_hw_free,
+	.prepare = sdm845_snd_prepare,
 	.startup = sdm845_snd_startup,
 	.shutdown = sdm845_snd_shutdown,
 };
-- 
2.21.0

