Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B63A145CFDF
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 23:12:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54ED61840;
	Wed, 24 Nov 2021 23:11:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54ED61840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637791938;
	bh=BdTPIEKRC2U+bwp0Jp1MyNUSPqFlgUK5ZT30uDb8w2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O6hvclfd6meSoQ/TowhpeBbUpkC6y5BIcqwodGSIYXZ86lvbeFDtTvHvtk4kzdMUV
	 KfwYs1U+iuU2tLRtUBvaV1QdCFDk20tS7v1Z45kiaIcIrfq2U5EhOfPE8zlQVeT+7U
	 a/DomFQ/CGVX1P2F3pqX+7MDjL0PfUluRHAcxjsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23788F8053E;
	Wed, 24 Nov 2021 23:07:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67395F80539; Wed, 24 Nov 2021 23:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4590F804FD
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 23:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4590F804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Jv/wwOY2"
Received: by mail-lj1-x22c.google.com with SMTP id t11so8394928ljh.6
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 14:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfCGGQxmJYAAbJN5Gn/Us5aT7XWQ41BpqEskSKXA+Zs=;
 b=Jv/wwOY2Bu+5aeNm8yAHlc5wAIxwBlz1dISKQoDftg2gCxX3GJdDc6uONTqTDvDEW3
 ZdWSQ4e2TFq+YKys32AwR7ty+e5Q/RfOLunheKXInZWTuwJ5JrmKn7+6/Fa69LI1mCOA
 lsuDrAIPakqlx/YuXeZB81cK+hpJ49QNzICwMntvOYzwjc2CT87+BYqYBK7zx6ds76Fh
 q5CSb+QwdqJRFl3L09fNxNQZwFYTRRS5/4+WdVSm/v4waFlTh1T2HrldRxEbXwS52tP3
 UZyCD6nUanYaL/pgZ3SqGigPYiSzwal7VQzDd9/HEAC+3AhOHl7YwSiebKx4jjP722MR
 VOeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfCGGQxmJYAAbJN5Gn/Us5aT7XWQ41BpqEskSKXA+Zs=;
 b=WTIltBbqgGZlTXCiJd6eNIMiCnnLjLQeoC4Xmc0pvR5qT2NJuHVwnTjStJubxMMrCa
 wt0CFmf5OuDuWjob4gvNueQyHSyBkrJ69hRrW9sdGC0fAS91HEkRBsK+kT8fiWIELKyj
 +Lz8wX8ePeSEbO3+mfc84M6jx2S9Dacc6nrytL1MI41UY1euOR7OfxrRpYrbAguqMjz7
 Mn8oHy+rCneRavDjFoCzqydmL8fdowbKMEpL37lN2I7ERu+s6NIn0RCqObr+WCCvf0Pw
 KMCVbwwcqLwXokOXhlYpUUbuFPfKAWefFuqOkb/iiLTEUzRRk7DbhMlEMDqiuHGIZGfK
 8x8A==
X-Gm-Message-State: AOAM533SYoh9IHEscyWqWFiueoK59pgLET1rsWqhI+GXrJPOxuf9etTk
 E7L55yUogrBmRIVEYXoU/cUT1UJEEO8=
X-Google-Smtp-Source: ABdhPJwO+XbsIalbBsR68blY1jAQ8EeqhM7BySHdgJLmgm6yhrIxGHjg0nvSGHIxu2kdNY4V0NjKyg==
X-Received: by 2002:a2e:8686:: with SMTP id l6mr20767449lji.520.1637791602967; 
 Wed, 24 Nov 2021 14:06:42 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id w17sm93266ljh.15.2021.11.24.14.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 14:06:42 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 15/20] drm/tegra: hdmi: Register audio CODEC on Tegra20
Date: Thu, 25 Nov 2021 01:00:52 +0300
Message-Id: <20211124220057.15763-16-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211124220057.15763-1-digetx@gmail.com>
References: <20211124220057.15763-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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
index 142ad696426f..a99861f95e89 100644
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
@@ -1663,6 +1792,8 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	hdmi->stereo = false;
 	hdmi->dvi = false;
 
+	mutex_init(&hdmi->audio_lock);
+
 	hdmi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(hdmi->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-- 
2.33.1

