Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62951432415
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 18:46:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E599617DC;
	Mon, 18 Oct 2021 18:45:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E599617DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634575567;
	bh=19/RYW2/do2v4foTY4QUbdGFsIoVbvVT+C2s4/a5YZU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UkRzpw5KBOkcdzAZZ/3zhNjo3/btdEOs9sGH+1pf2w3nPJ+mo1YnVn3uTPSPWsrTJ
	 KFvtSBQxtemT8g3j3LNXzorfntN80WDIKgGKi4+1VQgV7EGJCHV2JwpgHch/oOxyQz
	 fbEADPLO09FSugezviu1rdEfvV6s2oZjb4i/4K3I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64BFEF80253;
	Mon, 18 Oct 2021 18:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 71554F80224; Mon, 18 Oct 2021 18:44:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B6B7F80159
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 18:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B6B7F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="ZwIqPcj/"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19IDIugK002086; 
 Mon, 18 Oct 2021 11:44:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=g2keZwZ3YbmiZsBBYq3iwJPeFMf1WnyhEQ2eg27YkXk=;
 b=ZwIqPcj/8kupRSNZTybT0jB+tGOc29pZ6PeaJ0lY4QH4hV+0EA/W5Gqk9Y4zUSql14kS
 YEfdZSfNN9pqX2RFI0GC3SyxSDxYa76OYXK0tfN2/e1tKpAHY2bqLN/2yulftl2WsHID
 5J5z+eCKYJaGXiTUMpcURojMa5pPehf5Vhoj1wnLRTXBSbs98AP9rG5d6XR6EL2xOh3e
 C2UmFxghfgJ+Eew1SQV6G82OjBkajCbtuaWp7RmV7gUM1CqXxWc+E2HftcMA8zbHcK79
 ySDslfUOnw10Es3WxDPamMd56izb/76Nt3i7tMNP0aPAzj7+5aRVEJKv5PtUXf5IxcNv Iw== 
Received: from ediex02.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 3bs5p88g66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 18 Oct 2021 11:44:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Mon, 18 Oct
 2021 17:44:35 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.7 via Frontend
 Transport; Mon, 18 Oct 2021 17:44:35 +0100
Received: from AUSNPC0LSNW1-debian.cirrus.com (AUSNPC0LSNW1.ad.cirrus.com
 [198.61.64.121])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA217B15;
 Mon, 18 Oct 2021 16:44:34 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: cs42l42: Remove unused runtime_suspend/runtime_resume
 callbacks
Date: Mon, 18 Oct 2021 17:44:31 +0100
Message-ID: <20211018164431.5871-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: m53f-sWNMRlKcbnHRmnRMgmsYFp6O6PB
X-Proofpoint-ORIG-GUID: m53f-sWNMRlKcbnHRmnRMgmsYFp6O6PB
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

The driver has runtime_suspend and runtime_resume callbacks, but
pm_runtime is never enabled so these functions won't be called. They
could not be used anyway because the runtime_suspend would cause jack
detect to stop working.

These functions are unused - delete them.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 51 +---------------------------------------------
 1 file changed, 1 insertion(+), 50 deletions(-)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 5e4d6791756b..0dbe4e23194b 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -25,7 +25,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
 #include <linux/of_device.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -2175,59 +2174,12 @@ static int cs42l42_i2c_remove(struct i2c_client *i2c_client)
 	if (i2c_client->irq)
 		devm_free_irq(&i2c_client->dev, i2c_client->irq, cs42l42);
 
-	pm_runtime_suspend(&i2c_client->dev);
-	pm_runtime_disable(&i2c_client->dev);
-
-	return 0;
-}
-
-#ifdef CONFIG_PM
-static int cs42l42_runtime_suspend(struct device *dev)
-{
-	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
-
-	regcache_cache_only(cs42l42->regmap, true);
-	regcache_mark_dirty(cs42l42->regmap);
-
-	/* Hold down reset */
 	gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
-
-	/* remove power */
-	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies),
-				cs42l42->supplies);
+	regulator_bulk_disable(ARRAY_SIZE(cs42l42->supplies), cs42l42->supplies);
 
 	return 0;
 }
 
-static int cs42l42_runtime_resume(struct device *dev)
-{
-	struct cs42l42_private *cs42l42 = dev_get_drvdata(dev);
-	int ret;
-
-	/* Enable power */
-	ret = regulator_bulk_enable(ARRAY_SIZE(cs42l42->supplies),
-					cs42l42->supplies);
-	if (ret != 0) {
-		dev_err(dev, "Failed to enable supplies: %d\n",
-			ret);
-		return ret;
-	}
-
-	gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
-	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
-
-	regcache_cache_only(cs42l42->regmap, false);
-	regcache_sync(cs42l42->regmap);
-
-	return 0;
-}
-#endif
-
-static const struct dev_pm_ops cs42l42_runtime_pm = {
-	SET_RUNTIME_PM_OPS(cs42l42_runtime_suspend, cs42l42_runtime_resume,
-			   NULL)
-};
-
 #ifdef CONFIG_OF
 static const struct of_device_id cs42l42_of_match[] = {
 	{ .compatible = "cirrus,cs42l42", },
@@ -2254,7 +2206,6 @@ MODULE_DEVICE_TABLE(i2c, cs42l42_id);
 static struct i2c_driver cs42l42_i2c_driver = {
 	.driver = {
 		.name = "cs42l42",
-		.pm = &cs42l42_runtime_pm,
 		.of_match_table = of_match_ptr(cs42l42_of_match),
 		.acpi_match_table = ACPI_PTR(cs42l42_acpi_match),
 		},
-- 
2.11.0

