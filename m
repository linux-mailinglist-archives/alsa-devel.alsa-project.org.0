Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 487C7797969
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Sep 2023 19:13:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A82F3832;
	Thu,  7 Sep 2023 19:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A82F3832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694106815;
	bh=0iNfyxlEf9nQ9rzmSwa3q80tRzMXGzHMikIFLaPq9/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iFsTzx+SxMXotTuO+WyoVED67vfLraWOxdR9JfQHHfTHr+7vRBYMsHxSoNNebQAG4
	 dKjrX4AQQ4zv9ZN9kO15Vo1EPP8eOrQcN3EOF6UTuJpVyysoi5yFB2L1p1ikZTKO3C
	 lIZXJxBLAmPD2xvAuFw9IDNrsO7w6y1rqywE+hcI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D9B7F805D5; Thu,  7 Sep 2023 19:10:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C8B9F805D2;
	Thu,  7 Sep 2023 19:10:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B935AF805BF; Thu,  7 Sep 2023 19:10:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5115AF8056F
	for <alsa-devel@alsa-project.org>; Thu,  7 Sep 2023 19:10:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5115AF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=GxGlyGld
Received: from localhost (unknown [81.18.92.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
 server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3023A66072F1;
	Thu,  7 Sep 2023 18:10:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694106636;
	bh=0iNfyxlEf9nQ9rzmSwa3q80tRzMXGzHMikIFLaPq9/A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GxGlyGldKVwEnWJcymdhIE4LiMEFIjKvBhnNPIPtAhL417z/zaykgkXg3stBtGx/e
	 Wz32gDEvmunH5csGh4Spgn5OKZdKbTUWFMnn6Zo0A0jkng1r8+Qb8uljTcAJbq65BP
	 mra2LrRO8DMcB+3TfhJoAuY+HbXVSBsNNr+eTSux2e1/bLzNziFSoUb1vv1I9WYkq7
	 33MsWwpN6WRBPD4hFj6pW26GIXrdnsNadWtpNV0WPpPpQ0Ljzabon5PS5rGVqY4FSn
	 PpNrMYe9ZE6rjLumdhzVV+8G+eZEHN7rwiGw0ZMof5GhK9wALzCbLT38G3cyGxKsLk
	 6Di7jtGw7S7uw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Stefan Binding <sbinding@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Vitaly Rodionov <vitalyr@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v2 07/11] ASoC: cs35l41: Make use of dev_err_probe()
Date: Thu,  7 Sep 2023 20:10:06 +0300
Message-ID: <20230907171010.1447274-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
References: <20230907171010.1447274-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3KEDUWDZJZZ43GRLUFD7KPH5XGBCMM4A
X-Message-ID-Hash: 3KEDUWDZJZZ43GRLUFD7KPH5XGBCMM4A
X-MailFrom: cristian.ciocaltea@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3KEDUWDZJZZ43GRLUFD7KPH5XGBCMM4A/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use dev_err_probe() helper where possible, to simplify error handling
during probe.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l41-i2c.c |  9 +++------
 sound/soc/codecs/cs35l41-spi.c |  9 +++------
 sound/soc/codecs/cs35l41.c     | 34 ++++++++++++++++------------------
 3 files changed, 22 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index 7ea890d7d387..9109203a7f25 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -35,7 +35,6 @@ static int cs35l41_i2c_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct cs35l41_hw_cfg *hw_cfg = dev_get_platdata(dev);
 	const struct regmap_config *regmap_config = &cs35l41_regmap_i2c;
-	int ret;
 
 	cs35l41 = devm_kzalloc(dev, sizeof(struct cs35l41_private), GFP_KERNEL);
 
@@ -47,11 +46,9 @@ static int cs35l41_i2c_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, cs35l41);
 	cs35l41->regmap = devm_regmap_init_i2c(client, regmap_config);
-	if (IS_ERR(cs35l41->regmap)) {
-		ret = PTR_ERR(cs35l41->regmap);
-		dev_err(cs35l41->dev, "Failed to allocate register map: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cs35l41->regmap))
+		return dev_err_probe(cs35l41->dev, PTR_ERR(cs35l41->regmap),
+				     "Failed to allocate register map\n");
 
 	return cs35l41_probe(cs35l41, hw_cfg);
 }
diff --git a/sound/soc/codecs/cs35l41-spi.c b/sound/soc/codecs/cs35l41-spi.c
index 5c8bb24909eb..28e9c9473e60 100644
--- a/sound/soc/codecs/cs35l41-spi.c
+++ b/sound/soc/codecs/cs35l41-spi.c
@@ -32,7 +32,6 @@ static int cs35l41_spi_probe(struct spi_device *spi)
 	const struct regmap_config *regmap_config = &cs35l41_regmap_spi;
 	struct cs35l41_hw_cfg *hw_cfg = dev_get_platdata(&spi->dev);
 	struct cs35l41_private *cs35l41;
-	int ret;
 
 	cs35l41 = devm_kzalloc(&spi->dev, sizeof(struct cs35l41_private), GFP_KERNEL);
 	if (!cs35l41)
@@ -43,11 +42,9 @@ static int cs35l41_spi_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, cs35l41);
 	cs35l41->regmap = devm_regmap_init_spi(spi, regmap_config);
-	if (IS_ERR(cs35l41->regmap)) {
-		ret = PTR_ERR(cs35l41->regmap);
-		dev_err(&spi->dev, "Failed to allocate register map: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(cs35l41->regmap))
+		return dev_err_probe(cs35l41->dev, PTR_ERR(cs35l41->regmap),
+				     "Failed to allocate register map\n");
 
 	cs35l41->dev = &spi->dev;
 	cs35l41->irq = spi->irq;
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 5456e6bfa242..7ddaa9bd8911 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -1190,16 +1190,14 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	ret = devm_regulator_bulk_get(cs35l41->dev, CS35L41_NUM_SUPPLIES,
 				      cs35l41->supplies);
-	if (ret != 0) {
-		dev_err(cs35l41->dev, "Failed to request core supplies: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(cs35l41->dev, ret,
+				     "Failed to request core supplies\n");
 
 	ret = regulator_bulk_enable(CS35L41_NUM_SUPPLIES, cs35l41->supplies);
-	if (ret != 0) {
-		dev_err(cs35l41->dev, "Failed to enable core supplies: %d\n", ret);
-		return ret;
-	}
+	if (ret != 0)
+		return dev_err_probe(cs35l41->dev, ret,
+				     "Failed to enable core supplies\n");
 
 	/* returning NULL can be an option if in stereo mode */
 	cs35l41->reset_gpio = devm_gpiod_get_optional(cs35l41->dev, "reset",
@@ -1211,8 +1209,8 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 			dev_info(cs35l41->dev,
 				 "Reset line busy, assuming shared reset\n");
 		} else {
-			dev_err(cs35l41->dev,
-				"Failed to get reset GPIO: %d\n", ret);
+			dev_err_probe(cs35l41->dev, ret,
+				      "Failed to get reset GPIO\n");
 			goto err;
 		}
 	}
@@ -1228,8 +1226,8 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 				       int_status, int_status & CS35L41_OTP_BOOT_DONE,
 				       1000, 100000);
 	if (ret) {
-		dev_err(cs35l41->dev,
-			"Failed waiting for OTP_BOOT_DONE: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret,
+			      "Failed waiting for OTP_BOOT_DONE\n");
 		goto err;
 	}
 
@@ -1242,13 +1240,13 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_DEVID, &regid);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Get Device ID failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Get Device ID failed\n");
 		goto err;
 	}
 
 	ret = regmap_read(cs35l41->regmap, CS35L41_REVID, &reg_revid);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Get Revision ID failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Get Revision ID failed\n");
 		goto err;
 	}
 
@@ -1273,7 +1271,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 
 	ret = cs35l41_otp_unpack(cs35l41->dev, cs35l41->regmap);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "OTP Unpack failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "OTP Unpack failed\n");
 		goto err;
 	}
 
@@ -1293,13 +1291,13 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 					IRQF_ONESHOT | IRQF_SHARED | irq_pol,
 					"cs35l41", cs35l41);
 	if (ret != 0) {
-		dev_err(cs35l41->dev, "Failed to request IRQ: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Failed to request IRQ\n");
 		goto err;
 	}
 
 	ret = cs35l41_set_pdata(cs35l41);
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Set pdata failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Set pdata failed\n");
 		goto err;
 	}
 
@@ -1322,7 +1320,7 @@ int cs35l41_probe(struct cs35l41_private *cs35l41, const struct cs35l41_hw_cfg *
 					      &soc_component_dev_cs35l41,
 					      cs35l41_dai, ARRAY_SIZE(cs35l41_dai));
 	if (ret < 0) {
-		dev_err(cs35l41->dev, "Register codec failed: %d\n", ret);
+		dev_err_probe(cs35l41->dev, ret, "Register codec failed\n");
 		goto err_pm;
 	}
 
-- 
2.41.0

