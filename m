Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6630EB20
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 04:47:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89DA8175C;
	Thu,  4 Feb 2021 04:46:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89DA8175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612410455;
	bh=umOfdx6fGYsWuopQz1j4mHBwgTEq6MH8UKyVnjXMas4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lJK5i5o6UZ3Lb32QA39GH/MbnVlsIFbaI3Ux+GTIv77+sbxJ938FmWpH4YNIQKTze
	 HAf/qfrT4z84I9lT4IclukO1I3knZ5sR3GPM1IvNMdQ5dztCnNgc649goCViHQkDMm
	 WJF8f2VVjT0pLdIZrUiyWnrcRIl19acSY3cm4OgA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E3E9DF8026B;
	Thu,  4 Feb 2021 04:45:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73114F80275; Thu,  4 Feb 2021 04:45:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2235AF80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 04:45:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2235AF80155
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id 6c03c933;
 Thu, 4 Feb 2021 03:45:43 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id 2beafd17;
 Thu, 4 Feb 2021 03:45:41 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id SCAyLuVtG2AqYAAAnQSWfg
 (envelope-from <livvy@base.nu>); Thu, 04 Feb 2021 03:45:41 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Date: Thu,  4 Feb 2021 03:44:31 +0000
Message-Id: <20210204034432.15504-2-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210128160338.dac4vrj7wjiykcxm@base.nu>
References: <20210128160338.dac4vrj7wjiykcxm@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Olivia Mackintosh <livvy@base.nu>,
 Fabian Lesniak <fabian@lesniak-it.de>
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

This allows for N different devices to use the pioneer mixer quirk for
setting capture/record type and recording level. The impementation has
not changed much with the exception of an additional mask on
private_value to allow storing of a device index:
	DEVICE MASK	0xff000000
	GROUP_MASK	0x00ff0000
	VALUE_MASK	0x0000ffff

There is perhaps room for removing the duplication in the lookup tables
(name, wValue, wIndex) and deriving these. See the code header comment
to understand how this can be achieved.

Feedback is very much appreciated as I'm not the most proficient C
programmer but am learning as I go.

Signed-off-by: Olivia Mackintosh <livvy@base.nu>
---
 sound/usb/mixer_quirks.c | 195 +++++++++++++++++++++++++++++----------
 1 file changed, 148 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index abad1d61a536..8518691509d9 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2603,28 +2603,68 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 }
 
 /*
- * Pioneer DJ DJM-250MK2 and maybe other DJM models
+ * Pioneer DJ DJM Mixers
  *
- * For playback, no duplicate mapping should be set.
- * There are three mixer stereo channels (CH1, CH2, AUX)
- * and three stereo sources (Playback 1-2, Playback 3-4, Playback 5-6).
- * Each channel should be mapped just once to one source.
- * If mapped multiple times, only one source will play on given channel
- * (sources are not mixed together).
+ * These devices generally have options for soft-switching the playback and
+ * capture sources in addition to the recording level. Although different
+ * devices have different configurations, there seems to be canonical values
+ * for specific capture/playback types:
  *
- * For recording, duplicate mapping is OK. We will get the same signal multiple times.
+ * 	Capture 			| Playback
+ * 	================================|===========
+ * 	Control Tone Line	0x00	| Ch1	0x00
+ * 	Control Tone CD/Line	0x01	| Ch2	0x01
+ * 	Control Tone Phono	0x03	| Aux	0x04
+ * 	Post Fader		0x06	|
+ * 	Cross Fader A		0x07	|
+ * 	Cross Fader B		0x08	|
+ * 	Mic			0x09	|
+ * 	Aux			0x0d	|
+ * 	Rec_Out			0x0a	|
+ * 	None			0x0f	|
+ * 	Ch1 Post Fader		0x11	|
+ * 	Ch2 Post Fader		0x12	|
  *
- * Channels 7-8 are in both directions fixed to FX SEND / FX RETURN.
+ * The wValue for configuring playback/capture type also contains the channel
+ * the input type should apply to:
+ * 	CHANNEL NUMBER	0xff00
+ * 	INPUT TYPE	0x00ff
+ * e.g. Channel 2 set to 'Control Tone Phono' will have wValue 0x0203
+ *
+ * The wIndex values are below:
+ * 	CAPTURE		0x8002
+ * 	CAPTURE LEVEL	0x8003
+ * 	PLAYBACK	0x8016
  *
- * See also notes in the quirks-table.h file.
  */
 
+#define snd_pioneer_djm_option_group_item(_name, suffix, _default_value) { \
+	.name = _name, \
+	.options = snd_pioneer_djm_options_##suffix, \
+	.count = ARRAY_SIZE(snd_pioneer_djm_options_##suffix), \
+	.default_value = _default_value }
+
+struct snd_pioneer_djm_device {
+	char *name;
+	const struct snd_pioneer_djm_option_group *controls;
+	const size_t ncontrols;
+};
+
 struct snd_pioneer_djm_option {
 	const u16 wIndex;
 	const u16 wValue;
 	const char *name;
 };
 
+struct snd_pioneer_djm_option_group {
+	const char *name;
+	const struct snd_pioneer_djm_option *options;
+	const size_t count;
+	const u16 default_value;
+};
+
+/* Common Options
+ */
 static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_level[] = {
 	{ .name =  "-5 dB",                  .wValue = 0x0300, .wIndex = 0x8003 },
 	{ .name = "-10 dB",                  .wValue = 0x0200, .wIndex = 0x8003 },
@@ -2632,6 +2672,8 @@ static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_level
 	{ .name = "-19 dB",                  .wValue = 0x0000, .wIndex = 0x8003 }
 };
 
+/* DJM250MK2 Options
+ */
 static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch12[] = {
 	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
 	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
@@ -2682,20 +2724,8 @@ static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_56[]
 	{ .name =  "AUX",                    .wValue = 0x0304, .wIndex = 0x8016 }
 };
 
-struct snd_pioneer_djm_option_group {
-	const char *name;
-	const struct snd_pioneer_djm_option *options;
-	const size_t count;
-	const u16 default_value;
-};
-
-#define snd_pioneer_djm_option_group_item(_name, suffix, _default_value) { \
-	.name = _name, \
-	.options = snd_pioneer_djm_options_##suffix, \
-	.count = ARRAY_SIZE(snd_pioneer_djm_options_##suffix), \
-	.default_value = _default_value }
 
-static const struct snd_pioneer_djm_option_group snd_pioneer_djm_option_groups[] = {
+static const struct snd_pioneer_djm_option_group snd_pioneer_djm250mk2_option_groups[] = {
 	snd_pioneer_djm_option_group_item("Master Capture Level Capture Switch", capture_level, 0),
 	snd_pioneer_djm_option_group_item("Capture 1-2 Capture Switch",          capture_ch12,  2),
 	snd_pioneer_djm_option_group_item("Capture 3-4 Capture Switch",          capture_ch34,  2),
@@ -2705,22 +2735,77 @@ static const struct snd_pioneer_djm_option_group snd_pioneer_djm_option_groups[]
 	snd_pioneer_djm_option_group_item("Playback 5-6 Playback Switch",        playback_56,   2)
 };
 
+
+/* DJM750 */
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch1[] = {
+	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
+	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
+	{ .name =  "Post CH1 Fader",         .wValue = 0x0106, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0107, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0108, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch2[] = {
+	{ .name =  "CH2 Control Tone LINE",  .wValue = 0x0200, .wIndex = 0x8002 },
+	{ .name =  "CH2 Control Tone CDLINE",.wValue = 0x0201, .wIndex = 0x8002 },
+	{ .name =  "Post CH2 Fader",         .wValue = 0x0206, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0207, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0208, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch3[] = {
+	{ .name =  "CH3 Control Tone LINE",  .wValue = 0x0300, .wIndex = 0x8002 },
+	{ .name =  "CH3 Control Tone CDLINE",.wValue = 0x0301, .wIndex = 0x8002 },
+	{ .name =  "Post CH3 Fader",         .wValue = 0x0306, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0307, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0308, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch4[] = {
+	{ .name =  "CH4 Control Tone LINE",  .wValue = 0x0400, .wIndex = 0x8002 },
+	{ .name =  "CH4 Control Tone PHONO", .wValue = 0x0403, .wIndex = 0x8002 },
+	{ .name =  "Post CH4 Fader",         .wValue = 0x0406, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0407, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0408, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option_group snd_pioneer_djm750_option_groups[] = {
+	snd_pioneer_djm_option_group_item("Capture Level", capture_level, 0),
+	snd_pioneer_djm_option_group_item("CH1 Input", djm750_capture_ch1, 2),
+	snd_pioneer_djm_option_group_item("CH2 Input", djm750_capture_ch2, 2),
+	snd_pioneer_djm_option_group_item("CH3 Input", djm750_capture_ch3, 0),
+	snd_pioneer_djm_option_group_item("CH4 Input", djm750_capture_ch4, 0),
+};
+
+static const struct snd_pioneer_djm_device snd_pioneer_djm_devices[] = {
+	{ .name = "DJM-250Mk2", .controls = snd_pioneer_djm250mk2_option_groups, .ncontrols = 7},
+	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5}
+};
+
 // layout of the kcontrol->private_value:
 #define SND_PIONEER_DJM_VALUE_MASK 0x0000ffff
-#define SND_PIONEER_DJM_GROUP_MASK 0xffff0000
+#define SND_PIONEER_DJM_GROUP_MASK 0x00ff0000
+#define SND_PIONEER_DJM_DEVICE_MASK 0xff000000
 #define SND_PIONEER_DJM_GROUP_SHIFT 16
+#define SND_PIONEER_DJM_DEVICE_SHIFT 24
+
 
 static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *info)
 {
-	u16 group_index = kctl->private_value >> SND_PIONEER_DJM_GROUP_SHIFT;
+	unsigned long private_value = kctl->private_value;
+	u8 device_idx = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
+	u8 group_idx = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+
+	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
+
 	size_t count;
 	const char *name;
 	const struct snd_pioneer_djm_option_group *group;
 
-	if (group_index >= ARRAY_SIZE(snd_pioneer_djm_option_groups))
+	if (group_idx >= device.ncontrols)
 		return -EINVAL;
 
-	group = &snd_pioneer_djm_option_groups[group_index];
+	group = &device.controls[group_idx];
 	count = group->count;
 	if (info->value.enumerated.item >= count)
 		info->value.enumerated.item = count - 1;
@@ -2732,12 +2817,13 @@ static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_c
 	return 0;
 }
 
-static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer, u16 group, u16 value)
+static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer,
+		u8 device_idx, u8 group, u16 value)
 {
 	int err;
+	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
 
-	if (group >= ARRAY_SIZE(snd_pioneer_djm_option_groups)
-			|| value >= snd_pioneer_djm_option_groups[group].count)
+	if ((group >= device.ncontrols) || value >= device.controls[group].count)
 		return -EINVAL;
 
 	err = snd_usb_lock_shutdown(mixer->chip);
@@ -2747,9 +2833,8 @@ static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer, u1
 	err = snd_usb_ctl_msg(
 		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
 		USB_REQ_SET_FEATURE,
-		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-		snd_pioneer_djm_option_groups[group].options[value].wValue,
-		snd_pioneer_djm_option_groups[group].options[value].wIndex,
+		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE, device.controls[group].options[value].wValue,
+		device.controls[group].options[value].wIndex,
 		NULL, 0);
 
 	snd_usb_unlock_shutdown(mixer->chip);
@@ -2767,27 +2852,34 @@ static int snd_pioneer_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ct
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
 	unsigned long private_value = kctl->private_value;
-	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+
+	u8 device = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
 	u16 value = elem->value.enumerated.item[0];
 
-	kctl->private_value = (group << SND_PIONEER_DJM_GROUP_SHIFT) | value;
+	kctl->private_value = ((device << SND_PIONEER_DJM_DEVICE_SHIFT) |
+			      (group << SND_PIONEER_DJM_GROUP_SHIFT) |
+			      value);
 
-	return snd_pioneer_djm_controls_update(mixer, group, value);
+	return snd_pioneer_djm_controls_update(mixer, device, group, value);
 }
 
 static int snd_pioneer_djm_controls_resume(struct usb_mixer_elem_list *list)
 {
 	unsigned long private_value = list->kctl->private_value;
-	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+	u8 device = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
 	u16 value = (private_value & SND_PIONEER_DJM_VALUE_MASK);
-
-	return snd_pioneer_djm_controls_update(list->mixer, group, value);
+	return snd_pioneer_djm_controls_update(list->mixer, device, group, value);
 }
 
-static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer)
+static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer,
+		const u8 device_idx)
 {
 	int err, i;
-	const struct snd_pioneer_djm_option_group *group;
+
+	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
+
 	struct snd_kcontrol_new knew = {
 		.iface  = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
@@ -2797,11 +2889,17 @@ static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer)
 		.put  = snd_pioneer_djm_controls_put
 	};
 
-	for (i = 0; i < ARRAY_SIZE(snd_pioneer_djm_option_groups); i++) {
-		group = &snd_pioneer_djm_option_groups[i];
-		knew.name = group->name;
-		knew.private_value = (i << SND_PIONEER_DJM_GROUP_SHIFT) | group->default_value;
-		err = snd_pioneer_djm_controls_update(mixer, i, group->default_value);
+	u16 value;
+	for (i = 0; i < device.ncontrols; i++) {
+		value = device.controls[i].default_value;
+
+		knew.name = device.controls[i].name;
+		knew.private_value = (
+			(device_idx << SND_PIONEER_DJM_DEVICE_SHIFT) |
+			(i << SND_PIONEER_DJM_GROUP_SHIFT) |
+			value);
+
+		err = snd_pioneer_djm_controls_update(mixer, device_idx, i, value);
 		if (err)
 			return err;
 		err = add_single_ctl_with_resume(mixer, 0, snd_pioneer_djm_controls_resume,
@@ -2917,7 +3015,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_bbfpro_controls_create(mixer);
 		break;
 	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
-		err = snd_pioneer_djm_controls_create(mixer);
+		err = snd_pioneer_djm_controls_create(mixer, 0x00);
+		break;
+	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
+		err = snd_pioneer_djm_controls_create(mixer, 0x01);
 		break;
 	}
 
-- 
2.30.0

