Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955F4685B3
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Dec 2021 15:42:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6C9A245F;
	Sat,  4 Dec 2021 15:42:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6C9A245F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638628974;
	bh=MwCv8nT8asEA5n7p2B6n4GAFbB9Zh46uYVRS9PsR/+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGR87pMWslDHEvFvP7FsxcjLk5Tw1DFBfwd84i54B8qu7l5+aaKK5pI1W+HV2k0VL
	 OC3ujL+IBz7nfuPzfk/Euj0byfFOn5dnSJeFOamdgV7GztHmdzmdjihaVudQxmMBN0
	 carIU9Ww61qf7NMImS9PmkAfACXc843Kv4s3SGUM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0E9C6F80542;
	Sat,  4 Dec 2021 15:38:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8832F80528; Sat,  4 Dec 2021 15:37:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5C355F804E4
 for <alsa-devel@alsa-project.org>; Sat,  4 Dec 2021 15:37:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C355F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="cEgwEMj9"
Received: by mail-lf1-x12d.google.com with SMTP id u3so13843456lfl.2
 for <alsa-devel@alsa-project.org>; Sat, 04 Dec 2021 06:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSjFB49gbB2f+fQJJWWmO/v+TRpxSfz0h1BJe46+OzM=;
 b=cEgwEMj9W1a/YeZ7WxGAAy8mxPRHPC8JYO027a7EZBGPZqwxGwkdfcva5EYSvcNt0z
 zQDWua8Blc8mooTD2CKDnpHrA1assl4Ne037m3vCtRtNlChUy/E/2vvpZDpRov5yaD2H
 5uGAwiFxg0LIlxcX7tnbF+kLJj2aCDHpEmcafrXNXYjAHDQX0yCedDTlGUwQYlzWYIg5
 /Mk+e8GDWAkjxJoRKzRagFKOWrzsKAsYlBCDJ/xLvQVDIbNfLyDuDR4/Yc/TRlafyOwE
 6XZy0HEdn7JiA4OURdY9UCZmBsfsYFPy/E+E7aIuGucmWIYTOO/xva5+oZX53K2Dt5Xp
 1MIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSjFB49gbB2f+fQJJWWmO/v+TRpxSfz0h1BJe46+OzM=;
 b=qVRLmNHKVP0u51QIGs5cdt/kjS6yoEJ2skfyKWP+2pSfOei3QvDDwMnjxad1DLRXf5
 oZ+zUmbvyJTow7au2VN8lpHoUbYWLcQzyUPK+hMKwDZnYCiM7LM86XK1q/Ss4TSX177m
 pb17FfngTANdMufMy3UOqQZ9qRM/UL6JEV5xNGAB1L+j5qRDu7GM4pLEL3jS7oKczGNP
 hnqNkTYIFDnFqLzHagiCMOLaWjSq/46fmX2N0zPWwi2uOKe/hzX/GkcAP26zkJyChi0y
 w68dKipEw0qxn2PQKXRAv+U41sSCLba/kmTVf6nKzMhl27NSwmzXNsVog1lNqU6hiXkD
 wR+g==
X-Gm-Message-State: AOAM533RKi8Pe159i3zlRzN3Ml2l+iB7lEm27Gjxx9T/Cx3hgdhFxGH5
 9u0+sQPX3hnzjWmXJCTi3+VYdlOK3PM=
X-Google-Smtp-Source: ABdhPJx3Rc09ke2ooHghJt63sw7/8doQgtBD+kIz66rR6Kyzfxdj1uRFMyIp8vRWVPEsTUEOaEVcwQ==
X-Received: by 2002:ac2:4c81:: with SMTP id d1mr24285043lfl.588.1638628659547; 
 Sat, 04 Dec 2021 06:37:39 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id g36sm782934lfv.16.2021.12.04.06.37.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 06:37:39 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>
Subject: [PATCH v4 10/22] ASoC: tegra20: spdif: Reset hardware
Date: Sat,  4 Dec 2021 17:37:13 +0300
Message-Id: <20211204143725.31646-11-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204143725.31646-1-digetx@gmail.com>
References: <20211204143725.31646-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org
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

Reset S/PDIF controller on runtime PM suspend/resume to ensure that we
always have a consistent hardware state.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_spdif.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/tegra/tegra20_spdif.h |  1 +
 2 files changed, 33 insertions(+)

diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 7dd263721c2c..bc45a0a8afab 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -14,6 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -27,6 +29,8 @@ static __maybe_unused int tegra20_spdif_runtime_suspend(struct device *dev)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 
+	regcache_cache_only(spdif->regmap, true);
+
 	clk_disable_unprepare(spdif->clk_spdif_out);
 
 	return 0;
@@ -37,13 +41,35 @@ static __maybe_unused int tegra20_spdif_runtime_resume(struct device *dev)
 	struct tegra20_spdif *spdif = dev_get_drvdata(dev);
 	int ret;
 
+	ret = reset_control_assert(spdif->reset);
+	if (ret)
+		return ret;
+
 	ret = clk_prepare_enable(spdif->clk_spdif_out);
 	if (ret) {
 		dev_err(dev, "clk_enable failed: %d\n", ret);
 		return ret;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(spdif->reset);
+	if (ret)
+		goto disable_clocks;
+
+	regcache_cache_only(spdif->regmap, false);
+	regcache_mark_dirty(spdif->regmap);
+
+	ret = regcache_sync(spdif->regmap);
+	if (ret)
+		goto disable_clocks;
+
 	return 0;
+
+disable_clocks:
+	clk_disable_unprepare(spdif->clk_spdif_out);
+
+	return ret;
 }
 
 static int tegra20_spdif_hw_params(struct snd_pcm_substream *substream,
@@ -268,6 +294,12 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(&pdev->dev, spdif);
 
+	spdif->reset = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+	if (IS_ERR(spdif->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve spdif reset\n");
+		return PTR_ERR(spdif->reset);
+	}
+
 	spdif->clk_spdif_out = devm_clk_get(&pdev->dev, "out");
 	if (IS_ERR(spdif->clk_spdif_out)) {
 		dev_err(&pdev->dev, "Could not retrieve spdif clock\n");
diff --git a/sound/soc/tegra/tegra20_spdif.h b/sound/soc/tegra/tegra20_spdif.h
index 1973ffc2d5c7..ff4b79e2052f 100644
--- a/sound/soc/tegra/tegra20_spdif.h
+++ b/sound/soc/tegra/tegra20_spdif.h
@@ -451,6 +451,7 @@ struct tegra20_spdif {
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct regmap *regmap;
+	struct reset_control *reset;
 };
 
 #endif
-- 
2.33.1

