Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68382462FD7
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Nov 2021 10:38:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8D2E1F20;
	Tue, 30 Nov 2021 10:37:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8D2E1F20
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638265087;
	bh=moQXP0/VOy0m4J8LilgThWfvufC6wrkFUMfeudpuK4I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PbRlzT8c5IsUyyDnJXE07RDGEm5QRm8c3j/bk69DikK+DPxqUGLnHOQM+d5Pb6Ehg
	 mTdR2elAuJvwmAA4b8WUaL+CRNOcXjQkaJgKqyPC+ZLlbNXt1qA5QDkVW97zHUtwJa
	 vU6T4VjrgBPJMRQFQfLgbQBz9j7kSeu2LNGE7I5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F141BF80113;
	Tue, 30 Nov 2021 10:36:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5A1F80290; Tue, 30 Nov 2021 10:36:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B61C4F80113
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 10:36:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B61C4F80113
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="2IdOOZmi"
Received: by mail-wr1-x431.google.com with SMTP id u1so42913089wru.13
 for <alsa-devel@alsa-project.org>; Tue, 30 Nov 2021 01:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47M4CeI2s3Mt/JfEFWeyA3Sfx5BoCCk69AD+rdY2VPI=;
 b=2IdOOZmiuEmP+sCasWKkQ/NpqMWXyK7+bCohfgalZnWReMCVd1AzKWhiHcF2+5LG9L
 lJWug5XIMrgXLE0wcwr0hv8nQax7mj5XnfoV4doI+Tf2gWhafDiR/2PglGsrBWBlV1db
 WOqS16w/hRf9Rv/3JU/QwtFJ09QoTJv3xuBdV38qLgp/V7r6F6riLGeKCpuvD7bW9LRo
 2cNf7+iZTV9ULn5YFRtGOWpHH4x0djUFxjWR8HxD/ooeE2sIBvK+W3KILSqLai7rqqVU
 TNjInRa3VeVCytClBTdkpCQCMYs1K97RjFCRLY4NThWrt3lUyfM09VcLHzLRvxeZPnjN
 3MQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47M4CeI2s3Mt/JfEFWeyA3Sfx5BoCCk69AD+rdY2VPI=;
 b=8LvrEF5c1oIXb7UWiCKgZTqDlmUe1nyQCDwQ98+A5zLRWYH4DDTgMA2r3eydYn/fKc
 UAvzHvNAbLa46j+8BZv7KlJVwm3zJCKEwKwsBQp1eEZzIdQBG9ni3tw7ShCxEYpLAXhO
 bxpt0E/rIXxEre41mdd0SLY8DsFPNDqJ7A/aMFvUp5DzN7WvEHWPuotEBd7BNlQDdngO
 Iardgm+DfwvY99LWtepz4q634nXNzIbZUkBa7a8/Z3azRF+q1Qobmrl6u6Rv9xfTS29O
 mVZRClBi12m98NcEU3hJ7OGdDNP5FKbX4dn+jZMW3LmoSqz5dCduK18DInhRiQVK99Zq
 2yqg==
X-Gm-Message-State: AOAM530ZC0cKDgf4Zl7J0QuRmKHdB3GIpmB6liF9Xs+sQ4Eu41SDjKXK
 raKMy/j6+fFjWdjkXghX4zVt48bXYBXBjQ==
X-Google-Smtp-Source: ABdhPJx5ChsKLLJF6h5b0vhOCAm/Hh/QEY02pbVu8kVw5p0mDlM16fey223AnlVsRDKdt8O+MChntQ==
X-Received: by 2002:adf:fb82:: with SMTP id a2mr38970692wrr.168.1638264999783; 
 Tue, 30 Nov 2021 01:36:39 -0800 (PST)
Received: from jackdaw.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.googlemail.com with ESMTPSA id t11sm16255000wrz.97.2021.11.30.01.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:36:39 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: meson: use dev_err_probe
Date: Tue, 30 Nov 2021 10:36:17 +0100
Message-Id: <20211130093617.103147-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.34.0
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
 sound/soc/meson/axg-fifo.c          |  9 +++------
 sound/soc/meson/axg-pdm.c           |  9 +++------
 sound/soc/meson/axg-spdifin.c       |  6 ++----
 sound/soc/meson/axg-spdifout.c      |  6 ++----
 sound/soc/meson/axg-tdm-formatter.c | 18 ++++++------------
 sound/soc/meson/axg-tdm-interface.c |  9 +++------
 sound/soc/meson/meson-card-utils.c  |  4 ++--
 sound/soc/meson/t9015.c             |  8 ++++----
 9 files changed, 32 insertions(+), 54 deletions(-)

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
index b9af2d513e09..8d3184aeba60 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -352,17 +352,14 @@ int axg_fifo_probe(struct platform_device *pdev)
 
 	fifo->pclk = devm_clk_get(dev, NULL);
 	if (IS_ERR(fifo->pclk)) {
-		if (PTR_ERR(fifo->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %ld\n",
-				PTR_ERR(fifo->pclk));
+		dev_err_probe(dev, PTR_ERR(fifo->pclk), "failed to get pclk\n");
 		return PTR_ERR(fifo->pclk);
 	}
 
 	fifo->arb = devm_reset_control_get_exclusive(dev, NULL);
 	if (IS_ERR(fifo->arb)) {
-		if (PTR_ERR(fifo->arb) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get arb reset: %ld\n",
-				PTR_ERR(fifo->arb));
+		dev_err_probe(dev, PTR_ERR(fifo->arb),
+			      "failed to get arb reset\n");
 		return PTR_ERR(fifo->arb);
 	}
 
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index bfd37d49a73e..9537fbcf56e0 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -613,24 +613,21 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->dclk = devm_clk_get(dev, "dclk");
 	if (IS_ERR(priv->dclk)) {
 		ret = PTR_ERR(priv->dclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk\n");
 		return ret;
 	}
 
 	priv->sysclk = devm_clk_get(dev, "sysclk");
 	if (IS_ERR(priv->sysclk)) {
 		ret = PTR_ERR(priv->sysclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get dclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d0d09f945b48..e10bc9352667 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -481,16 +481,14 @@ static int axg_spdifin_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->refclk = devm_clk_get(dev, "refclk");
 	if (IS_ERR(priv->refclk)) {
 		ret = PTR_ERR(priv->refclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index e769a5ee6e27..179654d76c8f 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -424,16 +424,14 @@ static int axg_spdifout_probe(struct platform_device *pdev)
 	priv->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(priv->pclk)) {
 		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
 	priv->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(priv->mclk)) {
 		ret = PTR_ERR(priv->mclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get mclk\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index cab7fa2851aa..b8bbeda87a72 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -284,8 +284,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->pclk = devm_clk_get(dev, "pclk");
 	if (IS_ERR(formatter->pclk)) {
 		ret = PTR_ERR(formatter->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get pclk\n");
 		return ret;
 	}
 
@@ -293,8 +292,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(formatter->sclk)) {
 		ret = PTR_ERR(formatter->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk\n");
 		return ret;
 	}
 
@@ -302,8 +300,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(formatter->lrclk)) {
 		ret = PTR_ERR(formatter->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk\n");
 		return ret;
 	}
 
@@ -311,8 +308,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->sclk_sel = devm_clk_get(dev, "sclk_sel");
 	if (IS_ERR(formatter->sclk_sel)) {
 		ret = PTR_ERR(formatter->sclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk_sel\n");
 		return ret;
 	}
 
@@ -320,8 +316,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->lrclk_sel = devm_clk_get(dev, "lrclk_sel");
 	if (IS_ERR(formatter->lrclk_sel)) {
 		ret = PTR_ERR(formatter->lrclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk_sel: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk_sel\n");
 		return ret;
 	}
 
@@ -329,8 +324,7 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
 	if (IS_ERR(formatter->reset)) {
 		ret = PTR_ERR(formatter->reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get reset\n");
 		return ret;
 	}
 
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index db077773af7a..8f8b126de158 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -535,8 +535,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->sclk = devm_clk_get(dev, "sclk");
 	if (IS_ERR(iface->sclk)) {
 		ret = PTR_ERR(iface->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get sclk\n");
 		return ret;
 	}
 
@@ -544,8 +543,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->lrclk = devm_clk_get(dev, "lrclk");
 	if (IS_ERR(iface->lrclk)) {
 		ret = PTR_ERR(iface->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to get lrclk\n");
 		return ret;
 	}
 
@@ -561,8 +559,7 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 		if (ret == -ENOENT) {
 			iface->mclk = NULL;
 		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to get mclk: %d\n", ret);
+			dev_err_probe(dev, ret, "failed to get mclk\n");
 			return ret;
 		}
 	}
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 29b0174f4b5c..cc6e16e31f9c 100644
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
index 4c1349dd1e06..7a0a807f494c 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -259,15 +259,15 @@ static int t9015_probe(struct platform_device *pdev)
 
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
+		dev_err_probe(dev, PTR_ERR(priv->avdd),
+			      "failed to get AVDD\n");
 		return PTR_ERR(priv->avdd);
 	}
 
-- 
2.34.0

