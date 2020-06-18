Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CACD1FF054
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:14:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 174211750;
	Thu, 18 Jun 2020 13:13:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 174211750
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478853;
	bh=DztJoI8gXJFEi/+USaPog8hJO+QPCpUnLsfSibFam7Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nzPgf/lkTv60AYMigojM//caBCPH5UVbeQP5gBP55SSJmKJ/SVZNeb7qjADLNIhRp
	 gJaSGRJKK/0AYVy2OeynhiF/UaaLEr6ZD7Zv35e3pZSZVZA9cfNYbf4YzIc5nb9Z2S
	 AAwjztdoFk/+fAkJDn5b5/5u4lRq1I+ScgBZcT4M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27D28F802E8;
	Thu, 18 Jun 2020 13:09:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C54EF802DB; Thu, 18 Jun 2020 13:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 95F07F801ED
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 95F07F801ED
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A8C76AF3B;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/13] ALSA: hda: generic: Drop the old mic-mute LED hook
Date: Thu, 18 Jun 2020 13:08:36 +0200
Message-Id: <20200618110842.27238-8-tiwai@suse.de>
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

Now all users of the old snd_hda_gen_add_micmute_led() have been
converted to the new LED-classdev variant, and we can make it local,
and remove the unused hda_gen_spec.micmute_led.update callback field.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_generic.c | 22 +++-------------------
 sound/pci/hda/hda_generic.h |  3 ---
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 53a328d21e96..c97a1404af6b 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -3922,8 +3922,6 @@ static void call_micmute_led_update(struct hda_codec *codec)
 	if (val == spec->micmute_led.led_value)
 		return;
 	spec->micmute_led.led_value = val;
-	if (spec->micmute_led.update)
-		spec->micmute_led.update(codec);
 	ledtrig_audio_set(LED_AUDIO_MICMUTE,
 			  spec->micmute_led.led_value ? LED_ON : LED_OFF);
 }
@@ -3997,20 +3995,8 @@ static const struct snd_kcontrol_new micmute_led_mode_ctl = {
 	.put = micmute_led_mode_put,
 };
 
-/**
- * snd_hda_gen_add_micmute_led - helper for setting up mic mute LED hook
- * @codec: the HDA codec
- * @hook: the callback for updating LED
- *
- * Called from the codec drivers for offering the mic mute LED controls.
- * When established, it sets up cap_sync_hook and triggers the callback at
- * each time when the capture mixer switch changes.  The callback is supposed
- * to update the LED accordingly.
- *
- * Returns 0 if the hook is established or a negative error code.
- */
-int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
-				void (*hook)(struct hda_codec *))
+/* Set up the capture sync hook for controlling the mic-mute LED */
+static int add_micmute_led_hook(struct hda_codec *codec)
 {
 	struct hda_gen_spec *spec = codec->spec;
 
@@ -4018,13 +4004,11 @@ int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
 	spec->micmute_led.capture = 0;
 	spec->micmute_led.led_value = 0;
 	spec->micmute_led.old_hook = spec->cap_sync_hook;
-	spec->micmute_led.update = hook;
 	spec->cap_sync_hook = update_micmute_led;
 	if (!snd_hda_gen_add_kctl(spec, NULL, &micmute_led_mode_ctl))
 		return -ENOMEM;
 	return 0;
 }
-EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led);
 
 /**
  * snd_dha_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
@@ -4065,7 +4049,7 @@ int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 		}
 	}
 
-	return snd_hda_gen_add_micmute_led(codec, NULL);
+	return add_micmute_led_hook(codec);
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led_cdev);
 #endif /* CONFIG_SND_HDA_GENERIC_LEDS */
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 6fcb62ed30c6..a59e66f9ff33 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -88,7 +88,6 @@ struct hda_micmute_hook {
 	unsigned int led_mode;
 	unsigned int capture;
 	unsigned int led_value;
-	void (*update)(struct hda_codec *codec);
 	void (*old_hook)(struct hda_codec *codec,
 			 struct snd_kcontrol *kcontrol,
 			 struct snd_ctl_elem_value *ucontrol);
@@ -355,8 +354,6 @@ unsigned int snd_hda_gen_path_power_filter(struct hda_codec *codec,
 void snd_hda_gen_stream_pm(struct hda_codec *codec, hda_nid_t nid, bool on);
 int snd_hda_gen_fix_pin_power(struct hda_codec *codec, hda_nid_t pin);
 
-int snd_hda_gen_add_micmute_led(struct hda_codec *codec,
-				void (*hook)(struct hda_codec *));
 int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness));
-- 
2.16.4

