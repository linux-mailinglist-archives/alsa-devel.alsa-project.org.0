Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DBC27447F
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 16:44:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EDA61723;
	Tue, 22 Sep 2020 16:43:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EDA61723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600785865;
	bh=ywkSvosXx5P1i6LBxqQs0xEyRKQEMag2yr0sjQOPkXs=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SfZePynQJnLyQ6Kjh6muLUn8IXm8VGGz1mcqXBBaL74Of+YLjeQ8oTlnL5bDNPZtO
	 TpxsjKneZ++2CWNSt2pDyoaQW/QdP6rdKuuOVBzrbw0LqfYLqP7zG3bxoaeH01erop
	 +Av5AXMRPFJ+UtfI3wNeBuSvHMilQrzVVnEZcLso=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ADD2F80229;
	Tue, 22 Sep 2020 16:42:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 481AFF8010A; Tue, 22 Sep 2020 16:42:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
 (using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B22FEF8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 16:42:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B22FEF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz
 header.b="A4yyRF49"
Received: from posta.frantovo.cz (localhost [127.0.0.1])
 by posta.frantovo.cz (Postfix) with ESMTP id 11CAA1A5D4E;
 Tue, 22 Sep 2020 16:42:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
 s=default; t=1600785742;
 bh=ywkSvosXx5P1i6LBxqQs0xEyRKQEMag2yr0sjQOPkXs=;
 h=From:To:Subject:Date;
 b=A4yyRF49K5ZeV84xuhYt8aRO8karyxLpCkWqXyoKw4IbXPX2TIrVT/iHKEihpZ6CU
 LkbY5jPahJexuFk+Dz6CJV/qi1ia2tHmbdUyh2Iw/UYLmx9hpjsrgGcr2RxaZMXJH1
 OWvckzOa1G9yCIvN+m0jNQFxEsBSb82azyquJeJk=
From: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>
Subject: [PATCH] ALSA: usb-audio: Add mixer support for Pioneer DJ DJM-250MK2
Date: Tue, 22 Sep 2020 16:42:06 +0200
Message-Id: <20200922144206.10472-1-konference@frantovo.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean
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

From: František Kučera <franta-linux@frantovo.cz>

This patch extends support for DJM-250MK2 and allows mapping
playback and capture channels to available sources.
Configures the card through USB commands.

Signed-off-by: František Kučera <franta-linux@frantovo.cz>
---
 sound/usb/mixer_quirks.c | 213 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 213 insertions(+)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 199cdbfdc761..df036a359f2f 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2602,6 +2602,216 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+/*
+ * Pioneer DJ DJM-250MK2 and maybe other DJM models
+ *
+ * For playback, no duplicate mapping should be set.
+ * There are three mixer stereo channels (CH1, CH2, AUX)
+ * and three stereo sources (Playback 1-2, Playback 3-4, Playback 5-6).
+ * Each channel should be mapped just once to one source.
+ * If mapped multiple times, only one source will play on given channel
+ * (sources are not mixed together).
+ *
+ * For recording, duplicate mapping is OK. We will get the same signal multiple times.
+ *
+ * Channels 7-8 are in both directions fixed to FX SEND / FX RETURN.
+ *
+ * See also notes in the quirks-table.h file.
+ */
+
+struct snd_pioneer_djm_option {
+	const u16 wIndex;
+	const u16 wValue;
+	const char *name;
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_level[] = {
+	{ .name =  "-5 dB",                  .wValue = 0x0300, .wIndex = 0x8003 },
+	{ .name = "-10 dB",                  .wValue = 0x0200, .wIndex = 0x8003 },
+	{ .name = "-15 dB",                  .wValue = 0x0100, .wIndex = 0x8003 },
+	{ .name = "-19 dB",                  .wValue = 0x0000, .wIndex = 0x8003 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch12[] = {
+	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
+	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
+	{ .name =  "Post CH1 Fader",         .wValue = 0x0106, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0107, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0108, .wIndex = 0x8002 },
+	{ .name =  "MIC",                    .wValue = 0x0109, .wIndex = 0x8002 },
+	{ .name =  "AUX",                    .wValue = 0x010d, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                .wValue = 0x010a, .wIndex = 0x8002 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch34[] = {
+	{ .name =  "CH2 Control Tone PHONO", .wValue = 0x0203, .wIndex = 0x8002 },
+	{ .name =  "CH2 Control Tone LINE",  .wValue = 0x0200, .wIndex = 0x8002 },
+	{ .name =  "Post CH2 Fader",         .wValue = 0x0206, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0207, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0208, .wIndex = 0x8002 },
+	{ .name =  "MIC",                    .wValue = 0x0209, .wIndex = 0x8002 },
+	{ .name =  "AUX",                    .wValue = 0x020d, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                .wValue = 0x020a, .wIndex = 0x8002 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch56[] = {
+	{ .name =  "REC OUT",                .wValue = 0x030a, .wIndex = 0x8002 },
+	{ .name =  "Post CH1 Fader",         .wValue = 0x0311, .wIndex = 0x8002 },
+	{ .name =  "Post CH2 Fader",         .wValue = 0x0312, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",          .wValue = 0x0307, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",          .wValue = 0x0308, .wIndex = 0x8002 },
+	{ .name =  "MIC",                    .wValue = 0x0309, .wIndex = 0x8002 },
+	{ .name =  "AUX",                    .wValue = 0x030d, .wIndex = 0x8002 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_12[] = {
+	{ .name =  "CH1",                    .wValue = 0x0100, .wIndex = 0x8016 },
+	{ .name =  "CH2",                    .wValue = 0x0101, .wIndex = 0x8016 },
+	{ .name =  "AUX",                    .wValue = 0x0104, .wIndex = 0x8016 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_34[] = {
+	{ .name =  "CH1",                    .wValue = 0x0200, .wIndex = 0x8016 },
+	{ .name =  "CH2",                    .wValue = 0x0201, .wIndex = 0x8016 },
+	{ .name =  "AUX",                    .wValue = 0x0204, .wIndex = 0x8016 }
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_56[] = {
+	{ .name =  "CH1",                    .wValue = 0x0300, .wIndex = 0x8016 },
+	{ .name =  "CH2",                    .wValue = 0x0301, .wIndex = 0x8016 },
+	{ .name =  "AUX",                    .wValue = 0x0304, .wIndex = 0x8016 }
+};
+
+struct snd_pioneer_djm_option_group {
+	const char *name;
+	const struct snd_pioneer_djm_option *options;
+	const size_t count;
+	const u16 default_value;
+};
+
+#define snd_pioneer_djm_option_group_item(_name, suffix, _default_value) { \
+	.name = _name, \
+	.options = snd_pioneer_djm_options_##suffix, \
+	.count = ARRAY_SIZE(snd_pioneer_djm_options_##suffix), \
+	.default_value = _default_value }
+
+static const struct snd_pioneer_djm_option_group snd_pioneer_djm_option_groups[] = {
+	snd_pioneer_djm_option_group_item("Master Capture Level Capture Switch", capture_level, 0),
+	snd_pioneer_djm_option_group_item("Capture 1-2 Capture Switch",          capture_ch12,  2),
+	snd_pioneer_djm_option_group_item("Capture 3-4 Capture Switch",          capture_ch34,  2),
+	snd_pioneer_djm_option_group_item("Capture 5-6 Capture Switch",          capture_ch56,  0),
+	snd_pioneer_djm_option_group_item("Playback 1-2 Playback Switch",        playback_12,   0),
+	snd_pioneer_djm_option_group_item("Playback 3-4 Playback Switch",        playback_34,   1),
+	snd_pioneer_djm_option_group_item("Playback 5-6 Playback Switch",        playback_56,   2)
+};
+
+// layout of the kcontrol->private_value:
+#define SND_PIONEER_DJM_VALUE_MASK 0x0000ffff
+#define SND_PIONEER_DJM_GROUP_MASK 0xffff0000
+#define SND_PIONEER_DJM_GROUP_SHIFT 16
+
+static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *info)
+{
+	u16 group_index = kctl->private_value >> SND_PIONEER_DJM_GROUP_SHIFT;
+	size_t count;
+	const char *name;
+	const struct snd_pioneer_djm_option_group *group;
+
+	if (group_index >= ARRAY_SIZE(snd_pioneer_djm_option_groups))
+		return -EINVAL;
+
+	group = &snd_pioneer_djm_option_groups[group_index];
+	count = group->count;
+	if (info->value.enumerated.item >= count)
+		info->value.enumerated.item = count - 1;
+	name = group->options[info->value.enumerated.item].name;
+	strlcpy(info->value.enumerated.name, name, sizeof(info->value.enumerated.name));
+	info->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
+	info->count = 1;
+	info->value.enumerated.items = count;
+	return 0;
+}
+
+static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer, u16 group, u16 value)
+{
+	int err;
+
+	if (group >= ARRAY_SIZE(snd_pioneer_djm_option_groups)
+			|| value >= snd_pioneer_djm_option_groups[group].count)
+		return -EINVAL;
+
+	err = snd_usb_lock_shutdown(mixer->chip);
+	if (err)
+		return err;
+
+	err = snd_usb_ctl_msg(
+		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
+		USB_REQ_SET_FEATURE,
+		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+		snd_pioneer_djm_option_groups[group].options[value].wValue,
+		snd_pioneer_djm_option_groups[group].options[value].wIndex,
+		NULL, 0);
+
+	snd_usb_unlock_shutdown(mixer->chip);
+	return err;
+}
+
+static int snd_pioneer_djm_controls_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
+{
+	elem->value.enumerated.item[0] = kctl->private_value & SND_PIONEER_DJM_VALUE_MASK;
+	return 0;
+}
+
+static int snd_pioneer_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = list->mixer;
+	unsigned long private_value = kctl->private_value;
+	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+	u16 value = elem->value.enumerated.item[0];
+
+	kctl->private_value = (group << SND_PIONEER_DJM_GROUP_SHIFT) | value;
+
+	return snd_pioneer_djm_controls_update(mixer, group, value);
+}
+
+static int snd_pioneer_djm_controls_resume(struct usb_mixer_elem_list *list)
+{
+	unsigned long private_value = list->kctl->private_value;
+	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+	u16 value = (private_value & SND_PIONEER_DJM_VALUE_MASK);
+
+	return snd_pioneer_djm_controls_update(list->mixer, group, value);
+}
+
+static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer)
+{
+	int err, i;
+	const struct snd_pioneer_djm_option_group *group;
+	struct snd_kcontrol_new knew = {
+		.iface  = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
+		.index = 0,
+		.info = snd_pioneer_djm_controls_info,
+		.get  = snd_pioneer_djm_controls_get,
+		.put  = snd_pioneer_djm_controls_put
+	};
+
+	for (i = 0; i < ARRAY_SIZE(snd_pioneer_djm_option_groups); i++) {
+		group = &snd_pioneer_djm_option_groups[i];
+		knew.name = group->name;
+		knew.private_value = (i << SND_PIONEER_DJM_GROUP_SHIFT) | group->default_value;
+		err = snd_pioneer_djm_controls_update(mixer, i, group->default_value);
+		if (err)
+			return err;
+		err = add_single_ctl_with_resume(mixer, 0, snd_pioneer_djm_controls_resume,
+						 &knew, NULL);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 {
 	int err = 0;
@@ -2706,6 +2916,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2a39, 0x3fb0): /* RME Babyface Pro FS */
 		err = snd_bbfpro_controls_create(mixer);
 		break;
+	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
+		err = snd_pioneer_djm_controls_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.20.1

