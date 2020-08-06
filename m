Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9569723E04D
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 20:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33140829;
	Thu,  6 Aug 2020 20:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33140829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596738472;
	bh=e+f3yPZeAyOB2PCkpO7cSJPgxck9xwD2oLZxWzZuO9I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oDjgXXmuHtw7dao8ejST5HORetFQVFwnDuDJr4WdVd+TgZr8RzkxR4lxxZyFOclK7
	 uf82Y3comR9glMODfOxcNCMYh+FDrkhG3dZyrq0jl7Fts6pdeoFTZyaQLwoKqdLptF
	 deaOfLKlvxdaGtLvOvC+U54rGNvww6gBHBaZL9Q4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8949FF802E8;
	Thu,  6 Aug 2020 20:23:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68D0CF802EC; Thu,  6 Aug 2020 20:23:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SBL_CSS, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52A53F802E8
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 20:23:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52A53F802E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I7uZya9s"
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 90D6F22DD3;
 Thu,  6 Aug 2020 18:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596738217;
 bh=e+f3yPZeAyOB2PCkpO7cSJPgxck9xwD2oLZxWzZuO9I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I7uZya9saq0UqZmwUG8AK0D+IvAmRRHBT9Ne+FEAhZByTUCdpKco8PmJHi2rAc/Zl
 qr3EoyN74gZKAh5xkjzO48J65bSy9qpeneq3RPw+Z0N5h8zX4C1Wpo8kuvOQpn7V3W
 WL7dh344esDRop64PE7BPFOfA3wswkn8H4ylJa+A=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 28/41] ARM: s3c24xx: move iis pinctrl config into boards
Date: Thu,  6 Aug 2020 20:20:45 +0200
Message-Id: <20200806182059.2431-28-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Arnd Bergmann <arnd@arndb.de>, Sangbeom Kim <sbkim73@samsung.com>,
 Takashi Iwai <tiwai@suse.com>, Russell King <linux@armlinux.org.uk>,
 Krzysztof Kozlowski <krzk@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
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

From: Arnd Bergmann <arnd@arndb.de>

The s3c_gpio_cfgall_range() function is an internal interface of the
samsung gpio driver and should not be called directly by drivers, so
move the iis pin initialization into the boards.

This means the pin configuration is only run once at early boot, rather
than each time the driver binds, but the effect should be the same.

Note that the s3c2412-i2s driver has no boards using it in mainline linux,
the driver gets selected for the jive machine but is never instantiated.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-gta02.c    | 4 ++++
 arch/arm/mach-s3c24xx/mach-h1940.c    | 3 +++
 arch/arm/mach-s3c24xx/mach-mini2440.c | 5 +++++
 arch/arm/mach-s3c24xx/mach-n30.c      | 5 +++++
 arch/arm/mach-s3c24xx/mach-nexcoder.c | 5 +++++
 arch/arm/mach-s3c24xx/mach-otom.c     | 6 ++++++
 arch/arm/mach-s3c24xx/mach-qt2410.c   | 3 +++
 arch/arm/mach-s3c24xx/mach-rx1950.c   | 3 +++
 arch/arm/mach-s3c24xx/mach-rx3715.c   | 4 ++++
 arch/arm/mach-s3c24xx/mach-smdk2410.c | 5 +++++
 arch/arm/mach-s3c24xx/mach-smdk2413.c | 4 ++++
 arch/arm/mach-s3c24xx/mach-smdk2440.c | 6 +++++-
 arch/arm/mach-s3c24xx/mach-vstms.c    | 6 +++++-
 arch/arm/mach-s3c24xx/simtec-audio.c  | 6 ++++++
 sound/soc/samsung/s3c2412-i2s.c       | 7 -------
 sound/soc/samsung/s3c24xx-i2s.c       | 7 -------
 16 files changed, 63 insertions(+), 16 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 46a80fae7056..3c7f2a3d00a5 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -538,6 +538,10 @@ static void __init gta02_machine_init(void)
 
 	i2c_register_board_info(0, gta02_i2c_devs, ARRAY_SIZE(gta02_i2c_devs));
 
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
+
 	gpiod_add_lookup_table(&gta02_audio_gpio_table);
 	platform_add_devices(gta02_devices, ARRAY_SIZE(gta02_devices));
 	pm_power_off = gta02_poweroff;
diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index c7269cd26ba8..1f18ac4e84b2 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -707,6 +707,9 @@ static void __init h1940_init(void)
 	s3c24xx_fb_set_platdata(&h1940_fb_info);
 	gpiod_add_lookup_table(&h1940_mmc_gpio_table);
 	gpiod_add_lookup_table(&h1940_audio_gpio_table);
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	s3c24xx_mci_set_platdata(&h1940_mmc_cfg);
  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
 	s3c24xx_ts_set_platdata(&h1940_ts_cfg);
diff --git a/arch/arm/mach-s3c24xx/mach-mini2440.c b/arch/arm/mach-s3c24xx/mach-mini2440.c
index 65f48094114e..0bd2746f19a6 100644
--- a/arch/arm/mach-s3c24xx/mach-mini2440.c
+++ b/arch/arm/mach-s3c24xx/mach-mini2440.c
@@ -714,6 +714,11 @@ static void __init mini2440_init(void)
 		s3c_gpio_setpull(mini2440_buttons[i].gpio, S3C_GPIO_PULL_UP);
 		s3c_gpio_cfgpin(mini2440_buttons[i].gpio, S3C2410_GPIO_INPUT);
 	}
+
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
+
 	if (features.lcd_index != -1) {
 		int li;
 
diff --git a/arch/arm/mach-s3c24xx/mach-n30.c b/arch/arm/mach-s3c24xx/mach-n30.c
index 152f09242579..9410fcb82340 100644
--- a/arch/arm/mach-s3c24xx/mach-n30.c
+++ b/arch/arm/mach-s3c24xx/mach-n30.c
@@ -36,6 +36,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/irq.h>
@@ -599,6 +600,10 @@ static void __init n30_init(void)
 			      S3C2410_MISCCR_USBSUSPND0 |
 			      S3C2410_MISCCR_USBSUSPND1, 0x0);
 
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
+
 	if (machine_is_n30()) {
 		/* Turn off suspend on both USB ports, and switch the
 		 * selectable USB port to USB device mode. */
diff --git a/arch/arm/mach-s3c24xx/mach-nexcoder.c b/arch/arm/mach-s3c24xx/mach-nexcoder.c
index 5385437ef464..ec23b115261e 100644
--- a/arch/arm/mach-s3c24xx/mach-nexcoder.c
+++ b/arch/arm/mach-s3c24xx/mach-nexcoder.c
@@ -143,6 +143,11 @@ static void __init nexcoder_init_time(void)
 static void __init nexcoder_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
+
 	platform_add_devices(nexcoder_devices, ARRAY_SIZE(nexcoder_devices));
 };
 
diff --git a/arch/arm/mach-s3c24xx/mach-otom.c b/arch/arm/mach-s3c24xx/mach-otom.c
index e7eec5ccddb3..1f777ab4ced7 100644
--- a/arch/arm/mach-s3c24xx/mach-otom.c
+++ b/arch/arm/mach-s3c24xx/mach-otom.c
@@ -23,6 +23,8 @@
 #include <asm/mach/irq.h>
 
 #include <mach/regs-gpio.h>
+#include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
@@ -105,6 +107,10 @@ static void __init otom11_init_time(void)
 static void __init otom11_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
+
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	platform_add_devices(otom11_devices, ARRAY_SIZE(otom11_devices));
 }
 
diff --git a/arch/arm/mach-s3c24xx/mach-qt2410.c b/arch/arm/mach-s3c24xx/mach-qt2410.c
index 4ac3d0531992..5e33f3da629e 100644
--- a/arch/arm/mach-s3c24xx/mach-qt2410.c
+++ b/arch/arm/mach-s3c24xx/mach-qt2410.c
@@ -341,6 +341,9 @@ static void __init qt2410_machine_init(void)
 	s3c24xx_udc_set_platdata(&qt2410_udc_cfg);
 	s3c_i2c0_set_platdata(NULL);
 
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	gpiod_add_lookup_table(&qt2410_spi_gpiod_table);
 	s3c_gpio_setpull(S3C2410_GPB(0), S3C_GPIO_PULL_NONE);
 	gpiod_add_lookup_table(&qt2410_led_gpio_table);
diff --git a/arch/arm/mach-s3c24xx/mach-rx1950.c b/arch/arm/mach-s3c24xx/mach-rx1950.c
index a5461b2227bd..86d348f33972 100644
--- a/arch/arm/mach-s3c24xx/mach-rx1950.c
+++ b/arch/arm/mach-s3c24xx/mach-rx1950.c
@@ -828,6 +828,9 @@ static void __init rx1950_init_machine(void)
 
 	pwm_add_table(rx1950_pwm_lookup, ARRAY_SIZE(rx1950_pwm_lookup));
 	gpiod_add_lookup_table(&rx1950_audio_gpio_table);
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	platform_add_devices(rx1950_devices, ARRAY_SIZE(rx1950_devices));
 
 	i2c_register_board_info(0, rx1950_i2c_devices,
diff --git a/arch/arm/mach-s3c24xx/mach-rx3715.c b/arch/arm/mach-s3c24xx/mach-rx3715.c
index 617392de01ac..fc197cee77a0 100644
--- a/arch/arm/mach-s3c24xx/mach-rx3715.c
+++ b/arch/arm/mach-s3c24xx/mach-rx3715.c
@@ -38,6 +38,7 @@
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
 #include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <plat/cpu.h>
 #include <plat/devs.h>
@@ -197,6 +198,9 @@ static void __init rx3715_init_machine(void)
 
 	s3c_nand_set_platdata(&rx3715_nand_info);
 	s3c24xx_fb_set_platdata(&rx3715_fb_info);
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	platform_add_devices(rx3715_devices, ARRAY_SIZE(rx3715_devices));
 }
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2410.c b/arch/arm/mach-s3c24xx/mach-smdk2410.c
index 1d4d8735f283..c78fe1d8802c 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2410.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2410.c
@@ -19,6 +19,8 @@
 #include <linux/serial_s3c.h>
 #include <linux/platform_device.h>
 #include <linux/io.h>
+#include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -92,6 +94,9 @@ static void __init smdk2410_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
 	platform_add_devices(smdk2410_devices, ARRAY_SIZE(smdk2410_devices));
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	smdk_machine_init();
 }
 
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2413.c b/arch/arm/mach-s3c24xx/mach-smdk2413.c
index 9782cc3e698c..287bd502a030 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2413.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2413.c
@@ -37,6 +37,7 @@
 #include <linux/platform_data/i2c-s3c2410.h>
 #include <mach/gpio-samsung.h>
 #include <mach/fb.h>
+#include <plat/gpio-cfg.h>
 
 #include <plat/devs.h>
 #include <plat/cpu.h>
@@ -118,6 +119,9 @@ static void __init smdk2413_machine_init(void)
 
  	s3c24xx_udc_set_platdata(&smdk2413_udc_cfg);
 	s3c_i2c0_set_platdata(NULL);
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 
 	platform_add_devices(smdk2413_devices, ARRAY_SIZE(smdk2413_devices));
 	smdk_machine_init();
diff --git a/arch/arm/mach-s3c24xx/mach-smdk2440.c b/arch/arm/mach-s3c24xx/mach-smdk2440.c
index bd6a35105518..5939372ecec2 100644
--- a/arch/arm/mach-s3c24xx/mach-smdk2440.c
+++ b/arch/arm/mach-s3c24xx/mach-smdk2440.c
@@ -28,6 +28,8 @@
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
+#include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <mach/fb.h>
 #include <linux/platform_data/i2c-s3c2410.h>
@@ -165,7 +167,9 @@ static void __init smdk2440_machine_init(void)
 {
 	s3c24xx_fb_set_platdata(&smdk2440_fb_info);
 	s3c_i2c0_set_platdata(NULL);
-
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	platform_add_devices(smdk2440_devices, ARRAY_SIZE(smdk2440_devices));
 	smdk_machine_init();
 }
diff --git a/arch/arm/mach-s3c24xx/mach-vstms.c b/arch/arm/mach-s3c24xx/mach-vstms.c
index f0acbaa6dfd6..c6e777aab24e 100644
--- a/arch/arm/mach-s3c24xx/mach-vstms.c
+++ b/arch/arm/mach-s3c24xx/mach-vstms.c
@@ -30,6 +30,8 @@
 
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
+#include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <mach/fb.h>
 
@@ -147,7 +149,9 @@ static void __init vstms_init(void)
 {
 	s3c_i2c0_set_platdata(NULL);
 	s3c_nand_set_platdata(&vstms_nand_info);
-
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
 	platform_add_devices(vstms_devices, ARRAY_SIZE(vstms_devices));
 }
 
diff --git a/arch/arm/mach-s3c24xx/simtec-audio.c b/arch/arm/mach-s3c24xx/simtec-audio.c
index cfe78bf8cc9b..af87261e6a59 100644
--- a/arch/arm/mach-s3c24xx/simtec-audio.c
+++ b/arch/arm/mach-s3c24xx/simtec-audio.c
@@ -13,6 +13,8 @@
 #include <linux/io.h>
 
 #include <mach/regs-gpio.h>
+#include <mach/gpio-samsung.h>
+#include <plat/gpio-cfg.h>
 
 #include <linux/platform_data/asoc-s3c24xx_simtec.h>
 #include <plat/devs.h>
@@ -64,6 +66,10 @@ int __init simtec_audio_add(const char *name, bool has_lr_routing,
 	if (has_lr_routing)
 		simtec_audio_platdata.startup = simtec_audio_startup_lrroute;
 
+	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
+	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
+			      S3C_GPIO_PULL_NONE);
+
 	platform_device_register(&s3c_device_iis);
 	platform_device_register(&simtec_audio_dev);
 	return 0;
diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index edfa9d11d2e5..81f416ac457e 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -19,9 +19,6 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 
-#include <mach/gpio-samsung.h>
-#include <plat/gpio-cfg.h>
-
 #include "dma.h"
 #include "regs-i2s-v2.h"
 #include "s3c2412-i2s.h"
@@ -70,10 +67,6 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 	if (ret)
 		goto err;
 
-	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
-	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
-			      S3C_GPIO_PULL_NONE);
-
 	return 0;
 
 err:
diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 60bfaed5f7a6..50c08008aacb 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -18,10 +18,7 @@
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
 
-#include <mach/gpio-samsung.h>
-#include <plat/gpio-cfg.h>
 #include "regs-iis.h"
-
 #include "dma.h"
 #include "s3c24xx-i2s.h"
 
@@ -348,10 +345,6 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 	if (ret)
 		return ret;
 
-	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
-	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
-			      S3C_GPIO_PULL_NONE);
-
 	writel(S3C2410_IISCON_IISEN, s3c24xx_i2s.regs + S3C2410_IISCON);
 
 	s3c24xx_snd_txctrl(0);
-- 
2.17.1

