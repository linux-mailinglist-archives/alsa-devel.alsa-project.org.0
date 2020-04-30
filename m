Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D521BFCDD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Apr 2020 16:09:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D6A4B16CB;
	Thu, 30 Apr 2020 16:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D6A4B16CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588255749;
	bh=nBlhKQjcs3efVi4NZcBbisDbhZVPXk9x/PpK2fTGE28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qkSQovaQT7zz0cOR0bghC6209NPeWUmeZ11dSw8CVqCmSvgw1f36VZmzA8SN2Fd8Z
	 tu9OCrKWKGrfTZoot/urzVSxGuXdbQ5oTY+ekY3FMIDuB1RYWeGMtBcCA6nwVumYPA
	 s5HNjErO6gf4RSY4yB1wdrM0yiwpPhAt6Z96TFvo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A34DFF803B1;
	Thu, 30 Apr 2020 15:53:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7238BF80376; Thu, 30 Apr 2020 15:52:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BEE68F80369
 for <alsa-devel@alsa-project.org>; Thu, 30 Apr 2020 15:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BEE68F80369
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jU9bs-0004lc-NW; Thu, 30 Apr 2020 13:52:17 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2 3/3] ALSA: hda/realtek - Add LED class support for micmute
 LED
Date: Thu, 30 Apr 2020 21:52:07 +0800
Message-Id: <20200430135209.14703-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430083255.5093-3-kai.heng.feng@canonical.com>
References: <20200430083255.5093-3-kai.heng.feng@canonical.com>
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 Thomas Hebb <tommyhebb@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
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

Currently DMIC controls micmute LED via "audio mute LED trigger".

However, unlike Dell and Lenovo platforms, HP platforms don't provide a
way to control micmute LED via ACPI, it's controlled by HDA codec
instead.

So let's register an LED class for micmute so other subsystems like DMIC
can facilitate the codec-controlled LED.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Only compile the code when CONFIG_LEDS_TRIGGER_AUDIO is reachable.

 sound/pci/hda/patch_realtek.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6f164ccddde3..eae672cb6118 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -17,6 +17,7 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/hda_codec.h>
@@ -4103,6 +4104,26 @@ static void alc_gpio_micmute_update(struct hda_codec *codec)
 			    spec->gen.micmute_led.led_value);
 }
 
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+static int micmute_led_set(struct led_classdev *led_cdev,
+			   enum led_brightness brightness)
+{
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
+	struct alc_spec *spec = codec->spec;
+
+	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
+			    spec->micmute_led_polarity, !!brightness);
+	return 0;
+}
+
+static struct led_classdev micmute_led_cdev = {
+	.name = "hda::micmute",
+	.max_brightness = 1,
+	.brightness_set_blocking = micmute_led_set,
+	.default_trigger = "audio-micmute",
+};
+#endif
+
 /* setup mute and mic-mute GPIO bits, add hooks appropriately */
 static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  int action,
@@ -4110,6 +4131,7 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  unsigned int micmute_mask)
 {
 	struct alc_spec *spec = codec->spec;
+	int err;
 
 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
 
@@ -4122,6 +4144,13 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 	if (micmute_mask) {
 		spec->gpio_mic_led_mask = micmute_mask;
 		snd_hda_gen_add_micmute_led(codec, alc_gpio_micmute_update);
+
+#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+		err = devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev);
+		if (err)
+			codec_warn(codec, "failed to register micmute LED\n");
+#endif
 	}
 }
 
-- 
2.17.1

