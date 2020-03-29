Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76F196BD8
	for <lists+alsa-devel@lfdr.de>; Sun, 29 Mar 2020 10:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491531677;
	Sun, 29 Mar 2020 10:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491531677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585469334;
	bh=jHTBz8DHQkbLo4pO6O2JWdVi+xTTtPJul97Sbo5jJLk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=urJbr16qq7/VANRrexd08sab/wuSC8x1GM18CE37PXYLrvho65d5HBJUpxQOwfIlN
	 mNvMThKLA8ltECOieUkxFDdQyiLvHh1svEqLmkBHRwAnDZrJ0rsIg+TVSFowzxHDM+
	 iHJi5XdYEM1jpUgrObwu7NpoSMDyk/7Y6futwID4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53C8FF8014F;
	Sun, 29 Mar 2020 10:07:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2DB16F80146; Sun, 29 Mar 2020 10:07:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13040F8013F
 for <alsa-devel@alsa-project.org>; Sun, 29 Mar 2020 10:07:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13040F8013F
Received: from [222.130.137.59] (helo=localhost.localdomain)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <hui.wang@canonical.com>)
 id 1jISyG-0004U4-8F; Sun, 29 Mar 2020 08:07:04 +0000
From: Hui Wang <hui.wang@canonical.com>
To: alsa-devel@alsa-project.org, tiwai@suse.de, stable@vger.kernel.org,
 kailang@realtek.com
Subject: [PATCH] ALSA: hda/realtek - a fake key event is triggered by running
 shutup
Date: Sun, 29 Mar 2020 16:06:42 +0800
Message-Id: <20200329080642.20287-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.17.1
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

On the Lenovo X1C7 machines, after we plug the headset, the rt_resume()
and rt_suspend() of the codec driver will be called periodically, the
driver can't stay in the rt_suspend state even users doen't use the
sound card.

Through debugging, I found  when running rt_suspend(), it will call
alc225_shutup(), in this function, it will change 3k pull down control
by alc_update_coef_idx(codec, 0x4a, 0, 3 << 10), this will trigger a
fake key event and that event will resume the codec, when codec
suspend agin, it will trigger the fake key event one more time, this
process will repeat.

If disable the key event before changing the pull down control, it
will not trigger fake key event. It also needs to restore the pull
down control and re-enable the key event, otherwise the system can't
get key event when codec is in rt_suspend state.

Also move some functions ahead of alc225_shutup(), this can save the
function declaration.

Fixes: 78def224f59c (ALSA: hda/realtek - Add Headset Mic supported)
Cc: Kailang Yang <kailang@realtek.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 sound/pci/hda/patch_realtek.c | 170 +++++++++++++++++++++-------------
 1 file changed, 107 insertions(+), 63 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 1ad8c2e2d1af..0af33f00617a 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -107,6 +107,7 @@ struct alc_spec {
 	unsigned int done_hp_init:1;
 	unsigned int no_shutup_pins:1;
 	unsigned int ultra_low_power:1;
+	unsigned int has_hs_key:1;
 
 	/* for PLL fix */
 	hda_nid_t pll_nid;
@@ -2982,6 +2983,107 @@ static int alc269_parse_auto_config(struct hda_codec *codec)
 	return alc_parse_auto_config(codec, alc269_ignore, ssids);
 }
 
+static const struct hda_jack_keymap alc_headset_btn_keymap[] = {
+	{ SND_JACK_BTN_0, KEY_PLAYPAUSE },
+	{ SND_JACK_BTN_1, KEY_VOICECOMMAND },
+	{ SND_JACK_BTN_2, KEY_VOLUMEUP },
+	{ SND_JACK_BTN_3, KEY_VOLUMEDOWN },
+	{}
+};
+
+static void alc_headset_btn_callback(struct hda_codec *codec,
+				     struct hda_jack_callback *jack)
+{
+	int report = 0;
+
+	if (jack->unsol_res & (7 << 13))
+		report |= SND_JACK_BTN_0;
+
+	if (jack->unsol_res  & (1 << 16 | 3 << 8))
+		report |= SND_JACK_BTN_1;
+
+	/* Volume up key */
+	if (jack->unsol_res & (7 << 23))
+		report |= SND_JACK_BTN_2;
+
+	/* Volume down key */
+	if (jack->unsol_res & (7 << 10))
+		report |= SND_JACK_BTN_3;
+
+	jack->jack->button_state = report;
+}
+
+static void alc_disable_headset_jack_key(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (!spec->has_hs_key)
+		return;
+
+	switch (codec->core.vendor_id) {
+	case 0x10ec0215:
+	case 0x10ec0225:
+	case 0x10ec0285:
+	case 0x10ec0295:
+	case 0x10ec0289:
+	case 0x10ec0299:
+		alc_write_coef_idx(codec, 0x48, 0x0);
+		alc_update_coef_idx(codec, 0x49, 0x0045, 0x0);
+		alc_update_coef_idx(codec, 0x44, 0x0045 << 8, 0x0);
+		break;
+	case 0x10ec0236:
+	case 0x10ec0256:
+		alc_write_coef_idx(codec, 0x48, 0x0);
+		alc_update_coef_idx(codec, 0x49, 0x0045, 0x0);
+		break;
+	}
+}
+
+static void alc_enable_headset_jack_key(struct hda_codec *codec)
+{
+	struct alc_spec *spec = codec->spec;
+
+	if (!spec->has_hs_key)
+		return;
+
+	switch (codec->core.vendor_id) {
+	case 0x10ec0215:
+	case 0x10ec0225:
+	case 0x10ec0285:
+	case 0x10ec0295:
+	case 0x10ec0289:
+	case 0x10ec0299:
+		alc_write_coef_idx(codec, 0x48, 0xd011);
+		alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
+		alc_update_coef_idx(codec, 0x44, 0x007f << 8, 0x0045 << 8);
+		break;
+	case 0x10ec0236:
+	case 0x10ec0256:
+		alc_write_coef_idx(codec, 0x48, 0xd011);
+		alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
+		break;
+	}
+}
+
+static void alc_fixup_headset_jack(struct hda_codec *codec,
+				    const struct hda_fixup *fix, int action)
+{
+	struct alc_spec *spec = codec->spec;
+
+	switch (action) {
+	case HDA_FIXUP_ACT_PRE_PROBE:
+		spec->has_hs_key = 1;
+		snd_hda_jack_detect_enable_callback(codec, 0x55,
+						    alc_headset_btn_callback);
+		snd_hda_jack_add_kctl(codec, 0x55, "Headset Jack", false,
+				      SND_JACK_HEADSET, alc_headset_btn_keymap);
+		break;
+	case HDA_FIXUP_ACT_INIT:
+		alc_enable_headset_jack_key(codec);
+		break;
+	}
+}
+
 static void alc269vb_toggle_power_output(struct hda_codec *codec, int power_up)
 {
 	alc_update_coef_idx(codec, 0x04, 1 << 11, power_up ? (1 << 11) : 0);
@@ -3372,6 +3474,8 @@ static void alc225_shutup(struct hda_codec *codec)
 
 	if (!hp_pin)
 		hp_pin = 0x21;
+
+	alc_disable_headset_jack_key(codec);
 	/* 3k pull low control for Headset jack. */
 	alc_update_coef_idx(codec, 0x4a, 0, 3 << 10);
 
@@ -3411,6 +3515,9 @@ static void alc225_shutup(struct hda_codec *codec)
 		alc_update_coef_idx(codec, 0x4a, 3<<4, 2<<4);
 		msleep(30);
 	}
+
+	alc_update_coef_idx(codec, 0x4a, 3 << 10, 0);
+	alc_enable_headset_jack_key(codec);
 }
 
 static void alc_default_init(struct hda_codec *codec)
@@ -5668,69 +5775,6 @@ static void alc285_fixup_invalidate_dacs(struct hda_codec *codec,
 	snd_hda_override_wcaps(codec, 0x03, 0);
 }
 
-static const struct hda_jack_keymap alc_headset_btn_keymap[] = {
-	{ SND_JACK_BTN_0, KEY_PLAYPAUSE },
-	{ SND_JACK_BTN_1, KEY_VOICECOMMAND },
-	{ SND_JACK_BTN_2, KEY_VOLUMEUP },
-	{ SND_JACK_BTN_3, KEY_VOLUMEDOWN },
-	{}
-};
-
-static void alc_headset_btn_callback(struct hda_codec *codec,
-				     struct hda_jack_callback *jack)
-{
-	int report = 0;
-
-	if (jack->unsol_res & (7 << 13))
-		report |= SND_JACK_BTN_0;
-
-	if (jack->unsol_res  & (1 << 16 | 3 << 8))
-		report |= SND_JACK_BTN_1;
-
-	/* Volume up key */
-	if (jack->unsol_res & (7 << 23))
-		report |= SND_JACK_BTN_2;
-
-	/* Volume down key */
-	if (jack->unsol_res & (7 << 10))
-		report |= SND_JACK_BTN_3;
-
-	jack->jack->button_state = report;
-}
-
-static void alc_fixup_headset_jack(struct hda_codec *codec,
-				    const struct hda_fixup *fix, int action)
-{
-
-	switch (action) {
-	case HDA_FIXUP_ACT_PRE_PROBE:
-		snd_hda_jack_detect_enable_callback(codec, 0x55,
-						    alc_headset_btn_callback);
-		snd_hda_jack_add_kctl(codec, 0x55, "Headset Jack", false,
-				      SND_JACK_HEADSET, alc_headset_btn_keymap);
-		break;
-	case HDA_FIXUP_ACT_INIT:
-		switch (codec->core.vendor_id) {
-		case 0x10ec0215:
-		case 0x10ec0225:
-		case 0x10ec0285:
-		case 0x10ec0295:
-		case 0x10ec0289:
-		case 0x10ec0299:
-			alc_write_coef_idx(codec, 0x48, 0xd011);
-			alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
-			alc_update_coef_idx(codec, 0x44, 0x007f << 8, 0x0045 << 8);
-			break;
-		case 0x10ec0236:
-		case 0x10ec0256:
-			alc_write_coef_idx(codec, 0x48, 0xd011);
-			alc_update_coef_idx(codec, 0x49, 0x007f, 0x0045);
-			break;
-		}
-		break;
-	}
-}
-
 static void alc295_fixup_chromebook(struct hda_codec *codec,
 				    const struct hda_fixup *fix, int action)
 {
-- 
2.17.1

