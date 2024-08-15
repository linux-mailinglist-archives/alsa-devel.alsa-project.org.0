Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22B953628
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2024 16:49:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA2242BC8;
	Thu, 15 Aug 2024 16:49:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA2242BC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723733364;
	bh=j166Tnom1+Y3yM3OvCJCDtTfV/zCRiRZAbrAwgsB4wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JszcmbdcUpEAf5nnAWayu1K4UPLRXhJYPHorAV69lk2feYhScMYrJkSWyRT7/MnKv
	 J49S/tf6EIllq7wkPrZInCf/tVKjhRnDVOdesxkIvZ8q7MkIpJlserEBgQgbuf9NmK
	 7SdKnw5YYhLQA/JOqPBY2+6IKX1IPnMCpsCA+EqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD466F805AF; Thu, 15 Aug 2024 16:48:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D1B7F805AD;
	Thu, 15 Aug 2024 16:48:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B598AF80423; Thu, 15 Aug 2024 15:42:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 74C13F800BF
	for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2024 15:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74C13F800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=0mhkicfJ
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B5D0B61E9F;
	Thu, 15 Aug 2024 13:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85C6C32786;
	Thu, 15 Aug 2024 13:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723729250;
	bh=j166Tnom1+Y3yM3OvCJCDtTfV/zCRiRZAbrAwgsB4wg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0mhkicfJobEZ1aW+FLQwryHrVYOlx/pN/5mmGzBDGVF6p+mBPjlzfhxojoX5mgHCm
	 NMrcFQ4p2yvIqw5IDbzH25ptNHOifgjXu1CSx9kBmqoG2JBlDxDI4Nwvoy3WJOY8iu
	 i+Wa0Y/pxf9LeFzp/7qQ02Hk0GmhUBO805drH+XU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 039/484] ARM: pxa: spitz: use gpio descriptors for audio
Date: Thu, 15 Aug 2024 15:18:17 +0200
Message-ID: <20240815131942.785079397@linuxfoundation.org>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815131941.255804951@linuxfoundation.org>
References: <20240815131941.255804951@linuxfoundation.org>
User-Agent: quilt/0.67
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XIKGIQHS4Z723KBGL45BBN6WJJMGFO3L
X-Message-ID-Hash: XIKGIQHS4Z723KBGL45BBN6WJJMGFO3L
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XIKGIQHS4Z723KBGL45BBN6WJJMGFO3L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Arnd Bergmann <arnd@arndb.de>

[ Upstream commit 726d8c965bae2d7468445d990849e281dca8cbf7 ]

The audio driver should not use a hardwired gpio number
from the header. Change it to use a lookup table.

Acked-by: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Stable-dep-of: 78ab3d352f29 ("ARM: spitz: fix GPIO assignment for backlight")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/mach-pxa/spitz.c                    | 33 ++++++++++-
 arch/arm/mach-pxa/{include/mach => }/spitz.h |  2 +-
 arch/arm/mach-pxa/spitz_pm.c                 |  2 +-
 sound/soc/pxa/spitz.c                        | 58 ++++++++------------
 4 files changed, 57 insertions(+), 38 deletions(-)
 rename arch/arm/mach-pxa/{include/mach => }/spitz.h (99%)

diff --git a/arch/arm/mach-pxa/spitz.c b/arch/arm/mach-pxa/spitz.c
index 264de0bc97d68..8f880dbc05fdb 100644
--- a/arch/arm/mach-pxa/spitz.c
+++ b/arch/arm/mach-pxa/spitz.c
@@ -43,7 +43,7 @@
 #include <linux/platform_data/mmc-pxamci.h>
 #include <linux/platform_data/usb-ohci-pxa27x.h>
 #include <linux/platform_data/video-pxafb.h>
-#include <mach/spitz.h>
+#include "spitz.h"
 #include "sharpsl_pm.h"
 #include <mach/smemc.h>
 
@@ -954,11 +954,42 @@ static void __init spitz_i2c_init(void)
 static inline void spitz_i2c_init(void) {}
 #endif
 
+static struct gpiod_lookup_table spitz_audio_gpio_table = {
+	.dev_id = "spitz-audio",
+	.table = {
+		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
+			    "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
+			    "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.1", SPITZ_GPIO_MIC_BIAS - SPITZ_SCP2_GPIO_BASE,
+			    "mic", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct gpiod_lookup_table akita_audio_gpio_table = {
+	.dev_id = "spitz-audio",
+	.table = {
+		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_L - SPITZ_SCP_GPIO_BASE,
+			    "mute-l", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("sharp-scoop.0", SPITZ_GPIO_MUTE_R - SPITZ_SCP_GPIO_BASE,
+			    "mute-r", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("i2c-max7310", AKITA_GPIO_MIC_BIAS - AKITA_IOEXP_GPIO_BASE,
+			    "mic", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /******************************************************************************
  * Audio devices
  ******************************************************************************/
 static inline void spitz_audio_init(void)
 {
+	if (machine_is_akita())
+		gpiod_add_lookup_table(&akita_audio_gpio_table);
+	else
+		gpiod_add_lookup_table(&spitz_audio_gpio_table);
+
 	platform_device_register_simple("spitz-audio", -1, NULL, 0);
 }
 
diff --git a/arch/arm/mach-pxa/include/mach/spitz.h b/arch/arm/mach-pxa/spitz.h
similarity index 99%
rename from arch/arm/mach-pxa/include/mach/spitz.h
rename to arch/arm/mach-pxa/spitz.h
index 04828d8918aa3..f97e3ebd762d5 100644
--- a/arch/arm/mach-pxa/include/mach/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -11,7 +11,7 @@
 #define __ASM_ARCH_SPITZ_H  1
 #endif
 
-#include "irqs.h" /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
+#include <mach/irqs.h> /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
 #include <linux/fb.h>
 
 /* Spitz/Akita GPIOs */
diff --git a/arch/arm/mach-pxa/spitz_pm.c b/arch/arm/mach-pxa/spitz_pm.c
index 25a1f8c5a7382..6167f96d7b41e 100644
--- a/arch/arm/mach-pxa/spitz_pm.c
+++ b/arch/arm/mach-pxa/spitz_pm.c
@@ -20,7 +20,7 @@
 #include <asm/mach-types.h>
 #include <mach/hardware.h>
 
-#include <mach/spitz.h>
+#include "spitz.h"
 #include "pxa27x.h"
 #include "sharpsl_pm.h"
 
diff --git a/sound/soc/pxa/spitz.c b/sound/soc/pxa/spitz.c
index 7c1384a869ca4..44303b6eb228b 100644
--- a/sound/soc/pxa/spitz.c
+++ b/sound/soc/pxa/spitz.c
@@ -14,13 +14,12 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <asm/mach-types.h>
-#include <mach/spitz.h>
 #include "../codecs/wm8750.h"
 #include "pxa2xx-i2s.h"
 
@@ -37,7 +36,7 @@
 
 static int spitz_jack_func;
 static int spitz_spk_func;
-static int spitz_mic_gpio;
+static struct gpio_desc *gpiod_mic, *gpiod_mute_l, *gpiod_mute_r;
 
 static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 {
@@ -56,8 +55,8 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Headphone Jack");
-		gpio_set_value(SPITZ_GPIO_MUTE_L, 1);
-		gpio_set_value(SPITZ_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 1);
+		gpiod_set_value(gpiod_mute_r, 1);
 		break;
 	case SPITZ_MIC:
 		/* enable mic jack and bias, mute hp */
@@ -65,8 +64,8 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
-		gpio_set_value(SPITZ_GPIO_MUTE_L, 0);
-		gpio_set_value(SPITZ_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		break;
 	case SPITZ_LINE:
 		/* enable line jack, disable mic bias and mute hp */
@@ -74,8 +73,8 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Line Jack");
-		gpio_set_value(SPITZ_GPIO_MUTE_L, 0);
-		gpio_set_value(SPITZ_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		break;
 	case SPITZ_HEADSET:
 		/* enable and unmute headset jack enable mic bias, mute L hp */
@@ -83,8 +82,8 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
 		snd_soc_dapm_enable_pin_unlocked(dapm, "Headset Jack");
-		gpio_set_value(SPITZ_GPIO_MUTE_L, 0);
-		gpio_set_value(SPITZ_GPIO_MUTE_R, 1);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 1);
 		break;
 	case SPITZ_HP_OFF:
 
@@ -93,8 +92,8 @@ static void spitz_ext_control(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Headset Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Mic Jack");
 		snd_soc_dapm_disable_pin_unlocked(dapm, "Line Jack");
-		gpio_set_value(SPITZ_GPIO_MUTE_L, 0);
-		gpio_set_value(SPITZ_GPIO_MUTE_R, 0);
+		gpiod_set_value(gpiod_mute_l, 0);
+		gpiod_set_value(gpiod_mute_r, 0);
 		break;
 	}
 
@@ -199,7 +198,7 @@ static int spitz_set_spk(struct snd_kcontrol *kcontrol,
 static int spitz_mic_bias(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
-	gpio_set_value_cansleep(spitz_mic_gpio, SND_SOC_DAPM_EVENT_ON(event));
+	gpiod_set_value_cansleep(gpiod_mic, SND_SOC_DAPM_EVENT_ON(event));
 	return 0;
 }
 
@@ -287,39 +286,28 @@ static int spitz_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &snd_soc_spitz;
 	int ret;
 
-	if (machine_is_akita())
-		spitz_mic_gpio = AKITA_GPIO_MIC_BIAS;
-	else
-		spitz_mic_gpio = SPITZ_GPIO_MIC_BIAS;
-
-	ret = gpio_request(spitz_mic_gpio, "MIC GPIO");
-	if (ret)
-		goto err1;
-
-	ret = gpio_direction_output(spitz_mic_gpio, 0);
-	if (ret)
-		goto err2;
+	gpiod_mic = devm_gpiod_get(&pdev->dev, "mic", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_mic))
+		return PTR_ERR(gpiod_mic);
+	gpiod_mute_l = devm_gpiod_get(&pdev->dev, "mute-l", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_mute_l))
+		return PTR_ERR(gpiod_mute_l);
+	gpiod_mute_r = devm_gpiod_get(&pdev->dev, "mute-r", GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod_mute_r))
+		return PTR_ERR(gpiod_mute_r);
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		goto err2;
-	}
-
-	return 0;
 
-err2:
-	gpio_free(spitz_mic_gpio);
-err1:
 	return ret;
 }
 
 static int spitz_remove(struct platform_device *pdev)
 {
-	gpio_free(spitz_mic_gpio);
 	return 0;
 }
 
-- 
2.43.0



