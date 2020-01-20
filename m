Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE87142F5A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 17:12:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 546B61677;
	Mon, 20 Jan 2020 17:11:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 546B61677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579536729;
	bh=oeXO+ty+XFRuc1dIgJCIAyc0hxfzfcWcFzxpb4m8F1Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LLx1tBrRTE2aI7TD9JSgQAy22bMSpV/POQ2KUdirVXiUjcpr7K2cnOEL8USivw8Oy
	 /+WIWjdn6wU/HwEuwhH+lhbsQ0JFQ4VNt3PZ06jcwsdifjhTqbqWZDiHUMCExuY+86
	 nCPA3i99DNTf4kD5bn9lThDRpUxjDsfjvMAPtCy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71EFFF8027C;
	Mon, 20 Jan 2020 17:08:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D4AEF80273; Mon, 20 Jan 2020 17:08:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB2DBF8022D
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 17:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB2DBF8022D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 08:08:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,342,1574150400"; d="scan'208";a="426796861"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2020 08:08:16 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 33ED24DB; Mon, 20 Jan 2020 18:08:13 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Date: Mon, 20 Jan 2020 18:08:00 +0200
Message-Id: <20200120160801.53089-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
References: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 8/9] ASoC: rt5645: Switch DMI table match to
	a test of variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Since we have a common x86 quirk that provides an exported variable,
use it instead of local DMI table match.

Note, arch/x86/kernel/quirks.c::early_platform_detect_quirk() prints
the detected platform.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5645.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 92d67010aeed..3ccecb81bc37 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -12,6 +12,7 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
+#include <linux/platform_data/x86/machine.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
 #include <linux/gpio.h>
@@ -3674,13 +3675,6 @@ static const struct dmi_system_id dmi_platform_data[] = {
 		},
 		.driver_data = (void *)&intel_braswell_platform_data,
 	},
-	{
-		.ident = "Microsoft Surface 3",
-		.matches = {
-			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
-		},
-		.driver_data = (void *)&intel_braswell_platform_data,
-	},
 	{
 		/*
 		 * Match for the GPDwin which unfortunately uses somewhat
@@ -3789,7 +3783,7 @@ static int rt5645_parse_dt(struct rt5645_priv *rt5645, struct device *dev)
 static int rt5645_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
-	struct rt5645_platform_data *pdata = dev_get_platdata(&i2c->dev);
+	const struct rt5645_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	const struct dmi_system_id *dmi_data;
 	struct rt5645_priv *rt5645;
 	int ret, i;
@@ -3804,6 +3798,10 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
 	rt5645->i2c = i2c;
 	i2c_set_clientdata(i2c, rt5645);
 
+	/* Put it first to allow DMI to override, if needed */
+	if (x86_microsoft_surface_3_machine)
+		pdata = &intel_braswell_platform_data;
+
 	dmi_data = dmi_first_match(dmi_platform_data);
 	if (dmi_data) {
 		dev_info(&i2c->dev, "Detected %s platform\n", dmi_data->ident);
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
