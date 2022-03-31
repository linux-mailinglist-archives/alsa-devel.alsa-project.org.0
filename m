Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DA34ED607
	for <lists+alsa-devel@lfdr.de>; Thu, 31 Mar 2022 10:43:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9918A18D8;
	Thu, 31 Mar 2022 10:42:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9918A18D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648716219;
	bh=TD65lI/hw8bqD/MBsnDDUjkYgycrdWiVBpxp37XdGFk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pBKPjcSJib5t8TeyilA+C7Z9aG/th9r2T8KcnnvMmCnvL5p4M0KhElVI2qpttcxzQ
	 OwsVF2naszMFDzsxLjZKM0MEvyiIJbRfLsElfv+4sGpVn6EdrRvuy6S+QQYi3mydWE
	 GfYN7uZUAEy8lXVc80PRueQmFP0AsbVr/14ubQsk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3505F80238;
	Thu, 31 Mar 2022 10:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52EB2F80227; Thu, 31 Mar 2022 10:42:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 379BDF80100
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 10:42:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 379BDF80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="HMufMd7W"
Received: by mail-pf1-x433.google.com with SMTP id f3so20087305pfe.2
 for <alsa-devel@alsa-project.org>; Thu, 31 Mar 2022 01:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+aE0R/lXzUk7zJvgpIyzEUdhyujK4IRdtbXraXjKl9I=;
 b=HMufMd7WglXhhQDkzZqZSsbrM8TtvGCB12JFrqP5twSXwGUkhtIKf+k/aYbDOeaMFV
 QHIbapPo4NUF4FinUA9ZT6Zy3zgwPG8lfhpnUXAbYTrgbfcRbwhn6xICSqawV5AoRsni
 onul6KFeELklCIfTk1Csw/424VV80AoozQ++0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+aE0R/lXzUk7zJvgpIyzEUdhyujK4IRdtbXraXjKl9I=;
 b=LFThc4UMPbJ296lQHWyVuv1tUWAc+ApcUVWf18s9QgGOIbKHBtDblsWsXHz6hyYRFP
 jU2aAxQ1qBSAoqZw+s6UadLeSNfROg0dyxiMSl1mS2Cv3QM/rmdNy8FFMTSe6+ER9mvZ
 xa2S6n7nDKe/c0amJwXrhvondxbIspfoLLWh8UniW87xQp+Vv3uIL3sUVgcOkkXmWUsz
 W6Lw83Gbfs/aU9a1E/xGs39/nx83A88B6olLQNJiTFQ8UfT7cY/+d94UyzqfWn7b7vA5
 ZhEwlFrXG6q9Hoh/suXenUbBuICKUGqxgPock0B+NWbvcowwoNFa6ONTfoHQJq4gq/Ml
 iCfg==
X-Gm-Message-State: AOAM533m37L1THmjC1rhT5CAchpN+B5kqGKVXVKvsR58AVar0Uzdxq9J
 TtmuZBDoyzcm3Wav+2vwdZGn6g==
X-Google-Smtp-Source: ABdhPJx6Za03E8aFKWtkYONZbUyj98eqWhvJ/dpPQnts7b30RCF+bR9M/JuZBv+LK0MkVotICxRyOA==
X-Received: by 2002:a65:6202:0:b0:382:1fbd:5bb3 with SMTP id
 d2-20020a656202000000b003821fbd5bb3mr10098402pgv.194.1648716140367; 
 Thu, 31 Mar 2022 01:42:20 -0700 (PDT)
Received: from judyhsiao-p920.tpe.corp.google.com
 ([2401:fa00:1:17:88f1:170c:cc:666f])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a656a9c000000b00372f7ecfcecsm4783036pgu.37.2022.03.31.01.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 01:42:19 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: broonie@kernel.org
Subject: [v2] ASoC: qcom: Add driver support for ALC5682I-VS
Date: Thu, 31 Mar 2022 16:42:01 +0800
Message-Id: <20220331084201.62815-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.35.1.1021.g381101b075-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: judyhsiao@google.com, cychiang@google.com, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 swboyd@chromium.org, dianders@chromium.org, Takashi Iwai <tiwai@suse.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Judy Hsiao <judyhsiao@chromium.org>, yuhsuan@chromium.org
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

Add Machine driver support for ALC5682I-VS codec.

Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---

Changes from v1[1]:
 - Fix nits and use SND_SOC_DAIFMT_CBC_CFS.
 - Fix return value when snd_soc_dai_set_sysclk failed.

[1]: https://patchwork.kernel.org/project/alsa-devel/patch/20220330084519.3863856-1-judyhsiao@chromium.org/

 sound/soc/qcom/Kconfig  |   2 +
 sound/soc/qcom/sc7280.c | 107 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 28d0dfb4033c..750653404ba3 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -197,6 +197,8 @@ config SND_SOC_SC7280
 	select SND_SOC_LPASS_MACRO_COMMON
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
+	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
 	help
 	  Add support for audio on Qualcomm Technologies Inc.
 	  SC7280 SoC-based systems.
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index bd0bf9c8cb28..8c0bbae490dd 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -12,14 +12,21 @@
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
+#include <sound/rt5682s.h>
 #include <linux/soundwire/sdw.h>
 
+#include "../codecs/rt5682.h"
+#include "../codecs/rt5682s.h"
 #include "common.h"
 #include "lpass.h"
 
+#define DEFAULT_MCLK_RATE              19200000
+#define RT5682_PLL1_FREQ (48000 * 512)
+
 struct sc7280_snd_data {
 	struct snd_soc_card card;
 	struct sdw_stream_runtime *sruntime[LPASS_MAX_PORTS];
+	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
 	bool jack_setup;
@@ -69,6 +76,7 @@ static int sc7280_headset_init(struct snd_soc_pcm_runtime *rtd)
 		pdata->jack_setup = true;
 	}
 	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_RX0:
 	case LPASS_CDC_DMA_TX3:
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
@@ -110,11 +118,51 @@ static int sc7280_hdmi_init(struct snd_soc_pcm_runtime *rtd)
 	return snd_soc_component_set_jack(component, &pdata->hdmi_jack, NULL);
 }
 
+static int sc7280_rt5682_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	if (++data->pri_mi2s_clk_count == 1) {
+		snd_soc_dai_set_sysclk(cpu_dai,
+			LPASS_MCLK0,
+			DEFAULT_MCLK_RATE,
+			SNDRV_PCM_STREAM_PLAYBACK);
+	}
+	snd_soc_dai_set_fmt(codec_dai,
+				SND_SOC_DAIFMT_CBC_CFC |
+				SND_SOC_DAIFMT_NB_NF |
+				SND_SOC_DAIFMT_I2S);
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
+					1536000, RT5682_PLL1_FREQ);
+	if (ret) {
+		dev_err(rtd->dev, "can't set codec pll: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_PLL1,
+					RT5682_PLL1_FREQ,
+					SND_SOC_CLOCK_IN);
+
+	if (ret) {
+		dev_err(rtd->dev, "snd_soc_dai_set_sysclk err = %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int sc7280_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
 
 	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
 	case LPASS_CDC_DMA_TX3:
 		return sc7280_headset_init(rtd);
 	case LPASS_CDC_DMA_RX0:
@@ -227,10 +275,66 @@ static int sc7280_snd_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static void sc7280_snd_shutdown(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct sc7280_snd_data *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		if (--data->pri_mi2s_clk_count == 0) {
+			snd_soc_dai_set_sysclk(cpu_dai,
+					       LPASS_MCLK0,
+					       0,
+					       SNDRV_PCM_STREAM_PLAYBACK);
+		}
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		break;
+	}
+}
+
+static int sc7280_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	int ret = 0;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		ret = sc7280_rt5682_init(rtd);
+		break;
+	case MI2S_SECONDARY:
+		break;
+	case LPASS_DP_RX:
+		break;
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return ret;
+}
+
 static const struct snd_soc_ops sc7280_ops = {
+	.startup = sc7280_snd_startup,
 	.hw_params = sc7280_snd_hw_params,
 	.hw_free = sc7280_snd_hw_free,
 	.prepare = sc7280_snd_prepare,
+	.shutdown = sc7280_snd_shutdown,
+};
+
+static const struct snd_soc_dapm_widget sc7280_snd_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
 static int sc7280_snd_platform_probe(struct platform_device *pdev)
@@ -252,6 +356,9 @@ static int sc7280_snd_platform_probe(struct platform_device *pdev)
 	card->driver_name = "SC7280";
 	card->dev = dev;
 
+	card->dapm_widgets = sc7280_snd_widgets;
+	card->num_dapm_widgets = ARRAY_SIZE(sc7280_snd_widgets);
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.35.1.1021.g381101b075-goog

