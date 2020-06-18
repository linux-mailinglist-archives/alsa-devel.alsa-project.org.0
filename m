Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E741FF047
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AFF61759;
	Thu, 18 Jun 2020 13:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AFF61759
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592478712;
	bh=yV65PlQVtCHhtQZoQTs/GqqLVp4PV/CY14XWaSxGRWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IU9v04VWdn9Cxe1kcMqj9FSI/QoeGxKHZKSEFTpAkci+u4/ULoumsw9TUZIa266Dx
	 NlVgk1nVtzBAy4p1wQqcC7hkzI8BlWEgFzYFtVBHsAotXmY4TmSLW4W0MwjWNOubbB
	 8kC1NXUsrghj09WbUMWSt/WgOrCrOgfTXL+S/ADM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75592F80245;
	Thu, 18 Jun 2020 13:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC66BF802A9; Thu, 18 Jun 2020 13:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27C85F801D9
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C85F801D9
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 8E2F0AF30;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/13] ALSA: hda/realtek: Convert to cdev-variant of mic-mute
 LED controls
Date: Thu, 18 Jun 2020 13:08:32 +0200
Message-Id: <20200618110842.27238-4-tiwai@suse.de>
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

This patch converts the remaining user of
snd_hda_gen_add_micmute_led() in Realtek codec driver into the new
snd_hda_gen_add_micmute_led_cdev().

The Thinkpad helper code is updated accordingly, too.

Also, the usage of snd_hda_gen_fixup_micmute_led() is replaced with
either the local alc_fixup_micmute_led() or the explicit call of
snd_hda_gen_add_micmute_led_cdev() with NULL callback.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c   | 39 ++++++++++++++++++++++++++-------------
 sound/pci/hda/thinkpad_helper.c |  2 +-
 2 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1d0fe9a0983f..6831587fc4d6 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -287,6 +287,13 @@ static void alc_fixup_gpio4(struct hda_codec *codec,
 	alc_fixup_gpio(codec, action, 0x04);
 }
 
+static void alc_fixup_micmute_led(struct hda_codec *codec,
+				  const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PROBE)
+		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
+}
+
 /*
  * Fix hardware PLL issue
  * On some codecs, the analog PLL gating control must be off while
@@ -4155,21 +4162,24 @@ static void alc286_fixup_hp_gpio_led(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x02, 0x20);
 }
 
-/* turn on/off mic-mute LED per capture hook */
-static void alc_cap_micmute_update(struct hda_codec *codec)
+/* turn on/off mic-mute LED per capture hook via VREF change */
+static int vref_micmute_led_set(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
 {
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 	unsigned int pinval;
 
 	if (!spec->cap_mute_led_nid)
-		return;
+		return 0;
 	pinval = snd_hda_codec_get_pin_target(codec, spec->cap_mute_led_nid);
 	pinval &= ~AC_PINCTL_VREFEN;
-	if (spec->gen.micmute_led.led_value)
+	if (brightness)
 		pinval |= AC_PINCTL_VREF_80;
 	else
 		pinval |= AC_PINCTL_VREF_HIZ;
 	snd_hda_set_pin_ctl_cache(codec, spec->cap_mute_led_nid, pinval);
+	return 0;
 }
 
 static void alc269_fixup_hp_gpio_mic1_led(struct hda_codec *codec,
@@ -4185,7 +4195,7 @@ static void alc269_fixup_hp_gpio_mic1_led(struct hda_codec *codec,
 		spec->gpio_mask |= 0x10;
 		spec->gpio_dir |= 0x10;
 		spec->cap_mute_led_nid = 0x18;
-		snd_hda_gen_add_micmute_led(codec, alc_cap_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, vref_micmute_led_set);
 		codec->power_filter = led_power_filter;
 	}
 }
@@ -4198,7 +4208,7 @@ static void alc280_fixup_hp_gpio4(struct hda_codec *codec,
 	alc_fixup_hp_gpio_led(codec, action, 0x08, 0);
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->cap_mute_led_nid = 0x18;
-		snd_hda_gen_add_micmute_led(codec, alc_cap_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, vref_micmute_led_set);
 		codec->power_filter = led_power_filter;
 	}
 }
@@ -4254,16 +4264,19 @@ static void alc236_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 }
 
 /* turn on/off mic-mute LED per capture hook by coef bit */
-static void alc_hp_cap_micmute_update(struct hda_codec *codec)
+static int coef_micmute_led_set(struct led_classdev *led_cdev,
+				enum led_brightness brightness)
 {
+	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 
-	if (spec->gen.micmute_led.led_value)
+	if (brightness)
 		alc_update_coef_idx(codec, spec->mic_led_coef_idx,
 			spec->mic_led_coefbit_mask, spec->mic_led_coefbit_on);
 	else
 		alc_update_coef_idx(codec, spec->mic_led_coef_idx,
 			spec->mic_led_coefbit_mask, spec->mic_led_coefbit_off);
+	return 0;
 }
 
 static void alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
@@ -4276,7 +4289,7 @@ static void alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 		spec->mic_led_coefbit_mask = 1<<13;
 		spec->mic_led_coefbit_on = 1<<13;
 		spec->mic_led_coefbit_off = 0;
-		snd_hda_gen_add_micmute_led(codec, alc_hp_cap_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, coef_micmute_led_set);
 	}
 }
 
@@ -4290,7 +4303,7 @@ static void alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 		spec->mic_led_coefbit_mask = 3<<2;
 		spec->mic_led_coefbit_on = 2<<2;
 		spec->mic_led_coefbit_off = 1<<2;
-		snd_hda_gen_add_micmute_led(codec, alc_hp_cap_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, coef_micmute_led_set);
 	}
 }
 
@@ -4430,7 +4443,7 @@ static void alc269_fixup_hp_line1_mic1_led(struct hda_codec *codec,
 	alc269_fixup_hp_mute_led_micx(codec, fix, action, 0x1a);
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->cap_mute_led_nid = 0x18;
-		snd_hda_gen_add_micmute_led(codec, alc_cap_micmute_update);
+		snd_hda_gen_add_micmute_led_cdev(codec, vref_micmute_led_set);
 	}
 }
 
@@ -6660,7 +6673,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC255_FIXUP_MIC_MUTE_LED] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = snd_hda_gen_fixup_micmute_led,
+		.v.func = alc_fixup_micmute_led,
 	},
 	[ALC282_FIXUP_ASPIRE_V5_PINS] = {
 		.type = HDA_FIXUP_PINS,
@@ -6763,7 +6776,7 @@ static const struct hda_fixup alc269_fixups[] = {
 	},
 	[ALC292_FIXUP_DELL_E7X] = {
 		.type = HDA_FIXUP_FUNC,
-		.v.func = snd_hda_gen_fixup_micmute_led,
+		.v.func = alc_fixup_micmute_led,
 		/* micmute fixup must be applied at last */
 		.chained_before = true,
 		.chain_id = ALC292_FIXUP_DELL_E7X_AAMIX,
diff --git a/sound/pci/hda/thinkpad_helper.c b/sound/pci/hda/thinkpad_helper.c
index 4089feb8c68e..cd14d5a55b42 100644
--- a/sound/pci/hda/thinkpad_helper.c
+++ b/sound/pci/hda/thinkpad_helper.c
@@ -35,7 +35,7 @@ static void hda_fixup_thinkpad_acpi(struct hda_codec *codec,
 			return;
 		old_vmaster_hook = spec->vmaster_mute.hook;
 		spec->vmaster_mute.hook = update_tpacpi_mute_led;
-		snd_hda_gen_fixup_micmute_led(codec, fix, action);
+		snd_hda_gen_add_micmute_led_cdev(codec, NULL);
 	}
 }
 
-- 
2.16.4

