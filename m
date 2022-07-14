Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E64574328
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Jul 2022 06:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CE6618BC;
	Thu, 14 Jul 2022 06:30:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CE6618BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657773092;
	bh=xWX9/0nFqISsHnmbDCJ6Ba1Ycf4LV6efRFEkOL3T5U0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V4QGFlSS8jjc1IFZ7g0P+lSVlQgSQ9jw/IChm3tFi0Bjjj7NCpyYpgREe7HJjfLSn
	 n47oMbPEUCH4gTrETPbr36TfYeT4VKLVcwDtPQvjNLuPdSemwt0CJrSNmRLWWYfE5W
	 T+0c7soHyQVSIZHBniIekKt2/GEkhc3eumtOS6fM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 047ACF8057B;
	Thu, 14 Jul 2022 06:24:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04C77F80579; Thu, 14 Jul 2022 06:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D57DCF8055B
 for <alsa-devel@alsa-project.org>; Thu, 14 Jul 2022 06:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D57DCF8055B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Z4EXsXG+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1F7F0B82374;
 Thu, 14 Jul 2022 04:24:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA60C385A2;
 Thu, 14 Jul 2022 04:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657772677;
 bh=xWX9/0nFqISsHnmbDCJ6Ba1Ycf4LV6efRFEkOL3T5U0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z4EXsXG+XwY7Ts0oQUESQozrEfyP2dM5dBUl8io1mBQdsRnlPwPYZsSQlYhJYNqPo
 lztcQhUxOJJU7ILQaN0AhZk4XWqvryBDqy2ycGQO3mLmEb90YjR1NgMzNnIS2+1PHu
 oVP+sz7dpKSBN7DkZjnBjPTZmSSavAnv27Mjl1KhR5yeixj9pjaHbuoKbPqXRylsLw
 9apJg39A/UE6K0OcA5nxKM0bHBgTJRPuX2/O/9c3eaVH7PEpwSqd42vnq7LFUmTskD
 C6LTijAqSlZsFv27F+mkR8bjzuoMb7nRV5FT9ft+2J9I7ApTMRaqIpykq/smAjYYr5
 uz8yi/6nZLoLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 03/28] ASoC: Realtek/Maxim SoundWire codecs:
 disable pm_runtime on remove
Date: Thu, 14 Jul 2022 00:24:04 -0400
Message-Id: <20220714042429.281816-3-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220714042429.281816-1-sashal@kernel.org>
References: <20220714042429.281816-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, oder_chiou@realtek.com,
 alsa-devel@alsa-project.org, ranjani.sridharan@intel.com, tiwai@suse.com,
 lgirdwood@gmail.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Rander Wang <rander.wang@intel.com>,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

[ Upstream commit ac63716da3070f8cb6baaba3a058a0c7f22aeb5b ]

When binding/unbinding codec drivers, the following warnings are
thrown:

[ 107.266879] rt715-sdca sdw:3:025d:0714:01: Unbalanced pm_runtime_enable!
[  306.879700] rt711-sdca sdw:0:025d:0711:01: Unbalanced pm_runtime_enable!

Add a remove callback for all Realtek/Maxim SoundWire codecs and remove this
warning.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Link: https://lore.kernel.org/r/20220606203752.144159-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
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
index dc520effc61c..12323d4b5bfa 100644
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
index f716668de640..8472d855c325 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -683,6 +683,16 @@ static int rt1308_sdw_probe(struct sdw_slave *slave,
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
@@ -742,6 +752,7 @@ static struct sdw_driver rt1308_sdw_driver = {
 		.pm = &rt1308_pm,
 	},
 	.probe = rt1308_sdw_probe,
+	.remove = rt1308_sdw_remove,
 	.ops = &rt1308_slave_ops,
 	.id_table = rt1308_id,
 };
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 09b4914bba1b..09cf3ca86fa4 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -675,6 +675,16 @@ static int rt1316_sdw_probe(struct sdw_slave *slave,
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
@@ -734,6 +744,7 @@ static struct sdw_driver rt1316_sdw_driver = {
 		.pm = &rt1316_pm,
 	},
 	.probe = rt1316_sdw_probe,
+	.remove = rt1316_sdw_remove,
 	.ops = &rt1316_slave_ops,
 	.id_table = rt1316_id,
 };
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index 31a4f286043e..a030c9987b92 100644
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
index bda594899664..f7439e40ca8b 100644
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
index aaf5af153d3f..c722a2b0041f 100644
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
index bda2cc9439c9..f49c94baa37c 100644
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
index a5c673f43d82..0f4354eafef2 100644
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
@@ -195,6 +196,16 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
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
@@ -269,6 +280,7 @@ static struct sdw_driver rt715_sdw_driver = {
 		.pm = &rt715_pm,
 	},
 	.probe = rt715_sdca_sdw_probe,
+	.remove = rt715_sdca_sdw_remove,
 	.ops = &rt715_sdca_slave_ops,
 	.id_table = rt715_sdca_id,
 };
diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index a7b21b03c08b..b047bf87a100 100644
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
2.35.1

