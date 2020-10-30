Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E0529FF49
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 09:00:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08F9515E5;
	Fri, 30 Oct 2020 08:59:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08F9515E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604044811;
	bh=kETDoqMKTE+zThQA56d6TB35Xd4BEuNwrobrnGjB2A8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXUJ0dJAuTnxBCuXcLPcxawANp1ykvBi+fXJmtOoj+mDyV6WTNN0vBywcNrjvZyGm
	 HB/n33ZKLzLCRwdwPCzNUhU/2wNmoB3zCfK6AHPX9knPEIF5vJCzqS/xb9eA7DP1JI
	 PkmVQc2a//aYkb9JKUfQNmrVMw+KCzrigtQ/Sjn0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14629F804B3;
	Fri, 30 Oct 2020 08:57:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5C81F8028B; Fri, 30 Oct 2020 08:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64353F8025E
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 08:57:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64353F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="tQoyLfsy"
Received: by mail-pg1-x541.google.com with SMTP id i26so4523624pgl.5
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 00:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PdodUo+6mcNMJwIz8HCiSd/BPrJxVSi77oUzRemdDVU=;
 b=tQoyLfsyZlXvHg2b1MunUYxzh17UMQmrrYCBspTbicI7tC8VuB0FbNbVRCUIuoZgxP
 1yq7jk0/YnRMA1qLOLLJ4K6q/K/rVnEa5FPA1f3EZNExA37wdvy8GXHh/hnTjf+3xoGp
 ASskqvXt7SCPfELXlJD2UFCqwhnMLfug3Cf3j3x4TGYptej0TZEihb+wGLfcjlUHqAaf
 luQu9EQyaV3O0U99lydlXufUR6zUitfBX/J6h1B9u+zviLuN4raKOOG2oen2jJL679tt
 izRQwYT2zqLL7dpxhXb84uZ4gz0dE95sNod5mskV+/pkOk2k3bMYNu9Mv8rxrOZJWJT4
 Vwgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PdodUo+6mcNMJwIz8HCiSd/BPrJxVSi77oUzRemdDVU=;
 b=YEZsZ7Fh2G43VlP5alve++NBI/6gd8mzi+fO86qvgPkZ4lL9Zr4zhYQd4p91akDtYi
 K43BEYRfPjIGPr+B0FDkWBySOi0DMucAeK5VGCrdomylusQuJXgL/H2Nft2xaUZl9wx5
 Ts4MZafMO6FZMi5xAeWgIfTl0Zni2DBQVJNCIOPnxxpkA75Ix93QY46SiRlZiTOW9He4
 q3ttSx8woT5eD4WYyivCE2h9Zt2jM8mT1exPpvNzoxj0yD2DS141xWTr4I8jWZTsSqZx
 kFX5q/nypYLOJxaI36tifvZLY6f+rdyhMn5l0SZpUeblAnDUa7r9na4xPUdbx26D/E4x
 U7Vg==
X-Gm-Message-State: AOAM530m9w6iQCObI7Lf/m/ZLUM+Ionf+LQJBk3KnfOn2bvROsght/UQ
 khhbyuPeTNDUQ/V4+WwXR4M=
X-Google-Smtp-Source: ABdhPJzNlDsxhwQNEze1EEKkOurdKJhokUzfb3AC4vmpr4YhZDvoUJ56zx/W4XVqnFo9vWYKxhrM8A==
X-Received: by 2002:aa7:96f6:0:b029:164:2def:5ef7 with SMTP id
 i22-20020aa796f60000b02901642def5ef7mr8009841pfq.44.1604044666400; 
 Fri, 30 Oct 2020 00:57:46 -0700 (PDT)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id e4sm2388392pjg.44.2020.10.30.00.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 00:57:45 -0700 (PDT)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for 2mic
Date: Fri, 30 Oct 2020 15:57:24 +0800
Message-Id: <20201030075724.1616766-3-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
References: <20201030075724.1616766-1-ajye_huang@compal.corp-partner.google.com>
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
 sound/soc/qcom/sc7180.c | 59 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index b391f64c3a80..e9366bb5f3c2 100644
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
@@ -23,6 +25,9 @@
 
 #define DRIVER_NAME "SC7180"
 
+static struct gpio_desc *dmic_sel;
+static int dmic_switch;
+
 struct sc7180_snd_data {
 	struct snd_soc_card card;
 	u32 pri_mi2s_clk_count;
@@ -169,6 +174,23 @@ static int sc7180_snd_startup(struct snd_pcm_substream *substream)
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
@@ -206,6 +228,30 @@ static const struct snd_soc_dapm_widget sc7180_snd_widgets[] = {
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
 
+	if (of_property_read_bool(dev->of_node, "dmic-gpios")) {
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
-- 
2.25.1

