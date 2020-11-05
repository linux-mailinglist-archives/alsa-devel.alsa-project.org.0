Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A97BC2A91B6
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 09:45:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC67168B;
	Fri,  6 Nov 2020 09:44:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC67168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604652345;
	bh=uy0jzxgIuB5E46y5TrKdWc7GjBgtRjKNuFjmtCKov7Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LHFhYGnZswph+YDc4gxN3TZQGvn5aJ+Vp2VxQ6WNyyVUH8ietrsMttj39laSc5uL7
	 PDJhQSRefxwvAam0dlaX4z4ISjqvtwUwWK1/X6Mq0yCue6Kra6rg5+1dRi10fVwg1Q
	 tU/rGlVYuzV8RxgXTWl/9LfB2RKYWGmwSV8YvGHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E03BDF804BD;
	Fri,  6 Nov 2020 09:43:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B87F80234; Thu,  5 Nov 2020 02:33:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B08FAF800EC
 for <alsa-devel@alsa-project.org>; Thu,  5 Nov 2020 02:33:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B08FAF800EC
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="nZc7HWWH"
Received: by mail-pg1-x543.google.com with SMTP id g12so85033pgm.8
 for <alsa-devel@alsa-project.org>; Wed, 04 Nov 2020 17:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbX+Ow5GnFZtllSW39hQiEYpOSlmUOCZ6YI5wSQOGic=;
 b=nZc7HWWHoy6cp+t/1wlId7QH6UchY+hZ32TPMSTskHgMRUpS4iuy7BtxMj2mb1mmO+
 oHf4+rbp6962f9Opp6zvOmIpLzNZMbcioEJNZ/qYlJu5Os1gRLt8bA94khVFJd/TuzS1
 CqBoi/8fA4G04PgwR2p6mulyEoqt0F9zkIuGBvcqPK+xQoJU1caT5ni8ztvtlJZSR0EE
 1uu/0uDViQeNRZMfodHRNLa99seGn9qRbHkAKqgk6t1bstIONIBOhX6E3kmKCFaRC3GW
 zQac13H0fUg0dWsN8uP+TlXmMUSo/mOmj3NYT9eg7TM/FnFjkSNqYmJjjn6IRwiNqXci
 rHGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbX+Ow5GnFZtllSW39hQiEYpOSlmUOCZ6YI5wSQOGic=;
 b=rAHpO+zY1j8urSQE9Gk6IUjpMdusrdeJoaDq+jZMNQICXVsSBuIzalUN1RhyHBe04r
 Hr0Q4be2yfos3n8qkgmc5QIoh+dP6F4bbuB7AG8GJv5iO77Cs//bcUyMxT+/K3log377
 zb42bYmIVGGJI1oJ0p2kaJER/poIjq3b8w+qy3y/OhPr3sGdViJBkK79grodDglf+1c0
 xwH7dCM/jd5yImanXuebtfRiov62fuaNdjB6tUEtJg3r7/XKY+rsWmP04FnzlCaWmwLG
 qchnRsj+w/cdDDhtBps2yCDEMLb3zln92cJomwEsk5NTeHoLn0RZlDhJApVl5PMsaJxF
 MKuw==
X-Gm-Message-State: AOAM530YTo+9rSkU8gU9RSkCzHKpWncKdlOqVb9LLaDyRUie00nOMnu7
 rDMqPcRe4Wjm1BJiGE/7dtgW
X-Google-Smtp-Source: ABdhPJyq84XwPjSrAn2gXvlVdmdGygNKyiD7g04/RqqOGElnmftlLOX9XBBhKDq8KUPD9bSkxdLlUw==
X-Received: by 2002:a63:3116:: with SMTP id x22mr151822pgx.278.1604539985665; 
 Wed, 04 Nov 2020 17:33:05 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 m13sm127817pjr.30.2020.11.04.17.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 17:33:05 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] ASoC: qcom: sc7180: Modify machine driver for adau7002
Date: Thu,  5 Nov 2020 09:32:42 +0800
Message-Id: <20201105013242.298518-3-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201105013242.298518-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 06 Nov 2020 09:43:14 +0100
Cc: Taniya Das <tdas@codeaurora.org>, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rohit kumar <rohitkr@codeaurora.org>, cychiang@chromium.org,
 Patrick Lai <plai@codeaurora.org>, Andy Gross <agross@kernel.org>,
 dgreid@chromium.org, zhouguohui@huaqin.corp-partner.google.com,
 devicetree@vger.kernel.org, tzungbi@chromium.org,
 Stephan Gerhold <stephan@gerhold.net>, linux-arm-msm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, dianders@chromium.org,
 Takashi Iwai <tiwai@suse.com>, xuyuqing@huaqin.corp-partner.google.com,
 Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, judyhsiao@chromium.org
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

Bypass set jack because there is no jack on coachz.
Create route for dmic.

Signed-off-by: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
---
 sound/soc/qcom/Kconfig  |   1 +
 sound/soc/qcom/sc7180.c | 119 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 109 insertions(+), 11 deletions(-)

diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 41cb08bd5588..27f93006be96 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -145,6 +145,7 @@ config SND_SOC_SC7180
 	select SND_SOC_LPASS_SC7180
 	select SND_SOC_MAX98357A
 	select SND_SOC_RT5682_I2C
+	select SND_SOC_ADAU7002
 	help
 	  To add support for audio on Qualcomm Technologies Inc.
 	  SC7180 SoC-based systems.
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..240b75b44716 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -196,33 +196,102 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 	}
 }
 
+static int sc7180_adau7002_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		return 0;
+	case MI2S_SECONDARY:
+		return 0;
+	case LPASS_DP_RX:
+		return sc7180_hdmi_init(rtd);
+	default:
+		dev_err(rtd->dev, "%s: invalid dai id 0x%x\n", __func__,
+			cpu_dai->id);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int sc7180_adau7002_snd_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY:
+		snd_soc_dai_set_fmt(codec_dai,
+				    SND_SOC_DAIFMT_CBS_CFS |
+				    SND_SOC_DAIFMT_NB_NF |
+				    SND_SOC_DAIFMT_I2S);
+
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
+	return 0;
+}
+
 static const struct snd_soc_ops sc7180_ops = {
 	.startup = sc7180_snd_startup,
 	.shutdown = sc7180_snd_shutdown,
 };
 
+static const struct snd_soc_ops sc7180_adau7002_ops = {
+	.startup = sc7180_adau7002_snd_startup,
+};
+
 static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
 };
 
-static void sc7180_add_ops(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link;
-	int i;
+static const struct snd_soc_dapm_widget sc7180_adau7002_snd_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
 
-	for_each_card_prelinks(card, i, link) {
-		link->ops = &sc7180_ops;
-		link->init = sc7180_init;
-	}
-}
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
 
 static int sc7180_snd_platform_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card;
 	struct sc7180_snd_data *data;
 	struct device *dev = &pdev->dev;
+	struct snd_soc_dai_link *link;
 	int ret;
+	int i;
+	bool no_headphone;
 
 	/* Allocate the private data */
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
@@ -238,17 +307,45 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		data->dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(data->dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n",
+				PTR_ERR(data->dmic_sel));
+				return PTR_ERR(data->dmic_sel);
+		}
+	}
+
+	if (of_device_is_compatible(dev->of_node, "google,sc7180-coachz")) {
+		no_headphone = true;
+		card->dapm_widgets = sc7180_adau7002_snd_widgets;
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_adau7002_snd_widgets);
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
 
-	sc7180_add_ops(card);
+	for_each_card_prelinks(card, i, link) {
+		if (no_headphone) {
+			link->ops = &sc7180_adau7002_ops;
+			link->init = sc7180_adau7002_init;
+		} else {
+			link->ops = &sc7180_ops;
+			link->init = sc7180_init;
+		}
+	}
 
 	return devm_snd_soc_register_card(dev, card);
 }
 
 static const struct of_device_id sc7180_snd_device_id[]  = {
-	{ .compatible = "google,sc7180-trogdor"},
+	{.compatible = "google,sc7180-trogdor"},
+	{.compatible = "google,sc7180-coachz"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, sc7180_snd_device_id);
-- 
2.25.1

