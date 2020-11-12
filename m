Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA812AFCB5
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 02:46:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5266F17B9;
	Thu, 12 Nov 2020 02:45:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5266F17B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605145570;
	bh=BS9CqOG8RBgT8Avc7ZcGIlVprsKdW/WOSBA0XvBa/7E=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9pyUISbgHU1L+gpMsKUVf9gpOhCd2ZWqUMg2+s5ZQTVJhnG1gWawWOlOWyb045CU
	 Xee2mUDzcAOEiCbKyVgSnuE0vEkG7y5kpuHeXD1DA9Z2whKhxB0JJyWJZmvnJoyIm/
	 EthAE3sl8VYLlF0JVJkCrQ2OIiGLfBy7bWm1kNCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D802F8025E;
	Thu, 12 Nov 2020 02:44:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72C83F802C4; Thu, 12 Nov 2020 02:44:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 897ECF8025E
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 02:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 897ECF8025E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key)
 header.d=huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.i=@huaqin-corp-partner-google-com.20150623.gappssmtp.com
 header.b="LgjrYdJr"
Received: by mail-pg1-x543.google.com with SMTP id e21so2766710pgr.11
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 17:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=huaqin-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0cFLEEzOBFqtPRqMbrgxpfYm1hPATc5ZUJsnwS3q7c=;
 b=LgjrYdJr7PcK+o197Nr+M5YH81CU1kOQf2n6pwsvQRiOxMXmItm5chnTeozaAoJ0Q4
 SxG/HgzFyozp3Og4Uif7goQ54o8689RbQEAhI1ILXi3+Q8GdvxlHRIDf1gDhPyUdzqVM
 oXcvYE0eA5TcEi3KVaF6rmQgmkLcHtSLG9Y99caQWnsnl99fKAEAf6BEcJsTtqwddOqC
 uf22xYAnyAW481MGFegKkOgaVXiVbXJeFLcPpLcBDNlirbysgj8ZPzpdc18opa3Cv7Zd
 zrs9ObKES1hLHIPdk39FXE7W3Yp5U3mzu2s1QLOVX0x7ymmxHQmetvNme4G9DH6Zj2VP
 JwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0cFLEEzOBFqtPRqMbrgxpfYm1hPATc5ZUJsnwS3q7c=;
 b=sqDsJaLdU//vGEUzM4LG/gsQPk1Y2Or+fYLUP6aGTnMsuZMaZDyd061tKcB6cqc8bd
 UC7wzyTy7rdZqN3GYSdC7uKSOImetT8XYiuFUq0XNn1HacT7yJd2KJW5OgVjuQkLBGzS
 lP5/+IpIzNm6jo4CVg1k1XnQNFmTG1l6e6Udp0WEilrfBgK0nwTpR0jy9V1qSQWHRBU6
 oMTfFa9zYDe1x9Bh5wr2t+2dK9B4hmPswdQs3alTIojh7GrWK4Xw1JoDUZnPa7EWbkW/
 2fvrw/GWokNAP6eFDO0813P+33lZTPKeg7VAaUWcjzGfd/7K+0B++Vf7iWlFhUzET6Ou
 5Ovw==
X-Gm-Message-State: AOAM530cwUg+qnPjA9mzaypZb5oqg2Ex94NRtJ37llsW1WUa4oGdL8Do
 HavjlsHpeYwc3z9ZlEQkmRMR
X-Google-Smtp-Source: ABdhPJxhXBXAQ6Jc8mv7FpRXR4ISG3WBs0ZhHALrJYJpygtGndZHImr5i3ZP86b31Evg5crtBLGF8A==
X-Received: by 2002:a62:804d:0:b029:18b:9bf:2979 with SMTP id
 j74-20020a62804d0000b029018b09bf2979mr8087291pfd.11.1605145438665; 
 Wed, 11 Nov 2020 17:43:58 -0800 (PST)
Received: from xuyuqing-ZenBook-UX425JA-UX425JA.huaqin.com ([101.78.151.194])
 by smtp.gmail.com with ESMTPSA id
 m6sm4062413pfa.61.2020.11.11.17.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 17:43:58 -0800 (PST)
From: xuyuqing <xuyuqing@huaqin.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] ASoC: qcom: sc7180: Modify machine driver for sound
 card
Date: Thu, 12 Nov 2020 09:43:28 +0800
Message-Id: <20201112014328.695232-3-xuyuqing@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
References: <20201112014328.695232-1-xuyuqing@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
 sound/soc/qcom/Kconfig  |  1 +
 sound/soc/qcom/sc7180.c | 86 ++++++++++++++++++++++++++++++++++-------
 2 files changed, 74 insertions(+), 13 deletions(-)

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
index 878fd0169aab..e2e6567566af 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -221,16 +221,69 @@ static void sc7180_snd_shutdown(struct snd_pcm_substream *substream)
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
 
+static const struct snd_soc_dapm_widget sc7180_adau7002_snd_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
 static const char * const dmic_mux_text[] = {
 	"Front Mic",
 	"Rear Mic",
@@ -255,23 +308,15 @@ static const struct snd_soc_dapm_route sc7180_snd_dual_mic_audio_route[] = {
 	{"Dmic Mux", "Rear Mic", "DMIC"},
 };
 
-static void sc7180_add_ops(struct snd_soc_card *card)
-{
-	struct snd_soc_dai_link *link;
-	int i;
-
-	for_each_card_prelinks(card, i, link) {
-		link->ops = &sc7180_ops;
-		link->init = sc7180_init;
-	}
-}
-
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
@@ -299,17 +344,32 @@ static int sc7180_snd_platform_probe(struct platform_device *pdev)
 		}
 	}
 
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

