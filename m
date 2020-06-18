Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9FE1FF03E
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B7621768;
	Thu, 18 Jun 2020 13:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B7621768
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478611;
	bh=u9LOZbU9x1uhPdGO8lzGdZTfrmWj3WQ4uI81ZXjqmRE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JZE26mgnYiqDOEBI2vCqtZxiBkfyXXQsDSUlOWpkuypIJmJu+vMKWoNdHo5zaA3wf
	 6gpQdHw1FOE+UFW3h7QcIjXprAwEEf0F/ThmrqFnyA53ZPgpkhWXlPKmoG0kr3oB6h
	 5YKHvHd/kgQra1OMhXLGEqqotBlJgBTL4fcuNUPU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2CEDF80162;
	Thu, 18 Jun 2020 13:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B05BF802A1; Thu, 18 Jun 2020 13:08:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D6D1F800D1
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D6D1F800D1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7FE26AF26;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/13] ALSA: hda: generic: Add a helper for mic-mute LED with
 LED classdev
Date: Thu, 18 Jun 2020 13:08:31 +0200
Message-Id: <20200618110842.27238-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200618110842.27238-1-tiwai@suse.de>
References: <20200618110842.27238-1-tiwai@suse.de>
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>
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

A new helper, snd_hda_gen_add_micmute_led_cdev(), is introduced here
for creating a LED classdev and setting up the hook to the capture
control for controlling the mic-mute LED to follow the capture switch
change.  This will replace the existing users of
snd_hda_gen_add_micmute_led() in later patches.

Also, introduce a new kconfig CONFIG_SND_HDA_GENERIC_LEDS, to indicate
the usage of mute / mic-mute LED helpers.  It's selected by the codec
drivers (Realtek, Conexant and Sigmatel), while it selects the
necessary LED class dependencies.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/Kconfig         |  9 +++++++++
 sound/pci/hda/hda_generic.c   | 47 +++++++++++++++++++++++++++++++++++++++++--
 sound/pci/hda/hda_generic.h   |  5 +++++
 sound/pci/hda/patch_realtek.c | 30 +--------------------------
 4 files changed, 60 insertions(+), 31 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 7ba542e45a3d..3f9abdaef7f5 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -8,6 +8,9 @@ config SND_HDA
 	select SND_JACK
 	select SND_HDA_CORE
 
+config SND_HDA_GENERIC_LEDS
+       bool
+
 config SND_HDA_INTEL
 	tristate "HD Audio PCI"
 	depends on SND_PCI
@@ -91,6 +94,7 @@ config SND_HDA_PATCH_LOADER
 config SND_HDA_CODEC_REALTEK
 	tristate "Build Realtek HD-audio codec support"
 	select SND_HDA_GENERIC
+	select SND_HDA_GENERIC_LEDS
 	help
 	  Say Y or M here to include Realtek HD-audio codec support in
 	  snd-hda-intel driver, such as ALC880.
@@ -111,6 +115,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_SIGMATEL
 	tristate "Build IDT/Sigmatel HD-audio codec support"
 	select SND_HDA_GENERIC
+	select SND_HDA_GENERIC_LEDS
 	help
 	  Say Y or M here to include IDT (Sigmatel) HD-audio codec support in
 	  snd-hda-intel driver, such as STAC9200.
@@ -155,6 +160,7 @@ comment "Set to Y if you want auto-loading the codec driver"
 config SND_HDA_CODEC_CONEXANT
 	tristate "Build Conexant HD-audio codec support"
 	select SND_HDA_GENERIC
+	select SND_HDA_GENERIC_LEDS
 	help
 	  Say Y or M here to include Conexant HD-audio codec support in
 	  snd-hda-intel driver, such as CX20549.
@@ -215,6 +221,9 @@ comment "Set to Y if you want auto-loading the codec driver"
 
 config SND_HDA_GENERIC
 	tristate "Enable generic HD-audio codec parser"
+	select LEDS_CLASS if SND_HDA_GENERIC_LEDS
+	select LEDS_TRIGGERS if SND_HDA_GENERIC_LEDS
+	select LEDS_TRIGGER_AUDIO if SND_HDA_GENERIC_LEDS
 	help
 	  Say Y or M here to enable the generic HD-audio codec parser
 	  in snd-hda-intel driver.
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index c95ccffbd0cf..419cfbd0dc5c 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3887,6 +3887,7 @@ static int parse_mic_boost(struct hda_codec *codec)
 	return 0;
 }
 
+#ifdef CONFIG_SND_HDA_GENERIC_LEDS
 /*
  * mic mute LED hook helpers
  */
@@ -3923,10 +3924,8 @@ static void call_micmute_led_update(struct hda_codec *codec)
 	spec->micmute_led.led_value = val;
 	if (spec->micmute_led.update)
 		spec->micmute_led.update(codec);
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 	ledtrig_audio_set(LED_AUDIO_MICMUTE,
 			  spec->micmute_led.led_value ? LED_ON : LED_OFF);
-#endif
 }
 
 static void update_micmute_led(struct hda_codec *codec,
@@ -4050,6 +4049,50 @@ void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_fixup_micmute_led);
 
+/**
+ * snd_dha_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
+ * @codec: the HDA codec
+ * @callback: the callback for LED classdev brightness_set_blocking
+ *
+ * Called from the codec drivers for offering the mic mute LED controls.
+ * This creates a LED classdev and sets up the cap_sync_hook that is called at
+ * each time when the capture mixer switch changes.
+ *
+ * When NULL is passed to @callback, no classdev is created but only the
+ * LED-trigger is set up.
+ *
+ * Returns 0 or a negative error.
+ */
+int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
+				     int (*callback)(struct led_classdev *,
+						     enum led_brightness))
+{
+	int err;
+	struct led_classdev *cdev;
+
+	if (callback) {
+		cdev = devm_kzalloc(&codec->core.dev, sizeof(*cdev), GFP_KERNEL);
+		if (!cdev)
+			return -ENOMEM;
+
+		cdev->name = "hda::micmute";
+		cdev->max_brightness = 1;
+		cdev->default_trigger = "audio-micmute";
+		cdev->brightness_set_blocking = callback;
+		cdev->brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
+
+		err = devm_led_classdev_register(&codec->core.dev, cdev);
+		if (err) {
+			codec_warn(codec, "failed to create a mic-mute LED cdev\n");
+			return err;
+		}
+	}
+
+	return snd_hda_gen_add_micmute_led(codec, NULL);
+}
+EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led_cdev);
+#endif /* CONFIG_SND_HDA_GENERIC_LEDS */
+
 /*
  * parse digital I/Os and set up NIDs in BIOS auto-parse mode
  */
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index fb9f1a90238b..f56bc8da20b2 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -8,6 +8,8 @@
 #ifndef __SOUND_HDA_GENERIC_H
 #define __SOUND_HDA_GENERIC_H
 
+#include <linux/leds.h>
+
 /* table entry for multi-io paths */
 struct hda_multi_io {
 	hda_nid_t pin;		/* multi-io widget pin NID */
@@ -357,5 +359,8 @@ int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 				void (*hook)(struct hda_codec *));
 void snd_hda_gen_fixup_micmute_led(struct hda_codec *codec,
 				   const struct hda_fixup *fix, int action);
+int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
+				     int (*callback)(struct led_classdev *,
+						     enum led_brightness));
 
 #endif /* __SOUND_HDA_GENERIC_H */
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6d73f8beadb6..1d0fe9a0983f 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -4100,16 +4100,6 @@ static void alc_fixup_gpio_mute_hook(void *private_data, int enabled)
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
-static void alc_gpio_micmute_update(struct hda_codec *codec)
-{
-	struct alc_spec *spec = codec->spec;
-
-	alc_update_gpio_led(codec, spec->gpio_mic_led_mask,
-			    spec->micmute_led_polarity,
-			    spec->gen.micmute_led.led_value);
-}
-
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
 static int micmute_led_set(struct led_classdev *led_cdev,
 			   enum led_brightness brightness)
 {
@@ -4121,14 +4111,6 @@ static int micmute_led_set(struct led_classdev *led_cdev,
 	return 0;
 }
 
-static struct led_classdev micmute_led_cdev = {
-	.name = "hda::micmute",
-	.max_brightness = 1,
-	.brightness_set_blocking = micmute_led_set,
-	.default_trigger = "audio-micmute",
-};
-#endif
-
 /* setup mute and mic-mute GPIO bits, add hooks appropriately */
 static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  int action,
@@ -4136,9 +4118,6 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 				  unsigned int micmute_mask)
 {
 	struct alc_spec *spec = codec->spec;
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-	int err;
-#endif
 
 	alc_fixup_gpio(codec, action, mute_mask | micmute_mask);
 
@@ -4150,14 +4129,7 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 	}
 	if (micmute_mask) {
 		spec->gpio_mic_led_mask = micmute_mask;
-		snd_hda_gen_add_micmute_led(codec, alc_gpio_micmute_update);
-
-#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
-		micmute_led_cdev.brightness = ledtrig_audio_get(LED_AUDIO_MICMUTE);
-		err = devm_led_classdev_register(&codec->core.dev, &micmute_led_cdev);
-		if (err)
-			codec_warn(codec, "failed to register micmute LED\n");
-#endif
+		snd_hda_gen_add_micmute_led_cdev(codec, micmute_led_set);
 	}
 }
 
-- 
2.16.4

