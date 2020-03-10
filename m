Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 189221803A7
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Mar 2020 17:37:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6610A1678;
	Tue, 10 Mar 2020 17:36:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6610A1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583858268;
	bh=RKU8+9V/KTVjpvGlIZIV7Wtd/ZjtivY3U13wwNDktHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MrLX/SP/4JBcq999QXSbqgrpDgwUb9suMC7CQVdXKm0lPrxQlyRrz5a1/G4WF8oXw
	 eFgEK2cHB/C/t0OnIVVpAXk7t1bMEXS8H3QTI4xN3AB84KjMBvB5T6CMFFTE5+X7eQ
	 Bo/JBsonZfZqSv9wM60PK647UJ/5nKnPUys4RfKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0279BF800DA;
	Tue, 10 Mar 2020 17:35:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B1AE8F80246; Tue, 10 Mar 2020 17:35:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CBEBF80217
 for <alsa-devel@alsa-project.org>; Tue, 10 Mar 2020 17:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CBEBF80217
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 09:35:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,537,1574150400"; d="scan'208";a="388985487"
Received: from djdickof-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.192.103])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 09:35:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: rt5682: fix compilation issues without I2C
Date: Tue, 10 Mar 2020 11:35:08 -0500
Message-Id: <20200310163509.14466-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
References: <20200310163509.14466-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Oder Chiou <oder_chiou@realtek.com>, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 kbuild test robot <lkp@intel.com>
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

Exclude all I2C-related code from compilation to avoid compilation
errors and defined but not used warnings.

sound/soc/codecs/rt5682.c:3688:26: warning: 'rt5682_i2c_driver'
defined but not used [-Wunused-variable]
    static struct i2c_driver rt5682_i2c_driver = {
                             ^~~~~~~~~~~~~~~~~

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 03f6fc6de9192f ('ASoC: rt5682: Add the soundwire support')
Cc: Oder Chiou <oder_chiou@realtek.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/rt5682.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index e1df2d076533..8828ed5db58d 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -33,6 +33,7 @@
 #include "rt5682.h"
 #include "rt5682-sdw.h"
 
+#if IS_ENABLED(CONFIG_I2C)
 static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
 	"AVDD",
 	"MICVDD",
@@ -47,6 +48,7 @@ static const struct rt5682_platform_data i2s_default_platform_data = {
 	.dai_clk_names[RT5682_DAI_WCLK_IDX] = "rt5682-dai-wclk",
 	.dai_clk_names[RT5682_DAI_BCLK_IDX] = "rt5682-dai-bclk",
 };
+#endif
 
 static const struct reg_sequence patch_list[] = {
 	{RT5682_HP_IMP_SENS_CTRL_19, 0x1000},
@@ -974,6 +976,7 @@ static int rt5682_headset_detect(struct snd_soc_component *component,
 	return rt5682->jack_type;
 }
 
+#if IS_ENABLED(CONFIG_I2C)
 static irqreturn_t rt5682_irq(int irq, void *data)
 {
 	struct rt5682_priv *rt5682 = data;
@@ -1002,6 +1005,7 @@ static void rt5682_jd_check_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5682->jd_check_work, 500);
 	}
 }
+#endif
 
 static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hs_jack, void *data)
@@ -3214,6 +3218,7 @@ static const struct regmap_config rt5682_regmap = {
 	.use_single_write = true,
 };
 
+#if IS_ENABLED(CONFIG_I2C)
 static const struct i2c_device_id rt5682_i2c_id[] = {
 	{"rt5682", 0},
 	{}
@@ -3244,6 +3249,7 @@ static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 
 	return 0;
 }
+#endif
 
 static void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
@@ -3510,6 +3516,7 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 EXPORT_SYMBOL_GPL(rt5682_io_init);
 #endif
 
+#if IS_ENABLED(CONFIG_I2C)
 static int rt5682_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
@@ -3668,6 +3675,7 @@ static void rt5682_i2c_shutdown(struct i2c_client *client)
 
 	rt5682_reset(rt5682);
 }
+#endif
 
 #ifdef CONFIG_OF
 static const struct of_device_id rt5682_of_match[] = {
@@ -3685,6 +3693,7 @@ static const struct acpi_device_id rt5682_acpi_match[] = {
 MODULE_DEVICE_TABLE(acpi, rt5682_acpi_match);
 #endif
 
+#if IS_ENABLED(CONFIG_I2C)
 static struct i2c_driver rt5682_i2c_driver = {
 	.driver = {
 		.name = "rt5682",
@@ -3696,6 +3705,7 @@ static struct i2c_driver rt5682_i2c_driver = {
 	.id_table = rt5682_i2c_id,
 };
 module_i2c_driver(rt5682_i2c_driver);
+#endif
 
 MODULE_DESCRIPTION("ASoC RT5682 driver");
 MODULE_AUTHOR("Bard Liao <bardliao@realtek.com>");
-- 
2.20.1

