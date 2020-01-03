Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB712F5B7
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:49:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CD761798;
	Fri,  3 Jan 2020 09:48:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CD761798
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041359;
	bh=BL4IdvwWZl5/fdb6fSp/kShT3Xb/RsZPKUV3DJ4Fom8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJOVu1tKMhx9g+zbB3fqbPMl82eFYB34y4pkNud41owDMcgB8X4wa7R+vqIcQRjqe
	 q9qzQ6OBbXKcOJZQH2L1g91tMAdzyUwdRfeB/W+rDu+umnfpJgqB0jkYC7RNcxoQlH
	 Kcd2kEBujMMsl7GuVVmo1oKzSaY/G8mY2Kh0rgsw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A598F804DB;
	Fri,  3 Jan 2020 09:19:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AF4BF803CB; Fri,  3 Jan 2020 09:18:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2EE9AF802C3
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EE9AF802C3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AB561ACB8
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:57 +0100
Message-Id: <20200103081714.9560-42-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 41/58] ALSA: usb: Constify snd_kcontrol_new
	items
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Most of snd_kcontrol_new definitions are read-only and passed as-is.
Let's declare them as const for further optimization.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/6fire/control.c |  8 ++++----
 sound/usb/mixer.c         |  6 +++---
 sound/usb/mixer.h         |  2 +-
 sound/usb/mixer_quirks.c  | 16 ++++++++--------
 sound/usb/mixer_us16x08.c | 38 +++++++++++++++++++-------------------
 sound/usb/mixer_us16x08.h |  2 +-
 6 files changed, 36 insertions(+), 36 deletions(-)

diff --git a/sound/usb/6fire/control.c b/sound/usb/6fire/control.c
index de1f030eaf72..20f34d2ace5f 100644
--- a/sound/usb/6fire/control.c
+++ b/sound/usb/6fire/control.c
@@ -397,7 +397,7 @@ static int usb6fire_control_digital_thru_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new vol_elements[] = {
+static const struct snd_kcontrol_new vol_elements[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Analog Playback Volume",
@@ -437,7 +437,7 @@ static struct snd_kcontrol_new vol_elements[] = {
 	{}
 };
 
-static struct snd_kcontrol_new mute_elements[] = {
+static const struct snd_kcontrol_new mute_elements[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Analog Playback Switch",
@@ -471,7 +471,7 @@ static struct snd_kcontrol_new mute_elements[] = {
 	{}
 };
 
-static struct snd_kcontrol_new elements[] = {
+static const struct snd_kcontrol_new elements[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "Line/Phono Capture Route",
@@ -517,7 +517,7 @@ static int usb6fire_control_add_virtual(
 	struct control_runtime *rt,
 	struct snd_card *card,
 	char *name,
-	struct snd_kcontrol_new *elems)
+	const struct snd_kcontrol_new *elems)
 {
 	int ret;
 	int i;
diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index f60e0869c096..6d9080b47d0f 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -1445,7 +1445,7 @@ static int mixer_ctl_connector_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static struct snd_kcontrol_new usb_feature_unit_ctl = {
+static const struct snd_kcontrol_new usb_feature_unit_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "", /* will be filled later manually */
 	.info = mixer_ctl_feature_info,
@@ -1466,7 +1466,7 @@ static const struct snd_kcontrol_new usb_feature_unit_ctl_ro = {
  * A control which shows the boolean value from reading a UAC control on
  * the master channel.
  */
-static struct snd_kcontrol_new usb_bool_master_control_ctl_ro = {
+static const struct snd_kcontrol_new usb_bool_master_control_ctl_ro = {
 	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
 	.name = "", /* will be filled later manually */
 	.access = SNDRV_CTL_ELEM_ACCESS_READ,
@@ -1488,7 +1488,7 @@ static const struct snd_kcontrol_new usb_connector_ctl_ro = {
  * This symbol is exported in order to allow the mixer quirks to
  * hook up to the standard feature unit control mechanism
  */
-struct snd_kcontrol_new *snd_usb_feature_unit_ctl = &usb_feature_unit_ctl;
+const struct snd_kcontrol_new *snd_usb_feature_unit_ctl = &usb_feature_unit_ctl;
 
 /*
  * build a feature control
diff --git a/sound/usb/mixer.h b/sound/usb/mixer.h
index 37e1b234c802..65d6d08c96f5 100644
--- a/sound/usb/mixer.h
+++ b/sound/usb/mixer.h
@@ -116,6 +116,6 @@ int snd_usb_get_cur_mix_value(struct usb_mixer_elem_info *cval,
 
 extern void snd_usb_mixer_elem_free(struct snd_kcontrol *kctl);
 
-extern struct snd_kcontrol_new *snd_usb_feature_unit_ctl;
+extern const struct snd_kcontrol_new *snd_usb_feature_unit_ctl;
 
 #endif /* __USBMIXER_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 39e27ae6c597..4cb8331d87a4 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -507,7 +507,7 @@ static int snd_emu0204_ch_switch_resume(struct usb_mixer_elem_list *list)
 					    list->kctl->private_value);
 }
 
-static struct snd_kcontrol_new snd_emu0204_control = {
+static const struct snd_kcontrol_new snd_emu0204_control = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Front Jack Channels",
 	.info = snd_emu0204_ch_switch_info,
@@ -575,7 +575,7 @@ static int snd_xonar_u1_switch_resume(struct usb_mixer_elem_list *list)
 					  list->kctl->private_value);
 }
 
-static struct snd_kcontrol_new snd_xonar_u1_output_switch = {
+static const struct snd_kcontrol_new snd_xonar_u1_output_switch = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Digital Playback Switch",
 	.info = snd_ctl_boolean_mono_info,
@@ -702,7 +702,7 @@ static int snd_mbox1_switch_resume(struct usb_mixer_elem_list *list)
 	return snd_mbox1_switch_update(list->mixer, list->kctl->private_value);
 }
 
-static struct snd_kcontrol_new snd_mbox1_switch = {
+static const struct snd_kcontrol_new snd_mbox1_switch = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Clock Source",
 	.index = 0,
@@ -787,7 +787,7 @@ static int snd_nativeinstruments_control_put(struct snd_kcontrol *kcontrol,
 	return err < 0 ? err : 1;
 }
 
-static struct snd_kcontrol_new snd_nativeinstruments_ta6_mixers[] = {
+static const struct snd_kcontrol_new snd_nativeinstruments_ta6_mixers[] = {
 	{
 		.name = "Direct Thru Channel A",
 		.private_value = _MAKE_NI_CONTROL(0x01, 0x03),
@@ -806,7 +806,7 @@ static struct snd_kcontrol_new snd_nativeinstruments_ta6_mixers[] = {
 	},
 };
 
-static struct snd_kcontrol_new snd_nativeinstruments_ta10_mixers[] = {
+static const struct snd_kcontrol_new snd_nativeinstruments_ta10_mixers[] = {
 	{
 		.name = "Direct Thru Channel A",
 		.private_value = _MAKE_NI_CONTROL(0x01, 0x03),
@@ -1662,7 +1662,7 @@ static int snd_microii_spdif_switch_put(struct snd_kcontrol *kcontrol,
 	return err < 0 ? err : 1;
 }
 
-static struct snd_kcontrol_new snd_microii_mixer_spdif[] = {
+static const struct snd_kcontrol_new snd_microii_mixer_spdif[] = {
 	{
 		.iface =    SNDRV_CTL_ELEM_IFACE_PCM,
 		.name =     SNDRV_CTL_NAME_IEC958("", PLAYBACK, DEFAULT),
@@ -1769,7 +1769,7 @@ static int snd_soundblaster_e1_switch_info(struct snd_kcontrol *kcontrol,
 	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
 }
 
-static struct snd_kcontrol_new snd_soundblaster_e1_input_switch = {
+static const struct snd_kcontrol_new snd_soundblaster_e1_input_switch = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.name = "Input Source",
 	.info = snd_soundblaster_e1_switch_info,
@@ -2093,7 +2093,7 @@ static int snd_rme_sync_source_info(struct snd_kcontrol *kcontrol,
 				 ARRAY_SIZE(sync_sources), sync_sources);
 }
 
-static struct snd_kcontrol_new snd_rme_controls[] = {
+static const struct snd_kcontrol_new snd_rme_controls[] = {
 	{
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = "AES Rate",
diff --git a/sound/usb/mixer_us16x08.c b/sound/usb/mixer_us16x08.c
index f0e8e1539450..986145fd2ce0 100644
--- a/sound/usb/mixer_us16x08.c
+++ b/sound/usb/mixer_us16x08.c
@@ -760,7 +760,7 @@ static int snd_us16x08_meter_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static struct snd_kcontrol_new snd_us16x08_ch_boolean_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_ch_boolean_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -770,7 +770,7 @@ static struct snd_kcontrol_new snd_us16x08_ch_boolean_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 1)
 };
 
-static struct snd_kcontrol_new snd_us16x08_ch_int_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_ch_int_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -780,7 +780,7 @@ static struct snd_kcontrol_new snd_us16x08_ch_int_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_FADER_BIAS, 1, 0, 133)
 };
 
-static struct snd_kcontrol_new snd_us16x08_pan_int_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_pan_int_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -790,7 +790,7 @@ static struct snd_kcontrol_new snd_us16x08_pan_int_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_FADER_BIAS, 1, 0, 255)
 };
 
-static struct snd_kcontrol_new snd_us16x08_master_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_master_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 1,
@@ -800,7 +800,7 @@ static struct snd_kcontrol_new snd_us16x08_master_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_FADER_BIAS, 1, 0, 133)
 };
 
-static struct snd_kcontrol_new snd_us16x08_route_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_route_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 8,
@@ -810,7 +810,7 @@ static struct snd_kcontrol_new snd_us16x08_route_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 9)
 };
 
-static struct snd_kcontrol_new snd_us16x08_bus_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_bus_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 1,
@@ -820,7 +820,7 @@ static struct snd_kcontrol_new snd_us16x08_bus_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 1)
 };
 
-static struct snd_kcontrol_new snd_us16x08_compswitch_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_compswitch_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -830,7 +830,7 @@ static struct snd_kcontrol_new snd_us16x08_compswitch_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 1)
 };
 
-static struct snd_kcontrol_new snd_us16x08_comp_threshold_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_comp_threshold_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -841,7 +841,7 @@ static struct snd_kcontrol_new snd_us16x08_comp_threshold_ctl = {
 	0, 0x20)
 };
 
-static struct snd_kcontrol_new snd_us16x08_comp_ratio_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_comp_ratio_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -852,7 +852,7 @@ static struct snd_kcontrol_new snd_us16x08_comp_ratio_ctl = {
 	sizeof(ratio_map) - 1), /*max*/
 };
 
-static struct snd_kcontrol_new snd_us16x08_comp_gain_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_comp_gain_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -862,7 +862,7 @@ static struct snd_kcontrol_new snd_us16x08_comp_gain_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 0x14)
 };
 
-static struct snd_kcontrol_new snd_us16x08_comp_attack_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_comp_attack_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -873,7 +873,7 @@ static struct snd_kcontrol_new snd_us16x08_comp_attack_ctl = {
 	SND_US16X08_KCSET(SND_US16X08_COMP_ATTACK_BIAS, 1, 0, 0xc6),
 };
 
-static struct snd_kcontrol_new snd_us16x08_comp_release_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_comp_release_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -884,7 +884,7 @@ static struct snd_kcontrol_new snd_us16x08_comp_release_ctl = {
 	SND_US16X08_KCSET(SND_US16X08_COMP_RELEASE_BIAS, 1, 0, 0x63),
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_gain_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_gain_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -894,7 +894,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_gain_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 24),
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_low_freq_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_low_freq_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -904,7 +904,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_low_freq_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 0x1F),
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_mid_freq_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_mid_freq_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -914,7 +914,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_mid_freq_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 0x3F)
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_mid_width_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_mid_width_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -924,7 +924,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_mid_width_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 0x06)
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_high_freq_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_high_freq_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -935,7 +935,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_high_freq_ctl = {
 	SND_US16X08_KCSET(SND_US16X08_EQ_HIGHFREQ_BIAS, 1, 0, 0x1F)
 };
 
-static struct snd_kcontrol_new snd_us16x08_eq_switch_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_eq_switch_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 16,
@@ -945,7 +945,7 @@ static struct snd_kcontrol_new snd_us16x08_eq_switch_ctl = {
 	.private_value = SND_US16X08_KCSET(SND_US16X08_NO_BIAS, 1, 0, 1)
 };
 
-static struct snd_kcontrol_new snd_us16x08_meter_ctl = {
+static const struct snd_kcontrol_new snd_us16x08_meter_ctl = {
 	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 	.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 	.count = 1,
diff --git a/sound/usb/mixer_us16x08.h b/sound/usb/mixer_us16x08.h
index 56ff16c0698f..7b8583dd3b07 100644
--- a/sound/usb/mixer_us16x08.h
+++ b/sound/usb/mixer_us16x08.h
@@ -108,7 +108,7 @@ struct snd_us16x08_meter_store {
 };
 
 struct snd_us16x08_control_params {
-	struct snd_kcontrol_new *kcontrol_new;
+	const struct snd_kcontrol_new *kcontrol_new;
 	int control_id;
 	int type;
 	int num_channels;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
