Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F4A473AAB
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:15:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77C91EF9;
	Tue, 14 Dec 2021 03:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77C91EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639448140;
	bh=QuW9LZxtU6gZmopXKfF1Lzyij+Xa4oggm4C7w9xhLGE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QpbSshSCQsdWNpggcCKHfhd0nb+7lrdOZ0YSImvA1XSfMk2I9OVPYYAgwoBPIyWWL
	 EZymWENkzIXBiz8GwVZkEqcYBx1gN+jbXr0wXtQsfsi0TXxirsQmhEk7yDiWc6NPF+
	 fgMQjqCiVMTORnjqCeOLbIf1dEf8TVGw8JFOeYD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A12CBF805A8;
	Tue, 14 Dec 2021 03:10:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 93549F8058C; Tue, 14 Dec 2021 03:10:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6DBB8F80535
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6DBB8F80535
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XRjKmSFG"
Received: by mail-pg1-x52e.google.com with SMTP id k4so16124323pgb.8
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wp45VQT5DqY04bk5bm0mAq3SR0p4/w1XHvrPZLjlHQk=;
 b=XRjKmSFGDbx7VBif50EghtqFPDh7TYK6II/ldYdKgyE6Z/WOIzIIWUNs+Eh9vFhfKo
 jykfqL9bolYRMP3pl1cvHfQ89J+V8QlF7sR/WtRQNHcvSmeDz0yqM0FF14pBEgk3DgZD
 NkCcmA+Fe5f2SbSBWadJk+yovIIj5ziF1cSDe2dXZLd0R/BMnZxmalShAHaIALgnh41a
 y38ggeouT034UsNlKpPcaZI/n3OQhIvjYP++IP+lXcpR+COWRojL+5VchTHWHmotGtm+
 kqETpWIfcSaoxKulAyBi3bZAOVb04VKhQ5qx3zN0fhC4Pn4aWlKoqwx31eMteDUrhLpE
 xXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=wp45VQT5DqY04bk5bm0mAq3SR0p4/w1XHvrPZLjlHQk=;
 b=6HWBu1HCEUQAfIUcLK201uUERv6BMkdvv+6fybAKk3Ep1ncOp22niNlFYeU28zbIke
 +TPg8EUiowrKmnHMVtFSlazbQSQAq3VRFPUeTS/KCAPDWJmpYX/D2aHSN6HnfTehOW1/
 89D+edF2vqGI/Rwd10wfH1aW406aHRb1tqzwmpAr5rCNQHfZDdr3irCec5fHlcJ/vmkw
 ddhoyaGrlDZxl8vzAYC/nU0hLatxrNNkQcD2vcdplk5xolZfjMeQnkWdcYa53nAM+LOf
 8iOhDcnb9zmVp9oeYbV659jYF5wJHqjiGyBXO7V3iwIeGrygMDpO+2gwmIRjuDzNI9gU
 /xEQ==
X-Gm-Message-State: AOAM530y+s2rVtuf/BDBMHxsJpugzp9flV/rdQypmuX3COdtBBpMaukH
 zfn8DetpgsPZ/meTVyosKM0=
X-Google-Smtp-Source: ABdhPJweHEQk2coBKEra7KFmdCsjezm/7dlycTmKDOfFjSJ5pX6fWY3CEsmN8K9fDf/9VbFeHr3oOw==
X-Received: by 2002:a63:6a87:: with SMTP id f129mr1665421pgc.391.1639447785475; 
 Mon, 13 Dec 2021 18:09:45 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:45 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 16/22] ASoC: meson: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:37 +0900
Message-Id: <20211214020843.2225831-17-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/aiu.c               | 36 +++++++--------------
 sound/soc/meson/axg-fifo.c          | 16 +++------
 sound/soc/meson/axg-pdm.c           | 25 ++++-----------
 sound/soc/meson/axg-spdifin.c       | 17 +++-------
 sound/soc/meson/axg-spdifout.c      | 17 +++-------
 sound/soc/meson/axg-tdm-formatter.c | 50 ++++++++---------------------
 sound/soc/meson/axg-tdm-interface.c | 25 ++++-----------
 sound/soc/meson/meson-card-utils.c  |  8 ++---
 sound/soc/meson/t9015.c             | 14 +++-----
 9 files changed, 56 insertions(+), 152 deletions(-)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index ba15d5762b0b..d299a70db7e5 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -218,34 +218,23 @@ static int aiu_clk_get(struct device *dev)
 	int ret;
 
 	aiu->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(aiu->pclk)) {
-		if (PTR_ERR(aiu->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu pclk\n");
-		return PTR_ERR(aiu->pclk);
-	}
+	if (IS_ERR(aiu->pclk))
+		return dev_err_probe(dev, PTR_ERR(aiu->pclk), "Can't get the aiu pclk\n");
 
 	aiu->spdif_mclk = devm_clk_get(dev, "spdif_mclk");
-	if (IS_ERR(aiu->spdif_mclk)) {
-		if (PTR_ERR(aiu->spdif_mclk) != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the aiu spdif master clock\n");
-		return PTR_ERR(aiu->spdif_mclk);
-	}
+	if (IS_ERR(aiu->spdif_mclk))
+		return dev_err_probe(dev, PTR_ERR(aiu->spdif_mclk),
+				     "Can't get the aiu spdif master clock\n");
 
 	ret = aiu_clk_bulk_get(dev, aiu_i2s_ids, ARRAY_SIZE(aiu_i2s_ids),
 			       &aiu->i2s);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the i2s clocks\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't get the i2s clocks\n");
 
 	ret = aiu_clk_bulk_get(dev, aiu_spdif_ids, ARRAY_SIZE(aiu_spdif_ids),
 			       &aiu->spdif);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Can't get the spdif clocks\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Can't get the spdif clocks\n");
 
 	ret = clk_prepare_enable(aiu->pclk);
 	if (ret) {
@@ -281,11 +270,8 @@ static int aiu_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, aiu);
 
 	ret = device_reset(dev);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to reset device\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to reset device\n");
 
 	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs))
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index b9af2d513e09..bccfb770b339 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -351,20 +351,12 @@ int axg_fifo_probe(struct platform_device *pdev)
 	}
 
 	fifo->pclk = devm_clk_get(dev, NULL);
-	if (IS_ERR(fifo->pclk)) {
-		if (PTR_ERR(fifo->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %ld\n",
-				PTR_ERR(fifo->pclk));
-		return PTR_ERR(fifo->pclk);
-	}
+	if (IS_ERR(fifo->pclk))
+		return dev_err_probe(dev, PTR_ERR(fifo->pclk), "failed to get pclk\n");
 
 	fifo->arb = devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(fifo->arb)) {
-		if (PTR_ERR(fifo->arb) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get arb reset: %ld\n",
-				PTR_ERR(fifo->arb));
-		return PTR_ERR(fifo->arb);
-	}
+	if (IS_ERR(fifo->arb))
+		return dev_err_probe(dev, PTR_ERR(fifo->arb), "failed to get arb reset\n");
 
 	fifo->irq = of_irq_get(dev->of_node, 0);
 	if (fifo->irq <= 0) {
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index bfd37d49a73e..672e43a9729d 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -586,7 +586,6 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct axg_pdm *priv;
 	void __iomem *regs;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -611,28 +610,16 @@ static int axg_pdm_probe(struct platform_device *pdev)
 	}
 
 	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk)) {
-		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get pclk\n");
 
 	priv->dclk = devm_clk_get(dev, "dclk");
-	if (IS_ERR(priv->dclk)) {
-		ret = PTR_ERR(priv->dclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->dclk))
+		return dev_err_probe(dev, PTR_ERR(priv->dclk), "failed to get dclk\n");
 
 	priv->sysclk = devm_clk_get(dev, "sysclk");
-	if (IS_ERR(priv->sysclk)) {
-		ret = PTR_ERR(priv->sysclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get dclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->sysclk))
+		return dev_err_probe(dev, PTR_ERR(priv->sysclk), "failed to get dclk\n");
 
 	return devm_snd_soc_register_component(dev, &axg_pdm_component_drv,
 					       &axg_pdm_dai_drv, 1);
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index d0d09f945b48..4ba44e0d65d9 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -454,7 +454,6 @@ static int axg_spdifin_probe(struct platform_device *pdev)
 	struct axg_spdifin *priv;
 	struct snd_soc_dai_driver *dai_drv;
 	void __iomem *regs;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -479,20 +478,12 @@ static int axg_spdifin_probe(struct platform_device *pdev)
 	}
 
 	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk)) {
-		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get pclk\n");
 
 	priv->refclk = devm_clk_get(dev, "refclk");
-	if (IS_ERR(priv->refclk)) {
-		ret = PTR_ERR(priv->refclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->refclk))
+		return dev_err_probe(dev, PTR_ERR(priv->refclk), "failed to get mclk\n");
 
 	dai_drv = axg_spdifin_get_dai_drv(dev, priv);
 	if (IS_ERR(dai_drv)) {
diff --git a/sound/soc/meson/axg-spdifout.c b/sound/soc/meson/axg-spdifout.c
index e769a5ee6e27..3960d082e143 100644
--- a/sound/soc/meson/axg-spdifout.c
+++ b/sound/soc/meson/axg-spdifout.c
@@ -403,7 +403,6 @@ static int axg_spdifout_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct axg_spdifout *priv;
 	void __iomem *regs;
-	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -422,20 +421,12 @@ static int axg_spdifout_probe(struct platform_device *pdev)
 	}
 
 	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk)) {
-		ret = PTR_ERR(priv->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get pclk\n");
 
 	priv->mclk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(priv->mclk)) {
-		ret = PTR_ERR(priv->mclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get mclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(priv->mclk))
+		return dev_err_probe(dev, PTR_ERR(priv->mclk), "failed to get mclk\n");
 
 	return devm_snd_soc_register_component(dev, &axg_spdifout_component_drv,
 			axg_spdifout_dai_drv, ARRAY_SIZE(axg_spdifout_dai_drv));
diff --git a/sound/soc/meson/axg-tdm-formatter.c b/sound/soc/meson/axg-tdm-formatter.c
index cab7fa2851aa..9883dc777f63 100644
--- a/sound/soc/meson/axg-tdm-formatter.c
+++ b/sound/soc/meson/axg-tdm-formatter.c
@@ -255,7 +255,6 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 	const struct axg_tdm_formatter_driver *drv;
 	struct axg_tdm_formatter *formatter;
 	void __iomem *regs;
-	int ret;
 
 	drv = of_device_get_match_data(dev);
 	if (!drv) {
@@ -282,57 +281,34 @@ int axg_tdm_formatter_probe(struct platform_device *pdev)
 
 	/* Peripharal clock */
 	formatter->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(formatter->pclk)) {
-		ret = PTR_ERR(formatter->pclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get pclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->pclk))
+		return dev_err_probe(dev, PTR_ERR(formatter->pclk), "failed to get pclk\n");
 
 	/* Formatter bit clock */
 	formatter->sclk = devm_clk_get(dev, "sclk");
-	if (IS_ERR(formatter->sclk)) {
-		ret = PTR_ERR(formatter->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->sclk))
+		return dev_err_probe(dev, PTR_ERR(formatter->sclk), "failed to get sclk\n");
 
 	/* Formatter sample clock */
 	formatter->lrclk = devm_clk_get(dev, "lrclk");
-	if (IS_ERR(formatter->lrclk)) {
-		ret = PTR_ERR(formatter->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->lrclk))
+		return dev_err_probe(dev, PTR_ERR(formatter->lrclk), "failed to get lrclk\n");
 
 	/* Formatter bit clock input multiplexer */
 	formatter->sclk_sel = devm_clk_get(dev, "sclk_sel");
-	if (IS_ERR(formatter->sclk_sel)) {
-		ret = PTR_ERR(formatter->sclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk_sel: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->sclk_sel))
+		return dev_err_probe(dev, PTR_ERR(formatter->sclk_sel), "failed to get sclk_sel\n");
 
 	/* Formatter sample clock input multiplexer */
 	formatter->lrclk_sel = devm_clk_get(dev, "lrclk_sel");
-	if (IS_ERR(formatter->lrclk_sel)) {
-		ret = PTR_ERR(formatter->lrclk_sel);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk_sel: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->lrclk_sel))
+		return dev_err_probe(dev, PTR_ERR(formatter->lrclk_sel),
+				     "failed to get lrclk_sel\n");
 
 	/* Formatter dedicated reset line */
 	formatter->reset = devm_reset_control_get_optional_exclusive(dev, NULL);
-	if (IS_ERR(formatter->reset)) {
-		ret = PTR_ERR(formatter->reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get reset: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(formatter->reset))
+		return dev_err_probe(dev, PTR_ERR(formatter->reset), "failed to get reset\n");
 
 	return devm_snd_soc_register_component(dev, drv->component_drv,
 					       NULL, 0);
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index db077773af7a..0c31934a9630 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -533,21 +533,13 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 
 	/* Bit clock provided on the pad */
 	iface->sclk = devm_clk_get(dev, "sclk");
-	if (IS_ERR(iface->sclk)) {
-		ret = PTR_ERR(iface->sclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get sclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(iface->sclk))
+		return dev_err_probe(dev, PTR_ERR(iface->sclk), "failed to get sclk\n");
 
 	/* Sample clock provided on the pad */
 	iface->lrclk = devm_clk_get(dev, "lrclk");
-	if (IS_ERR(iface->lrclk)) {
-		ret = PTR_ERR(iface->lrclk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get lrclk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(iface->lrclk))
+		return dev_err_probe(dev, PTR_ERR(iface->lrclk), "failed to get lrclk\n");
 
 	/*
 	 * mclk maybe be missing when the cpu dai is in slave mode and
@@ -558,13 +550,10 @@ static int axg_tdm_iface_probe(struct platform_device *pdev)
 	iface->mclk = devm_clk_get(dev, "mclk");
 	if (IS_ERR(iface->mclk)) {
 		ret = PTR_ERR(iface->mclk);
-		if (ret == -ENOENT) {
+		if (ret == -ENOENT)
 			iface->mclk = NULL;
-		} else {
-			if (ret != -EPROBE_DEFER)
-				dev_err(dev, "failed to get mclk: %d\n", ret);
-			return ret;
-		}
+		else
+			return dev_err_probe(dev, ret, "failed to get mclk\n");
 	}
 
 	return devm_snd_soc_register_component(dev,
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 29b0174f4b5c..2d8d5717fd8b 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -85,11 +85,9 @@ int meson_card_parse_dai(struct snd_soc_card *card,
 
 	ret = of_parse_phandle_with_args(node, "sound-dai",
 					 "#sound-dai-cells", 0, &args);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(card->dev, "can't parse dai %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(card->dev, ret, "can't parse dai\n");
+
 	*dai_of_node = args.np;
 
 	return snd_soc_get_dai_name(&args, dai_name);
diff --git a/sound/soc/meson/t9015.c b/sound/soc/meson/t9015.c
index 4c1349dd1e06..a9b8c4e77d40 100644
--- a/sound/soc/meson/t9015.c
+++ b/sound/soc/meson/t9015.c
@@ -258,18 +258,12 @@ static int t9015_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, priv);
 
 	priv->pclk = devm_clk_get(dev, "pclk");
-	if (IS_ERR(priv->pclk)) {
-		if (PTR_ERR(priv->pclk) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get core clock\n");
-		return PTR_ERR(priv->pclk);
-	}
+	if (IS_ERR(priv->pclk))
+		return dev_err_probe(dev, PTR_ERR(priv->pclk), "failed to get core clock\n");
 
 	priv->avdd = devm_regulator_get(dev, "AVDD");
-	if (IS_ERR(priv->avdd)) {
-		if (PTR_ERR(priv->avdd) != -EPROBE_DEFER)
-			dev_err(dev, "failed to AVDD\n");
-		return PTR_ERR(priv->avdd);
-	}
+	if (IS_ERR(priv->avdd))
+		return dev_err_probe(dev, PTR_ERR(priv->avdd), "failed to AVDD\n");
 
 	ret = clk_prepare_enable(priv->pclk);
 	if (ret) {
-- 
2.25.1

