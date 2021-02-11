Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAB931893A
	for <lists+alsa-devel@lfdr.de>; Thu, 11 Feb 2021 12:17:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE73C16FF;
	Thu, 11 Feb 2021 12:16:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE73C16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613042263;
	bh=51qktr0cWIkbzgY7cMj5jbcYpOreisVNCrpZVOB9xiI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZIfgoiBAJ46Xp39ReuwwCuTF9WprubMIgH8VDJ6w2cz+tHy1BlhXimHdAckK1Nzeh
	 zWnp6AnjXywbbxZSY3qa+1tEKAHvtttNoZMF9rsTaX65lV8LhP+6VnBuIzzuw7phlI
	 /8s1/hpkSuImyKTrwfNBv/9M4PJXZa/+L7pee3yc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EFACF8032C;
	Thu, 11 Feb 2021 12:14:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73105F802D2; Thu, 11 Feb 2021 12:14:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BB8AF8028B
 for <alsa-devel@alsa-project.org>; Thu, 11 Feb 2021 12:14:43 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id D8BADA0042;
 Thu, 11 Feb 2021 12:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz D8BADA0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613042082; bh=gvsqeIVKfODXF0gMxDebi5AiXMehLQ2LKSHJQ/legWE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jQOYn4wuDhNUY5O2kqPMWq7y+4MNRDc2oBjy4H0FjrGyhcljvaFFk8eGPyiLugtjn
 njrMAEQHVNuuKFUMYXv15qVX2BF8uOv7o+1pJj1mIh/FVx75BhrynkRTBimgQfoIvh
 eNe/5ExSqLZumTC3vZDwTzOMxoHTzgNBhy7MqBLA=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Thu, 11 Feb 2021 12:14:37 +0100 (CET)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Subject: [PATCH 4/5] ALSA: HDA - remove the custom implementation for the
 audio LED trigger
Date: Thu, 11 Feb 2021 12:13:59 +0100
Message-Id: <20210211111400.1131020-5-perex@perex.cz>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211111400.1131020-1-perex@perex.cz>
References: <20210211111400.1131020-1-perex@perex.cz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Hans de Goede <hdegoede@redhat.com>,
 Perry Yuan <Perry.Yuan@dell.com>
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

With the new snd-ctl-led module, we have a generic way
to trigger audio LEDs based on the sound control changes.

Remove the custom implementation from the HDA driver.

Move the LED initialization before snd_hda_gen_parse_auto_config()
call in all drivers to create marked controls there.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/hda/Kconfig           |   4 +-
 sound/pci/hda/hda_codec.c       |  69 ++------------
 sound/pci/hda/hda_generic.c     | 162 +++++---------------------------
 sound/pci/hda/hda_generic.h     |  15 +--
 sound/pci/hda/hda_local.h       |  16 +---
 sound/pci/hda/patch_ca0132.c    |   4 +-
 sound/pci/hda/patch_realtek.c   |   2 +-
 sound/pci/hda/patch_sigmatel.c  |   6 +-
 sound/pci/hda/thinkpad_helper.c |   2 +-
 9 files changed, 45 insertions(+), 235 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 90759391cbac..c4360cdbc728 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -221,10 +221,8 @@ comment "Set to Y if you want auto-loading the codec driver"
 
 config SND_HDA_GENERIC
 	tristate "Enable generic HD-audio codec parser"
-	select NEW_LEDS if SND_HDA_GENERIC_LEDS
+	select SND_CTL_LED if SND_HDA_GENERIC_LEDS
 	select LEDS_CLASS if SND_HDA_GENERIC_LEDS
-	select LEDS_TRIGGERS if SND_HDA_GENERIC_LEDS
-	select LEDS_TRIGGER_AUDIO if SND_HDA_GENERIC_LEDS
 	help
 	  Say Y or M here to enable the generic HD-audio codec parser
 	  in snd-hda-intel driver.
diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
index 9b755062d841..961750b4d56f 100644
--- a/sound/pci/hda/hda_codec.c
+++ b/sound/pci/hda/hda_codec.c
@@ -1952,7 +1952,7 @@ static int add_follower(struct hda_codec *codec,
 int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 			  unsigned int *tlv, const char * const *followers,
 			  const char *suffix, bool init_follower_vol,
-			  struct snd_kcontrol **ctl_ret)
+			  unsigned int access, struct snd_kcontrol **ctl_ret)
 {
 	struct snd_kcontrol *kctl;
 	int err;
@@ -1968,6 +1968,7 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 	kctl = snd_ctl_make_virtual_master(name, tlv);
 	if (!kctl)
 		return -ENOMEM;
+	kctl->vd[0].access |= access;
 	err = snd_hda_ctl_add(codec, 0, kctl);
 	if (err < 0)
 		return err;
@@ -1994,87 +1995,29 @@ int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 }
 EXPORT_SYMBOL_GPL(__snd_hda_add_vmaster);
 
-/*
- * mute-LED control using vmaster
- */
-static int vmaster_mute_mode_info(struct snd_kcontrol *kcontrol,
-				  struct snd_ctl_elem_info *uinfo)
-{
-	static const char * const texts[] = {
-		"On", "Off", "Follow Master"
-	};
-
-	return snd_ctl_enum_info(uinfo, 1, 3, texts);
-}
-
-static int vmaster_mute_mode_get(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_vmaster_mute_hook *hook = snd_kcontrol_chip(kcontrol);
-	ucontrol->value.enumerated.item[0] = hook->mute_mode;
-	return 0;
-}
-
-static int vmaster_mute_mode_put(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_vmaster_mute_hook *hook = snd_kcontrol_chip(kcontrol);
-	unsigned int old_mode = hook->mute_mode;
-
-	hook->mute_mode = ucontrol->value.enumerated.item[0];
-	if (hook->mute_mode > HDA_VMUTE_FOLLOW_MASTER)
-		hook->mute_mode = HDA_VMUTE_FOLLOW_MASTER;
-	if (old_mode == hook->mute_mode)
-		return 0;
-	snd_hda_sync_vmaster_hook(hook);
-	return 1;
-}
-
-static const struct snd_kcontrol_new vmaster_mute_mode = {
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.name = "Mute-LED Mode",
-	.info = vmaster_mute_mode_info,
-	.get = vmaster_mute_mode_get,
-	.put = vmaster_mute_mode_put,
-};
-
 /* meta hook to call each driver's vmaster hook */
 static void vmaster_hook(void *private_data, int enabled)
 {
 	struct hda_vmaster_mute_hook *hook = private_data;
 
-	if (hook->mute_mode != HDA_VMUTE_FOLLOW_MASTER)
-		enabled = hook->mute_mode;
 	hook->hook(hook->codec, enabled);
 }
 
 /**
- * snd_hda_add_vmaster_hook - Add a vmaster hook for mute-LED
+ * snd_hda_add_vmaster_hook - Add a vmaster hw specific hook
  * @codec: the HDA codec
  * @hook: the vmaster hook object
- * @expose_enum_ctl: flag to create an enum ctl
  *
- * Add a mute-LED hook with the given vmaster switch kctl.
- * When @expose_enum_ctl is set, "Mute-LED Mode" control is automatically
- * created and associated with the given hook.
+ * Add a hw specific hook (like EAPD) with the given vmaster switch kctl.
  */
 int snd_hda_add_vmaster_hook(struct hda_codec *codec,
-			     struct hda_vmaster_mute_hook *hook,
-			     bool expose_enum_ctl)
+			     struct hda_vmaster_mute_hook *hook)
 {
-	struct snd_kcontrol *kctl;
-
 	if (!hook->hook || !hook->sw_kctl)
 		return 0;
 	hook->codec = codec;
-	hook->mute_mode = HDA_VMUTE_FOLLOW_MASTER;
 	snd_ctl_add_vmaster_hook(hook->sw_kctl, vmaster_hook, hook);
-	if (!expose_enum_ctl)
-		return 0;
-	kctl = snd_ctl_new1(&vmaster_mute_mode, hook);
-	if (!kctl)
-		return -ENOMEM;
-	return snd_hda_ctl_add(codec, 0, kctl);
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_add_vmaster_hook);
 
diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 5e40944e7342..d1979ec39d3e 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -981,6 +981,8 @@ add_control(struct hda_gen_spec *spec, int type, const char *name,
 	knew->index = cidx;
 	if (get_amp_nid_(val))
 		knew->subdevice = HDA_SUBDEV_AMP_FLAG;
+	if (knew->access == 0)
+		knew->access = SNDRV_CTL_ELEM_ACCESS_READWRITE;
 	knew->private_value = val;
 	return knew;
 }
@@ -3618,8 +3620,11 @@ static int add_single_cap_ctl(struct hda_codec *codec, const char *label,
 			   amp_val_replace_channels(ctl, chs));
 	if (!knew)
 		return -ENOMEM;
-	if (is_switch)
+	if (is_switch) {
 		knew->put = cap_single_sw_put;
+		if (spec->mic_mute_led)
+			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
+	}
 	if (!inv_dmic)
 		return 0;
 
@@ -3634,8 +3639,11 @@ static int add_single_cap_ctl(struct hda_codec *codec, const char *label,
 			   amp_val_replace_channels(ctl, 2));
 	if (!knew)
 		return -ENOMEM;
-	if (is_switch)
+	if (is_switch) {
 		knew->put = cap_single_sw_put;
+		if (spec->mic_mute_led)
+			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
+	}
 	return 0;
 }
 
@@ -3676,6 +3684,8 @@ static int create_bind_cap_vol_ctl(struct hda_codec *codec, int idx,
 		knew->index = idx;
 		knew->private_value = sw_ctl;
 		knew->subdevice = HDA_SUBDEV_AMP_FLAG;
+		if (spec->mic_mute_led)
+			knew->access |= SNDRV_CTL_ELEM_ACCESS_MIC_LED;
 	}
 	return 0;
 }
@@ -3917,11 +3927,6 @@ static int create_mute_led_cdev(struct hda_codec *codec,
 	return devm_led_classdev_register(&codec->core.dev, cdev);
 }
 
-static void vmaster_update_mute_led(void *private_data, int enabled)
-{
-	ledtrig_audio_set(LED_AUDIO_MUTE, enabled ? LED_OFF : LED_ON);
-}
-
 /**
  * snd_dha_gen_add_mute_led_cdev - Create a LED classdev and enable as vmaster mute LED
  * @codec: the HDA codec
@@ -3945,134 +3950,11 @@ int snd_hda_gen_add_mute_led_cdev(struct hda_codec *codec,
 	if (spec->vmaster_mute.hook)
 		codec_err(codec, "vmaster hook already present before cdev!\n");
 
-	spec->vmaster_mute.hook = vmaster_update_mute_led;
-	spec->vmaster_mute_enum = 1;
+	spec->vmaster_mute_led = 1;
 	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_mute_led_cdev);
 
-/*
- * mic mute LED hook helpers
- */
-enum {
-	MICMUTE_LED_ON,
-	MICMUTE_LED_OFF,
-	MICMUTE_LED_FOLLOW_CAPTURE,
-	MICMUTE_LED_FOLLOW_MUTE,
-};
-
-static void call_micmute_led_update(struct hda_codec *codec)
-{
-	struct hda_gen_spec *spec = codec->spec;
-	unsigned int val;
-
-	switch (spec->micmute_led.led_mode) {
-	case MICMUTE_LED_ON:
-		val = 1;
-		break;
-	case MICMUTE_LED_OFF:
-		val = 0;
-		break;
-	case MICMUTE_LED_FOLLOW_CAPTURE:
-		val = !!spec->micmute_led.capture;
-		break;
-	case MICMUTE_LED_FOLLOW_MUTE:
-	default:
-		val = !spec->micmute_led.capture;
-		break;
-	}
-
-	if (val == spec->micmute_led.led_value)
-		return;
-	spec->micmute_led.led_value = val;
-	ledtrig_audio_set(LED_AUDIO_MICMUTE,
-			  spec->micmute_led.led_value ? LED_ON : LED_OFF);
-}
-
-static void update_micmute_led(struct hda_codec *codec,
-			       struct snd_kcontrol *kcontrol,
-			       struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_gen_spec *spec = codec->spec;
-	unsigned int mask;
-
-	if (spec->micmute_led.old_hook)
-		spec->micmute_led.old_hook(codec, kcontrol, ucontrol);
-
-	if (!ucontrol)
-		return;
-	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
-	if (!strcmp("Capture Switch", ucontrol->id.name)) {
-		/* TODO: How do I verify if it's a mono or stereo here? */
-		if (ucontrol->value.integer.value[0] ||
-		    ucontrol->value.integer.value[1])
-			spec->micmute_led.capture |= mask;
-		else
-			spec->micmute_led.capture &= ~mask;
-		call_micmute_led_update(codec);
-	}
-}
-
-static int micmute_led_mode_info(struct snd_kcontrol *kcontrol,
-				 struct snd_ctl_elem_info *uinfo)
-{
-	static const char * const texts[] = {
-		"On", "Off", "Follow Capture", "Follow Mute",
-	};
-
-	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
-}
-
-static int micmute_led_mode_get(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
-	struct hda_gen_spec *spec = codec->spec;
-
-	ucontrol->value.enumerated.item[0] = spec->micmute_led.led_mode;
-	return 0;
-}
-
-static int micmute_led_mode_put(struct snd_kcontrol *kcontrol,
-				struct snd_ctl_elem_value *ucontrol)
-{
-	struct hda_codec *codec = snd_kcontrol_chip(kcontrol);
-	struct hda_gen_spec *spec = codec->spec;
-	unsigned int mode;
-
-	mode = ucontrol->value.enumerated.item[0];
-	if (mode > MICMUTE_LED_FOLLOW_MUTE)
-		mode = MICMUTE_LED_FOLLOW_MUTE;
-	if (mode == spec->micmute_led.led_mode)
-		return 0;
-	spec->micmute_led.led_mode = mode;
-	call_micmute_led_update(codec);
-	return 1;
-}
-
-static const struct snd_kcontrol_new micmute_led_mode_ctl = {
-	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
-	.name = "Mic Mute-LED Mode",
-	.info = micmute_led_mode_info,
-	.get = micmute_led_mode_get,
-	.put = micmute_led_mode_put,
-};
-
-/* Set up the capture sync hook for controlling the mic-mute LED */
-static int add_micmute_led_hook(struct hda_codec *codec)
-{
-	struct hda_gen_spec *spec = codec->spec;
-
-	spec->micmute_led.led_mode = MICMUTE_LED_FOLLOW_MUTE;
-	spec->micmute_led.capture = 0;
-	spec->micmute_led.led_value = 0;
-	spec->micmute_led.old_hook = spec->cap_sync_hook;
-	spec->cap_sync_hook = update_micmute_led;
-	if (!snd_hda_gen_add_kctl(spec, NULL, &micmute_led_mode_ctl))
-		return -ENOMEM;
-	return 0;
-}
-
 /**
  * snd_dha_gen_add_micmute_led_cdev - Create a LED classdev and enable as mic-mute LED
  * @codec: the HDA codec
@@ -4091,6 +3973,7 @@ int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 				     int (*callback)(struct led_classdev *,
 						     enum led_brightness))
 {
+	struct hda_gen_spec *spec = codec->spec;
 	int err;
 
 	if (callback) {
@@ -4101,7 +3984,8 @@ int snd_hda_gen_add_micmute_led_cdev(struct hda_codec *codec,
 		}
 	}
 
-	return add_micmute_led_hook(codec);
+	spec->mic_mute_led = 1;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(snd_hda_gen_add_micmute_led_cdev);
 #endif /* CONFIG_SND_HDA_GENERIC_LEDS */
@@ -5060,6 +4944,9 @@ int snd_hda_gen_parse_auto_config(struct hda_codec *codec,
 
 	parse_user_hints(codec);
 
+	if (spec->vmaster_mute_led || spec->mic_mute_led)
+		snd_ctl_led_request();
+
 	if (spec->mixer_nid && !spec->mixer_merge_nid)
 		spec->mixer_merge_nid = spec->mixer_nid;
 
@@ -5291,7 +5178,7 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 	    !snd_hda_find_mixer_ctl(codec, "Master Playback Volume")) {
 		err = snd_hda_add_vmaster(codec, "Master Playback Volume",
 					  spec->vmaster_tlv, follower_pfxs,
-					  "Playback Volume");
+					  "Playback Volume", 0);
 		if (err < 0)
 			return err;
 	}
@@ -5299,13 +5186,14 @@ int snd_hda_gen_build_controls(struct hda_codec *codec)
 	    !snd_hda_find_mixer_ctl(codec, "Master Playback Switch")) {
 		err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
 					    NULL, follower_pfxs,
-					    "Playback Switch",
-					    true, &spec->vmaster_mute.sw_kctl);
+					    "Playback Switch", true,
+					    spec->vmaster_mute_led ?
+						SNDRV_CTL_ELEM_ACCESS_SPK_LED : 0,
+					    &spec->vmaster_mute.sw_kctl);
 		if (err < 0)
 			return err;
 		if (spec->vmaster_mute.hook) {
-			snd_hda_add_vmaster_hook(codec, &spec->vmaster_mute,
-						 spec->vmaster_mute_enum);
+			snd_hda_add_vmaster_hook(codec, &spec->vmaster_mute);
 			snd_hda_sync_vmaster_hook(&spec->vmaster_mute);
 		}
 	}
diff --git a/sound/pci/hda/hda_generic.h b/sound/pci/hda/hda_generic.h
index 0886bc81f40b..d4dd1b8a2e7e 100644
--- a/sound/pci/hda/hda_generic.h
+++ b/sound/pci/hda/hda_generic.h
@@ -84,15 +84,6 @@ struct badness_table {
 extern const struct badness_table hda_main_out_badness;
 extern const struct badness_table hda_extra_out_badness;
 
-struct hda_micmute_hook {
-	unsigned int led_mode;
-	unsigned int capture;
-	unsigned int led_value;
-	void (*old_hook)(struct hda_codec *codec,
-			 struct snd_kcontrol *kcontrol,
-			 struct snd_ctl_elem_value *ucontrol);
-};
-
 struct hda_gen_spec {
 	char stream_name_analog[32];	/* analog PCM stream */
 	const struct hda_pcm_stream *stream_analog_playback;
@@ -229,7 +220,8 @@ struct hda_gen_spec {
 	unsigned int inv_dmic_split:1; /* inverted dmic w/a for conexant */
 	unsigned int own_eapd_ctl:1; /* set EAPD by own function */
 	unsigned int keep_eapd_on:1; /* don't turn off EAPD automatically */
-	unsigned int vmaster_mute_enum:1; /* add vmaster mute mode enum */
+	unsigned int vmaster_mute_led:1; /* add SPK-LED flag to vmaster mute switch */
+	unsigned int mic_mute_led:1; /* add MIC-LED flag to capture mute switch */
 	unsigned int indep_hp:1; /* independent HP supported */
 	unsigned int prefer_hp_amp:1; /* enable HP amp for speaker if any */
 	unsigned int add_stereo_mix_input:2; /* add aamix as a capture src */
@@ -285,9 +277,6 @@ struct hda_gen_spec {
 			      struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol);
 
-	/* mic mute LED hook; called via cap_sync_hook */
-	struct hda_micmute_hook micmute_led;
-
 	/* PCM hooks */
 	void (*pcm_playback_hook)(struct hda_pcm_stream *hinfo,
 				  struct hda_codec *codec,
diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 5beb8aa44ecd..06d4486a4961 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -131,21 +131,15 @@ struct snd_kcontrol *snd_hda_find_mixer_ctl(struct hda_codec *codec,
 int __snd_hda_add_vmaster(struct hda_codec *codec, char *name,
 			  unsigned int *tlv, const char * const *followers,
 			  const char *suffix, bool init_follower_vol,
-			  struct snd_kcontrol **ctl_ret);
-#define snd_hda_add_vmaster(codec, name, tlv, followers, suffix) \
-	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, NULL)
+			  unsigned int access, struct snd_kcontrol **ctl_ret);
+#define snd_hda_add_vmaster(codec, name, tlv, followers, suffix, access) \
+	__snd_hda_add_vmaster(codec, name, tlv, followers, suffix, true, access, NULL)
 int snd_hda_codec_reset(struct hda_codec *codec);
 void snd_hda_codec_register(struct hda_codec *codec);
 void snd_hda_codec_cleanup_for_unbind(struct hda_codec *codec);
 
 #define snd_hda_regmap_sync(codec)	snd_hdac_regmap_sync(&(codec)->core)
 
-enum {
-	HDA_VMUTE_OFF,
-	HDA_VMUTE_ON,
-	HDA_VMUTE_FOLLOW_MASTER,
-};
-
 struct hda_vmaster_mute_hook {
 	/* below two fields must be filled by the caller of
 	 * snd_hda_add_vmaster_hook() beforehand
@@ -153,13 +147,11 @@ struct hda_vmaster_mute_hook {
 	struct snd_kcontrol *sw_kctl;
 	void (*hook)(void *, int);
 	/* below are initialized automatically */
-	unsigned int mute_mode; /* HDA_VMUTE_XXX */
 	struct hda_codec *codec;
 };
 
 int snd_hda_add_vmaster_hook(struct hda_codec *codec,
-			     struct hda_vmaster_mute_hook *hook,
-			     bool expose_enum_ctl);
+			     struct hda_vmaster_mute_hook *hook);
 void snd_hda_sync_vmaster_hook(struct hda_vmaster_mute_hook *hook);
 
 /* amp value bits */
diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 7e62aed172a9..bbcef0869a59 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -7041,11 +7041,11 @@ static int ca0132_build_controls(struct hda_codec *codec)
 					spec->tlv);
 		snd_hda_add_vmaster(codec, "Master Playback Volume",
 					spec->tlv, ca0132_alt_follower_pfxs,
-					"Playback Volume");
+					"Playback Volume", 0);
 		err = __snd_hda_add_vmaster(codec, "Master Playback Switch",
 					    NULL, ca0132_alt_follower_pfxs,
 					    "Playback Switch",
-					    true, &spec->vmaster_mute.sw_kctl);
+					    true, 0, &spec->vmaster_mute.sw_kctl);
 		if (err < 0)
 			return err;
 	}
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 52907506e16e..bc1b268a5289 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -292,7 +292,7 @@ static void alc_fixup_gpio4(struct hda_codec *codec,
 static void alc_fixup_micmute_led(struct hda_codec *codec,
 				  const struct hda_fixup *fix, int action)
 {
-	if (action == HDA_FIXUP_ACT_PROBE)
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
 		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
 }
 
diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
index c662431bf13a..3bd592e126a3 100644
--- a/sound/pci/hda/patch_sigmatel.c
+++ b/sound/pci/hda/patch_sigmatel.c
@@ -4277,6 +4277,9 @@ static int stac_parse_auto_config(struct hda_codec *codec)
 
 	spec->gen.automute_hook = stac_update_outputs;
 
+	if (spec->gpio_led)
+		snd_hda_gen_add_mute_led_cdev(codec, stac_vmaster_hook);
+
 	err = snd_hda_gen_parse_auto_config(codec, &spec->gen.autocfg);
 	if (err < 0)
 		return err;
@@ -4318,9 +4321,6 @@ static int stac_parse_auto_config(struct hda_codec *codec)
 	}
 #endif
 
-	if (spec->gpio_led)
-		snd_hda_gen_add_mute_led_cdev(codec, stac_vmaster_hook);
-
 	if (spec->aloopback_ctl &&
 	    snd_hda_get_bool_hint(codec, "loopback") == 1) {
 		unsigned int wr_verb =
diff --git a/sound/pci/hda/thinkpad_helper.c b/sound/pci/hda/thinkpad_helper.c
index 6698ae241efc..de4d8deed102 100644
--- a/sound/pci/hda/thinkpad_helper.c
+++ b/sound/pci/hda/thinkpad_helper.c
@@ -18,7 +18,7 @@ static bool is_thinkpad(struct hda_codec *codec)
 static void hda_fixup_thinkpad_acpi(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
 {
-	if (action == HDA_FIXUP_ACT_PROBE) {
+	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		if (!is_thinkpad(codec))
 			return;
 		snd_hda_gen_add_mute_led_cdev(codec, NULL);
-- 
2.29.2
