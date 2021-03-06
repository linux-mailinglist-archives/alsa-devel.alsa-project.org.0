Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C4F32F92E
	for <lists+alsa-devel@lfdr.de>; Sat,  6 Mar 2021 10:52:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 883B01929;
	Sat,  6 Mar 2021 10:51:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 883B01929
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615024320;
	bh=wlt/fJjDbuNtKlNlJWTQQ7UeND+GEW8t34za9fvH4Fo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=U/CVnnkWTjiA5KQ5vRuJj8g+i335augPqWZbAK1VEKIXQM2blTn2JJ2gcoxgKd8px
	 jdbhoS49X7qhth/SmyQHR14UbGN+AFt+MRCmkuALDsCAtmuhLdBjQRvQYoysnc3hWy
	 54bXpSVzzLQa88f5puJiY+JjfUDVRqDtIVoSwaxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6C6FF80271;
	Sat,  6 Mar 2021 10:50:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84F1EF800F3; Sat,  6 Mar 2021 10:50:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1878F800F3
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 10:50:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1878F800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7E53EAC24
 for <alsa-devel@alsa-project.org>; Sat,  6 Mar 2021 09:50:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/conexant: Add quirk for mute LED control on HP
 ZBook G5
Date: Sat,  6 Mar 2021 10:50:18 +0100
Message-Id: <20210306095018.11746-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The mute and mic-mute LEDs on HP ZBook Studio G5 are controlled via
GPIO bits 0x10 and 0x20, respectively, and we need the extra setup for
those.

As the similar code is already present for other HP models but with
different GPIO pins, this patch factors out the common helper code and
applies those GPIO values for each model.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=211893
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_conexant.c | 62 ++++++++++++++++++++++++----------
 1 file changed, 45 insertions(+), 17 deletions(-)

diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
index f2aa226d1373..c20dad46a7c9 100644
--- a/sound/pci/hda/patch_conexant.c
+++ b/sound/pci/hda/patch_conexant.c
@@ -149,6 +149,21 @@ static int cx_auto_vmaster_mute_led(struct led_classdev *led_cdev,
 	return 0;
 }
 
+static void cxt_init_gpio_led(struct hda_codec *codec)
+{
+	struct conexant_spec *spec = codec->spec;
+	unsigned int mask = spec->gpio_mute_led_mask | spec->gpio_mic_led_mask;
+
+	if (mask) {
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_MASK,
+				    mask);
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DIRECTION,
+				    mask);
+		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
+				    spec->gpio_led);
+	}
+}
+
 static int cx_auto_init(struct hda_codec *codec)
 {
 	struct conexant_spec *spec = codec->spec;
@@ -156,6 +171,7 @@ static int cx_auto_init(struct hda_codec *codec)
 	if (!spec->dynamic_eapd)
 		cx_auto_turn_eapd(codec, spec->num_eapds, spec->eapds, true);
 
+	cxt_init_gpio_led(codec);
 	snd_hda_apply_fixup(codec, HDA_FIXUP_ACT_INIT);
 
 	return 0;
@@ -215,6 +231,7 @@ enum {
 	CXT_FIXUP_HP_SPECTRE,
 	CXT_FIXUP_HP_GATE_MIC,
 	CXT_FIXUP_MUTE_LED_GPIO,
+	CXT_FIXUP_HP_ZBOOK_MUTE_LED,
 	CXT_FIXUP_HEADSET_MIC,
 	CXT_FIXUP_HP_MIC_NO_PRESENCE,
 };
@@ -654,31 +671,36 @@ static int cxt_gpio_micmute_update(struct led_classdev *led_cdev,
 	return 0;
 }
 
-
-static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
-				const struct hda_fixup *fix, int action)
+static void cxt_setup_mute_led(struct hda_codec *codec,
+			       unsigned int mute, unsigned int mic_mute)
 {
 	struct conexant_spec *spec = codec->spec;
-	static const struct hda_verb gpio_init[] = {
-		{ 0x01, AC_VERB_SET_GPIO_MASK, 0x03 },
-		{ 0x01, AC_VERB_SET_GPIO_DIRECTION, 0x03 },
-		{}
-	};
 
-	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
+	spec->gpio_led = 0;
+	spec->mute_led_polarity = 0;
+	if (mute) {
 		snd_hda_gen_add_mute_led_cdev(codec, cxt_gpio_mute_update);
-		spec->gpio_led = 0;
-		spec->mute_led_polarity = 0;
-		spec->gpio_mute_led_mask = 0x01;
-		spec->gpio_mic_led_mask = 0x02;
+		spec->gpio_mute_led_mask = mute;
+	}
+	if (mic_mute) {
 		snd_hda_gen_add_micmute_led_cdev(codec, cxt_gpio_micmute_update);
+		spec->gpio_mic_led_mask = mic_mute;
 	}
-	snd_hda_add_verbs(codec, gpio_init);
-	if (spec->gpio_led)
-		snd_hda_codec_write(codec, 0x01, 0, AC_VERB_SET_GPIO_DATA,
-				    spec->gpio_led);
 }
 
+static void cxt_fixup_mute_led_gpio(struct hda_codec *codec,
+				const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		cxt_setup_mute_led(codec, 0x01, 0x02);
+}
+
+static void cxt_fixup_hp_zbook_mute_led(struct hda_codec *codec,
+					const struct hda_fixup *fix, int action)
+{
+	if (action == HDA_FIXUP_ACT_PRE_PROBE)
+		cxt_setup_mute_led(codec, 0x10, 0x20);
+}
 
 /* ThinkPad X200 & co with cxt5051 */
 static const struct hda_pintbl cxt_pincfg_lenovo_x200[] = {
@@ -839,6 +861,10 @@ static const struct hda_fixup cxt_fixups[] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_mute_led_gpio,
 	},
+	[CXT_FIXUP_HP_ZBOOK_MUTE_LED] = {
+		.type = HDA_FIXUP_FUNC,
+		.v.func = cxt_fixup_hp_zbook_mute_led,
+	},
 	[CXT_FIXUP_HEADSET_MIC] = {
 		.type = HDA_FIXUP_FUNC,
 		.v.func = cxt_fixup_headset_mic,
@@ -917,6 +943,7 @@ static const struct snd_pci_quirk cxt5066_fixups[] = {
 	SND_PCI_QUIRK(0x103c, 0x8299, "HP 800 G3 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x829a, "HP 800 G3 DM", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8402, "HP ProBook 645 G4", CXT_FIXUP_MUTE_LED_GPIO),
+	SND_PCI_QUIRK(0x103c, 0x8427, "HP ZBook Studio G5", CXT_FIXUP_HP_ZBOOK_MUTE_LED),
 	SND_PCI_QUIRK(0x103c, 0x8455, "HP Z2 G4", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8456, "HP Z2 G4 SFF", CXT_FIXUP_HP_MIC_NO_PRESENCE),
 	SND_PCI_QUIRK(0x103c, 0x8457, "HP Z2 G4 mini", CXT_FIXUP_HP_MIC_NO_PRESENCE),
@@ -956,6 +983,7 @@ static const struct hda_model_fixup cxt5066_fixup_models[] = {
 	{ .id = CXT_FIXUP_MUTE_LED_EAPD, .name = "mute-led-eapd" },
 	{ .id = CXT_FIXUP_HP_DOCK, .name = "hp-dock" },
 	{ .id = CXT_FIXUP_MUTE_LED_GPIO, .name = "mute-led-gpio" },
+	{ .id = CXT_FIXUP_HP_ZBOOK_MUTE_LED, .name = "hp-zbook-mute-led" },
 	{ .id = CXT_FIXUP_HP_MIC_NO_PRESENCE, .name = "hp-mic-fix" },
 	{}
 };
-- 
2.26.2

