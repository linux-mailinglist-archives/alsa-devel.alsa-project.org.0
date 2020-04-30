Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8611BF2B2
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 10:26:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36FBF169D;
	Thu, 30 Apr 2020 10:25:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36FBF169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588235163;
	bh=b8ntDEEDKg0/rchaKVayUctEWczBysCFIXz+kuwo7/0=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O4hGEOFXK6iNm1vVJyQMF83xB4kPg1VftxmEttZe/82NNYOgGJu76O6AZXzxSHTB+
	 PtC/DZNuMVOITdNv5KcFnguKtKj0+/Ta8ceMcYHLCT+4MiF1Y+09xN22uQwTEmSViP
	 gkEOmHO057gRy1SzDagTtsSrr+9QZ5lz7B2Uyl7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8EA8F80266;
	Thu, 30 Apr 2020 10:22:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D8E2F80291; Thu, 30 Apr 2020 10:22:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74BA1F8028F
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 10:22:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74BA1F8028F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="iTeeh83c"
Received: by mail-qk1-x74a.google.com with SMTP id x5so5686716qkn.20
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 01:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cZF6Zh5TCKLM+tuvvR7Rv+aGHRb5P7H7sI7vNd4sUdI=;
 b=iTeeh83c+HGfhvMfYmSA2oPO6pA3+/jFgSgpuFP9+lByjgOOQZIROa0YSxhlK7WusB
 m/qXD9Z44gipdFvXffR4HHItnXYsKOoimNVu4dnXyY7Pepb04v6jOSVSz06KRwPCgugy
 8PqtexVRL+ZfQcvpl57i723c9TnQl3pRtCrhNKs925hwDJ0wPwdYT0t0e31blmzEgD3j
 LiMwKG3HCj9qTJitqNysRg41+af7hKsTcZGx6fJdjvZ4RcHHi6Mq19XGGokLwjf8XRlH
 /+GFL/Dmwt0eYBCpT8rRCkdLqJjRqiGJ9tT377jqpsMH7VDgGEznBvyNg3zNE7WV5zwa
 YTBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cZF6Zh5TCKLM+tuvvR7Rv+aGHRb5P7H7sI7vNd4sUdI=;
 b=OLN/IMvVjaXz5WNLz+Z6WrWNUxc5hb5v1AemlUuDuQbQVETBaMf0XzTrv+2ySHYIzd
 9uV8iDkmYqhS4lF9PY0Es6vUF58GUFZhBA3QZ+4lcVykgeLkVty7GM3gj2lyycZzi2/g
 eeI81QyziSGWtArUdBwIGo640f18R4XKZyspNSD2Z1dArX/klFeZEiqLRzEU6r3N/aGJ
 9Ht2AudL3dbC7KXLmHHdb5DBfNQwLV4/qjNKs1CUqe+la3dbAzrDqJVhpTbH8P89RnI7
 8QI4J7xcAVNTbl31rv/R4LK0q83MAHp7DZrMEx1H/F2R30tAZ/ZUy57PSf3qFbctnL82
 XDoA==
X-Gm-Message-State: AGi0PubDNg7J4rrsBB0QeKRRVj2JEWUAVXhnbX2P4Pbwwi8JDiE+aILS
 222zD3DuS0Y2XLvB6mFU2CBcBSrAjsz/
X-Google-Smtp-Source: APiQypKT08S1XqZLNauwyALmhIvKx0js6lsMcF/R/ZAhTTPTNGvrZVAe6i1Ejdqok7MhHLQsN70XWnpvNwpn
X-Received: by 2002:ad4:4105:: with SMTP id i5mr1805662qvp.205.1588234967260; 
 Thu, 30 Apr 2020 01:22:47 -0700 (PDT)
Date: Thu, 30 Apr 2020 16:22:27 +0800
In-Reply-To: <20200430082231.151127-1-tzungbi@google.com>
Message-Id: <20200430082231.151127-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200430082231.151127-1-tzungbi@google.com>
X-Mailer: git-send-email 2.26.2.303.gf8c07b1a785-goog
Subject: [PATCH 2/6] ASoC: rt5682: fix space issues
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: tzungbi@google.com, alsa-devel@alsa-project.org
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

Fixes blank lines and indent issues.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/codecs/rt5682.c | 152 ++++++++++++++++++--------------------
 1 file changed, 70 insertions(+), 82 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index e542aab46619..7a38028f5e10 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -806,6 +806,7 @@ static void rt5682_reset(struct rt5682_priv *rt5682)
 	if (!rt5682->is_sdw)
 		regmap_write(rt5682->regmap, RT5682_I2C_MODE, 1);
 }
+
 /**
  * rt5682_sel_asrc_clk_src - select ASRC clock source for a set of filters
  * @component: SoC audio component device.
@@ -823,7 +824,6 @@ static void rt5682_reset(struct rt5682_priv *rt5682)
 int rt5682_sel_asrc_clk_src(struct snd_soc_component *component,
 		unsigned int filter_mask, unsigned int clk_src)
 {
-
 	switch (clk_src) {
 	case RT5682_CLK_SEL_SYS:
 	case RT5682_CLK_SEL_I2S1_ASRC:
@@ -918,7 +918,6 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 	unsigned int val, count;
 
 	if (jack_insert) {
-
 		snd_soc_component_update_bits(component, RT5682_PWR_ANLG_1,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB,
 			RT5682_PWR_VREF2 | RT5682_PWR_MB);
@@ -952,7 +951,6 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 		default:
 			rt5682->jack_type = SND_JACK_HEADPHONE;
 		}
-
 	} else {
 		rt5682_enable_push_button_irq(component, false);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
@@ -979,7 +977,7 @@ static irqreturn_t rt5682_irq(int irq, void *data)
 	struct rt5682_priv *rt5682 = data;
 
 	mod_delayed_work(system_power_efficient_wq,
-			&rt5682->jack_detect_work, msecs_to_jiffies(250));
+		&rt5682->jack_detect_work, msecs_to_jiffies(250));
 
 	return IRQ_HANDLED;
 }
@@ -995,16 +993,16 @@ static void rt5682_jd_check_handler(struct work_struct *work)
 		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
 
 		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
-				SND_JACK_HEADSET |
-				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				SND_JACK_BTN_2 | SND_JACK_BTN_3);
+			SND_JACK_HEADSET |
+			SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+			SND_JACK_BTN_2 | SND_JACK_BTN_3);
 	} else {
 		schedule_delayed_work(&rt5682->jd_check_work, 500);
 	}
 }
 
 static int rt5682_set_jack_detect(struct snd_soc_component *component,
-	struct snd_soc_jack *hs_jack, void *data)
+		struct snd_soc_jack *hs_jack, void *data)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
@@ -1013,9 +1011,9 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	if (!rt5682->is_sdw) {
 		if (!hs_jack) {
 			regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
-					   RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
+				RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
 			regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-					   RT5682_POW_JDH | RT5682_POW_JDL, 0);
+				RT5682_POW_JDH | RT5682_POW_JDL, 0);
 			cancel_delayed_work_sync(&rt5682->jack_detect_work);
 			return 0;
 		}
@@ -1058,15 +1056,15 @@ static int rt5682_set_jack_detect(struct snd_soc_component *component,
 				0x7f7f, (rt5682->pdata.btndet_delay << 8 |
 				rt5682->pdata.btndet_delay));
 			mod_delayed_work(system_power_efficient_wq,
-				   &rt5682->jack_detect_work,
-					msecs_to_jiffies(250));
+				&rt5682->jack_detect_work,
+				msecs_to_jiffies(250));
 			break;
 
 		case RT5682_JD_NULL:
 			regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
 				RT5682_JD1_EN_MASK, RT5682_JD1_DIS);
 			regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-					RT5682_POW_JDH | RT5682_POW_JDL, 0);
+				RT5682_POW_JDH | RT5682_POW_JDL, 0);
 			break;
 
 		default:
@@ -1148,9 +1146,9 @@ static void rt5682_jack_detect_handler(struct work_struct *work)
 	}
 
 	snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
-			SND_JACK_HEADSET |
-			    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			    SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		SND_JACK_HEADSET |
+		SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+		SND_JACK_BTN_2 | SND_JACK_BTN_3);
 
 	if (!rt5682->is_sdw) {
 		if (rt5682->jack_type & (SND_JACK_BTN_0 | SND_JACK_BTN_1 |
@@ -1184,15 +1182,13 @@ static const struct snd_kcontrol_new rt5682_snd_controls[] = {
 		3, 0, adc_bst_tlv),
 };
 
-
 static int rt5682_div_sel(struct rt5682_priv *rt5682,
-			  int target, const int div[], int size)
+		int target, const int div[], int size)
 {
 	int i;
 
 	if (rt5682->sysclk < target) {
-		pr_err("sysclk rate %d is too low\n",
-			rt5682->sysclk);
+		pr_err("sysclk rate %d is too low\n", rt5682->sysclk);
 		return 0;
 	}
 
@@ -1201,18 +1197,17 @@ static int rt5682_div_sel(struct rt5682_priv *rt5682,
 		if (target * div[i] == rt5682->sysclk)
 			return i;
 		if (target * div[i + 1] > rt5682->sysclk) {
-			dev_dbg(rt5682->component->dev, "can't find div for sysclk %d\n",
+			dev_dbg(rt5682->component->dev,
+				"can't find div for sysclk %d\n",
 				rt5682->sysclk);
 			return i;
 		}
 	}
 
 	if (target * div[i] < rt5682->sysclk)
-		pr_err("sysclk rate %d is too high\n",
-			rt5682->sysclk);
+		pr_err("sysclk rate %d is too high\n", rt5682->sysclk);
 
 	return size - 1;
-
 }
 
 /**
@@ -1226,7 +1221,7 @@ static int rt5682_div_sel(struct rt5682_priv *rt5682,
  * It is better for clock to approximate 3MHz.
  */
 static int set_dmic_clk(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1246,7 +1241,7 @@ static int set_dmic_clk(struct snd_soc_dapm_widget *w,
 }
 
 static int set_filter_clk(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1290,7 +1285,7 @@ static int set_filter_clk(struct snd_soc_dapm_widget *w,
 }
 
 static int is_sys_clk_from_pll1(struct snd_soc_dapm_widget *w,
-			 struct snd_soc_dapm_widget *sink)
+		struct snd_soc_dapm_widget *sink)
 {
 	unsigned int val;
 	struct snd_soc_component *component =
@@ -1305,7 +1300,7 @@ static int is_sys_clk_from_pll1(struct snd_soc_dapm_widget *w,
 }
 
 static int is_sys_clk_from_pll2(struct snd_soc_dapm_widget *w,
-			 struct snd_soc_dapm_widget *sink)
+		struct snd_soc_dapm_widget *sink)
 {
 	unsigned int val;
 	struct snd_soc_component *component =
@@ -1320,7 +1315,7 @@ static int is_sys_clk_from_pll2(struct snd_soc_dapm_widget *w,
 }
 
 static int is_using_asrc(struct snd_soc_dapm_widget *w,
-			 struct snd_soc_dapm_widget *sink)
+		struct snd_soc_dapm_widget *sink)
 {
 	unsigned int reg, shift, val;
 	struct snd_soc_component *component =
@@ -1347,7 +1342,6 @@ static int is_using_asrc(struct snd_soc_dapm_widget *w,
 	default:
 		return 0;
 	}
-
 }
 
 /* Digital Mixer */
@@ -1501,13 +1495,13 @@ static const struct snd_kcontrol_new rt5682_alg_dac_r1_mux =
 /* Out Switch */
 static const struct snd_kcontrol_new hpol_switch =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", RT5682_HP_CTRL_1,
-					RT5682_L_MUTE_SFT, 1, 1);
+		RT5682_L_MUTE_SFT, 1, 1);
 static const struct snd_kcontrol_new hpor_switch =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", RT5682_HP_CTRL_1,
-					RT5682_R_MUTE_SFT, 1, 1);
+		RT5682_R_MUTE_SFT, 1, 1);
 
 static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1538,11 +1532,10 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 	}
 
 	return 0;
-
 }
 
 static int set_dmic_power(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1566,7 +1559,7 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 }
 
 static int rt5682_set_verf(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
+		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
@@ -1743,23 +1736,23 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 
 	/* Digital Interface Select */
 	SND_SOC_DAPM_MUX("IF1 01 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_if1_01_adc_swap_mux),
+		&rt5682_if1_01_adc_swap_mux),
 	SND_SOC_DAPM_MUX("IF1 23 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_if1_23_adc_swap_mux),
+		&rt5682_if1_23_adc_swap_mux),
 	SND_SOC_DAPM_MUX("IF1 45 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_if1_45_adc_swap_mux),
+		&rt5682_if1_45_adc_swap_mux),
 	SND_SOC_DAPM_MUX("IF1 67 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_if1_67_adc_swap_mux),
+		&rt5682_if1_67_adc_swap_mux),
 	SND_SOC_DAPM_MUX("IF2 ADC Swap Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_if2_adc_swap_mux),
+		&rt5682_if2_adc_swap_mux),
 
 	SND_SOC_DAPM_MUX("ADCDAT Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_adcdat_pin_ctrl),
+		&rt5682_adcdat_pin_ctrl),
 
 	SND_SOC_DAPM_MUX("DAC L Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_dac_l_mux),
+		&rt5682_dac_l_mux),
 	SND_SOC_DAPM_MUX("DAC R Mux", SND_SOC_NOPM, 0, 0,
-			&rt5682_dac_r_mux),
+		&rt5682_dac_r_mux),
 
 	/* Audio Interface */
 	SND_SOC_DAPM_AIF_OUT("AIF1TX", "AIF1 Capture", 0,
@@ -1831,7 +1824,6 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	/* Output Lines */
 	SND_SOC_DAPM_OUTPUT("HPOL"),
 	SND_SOC_DAPM_OUTPUT("HPOR"),
-
 };
 
 static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
@@ -1997,7 +1989,7 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 };
 
 static int rt5682_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
-			unsigned int rx_mask, int slots, int slot_width)
+		unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
 	unsigned int cl, val = 0;
@@ -2065,9 +2057,8 @@ static int rt5682_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mask,
 	return 0;
 }
 
-
 static int rt5682_hw_params(struct snd_pcm_substream *substream,
-	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
+		struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
@@ -2085,7 +2076,7 @@ static int rt5682_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	dev_dbg(dai->dev, "lrck is %dHz and pre_div is %d for iis %d\n",
-				rt5682->lrck[dai->id], pre_div, dai->id);
+		rt5682->lrck[dai->id], pre_div, dai->id);
 
 	switch (params_width(params)) {
 	case 16:
@@ -2469,7 +2460,7 @@ static int rt5682_set_bclk2_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 }
 
 static int rt5682_set_bias_level(struct snd_soc_component *component,
-			enum snd_soc_bias_level level)
+		enum snd_soc_bias_level level)
 {
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
@@ -2667,7 +2658,7 @@ static unsigned long rt5682_bclk_recalc_rate(struct clk_hw *hw,
 	unsigned int bclks_per_wclk;
 
 	snd_soc_component_read(component, RT5682_TDM_TCON_CTRL,
-				&bclks_per_wclk);
+		&bclks_per_wclk);
 
 	switch (bclks_per_wclk & RT5682_TDM_BCLK_MS1_MASK) {
 	case RT5682_TDM_BCLK_MS1_256:
@@ -2954,7 +2945,7 @@ struct sdw_stream_data {
 };
 
 static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
-				int direction)
+				 int direction)
 {
 	struct sdw_stream_data *stream;
 
@@ -2997,8 +2988,8 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 	unsigned int val_p = 0, val_c = 0, osr_p = 0, osr_c = 0;
 
 	dev_dbg(dai->dev, "%s %s", __func__, dai->name);
-	stream = snd_soc_dai_get_dma_data(dai, substream);
 
+	stream = snd_soc_dai_get_dma_data(dai, substream);
 	if (!stream)
 		return -ENOMEM;
 
@@ -3114,7 +3105,7 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 }
 
 static int rt5682_sdw_hw_free(struct snd_pcm_substream *substream,
-				struct snd_soc_dai *dai)
+			      struct snd_soc_dai *dai)
 {
 	struct snd_soc_component *component = dai->component;
 	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
@@ -3308,7 +3299,6 @@ static void rt5682_calibrate(struct rt5682_priv *rt5682)
 	regmap_write(rt5682->regmap, RT5682_STO1_ADC_MIXER, 0xc0c4);
 
 	mutex_unlock(&rt5682->calibrate_mutex);
-
 }
 
 #if IS_ENABLED(CONFIG_SND_SOC_RT5682_SDW)
@@ -3363,7 +3353,7 @@ static const struct regmap_config rt5682_sdw_regmap = {
 };
 
 int rt5682_sdw_init(struct device *dev, struct regmap *regmap,
-	struct sdw_slave *slave)
+		struct sdw_slave *slave)
 {
 	struct rt5682_priv *rt5682;
 	int ret;
@@ -3461,23 +3451,23 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	}
 
 	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
-				    ARRAY_SIZE(patch_list));
+				     ARRAY_SIZE(patch_list));
 	if (ret)
 		dev_warn(dev, "Failed to apply regmap patch: %d\n", ret);
 
 	regmap_write(rt5682->regmap, RT5682_DEPOP_1, 0x0000);
 
 	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
-			RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
-			RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
+		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
+		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
 	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
 	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
 	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
-			RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
+		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
 	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
-			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
 	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
-			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
+		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
 
 	/* Soundwire */
 	regmap_write(rt5682->regmap, RT5682_PLL2_INTERNAL, 0xa266);
@@ -3499,9 +3489,9 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 	regmap_update_bits(rt5682->regmap, RT5682_SAR_IL_CMD_1,
 		RT5682_SAR_POW_MASK, RT5682_SAR_POW_EN);
 	regmap_update_bits(rt5682->regmap, RT5682_RC_CLK_CTRL,
-			RT5682_POW_IRQ | RT5682_POW_JDH |
-			RT5682_POW_ANA, RT5682_POW_IRQ |
-			RT5682_POW_JDH | RT5682_POW_ANA);
+		RT5682_POW_IRQ | RT5682_POW_JDH |
+		RT5682_POW_ANA, RT5682_POW_IRQ |
+		RT5682_POW_JDH | RT5682_POW_ANA);
 	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_2,
 		RT5682_PWR_JDH, RT5682_PWR_JDH);
 	regmap_update_bits(rt5682->regmap, RT5682_IRQ_CTRL_2,
@@ -3510,7 +3500,7 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 
 reinit:
 	mod_delayed_work(system_power_efficient_wq,
-		   &rt5682->jack_detect_work, msecs_to_jiffies(250));
+		&rt5682->jack_detect_work, msecs_to_jiffies(250));
 
 	/* Mark Slave initialization complete */
 	rt5682->hw_init = true;
@@ -3527,7 +3517,7 @@ EXPORT_SYMBOL_GPL(rt5682_io_init);
 #endif
 
 static int rt5682_i2c_probe(struct i2c_client *i2c,
-		    const struct i2c_device_id *id)
+		const struct i2c_device_id *id)
 {
 	struct rt5682_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	struct rt5682_priv *rt5682;
@@ -3597,7 +3587,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 	rt5682_calibrate(rt5682);
 
 	ret = regmap_multi_reg_write(rt5682->regmap, patch_list,
-				    ARRAY_SIZE(patch_list));
+				     ARRAY_SIZE(patch_list));
 	if (ret)
 		dev_warn(&i2c->dev, "Failed to apply regmap patch: %d\n", ret);
 
@@ -3643,27 +3633,26 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 	}
 
 	regmap_update_bits(rt5682->regmap, RT5682_PWR_ANLG_1,
-			RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
-			RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
+		RT5682_LDO1_DVO_MASK | RT5682_HP_DRIVER_MASK,
+		RT5682_LDO1_DVO_12 | RT5682_HP_DRIVER_5X);
 	regmap_write(rt5682->regmap, RT5682_MICBIAS_2, 0x0380);
 	regmap_update_bits(rt5682->regmap, RT5682_GPIO_CTRL_1,
-			RT5682_GP4_PIN_MASK | RT5682_GP5_PIN_MASK,
-			RT5682_GP4_PIN_ADCDAT1 | RT5682_GP5_PIN_DACDAT1);
+		RT5682_GP4_PIN_MASK | RT5682_GP5_PIN_MASK,
+		RT5682_GP4_PIN_ADCDAT1 | RT5682_GP5_PIN_DACDAT1);
 	regmap_write(rt5682->regmap, RT5682_TEST_MODE_CTRL_1, 0x0000);
 	regmap_update_bits(rt5682->regmap, RT5682_BIAS_CUR_CTRL_8,
-			RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
+		RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
 	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
-			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+		RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
 	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
-			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
+		RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
 	regmap_update_bits(rt5682->regmap, RT5682_DMIC_CTRL_1,
-			RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
+		RT5682_FIFO_CLK_DIV_MASK, RT5682_FIFO_CLK_DIV_2);
 
 	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
-				rt5682_jack_detect_handler);
+		rt5682_jack_detect_handler);
 	INIT_DELAYED_WORK(&rt5682->jd_check_work,
-				rt5682_jd_check_handler);
-
+		rt5682_jd_check_handler);
 
 	if (i2c->irq) {
 		ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL,
@@ -3671,12 +3660,11 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 			| IRQF_ONESHOT, "rt5682", rt5682);
 		if (ret)
 			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
-
 	}
 
 	return devm_snd_soc_register_component(&i2c->dev,
-					&soc_component_dev_rt5682,
-					rt5682_dai, ARRAY_SIZE(rt5682_dai));
+			&soc_component_dev_rt5682,
+			rt5682_dai, ARRAY_SIZE(rt5682_dai));
 }
 
 static void rt5682_i2c_shutdown(struct i2c_client *client)
-- 
2.26.2.303.gf8c07b1a785-goog

