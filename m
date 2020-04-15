Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D311AAAF5
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 16:57:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9118F1616;
	Wed, 15 Apr 2020 16:56:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9118F1616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586962658;
	bh=v8O10uhI3rFO5z++1EImdugu8MrcttY02i+gBXPZnrQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qrpwigUR/Mx+TIEyr0iXqUqNamCUzLIny1cromu5fAkzRgxDmPZttdlIVs6SMNbyI
	 /CXfLJzimdBpjglFwSreHiv1vcnE+76Dj2kG8ZnGrz0wgN0FuA98TwYEr66pCTPqE4
	 fHnNhoRzimbbUcOd0hXGw5UjPQp8wXoqVoKRn0QU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 530EEF8026A;
	Wed, 15 Apr 2020 16:55:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 63603F8028C; Wed, 15 Apr 2020 16:55:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6788AF80264
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 16:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6788AF80264
IronPort-SDR: V7bHYo2UPlc60n7mFQG33fCj1UmJU3B5S6UQkgoZI+30UmCXoYuFGV2sRbgfbOvOske6gjwYpa
 TzkW8Dcd4CMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 07:55:46 -0700
IronPort-SDR: +KYJznJZrPzuyOD3Y42B+qzVt0oL0BhBCIGbGaF9acPAG1/G8vWQV6uHF6RjJTK9LzWrruuNdO
 C6H0y9RvFOdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,387,1580803200"; d="scan'208";a="453951224"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga005.fm.intel.com with ESMTP; 15 Apr 2020 07:55:44 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 684B2DD7; Wed, 15 Apr 2020 17:55:40 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 8/9] ASoC: rt5645: Switch DMI table match to a test of
 variable
Date: Wed, 15 Apr 2020 17:55:23 +0300
Message-Id: <20200415145524.31745-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415145524.31745-1-andriy.shevchenko@linux.intel.com>
References: <20200415145524.31745-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/rt5645.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 6ba1849a77b0..06bd3560b736 100644
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
@@ -3797,7 +3791,7 @@ static int rt5645_parse_dt(struct rt5645_priv *rt5645, struct device *dev)
 static int rt5645_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
-	struct rt5645_platform_data *pdata = dev_get_platdata(&i2c->dev);
+	const struct rt5645_platform_data *pdata = dev_get_platdata(&i2c->dev);
 	const struct dmi_system_id *dmi_data;
 	struct rt5645_priv *rt5645;
 	int ret, i;
@@ -3812,6 +3806,10 @@ static int rt5645_i2c_probe(struct i2c_client *i2c,
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
2.25.1

