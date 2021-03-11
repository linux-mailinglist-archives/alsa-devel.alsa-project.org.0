Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF2337B46
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Mar 2021 18:44:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344D51721;
	Thu, 11 Mar 2021 18:44:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344D51721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615484696;
	bh=4Do8m4M0qAJ0NYIgTW+FYixwJg7MaUOrw2wPRgVG6Bs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hxj6R3zpqKNMKs8BpLGfbXJdZcYlKcT2iUDd3FJOHKmqH8n1wSBHlxprPJ6Y9Coba
	 /IXJMtNysyAC6yuh584kLqmnrIXJghxXR2MGjTxRjhLilShg2l0dnStZo72SO8cWnH
	 lNnm8SkAHxHMFFaH8RIlU7W18eFP7nEwqv3Sj/Go=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFED3F80275;
	Thu, 11 Mar 2021 18:43:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9F1ADF80275; Thu, 11 Mar 2021 18:43:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDBCAF800BF
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 18:43:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDBCAF800BF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Oo8FyoG7"
Received: by mail-lf1-x12e.google.com with SMTP id u4so41202854lfs.0
 for <alsa-devel@alsa-project.org>; Thu, 11 Mar 2021 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
 b=Oo8FyoG74UY6khXJw001bnNsUEzVJmthtgVa72zwl0B21I4U4yuSfHEpVh1Tg90cxb
 hhh4GZEsSJa/UcyukKDTVCHjQcxrkpUjh48wA3bJ6uLc33ryaufMWAfjD2crcn6RpuCZ
 F1DxY50VpQByZuszT/Kjlw4Ehig+N7MZn4zDzZ3+EXaZDoCGEFR4qfHJolxNCPZTKVkN
 hP5wh4M2Nn/B3u6a16IYjBpId/j/ep3+HAd1/NgxudGHSXcUlgudG0LBrz7kzvPszAMh
 zdFDu+4pgmTgak6ZwEb2YWO5o9bJXeuAAAFw8WDPyxP4ouTjNffZyex3rxZtRO0kKuEc
 4B2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eHJDWKwpMM6cb9JU11x1wUIhvtQqgROewecwtgVy2N0=;
 b=a/CbwT7OypPwQVVO1IDuiFmYk+TGZSusNFfoVrOM3e6AHDHILzhMMtUXSPp3sSgqmo
 lwDXXsmfFGkfh+D+5MZfHWe2GctGMUh5i0PV/a6RPU9uZ0gM0k7fmVE2524lxVfJ88sk
 9/MLc8jV/1aYks/drKsbm/RDhudztB8y9evcZiA4XsvSB2KZD0KN4MhTUddPBDqkM8wH
 +YXiTl7JEN2trH7sdgeN9MaXjXoRAr2rTUjwGKqvK83WZYIS6hd4mFNApXHTQYQqcWkD
 bXs+/sM1H6U+ayuxS4HQPW0bh5X9egXty0qx6OIK2sl5gXmWJxcoiEDUFsNGCfsSasyw
 Eqtg==
X-Gm-Message-State: AOAM531/8wvmH1EuLU+A0s2kGeQQhofMx6jHNctbKRosTB19nS9udJFu
 ngLfbZ5qQpR8gn75422qP3k=
X-Google-Smtp-Source: ABdhPJwjr3vVXZN9uXoOC8Wd43GEhHXuWl10o49dbqFbet8fNjmYUTrDD7/t8JGP6cIp6uIB7HI0vA==
X-Received: by 2002:a05:6512:ad4:: with SMTP id
 n20mr3022328lfu.507.1615484592811; 
 Thu, 11 Mar 2021 09:43:12 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id g10sm1021245lfe.90.2021.03.11.09.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 09:43:12 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Fertser <fercerpav@gmail.com>
Subject: [PATCH v3 1/5] ASoC: tegra20: ac97: Add reset control
Date: Thu, 11 Mar 2021 20:42:58 +0300
Message-Id: <20210311174302.15430-2-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311174302.15430-1-digetx@gmail.com>
References: <20210311174302.15430-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Tegra20 AC97 driver doesn't manage the AC97 controller reset, relying on
implicit deassertion of the reset by tegra-clk driver, which needs to be
fixed since this behaviour is unacceptable by other Tegra drivers. Add
explicit reset control to the Tegra20 AC97 driver.

Note that AC97 reset was always specified in Tegra20 device-tree, hence
DTB ABI changes aren't required.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 sound/soc/tegra/tegra20_ac97.c | 21 +++++++++++++++++++++
 sound/soc/tegra/tegra20_ac97.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 06c728ae17ed..c454a34c15c4 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -313,6 +314,12 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	}
 	dev_set_drvdata(&pdev->dev, ac97);
 
+	ac97->reset = devm_reset_control_get_exclusive(&pdev->dev, "ac97");
+	if (IS_ERR(ac97->reset)) {
+		dev_err(&pdev->dev, "Can't retrieve ac97 reset\n");
+		return PTR_ERR(ac97->reset);
+	}
+
 	ac97->clk_ac97 = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(ac97->clk_ac97)) {
 		dev_err(&pdev->dev, "Can't retrieve ac97 clock\n");
@@ -364,12 +371,26 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 	ac97->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	ac97->playback_dma_data.maxburst = 4;
 
+	ret = reset_control_assert(ac97->reset);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to assert AC'97 reset: %d\n", ret);
+		goto err_clk_put;
+	}
+
 	ret = clk_prepare_enable(ac97->clk_ac97);
 	if (ret) {
 		dev_err(&pdev->dev, "clk_enable failed: %d\n", ret);
 		goto err_clk_put;
 	}
 
+	usleep_range(10, 100);
+
+	ret = reset_control_deassert(ac97->reset);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to deassert AC'97 reset: %d\n", ret);
+		goto err_clk_disable_unprepare;
+	}
+
 	ret = snd_soc_set_ac97_ops(&tegra20_ac97_ops);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to set AC'97 ops: %d\n", ret);
diff --git a/sound/soc/tegra/tegra20_ac97.h b/sound/soc/tegra/tegra20_ac97.h
index e467cd1ff2ca..870ea09ff301 100644
--- a/sound/soc/tegra/tegra20_ac97.h
+++ b/sound/soc/tegra/tegra20_ac97.h
@@ -78,6 +78,7 @@ struct tegra20_ac97 {
 	struct clk *clk_ac97;
 	struct snd_dmaengine_dai_dma_data capture_dma_data;
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
+	struct reset_control *reset;
 	struct regmap *regmap;
 	int reset_gpio;
 	int sync_gpio;
-- 
2.29.2

