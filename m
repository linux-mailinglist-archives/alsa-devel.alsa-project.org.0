Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9150B8C8
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:40:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8BDA1741;
	Fri, 22 Apr 2022 15:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8BDA1741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650634822;
	bh=C2cC3nszzSR7Yg7EQ5FMtO6Bllai+VKT38Jvit2uDc8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QAB/hnxp1MEW+5c1gfFxVWsnaMeWbkK9eN4ICqqSNEMJ+R7KyI0Ob3XMZrN0LCH36
	 ikI4IViC/BUsCOMNLhs2Qz5o/qnFYAoEL+YKfU86GUSTEiFuuZPvsKOPqaM2OQvwKX
	 MVJ3tSDJaFivvfoM9JAB+YyaamMHZKWp3idUqJTk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 39C33F805F1;
	Fri, 22 Apr 2022 15:32:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 171F4F8025D; Tue, 19 Apr 2022 18:41:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 245F3F80116
 for <alsa-devel@alsa-project.org>; Tue, 19 Apr 2022 18:41:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 245F3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lJfs7uv7"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 84B5D6182E;
 Tue, 19 Apr 2022 16:40:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79E8DC385A5;
 Tue, 19 Apr 2022 16:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650386457;
 bh=C2cC3nszzSR7Yg7EQ5FMtO6Bllai+VKT38Jvit2uDc8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lJfs7uv7LS4DROe0ZEqAXf1BemzCSiR1n9q5pTBcQG14Rdk/Bok1Paom6lb0vD0cm
 ije+/8ArHxRKJaRYvlbGz9m+iaPOzZmd1uwU5s0IOYZTrkkemNzH/kJBRzyHiOZkrG
 KiVRrX/jL+JFZ87Q7XxHzop2CKv3G0/eQc4YVrjQsAOZ+/qLo79zDbsc5oxBF2efza
 CDyrl5WnAOPpLGjznX6xQc+QWZhDWWihqtFWdy5w+aKST9Ab0KZIJBuMOTuHrbmZlA
 1xPy7xRAfOi3AMuZzwWBxP7QLOwG5d+HiSgT8IPJ4ta7k1PytjOW3TnkjqmjRoC/fm
 4YELVox8EX7Qw==
From: Arnd Bergmann <arnd@kernel.org>
To: robert.jarzmik@free.fr,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 16/48] ARM: pxa: poodle: use platform data for poodle asoc
 driver
Date: Tue, 19 Apr 2022 18:37:38 +0200
Message-Id: <20220419163810.2118169-17-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220419163810.2118169-1-arnd@kernel.org>
References: <20220419163810.2118169-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:41 +0200
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-usb@vger.kernel.org,
 Philipp Zabel <philipp.zabel@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Sergey Lapin <slapin@ossfans.org>,
 linux-fbdev@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>,
 linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tomas Cech <sleep_walker@suse.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-rtc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Marek Vasut <marek.vasut@gmail.com>, Paul Parsons <lost.distance@yahoo.com>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-input@vger.kernel.org,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Lubomir Rintel <lkundrak@v3.sk>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Stephen Boyd <sboyd@kernel.org>, patches@opensource.cirrus.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org,
 linux-mips@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 alsa-devel@alsa-project.org, Daniel Mack <daniel@zonque.org>
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

The poodle audio driver shows its age by using a custom
gpio api for the "locomo" support chip.

In a perfect world, this would get converted to use gpiolib
and a gpio lookup table.

As the world is not perfect, just pass all the required data
in a custom platform_data structure. to avoid the globally
visible mach/poodle.h header.

Acked-by: Mark Brown <broonie@kernel.org>
Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/poodle.c                    | 30 ++++++++----
 arch/arm/mach-pxa/{include/mach => }/poodle.h |  4 +-
 include/linux/platform_data/asoc-poodle.h     | 16 ++++++
 sound/soc/pxa/poodle.c                        | 49 ++++++++++---------
 4 files changed, 63 insertions(+), 36 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/poodle.h (97%)
 create mode 100644 include/linux/platform_data/asoc-poodle.h

diff --git a/arch/arm/mach-pxa/poodle.c b/arch/arm/mach-pxa/poodle.c
index ca52882433d4..7772a39430ed 100644
--- a/arch/arm/mach-pxa/poodle.c
+++ b/arch/arm/mach-pxa/poodle.c
@@ -39,11 +39,13 @@
 #include <asm/mach/irq.h>
 
 #include "pxa25x.h"
-#include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
+#include "poodle.h"
+
+#include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/irda-pxaficp.h>
-#include <mach/poodle.h>
 #include <linux/platform_data/video-pxafb.h>
+#include <linux/platform_data/asoc-poodle.h>
 
 #include <asm/hardware/scoop.h>
 #include <asm/hardware/locomo.h>
@@ -155,12 +157,6 @@ static struct scoop_pcmcia_config poodle_pcmcia_config = {
 
 EXPORT_SYMBOL(poodle_scoop_device);
 
-
-static struct platform_device poodle_audio_device = {
-	.name	= "poodle-audio",
-	.id	= -1,
-};
-
 /* LoCoMo device */
 static struct resource locomo_resources[] = {
 	[0] = {
@@ -179,7 +175,7 @@ static struct locomo_platform_data locomo_info = {
 	.irq_base	= IRQ_BOARD_START,
 };
 
-struct platform_device poodle_locomo_device = {
+static struct platform_device poodle_locomo_device = {
 	.name		= "locomo",
 	.id		= 0,
 	.num_resources	= ARRAY_SIZE(locomo_resources),
@@ -189,7 +185,21 @@ struct platform_device poodle_locomo_device = {
 	},
 };
 
-EXPORT_SYMBOL(poodle_locomo_device);
+static struct poodle_audio_platform_data poodle_audio_pdata = {
+	.locomo_dev	= &poodle_locomo_device.dev,
+
+	.gpio_amp_on   	= POODLE_LOCOMO_GPIO_AMP_ON,
+	.gpio_mute_l   	= POODLE_LOCOMO_GPIO_MUTE_L,
+	.gpio_mute_r   	= POODLE_LOCOMO_GPIO_MUTE_R,
+	.gpio_232vcc_on	= POODLE_LOCOMO_GPIO_232VCC_ON,
+	.gpio_jk_b     	= POODLE_LOCOMO_GPIO_JK_B,
+};
+
+static struct platform_device poodle_audio_device = {
+	.name	= "poodle-audio",
+	.id	= -1,
+	.dev.platform_data = &poodle_audio_pdata,
+};
 
 #if defined(CONFIG_SPI_PXA2XX) || defined(CONFIG_SPI_PXA2XX_MODULE)
 static struct pxa2xx_spi_controller poodle_spi_info = {
diff --git a/arch/arm/mach-pxa/include/mach/poodle.h b/arch/arm/mach-pxa/poodle.h
similarity index 97%
rename from arch/arm/mach-pxa/include/mach/poodle.h
rename to arch/arm/mach-pxa/poodle.h
index b56b19351a03..e675a3d1aa18 100644
--- a/arch/arm/mach-pxa/include/mach/poodle.h
+++ b/arch/arm/mach-pxa/poodle.h
@@ -15,7 +15,7 @@
 #ifndef __ASM_ARCH_POODLE_H
 #define __ASM_ARCH_POODLE_H  1
 
-#include "irqs.h" /* PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_GPIO_TO_IRQ */
 
 /*
  * GPIOs
@@ -89,6 +89,4 @@
 
 #define POODLE_NR_IRQS		(IRQ_BOARD_START + 4)	/* 4 for LoCoMo */
 
-extern struct platform_device poodle_locomo_device;
-
 #endif /* __ASM_ARCH_POODLE_H  */
diff --git a/include/linux/platform_data/asoc-poodle.h b/include/linux/platform_data/asoc-poodle.h
new file mode 100644
index 000000000000..2052fad55c5c
--- /dev/null
+++ b/include/linux/platform_data/asoc-poodle.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __LINUX_PLATFORM_DATA_POODLE_AUDIO
+#define __LINUX_PLATFORM_DATA_POODLE_AUDIO
+
+/* locomo is not a proper gpio driver, and uses its own api */
+struct poodle_audio_platform_data {
+	struct device	*locomo_dev;
+
+	int		gpio_amp_on;
+	int		gpio_mute_l;
+	int		gpio_mute_r;
+	int		gpio_232vcc_on;
+	int		gpio_jk_b;
+};
+
+#endif
diff --git a/sound/soc/pxa/poodle.c b/sound/soc/pxa/poodle.c
index 176a0441235a..5fdaa477e85d 100644
--- a/sound/soc/pxa/poodle.c
+++ b/sound/soc/pxa/poodle.c
@@ -21,8 +21,8 @@
 
 #include <asm/mach-types.h>
 #include <asm/hardware/locomo.h>
-#include <mach/poodle.h>
 #include <linux/platform_data/asoc-pxa.h>
+#include <linux/platform_data/asoc-poodle.h>
 
 #include "../codecs/wm8731.h"
 #include "pxa2xx-i2s.h"
@@ -38,21 +38,23 @@
 static int poodle_jack_func;
 static int poodle_spk_func;
 
+static struct poodle_audio_platform_data *poodle_pdata;
+
 static void poodle_ext_control(struct snd_soc_dapm_context *dapm)
 {
 	/* set up jack connection */
 	if (poodle_jack_func == POODLE_HP) {
 		/* set = unmute headphone */
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_MUTE_L, 1);
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_MUTE_R, 1);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_mute_l, 1);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_mute_r, 1);
 		snd_soc_dapm_enable_pin(dapm, "Headphone Jack");
 	} else {
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_MUTE_L, 0);
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_MUTE_R, 0);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_mute_l, 0);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_mute_r, 0);
 		snd_soc_dapm_disable_pin(dapm, "Headphone Jack");
 	}
 
@@ -80,10 +82,10 @@ static int poodle_startup(struct snd_pcm_substream *substream)
 static void poodle_shutdown(struct snd_pcm_substream *substream)
 {
 	/* set = unmute headphone */
-	locomo_gpio_write(&poodle_locomo_device.dev,
-		POODLE_LOCOMO_GPIO_MUTE_L, 1);
-	locomo_gpio_write(&poodle_locomo_device.dev,
-		POODLE_LOCOMO_GPIO_MUTE_R, 1);
+	locomo_gpio_write(poodle_pdata->locomo_dev,
+		poodle_pdata->gpio_mute_l, 1);
+	locomo_gpio_write(poodle_pdata->locomo_dev,
+		poodle_pdata->gpio_mute_r, 1);
 }
 
 static int poodle_hw_params(struct snd_pcm_substream *substream,
@@ -174,11 +176,11 @@ static int poodle_amp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_AMP_ON, 0);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_amp_on, 0);
 	else
-		locomo_gpio_write(&poodle_locomo_device.dev,
-			POODLE_LOCOMO_GPIO_AMP_ON, 1);
+		locomo_gpio_write(poodle_pdata->locomo_dev,
+			poodle_pdata->gpio_amp_on, 1);
 
 	return 0;
 }
@@ -254,13 +256,14 @@ static int poodle_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &poodle;
 	int ret;
 
-	locomo_gpio_set_dir(&poodle_locomo_device.dev,
-		POODLE_LOCOMO_GPIO_AMP_ON, 0);
+	poodle_pdata = pdev->dev.platform_data;
+	locomo_gpio_set_dir(poodle_pdata->locomo_dev,
+		poodle_pdata->gpio_amp_on, 0);
 	/* should we mute HP at startup - burning power ?*/
-	locomo_gpio_set_dir(&poodle_locomo_device.dev,
-		POODLE_LOCOMO_GPIO_MUTE_L, 0);
-	locomo_gpio_set_dir(&poodle_locomo_device.dev,
-		POODLE_LOCOMO_GPIO_MUTE_R, 0);
+	locomo_gpio_set_dir(poodle_pdata->locomo_dev,
+		poodle_pdata->gpio_mute_l, 0);
+	locomo_gpio_set_dir(poodle_pdata->locomo_dev,
+		poodle_pdata->gpio_mute_r, 0);
 
 	card->dev = &pdev->dev;
 
-- 
2.29.2

