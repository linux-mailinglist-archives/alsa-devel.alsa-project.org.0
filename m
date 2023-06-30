Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 328CC74411F
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 19:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3403822;
	Fri, 30 Jun 2023 19:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3403822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688145828;
	bh=852l4DCb7xc8jWGJwMlgO0SVAGdAQ8kwN02snMdlQxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GDmmVaU0vEkdu0COsgVdErLIMZsWSKe7fFTWYvHqZVxQ4TZSApeslpJUmKVJoI3HT
	 4L63ZNSh/4aRyErQLyQP618hPvBmYZnoxLkEIAuN0RCpcu3E0gDr8uYTfBfjWwf04z
	 0AhSCOAtQGFnqhkOlIf3nixWTCcS6uLvVpNE5kN4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2CB8F80552; Fri, 30 Jun 2023 19:22:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30431F80535;
	Fri, 30 Jun 2023 19:22:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 130BCF80124; Fri, 30 Jun 2023 19:22:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8BACF80124
	for <alsa-devel@alsa-project.org>; Fri, 30 Jun 2023 19:22:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8BACF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LAVhudUW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688145725; x=1719681725;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=852l4DCb7xc8jWGJwMlgO0SVAGdAQ8kwN02snMdlQxA=;
  b=LAVhudUWjaS5M5xynsApbICU3UonQNnDJI6tTUFGrHrtEWiURxZ6i2Yc
   iMdEjw4COWeDrCBNYMzVJGS0Z5/VmaZEaep6rffGtGm0n6qQbdfy5WxdY
   uDR/aSNGiBt2YOoNgAh1Cb1xQjmD+tL4bosZtBwZYvzzb6P0GhPN58hRb
   VkLeaVxCsDm4cq8NWIKBAOCpuVoQdZyuX7wJaVN3Hwd/mdyFDE3GsjlaK
   CXil/9ijbV/L7IoY2w/wwjvnM5RmpS4FijF8gxv6x/eKa3/YA96PLS167
   fTPO4fZyGKkm3x5HXWer4mzjT4SIFiUg8fO8V2VjlJ6AMbOOp088n1gE1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="342032360"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="342032360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 10:21:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="711879224"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200";
   d="scan'208";a="711879224"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 30 Jun 2023 10:21:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8EAF165; Fri, 30 Jun 2023 20:21:57 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 1/4] ASoC: rt5677: Refactor GPIO support code
Date: Fri, 30 Jun 2023 20:21:52 +0300
Message-Id: <20230630172155.83754-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
References: <20230630172155.83754-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZ5I53QROBELMK3AYCCGLU35JUVTKWB6
X-Message-ID-Hash: SZ5I53QROBELMK3AYCCGLU35JUVTKWB6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZ5I53QROBELMK3AYCCGLU35JUVTKWB6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

After compiler complains:

  sound/soc/codecs/rt5677.c:4748:30: warning: dubious: x | !y

I looked into the code and realized that we can refactor it
for better reading and fixing above issue at the same time.
Hence this change. It does not imply any functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt5677.c | 76 +++++++++++----------------------
 sound/soc/codecs/rt5677.h | 88 ++++++---------------------------------
 2 files changed, 37 insertions(+), 127 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index ad14d18860fc..3a2a6b150cda 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4717,50 +4717,34 @@ static int rt5677_set_bias_level(struct snd_soc_component *component,
 	return 0;
 }
 
+static int rt5677_update_gpio_bits(struct rt5677_priv *rt5677, unsigned offset, int m, int v)
+{
+	unsigned int bank = offset / 5;
+	unsigned int shift = (offset % 5) * 3;
+	unsigned int reg = bank ? RT5677_GPIO_CTRL3 : RT5677_GPIO_CTRL2;
+
+	return regmap_update_bits(rt5677->regmap, reg, m << shift, v << shift);
+}
+
 #ifdef CONFIG_GPIOLIB
 static void rt5677_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
+	int level = value ? RT5677_GPIOx_OUT_HI : RT5677_GPIOx_OUT_LO;
+	int m = RT5677_GPIOx_OUT_MASK;
 
-	switch (offset) {
-	case RT5677_GPIO1 ... RT5677_GPIO5:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
-			0x1 << (offset * 3 + 1), !!value << (offset * 3 + 1));
-		break;
-
-	case RT5677_GPIO6:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL3,
-			RT5677_GPIO6_OUT_MASK, !!value << RT5677_GPIO6_OUT_SFT);
-		break;
-
-	default:
-		break;
-	}
+	rt5677_update_gpio_bits(rt5677, offset, m, level);
 }
 
 static int rt5677_gpio_direction_out(struct gpio_chip *chip,
 				     unsigned offset, int value)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
+	int level = value ? RT5677_GPIOx_OUT_HI : RT5677_GPIOx_OUT_LO;
+	int m = RT5677_GPIOx_DIR_MASK | RT5677_GPIOx_OUT_MASK;
+	int v = RT5677_GPIOx_DIR_OUT | level;
 
-	switch (offset) {
-	case RT5677_GPIO1 ... RT5677_GPIO5:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
-			0x3 << (offset * 3 + 1),
-			(0x2 | !!value) << (offset * 3 + 1));
-		break;
-
-	case RT5677_GPIO6:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL3,
-			RT5677_GPIO6_DIR_MASK | RT5677_GPIO6_OUT_MASK,
-			RT5677_GPIO6_DIR_OUT | !!value << RT5677_GPIO6_OUT_SFT);
-		break;
-
-	default:
-		break;
-	}
-
-	return 0;
+	return rt5677_update_gpio_bits(rt5677, offset, m, v);
 }
 
 static int rt5677_gpio_get(struct gpio_chip *chip, unsigned offset)
@@ -4778,26 +4762,14 @@ static int rt5677_gpio_get(struct gpio_chip *chip, unsigned offset)
 static int rt5677_gpio_direction_in(struct gpio_chip *chip, unsigned offset)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
+	int m = RT5677_GPIOx_DIR_MASK;
+	int v = RT5677_GPIOx_DIR_IN;
 
-	switch (offset) {
-	case RT5677_GPIO1 ... RT5677_GPIO5:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
-			0x1 << (offset * 3 + 2), 0x0);
-		break;
-
-	case RT5677_GPIO6:
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL3,
-			RT5677_GPIO6_DIR_MASK, RT5677_GPIO6_DIR_IN);
-		break;
-
-	default:
-		break;
-	}
-
-	return 0;
+	return rt5677_update_gpio_bits(rt5677, offset, m, v);
 }
 
-/** Configures the gpio as
+/*
+ * Configures the GPIO as
  *   0 - floating
  *   1 - pull down
  *   2 - pull up
@@ -5673,9 +5645,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 		regmap_update_bits(rt5677->regmap, RT5677_GEN_CTRL2,
 					RT5677_GPIO5_FUNC_MASK,
 					RT5677_GPIO5_FUNC_DMIC);
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL2,
-					RT5677_GPIO5_DIR_MASK,
-					RT5677_GPIO5_DIR_OUT);
+		rt5677_update_gpio_bits(rt5677, RT5677_GPIO5,
+					RT5677_GPIOx_DIR_MASK,
+					RT5677_GPIOx_DIR_OUT);
 	}
 
 	if (rt5677->pdata.micbias1_vdd_3v3)
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 944ae02aafc2..5932b04cf85e 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1587,81 +1587,19 @@
 #define RT5677_FUNC_MODE_DMIC_GPIO		(0x0 << 13)
 #define RT5677_FUNC_MODE_JTAG			(0x1 << 13)
 
-/* GPIO Control 2 (0xc1) */
-#define RT5677_GPIO5_DIR_MASK			(0x1 << 14)
-#define RT5677_GPIO5_DIR_SFT			14
-#define RT5677_GPIO5_DIR_IN			(0x0 << 14)
-#define RT5677_GPIO5_DIR_OUT			(0x1 << 14)
-#define RT5677_GPIO5_OUT_MASK			(0x1 << 13)
-#define RT5677_GPIO5_OUT_SFT			13
-#define RT5677_GPIO5_OUT_LO			(0x0 << 13)
-#define RT5677_GPIO5_OUT_HI			(0x1 << 13)
-#define RT5677_GPIO5_P_MASK			(0x1 << 12)
-#define RT5677_GPIO5_P_SFT			12
-#define RT5677_GPIO5_P_NOR			(0x0 << 12)
-#define RT5677_GPIO5_P_INV			(0x1 << 12)
-#define RT5677_GPIO4_DIR_MASK			(0x1 << 11)
-#define RT5677_GPIO4_DIR_SFT			11
-#define RT5677_GPIO4_DIR_IN			(0x0 << 11)
-#define RT5677_GPIO4_DIR_OUT			(0x1 << 11)
-#define RT5677_GPIO4_OUT_MASK			(0x1 << 10)
-#define RT5677_GPIO4_OUT_SFT			10
-#define RT5677_GPIO4_OUT_LO			(0x0 << 10)
-#define RT5677_GPIO4_OUT_HI			(0x1 << 10)
-#define RT5677_GPIO4_P_MASK			(0x1 << 9)
-#define RT5677_GPIO4_P_SFT			9
-#define RT5677_GPIO4_P_NOR			(0x0 << 9)
-#define RT5677_GPIO4_P_INV			(0x1 << 9)
-#define RT5677_GPIO3_DIR_MASK			(0x1 << 8)
-#define RT5677_GPIO3_DIR_SFT			8
-#define RT5677_GPIO3_DIR_IN			(0x0 << 8)
-#define RT5677_GPIO3_DIR_OUT			(0x1 << 8)
-#define RT5677_GPIO3_OUT_MASK			(0x1 << 7)
-#define RT5677_GPIO3_OUT_SFT			7
-#define RT5677_GPIO3_OUT_LO			(0x0 << 7)
-#define RT5677_GPIO3_OUT_HI			(0x1 << 7)
-#define RT5677_GPIO3_P_MASK			(0x1 << 6)
-#define RT5677_GPIO3_P_SFT			6
-#define RT5677_GPIO3_P_NOR			(0x0 << 6)
-#define RT5677_GPIO3_P_INV			(0x1 << 6)
-#define RT5677_GPIO2_DIR_MASK			(0x1 << 5)
-#define RT5677_GPIO2_DIR_SFT			5
-#define RT5677_GPIO2_DIR_IN			(0x0 << 5)
-#define RT5677_GPIO2_DIR_OUT			(0x1 << 5)
-#define RT5677_GPIO2_OUT_MASK			(0x1 << 4)
-#define RT5677_GPIO2_OUT_SFT			4
-#define RT5677_GPIO2_OUT_LO			(0x0 << 4)
-#define RT5677_GPIO2_OUT_HI			(0x1 << 4)
-#define RT5677_GPIO2_P_MASK			(0x1 << 3)
-#define RT5677_GPIO2_P_SFT			3
-#define RT5677_GPIO2_P_NOR			(0x0 << 3)
-#define RT5677_GPIO2_P_INV			(0x1 << 3)
-#define RT5677_GPIO1_DIR_MASK			(0x1 << 2)
-#define RT5677_GPIO1_DIR_SFT			2
-#define RT5677_GPIO1_DIR_IN			(0x0 << 2)
-#define RT5677_GPIO1_DIR_OUT			(0x1 << 2)
-#define RT5677_GPIO1_OUT_MASK			(0x1 << 1)
-#define RT5677_GPIO1_OUT_SFT			1
-#define RT5677_GPIO1_OUT_LO			(0x0 << 1)
-#define RT5677_GPIO1_OUT_HI			(0x1 << 1)
-#define RT5677_GPIO1_P_MASK			(0x1 << 0)
-#define RT5677_GPIO1_P_SFT			0
-#define RT5677_GPIO1_P_NOR			(0x0 << 0)
-#define RT5677_GPIO1_P_INV			(0x1 << 0)
-
-/* GPIO Control 3 (0xc2) */
-#define RT5677_GPIO6_DIR_MASK			(0x1 << 2)
-#define RT5677_GPIO6_DIR_SFT			2
-#define RT5677_GPIO6_DIR_IN			(0x0 << 2)
-#define RT5677_GPIO6_DIR_OUT			(0x1 << 2)
-#define RT5677_GPIO6_OUT_MASK			(0x1 << 1)
-#define RT5677_GPIO6_OUT_SFT			1
-#define RT5677_GPIO6_OUT_LO			(0x0 << 1)
-#define RT5677_GPIO6_OUT_HI			(0x1 << 1)
-#define RT5677_GPIO6_P_MASK			(0x1 << 0)
-#define RT5677_GPIO6_P_SFT			0
-#define RT5677_GPIO6_P_NOR			(0x0 << 0)
-#define RT5677_GPIO6_P_INV			(0x1 << 0)
+/* GPIO Control 2 (0xc1) & 3 (0xc2) common bits */
+#define RT5677_GPIOx_DIR_MASK			(0x1 << 2)
+#define RT5677_GPIOx_DIR_SFT			2
+#define RT5677_GPIOx_DIR_IN			(0x0 << 2)
+#define RT5677_GPIOx_DIR_OUT			(0x1 << 2)
+#define RT5677_GPIOx_OUT_MASK			(0x1 << 1)
+#define RT5677_GPIOx_OUT_SFT			1
+#define RT5677_GPIOx_OUT_LO			(0x0 << 1)
+#define RT5677_GPIOx_OUT_HI			(0x1 << 1)
+#define RT5677_GPIOx_P_MASK			(0x1 << 0)
+#define RT5677_GPIOx_P_SFT			0
+#define RT5677_GPIOx_P_NOR			(0x0 << 0)
+#define RT5677_GPIOx_P_INV			(0x1 << 0)
 
 /* General Control (0xfa) */
 #define RT5677_IRQ_DEBOUNCE_SEL_MASK		(0x3 << 3)
-- 
2.40.0.1.gaa8946217a0b

