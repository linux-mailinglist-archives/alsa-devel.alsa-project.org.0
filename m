Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 830841FC57E
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 07:00:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1243F1678;
	Wed, 17 Jun 2020 06:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1243F1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592370038;
	bh=y9Ta6EwF9AE87jqwd/NojPnS2wZp8LlHC544bmiCAFs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Dx/UyLyybeT0MGk8M5G68F4nHQzWKqWOl9dnzFejDGHvsD/Wd4C/0+Fd819es1uJZ
	 sgxFGk9ssMgDrIjrnuM5W0oXEzQLGMsw6JHCvVDCUpY/NPqpY0jgE3Y3hmewu9gdyV
	 kw3IB2gYblQwkz/D9suCP5E9/u3Oa35/jqX0wSx0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07268F801EB;
	Wed, 17 Jun 2020 06:58:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8431F801D9; Wed, 17 Jun 2020 06:58:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0EE71F800EF
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 06:58:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE71F800EF
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jlQ9g-0006w0-U0; Wed, 17 Jun 2020 04:58:33 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: tiwai@suse.com
Subject: [PATCH v2 1/2] ALSA: hda/realtek: Add COEF controlled micmute LED
 support
Date: Wed, 17 Jun 2020 12:58:24 +0800
Message-Id: <20200617045828.3735-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
Cc: Wenwen Wang <wenwen@cs.uga.edu>, Kailang Yang <kailang@realtek.com>,
 Tomas Espeleta <tomas.espeleta@gmail.com>, Thomas Hebb <tommyhebb@gmail.com>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>
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

Currently, HDA codec LED class can only used by by GPIO controlled LED.
However, there are some new systems that control LED via COEF instead of
GPIO.

In order to support those systems, create a new helper that can be
facilitated by both COEF controlled and GPIO controlled LED, and use
generic call_micmute_led_update() to control both case.

In addition to that, add LED_CORE_SUSPENDRESUME flag since some systems
don't restore the LED properly after suspend.

Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
v2:
 - Prevent platforms like Dell, Lenovoe and Huawei create double LED
   class devices.

 sound/pci/hda/hda_generic.c   |  3 ++-
 sound/pci/hda/hda_generic.h   |  1 +
 sound/pci/hda/patch_realtek.c | 29 ++++++++++++++++-------------
 3 files changed, 19 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index f4e9d9445e18..9c3f1990c621 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3897,7 +3897,7 @@ enum {
 	MICMUTE_LED_FOLLOW_MUTE,
 };
 
-static void call_micmute_led_update(struct hda_codec *codec)
+void call_micmute_led_update(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
 	unsigned int val;
@@ -3924,6 +3924,7 @@ static void call_micmute_led_update(struct hda_codec *codec)
 	if (spec->micmute_led.update)
 		spec->micmute_led.update(codec);
 }
+EXPORT_SYMBOL_GPL(call_micmute_led_update);
 
 static void update_micmute_led(struct hda_codec *codec,
 			       struct snd_kcontrol *kcontrol,
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index fb9f1a90238b..9f08a9ee9112 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -353,6 +353,7 @@ unsigned int snd_hda_gen_path_power_filter(struct hda_codec *codec,
 void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, bool on);
 int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t pin);
 
+void call_micmute_led_update(struct hda_codec *codec);
 int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 				void (*hook)(struct hda_codec *));
 void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d73f8beadb6..9691af8241cf 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4114,10 +4114,10 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
 	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
-	struct alc_spec *spec = codec->spec;
+	struct hda_gen_spec *spec = codec->spec;
 
-	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->micmute_led_polarity, !!brightness);
+	spec->micmute_led.led_mode = !brightness;
+	call_micmute_led_update(codec);
 	return 0;
 }
 
@@ -4126,7 +4126,17 @@ static struct led_classdev micmute_led_cdev = {
 	.max_brightness = 1,
 	.brightness_set_blocking = micmute_led_set,
 	.default_trigger = "audio-micmute",
+	.flags = LED_CORE_SUSPENDRESUME,
 };
+
+static void alc_register_micmute_led(struct hda_codec *codec)
+{
+		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+		if (devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev))
+			codec_warn(codec, "failed to register micmute LED\n");
+}
+#else
+static inline void alc_register_micmute_led(struct hda_codec *codec) {}
 #endif
 
 /* setup mute and mic-mute GPIO bits, add hooks appropriately */
@@ -4136,9 +4146,6 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  unsigned int micmute_mask)
 {
 	struct alc_spec *spec = codec->spec;
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-	int err;
-#endif
 
 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
 
@@ -4151,13 +4158,7 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 	if (micmute_mask) {
 		spec->gpio_mic_led_mask = micmute_mask;
 		snd_hda_gen_add_micmute_led(codec, alc_gpio_micmute_update);
-
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-		err = devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev);
-		if (err)
-			codec_warn(codec, "failed to register micmute LED\n");
-#endif
+		alc_register_micmute_led(codec);
 	}
 }
 
@@ -4305,6 +4306,7 @@ static void alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 		spec->mic_led_coefbit_on = 1<<13;
 		spec->mic_led_coefbit_off = 0;
 		snd_hda_gen_add_micmute_led(codec, alc_hp_cap_micmute_update);
+		alc_register_micmute_led(codec);
 	}
 }
 
@@ -4319,6 +4321,7 @@ static void alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 		spec->mic_led_coefbit_on = 2<<2;
 		spec->mic_led_coefbit_off = 1<<2;
 		snd_hda_gen_add_micmute_led(codec, alc_hp_cap_micmute_update);
+		alc_register_micmute_led(codec);
 	}
 }
 
-- 
2.17.1

