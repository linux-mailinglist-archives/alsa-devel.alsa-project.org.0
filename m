Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EE658B272
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Aug 2022 00:22:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A09C83B;
	Sat,  6 Aug 2022 00:21:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A09C83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659738160;
	bh=JXb4hcSFEGdgtPJSfY/YQDvon8HzgMZX+/nVJn6V6ZM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=seTgQJT+2FCeilvnWm8JlsvK0uTWHfn36iEMreYIz+BB99wFXMoCB0tRr+ShfAhGz
	 P4NPaVNlrRtkuF2TvRONrjiMaB+noroYMoeDyq8sENosk78At1xepSFuanrLdV3Bz2
	 myAuVISWxNiXpCfl6FT9f5uZh9um18rFyGuJTPrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 763CAF8013D;
	Sat,  6 Aug 2022 00:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 618DCF8025A; Sat,  6 Aug 2022 00:21:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28FDCF8013D
 for <alsa-devel@alsa-project.org>; Sat,  6 Aug 2022 00:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28FDCF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=axis.com header.i=@axis.com
 header.b="B8jzORMI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1659738095;
 x=1691274095;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4iOxNsMSbtpOM27Z8TD3Hj1cDpxzqVK5IPL4dyFrR5g=;
 b=B8jzORMIOb8/WKM1I+DVMd0UmMsXiN+efYPWpfG+qoF3HFPBzat1QdN1
 ngg60VtJNNZxI6pI+tf8ZScG5WUxJ80knH27qh8Y3h+QpJFezmxrI4YEA
 EwbopacJ96XELclEvobNZ0pToL7JCZRe1ejgK6yqP0crmdlaiwFWjI8ew
 YTc0EG2OOohFIB9t8tXE7/7t/lCIZ4GcJV5+YSGgcMF45sZrG/IGlO3DT
 czQkQOhg2qrDbBW1kWVYMGQ9LegySlbeYOnOc5XGwcpW3mgNG4NoudIBs
 5CReogKTKqqjUJHWDTJibyZF9GxpXkXkmwtbQaSXMFamsed4svF+NRAbf g==;
From: Niklas Carlsson <Niklas.Carlsson@axis.com>
To: Lars-Peter Clausen <lars@metafoo.de>, =?UTF-8?q?Nuno=20S=C3=A1?=
 <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>
Subject: [PATCH] ASoC: adau1761: Reset codec at probe and shutdown
Date: Sat, 6 Aug 2022 00:21:20 +0200
Message-ID: <20220805222120.2560501-1-Niklas.Carlsson@axis.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: Niklas Carlsson <niklasc@axis.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Niklas Carlsson <niklasc@axis.com>

ADAU1X61 doesn't have a reset pin, which leads to the codec retaining
the register values after the device has been rebooted without a power
cycle. This causes the driver to be out of sync with the codec.

Simulating a hardware reset ensures that the codec is in a defined
state.

Link: https://lore.kernel.org/all/alpine.DEB.2.02.1603291544160.3594@lnxricardw1.se.axis.com/
Link: https://lore.kernel.org/all/alpine.DEB.2.02.1604211547540.31333@lnxricardw1.se.axis.com/
Signed-off-by: Niklas Carlsson <niklasc@axis.com>
---
 sound/soc/codecs/adau1761-i2c.c |  6 +++++
 sound/soc/codecs/adau1761-spi.c |  6 +++++
 sound/soc/codecs/adau1761.c     | 43 +++++++++++++++++++++++++++++++++
 sound/soc/codecs/adau1761.h     |  1 +
 4 files changed, 56 insertions(+)

diff --git a/sound/soc/codecs/adau1761-i2c.c b/sound/soc/codecs/adau1761-i2c.c
index 0683caf86aea..23bffbd74469 100644
--- a/sound/soc/codecs/adau1761-i2c.c
+++ b/sound/soc/codecs/adau1761-i2c.c
@@ -36,6 +36,11 @@ static int adau1761_i2c_remove(struct i2c_client *client)
 	return 0;
 }
 
+static void adau1761_i2c_shutdown(struct i2c_client *client)
+{
+	adau1761_shutdown(&client->dev);
+}
+
 static const struct i2c_device_id adau1761_i2c_ids[] = {
 	{ "adau1361", ADAU1361 },
 	{ "adau1461", ADAU1761 },
@@ -63,6 +68,7 @@ static struct i2c_driver adau1761_i2c_driver = {
 	},
 	.probe_new = adau1761_i2c_probe,
 	.remove = adau1761_i2c_remove,
+	.shutdown = adau1761_i2c_shutdown,
 	.id_table = adau1761_i2c_ids,
 };
 module_i2c_driver(adau1761_i2c_driver);
diff --git a/sound/soc/codecs/adau1761-spi.c b/sound/soc/codecs/adau1761-spi.c
index 7c9242c2ff94..5bbbc3d3b5be 100644
--- a/sound/soc/codecs/adau1761-spi.c
+++ b/sound/soc/codecs/adau1761-spi.c
@@ -50,6 +50,11 @@ static void adau1761_spi_remove(struct spi_device *spi)
 	adau17x1_remove(&spi->dev);
 }
 
+static void adau1761_spi_shutdown(struct spi_device *spi)
+{
+	adau1761_shutdown(&spi->dev);
+}
+
 static const struct spi_device_id adau1761_spi_id[] = {
 	{ "adau1361", ADAU1361 },
 	{ "adau1461", ADAU1761 },
@@ -77,6 +82,7 @@ static struct spi_driver adau1761_spi_driver = {
 	},
 	.probe = adau1761_spi_probe,
 	.remove = adau1761_spi_remove,
+	.shutdown = adau1761_spi_shutdown,
 	.id_table = adau1761_spi_id,
 };
 module_spi_driver(adau1761_spi_driver);
diff --git a/sound/soc/codecs/adau1761.c b/sound/soc/codecs/adau1761.c
index 8f887227981f..ac544e1e8dc7 100644
--- a/sound/soc/codecs/adau1761.c
+++ b/sound/soc/codecs/adau1761.c
@@ -974,6 +974,39 @@ static struct snd_soc_dai_driver adau1761_dai_driver = {
 	.ops = &adau17x1_dai_ops,
 };
 
+static void adau1761_reset(struct regmap *regmap)
+{
+	size_t i;
+
+	/*
+	 * Handle the lack of a reset pin in ADAU1X61 by manually writing all
+	 * registers to their default values.
+	 *
+	 * Steps for performing the reset:
+	 *   1) Make sure that the cache is marked as dirty by writing all
+	 *      default values directly to the cache.
+	 *
+	 *   2) Enable the core clock which is needed for writing all registers
+	 *      except CLOCK_CONTROL.
+	 *
+	 *   3) Use regcache_sync() for synchronizing the dirty cache back to
+	 *      the hardware.
+	 */
+
+	regcache_cache_only(regmap, true);
+	for (i = 0; i < ARRAY_SIZE(adau1761_reg_defaults); i++)
+		regmap_write(regmap, adau1761_reg_defaults[i].reg,
+			     adau1761_reg_defaults[i].def);
+	regcache_cache_only(regmap, false);
+
+	regmap_update_bits(regmap, ADAU17X1_CLOCK_CONTROL,
+			   ADAU17X1_CLOCK_CONTROL_SYSCLK_EN,
+			   ADAU17X1_CLOCK_CONTROL_SYSCLK_EN);
+	regcache_sync(regmap);
+	regmap_update_bits(regmap, ADAU17X1_CLOCK_CONTROL,
+			   ADAU17X1_CLOCK_CONTROL_SYSCLK_EN, 0);
+}
+
 int adau1761_probe(struct device *dev, struct regmap *regmap,
 	enum adau17x1_type type, void (*switch_mode)(struct device *dev))
 {
@@ -997,6 +1030,8 @@ int adau1761_probe(struct device *dev, struct regmap *regmap,
 	if (ret)
 		return ret;
 
+	adau1761_reset(regmap);
+
 	/* Enable cache only mode as we could miss writes before bias level
 	 * reaches standby and the core clock is enabled */
 	regcache_cache_only(regmap, true);
@@ -1006,6 +1041,14 @@ int adau1761_probe(struct device *dev, struct regmap *regmap,
 }
 EXPORT_SYMBOL_GPL(adau1761_probe);
 
+void adau1761_shutdown(struct device *dev)
+{
+	struct adau *adau = dev_get_drvdata(dev);
+
+	adau1761_reset(adau->regmap);
+}
+EXPORT_SYMBOL_GPL(adau1761_shutdown);
+
 const struct regmap_config adau1761_regmap_config = {
 	.val_bits = 8,
 	.reg_bits = 16,
diff --git a/sound/soc/codecs/adau1761.h b/sound/soc/codecs/adau1761.h
index 7beabf448ad1..98d698ebde27 100644
--- a/sound/soc/codecs/adau1761.h
+++ b/sound/soc/codecs/adau1761.h
@@ -16,6 +16,7 @@ struct device;
 
 int adau1761_probe(struct device *dev, struct regmap *regmap,
 	enum adau17x1_type type, void (*switch_mode)(struct device *dev));
+void adau1761_shutdown(struct device *dev);
 
 extern const struct regmap_config adau1761_regmap_config;
 
-- 
2.30.2

