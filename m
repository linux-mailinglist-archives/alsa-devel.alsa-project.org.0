Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD9E742431
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:48:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED1084D;
	Thu, 29 Jun 2023 12:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED1084D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688035725;
	bh=bKELHWVc0gm7Wrq9rJb2qhEkSaXqfGvlib5oCM0+8EM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C4blO50p2lMEjpE/VgogDKVCDfkD3zkppasjRdKOhtHIE3xWq9fuFOnAOj7aDeYrP
	 fzdmbjXWYcSx+3zy7qkq5VkFHJjO3t5gyq2TTaaocixPIMijRcI7ka5U3RbX3JrjVe
	 s7GmVj+9FIU//Rqb4YYP0OYoKC4LW1axY8JUmxBM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71007F8027B; Thu, 29 Jun 2023 12:47:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 380EEF80544;
	Thu, 29 Jun 2023 12:47:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7F809F80212; Thu, 29 Jun 2023 12:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97ABEF80246
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97ABEF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A1wX8GIZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688035574; x=1719571574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bKELHWVc0gm7Wrq9rJb2qhEkSaXqfGvlib5oCM0+8EM=;
  b=A1wX8GIZuk7uZXj0lekrwzD/8dcnQdiSXTrnOfpIeuhmsb2ThYeGiOWw
   l5MUMCea1KozD898sGawuFrTjsd6FdGk0qAc/JNEQewPRop/QHrwrMD/a
   ZjSKwcPOXQCqXbba/s73XmkjLKUOojrtrxtWsf4IpJAT7iqFzzr56AJ0Z
   8tvXunbyRtFPeLuOz49ou6kk5w9T8up2gd3kG2vR+IQSx6dRCHQ2GU/B7
   /qwVBqQzf5L8Xk71wiy96nEyIjUuuax5yDdqYDm4qyra05Owf2W7r5osP
   1h6fVMnaSXYHYW3IcMuIKngxEKpq9IIl1l4/hi16Uso6Qi8k+6NloWgDB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="362115080"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="362115080"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2023 03:46:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963948381"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200";
   d="scan'208";a="963948381"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 03:46:04 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C55EC4DA; Thu, 29 Jun 2023 13:46:05 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1 2/3] ASoC: rt5677: Use device_get_match_data()
Date: Thu, 29 Jun 2023 13:46:02 +0300
Message-Id: <20230629104603.88612-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
References: <20230629104603.88612-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: S6WYEUA3YSPEALY2BWJAGZVUVSHG4DOF
X-Message-ID-Hash: S6WYEUA3YSPEALY2BWJAGZVUVSHG4DOF
X-MailFrom: andriy.shevchenko@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/S6WYEUA3YSPEALY2BWJAGZVUVSHG4DOF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use device_get_match_data() to simplify the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 21 ++++-----------------
 sound/soc/codecs/rt5677.h |  4 ++--
 2 files changed, 6 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 4ef9c88cb20a..4d09eb2a0755 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -6,7 +6,6 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
-#include <linux/acpi.h>
 #include <linux/fs.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
@@ -18,7 +17,6 @@
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/firmware.h>
-#include <linux/of_device.h>
 #include <linux/property.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
@@ -5559,6 +5557,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 
 static int rt5677_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct rt5677_priv *rt5677;
 	int ret;
 	unsigned int val;
@@ -5573,21 +5572,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 	INIT_DELAYED_WORK(&rt5677->dsp_work, rt5677_dsp_work);
 	i2c_set_clientdata(i2c, rt5677);
 
-	if (i2c->dev.of_node) {
-		const struct of_device_id *match_id;
-
-		match_id = of_match_device(rt5677_of_match, &i2c->dev);
-		if (match_id)
-			rt5677->type = (enum rt5677_type)match_id->data;
-	} else if (ACPI_HANDLE(&i2c->dev)) {
-		const struct acpi_device_id *acpi_id;
-
-		acpi_id = acpi_match_device(rt5677_acpi_match, &i2c->dev);
-		if (acpi_id)
-			rt5677->type = (enum rt5677_type)acpi_id->driver_data;
-	} else {
+	rt5677->type = (enum rt5677_type)(uintptr_t)device_get_match_data(dev);
+	if (rt5677->type == 0)
 		return -EINVAL;
-	}
 
 	rt5677_read_device_properties(rt5677, &i2c->dev);
 
@@ -5702,7 +5689,7 @@ static struct i2c_driver rt5677_i2c_driver = {
 	.driver = {
 		.name = RT5677_DRV_NAME,
 		.of_match_table = rt5677_of_match,
-		.acpi_match_table = ACPI_PTR(rt5677_acpi_match),
+		.acpi_match_table = rt5677_acpi_match,
 	},
 	.probe    = rt5677_i2c_probe,
 	.remove   = rt5677_i2c_remove,
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 944ae02aafc2..5ccdf1ba613a 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1753,8 +1753,8 @@ enum {
 };
 
 enum rt5677_type {
-	RT5677,
-	RT5676,
+	RT5677 = 1,
+	RT5676 = 2,
 };
 
 /* ASRC clock source selection */
-- 
2.40.0.1.gaa8946217a0b

