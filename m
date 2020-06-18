Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5591FF05D
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:16:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67215175D;
	Thu, 18 Jun 2020 13:15:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67215175D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478979;
	bh=WQb29NkX8c3uJd0FMY2A0SmrUM3LeiyRpx046VoL3pk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YJd943FWKqXpUJGoWOmYqhhMoTqnQhr1Zauo+n5BI+etjE/lm1T6/+y7yJO7ET0zf
	 xfxhHFy4zMDac0jBWCJdbqumZNz8AcJq/wNyxSfmSXbdFcIKzTgSyyw5ENeCs+jJYV
	 xbITQLjBo4bjldFtEHOS5KiVqnqbEJJojIRqmcSA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 907C4F80306;
	Thu, 18 Jun 2020 13:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF65FF802DC; Thu, 18 Jun 2020 13:09:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98407F80252
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98407F80252
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BC898AF44;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/13] ALSA: hda/realtek: Use the new vmaster mute LED helper
Date: Thu, 18 Jun 2020 13:08:38 +0200
Message-Id: <20200618110842.27238-10-tiwai@suse.de>
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

Convert the mute LED handling in Realtek codec to the new vmaster mute
helper.  A point to be cautiously handled is that the value passed to
the callback is inverted; the vmaster passes "enabled" (0 = mute),
while LED classdev passes "brightness" (1 = mute).

The code in Thinkpad helper is also converted.   In that case, just
call the new function and remove the open-code.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c   | 54 +++++++++++++++++++++++------------------
 sound/pci/hda/thinkpad_helper.c | 17 ++-----------
 2 files changed, 32 insertions(+), 39 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 6831587fc4d6..87f7a1c3558d 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -80,7 +80,7 @@ struct alc_spec {
 	unsigned int gpio_data;
 	bool gpio_write_delay;	/* add a delay before writing gpio_data */
 
-	/* mute LED for HP laptops, see alc269_fixup_mic_mute_hook() */
+	/* mute LED for HP laptops, see vref_mute_led_set() */
 	int mute_led_polarity;
 	int micmute_led_polarity;
 	hda_nid_t mute_led_nid;
@@ -3990,23 +3990,25 @@ static void alc269_fixup_x101_headset_mic(struct hda_codec *codec,
 
 
 /* update mute-LED according to the speaker mute state via mic VREF pin */
-static void alc269_fixup_mic_mute_hook(void *private_data, int enabled)
+static int vref_mute_led_set(struct led_classdev *led_cdev,
+			     enum led_brightness brightness)
 {
-	struct hda_codec *codec = private_data;
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 	unsigned int pinval;
 
 	if (spec->mute_led_polarity)
-		enabled = !enabled;
+		brightness = !brightness;
 	pinval = snd_hda_codec_get_pin_target(codec, spec->mute_led_nid);
 	pinval &= ~AC_PINCTL_VREFEN;
-	pinval |= enabled ? AC_PINCTL_VREF_HIZ : AC_PINCTL_VREF_80;
+	pinval |= brightness ? AC_PINCTL_VREF_80 : AC_PINCTL_VREF_HIZ;
 	if (spec->mute_led_nid) {
 		/* temporarily power up/down for setting VREF */
 		snd_hda_power_up_pm(codec);
 		snd_hda_set_pin_ctl_cache(codec, spec->mute_led_nid, pinval);
 		snd_hda_power_down_pm(codec);
 	}
+	return 0;
 }
 
 /* Make sure the led works even in runtime suspend */
@@ -4044,8 +4046,7 @@ static void alc269_fixup_hp_mute_led(struct hda_codec *codec,
 			break;
 		spec->mute_led_polarity = pol;
 		spec->mute_led_nid = pin - 0x0a + 0x18;
-		spec->gen.vmaster_mute.hook = alc269_fixup_mic_mute_hook;
-		spec->gen.vmaster_mute_enum = 1;
+		snd_hda_gen_add_mute_led_cdev(codec, vref_mute_led_set);
 		codec->power_filter = led_power_filter;
 		codec_dbg(codec,
 			  "Detected mute LED for %x:%d\n", spec->mute_led_nid,
@@ -4063,8 +4064,7 @@ static void alc269_fixup_hp_mute_led_micx(struct hda_codec *codec,
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_polarity = 0;
 		spec->mute_led_nid = pin;
-		spec->gen.vmaster_mute.hook = alc269_fixup_mic_mute_hook;
-		spec->gen.vmaster_mute_enum = 1;
+		snd_hda_gen_add_mute_led_cdev(codec, vref_mute_led_set);
 		codec->power_filter = led_power_filter;
 	}
 }
@@ -4097,13 +4097,15 @@ static void alc_update_gpio_led(struct hda_codec *codec, unsigned int mask,
 }
 
 /* turn on/off mute LED via GPIO per vmaster hook */
-static void alc_fixup_gpio_mute_hook(void *private_data, int enabled)
+static int gpio_mute_led_set(struct led_classdev *led_cdev,
+			     enum led_brightness brightness)
 {
-	struct hda_codec *codec = private_data;
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 
 	alc_update_gpio_led(codec, spec->gpio_mute_led_mask,
-			    spec->mute_led_polarity, enabled);
+			    spec->mute_led_polarity, !brightness);
+	return 0;
 }
 
 /* turn on/off mic-mute LED via GPIO per capture hook */
@@ -4132,7 +4134,7 @@ static void alc_fixup_hp_gpio_led(struct hda_codec *codec,
 		return;
 	if (mute_mask) {
 		spec->gpio_mute_led_mask = mute_mask;
-		spec->gen.vmaster_mute.hook = alc_fixup_gpio_mute_hook;
+		snd_hda_gen_add_mute_led_cdev(codec, gpio_mute_led_set);
 	}
 	if (micmute_mask) {
 		spec->gpio_mic_led_mask = micmute_mask;
@@ -4214,19 +4216,25 @@ static void alc280_fixup_hp_gpio4(struct hda_codec *codec,
 }
 
 /* update mute-LED according to the speaker mute state via COEF bit */
-static void alc_fixup_mute_led_coefbit_hook(void *private_data, int enabled)
+static int coef_mute_led_set(struct led_classdev *led_cdev,
+			     enum led_brightness brightness)
 {
-	struct hda_codec *codec = private_data;
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 
 	if (spec->mute_led_polarity)
-		enabled = !enabled;
+		brightness = !brightness;
 
 	/* temporarily power up/down for setting COEF bit */
-	enabled ? alc_update_coef_idx(codec, spec->mute_led_coef_idx,
-		spec->mute_led_coefbit_mask, spec->mute_led_coefbit_off) :
-		  alc_update_coef_idx(codec, spec->mute_led_coef_idx,
-		spec->mute_led_coefbit_mask, spec->mute_led_coefbit_on);
+	if (brightness)
+		alc_update_coef_idx(codec, spec->mute_led_coef_idx,
+				    spec->mute_led_coefbit_mask,
+				    spec->mute_led_coefbit_on);
+	else
+		alc_update_coef_idx(codec, spec->mute_led_coef_idx,
+				    spec->mute_led_coefbit_mask,
+				    spec->mute_led_coefbit_off);
+	return 0;
 }
 
 static void alc285_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
@@ -4241,8 +4249,7 @@ static void alc285_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 		spec->mute_led_coefbit_mask = 1<<3;
 		spec->mute_led_coefbit_on = 1<<3;
 		spec->mute_led_coefbit_off = 0;
-		spec->gen.vmaster_mute.hook = alc_fixup_mute_led_coefbit_hook;
-		spec->gen.vmaster_mute_enum = 1;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
 	}
 }
 
@@ -4258,8 +4265,7 @@ static void alc236_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 		spec->mute_led_coefbit_mask = 1<<5;
 		spec->mute_led_coefbit_on = 0;
 		spec->mute_led_coefbit_off = 1<<5;
-		spec->gen.vmaster_mute.hook = alc_fixup_mute_led_coefbit_hook;
-		spec->gen.vmaster_mute_enum = 1;
+		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
 	}
 }
 
diff --git a/sound/pci/hda/thinkpad_helper.c b/sound/pci/hda/thinkpad_helper.c
index cd14d5a55b42..6698ae241efc 100644
--- a/sound/pci/hda/thinkpad_helper.c
+++ b/sound/pci/hda/thinkpad_helper.c
@@ -3,13 +3,11 @@
  * to be included from codec driver
  */
 
-#if IS_ENABLED(CONFIG_THINKPAD_ACPI) && IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
+#if IS_ENABLED(CONFIG_THINKPAD_ACPI)
 
 #include <linux/acpi.h>
 #include <linux/leds.h>
 
-static void (*old_vmaster_hook)(void *, int);
-
 static bool is_thinkpad(struct hda_codec *codec)
 {
 	return (codec->core.subsystem_id >> 16 == 0x17aa) &&
@@ -17,24 +15,13 @@ static bool is_thinkpad(struct hda_codec *codec)
 		acpi_dev_found("IBM0068"));
 }
 
-static void update_tpacpi_mute_led(void *private_data, int enabled)
-{
-	if (old_vmaster_hook)
-		old_vmaster_hook(private_data, enabled);
-
-	ledtrig_audio_set(LED_AUDIO_MUTE, enabled ? LED_OFF : LED_ON);
-}
-
 static void hda_fixup_thinkpad_acpi(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
 {
-	struct hda_gen_spec *spec = codec->spec;
-
 	if (action == HDA_FIXUP_ACT_PROBE) {
 		if (!is_thinkpad(codec))
 			return;
-		old_vmaster_hook = spec->vmaster_mute.hook;
-		spec->vmaster_mute.hook = update_tpacpi_mute_led;
+		snd_hda_gen_add_mute_led_cdev(codec, NULL);
 		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
 	}
 }
-- 
2.16.4

