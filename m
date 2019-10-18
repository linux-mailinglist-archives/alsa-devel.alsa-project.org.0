Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A1DC942
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 17:46:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F0CE1687;
	Fri, 18 Oct 2019 17:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F0CE1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571413560;
	bh=moUuperM+/epkEVmYJHH2m+aTPr3CgC1jr8hTXXTOnc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aoOMDiP0JBk3o4tzRbNKs8rhqzR/Mx6LfcZGWBv/3C1/xWeSQIidbH9uXUwMCWWsP
	 fQz8VH58F7Ds+tTeyzuuHDfYQaZ2z4y/nVzS1BPBRXA6adrxsbf8Ll4mGezt+L6Bmy
	 5buS1Zh8p/Dw/vjH/GIG4yjO9z2793wWCFiIBP54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 756D6F8063A;
	Fri, 18 Oct 2019 17:42:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 213B3F8060F; Fri, 18 Oct 2019 17:42:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 003EDF805FB
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 17:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 003EDF805FB
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1M3DFj-1iK6Hu39zx-003dRY; Fri, 18 Oct 2019 17:42:27 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 18 Oct 2019 17:41:38 +0200
Message-Id: <20191018154201.1276638-23-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cjdBav0l0UpRWDnSxUWkeDULSGZ8131Ss2R6vA9ICOozyyA8AhI
 J5Ms+VvXLMgtLTNHoEmTdyk5htB1jeqWROYYFpYKK92TY0sCB8KDTXPAfSCu4TbSNDVy0Dj
 pytBDXhGT4cEPIQR7K0nFk70ecqjXtCh1vFO13koPRhe4AEigqyQUR+Mxh8qQbBcYBVmR2d
 tc22pWqr8BrPuhAyHqu8A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8XXhRh5ZtT4=:pyBU5Wnn9fBZIQssW2sBRM
 LQKG1YHO95Ch5/RxCLc4I2/v4WNemH1r5UOwxDPTfP5kH9YdiSRsebMm6QknjTzAEmaT95mZY
 4gso8AtuwYMoEhA46FLqN59kzOjCemQ/+rhJMPyzYI3HjTv1qMD06IeMGyCRfjStJi4EDe9bc
 4XSmwehrv6tUidpUuAmqHwjPEb9PD+x/MmNejMy0BUoOqwAa4XLxVXLzOl8Dl6io7c66NXBHf
 9s33QoXoYAMNLqEYPQ2DqD0/nVH6rKbfcj7O7sM+4vbiPm5wLGPkNjAPqIXc1zkIshzhl5hJo
 hsPCCX0Y9qBCBOPt4lX3h5/eo/SLRY4M04Gzhh0GlCyXlTsaSyCmbXEK51gZY+PbDctQAgWgA
 kC6qJPi0qwb4ZWYqh/U7ZWsrr7LH05EgvwQp8Lmi4cDnPN+rBSA9r1FSS7sLb3h7Q/mXb0fqF
 4i8ZC+KSy17rZVO06Mpxko0Uqm2gc8D4nEJT3Wfdkx9VKqnZAsrJuycZA1t5SVSm0Wto70GXm
 Bd7YwJC8MD2nuR93nmKsZF0EK1VsKtDXcuq93YmFLm6n+yua+BDkEABgRmOmITDaqbD7lJsiD
 yXBG6iRDstwTb33S2GnQOQLXiYpaTzEqYfZEdXKAMm5Qe4KC7aTMa/c5U2xRNJabnJr7ksuca
 UwuNUg2q4KutVNub5Yxw2OFNUuokjAVheS/FkwR3JpJcDCzp//Hx72P0p6X4HockU6asBBh4Q
 oQxmyb2MpMwcazyB9u6msoUa1hlIpGY5LednMwHVeNmfbh+evEqo0QeSM0ZJGMrI3U5ZJW0T+
 vIvsYzj+VN1mzMlk31z84peCwOKo50NkTMj/k/vpEW/a6j49MsRhjcDIxIK0s099VokJaFNUo
 Uj7PuFz1pjsU4yoNmG4Q==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 23/46] ARM: pxa: z2: use gpio lookup for audio
	device
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

The audio device is allocated by the audio driver, and it uses a gpio
number from the mach/z2.h header file.

Change it to use a gpio lookup table for the device allocated by the
driver to keep the header file local to the machine.

Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/z2.c | 11 +++++++++++
 sound/soc/pxa/z2.c     |  5 ++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-pxa/z2.c b/arch/arm/mach-pxa/z2.c
index 900cefc4c5ea..874bdd49ad43 100644
--- a/arch/arm/mach-pxa/z2.c
+++ b/arch/arm/mach-pxa/z2.c
@@ -623,6 +623,15 @@ static void __init z2_spi_init(void)
 static inline void z2_spi_init(void) {}
 #endif
 
+static struct gpiod_lookup_table z2_audio_gpio_table = {
+	.dev_id = "soc-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa", GPIO37_ZIPITZ2_HEADSET_DETECT,
+			    "hsdet-gpio", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /******************************************************************************
  * Core power regulator
  ******************************************************************************/
@@ -727,6 +736,8 @@ static void __init z2_init(void)
 	z2_keys_init();
 	z2_pmic_init();
 
+	gpiod_add_lookup_table(&z2_audio_gpio_table);
+
 	pm_power_off = z2_power_off;
 }
 
diff --git a/sound/soc/pxa/z2.c b/sound/soc/pxa/z2.c
index 1fb3e7ac42fa..5147ed60fcd0 100644
--- a/sound/soc/pxa/z2.c
+++ b/sound/soc/pxa/z2.c
@@ -13,7 +13,7 @@
 #include <linux/timer.h>
 #include <linux/interrupt.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -22,7 +22,6 @@
 
 #include <asm/mach-types.h>
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/z2.h>
 
 #include "../codecs/wm8750.h"
 #include "pxa2xx-i2s.h"
@@ -89,7 +88,6 @@ static struct snd_soc_jack_pin hs_jack_pins[] = {
 /* Headset jack detection gpios */
 static struct snd_soc_jack_gpio hs_jack_gpios[] = {
 	{
-		.gpio		= GPIO37_ZIPITZ2_HEADSET_DETECT,
 		.name		= "hsdet-gpio",
 		.report		= SND_JACK_HEADSET,
 		.debounce_time	= 200,
@@ -195,6 +193,7 @@ static int __init z2_init(void)
 	if (!z2_snd_device)
 		return -ENOMEM;
 
+	hs_jack_gpios[0].gpiod_dev = &z2_snd_device->dev;
 	platform_set_drvdata(z2_snd_device, &snd_soc_z2);
 	ret = platform_device_add(z2_snd_device);
 
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
