Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D253F001
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:39:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECC451B45;
	Mon,  6 Jun 2022 22:39:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECC451B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654547992;
	bh=b9UFKux+V5R7vRNYvBqBFY6T5kdwGAAwKzvjRt3W2eA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UGqf/eKEkjcuAbPRmq8c6CsQHc+jm/HSK301Rtz+yRTS5K+fbxBTuvCknIaClJtw9
	 Gd1+gYUWVVb1GCokvB6XDqaTFx50e114D+7v4E4ISB2HH2u4NEUqkvS+PYhmV1k6wC
	 axIfsc6KhqkyO1BNRrx9VxugpEzLA2HKa6qv8hAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0D63F8052D;
	Mon,  6 Jun 2022 22:38:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 916DEF80527; Mon,  6 Jun 2022 22:38:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91D61F8012A
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:38:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91D61F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IGI10OAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654547887; x=1686083887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b9UFKux+V5R7vRNYvBqBFY6T5kdwGAAwKzvjRt3W2eA=;
 b=IGI10OAp9Fs9bXo+IL8boGnI98Jd25gyIXvBufKQLHrCrdjfErZe567k
 8aFUlgQwh5RgBkzHklmlLFPcq9tN5ngXDMdaMBOKfU5ZsKzhYxKDDTV62
 UxkhIEOHth/xfZEtMgs6YboHK0moPBATp6QnnpEveh9oJL55woP7kBrRA
 omrHmXcs0ZhhKt1vHMIF+pwGQ/SFepX1zzu0kGvNc1CL8pqaTIzHhzoGy
 6pyGvfeUQ9YhX02rEDSI6c4j4obEwjOuoijF5T+rudvdRjWI4g0Y4EnDN
 2qMNjICRXvCs/wR2CUAdS0ZZL0viYp7XbtdCgsK7l9tMAVEe21RvR1Ez6 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="276730861"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="276730861"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:38:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="647728072"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:37:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/7] ASoC: Realtek/Maxim SoundWire codecs: disable pm_runtime
 on remove
Date: Mon,  6 Jun 2022 15:37:46 -0500
Message-Id: <20220606203752.144159-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
References: <20220606203752.144159-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, vkoul@kernel.org, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

When binding/unbinding codec drivers, the following warnings are
thrown:

[ 107.266879] rt715-sdca sdw:3:025d:0714:01: Unbalanced pm_runtime_enable!
[  306.879700] rt711-sdca sdw:0:025d:0711:01: Unbalanced pm_runtime_enable!

Add a remove callback for all Realtek/Maxim SoundWire codecs and remove this
warning.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/codecs/max98373-sdw.c   | 12 +++++++++++-
 sound/soc/codecs/rt1308-sdw.c     | 11 +++++++++++
 sound/soc/codecs/rt1316-sdw.c     | 11 +++++++++++
 sound/soc/codecs/rt5682-sdw.c     |  5 ++++-
 sound/soc/codecs/rt700-sdw.c      |  6 +++++-
 sound/soc/codecs/rt711-sdca-sdw.c |  6 +++++-
 sound/soc/codecs/rt711-sdw.c      |  6 +++++-
 sound/soc/codecs/rt715-sdca-sdw.c | 12 ++++++++++++
 sound/soc/codecs/rt715-sdw.c      | 12 ++++++++++++
 9 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index f47e956d4f55a..97b64477dde67 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -862,6 +862,16 @@ static int max98373_sdw_probe(struct sdw_slave *slave,
 	return max98373_init(slave, regmap);
 }
 
+static int max98373_sdw_remove(struct sdw_slave *slave)
+{
+	struct max98373_priv *max98373 = dev_get_drvdata(&slave->dev);
+
+	if (max98373->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
 #if defined(CONFIG_OF)
 static const struct of_device_id max98373_of_match[] = {
 	{ .compatible = "maxim,max98373", },
@@ -893,7 +903,7 @@ static struct sdw_driver max98373_sdw_driver = {
 		.pm = &max98373_pm,
 	},
 	.probe = max98373_sdw_probe,
-	.remove = NULL,
+	.remove = max98373_sdw_remove,
 	.ops = &max98373_slave_ops,
 	.id_table = max98373_id,
 };
diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index 1c11b42dd76e0..72f673f278eec 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -691,6 +691,16 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
 	return 0;
 }
 
+static int rt1308_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
+
+	if (rt1308->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
 static const struct sdw_device_id rt1308_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1308, 0x2, 0, 0),
 	{},
@@ -750,6 +760,7 @@ static struct sdw_driver rt1308_sdw_driver = {
 		.pm = &rt1308_pm,
 	},
 	.probe = rt1308_sdw_probe,
+	.remove = rt1308_sdw_remove,
 	.ops = &rt1308_slave_ops,
 	.id_table = rt1308_id,
 };
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 60baa9ff19070..2d6b5f9d4d770 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -676,6 +676,16 @@ static int rt1316_sdw_probe(struct sdw_slave *slave,
 	return rt1316_sdw_init(&slave->dev, regmap, slave);
 }
 
+static int rt1316_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(&slave->dev);
+
+	if (rt1316->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
 static const struct sdw_device_id rt1316_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x1316, 0x3, 0x1, 0),
 	{},
@@ -735,6 +745,7 @@ static struct sdw_driver rt1316_sdw_driver = {
 		.pm = &rt1316_pm,
 	},
 	.probe = rt1316_sdw_probe,
+	.remove = rt1316_sdw_remove,
 	.ops = &rt1316_slave_ops,
 	.id_table = rt1316_id,
 };
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 248257a2e4e0f..f04e18c32489d 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -719,9 +719,12 @@ static int rt5682_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
 
-	if (rt5682 && rt5682->hw_init)
+	if (rt5682->hw_init)
 		cancel_delayed_work_sync(&rt5682->jack_detect_work);
 
+	if (rt5682->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index bda5948996642..f7439e40ca8b5 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -13,6 +13,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "rt700.h"
@@ -463,11 +464,14 @@ static int rt700_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
 
-	if (rt700 && rt700->hw_init) {
+	if (rt700->hw_init) {
 		cancel_delayed_work_sync(&rt700->jack_detect_work);
 		cancel_delayed_work_sync(&rt700->jack_btn_check_work);
 	}
 
+	if (rt700->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index aaf5af153d3fe..c722a2b0041f7 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -11,6 +11,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 
 #include "rt711-sdca.h"
 #include "rt711-sdca-sdw.h"
@@ -364,11 +365,14 @@ static int rt711_sdca_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	if (rt711 && rt711->hw_init) {
+	if (rt711->hw_init) {
 		cancel_delayed_work_sync(&rt711->jack_detect_work);
 		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
 	}
 
+	if (rt711->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index bda2cc9439c98..f49c94baa37c6 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -13,6 +13,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "rt711.h"
@@ -464,12 +465,15 @@ static int rt711_sdw_remove(struct sdw_slave *slave)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
 
-	if (rt711 && rt711->hw_init) {
+	if (rt711->hw_init) {
 		cancel_delayed_work_sync(&rt711->jack_detect_work);
 		cancel_delayed_work_sync(&rt711->jack_btn_check_work);
 		cancel_work_sync(&rt711->calibration_work);
 	}
 
+	if (rt711->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index 0ecd2948f7aa7..13e731d166753 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -13,6 +13,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "rt715-sdca.h"
@@ -193,6 +194,16 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
 	return rt715_sdca_init(&slave->dev, mbq_regmap, regmap, slave);
 }
 
+static int rt715_sdca_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
+
+	if (rt715->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
 static const struct sdw_device_id rt715_sdca_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x715, 0x3, 0x1, 0),
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x714, 0x3, 0x1, 0),
@@ -267,6 +278,7 @@ static struct sdw_driver rt715_sdw_driver = {
 		.pm = &rt715_pm,
 	},
 	.probe = rt715_sdca_sdw_probe,
+	.remove = rt715_sdca_sdw_remove,
 	.ops = &rt715_sdca_slave_ops,
 	.id_table = rt715_sdca_id,
 };
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index a7b21b03c08bb..b047bf87a100c 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -14,6 +14,7 @@
 #include <linux/soundwire/sdw_type.h>
 #include <linux/soundwire/sdw_registers.h>
 #include <linux/module.h>
+#include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
@@ -514,6 +515,16 @@ static int rt715_sdw_probe(struct sdw_slave *slave,
 	return 0;
 }
 
+static int rt715_sdw_remove(struct sdw_slave *slave)
+{
+	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
+
+	if (rt715->first_hw_init)
+		pm_runtime_disable(&slave->dev);
+
+	return 0;
+}
+
 static const struct sdw_device_id rt715_id[] = {
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x714, 0x2, 0, 0),
 	SDW_SLAVE_ENTRY_EXT(0x025d, 0x715, 0x2, 0, 0),
@@ -575,6 +586,7 @@ static struct sdw_driver rt715_sdw_driver = {
 		   .pm = &rt715_pm,
 		   },
 	.probe = rt715_sdw_probe,
+	.remove = rt715_sdw_remove,
 	.ops = &rt715_slave_ops,
 	.id_table = rt715_id,
 };
-- 
2.34.1

