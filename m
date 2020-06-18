Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1571FF064
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 13:18:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6A80B174B;
	Thu, 18 Jun 2020 13:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6A80B174B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592479093;
	bh=haWJLGaQN25dJ5VMLlzUt67cXbld3VaQzNyiVSoxXlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nn1BrbP1A1YdosLqS1W/bOg3GX20D2BIWwtyNOOP1yyAMkP7JXdG4r0VaeamaIJBq
	 TwjUZzXgEyyH+Fq1enOBH58ceuIeBTL+S3nLFTzfPf4Aw6HlKKOYbWECusnSx0G6o7
	 S2JG2IViBjoj4TBCSKJScoOmnzAd34eue4b2cZPI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8BDB9F80332;
	Thu, 18 Jun 2020 13:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 727EDF802DF; Thu, 18 Jun 2020 13:09:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1482FF80255
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 13:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1482FF80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E9147AF5A;
 Thu, 18 Jun 2020 11:08:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/13] ALSA: hda/realtek: Unify LED helper code
Date: Thu, 18 Jun 2020 13:08:41 +0200
Message-Id: <20200618110842.27238-13-tiwai@suse.de>
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

Both mute and mic-mute LED callbacks do almost similar tasks with just
different bits.  Factor out the common code and use them from the
callbacks for simplification.

This ended up with covering the forgotten stuff, too; e.g. VREF LED
handling required the temporary power up/down that was missing for the
mute LED, or some forgotten polarity checks are added.

Tested-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_realtek.c | 125 +++++++++++++++++++++---------------------
 1 file changed, 61 insertions(+), 64 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 87f7a1c3558d..53e0eef8b042 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -67,6 +67,13 @@ struct alc_customize_define {
 	unsigned int  fixup:1; /* Means that this sku is set by driver, not read from hw */
 };
 
+struct alc_coef_led {
+	unsigned int idx;
+	unsigned int mask;
+	unsigned int on;
+	unsigned int off;
+};
+
 struct alc_spec {
 	struct hda_gen_spec gen; /* must be at head */
 
@@ -88,14 +95,8 @@ struct alc_spec {
 
 	unsigned int gpio_mute_led_mask;
 	unsigned int gpio_mic_led_mask;
-	unsigned int mute_led_coef_idx;
-	unsigned int mute_led_coefbit_mask;
-	unsigned int mute_led_coefbit_on;
-	unsigned int mute_led_coefbit_off;
-	unsigned int mic_led_coef_idx;
-	unsigned int mic_led_coefbit_mask;
-	unsigned int mic_led_coefbit_on;
-	unsigned int mic_led_coefbit_off;
+	struct alc_coef_led mute_led_coef;
+	struct alc_coef_led mic_led_coef;
 
 	hda_nid_t headset_mic_pin;
 	hda_nid_t headphone_mic_pin;
@@ -3988,6 +3989,23 @@ static void alc269_fixup_x101_headset_mic(struct hda_codec *codec,
 	}
 }
 
+static void alc_update_vref_led(struct hda_codec *codec, hda_nid_t pin,
+				bool polarity, bool on)
+{
+	unsigned int pinval;
+
+	if (!pin)
+		return;
+	if (polarity)
+		on = !on;
+	pinval = snd_hda_codec_get_pin_target(codec, pin);
+	pinval &= ~AC_PINCTL_VREFEN;
+	pinval |= on ? AC_PINCTL_VREF_80 : AC_PINCTL_VREF_HIZ;
+	/* temporarily power up/down for setting VREF */
+	snd_hda_power_up_pm(codec);
+	snd_hda_set_pin_ctl_cache(codec, pin, pinval);
+	snd_hda_power_down_pm(codec);
+}
 
 /* update mute-LED according to the speaker mute state via mic VREF pin */
 static int vref_mute_led_set(struct led_classdev *led_cdev,
@@ -3995,19 +4013,9 @@ static int vref_mute_led_set(struct led_classdev *led_cdev,
 {
 	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
-	unsigned int pinval;
 
-	if (spec->mute_led_polarity)
-		brightness = !brightness;
-	pinval = snd_hda_codec_get_pin_target(codec, spec->mute_led_nid);
-	pinval &= ~AC_PINCTL_VREFEN;
-	pinval |= brightness ? AC_PINCTL_VREF_80 : AC_PINCTL_VREF_HIZ;
-	if (spec->mute_led_nid) {
-		/* temporarily power up/down for setting VREF */
-		snd_hda_power_up_pm(codec);
-		snd_hda_set_pin_ctl_cache(codec, spec->mute_led_nid, pinval);
-		snd_hda_power_down_pm(codec);
-	}
+	alc_update_vref_led(codec, spec->mute_led_nid,
+			    spec->mute_led_polarity, brightness);
 	return 0;
 }
 
@@ -4170,17 +4178,9 @@ static int vref_micmute_led_set(struct led_classdev *led_cdev,
 {
 	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
-	unsigned int pinval;
 
-	if (!spec->cap_mute_led_nid)
-		return 0;
-	pinval = snd_hda_codec_get_pin_target(codec, spec->cap_mute_led_nid);
-	pinval &= ~AC_PINCTL_VREFEN;
-	if (brightness)
-		pinval |= AC_PINCTL_VREF_80;
-	else
-		pinval |= AC_PINCTL_VREF_HIZ;
-	snd_hda_set_pin_ctl_cache(codec, spec->cap_mute_led_nid, pinval);
+	alc_update_vref_led(codec, spec->cap_mute_led_nid,
+			    spec->micmute_led_polarity, brightness);
 	return 0;
 }
 
@@ -4215,6 +4215,17 @@ static void alc280_fixup_hp_gpio4(struct hda_codec *codec,
 	}
 }
 
+static void alc_update_coef_led(struct hda_codec *codec,
+				struct alc_coef_led *led,
+				bool polarity, bool on)
+{
+	if (polarity)
+		on = !on;
+	/* temporarily power up/down for setting COEF bit */
+	alc_update_coef_idx(codec, led->idx, led->mask,
+			    on ? led->on : led->off);
+}
+
 /* update mute-LED according to the speaker mute state via COEF bit */
 static int coef_mute_led_set(struct led_classdev *led_cdev,
 			     enum led_brightness brightness)
@@ -4222,18 +4233,8 @@ static int coef_mute_led_set(struct led_classdev *led_cdev,
 	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 
-	if (spec->mute_led_polarity)
-		brightness = !brightness;
-
-	/* temporarily power up/down for setting COEF bit */
-	if (brightness)
-		alc_update_coef_idx(codec, spec->mute_led_coef_idx,
-				    spec->mute_led_coefbit_mask,
-				    spec->mute_led_coefbit_on);
-	else
-		alc_update_coef_idx(codec, spec->mute_led_coef_idx,
-				    spec->mute_led_coefbit_mask,
-				    spec->mute_led_coefbit_off);
+	alc_update_coef_led(codec, &spec->mute_led_coef,
+			    spec->mute_led_polarity, brightness);
 	return 0;
 }
 
@@ -4245,10 +4246,10 @@ static void alc285_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_polarity = 0;
-		spec->mute_led_coef_idx = 0x0b;
-		spec->mute_led_coefbit_mask = 1<<3;
-		spec->mute_led_coefbit_on = 1<<3;
-		spec->mute_led_coefbit_off = 0;
+		spec->mute_led_coef.idx = 0x0b;
+		spec->mute_led_coef.mask = 1 << 3;
+		spec->mute_led_coef.on = 1 << 3;
+		spec->mute_led_coef.off = 0;
 		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
 	}
 }
@@ -4261,10 +4262,10 @@ static void alc236_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
 		spec->mute_led_polarity = 0;
-		spec->mute_led_coef_idx = 0x34;
-		spec->mute_led_coefbit_mask = 1<<5;
-		spec->mute_led_coefbit_on = 0;
-		spec->mute_led_coefbit_off = 1<<5;
+		spec->mute_led_coef.idx = 0x34;
+		spec->mute_led_coef.mask = 1 << 5;
+		spec->mute_led_coef.on = 0;
+		spec->mute_led_coef.off = 1 << 5;
 		snd_hda_gen_add_mute_led_cdev(codec, coef_mute_led_set);
 	}
 }
@@ -4276,12 +4277,8 @@ static int coef_micmute_led_set(struct led_classdev *led_cdev,
 	struct hda_codec *codec = dev_to_hda_codec(led_cdev->dev->parent);
 	struct alc_spec *spec = codec->spec;
 
-	if (brightness)
-		alc_update_coef_idx(codec, spec->mic_led_coef_idx,
-			spec->mic_led_coefbit_mask, spec->mic_led_coefbit_on);
-	else
-		alc_update_coef_idx(codec, spec->mic_led_coef_idx,
-			spec->mic_led_coefbit_mask, spec->mic_led_coefbit_off);
+	alc_update_coef_led(codec, &spec->mic_led_coef,
+			    spec->micmute_led_polarity, brightness);
 	return 0;
 }
 
@@ -4291,10 +4288,10 @@ static void alc285_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 	struct alc_spec *spec = codec->spec;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->mic_led_coef_idx = 0x19;
-		spec->mic_led_coefbit_mask = 1<<13;
-		spec->mic_led_coefbit_on = 1<<13;
-		spec->mic_led_coefbit_off = 0;
+		spec->mic_led_coef.idx = 0x19;
+		spec->mic_led_coef.mask = 1 << 13;
+		spec->mic_led_coef.on = 1 << 13;
+		spec->mic_led_coef.off = 0;
 		snd_hda_gen_add_micmute_led_cdev(codec, coef_micmute_led_set);
 	}
 }
@@ -4305,10 +4302,10 @@ static void alc236_fixup_hp_coef_micmute_led(struct hda_codec *codec,
 	struct alc_spec *spec = codec->spec;
 
 	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
-		spec->mic_led_coef_idx = 0x35;
-		spec->mic_led_coefbit_mask = 3<<2;
-		spec->mic_led_coefbit_on = 2<<2;
-		spec->mic_led_coefbit_off = 1<<2;
+		spec->mic_led_coef.idx = 0x35;
+		spec->mic_led_coef.mask = 3 << 2;
+		spec->mic_led_coef.on = 2 << 2;
+		spec->mic_led_coef.off = 1 << 2;
 		snd_hda_gen_add_micmute_led_cdev(codec, coef_micmute_led_set);
 	}
 }
-- 
2.16.4

