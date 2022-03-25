Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F57F4E77BE
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:35:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF69716EF;
	Fri, 25 Mar 2022 16:34:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF69716EF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222541;
	bh=YToyrpeXD0X+5VW3zfjTO/Ikw5RTRTAfwe1YXrozb3w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FzoU7utiPnFbmzywXKYzSBN5xdA6mNKxatC/OH+K4XIivbfJ16DFQvSZDmU64d83H
	 T8lKrFVruZpEFz3K2GdZ5t1/TaaI9xGyAXZ+4s4L+NtgIdPg2geevLlLEAa901MQJz
	 psK/NZWahvAfErOQY1fPmGk3AbnYmw+gWItUtil0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D3F7F80528;
	Fri, 25 Mar 2022 16:33:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62745F8051A; Fri, 25 Mar 2022 16:33:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 866DAF8051B
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 866DAF8051B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p8nTFWt1"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1AD93616B2;
 Fri, 25 Mar 2022 15:33:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FA7C340E9;
 Fri, 25 Mar 2022 15:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222390;
 bh=YToyrpeXD0X+5VW3zfjTO/Ikw5RTRTAfwe1YXrozb3w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p8nTFWt1A1few/CV92DoH7g5kim6CTLK8pjzQYr0BypQURGohGrX40F1X6SOX6DEO
 bvNmttDUmXYJ0dK/1ySJZOxOOY2QGZGzGgMsFxrCEC25aeLBHMVREwhMAS4gXLWKit
 2UvD//SQddu0gvJi6f7EpTBF19P1xIPe252N2XNJtZU0kHeAALPYKgRjUty/yaIU1e
 FpGxS4WNrO98tuQkCz+G52oS+XTSRCixwk5Ck/Ly/Hve9mUCsdt8MgML5T0IrthBav
 c2DC6Fx32xGxxXvCtmRmmzKjP3RSusVxx9CJsc5PYGvXJxkw4riGOG8FGBZ9SK4jW9
 Q0wYTTeDU4V5Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 4/7] ASoC: wm8731: Factor our MCLK and mutex initialisation
Date: Fri, 25 Mar 2022 15:31:18 +0000
Message-Id: <20220325153121.1598494-5-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2237; h=from:subject;
 bh=YToyrpeXD0X+5VW3zfjTO/Ikw5RTRTAfwe1YXrozb3w=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBG+XjR1VdDxA3ZwbxNzcof2mD/wEhd8n6vaAIF
 Siy4cdaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRgAKCRAk1otyXVSH0LcDB/
 9Iy0vL3Vmf/95jZi7O5DgE/TZRoOlx/KR1weJZ4J60Y6Mk5JKMcR9UZ7Bz2cd4J0eAf6XjmRI/b8cK
 +M710Pjqo8Fh8CYxW8V+OjtkV+w+qdLJdL4VYOdzcyqhjhQfxtAk1RQPrQryqBIxcSrUvNsEFxtcWO
 pYiyMkmd0hysLMb4eEI/BrmjozsAo2aYqTXA0UJeKxf37Inz+nBvla5vSTaPyh+OlnQbFIjf0oL62m
 51ijzxUBEYAdqkskr0oJ+dgBXL+GrzWD6T0IHUgVJRP4yzPDQEGhJP6IkEmJK3hOatnA1rq1bSAphw
 TNpu90W/IIW0Gnb7vYr6fgSwg5beMh
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>
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

The code for initialising the MCLK and mutex is identical in the I2C and SPI
probe functions so just move this out into wm8731_init().

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 44 +++++++++++++--------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 334332bb5f22..43730aba11fe 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -588,6 +588,20 @@ static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
 {
 	int ret = 0, i;
 
+	wm8731->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(wm8731->mclk)) {
+		ret = PTR_ERR(wm8731->mclk);
+		if (ret == -ENOENT) {
+			wm8731->mclk = NULL;
+			dev_warn(dev, "Assuming static MCLK\n");
+		} else {
+			dev_err(dev, "Failed to get MCLK: %d\n", ret);
+			return ret;
+		}
+	}
+
+	mutex_init(&wm8731->lock);
+
 	for (i = 0; i < ARRAY_SIZE(wm8731->supplies); i++)
 		wm8731->supplies[i].supply = wm8731_supply_names[i];
 
@@ -670,21 +684,6 @@ static int wm8731_spi_probe(struct spi_device *spi)
 	if (wm8731 == NULL)
 		return -ENOMEM;
 
-	wm8731->mclk = devm_clk_get(&spi->dev, "mclk");
-	if (IS_ERR(wm8731->mclk)) {
-		ret = PTR_ERR(wm8731->mclk);
-		if (ret == -ENOENT) {
-			wm8731->mclk = NULL;
-			dev_warn(&spi->dev, "Assuming static MCLK\n");
-		} else {
-			dev_err(&spi->dev, "Failed to get MCLK: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
-	mutex_init(&wm8731->lock);
-
 	spi_set_drvdata(spi, wm8731);
 
 	wm8731->regmap = devm_regmap_init_spi(spi, &wm8731_regmap);
@@ -719,21 +718,6 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 	if (wm8731 == NULL)
 		return -ENOMEM;
 
-	wm8731->mclk = devm_clk_get(&i2c->dev, "mclk");
-	if (IS_ERR(wm8731->mclk)) {
-		ret = PTR_ERR(wm8731->mclk);
-		if (ret == -ENOENT) {
-			wm8731->mclk = NULL;
-			dev_warn(&i2c->dev, "Assuming static MCLK\n");
-		} else {
-			dev_err(&i2c->dev, "Failed to get MCLK: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
-	mutex_init(&wm8731->lock);
-
 	i2c_set_clientdata(i2c, wm8731);
 
 	wm8731->regmap = devm_regmap_init_i2c(i2c, &wm8731_regmap);
-- 
2.30.2

