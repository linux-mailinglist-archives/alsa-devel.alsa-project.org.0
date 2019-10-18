Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD6FBDC945
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 17:46:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64CF084C;
	Fri, 18 Oct 2019 17:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64CF084C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571413607;
	bh=F9yGoLrsPsiruH8qySHFLsG+5hm4HHHLK9QnXx4pDeQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WLvDOkbD6FzkBReK4Ee9u8FAj8tWSKUWa4hBpz9yM1M51ccrgRAsQyUfTvJyqEckQ
	 UyoOlFs0/ev/jFpdrS25FL7rjZCQQPPKfWSNoozH+yT2EfnRdT1QZbrfPzkRZfyHLv
	 y34x0v2gfH4aSgxrB1Us21ZAmmMm3qjrUE2PT4V8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 958DDF8063B;
	Fri, 18 Oct 2019 17:42:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39626F80611; Fri, 18 Oct 2019 17:42:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE045F80322
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 17:42:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE045F80322
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MEFrX-1iDXlf06Gj-00ABwm; Fri, 18 Oct 2019 17:42:26 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 18 Oct 2019 17:41:33 +0200
Message-Id: <20191018154201.1276638-18-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:TqURoHHVJJmB+BNcKhSOQIg0v6FOc3XqbZHPLBmLP4R4qV3sYnw
 Wj8jrIMhPIgJIiCbUcoB6dtFG7A6LCSnqqQyt8ataw+kTic0BPNHvJ+47PKruXnXFDSu85e
 +wOLnjABrp7TC9aqYKM1HcEW4uw9eFPgLPQr6fFAFymJdN2/X0iFDQk9+eSKJMk0BNbWhg5
 gneq88ZVmC0Ae440lGuSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:yDgI6IIkP4I=:Dwre/9Q/lAAK7XEGRGDeHA
 5wQ6CrppVUlAv7ty6RB6U4TBJnmLvFvR8V84o1QCpxtBwBLLng+q13n+ZNnjV4WCmFLHnrhz2
 aIVBdeoyRsygP0zDhjf/0ayvL08OsLQX18RtCKfPl9YjhrleOo+DWFSa4bMjhvsTwnzszgSIy
 QbbTnOTlZvYpclGokzepVa3WJyEt4I+hQzA6EI6fvFbwgyw1AYYoQI2g6bqsNMNvtJFRL6VLF
 x41JRYATNYsDilIRtAfCALbYPL9p66j2XjKWfqMlkOTIvq4bhHx1o8AqWJ3fmlbmf2SiAyqE9
 gi/tgII5JKupWpyww8JQcXQcgdBz4juLPcLIgOd2bwaP6sx71tycLcYzzXxS3FazV76GNkLBc
 8V+DfrFmAraFdB1459OpAKlw26XS1Nj5PTdZ4tUds0AYctoNL7aCS5UNj8tFOSdJsj3+lmYnr
 kAkpwMbVPbSrTn6M2XMutCbjjMqqyI9cZa/7PKWKUmhwUrmQedOE/SYeNnA5t8Yy/EN2Gtaz7
 3/DLM1TUOoeCMxKepkGBkBUFX8MhDzq3KWZympkfVyz8TMkYCs/Dix/m/sWJ5DN8YFNnvtc+K
 3AtZpCPdNx81OCQSF/Ru8V3f8gtL+Eo0qT2jHN1gyrJpFWABbAAluBrC+g+2s6etL9K9JJn4t
 UmG7zLDViZpWsc9RXv/ahVsfVvF7QGTpEGBowj6ZLtlWC2HaVEbxzCP/7/kXz5qtU978M9POI
 K4kcxA1iPGYq4NV/V90WmPpCWMSBF5BaO5zh3e5g/kc7dAmJytHL0xFbQOhsPIZkHYJTSZ/5y
 gofshTfkjZrwPiMBm9pptriZ7EWNbW6WHEy/semSfAUGW4GQqXsupl6K4v9x3c9b64c+2wyLr
 g9Ax+n5CcCDM0fOLODuA==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 18/46] ARM: pxa: corgi: use gpio descriptors
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

Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/corgi.c                    | 22 ++++++++++-
 arch/arm/mach-pxa/{include/mach => }/corgi.h |  2 +-
 arch/arm/mach-pxa/corgi_pm.c                 |  2 +-
 sound/soc/pxa/corgi.c                        | 40 +++++++++++++-------
 4 files changed, 50 insertions(+), 16 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/corgi.h (98%)

diff --git a/arch/arm/mach-pxa/corgi.c b/arch/arm/mach-pxa/corgi.c
index e9743ebbee86..0ff8e8140513 100644
--- a/arch/arm/mach-pxa/corgi.c
+++ b/arch/arm/mach-pxa/corgi.c
@@ -49,7 +49,7 @@
 #include <linux/platform_data/irda-pxaficp.h>
 #include <linux/platform_data/mmc-pxamci.h>
 #include "udc.h"
-#include <mach/corgi.h>
+#include "corgi.h"
 #include "sharpsl_pm.h"
 
 #include <asm/mach/sharpsl_param.h>
@@ -472,6 +472,25 @@ static struct platform_device corgiled_device = {
 	},
 };
 
+static struct gpiod_lookup_table corgi_audio_gpio_table = {
+	.dev_id = "corgi-audio",
+	.table = {
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MUTE_L - CORGI_SCOOP_GPIO_BASE,
+			    "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MUTE_R - CORGI_SCOOP_GPIO_BASE,
+			    "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_APM_ON - CORGI_SCOOP_GPIO_BASE,
+			    "apm-on", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop",
+			    CORGI_GPIO_MIC_BIAS - CORGI_SCOOP_GPIO_BASE,
+			    "mic-bias", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /*
  * Corgi Audio
  */
@@ -740,6 +759,7 @@ static void __init corgi_init(void)
 
  	pxa_set_udc_info(&udc_info);
 	gpiod_add_lookup_table(&corgi_mci_gpio_table);
+	gpiod_add_lookup_table(&corgi_audio_gpio_table);
 	pxa_set_mci_info(&corgi_mci_platform_data);
 	pxa_set_ficp_info(&corgi_ficp_platform_data);
 	pxa_set_i2c_info(NULL);
diff --git a/arch/arm/mach-pxa/include/mach/corgi.h b/arch/arm/mach-pxa/corgi.h
similarity index 98%
rename from arch/arm/mach-pxa/include/mach/corgi.h
rename to arch/arm/mach-pxa/corgi.h
index b565ca7b8cda..fe2fcf6532b9 100644
--- a/arch/arm/mach-pxa/include/mach/corgi.h
+++ b/arch/arm/mach-pxa/corgi.h
@@ -9,7 +9,7 @@
 #ifndef __ASM_ARCH_CORGI_H
 #define __ASM_ARCH_CORGI_H  1
 
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO */
 
 /*
  * Corgi (Non Standard) GPIO Definitions
diff --git a/arch/arm/mach-pxa/corgi_pm.c b/arch/arm/mach-pxa/corgi_pm.c
index ff1ac9bf37cb..c6ddfc737644 100644
--- a/arch/arm/mach-pxa/corgi_pm.c
+++ b/arch/arm/mach-pxa/corgi_pm.c
@@ -20,7 +20,7 @@
 #include <asm/irq.h>
 #include <asm/mach-types.h>
 
-#include <mach/corgi.h>
+#include "corgi.h"
 #include <mach/pxa2xx-regs.h>
 #include "sharpsl_pm.h"
 
diff --git a/sound/soc/pxa/corgi.c b/sound/soc/pxa/corgi.c
index 47647a1c3124..9db5a3d3606e 100644
--- a/sound/soc/pxa/corgi.c
+++ b/sound/soc/pxa/corgi.c
@@ -21,7 +21,6 @@
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/corgi.h>
 #include <linux/platform_data/asoc-pxa.h>
 
 #include "../codecs/wm8731.h"
@@ -41,6 +40,8 @@
 static int corgi_jack_func;
 static int corgi_spk_func;
 
+struct gpio_desc *gpiod_mute_l, *gpiod_mute_r, *gpiod_apm_on, *gpiod_mic_bias;
+
 static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 {
 	snd_soc_dapm_mutex_lock(dapm);
@@ -49,8 +50,8 @@ static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 	switch (corgi_jack_func) {
 	case CORGI_HP:
 		/* set = unmute headphone */
-		gpio_set_value(CORGI_GPIO_MUTE_L, 1);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 1);
+		gpiod_set_value(gpiod_mute_r, 1);
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Headphone Jack");
@@ -58,24 +59,24 @@ static void corgi_ext_control(struct snd_soc_dapm_context *dapm)
 		break;
 	case CORGI_MIC:
 		/* reset = mute headphone */
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		break;
 	case CORGI_LINE:
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		break;
 	case CORGI_HEADSET:
-		gpio_set_value(CORGI_GPIO_MUTE_L, 0);
-		gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 1);
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headphone Jack");
@@ -108,8 +109,8 @@ static int corgi_startup(struct snd_pcm_substream *substream)
 static void corgi_shutdown(struct snd_pcm_substream *substream)
 {
 	/* set = unmute headphone */
-	gpio_set_value(CORGI_GPIO_MUTE_L, 1);
-	gpio_set_value(CORGI_GPIO_MUTE_R, 1);
+	gpiod_set_value(gpiod_mute_l, 1);
+	gpiod_set_value(gpiod_mute_r, 1);
 }
 
 static int corgi_hw_params(struct snd_pcm_substream *substream,
@@ -199,14 +200,14 @@ static int corgi_set_spk(struct snd_kcontrol *kcontrol,
 static int corgi_amp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(CORGI_GPIO_APM_ON, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_apm_on, SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
 static int corgi_mic_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(CORGI_GPIO_MIC_BIAS, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value(gpiod_mic_bias, SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
@@ -293,6 +294,19 @@ static int corgi_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	gpiod_mute_l = devm_gpiod_get(&pdev->dev, "mute-l", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_mute_l))
+		return PTR_ERR(gpiod_mute_l);
+	gpiod_mute_r = devm_gpiod_get(&pdev->dev, "mute-r", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_mute_r))
+		return PTR_ERR(gpiod_mute_r);
+	gpiod_apm_on = devm_gpiod_get(&pdev->dev, "apm-on", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_apm_on))
+		return PTR_ERR(gpiod_apm_on);
+	gpiod_mic_bias = devm_gpiod_get(&pdev->dev, "mic-bias", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_mic_bias))
+		return PTR_ERR(gpiod_mic_bias);
+
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
