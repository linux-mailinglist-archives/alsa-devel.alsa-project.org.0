Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AF234E77BA
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Mar 2022 16:34:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 096E016FF;
	Fri, 25 Mar 2022 16:34:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 096E016FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648222498;
	bh=6Bi9GTvPd1v1a+BxZ0BqQppBlQg1pcrXvlQDy4BF64s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DxQf0xmVnx4eDgm/GPbGf/Jy278LigccYuXzfpcdO9jnIBSXjtb75YpFGDjf/CzG1
	 1qubn3TfUYmJ53d5HoY5Z32ZdYHXzmm2bgvrpA33BOgEQB7W6uC+sgd7RlRBOP4j4u
	 IZeZR19IaAhDZaZHW459xyOfRFu+/Et8wbsQBe5w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27183F8051C;
	Fri, 25 Mar 2022 16:33:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D12BF8051C; Fri, 25 Mar 2022 16:33:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A455F800AA
 for <alsa-devel@alsa-project.org>; Fri, 25 Mar 2022 16:33:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A455F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="H9PpOVvi"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB51B617B1;
 Fri, 25 Mar 2022 15:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075BFC340F3;
 Fri, 25 Mar 2022 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648222386;
 bh=6Bi9GTvPd1v1a+BxZ0BqQppBlQg1pcrXvlQDy4BF64s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H9PpOVviwwk7dRIHuSpDKdIK+T/W+tUZZoqHkyXpKXFrJZywy+yDN6CJWpHPW4qRU
 9pHAmwzQ2T/yuARuvQMhUsvK/A99HOTcKJLuTc+mMlU51gvxGNhNtybMf6LZWj56VC
 wQyVm923BJ8Zis0S10+qIBDudoESZkZRhfkLqi7gLMCnSS+U7+SEbKeNx3v/9Ws0ob
 oltVrNeO25zrvddjWir/cir69sFVVX1QCnxEnFpr/5/fH7N1/KuWWKigVe9s1dU5uM
 TxQiwITRq4ZlppTTbsMk7DdLUWMPJvCxf4HdHZT3fvyMoP4V7EzbNNe/bTQQJIO/sz
 JTBtyD8skwVTA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v1 2/7] ASoC: wm8731: Factor component init out of bus code
Date: Fri, 25 Mar 2022 15:31:16 +0000
Message-Id: <20220325153121.1598494-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3799; h=from:subject;
 bh=6Bi9GTvPd1v1a+BxZ0BqQppBlQg1pcrXvlQDy4BF64s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBE8klygmbF0KySqMYEMAYuLPfqZjSbiA998jUV
 TJ087WaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gRAAKCRAk1otyXVSH0IOoB/
 97fIJ/2LRaVGSA7DxO/mO/r0SasB4f/BXAVwow6qewp17ZYlmqvH7rPZUcyLJBJCu4R9XG7fnJCwjl
 TeA5gFCt+GUPlZHCeOhqlszH5rlJwEne6fZmVyMYYKp3GMH3UbC2uOU6rWLfMq6dkpHu2NL/tLyLP7
 39aB+pnf+OkiHGPB0LOEGJv6NSv7Nqpes1iED+NWb3r69Hq0sP5TEKYsHSQoVICWfK9Yz/bOvmpL9t
 SN6ERtva/XFdM+UCXbY23QDsR1Mu5RLc6WzIJMpFmfYWgQkt6i6MxOiTUzT9KiWQOyDUZOPAOLI7dO
 y0wnD7k3IYajgSDLHMTkIjRQw3iizj
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

Both the I2C and SPI bus code register the component immediately after they
call wm8731_hw_init(), factor the code out into the the common function and
rename it to just be plain wm8731_init() while we're at it since it's not
just for hardware init any more. This refactoring means we need to move the
function after the declaration of the component driver.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/wm8731.c | 67 ++++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

diff --git a/sound/soc/codecs/wm8731.c b/sound/soc/codecs/wm8731.c
index 5b399c631faf..b2ec03b1afed 100644
--- a/sound/soc/codecs/wm8731.c
+++ b/sound/soc/codecs/wm8731.c
@@ -594,7 +594,22 @@ static int wm8731_request_supplies(struct device *dev,
 	return 0;
 }
 
-static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
+static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
+	.set_bias_level		= wm8731_set_bias_level,
+	.controls		= wm8731_snd_controls,
+	.num_controls		= ARRAY_SIZE(wm8731_snd_controls),
+	.dapm_widgets		= wm8731_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(wm8731_dapm_widgets),
+	.dapm_routes		= wm8731_intercon,
+	.num_dapm_routes	= ARRAY_SIZE(wm8731_intercon),
+	.suspend_bias_off	= 1,
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.non_legacy_dai_naming	= 1,
+};
+
+static int wm8731_init(struct device *dev, struct wm8731_priv *wm8731)
 {
 	int ret = 0;
 
@@ -618,6 +633,15 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 
 	regcache_mark_dirty(wm8731->regmap);
 
+	ret = devm_snd_soc_register_component(dev,
+			&soc_component_dev_wm8731, &wm8731_dai, 1);
+	if (ret != 0) {
+		dev_err(dev, "Failed to register CODEC: %d\n", ret);
+		goto err_regulator_enable;
+	}
+
+	return 0;
+
 err_regulator_enable:
 	/* Regulators will be enabled by bias management */
 	regulator_bulk_disable(ARRAY_SIZE(wm8731->supplies), wm8731->supplies);
@@ -625,21 +649,6 @@ static int wm8731_hw_init(struct device *dev, struct wm8731_priv *wm8731)
 	return ret;
 }
 
-static const struct snd_soc_component_driver soc_component_dev_wm8731 = {
-	.set_bias_level		= wm8731_set_bias_level,
-	.controls		= wm8731_snd_controls,
-	.num_controls		= ARRAY_SIZE(wm8731_snd_controls),
-	.dapm_widgets		= wm8731_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(wm8731_dapm_widgets),
-	.dapm_routes		= wm8731_intercon,
-	.num_dapm_routes	= ARRAY_SIZE(wm8731_intercon),
-	.suspend_bias_off	= 1,
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
 static const struct of_device_id wm8731_of_match[] = {
 	{ .compatible = "wlf,wm8731", },
 	{ }
@@ -698,18 +707,7 @@ static int wm8731_spi_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	ret = wm8731_hw_init(&spi->dev, wm8731);
-	if (ret != 0)
-		return ret;
-
-	ret = devm_snd_soc_register_component(&spi->dev,
-			&soc_component_dev_wm8731, &wm8731_dai, 1);
-	if (ret != 0) {
-		dev_err(&spi->dev, "Failed to register CODEC: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return wm8731_init(&spi->dev, wm8731);
 }
 
 static struct spi_driver wm8731_spi_driver = {
@@ -762,18 +760,7 @@ static int wm8731_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
-	ret = wm8731_hw_init(&i2c->dev, wm8731);
-	if (ret != 0)
-		return ret;
-
-	ret = devm_snd_soc_register_component(&i2c->dev,
-			&soc_component_dev_wm8731, &wm8731_dai, 1);
-	if (ret != 0) {
-		dev_err(&i2c->dev, "Failed to register CODEC: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return wm8731_init(&i2c->dev, wm8731);
 }
 
 static const struct i2c_device_id wm8731_i2c_id[] = {
-- 
2.30.2

