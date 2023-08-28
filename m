Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E03A78B7E7
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 21:12:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77FC3A4A;
	Mon, 28 Aug 2023 21:11:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77FC3A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693249954;
	bh=w52dvNi1MKa0DQf82n80DX0c6TIzsRS8ZEy/CKD1upA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dcN1Oq+v9+7p86OY6CWO3f/y8zM+sldJmqRaWJ6eJI46p0057DAPuWmIXW5eezltY
	 QfcU+oz1wfInQuMpLgBwTPAHz4sHhgMBv/bktxEv7wMNltCoIfgnbLRxOXvM8II5d3
	 EvnDVihHN9yRvCdebN5uO/Y5RpGnr3ERyFQgaLkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DC29F80571; Mon, 28 Aug 2023 21:10:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C6701F8055C;
	Mon, 28 Aug 2023 21:10:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5CB9CF80158; Mon, 28 Aug 2023 21:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C644F80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 21:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C644F80155
X-IronPort-AV: E=Sophos;i="6.02,208,1688396400";
   d="scan'208";a="174239894"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2023 04:10:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.234])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id A86804054C86;
	Tue, 29 Aug 2023 04:10:21 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <x1077012@ti.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] ASoC: codec: tlv320aic32x4: Add enum aic32x4_type to
 aic32x4_probe()
Date: Mon, 28 Aug 2023 20:10:13 +0100
Message-Id: <20230828191014.138310-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
References: <20230828191014.138310-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YUQCLFQZKH44CQWNMD7SUNRY2UUBXZ36
X-Message-ID-Hash: YUQCLFQZKH44CQWNMD7SUNRY2UUBXZ36
X-MailFrom: biju.das.jz@bp.renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YUQCLFQZKH44CQWNMD7SUNRY2UUBXZ36/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add enum aic32x4_type to aic32x4_probe() and drop using dev_set_drvdata()
from tlv320aic32x4_{i2c,spi} drivers.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2:
 * New patch.
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 7 ++++---
 sound/soc/codecs/tlv320aic32x4-spi.c | 7 ++++---
 sound/soc/codecs/tlv320aic32x4.c     | 5 +++--
 sound/soc/codecs/tlv320aic32x4.h     | 3 ++-
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 49b33a256cd7..713f3f63b5e3 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -23,6 +23,7 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
 {
 	struct regmap *regmap;
 	struct regmap_config config;
+	enum aic32x4_type type;
 
 	config = aic32x4_regmap_config;
 	config.reg_bits = 8;
@@ -34,15 +35,15 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c)
 		const struct of_device_id *oid;
 
 		oid = of_match_node(aic32x4_of_id, i2c->dev.of_node);
-		dev_set_drvdata(&i2c->dev, (void *)oid->data);
+		type = (uintptr_t)oid->data;
 	} else {
 		const struct i2c_device_id *id;
 
 		id = i2c_match_id(aic32x4_i2c_id, i2c);
-		dev_set_drvdata(&i2c->dev, (void *)id->driver_data);
+		type = id->driver_data;
 	}
 
-	return aic32x4_probe(&i2c->dev, regmap);
+	return aic32x4_probe(&i2c->dev, regmap, type);
 }
 
 static void aic32x4_i2c_remove(struct i2c_client *i2c)
diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index 03cce8d6404f..81c05030dd3b 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -22,6 +22,7 @@ static int aic32x4_spi_probe(struct spi_device *spi)
 {
 	struct regmap *regmap;
 	struct regmap_config config;
+	enum aic32x4_type type;
 
 	config = aic32x4_regmap_config;
 	config.reg_bits = 7;
@@ -35,15 +36,15 @@ static int aic32x4_spi_probe(struct spi_device *spi)
 		const struct of_device_id *oid;
 
 		oid = of_match_node(aic32x4_of_id, spi->dev.of_node);
-		dev_set_drvdata(&spi->dev, (void *)oid->data);
+		type = (uintptr_t)oid->data;
 	} else {
 		const struct spi_device_id *id_entry;
 
 		id_entry = spi_get_device_id(spi);
-		dev_set_drvdata(&spi->dev, (void *)id_entry->driver_data);
+		type = id_entry->driver_data;
 	}
 
-	return aic32x4_probe(&spi->dev, regmap);
+	return aic32x4_probe(&spi->dev, regmap, type);
 }
 
 static void aic32x4_spi_remove(struct spi_device *spi)
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index 6829834a412f..5c0c81da06db 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -1333,7 +1333,8 @@ static int aic32x4_setup_regulators(struct device *dev,
 	return ret;
 }
 
-int aic32x4_probe(struct device *dev, struct regmap *regmap)
+int aic32x4_probe(struct device *dev, struct regmap *regmap,
+		  enum aic32x4_type type)
 {
 	struct aic32x4_priv *aic32x4;
 	struct aic32x4_pdata *pdata = dev->platform_data;
@@ -1349,7 +1350,7 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
-	aic32x4->type = (uintptr_t)dev_get_drvdata(dev);
+	aic32x4->type = type;
 
 	dev_set_drvdata(dev, aic32x4);
 
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index d6101ce73f80..f68a846ef61d 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -17,7 +17,8 @@ enum aic32x4_type {
 };
 
 extern const struct regmap_config aic32x4_regmap_config;
-int aic32x4_probe(struct device *dev, struct regmap *regmap);
+int aic32x4_probe(struct device *dev, struct regmap *regmap,
+		  enum aic32x4_type type);
 void aic32x4_remove(struct device *dev);
 int aic32x4_register_clocks(struct device *dev, const char *mclk_name);
 
-- 
2.25.1

