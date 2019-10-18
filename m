Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3A1DC959
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 17:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8084E1672;
	Fri, 18 Oct 2019 17:47:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8084E1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571413726;
	bh=EvIaKlueOr79uvizoKfdljyxdg9Wh9i+9gCJcr8PwLE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FLwgXHghutk0zfY5bP4uQ9yqm7EG9ZwHtEaDlLTLlBDQKMSQaETslAHFWdkEvFEbc
	 kRMfRWe55o6XW0lHWECfant8aGm8fQYXtR9cTRp1mI8idxLkxnypaOoLUQqVzuUrfY
	 rVn8ELWHUcFnV/07QV38rGn76iGg9jyNW6zcvVI8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0F0F8065D;
	Fri, 18 Oct 2019 17:42:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E3B3FF80633; Fri, 18 Oct 2019 17:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 388B5F80323
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 17:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 388B5F80323
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1McpS0-1hmhsG1gOI-00ZwWl; Fri, 18 Oct 2019 17:42:26 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 18 Oct 2019 17:41:34 +0200
Message-Id: <20191018154201.1276638-19-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:VTDetqiA3IUPd37iiTjF8wmf8is9z0ii2hZFyGnfpBo7v9YzRzf
 eLPjN/VpyDbNNgQqFV9CrvQZZGL4LvF9qcdU1Wow93cSHhGzpdK2nq9u5Wx/PYPamq+3re6
 Sk/nIeH15eZgiayt6b8hOpI8KxPD9zRBZ9hEYEH+Pnp6QXXjHK5Q0mab6YaTZX96iJ0we8Q
 z9m8F5M9ZSmiBlVV9yRSg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Z5MPd9t3zuc=:f31rOBD3gYLsiOgUZCPLvb
 K/Wd1JvNV7F6gIvfl3p6iza//HPWorhTW38CfK+6SD/pXEIcjcuo8qh7NrKL//HaIuM2gm2qR
 n6KBMgZZ4gIQwhIeexa569uM8xBZIpXoPd5czCtWdFgb5jax+Jq+D6dvPUTUzXXfNETAYw+/R
 8DM9MHZFBhn2V8HoEk1okYWzovOFgYq8Ej/sALgYoaHYw2cKJWPkboR3eieBuXUXKHkWoHxr7
 9kNcaaaUDCiIuN1wtSTf/6hLoNwmqohiHuWcRulQG+mM3AuTdJQJE4FR886KE1MJq9CteBU9G
 iHYZuBp19msfHtU6hsmpOBWo86zga2Z8W1cIN04vewk3IvdMJEoefkwFTfMyhB8sfaLSKFxn2
 L1QhyoN0sr1Or430sUqOiyHLUAqNFq2BeGa7tTfzwflAGHiSkmthybx3qJSL9O8xkbtlA///T
 48YpjyVOYwOAB3bUSSpZO7hELaEMOz77+htSfhnJqUfCwz+119BJs6AIOjjqGooDKwjNnXGoU
 JWct38hOLypaQ1ZGwNhe1jFW0/sAGoZQSfS+5dE0kBASWFMqcJj4G4TDb6/m5WTu6R1IdMEBk
 9JhqiaK6b6cdNsnRXh9t1+oRdbADOHwgtNtvwrEBxvmYY93WuFFD6qnBZjBJNRz5P9dnEEAUb
 jaVTvl1DLADz26gL1VgGIvr4pFZjiA++Dz6/6DxjEW1NRakOZElbomRh0z8n2pphk/x9YzkXh
 KC/0sM/qf2pUjNc9Tcs/8s9vj0SGEAyj9IbyEXCl/k80SNVXG4nOcG6zJ4sSa4UjuuUYel277
 q2H2zM4VdnjppDQGBoVCF2kseF2BCbxh9dB0SZMRZTfz/4NJPKyivdMwg6BLXj07q/21+BlqZ
 SsdEOLWB8auzGCvIdxew==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Philipp Zabel <philipp.zabel@gmail.com>,
 Paul Parsons <lost.distance@yahoo.com>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 19/46] ARM: pxa: hx4700: use gpio descriptors
	for audio
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

The audio driver should not use a hardwired gpio number
from the header. Change it to use a lookup table.

Cc: Philipp Zabel <philipp.zabel@gmail.com>
Cc: Paul Parsons <lost.distance@yahoo.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/hx4700-pcmcia.c             |  2 +-
 arch/arm/mach-pxa/hx4700.c                    | 16 ++++++++-
 arch/arm/mach-pxa/{include/mach => }/hx4700.h |  2 +-
 sound/soc/pxa/hx4700.c                        | 34 ++++++++-----------
 4 files changed, 31 insertions(+), 23 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/hx4700.h (99%)

diff --git a/arch/arm/mach-pxa/hx4700-pcmcia.c b/arch/arm/mach-pxa/hx4700-pcmcia.c
index e8acbfc9ef6c..e2331dfe427d 100644
--- a/arch/arm/mach-pxa/hx4700-pcmcia.c
+++ b/arch/arm/mach-pxa/hx4700-pcmcia.c
@@ -10,7 +10,7 @@
 #include <linux/irq.h>
 
 #include <asm/mach-types.h>
-#include <mach/hx4700.h>
+#include "hx4700.h"
 
 #include <pcmcia/soc_common.h>
 
diff --git a/arch/arm/mach-pxa/hx4700.c b/arch/arm/mach-pxa/hx4700.c
index b3dcbe291e13..84383d14bf64 100644
--- a/arch/arm/mach-pxa/hx4700.c
+++ b/arch/arm/mach-pxa/hx4700.c
@@ -42,7 +42,7 @@
 
 #include "pxa27x.h"
 #include "addr-map.h"
-#include <mach/hx4700.h>
+#include "hx4700.h"
 #include <linux/platform_data/irda-pxaficp.h>
 
 #include <sound/ak4641.h>
@@ -823,6 +823,19 @@ static struct i2c_board_info i2c_board_info[] __initdata = {
 	},
 };
 
+static struct gpiod_lookup_table hx4700_audio_gpio_table = {
+	.dev_id = "hx4700-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO75_HX4700_EARPHONE_nDET,
+			    "earphone-ndet", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO92_HX4700_HP_DRIVER,
+			    "hp-driver", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa", GPIO107_HX4700_SPK_nSD,
+			    "spk-nsd", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct platform_device audio = {
 	.name	= "hx4700-audio",
 	.id	= -1,
@@ -883,6 +896,7 @@ static void __init hx4700_init(void)
 	pxa_set_stuart_info(NULL);
 
 	gpiod_add_lookup_table(&bq24022_gpiod_table);
+	gpiod_add_lookup_table(&hx4700_audio_gpio_table);
 	platform_add_devices(devices, ARRAY_SIZE(devices));
 	pwm_add_table(hx4700_pwm_lookup, ARRAY_SIZE(hx4700_pwm_lookup));
 
diff --git a/arch/arm/mach-pxa/include/mach/hx4700.h b/arch/arm/mach-pxa/hx4700.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/hx4700.h
rename to arch/arm/mach-pxa/hx4700.h
index 0c30e6d9c660..ce2db33989e1 100644
--- a/arch/arm/mach-pxa/include/mach/hx4700.h
+++ b/arch/arm/mach-pxa/hx4700.h
@@ -10,7 +10,7 @@
 
 #include <linux/gpio.h>
 #include <linux/mfd/asic3.h>
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
 
 #define HX4700_ASIC3_GPIO_BASE	PXA_NR_BUILTIN_GPIO
 #define HX4700_EGPIO_BASE	(HX4700_ASIC3_GPIO_BASE + ASIC3_NUM_GPIOS)
diff --git a/sound/soc/pxa/hx4700.c b/sound/soc/pxa/hx4700.c
index 0139343dbcce..2fae601f0844 100644
--- a/sound/soc/pxa/hx4700.c
+++ b/sound/soc/pxa/hx4700.c
@@ -10,7 +10,7 @@
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
 #include <linux/delay.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/jack.h>
@@ -18,10 +18,10 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
-#include <mach/hx4700.h>
 #include <asm/mach-types.h>
 #include "pxa2xx-i2s.h"
 
+static struct gpio_desc *gpiod_hp_driver, *gpiod_spk_nsd;
 static struct snd_soc_jack hs_jack;
 
 /* Headphones jack detection DAPM pin */
@@ -40,9 +40,8 @@ static struct snd_soc_jack_pin hs_jack_pin[] = {
 
 /* Headphones jack detection GPIO */
 static struct snd_soc_jack_gpio hs_jack_gpio = {
-	.gpio		= GPIO75_HX4700_EARPHONE_nDET,
 	.invert		= true,
-	.name		= "hp-gpio",
+	.name		= "earphone-ndet",
 	.report		= SND_JACK_HEADPHONE,
 	.debounce_time	= 200,
 };
@@ -81,14 +80,14 @@ static const struct snd_soc_ops hx4700_ops = {
 static int hx4700_spk_power(struct snd_soc_dapm_widget *w,
 			    struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(GPIO107_HX4700_SPK_nSD, !!SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_spk_nsd, !!SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
 static int hx4700_hp_power(struct snd_soc_dapm_widget *w,
 			   struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(GPIO92_HX4700_HP_DRIVER, !!SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_hp_driver, !!SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
@@ -162,11 +161,6 @@ static struct snd_soc_card snd_soc_card_hx4700 = {
 	.fully_routed		= true,
 };
 
-static struct gpio hx4700_audio_gpios[] = {
-	{ GPIO107_HX4700_SPK_nSD, GPIOF_OUT_INIT_HIGH, "SPK_POWER" },
-	{ GPIO92_HX4700_HP_DRIVER, GPIOF_OUT_INIT_LOW, "EP_POWER" },
-};
-
 static int hx4700_audio_probe(struct platform_device *pdev)
 {
 	int ret;
@@ -174,26 +168,26 @@ static int hx4700_audio_probe(struct platform_device *pdev)
 	if (!machine_is_h4700())
 		return -ENODEV;
 
-	ret = gpio_request_array(hx4700_audio_gpios,
-				ARRAY_SIZE(hx4700_audio_gpios));
+	gpiod_hp_driver = devm_gpiod_get(&pdev->dev, "hp-driver", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_driver);
+	if (ret)
+		return ret;
+	gpiod_spk_nsd = devm_gpiod_get(&pdev->dev, "spk-nsd", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_nsd);
 	if (ret)
 		return ret;
 
+	hs_jack_gpio.gpiod_dev = &pdev->dev;
 	snd_soc_card_hx4700.dev = &pdev->dev;
 	ret = devm_snd_soc_register_card(&pdev->dev, &snd_soc_card_hx4700);
-	if (ret)
-		gpio_free_array(hx4700_audio_gpios,
-				ARRAY_SIZE(hx4700_audio_gpios));
 
 	return ret;
 }
 
 static int hx4700_audio_remove(struct platform_device *pdev)
 {
-	gpio_set_value(GPIO92_HX4700_HP_DRIVER, 0);
-	gpio_set_value(GPIO107_HX4700_SPK_nSD, 0);
-
-	gpio_free_array(hx4700_audio_gpios, ARRAY_SIZE(hx4700_audio_gpios));
+	gpiod_set_value(gpiod_hp_driver, 0);
+	gpiod_set_value(gpiod_spk_nsd, 0);
 	return 0;
 }
 
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
