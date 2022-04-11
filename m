Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E0F4FC2D5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Apr 2022 19:00:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3C831708;
	Mon, 11 Apr 2022 19:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3C831708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649696456;
	bh=8tcoOe+Er2LjtG9dJGE5808oSKspaNSNne+JUmnrDeo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ict9QlmiQCJ5788gOaXKEwWlPVwjQPQTMueqzfiizgZGwX3xVpbSjG0CX6fr6b0KT
	 QXrQQ/UmYvrrE6te3eN+D/oG22X0bJxiYU/cLzm4N4/AA4WbGWaTRyy5wXkizzuGH2
	 qhhP6FxcozMFm/ZJ97cvDq8+C9VeQl2a84MDeNzI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46FCFF8032D;
	Mon, 11 Apr 2022 18:59:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A26B3F80279; Mon, 11 Apr 2022 18:59:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10E74F8011C
 for <alsa-devel@alsa-project.org>; Mon, 11 Apr 2022 18:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10E74F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oMakITAv"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23B603sk024512;
 Mon, 11 Apr 2022 11:59:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=UcPGU3tlBZDRLTES+qLUEqhSB/mK4EAvCmChnr/N0yk=;
 b=oMakITAvt4e2bZF0/Yh73q64EWkqKH+sWdBfCCYqRlMBvtYxdDUtqUBQLxNhOEY6YHqA
 aemLtMHSaFfc1xy9O7BCp355RVLRKUbKFREFXMqPQrSBVexXAIuuLR5aqZ2zyC276u9L
 bUf0bNdDlbKkOISBCiRydBdrOupFDGcsxwMq3TrSaH7HFA3or5ckatadK2nSiDLrB+84
 ygd3Z4M1Dmm6Z6YbEyJN0km4jzf+nfSp8PXcYV38Qe0KzXqUAxwtbdO5l7ZNYtLDJdCj
 jrU117S1K1TRsjrBEMqcYM2vI0hSVkGhWiBYTSr31jFGSENnF6cIrb3tfplSAjZoKKXy fg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fb7hyjh4g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 11 Apr 2022 11:59:41 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 11 Apr
 2022 17:59:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 11 Apr 2022 17:59:39 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.75])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D3E99B06;
 Mon, 11 Apr 2022 16:59:38 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs35l45: Make exports namespaced
Date: Mon, 11 Apr 2022 17:59:29 +0100
Message-ID: <20220411165929.1302333-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: DERTtYHPlJVmlZWf6olYc9EleWNNiAkT
X-Proofpoint-ORIG-GUID: DERTtYHPlJVmlZWf6olYc9EleWNNiAkT
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

Use the new EXPORT_SYMBOL_NS_GPL() for exports from the set of
drivers for cs35l45.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l45-i2c.c    | 2 ++
 sound/soc/codecs/cs35l45-spi.c    | 2 ++
 sound/soc/codecs/cs35l45-tables.c | 8 ++++----
 sound/soc/codecs/cs35l45.c        | 7 ++++---
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/cs35l45-i2c.c b/sound/soc/codecs/cs35l45-i2c.c
index 18ebf1e14b91..38a4dbc9e9fe 100644
--- a/sound/soc/codecs/cs35l45-i2c.c
+++ b/sound/soc/codecs/cs35l45-i2c.c
@@ -70,3 +70,5 @@ module_i2c_driver(cs35l45_i2c_driver);
 MODULE_DESCRIPTION("I2C CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_CS35L45);
+MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
diff --git a/sound/soc/codecs/cs35l45-spi.c b/sound/soc/codecs/cs35l45-spi.c
index 445f57ff1fcd..baaf6e0f4fb9 100644
--- a/sound/soc/codecs/cs35l45-spi.c
+++ b/sound/soc/codecs/cs35l45-spi.c
@@ -70,3 +70,5 @@ module_spi_driver(cs35l45_spi_driver);
 MODULE_DESCRIPTION("SPI CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_CS35L45);
+MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
diff --git a/sound/soc/codecs/cs35l45-tables.c b/sound/soc/codecs/cs35l45-tables.c
index 95d5b3606448..5a2c2e684ef9 100644
--- a/sound/soc/codecs/cs35l45-tables.c
+++ b/sound/soc/codecs/cs35l45-tables.c
@@ -38,7 +38,7 @@ int cs35l45_apply_patch(struct cs35l45_private *cs35l45)
 	return regmap_register_patch(cs35l45->regmap, cs35l45_patch,
 				     ARRAY_SIZE(cs35l45_patch));
 }
-EXPORT_SYMBOL_GPL(cs35l45_apply_patch);
+EXPORT_SYMBOL_NS_GPL(cs35l45_apply_patch, SND_SOC_CS35L45_TABLES);
 
 static const struct reg_default cs35l45_defaults[] = {
 	{ CS35L45_BLOCK_ENABLES,		0x00003323 },
@@ -126,7 +126,7 @@ const struct regmap_config cs35l45_i2c_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_GPL(cs35l45_i2c_regmap);
+EXPORT_SYMBOL_NS_GPL(cs35l45_i2c_regmap, SND_SOC_CS35L45_TABLES);
 
 const struct regmap_config cs35l45_spi_regmap = {
 	.reg_bits = 32,
@@ -142,7 +142,7 @@ const struct regmap_config cs35l45_spi_regmap = {
 	.readable_reg = cs35l45_readable_reg,
 	.cache_type = REGCACHE_RBTREE,
 };
-EXPORT_SYMBOL_GPL(cs35l45_spi_regmap);
+EXPORT_SYMBOL_NS_GPL(cs35l45_spi_regmap, SND_SOC_CS35L45_TABLES);
 
 static const struct {
 	u8 cfg_id;
@@ -195,7 +195,7 @@ unsigned int cs35l45_get_clk_freq_id(unsigned int freq)
 
 	return -EINVAL;
 }
-EXPORT_SYMBOL_GPL(cs35l45_get_clk_freq_id);
+EXPORT_SYMBOL_NS_GPL(cs35l45_get_clk_freq_id, SND_SOC_CS35L45_TABLES);
 
 MODULE_DESCRIPTION("ASoC CS35L45 driver tables");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
diff --git a/sound/soc/codecs/cs35l45.c b/sound/soc/codecs/cs35l45.c
index 7822626d3693..86daa2574388 100644
--- a/sound/soc/codecs/cs35l45.c
+++ b/sound/soc/codecs/cs35l45.c
@@ -667,7 +667,7 @@ int cs35l45_probe(struct cs35l45_private *cs35l45)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(cs35l45_probe);
+EXPORT_SYMBOL_NS_GPL(cs35l45_probe, SND_SOC_CS35L45);
 
 int cs35l45_remove(struct cs35l45_private *cs35l45)
 {
@@ -680,14 +680,15 @@ int cs35l45_remove(struct cs35l45_private *cs35l45)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(cs35l45_remove);
+EXPORT_SYMBOL_NS_GPL(cs35l45_remove, SND_SOC_CS35L45);
 
 const struct dev_pm_ops cs35l45_pm_ops = {
 	SET_RUNTIME_PM_OPS(cs35l45_runtime_suspend, cs35l45_runtime_resume, NULL)
 };
-EXPORT_SYMBOL_GPL(cs35l45_pm_ops);
+EXPORT_SYMBOL_NS_GPL(cs35l45_pm_ops, SND_SOC_CS35L45);
 
 MODULE_DESCRIPTION("ASoC CS35L45 driver");
 MODULE_AUTHOR("James Schulman, Cirrus Logic Inc, <james.schulman@cirrus.com>");
 MODULE_AUTHOR("Richard Fitzgerald <rf@opensource.cirrus.com>");
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_CS35L45_TABLES);
-- 
2.30.2

