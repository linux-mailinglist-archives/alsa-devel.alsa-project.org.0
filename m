Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6079A3374D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:53:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9DD81660;
	Mon,  3 Jun 2019 19:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9DD81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584409;
	bh=yIJTz9JTpxw1PM5LHiLUjLDOH/U80kBEPJQGoQn9vU8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=q//FGpkoqpY2b5Zkk+9+UxNXM0nXWOwR4cZ8xpisnmSZXu2QQG8zeC+W93G2HaGGH
	 ZHhHoiyiSSlTTZ1I1GN7yDALHYHZvMG0lRgKYq0S76GixjyV113UNAzB1ucnTPElZ/
	 /VWZuv++ANpMX1jkIxwCusu8GR8U8CM6uneyak10=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 516F7F8974B;
	Mon,  3 Jun 2019 19:47:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90AE9F89738; Mon,  3 Jun 2019 19:47:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A2F36F89730
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A2F36F89730
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OAgRJox6"
Received: by mail-lj1-x243.google.com with SMTP id v29so5784981ljv.0
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+dU3J6vSB6rrSmznGSHAJH8TKN9OO1b+UvKtsB3mqw0=;
 b=OAgRJox6KpAoi7IKo7tD5dHGkky2hlNqvyaujK1utMnRUoKiedl7nyAASuM24/Aiki
 st5JKW5/rZbJzL5D3hJLlU31T1de7hW7gWJA4sNI8DrwYMnEKV86vvz8FDfdo3urs2OE
 xDpZOKVjmBjCSFOSE2XBv2LKIBgrIbli6DGARQ9LTg/eEEuD0Kjed5FawfT/L3xoGmNm
 2hIdMzfl2Yj+N/UqaGcv5LT6TMtSiFyz4PqY4ZzytQIsldhU3oPnolntRK6bi0cYaZhw
 59BQiDH1aa9L0oLybmLCjP0YoKUGMQIQtigs7bFEvtS7e2ldBqQFmgUEYIolSV/nsHEQ
 HJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+dU3J6vSB6rrSmznGSHAJH8TKN9OO1b+UvKtsB3mqw0=;
 b=KB1raFOP8uhwpmRJkBdPUJ8knwxRGQ64OC/MxYlxfiRFdPfzNJAr8RP7p6pqpcVLN+
 yEzzGQKOiTLWB4VK61BVzdjLQOiDPFZV/0VGTZN6XF85XBElBFjkAA+ekcdBne39udDb
 gbWHIEQAcUutkgQTiB/Dy7wfeJfPZpXirqdBllXS9gPcUH8ZbvnQtzog19Pzyb7inwXR
 9uRQFyszCFPJ6l40/0N6mV7cE6XhFT5Hr4kHfeE9IsPJ9DbICY1eVHT1xbjr+0AfOWB9
 AY1LS81Xo5+lmJMNTO3HoPBYYSbOuz+/FhUy7paKx7CA+i8pYurJeBz/1ulisincIJp2
 Y8CQ==
X-Gm-Message-State: APjAAAXxZ7L+jE5ETTJi/ujC4wCP86SNJpx9IcI7vrm+0kaRV+wJ0OXK
 piijnVyBLjIm9kCc/1NlgDubMi+/
X-Google-Smtp-Source: APXvYqwROrB7Vb+pbcTPCi0P/yuE7aA4w2nDEZebnoQXexL+Iy3qCA6eOa42yRSvYnC8WznFmmt7LQ==
X-Received: by 2002:a2e:2f12:: with SMTP id v18mr14171586ljv.196.1559584063684; 
 Mon, 03 Jun 2019 10:47:43 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:42 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:32 +0200
Message-Id: <20190603174735.21002-7-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 6/9] ASoC: sun4i-i2s: Add multi-lane
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
 sound/soc/sunxi/sun4i-i2s.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index bca73b3c0d74..75217fb52bfa 100644
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
@@ -355,14 +355,23 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 	int sr, wss, channels;
 	u32 width;
+	int lines;
 
 	channels = params_channels(params);
-	if (channels != 2) {
+	if ((channels > dai->driver->playback.channels_max) ||
+		(channels < dai->driver->playback.channels_min)) {
 		dev_err(dai->dev, "Unsupported number of channels: %d\n",
 			channels);
 		return -EINVAL;
 	}
 
+	lines = (channels + 1) / 2;
+
+	/* Enable the required output lines */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
+			   SUN4I_I2S_CTRL_SDO_EN_MASK,
+			   SUN4I_I2S_CTRL_SDO_EN(lines));
+
 	if (i2s->variant->is_h3_i2s_based) {
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
 				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
@@ -373,8 +382,19 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* Map the channels for playback and capture */
-	regmap_field_write(i2s->field_txchanmap, 0x76543210);
 	regmap_field_write(i2s->field_rxchanmap, 0x00003210);
+	regmap_field_write(i2s->field_txchanmap, 0x10);
+	if (i2s->variant->is_h3_i2s_based) {
+		if (channels > 2)
+			regmap_write(i2s->regmap,
+				     SUN8I_I2S_TX_CHAN_MAP_REG+4, 0x32);
+		if (channels > 4)
+			regmap_write(i2s->regmap,
+				     SUN8I_I2S_TX_CHAN_MAP_REG+8, 0x54);
+		if (channels > 6)
+			regmap_write(i2s->regmap,
+				     SUN8I_I2S_TX_CHAN_MAP_REG+12, 0x76);
+	}
 
 	/* Configure the channels */
 	regmap_field_write(i2s->field_txchansel,
@@ -1057,9 +1077,10 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
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
@@ -1126,6 +1147,19 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
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
@@ -1135,7 +1169,7 @@ static int sun4i_i2s_probe(struct platform_device *pdev)
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &sun4i_i2s_component,
-					      &sun4i_i2s_dai, 1);
+					      soc_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register DAI\n");
 		goto err_suspend;
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
