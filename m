Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E8294DCFD3
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 22:14:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8261E1692;
	Fri, 18 Oct 2019 22:13:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8261E1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571429658;
	bh=HfSxkt3gLYTfiX+tr9p2cnm8P7w+3imiHma6HpNXJ+U=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2xLU7YMN/ySYrVuUcRgmqi54lDYy54zd1u1NLU4DsNE5VSYbRA0RgW9wYxlGfMLO
	 DcREP4od62WzIuT2qmbZZzmFLiy9SleDpknSMJ7Mqt3uqAQ0OSIcg8sKBhxtbyqCKk
	 XCfsZaHUcBobXXIekQrrm6hzGnwijEyKzGzNq5Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B6E0F8071C;
	Fri, 18 Oct 2019 22:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E831CF8065E; Fri, 18 Oct 2019 22:05:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC38F80642
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 22:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC38F80642
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="S39KbJIP"
Received: by mail-pg1-x541.google.com with SMTP id r1so3917482pgj.12
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 13:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7eJPId3wfJpnS2z5yIggQTzVsYAHOCTyJM6m5E7Bb0Y=;
 b=S39KbJIPkS995U7RfmdeWgSI9EnSU0vmJZZcoy8ZAzFCmwtDAJN97ShyUVSYy1937i
 fq2KhBZARdKMp6noss5S0QwzjjPJpjWZpQ2lQjTScbfLf5iMsOJTUVnkAVOdO6nFRpgR
 O+/nhZCfr4y9j49Sa4M4SmIquvi4EfEiIw11Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7eJPId3wfJpnS2z5yIggQTzVsYAHOCTyJM6m5E7Bb0Y=;
 b=FHDngHWfD4/WOQe+MM1iBnO6wZdOE6uNJisWB3aq7LIVOVIRRqVouWzLKPNtBz9xTR
 GD6giw2E8tiYDkoYpBJeMHakJGJbS3iaDeQMyjjeDHt8QP7qOCZ8n09V8+kpPbCLlEpS
 pMacbhwaNY9DGYAw8MBiyVEx/5rlJF9KFUBUXAJUQGebNTlVAwbFLsWz9t57FZs/ykGW
 uAAWHhk2i7sO00XvcXz1qxPtbuZ7lLcFaEuFEveIxPG2yptgcJuL8/Z4X/zd0lOUi2yv
 JVG1cnU99UNbqbptQen9LMfMxS90wZ9c5fYqPjIe/OWxFCt/JsaITP1KcIcphiZvmvp2
 clew==
X-Gm-Message-State: APjAAAUByDAkTFgjmOEipYhonfr1+JUxGYxv8at/+5PSLLdQv22uWX/Z
 TyI6vtvMTzTd0qhUcFYmXNX+uVJRmrwd
X-Google-Smtp-Source: APXvYqwttUz/KEU9BswzeGS7ChKaLxX+26DGJAGwK+8B5cGbPKeIKnd1KXMGCWtPT1GCdWCe4LssHg==
X-Received: by 2002:a62:3082:: with SMTP id w124mr8440193pfw.191.1571429121012; 
 Fri, 18 Oct 2019 13:05:21 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c87a:31ae:9107:f63d])
 by smtp.gmail.com with ESMTPSA id c62sm7830596pfa.92.2019.10.18.13.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Oct 2019 13:05:20 -0700 (PDT)
From: Curtis Malainey <cujomalainey@chromium.org>
To: alsa-devel@alsa-project.org
Date: Fri, 18 Oct 2019 13:04:48 -0700
Message-Id: <20191018200449.141123-12-cujomalainey@chromium.org>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
In-Reply-To: <20191018200449.141123-1-cujomalainey@chromium.org>
References: <20191018200449.141123-1-cujomalainey@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Ben Zhang <benzh@chromium.org>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>,
 Bard Liao <bardliao@realtek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [alsa-devel] [PATCH v2 11/12] ASoC: rt5677: Set ADC clock to use
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
index 6e8d11060bbab..fdc3e5d6f9430 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -5048,6 +5048,11 @@ static const struct snd_soc_dai_ops rt5677_aif_dai_ops = {
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
@@ -5154,6 +5159,7 @@ static struct snd_soc_dai_driver rt5677_dai[] = {
 			.rates = SNDRV_PCM_RATE_16000,
 			.formats = SNDRV_PCM_FMTBIT_S16_LE,
 		},
+		.ops = &rt5677_dsp_dai_ops,
 	},
 };
 
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index f8ada967fdbc9..944ae02aafc2f 100644
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
index b2475e3eff7b4..98a4e3cd819f7 100644
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
+	return ret;
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
2.23.0.866.gb869b98d4c-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
