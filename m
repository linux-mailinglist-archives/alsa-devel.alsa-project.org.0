Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A99D2A8F61
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Nov 2020 07:17:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E33B1658;
	Fri,  6 Nov 2020 07:16:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E33B1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604643437;
	bh=c7ZiaC8Ru4FadnnisW9AF49T0JNXNU+flWtPwOPkXaA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDA96n3Uwmpo501HFj0iqATXVhRC3eD/RbNgJ8+9hlpCjKuf4t1kDaU6VkXXd+qNF
	 naxopYKFVKUgS90oFPGK7XeAoumrRjFfReLGAsEdrgqggtkQOuFgWe/9jqyZ6m8Xb0
	 ABV9HlcOYXm+oGQcj0+uQc0cU8D+pao/fmgSP53g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EF8F804C1;
	Fri,  6 Nov 2020 07:15:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4132F804C2; Fri,  6 Nov 2020 07:14:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94C69F800BA
 for <alsa-devel@alsa-project.org>; Fri,  6 Nov 2020 07:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94C69F800BA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="RPQyg8Vl"
Received: by mail-pg1-x543.google.com with SMTP id w4so111241pgg.13
 for <alsa-devel@alsa-project.org>; Thu, 05 Nov 2020 22:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bCp02/KdQKO37j/RsLXZ8/YoseoQ3xQo6vzDe5cyZuo=;
 b=RPQyg8VlQXYTcKx7JG93r5AqtGwDivqYuef5SRML9Q8LE9NtXaev+IzySz18wcZtD2
 KpXVZ1UrZZMdHeov6F9bbIjiXTPHKgtp8QPxDQIblYF6d+X89V3v8mR0KfLTPPLnIWTB
 bwMOxtHh00t85QaI2uCXsTIv0SDChH85rfy73OwsYRiab5j/GfFNLdZXMDLgrP1x/I8x
 kirgnzX6G6LF1gduufsKqljmEbiDh8UTLqmSPNB7Dw5KndkxxMPsEFCYhUSwiD8QLQoH
 RZK0ruxtOgorUO+nz++CbTDA7EDAH3gjtEeoguGuB1K74evvp73fNP1Tyuo0R0X+0wyl
 tGKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bCp02/KdQKO37j/RsLXZ8/YoseoQ3xQo6vzDe5cyZuo=;
 b=GcFQv8lLTsq5lOfE7PIHPfSjhaKGuhR6fxizbk/hhGez9816/ECJvWv8kfAmYUzTsX
 6VNS4dMYyNejFVFUiiG5mVenRTuwMmgCbvPX8kKROHt9d/Ctcy6IJP88RZFfleAd1rav
 OjcgMQD06FFNIzVh/kfBSYdM6FzjCwaqT1jyj9Kh6ojX0+YSEt9dwsc1tppMoYhqk6+r
 eF5dapLRDux9qX02aV2qPaC6pqkuPoW8b+DiouYSt85lrNm4W3omI/ZwSx/gOR2Z27Q+
 vdgROd71jNlVEsYT9r2QBgrzRfVZGZZvf+6UN8WlrFahQ2zj9dKJWiPVfmI2NE3Ob6SS
 +4lA==
X-Gm-Message-State: AOAM532UDp6rhWFZ3TAsZxmt9NzcHDQwatSpEzYAbjIXfIf7Lvxqfohp
 X5KqoNg6u0dHa3ZvVYV3BFA=
X-Google-Smtp-Source: ABdhPJwYPI2jygviL6WUqycB2ajwbeQhCK7O2POs7mepgfAE5dnjkpnarP8n78DdOzaHEy1DEvBHeQ==
X-Received: by 2002:a17:90a:aa15:: with SMTP id
 k21mr744725pjq.169.1604643290556; 
 Thu, 05 Nov 2020 22:14:50 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id b2sm425171pgg.2.2020.11.05.22.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 22:14:50 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date: Fri,  6 Nov 2020 14:14:33 +0800
Message-Id: <20201106061433.1483129-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
References: <20201106061433.1483129-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, robh@kernel.org, alsa-devel@alsa-project.org,
 Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Tzung-Bi Shih <tzungbi@google.com>, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Rohit kumar <rohitkr@codeaurora.org>,
 tzungbi@chromium.org, srinivas.kandagatla@linaro.org,
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

In addition, having mixer control to switch between DMICs by
using "dmic-gpios" property.

Refer to this one as an example,
commit b7a742cff3f6 ("ASoC: AMD: Use mixer control to switch between DMICs")

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---
 sound/soc/qcom/sc7180.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..455d3f2b8ce8 100644
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
@@ -28,6 +30,8 @@ struct sc7180_snd_data {
 	u32 pri_mi2s_clk_count;
 	struct snd_soc_jack hs_jack;
 	struct snd_soc_jack hdmi_jack;
+	struct gpio_desc *dmic_sel;
+	int dmic_switch;
 };
 
 static void sc7180_jack_free(struct snd_jack *jack)
@@ -169,6 +173,27 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
 	return 0;
 }
 
+static int dmic_get(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	ucontrol->value.integer.value[0] = data->dmic_switch;
+	return 0;
+}
+
+static int dmic_set(struct snd_kcontrol *kcontrol,
+		    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_dapm(kcontrol);
+	struct sc7180_snd_data *data = snd_soc_card_get_drvdata(dapm->card);
+
+	data->dmic_switch = ucontrol->value.integer.value[0];
+	gpiod_set_value(data->dmic_sel, data->dmic_switch);
+	return 0;
+}
+
 static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
@@ -206,6 +231,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
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
@@ -238,6 +287,18 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 	card->dapm_widgets = sc7180_snd_widgets;
 	card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_widgets);
 
+	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
+		card->dapm_widgets = sc7180_snd_dual_mic_widgets,
+		card->num_dapm_widgets = ARRAY_SIZE(sc7180_snd_dual_mic_widgets),
+		card->dapm_routes = sc7180_snd_dual_mic_audio_route,
+		card->num_dapm_routes = ARRAY_SIZE(sc7180_snd_dual_mic_audio_route),
+		data->dmic_sel = devm_gpiod_get(&pdev->dev, "dmic", GPIOD_OUT_LOW);
+		if (IS_ERR(data->dmic_sel)) {
+			dev_err(&pdev->dev, "DMIC gpio failed err=%ld\n", PTR_ERR(data->dmic_sel));
+			return PTR_ERR(data->dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.25.1

