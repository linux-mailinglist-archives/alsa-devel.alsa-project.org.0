Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD7F0B99
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Nov 2019 02:21:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE9C116D9;
	Wed,  6 Nov 2019 02:21:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE9C116D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573003313;
	bh=BqcQ9xK6fQnlgJY8c69nsHcXlIoEz1cF21wGrmbv3gM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nCL9TLCw1BduVbD8LUlQEDCTDW4YnAZYTUJ1nsfMEOK6EsJo459FAzBZrZMlOnpN9
	 aoL/50gCpmizn/ClN9grmtxSplzQJjT6P4vSSMRRlVgdHsebUO4JTt+2l6OTu1Ssv/
	 aF8fDW/G2hPBnHfTshLGCacoqktkAcmlOSwnE9jY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DC3F80715;
	Wed,  6 Nov 2019 02:14:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B126F80717; Wed,  6 Nov 2019 02:14:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2B0DF806FA
 for <alsa-devel@alsa-project.org>; Wed,  6 Nov 2019 02:14:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2B0DF806FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="eU6SawPj"
Received: by mail-pg1-x541.google.com with SMTP id q22so8321173pgk.2
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 17:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1tX+br/vaL/adbLwSB4vQYB6oSwyib+JV6iUca0b0pU=;
 b=eU6SawPj99O2XaIWFoxLrqABuUyjPQocYzY3SfBjyeCrd/xBpga5RiwcXhnHaA4Iq1
 KBwaJ6qXsSFOej/fFG4VPFTbFRGh2223ha29fYMT+WxmVON3uvEN/8nhL/PTTZ1D4dKE
 04M53BkQA0ZFyj6VBcAx0m6TxVZ77Kbn0RY8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1tX+br/vaL/adbLwSB4vQYB6oSwyib+JV6iUca0b0pU=;
 b=lomadhHudRxElF4oz5tFl7PzJERb+MpqBOmHNkRv59ZWsas/UxN9pyyQEpZWDL535i
 zAspga7AtsuXZv1e19nc036IEOzf6Sqi1S2uQlBBsmYU4Xj4MWHLq0lDNDnzZkmJGxjC
 HKM0pBNm5p/4LqNabNg3n0g2/ibtCN3tXu2wCKazVHSH6XqqZRSaP92t9Jx0HqJwEiZr
 JG3234bsS54qitRmGX5LBoeXju6l5OUPdd2rQqX4/JwFlpycKDq8EN0nRTly2tJKmvOX
 7anokEO6ZqkkB4VCAWA3D9x4HXw7rRQ+OjhVchuKEmfaX/4cfQUk9Z8p/sc/DQNypMDT
 HC7g==
X-Gm-Message-State: APjAAAVko69lNLGkikfsXbC9gA3MoqecUaIBOKBOUKg85aEnIX7dXVvN
 xnHM8wnApAdn6eHe+9Aa3mKAA9/TLOjx
X-Google-Smtp-Source: APXvYqzzmDH61u9K/aNUfNSZvbu43rrt57zmsEpG5qcofxNi9MNOcjzgw3vVWg9AXpozmX+7CLeP0w==
X-Received: by 2002:a17:90a:bd10:: with SMTP id y16mr5381pjr.111.1573002853123; 
 Tue, 05 Nov 2019 17:14:13 -0800 (PST)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id 74sm21683968pgb.62.2019.11.05.17.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2019 17:14:12 -0800 (PST)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 17:13:35 -0800
Message-Id: <20191106011335.223061-11-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106011335.223061-1-cujomalainey@chromium.org>
References: <20191106011335.223061-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Alexios Zavras <alexios.zavras@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v3 10/11] ASoC: rt5677: Set ADC clock to use
	PLL and enable ASRC
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Use the PLL to kept the correct 24M clock rate so frequency shift does
not occur when using the DSP VAD.

Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
---
 sound/soc/codecs/rt5677.c           |  6 ++++++
 sound/soc/codecs/rt5677.h           |  2 ++
 sound/soc/intel/boards/bdw-rt5677.c | 33 +++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index a65d1554366d..0e7773584145 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5046,6 +5046,11 @@ static const struct snd_soc_dai_ops rt5677_aif_dai_ops = {
 	.set_tdm_slot = rt5677_set_tdm_slot,
 };
 
+static const struct snd_soc_dai_ops rt5677_dsp_dai_ops = {
+	.set_sysclk = rt5677_set_dai_sysclk,
+	.set_pll = rt5677_set_dai_pll,
+};
+
 static struct snd_soc_dai_driver rt5677_dai[] = {
 	{
 		.name = "rt5677-aif1",
@@ -5152,6 +5157,7 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
 			.rates = SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 		},
+		.ops = &rt5677_dsp_dai_ops,
 	},
 };
 
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index f8ada967fdbc..944ae02aafc2 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1336,6 +1336,8 @@
 #define RT5677_PLL_M_SFT			12
 #define RT5677_PLL_M_BP				(0x1 << 11)
 #define RT5677_PLL_M_BP_SFT			11
+#define RT5677_PLL_UPDATE_PLL1			(0x1 << 1)
+#define RT5677_PLL_UPDATE_PLL1_SFT		1
 
 /* Global Clock Control 1 (0x80) */
 #define RT5677_SCLK_SRC_MASK			(0x3 << 14)
diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
index b2475e3eff7b..2af8e5a62da8 100644
--- a/sound/soc/intel/boards/bdw-rt5677.c
+++ b/sound/soc/intel/boards/bdw-rt5677.c
@@ -170,10 +170,37 @@ static int bdw_rt5677_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
+static int bdw_rt5677_dsp_hw_params(struct snd_pcm_substream *substream,
+	struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai = rtd->codec_dai;
+	int ret;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5677_SCLK_S_PLL1, 24576000,
+		SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec sysclk configuration\n");
+		return ret;
+	}
+	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5677_PLL1_S_MCLK,
+		24000000, 24576000);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec pll configuration\n");
+		return ret;
+	}
+
+	return 0;
+}
+
 static const struct snd_soc_ops bdw_rt5677_ops = {
 	.hw_params = bdw_rt5677_hw_params,
 };
 
+static const struct snd_soc_ops bdw_rt5677_dsp_ops = {
+	.hw_params = bdw_rt5677_dsp_hw_params,
+};
+
 #if !IS_ENABLED(CONFIG_SND_SOC_SOF_BROADWELL)
 static int bdw_rt5677_rtd_init(struct snd_soc_pcm_runtime *rtd)
 {
@@ -213,6 +240,11 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
 	rt5677_sel_asrc_clk_src(component, RT5677_DA_STEREO_FILTER |
 			RT5677_AD_STEREO1_FILTER | RT5677_I2S1_SOURCE,
 			RT5677_CLK_SEL_I2S1_ASRC);
+	/* Enable codec ASRC function for Mono ADC L.
+	 * The ASRC clock source is clk_sys2_asrc.
+	 */
+	rt5677_sel_asrc_clk_src(component, RT5677_AD_MONO_L_FILTER,
+			RT5677_CLK_SEL_SYS2);
 
 	/* Request rt5677 GPIO for headphone amp control */
 	bdw_rt5677->gpio_hp_en = devm_gpiod_get(component->dev, "headphone-enable",
@@ -291,6 +323,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
 	{
 		.name = "Codec DSP",
 		.stream_name = "Wake on Voice",
+		.ops = &bdw_rt5677_dsp_ops,
 		SND_SOC_DAILINK_REG(dsp),
 	},
 
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
