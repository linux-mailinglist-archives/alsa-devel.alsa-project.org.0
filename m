Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93081466855
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Dec 2021 17:30:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32B3D2926;
	Thu,  2 Dec 2021 17:29:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32B3D2926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638462635;
	bh=MwCv8nT8asEA5n7p2B6n4GAFbB9Zh46uYVRS9PsR/+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2usZYQSZwSXYyYgWOplx7pFdbBPj0oQQRJoEJvxbtG61S2+Z+LMYCZ0EWGj8kR2F
	 ERJ/EwOEsNWnfl84roqHPJe0HUT7wi1Muxz+BqhVqa0ibtdphPWOMFWfittDe+x9g6
	 E2MhF4JqooGjc9fafMoa2Tld1TannjA+31lrfof0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87969F80542;
	Thu,  2 Dec 2021 17:25:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E9940F80510; Thu,  2 Dec 2021 17:25:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76A9AF804FD
 for <alsa-devel@alsa-project.org>; Thu,  2 Dec 2021 17:25:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76A9AF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="iUIrAIRl"
Received: by mail-lf1-x129.google.com with SMTP id k37so72850724lfv.3
 for <alsa-devel@alsa-project.org>; Thu, 02 Dec 2021 08:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSjFB49gbB2f+fQJJWWmO/v+TRpxSfz0h1BJe46+OzM=;
 b=iUIrAIRlFAG150Q/UP7IOsrYF3Hvm77kJBYW5b5gcnxY2QK0R044N9kEY5OGO/qBNM
 f7Fyn/tHOBjU5G8Ni2wr53F5rJ4HP4knC34nPt0lgcXyb8HHsk+P021hVNDBAcnNGpLZ
 bs8rreLAsEPaH/J4eR4D76bKBptyticpAiD5VKI6fGL92evymsbAJKE5lSVqL5Ji9Yua
 5a4q1dvDdVh0ISwiPHpHmQ7AEKaIkAGtG6Laq0c/nQSOCwcl5pz6Qs/4h/Sg02LutG3L
 TxIS3rXTTXJk+jH4vW8kru9FcxRAWHzQR5eKNKakgftBKoPZYIUN560cdGqZF8WxBihp
 ksZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSjFB49gbB2f+fQJJWWmO/v+TRpxSfz0h1BJe46+OzM=;
 b=UFXNIOJ2P39qlH3WwN4TKWGc8rjgCIKsZGJlMoHAtEJAI9Dc9/Affnoi5HknDrAcTZ
 td7Q4cVStahX3SIczCA3qHVB6Eldqf3Lie/+fqZ9jkNv3fLeI4flkHqeqbWwG+BT7jwH
 jiI/58WZ+TejkTEGZLWcHINI8hgVIiGRmuWLQwCjOs/qdEvvUbgCME5d0k2CtCqek3Fy
 O6hOEBpSaWXWBJoSa87TxiRedetRBmT2QvKc+B8SvrD7sMgE87anqXT4J3tEzQNFDL/G
 j+E4p05NfDU49PskCt7ZKRM8dVJ/hfrgmWbJiRvNLj2wRIILOaDSMVK68/VrtD/T3jp+
 QQYQ==
X-Gm-Message-State: AOAM531RoFyJ3kkYPz1wX65ByZyvISlb7ux45zpihUv24Mmr379yeHMI
 tyOdzauUxafhQWlgw38JSISTf2z1+cw=
X-Google-Smtp-Source: ABdhPJzT1tt2KTShQ8SFdd7DzsRVqXKGwUWhkOIQyvqONwMZLZ+K/6Vd7NUHgtAYeU26922aSAyOSQ==
X-Received: by 2002:a05:6512:3192:: with SMTP id
 i18mr12911148lfe.205.1638462325636; 
 Thu, 02 Dec 2021 08:25:25 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id d18sm36806lfl.30.2021.12.02.08.25.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 08:25:25 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 10/20] ASoC: tegra20: spdif: Reset hardware
Date: Thu,  2 Dec 2021 19:23:31 +0300
Message-Id: <20211202162341.1791-11-digetx@gmail.com>
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

