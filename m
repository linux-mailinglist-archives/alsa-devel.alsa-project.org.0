Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 268082A3ABC
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 03:56:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF33D1739;
	Tue,  3 Nov 2020 03:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF33D1739
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604372194;
	bh=0rQlRwoEmfTQM0plJge7pvZUY5n6LvDhJcXZY5tjJT0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uBJ0ILfKWTinck1hQgaKQpamQrd7NeJF4c0s+9Gv3f5f1nSqedyw4mA84WAocCEdX
	 r+zeyq4psivCbQ820z3Ny49uYS+bybtiaV+GPHuZQ4N/15VHuED7gRd0+sifuGa5fF
	 IuJ+LLh8x+PKiVEkqjV2IIGzbdgXt0DLWm+pKJY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15288F804CA;
	Tue,  3 Nov 2020 03:54:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53C9EF804C3; Tue,  3 Nov 2020 03:54:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CAF7F804C1
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 03:54:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CAF7F804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dAiYct3L"
Received: by mail-pl1-x643.google.com with SMTP id b19so7877513pld.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 18:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZmvUTD8a5qIFa/RrtNuw9Ia5UB2gCWucIEHcm6cBWg=;
 b=dAiYct3LCcMwIUR9xFV0kR3k3PN6NS/o525dQhxgcKavuahk4veX2heP2bUMs+VtWp
 HOUGYrgim2A6fKf4hMqlWit7bvintsMhMMsnijI4G+2LceDp+YVDMxiAjwl8cCNt2O/H
 EJii7+ibaWaPGDaTbeVpsJ10e+OA1P+q4qU68WU1QxRYiQj6p0laXdm2J5DTNNyCO2pW
 bptpjc/uh71HHj0HmymaWaizq3CHktNbi8KDhnNPMOpslGpOdFUAZMAr6vWNrFNagKcp
 bPvBYbYOe4kxjfUu8TKglEXEXzMsJWOzzS2ZSCXMT0dDNleGkFQiBTQSNx3NApvXT7f/
 X/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MZmvUTD8a5qIFa/RrtNuw9Ia5UB2gCWucIEHcm6cBWg=;
 b=oG/6Pc0zMmnBkEmCHdb0Pb/0zqUHx3MtUbnt/SL3/aoLBxL7jHfs+QqoIYEx2RhlUu
 K5SipwoCkeQgyhBpUPjA3mYAuZETLbVRbLswtM7hdFt71QKsEFgPQ2kM23fjwYFeFdHF
 YzhPwKiJi5a+48CyrBUmQ/manFBUtyBWJlD7Iuox/VP3r1vyKkTBVvlI4+cAr+IPgzWb
 kidEqN4hFqAvc+rnrG8ZNaRHyFcjEw0S29d128Yxv0dNt0YomrUxJ02m2G24l1COjr5w
 3iCx1KKr9TWJRxPz/hBQnjHN6YWGewq2DfXeQJJlfetxpq02WpprAo/o+UKZz5z+gD5U
 qV9Q==
X-Gm-Message-State: AOAM5313czH2sgY0CbI4g3GIsccsIp87+PgoOBbPu8ftQLiyJIVXnOgz
 hQIMh8YuM2P7DwTJ4RB9jJWr5M5ei9g5og==
X-Google-Smtp-Source: ABdhPJyGjthcuzX/2mCMS9kuFEReDkYHnu2MPzpeojpuHsH1wxEjZYGve2ifdjr8vuMnxHlq2Qo2iA==
X-Received: by 2002:a17:902:9886:b029:d6:d25f:7f90 with SMTP id
 s6-20020a1709029886b02900d6d25f7f90mr5495101plp.41.1604372052440; 
 Mon, 02 Nov 2020 18:54:12 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id t10sm876076pjr.37.2020.11.02.18.54.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 18:54:12 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date: Tue,  3 Nov 2020 10:53:47 +0800
Message-Id: <20201103025347.510940-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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
---
 sound/soc/qcom/sc7180.c | 61 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..345489d08886 100644
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
+			dev_err(&pdev->dev, "DMIC gpio failed err=%d\n", PTR_ERR(data->dmic_sel));
+			return PTR_ERR(data->dmic_sel);
+		}
+	}
+
 	ret = qcom_snd_parse_of(card);
 	if (ret)
 		return ret;
-- 
2.25.1

