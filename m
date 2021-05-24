Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DF638F1D0
	for <lists+alsa-devel@lfdr.de>; Mon, 24 May 2021 18:53:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71F7B847;
	Mon, 24 May 2021 18:52:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71F7B847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621875200;
	bh=PA2ZJtJu5FvaYgqfyRaGISyB3udu9TlbEn3mkm4RUVQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sz2tm7GT8essQUBy4vafwL3kSMmLA+4IoFsBfrhvyVsqTMIjdoGtSIScZn3BJGxrl
	 kmfISK/9E/GH921OCRcJJ2MA/tJbcVFq84PQfSUqVwL2XcD5LTQx83pEgXKytcr8v+
	 izuAy4W7G/HoL78vvqheu2JnU6F3Fjp50qoO+bLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D24CEF8021D;
	Mon, 24 May 2021 18:51:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A655F8022B; Mon, 24 May 2021 18:51:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCEB6F80137
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 18:51:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCEB6F80137
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="Q++a7kWP"
Received: by mail-wr1-x435.google.com with SMTP id a4so29276461wrr.2
 for <alsa-devel@alsa-project.org>; Mon, 24 May 2021 09:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OfK3W2kSFwwGuWi4vFr85BfkbXEQ0phvVmMJ4aau6FI=;
 b=Q++a7kWPHrbd5Ig+lm9R4GaLDeuUBvYSF8CrEqh1qIzCKEC0IACB2VeZjXULd2/oqD
 SyqPf+BzdNeJmqc5H8a1yaul5o/9Ulfxu8u8VvfL2IYoiOMgaLy1mwCrmf+UqcvgGI2E
 jRJJf2pm2gJrGPwPYYSggBkCIl8by3qhj4Opny8AKoAHcQi02mz4o58EPNlUE/SoB4pP
 JEWcrvi+EsClL85BMJG8r9M2lslD3TOkxBHbsQMVXBf9Fw85R/oQx6leCnpSruP9W3X/
 yOt9RmBuHiq3Vo/60qod8D1BZfKuoZtBOFziEt+TwdKaTGhB43JU6xdbv+aOArXprOJk
 R8ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OfK3W2kSFwwGuWi4vFr85BfkbXEQ0phvVmMJ4aau6FI=;
 b=bbKPK7xVS2pyt1QJrpsvu0zeUpcwRYwthdsRj+Smhl9OjWC7MDxeJ09lEzyN2+nH6/
 4ZlNNhdfOqqqYXn8kjbfzSCjxJSNaiz6jHBedU5/0N9ckdmfrMFHBXEjO9ytLwIR2YuU
 ishKd/n8HNxcpo8JtAZ++fpxHJ5jUTbqUUyQMymgcj4bkY2v4/bQ/60n50XtHHa5hbUf
 FFLVhCNXYuUz+QGzdlzsHaop5Kq/M9tLA86LbfFULOXvotEyQj1sW2mOJtMCpeH52MNl
 VFVIz/1KSX8gdueqVPd2s8Jab8uI+pFLt0FrFOlVDJIAHg4pSf0VtsZqjSpj3iNpzAsx
 qBUQ==
X-Gm-Message-State: AOAM533eJSHG9+HTe8cbOiFhqT4aA/tCYQY8bWO7x8L0ErVaKZZjTVkl
 hQ3ueKuoegTTmSm8QGeRL8jZTw==
X-Google-Smtp-Source: ABdhPJzM6JASMABcQAzPlI+JDMwyyF8NkvWxOMqCfPg9+TtaETgNe5w+4vrpdIhSbf3gARZwA+a+ZQ==
X-Received: by 2002:adf:d1ec:: with SMTP id g12mr23302827wrd.294.1621875101594; 
 Mon, 24 May 2021 09:51:41 -0700 (PDT)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net.
 [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id y20sm486908wmi.0.2021.05.24.09.51.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:51:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: meson: use dev_err_probe
Date: Mon, 24 May 2021 18:51:36 +0200
Message-Id: <20210524165136.400702-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.32.0.rc0
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
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

Use dev_err_probe() helper function to handle probe deferral.
It removes the open coded test for -EPROBE_DEFER but more importantly, it
sets the deferral reason in debugfs which is great for debugging.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu.c               | 17 +++++++----------
 sound/soc/meson/axg-fifo.c          | 11 +++++------
 sound/soc/meson/axg-pdm.c           |  9 +++------
 sound/soc/meson/axg-spdifin.c       |  6 ++----
 sound/soc/meson/axg-spdifout.c      |  6 ++----
 sound/soc/meson/axg-tdm-formatter.c | 18 ++++++------------
 sound/soc/meson/axg-tdm-interface.c | 10 ++++------
 sound/soc/meson/meson-card-utils.c  |  4 ++--
 sound/soc/meson/t9015.c             |  7 +++----
 9 files changed, 34 insertions(+), 54 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index ba15d5762b0b..37036adf14ce 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -219,31 +219,29 @@ static int aiu_clk_get(struct device *dev)
 
 	aiu->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(aiu->pclk)) {
-		if (PTR_ERR(aiu->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu pclk\n");
+		dev_err_probe(dev, PTR_ERR(aiu->pclk),
+			      "Can't get the aiu pclk\n");
 		return PTR_ERR(aiu->pclk);
 	}
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
 	if (IS_ERR(aiu->spdif_mclk)) {
-		if (PTR_ERR(aiu->spdif_mclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu spdif master clock\n");
+		dev_err_probe(dev, PTR_ERR(aiu->spdif_mclk),
+			      "Can't get the aiu spdif master clock\n");
 		return PTR_ERR(aiu->spdif_mclk);
 	}
 
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the i2s clocks\n");
+		dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
 		return ret;
 	}
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the spdif clocks\n");
+		dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 		return ret;
 	}
 
@@ -282,8 +280,7 @@ static int aiu_probe(struct platform_device *pdev)
 
 	ret = device_reset(dev);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to reset device\n");
+		dev_err_probe(dev, ret, "Failed to reset device\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b9af2d513e09..d670a32d56ab 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -352,17 +352,16 @@ int axg_fifo_probe(struct platform_device *pdev)
 
 	fifo->pclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(fifo->pclk)) {
-		if (PTR_ERR(fifo->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %ld\n",
-				PTR_ERR(fifo->pclk));
+		dev_err_probe(dev, PTR_ERR(fifo->pclk),
+			      "failed to get pclk: %ld\n", PTR_ERR(fifo->pclk));
 		return PTR_ERR(fifo->pclk);
 	}
 
 	fifo->arb = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(fifo->arb)) {
-		if (PTR_ERR(fifo->arb) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get arb reset: %ld\n",
-				PTR_ERR(fifo->arb));
+		dev_err_probe(dev, PTR_ERR(fifo->arb),
+			      "failed to get arb reset: %ld\n",
+			      PTR_ERR(fifo->arb));
 		return PTR_ERR(fifo->arb);
 	}
 
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index bfd37d49a73e..f630311b5b29 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -613,24 +613,21 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk: %d\n", ret);
 		return ret;
 	}
 
 	priv->dclk = devm_clk_get(dev, "dclk");
 	if (IS_ERR(priv->dclk)) {
 		ret = PTR_ERR(priv->dclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk: %d\n", ret);
 		return ret;
 	}
 
 	priv->sysclk = devm_clk_get(dev, "sysclk");
 	if (IS_ERR(priv->sysclk)) {
 		ret = PTR_ERR(priv->sysclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d0d09f945b48..8f587c3bb5d7 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -481,16 +481,14 @@ static int axg_spdifin_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk: %d\n", ret);
 		return ret;
 	}
 
 	priv->refclk = devm_clk_get(dev, "refclk");
 	if (IS_ERR(priv->refclk)) {
 		ret = PTR_ERR(priv->refclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index e769a5ee6e27..58e02f6898b7 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -424,16 +424,14 @@ static int axg_spdifout_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk: %d\n", ret);
 		return ret;
 	}
 
 	priv->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(priv->mclk)) {
 		ret = PTR_ERR(priv->mclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index cab7fa2851aa..108f11e14006 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -284,8 +284,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(formatter->pclk)) {
 		ret = PTR_ERR(formatter->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk: %d\n", ret);
 		return ret;
 	}
 
@@ -293,8 +292,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(formatter->sclk)) {
 		ret = PTR_ERR(formatter->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk: %d\n", ret);
 		return ret;
 	}
 
@@ -302,8 +300,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(formatter->lrclk)) {
 		ret = PTR_ERR(formatter->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk: %d\n", ret);
 		return ret;
 	}
 
@@ -311,8 +308,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk_sel = devm_clk_get(dev, "sclk_sel");
 	if (IS_ERR(formatter->sclk_sel)) {
 		ret = PTR_ERR(formatter->sclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk_sel: %d\n", ret);
 		return ret;
 	}
 
@@ -320,8 +316,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk_sel = devm_clk_get(dev, "lrclk_sel");
 	if (IS_ERR(formatter->lrclk_sel)) {
 		ret = PTR_ERR(formatter->lrclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk_sel: %d\n", ret);
 		return ret;
 	}
 
@@ -329,8 +324,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get reset: %d\n", ret);
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 87cac440b369..a2c7f658f6b4 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -519,8 +519,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(iface->sclk)) {
 		ret = PTR_ERR(iface->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk: %d\n", ret);
 		return ret;
 	}
 
@@ -528,8 +527,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(iface->lrclk)) {
 		ret = PTR_ERR(iface->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk: %d\n", ret);
 		return ret;
 	}
 
@@ -545,8 +543,8 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 		if (ret == -ENOENT) {
 			iface->mclk = NULL;
 		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to get mclk: %d\n", ret);
+			dev_err_probe(dev, ret, "failed to get mclk: %d\n",
+				      ret);
 			return ret;
 		}
 	}
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 300ac8be46ef..ac062c03cf33 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -86,8 +86,8 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 	ret = of_parse_phandle_with_args(node, "sound-dai",
 					 "#sound-dai-cells", 0, &args);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(card->dev, "can't parse dai %d\n", ret);
+		dev_err_probe(card->dev, ret,
+			      "can't parse sound-dai at %pOFn\n", node);
 		return ret;
 	}
 	*dai_of_node = args.np;
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 4c1349dd1e06..7ff16f51dbd4 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -259,15 +259,14 @@ static int t9015_probe(struct platform_device *pdev)
 
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
-		if (PTR_ERR(priv->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get core clock\n");
+		dev_err_probe(dev, PTR_ERR(priv->pclk),
+			      "failed to get core clock\n");
 		return PTR_ERR(priv->pclk);
 	}
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
 	if (IS_ERR(priv->avdd)) {
-		if (PTR_ERR(priv->avdd) != -EPROBE_DEFER)
-			dev_err(dev, "failed to AVDD\n");
+		dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 		return PTR_ERR(priv->avdd);
 	}
 
-- 
2.32.0.rc0

