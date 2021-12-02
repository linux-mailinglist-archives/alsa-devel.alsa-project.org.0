Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDFD46686B
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:33:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA1CF2987;
	Thu,  2 Dec 2021 17:32:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA1CF2987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462805;
	bh=mRS8aV5IWtbtBLJOU3EeXC2uhglOS2TsLp4NRs1Vu1Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHl3j045XomNAc/a9cz5R5WF6bxPkc9RyX73Vu0fKrBwjDtlX3Gfcj4N1eRKWOpes
	 gZKls6HJhvSehA44Z7cQJDjs0pBzA9mIpHaKXfQoUOOUOtUGhFkuYnF4h+MGE7BXds
	 t4g7O2d3ZbVFKKmICSy8y7Gocf/x8rL0rDp9kJFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BBC44F805AD;
	Thu,  2 Dec 2021 17:26:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCC55F80301; Thu,  2 Dec 2021 17:25:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0627BF804ED
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0627BF804ED
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="GZL4+stF"
Received: by mail-lf1-x130.google.com with SMTP id z7so38453287lfi.11
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fyTBAmupt7gDEygKBlHM3btaCL0Q7p9LZZKGom+gcjE=;
 b=GZL4+stF2O1cuofSl4aXfNQZuD6qNY4gK3W4+aAFBT27NahnX2Zd0ytDj60w8Y7TRG
 2vU6ozW2sOVfLtLY+w0H5WhRnF4O9t+qfRe2ndDouactvB/UwHZhUJ6BesSdCSDJZlc+
 kPEtYNuc2tTUoZdqwgv2FeBBr/amoCicaIuMKMvR814y743VApk/ptIvb4O8XcoGnfDV
 bjyJ/BlrGysA2GiYbJKkYwuNGEyTzyRYKaHk6gLihPHHVvLovJM3KBEGX1FDQhmS2NDW
 7FTG0qsX+IaNtLjWuNOkaRZIPEfFGd9jBT5wlWEVArgXtXdkzloBuDOfoI3f9fPS9TZ5
 SnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fyTBAmupt7gDEygKBlHM3btaCL0Q7p9LZZKGom+gcjE=;
 b=a9W+hncuHlDRtkOSF7nXW7GmnkX7+Xa4KpUdMNSrs4k3hzmJykv4c28cXNhACRozUH
 YGO9MOHG2N8hjNgqFyO72ajLTOldQ62Wpws8YBRfbuq7RYp/52pYHLN8+fm224WxmJ2I
 7cDhXmWlZ5Zwho0yD0KO3Q2eVAbCC6wGpn89nUZ+es0LWO37xdKaLHpkmaAWTjUNKl4U
 0VOMwerOzeBnqAde9SBk1SeNlRi/7V9rD9po5vQERxFiJnV2z5140fvaBlxl2LOr+fjg
 2L8x2qAUj6JdoCy4U+vDsRosg3VShxmBajIKyyf+pq082A8RUv8HX7mhxqHpCnyzLOlr
 ZSqA==
X-Gm-Message-State: AOAM531NUJmQqnrFVIE05KIUpUCTfN+EV4Jmeb85nDQETTIzGmKunPcJ
 VZfgkIkMEQR73lzyc8/Rxts=
X-Google-Smtp-Source: ABdhPJwstAcFDUQ+AIhAQb2GoVaq09U6ie4LonW4523LV/FTLQ6HMT9oFx1JC6UM5WXCsC9SR50ByA==
X-Received: by 2002:a05:6512:12c4:: with SMTP id
 p4mr12836010lfg.307.1638462330083; 
 Thu, 02 Dec 2021 08:25:30 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:29 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 15/20] drm/tegra: hdmi: Register audio CODEC on Tegra20
Date: Thu,  2 Dec 2021 19:23:36 +0300
Message-Id: <20211202162341.1791-16-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211202162341.1791-1-digetx@gmail.com>
References: <20211202162341.1791-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
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

Tegra20 SoC supports only S/PDIF source for HDMI audio. Register ASoC HDMI
S/PDIF CODEC for Tegra20, it will be linked with the S/PDIF CPU DAI.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig |   3 +
 drivers/gpu/drm/tegra/hdmi.c  | 153 +++++++++++++++++++++++++++++++---
 2 files changed, 145 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 32fe64553d2e..40f0d14cb240 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -13,6 +13,9 @@ config DRM_TEGRA_ORIG
 	select INTERCONNECT
 	select IOMMU_IOVA
 	select CEC_CORE if CEC_NOTIFIER
+	select SND_SIMPLE_CARD if SND_SOC_TEGRA20_SPDIF
+	select SND_SOC_HDMI_CODEC if SND_SOC_TEGRA20_SPDIF
+	select SND_AUDIO_GRAPH_CARD if SND_SOC_TEGRA20_SPDIF
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index cc42476fd023..5353f83cbee8 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -18,6 +18,8 @@
 
 #include <soc/tegra/common.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -81,6 +83,9 @@ struct tegra_hdmi {
 	bool dvi;
 
 	struct drm_info_list *debugfs_files;
+
+	struct platform_device *audio_pdev;
+	struct mutex audio_lock;
 };
 
 static inline struct tegra_hdmi *
@@ -363,6 +368,18 @@ static const struct tmds_config tegra124_tmds_config[] = {
 	},
 };
 
+static void tegra_hdmi_audio_lock(struct tegra_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->audio_lock);
+	disable_irq(hdmi->irq);
+}
+
+static void tegra_hdmi_audio_unlock(struct tegra_hdmi *hdmi)
+{
+	enable_irq(hdmi->irq);
+	mutex_unlock(&hdmi->audio_lock);
+}
+
 static int
 tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pix_clock,
 			    struct tegra_hdmi_audio_config *config)
@@ -832,6 +849,23 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 				  HDMI_NV_PDISP_SOR_IO_PEAK_CURRENT);
 }
 
+static int tegra_hdmi_reconfigure_audio(struct tegra_hdmi *hdmi)
+{
+	int err;
+
+	err = tegra_hdmi_setup_audio(hdmi);
+	if (err < 0) {
+		tegra_hdmi_disable_audio_infoframe(hdmi);
+		tegra_hdmi_disable_audio(hdmi);
+	} else {
+		tegra_hdmi_setup_audio_infoframe(hdmi);
+		tegra_hdmi_enable_audio_infoframe(hdmi);
+		tegra_hdmi_enable_audio(hdmi);
+	}
+
+	return err;
+}
+
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
 	struct edid *edid;
@@ -1138,6 +1172,8 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	tegra_hdmi_audio_lock(hdmi);
+
 	/*
 	 * The following accesses registers of the display controller, so make
 	 * sure it's only executed when the output is attached to one.
@@ -1162,6 +1198,10 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_ENABLE);
 	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_MASK);
 
+	hdmi->pixel_clock = 0;
+
+	tegra_hdmi_audio_unlock(hdmi);
+
 	err = host1x_client_suspend(&hdmi->client);
 	if (err < 0)
 		dev_err(hdmi->dev, "failed to suspend: %d\n", err);
@@ -1185,6 +1225,8 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	tegra_hdmi_audio_lock(hdmi);
+
 	/*
 	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
 	 * is used for interoperability between the HDA codec driver and the
@@ -1390,6 +1432,8 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	/* TODO: add HDCP support */
+
+	tegra_hdmi_audio_unlock(hdmi);
 }
 
 static int
@@ -1419,6 +1463,91 @@ static const struct drm_encoder_helper_funcs tegra_hdmi_encoder_helper_funcs = {
 	.atomic_check = tegra_hdmi_encoder_atomic_check,
 };
 
+static int tegra_hdmi_hw_params(struct device *dev, void *data,
+				struct hdmi_codec_daifmt *fmt,
+				struct hdmi_codec_params *hparms)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret = 0;
+
+	tegra_hdmi_audio_lock(hdmi);
+
+	hdmi->format.sample_rate = hparms->sample_rate;
+	hdmi->format.channels = hparms->channels;
+
+	if (hdmi->pixel_clock && !hdmi->dvi)
+		ret = tegra_hdmi_reconfigure_audio(hdmi);
+
+	tegra_hdmi_audio_unlock(hdmi);
+
+	return ret;
+}
+
+static int tegra_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret;
+
+	ret = host1x_client_resume(&hdmi->client);
+	if (ret < 0)
+		dev_err(hdmi->dev, "failed to resume: %d\n", ret);
+
+	return ret;
+}
+
+static void tegra_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret;
+
+	tegra_hdmi_audio_lock(hdmi);
+
+	hdmi->format.sample_rate = 0;
+	hdmi->format.channels = 0;
+
+	tegra_hdmi_audio_unlock(hdmi);
+
+	ret = host1x_client_suspend(&hdmi->client);
+	if (ret < 0)
+		dev_err(hdmi->dev, "failed to suspend: %d\n", ret);
+}
+
+static const struct hdmi_codec_ops tegra_hdmi_codec_ops = {
+	.hw_params = tegra_hdmi_hw_params,
+	.audio_startup = tegra_hdmi_audio_startup,
+	.audio_shutdown = tegra_hdmi_audio_shutdown,
+};
+
+static int tegra_hdmi_codec_register(struct tegra_hdmi *hdmi)
+{
+	struct hdmi_codec_pdata codec_data = {};
+
+	if (hdmi->config->has_hda)
+		return 0;
+
+	codec_data.ops = &tegra_hdmi_codec_ops;
+	codec_data.data = hdmi;
+	codec_data.spdif = 1;
+
+	hdmi->audio_pdev = platform_device_register_data(hdmi->dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_AUTO,
+							 &codec_data,
+							 sizeof(codec_data));
+	if (IS_ERR(hdmi->audio_pdev))
+		return PTR_ERR(hdmi->audio_pdev);
+
+	hdmi->format.channels = 2;
+
+	return 0;
+}
+
+static void tegra_hdmi_codec_unregister(struct tegra_hdmi *hdmi)
+{
+	if (hdmi->audio_pdev)
+		platform_device_unregister(hdmi->audio_pdev);
+}
+
 static int tegra_hdmi_init(struct host1x_client *client)
 {
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
@@ -1471,8 +1600,16 @@ static int tegra_hdmi_init(struct host1x_client *client)
 		goto disable_pll;
 	}
 
+	err = tegra_hdmi_codec_register(hdmi);
+	if (err < 0) {
+		dev_err(hdmi->dev, "failed to register audio codec: %d\n", err);
+		goto disable_vdd;
+	}
+
 	return 0;
 
+disable_vdd:
+	regulator_disable(hdmi->vdd);
 disable_pll:
 	regulator_disable(hdmi->pll);
 disable_hdmi:
@@ -1487,6 +1624,8 @@ static int tegra_hdmi_exit(struct host1x_client *client)
 {
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 
+	tegra_hdmi_codec_unregister(hdmi);
+
 	tegra_output_exit(&hdmi->output);
 
 	regulator_disable(hdmi->vdd);
@@ -1611,7 +1750,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 {
 	struct tegra_hdmi *hdmi = data;
 	u32 value;
-	int err;
 
 	value = tegra_hdmi_readl(hdmi, HDMI_NV_PDISP_INT_STATUS);
 	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_INT_STATUS);
@@ -1626,16 +1764,7 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 			format = value & SOR_AUDIO_HDA_CODEC_SCRATCH0_FMT_MASK;
 
 			tegra_hda_parse_format(format, &hdmi->format);
-
-			err = tegra_hdmi_setup_audio(hdmi);
-			if (err < 0) {
-				tegra_hdmi_disable_audio_infoframe(hdmi);
-				tegra_hdmi_disable_audio(hdmi);
-			} else {
-				tegra_hdmi_setup_audio_infoframe(hdmi);
-				tegra_hdmi_enable_audio_infoframe(hdmi);
-				tegra_hdmi_enable_audio(hdmi);
-			}
+			tegra_hdmi_reconfigure_audio(hdmi);
 		} else {
 			tegra_hdmi_disable_audio_infoframe(hdmi);
 			tegra_hdmi_disable_audio(hdmi);
@@ -1662,6 +1791,8 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	hdmi->stereo = false;
 	hdmi->dvi = false;
 
+	mutex_init(&hdmi->audio_lock);
+
 	hdmi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(hdmi->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-- 
2.33.1

