Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A7C8CBDD
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 299B9167D;
	Wed, 14 Aug 2019 08:19:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 299B9167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763648;
	bh=rudW+XTcCFA4ZnGzpgQ7LXUM9Ti1FKaM4JgKFM0xEqs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lhvli2Kz3H28XG4OrdQ3XYckSaDWCyjLuRMfIFNz4pWH8UDNleXyh8ex77jK22VEj
	 Cl28SSuSHJIHR/zM//HDn71TIxN+UhxbJJs4ia7cDKtmO4v+wT4xgG6Xevkj15o7Qt
	 TL4gJ6FsoIRXE6Ny3bS0R9rsFIo0NDFboxoqP3q0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E357CF80736;
	Wed, 14 Aug 2019 08:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 784CCF8067A; Wed, 14 Aug 2019 08:09:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04D6AF8065A
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D6AF8065A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="b2FZTp02"
Received: by mail-lf1-x143.google.com with SMTP id x3so78574565lfc.0
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ou3x7y4s8p5adLbVD6HKEYQ2kNImM5q4bilXS/ylyGo=;
 b=b2FZTp02TAHqQew35c6kwrKuCTzZoo3W8NqhcIPMlerWaVlqYLkYg7VlVI9gUC/5Lb
 fDQRW6yAa1Yq7q9Dyxn0APRJEK0w2aRzx/5pLZU83Nu0ZVvpfqNYEac7n+zvM9XjvUg3
 mdUJ9mFIq42CoP9BRv8v22FCaPgPzBhLaI4sjjX8sWSY0ITdxMrvKl+LO71NlX+8XTuU
 zfHk5NOwMAurs0Ps4Uk60hws46rQ4Me+gwvud+d0SzYV7zelpS1hnTIMNQAvnIDb0dAV
 /Kaxmqo6nstOyiQ91V8eLhpBaRaIJBacuByzyg+ifpPuoJrgA2vKzCSSMNXIF/XtIN1o
 nEJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ou3x7y4s8p5adLbVD6HKEYQ2kNImM5q4bilXS/ylyGo=;
 b=KlmLUTKR0uICqW4EeVcQGfMYmtdRNJ9Sg79Yy5cFC9I6tKsXzWOQOsyTU98W5JK1Iu
 kA/5sKlqpLXKdK2rVRUPjImgsVhKYKetIrYky0pTsBAJLIjxIGO5cOxi+5nQSIAxd5jO
 P+NXMSU6slnp9dISTe8ll7M5MHeMf6hZZoEk0GyUP8L8e6Y24qBmbji5sqLauso6sDc9
 NilAmSIUexYzTb9YhnpN6hHikv2MZ8oMmgCsjDM+MiNEwVX6xKkPSIS//MGeS4GYo8Un
 R+FMzvpu6UY1f9T7tVz+zkI5Pfj+mtSqLCvrU7EqozaSGH8hLZAwG2jDYKjfdyjjEqEK
 J5ug==
X-Gm-Message-State: APjAAAVmpFDlNXbWhmbZs3WessHOcmR3BhwgPK9UjrVRPmSzL8KKrij8
 WkWsNWxYcDSQ5EapQaFco84=
X-Google-Smtp-Source: APXvYqz3NLXEXAl8L4Kz1xuOk4AcF3nKcG5klKFuG7opqjL8zbsMtc1OeMtjPYhIInZBn0pYUugW+w==
X-Received: by 2002:a19:f603:: with SMTP id x3mr22065770lfe.125.1565762956491; 
 Tue, 13 Aug 2019 23:09:16 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.09.15
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:15 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:51 +0200
Message-Id: <20190814060854.26345-13-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 12/15] ASoC: sun4i-i2s: Add multi-lane
	functionality
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Marcus Cooper <codekipper@gmail.com>

The i2s block supports multi-lane i2s output however this functionality
is only possible in earlier SoCs where the pins are exposed and for
the i2s block used for HDMI audio on the later SoCs.

To enable this functionality, an optional property has been added to
the bindings.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index a8d98696fe7c..a020c3b372a8 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -23,7 +23,7 @@
 
 #define SUN4I_I2S_CTRL_REG		0x00
 #define SUN4I_I2S_CTRL_SDO_EN_MASK		GENMASK(11, 8)
-#define SUN4I_I2S_CTRL_SDO_EN(sdo)			BIT(8 + (sdo))
+#define SUN4I_I2S_CTRL_SDO_EN(lines)		(((1 << lines) - 1) << 8)
 #define SUN4I_I2S_CTRL_MODE_MASK		BIT(5)
 #define SUN4I_I2S_CTRL_MODE_SLAVE			(1 << 5)
 #define SUN4I_I2S_CTRL_MODE_MASTER			(0 << 5)
@@ -614,6 +614,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	int sr, wss, channels;
 	u32 width;
+	int lines;
 
 	channels = params_channels(params);
 	if (channels != 2) {
@@ -622,6 +623,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	lines = (channels + 1) / 2;
+
+	/* Enable the required output lines */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+			   SUN4I_I2S_CTRL_SDO_EN_MASK,
+			   SUN4I_I2S_CTRL_SDO_EN(lines));
+
 	if (i2s->variant->has_chcfg) {
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
 				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
@@ -1389,9 +1397,10 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 static int sun4i_i2s_probe(struct platform_device *pdev)
 {
 	struct sun4i_i2s *i2s;
+	struct snd_soc_dai_driver *soc_dai;
 	struct resource *res;
 	void __iomem *regs;
-	int irq, ret;
+	int irq, ret, val;
 
 	i2s = devm_kzalloc(&pdev->dev, sizeof(*i2s), GFP_KERNEL);
 	if (!i2s)
@@ -1456,6 +1465,19 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 	i2s->capture_dma_data.addr = res->start + SUN4I_I2S_FIFO_RX_REG;
 	i2s->capture_dma_data.maxburst = 8;
 
+	soc_dai = devm_kmemdup(&pdev->dev, &sun4i_i2s_dai,
+			       sizeof(*soc_dai), GFP_KERNEL);
+	if (!soc_dai) {
+		ret = -ENOMEM;
+		goto err_pm_disable;
+	}
+
+	if (!of_property_read_u32(pdev->dev.of_node,
+				  "allwinner,playback-channels", &val)) {
+		if (val >= 2 && val <= 8)
+			soc_dai->playback.channels_max = val;
+	}
+
 	pm_runtime_enable(&pdev->dev);
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = sun4i_i2s_runtime_resume(&pdev->dev);
@@ -1465,7 +1487,7 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &sun4i_i2s_component,
-					      &sun4i_i2s_dai, 1);
+					      soc_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
 		goto err_suspend;
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
