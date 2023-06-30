Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23211744123
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832E6826;
	Fri, 30 Jun 2023 19:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832E6826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688145861;
	bh=Xfinsx2cbNjgygxyV5dAX8kY09FdNFlEzPlxBJeXw0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HMDFYbHaffl4ly8hqft4jloyjdlz+NChYl4jshSuOCNdNK6uLivLZeKxTNKhUOuXt
	 MNieFKp41zALNmLcEjIZ1yba3dQ45T5+9yI0gTqufZEYDszLQG4tbS+rGKQ5d75Ime
	 m8tXr0WKsdZx85u+UDfdsGnT8CYc/PAX++sDm/og=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 798A9F8059F; Fri, 30 Jun 2023 19:22:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3FBEF8059F;
	Fri, 30 Jun 2023 19:22:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EBBFF800E3; Fri, 30 Jun 2023 19:22:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 287CDF800E3
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 287CDF800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IUjoI/dz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145726; x=1719681726;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Xfinsx2cbNjgygxyV5dAX8kY09FdNFlEzPlxBJeXw0c=;
  b=IUjoI/dzWUcfKPwjX0QrHFm+LGsgd/I8JXrZ4tn5sEGyHmxMTuPGx/1A
   ofrvUaCbgg0dCvNP3K3Pyn3iGWxoj6H/vXkVegNa06d3AtJjpe/56Pg43
   I1eRBn28G5R26ffcjP3xJvc9iesoNNp+qa/E49RlfhHrLZ+RCJ10q8k4j
   toR26d1h6qvCX4nOZGSN8QQ0Gpr5tniNvVeh9FVe2mF6Ci3rzrtZejJIh
   RTTGACPYFvfCHwpbhySZ6pkxl2GGjhNC7YMXyU109EPgntQpIillz5902
   GAEzQJljTYWCUa/RkCB9+WUdduObbN1myQIbv35Yu75GFAjHYf5kKaFc0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="361298316"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="361298316"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="747486144"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="747486144"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 30 Jun 2023 10:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E97F5516; Fri, 30 Jun 2023 20:21:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 3/4] ASoC: rt5677: Use device_get_match_data()
Date: Fri, 30 Jun 2023 20:21:54 +0300
Message-Id: <20230630172155.83754-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4H2ZNBMB6LTZLXJGNP6FMAYSGZDZHJSX
X-Message-ID-Hash: 4H2ZNBMB6LTZLXJGNP6FMAYSGZDZHJSX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4H2ZNBMB6LTZLXJGNP6FMAYSGZDZHJSX/>
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
index 17d5dd5d2974..b0c15e27c763 100644
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
@@ -5531,6 +5529,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 
 static int rt5677_i2c_probe(struct i2c_client *i2c)
 {
+	struct device *dev = &i2c->dev;
 	struct rt5677_priv *rt5677;
 	int ret;
 	unsigned int val;
@@ -5545,21 +5544,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
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
 
@@ -5674,7 +5661,7 @@ static struct i2c_driver rt5677_i2c_driver = {
 	.driver = {
 		.name = RT5677_DRV_NAME,
 		.of_match_table = rt5677_of_match,
-		.acpi_match_table = ACPI_PTR(rt5677_acpi_match),
+		.acpi_match_table = rt5677_acpi_match,
 	},
 	.probe    = rt5677_i2c_probe,
 	.remove   = rt5677_i2c_remove,
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 5932b04cf85e..d67ebae067d9 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1691,8 +1691,8 @@ enum {
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

