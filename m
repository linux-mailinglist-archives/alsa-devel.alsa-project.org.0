Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E514280058
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 15:42:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D534B1780;
	Thu,  1 Oct 2020 15:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D534B1780
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601559776;
	bh=CPrVwiv6VlqSx5aT6PrclPflGjg6welF73XcV6VbWLc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qS3VnSbg6lm599r8vqi4lKrGzdj7xLpahbOthU12kHZqw1TlTQLOkAzwgUIv/apaD
	 C9cfn/6c9LdJr5/jABj4k2iN6YlonLZAdj22oEZ3oRfaVW5LmvIX5WhRp1lQSd4HX2
	 diJphSLLmMrw8zhA+fMBmYWXtnf5c0PMWOXrI2Rs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68970F802E0;
	Thu,  1 Oct 2020 15:40:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C62DF800DF; Mon, 28 Sep 2020 08:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A46EF800DF
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 08:38:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A46EF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G3rybhcS"
Received: by mail-pf1-x443.google.com with SMTP id f18so9927pfa.10
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4BsT30it0uqVB1WMYTnRzRInhOP9DiMllB30Hf1GBMc=;
 b=G3rybhcS1SH9bwJ4tVWLrGwn2MQphTWU1S5C/QyTbUk+mAEcCpKN8EbP7LQZ9Rp8No
 s5G54j/6KtPNuy8C/Ex3NwfyiJr1A+nbBepFRf++TNBBeD9PXEoM6UGz9R7H5VvR4xY1
 t5irZFrjhe5NYkswtb+p/hg77pWYfgwBvs5noUNtw2AW0ac3G0x9NokpNaXFVm5CDMi5
 4mH7yzJZvV+lsYdE7ucVBCTkVlFIt8tsvp9oKtbGxN6frqqBRLrAEez88EBC2BahjInf
 l83hpmKJhAd0zQJ4Sx8q9aSYVcpNkpyDzYcCYsyP0/xOdnPN9Zle/RdqxZoDTFZsMatf
 GalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4BsT30it0uqVB1WMYTnRzRInhOP9DiMllB30Hf1GBMc=;
 b=DKOy9enEhFRkw97m1YZlQDD/R5yBD+CJVQNKtIWzySTqyzii2VLA7m6aun+esfccDn
 sk9Z9SCnvGAKgrm5DS9ffY09oOMh9BwGZmyKaCKWNy816fXOz/Mxje/J0Jg0Jtpv6Abb
 H+hUed4tfPPZkUQsMNl/747vrmhrQM/iC1F73XWNPPXwxc7XDuMSlpIVJBWQ7OD36rhl
 roIs8FbhuoN70bldvzjYWxpfTBWvlcg6qPumkrj798eg1I0BOxw/IMo0Dy7Hnm/O891u
 p2fViosLDW5H2reRsmSULjWHUXKOhtdEgBDct8TXjbfvL++ZjVa9ig5HtTSFibOzgTv4
 XfiQ==
X-Gm-Message-State: AOAM531tCezF2UgeleeV5JpGNuisrvv9as/FvhN8g8MzO0hpMdcxkcJu
 XngA7+oQqaUDrwThtEnS2b4=
X-Google-Smtp-Source: ABdhPJyxgmFyFSLKz/iCCPDLGbVs1DgwaczFEGBnOyQJvl6b2b0LZG0bNsqw01cruin/PlcQ+T2gBw==
X-Received: by 2002:a62:dd01:0:b029:13c:f607:5fff with SMTP id
 w1-20020a62dd010000b029013cf6075fffmr203229pff.3.1601275100351; 
 Sun, 27 Sep 2020 23:38:20 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id x3sm67652pgg.54.2020.09.27.23.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 23:38:19 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date: Mon, 28 Sep 2020 14:37:44 +0800
Message-Id: <20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
References: <20200928063744.525700-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Oct 2020 15:40:07 +0200
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
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

In addition, having mixer control to switch between DMICs for
"qcom,sc7180-sndcard-rt5682-m98357-2mic" 2mic case.

Refer to this one as an example,
commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
This patch depends on this patch series
https://patchwork.kernel.org/patch/11773223/ .


 sound/soc/qcom/sc7180.c | 60 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index 0e90448523b0..c8751fb9f9bf 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -5,6 +5,8 @@
 // sc7180.c -- ALSA SoC Machine driver for SC7180
 
 #include <dt-bindings/sound/sc7180-lpass.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -24,6 +26,9 @@
 // This will be defined in include/dt-bindings/sound/sc7180-lpass.h
 #define LPASS_DP_RX 2
 
+static struct gpio_desc *dmic_sel;
+static int dmic_switch;
+
 struct sc7180_snd_data {
 	struct snd_soc_card card;
 	u32 pri_mi2s_clk_count;
@@ -170,6 +175,23 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	ucontrol->value.integer.value[0] = dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	if (dmic_sel) {
+		dmic_switch = ucontrol->value.integer.value[0];
+		gpiod_set_value(dmic_sel, dmic_switch);
+	}
+	return 0;
+}
+
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -207,6 +229,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
+static const char * const dmic_mux_text[] = {
+	"Front Mic",
+	"Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(sc7180_dmic_enum,
+			    SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new sc7180_dmic_mux_control =
+	SOC_DAPM_ENUM_EXT("DMIC Select Mux", sc7180_dmic_enum,
+			  dmic_get, dmic_set);
+
+static const struct snd_soc_dapm_widget sc7180_snd_dual_mic_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+	SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),
+};
+
+static const struct snd_soc_dapm_route sc7180_snd_dual_mic_audio_route[] = {
+	{"Dmic Mux", "Front Mic", "DMIC"},
+	{"Dmic Mux", "Rear Mic", "DMIC"},
+};
+
 static void sc7180_add_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -238,6 +284,19 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_device_is_compatible(dev->of_node, "qcom,sc7180-sndcard-rt5682-m98357-2mic")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+				PTR_ERR(dmic_sel));
+				return PTR_ERR(dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
@@ -249,6 +308,7 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 
 static const struct of_device_id sc7180_snd_device_id[]  = {
 	{ .compatible = "qcom,sc7180-sndcard-rt5682-m98357-1mic" },
+	{ .compatible = "qcom,sc7180-sndcard-rt5682-m98357-2mic" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
-- 
2.25.1

