Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8416E30FD14
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 20:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9440B166D;
	Thu,  4 Feb 2021 20:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9440B166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612467743;
	bh=K26jSH+tXadASWrw7qO+EtJprcNhRJdiSt60wdw4wdY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oX7xcxu5LlnhE+lb7XVJf8nnX+K5hGAiUi75BhLJsZK23aSweKzaQ2daAovoVMj95
	 gUVHs76akSw++tFMaZ3BnOCbjJzMexYsjbqcI5KEdypMdg+5LqbRxdnrRVDM8pT3jG
	 +W0PyIlBToYHZnhctzlmsV3n1gCKybkZPxLY4644=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E1DDF8023E;
	Thu,  4 Feb 2021 20:40:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EAEBCF8023C; Thu,  4 Feb 2021 20:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54FF6F80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 20:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54FF6F80154
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id d042592e;
 Thu, 4 Feb 2021 19:40:41 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id e324d8e6;
 Thu, 4 Feb 2021 19:40:38 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id QFvLG7ZNHGBC/gAAnQSWfg
 (envelope-from <livvy@base.nu>); Thu, 04 Feb 2021 19:40:38 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: tiwai@suse.de
Subject: [PATCH v3 1/1] ALSA: usb-audio: Add DJM750 to Pioneer mixer quirk
Date: Thu,  4 Feb 2021 19:39:06 +0000
Message-Id: <20210204193906.20716-2-livvy@base.nu>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210204193906.20716-1-livvy@base.nu>
References: <s5hft2c8gbq.wl-tiwai@suse.de>
 <20210204193906.20716-1-livvy@base.nu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Olivia Mackintosh <livvy@base.nu>,
 fabian@lesniak-it.de
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
 sound/usb/mixer_quirks.c | 336 +++++++++++++++++++++++++--------------
 1 file changed, 214 insertions(+), 122 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index abad1d61a536..77b6bf029beb 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2602,142 +2602,218 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+
 /*
- * Pioneer DJ DJM-250MK2 and maybe other DJM models
- *
- * For playback, no duplicate mapping should be set.
- * There are three mixer stereo channels (CH1, CH2, AUX)
- * and three stereo sources (Playback 1-2, Playback 3-4, Playback 5-6).
- * Each channel should be mapped just once to one source.
- * If mapped multiple times, only one source will play on given channel
- * (sources are not mixed together).
- *
- * For recording, duplicate mapping is OK. We will get the same signal multiple times.
+ * Pioneer DJ DJM Mixers
  *
- * Channels 7-8 are in both directions fixed to FX SEND / FX RETURN.
- *
- * See also notes in the quirks-table.h file.
+ * These devices generally have options for soft-switching the playback and
+ * capture sources in addition to the recording level. Although different
+ * devices have different configurations, there seems to be canonical values
+ * for specific capture/playback types:  See the definitions below.
  */
 
-struct snd_pioneer_djm_option {
-	const u16 wIndex;
-	const u16 wValue;
-	const char *name;
-};
+// Capture types
+#define SND_DJM_CAP_LINE	0x00
+#define SND_DJM_CAP_CDLINE	0x01
+#define SND_DJM_CAP_PHONO	0x03
+#define SND_DJM_CAP_PFADER	0x06
+#define SND_DJM_CAP_XFADERA	0x07
+#define SND_DJM_CAP_XFADERB	0x08
+#define SND_DJM_CAP_MIC		0x09
+#define SND_DJM_CAP_AUX		0x0d
+#define SND_DJM_CAP_RECOUT	0x0a
+#define SND_DJM_CAP_NONE	0x0f
+#define SND_DJM_CAP_CH1PFADER	0x11
+#define SND_DJM_CAP_CH2PFADER	0x12
+
+// Playback types
+#define SND_DJM_PB_CH1		0x00
+#define SND_DJM_PB_CH2		0x01
+#define SND_DJM_PB_AUX		0x04
+
+#define SND_DJM_WINDEX_CAP	0x8002
+#define SND_DJM_WINDEX_CAPLVL	0x8003
+#define SND_DJM_WINDEX_PB	0x8016
+
+// kcontrol->private_value layout
+#define SND_DJM_VALUE_MASK	0x0000ffff
+#define SND_DJM_GROUP_MASK	0x00ff0000
+#define SND_DJM_DEVICE_MASK	0xff000000
+#define SND_DJM_GROUP_SHIFT	16
+#define SND_DJM_DEVICE_SHIFT	24
+
+// device table index
+#define SND_DJM_250MK2_IDX	0x0
+#define SND_DJM_750_IDX		0x1
+
+
+#define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
+	.name = _name, \
+	.options = snd_djm_opts_##suffix, \
+	.noptions = ARRAY_SIZE(snd_djm_opts_##suffix), \
+	.default_value = _default_value, \
+	.wIndex = _windex }
+
+#define SND_DJM_DEVICE(suffix) { \
+	.controls = snd_djm_ctls_##suffix, \
+	.ncontrols = ARRAY_SIZE(snd_djm_ctls_##suffix) }
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_level[] = {
-	{ .name =  "-5 dB",                  .wValue = 0x0300, .wIndex = 0x8003 },
-	{ .name = "-10 dB",                  .wValue = 0x0200, .wIndex = 0x8003 },
-	{ .name = "-15 dB",                  .wValue = 0x0100, .wIndex = 0x8003 },
-	{ .name = "-19 dB",                  .wValue = 0x0000, .wIndex = 0x8003 }
+
+struct snd_djm_device {
+	char *name;
+	const struct snd_djm_ctl *controls;
+	const size_t ncontrols;
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch12[] = {
-	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
-	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
-	{ .name =  "Post CH1 Fader",         .wValue = 0x0106, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0107, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0108, .wIndex = 0x8002 },
-	{ .name =  "MIC",                    .wValue = 0x0109, .wIndex = 0x8002 },
-	{ .name =  "AUX",                    .wValue = 0x010d, .wIndex = 0x8002 },
-	{ .name =  "REC OUT",                .wValue = 0x010a, .wIndex = 0x8002 }
+struct snd_djm_ctl {
+	const char *name;
+	const u16 *options;
+	const size_t noptions;
+	const u16 default_value;
+	const u16 wIndex;
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch34[] = {
-	{ .name =  "CH2 Control Tone PHONO", .wValue = 0x0203, .wIndex = 0x8002 },
-	{ .name =  "CH2 Control Tone LINE",  .wValue = 0x0200, .wIndex = 0x8002 },
-	{ .name =  "Post CH2 Fader",         .wValue = 0x0206, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0207, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0208, .wIndex = 0x8002 },
-	{ .name =  "MIC",                    .wValue = 0x0209, .wIndex = 0x8002 },
-	{ .name =  "AUX",                    .wValue = 0x020d, .wIndex = 0x8002 },
-	{ .name =  "REC OUT",                .wValue = 0x020a, .wIndex = 0x8002 }
+static char *snd_djm_get_label_caplevel(u16 wvalue)
+{
+	switch (wvalue) {
+	case 0x0000:	return "-19dB";
+	case 0x0100:	return "-15dB";
+	case 0x0200:	return "-10dB";
+	case 0x0300:	return "-5dB";
+	default:	return "\0"; // 'EINVAL'
+	}
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch56[] = {
-	{ .name =  "REC OUT",                .wValue = 0x030a, .wIndex = 0x8002 },
-	{ .name =  "Post CH1 Fader",         .wValue = 0x0311, .wIndex = 0x8002 },
-	{ .name =  "Post CH2 Fader",         .wValue = 0x0312, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0307, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0308, .wIndex = 0x8002 },
-	{ .name =  "MIC",                    .wValue = 0x0309, .wIndex = 0x8002 },
-	{ .name =  "AUX",                    .wValue = 0x030d, .wIndex = 0x8002 }
+static char *snd_djm_get_label_cap(u16 wvalue)
+{
+	switch (wvalue & 0x00ff) {
+	case SND_DJM_CAP_LINE:		return "Control Tone LINE\0";
+	case SND_DJM_CAP_CDLINE:	return "Control Tone CD/LINE\0";
+	case SND_DJM_CAP_PHONO:		return "Control Tone PHONO\0";
+	case SND_DJM_CAP_PFADER:	return "Post Fader\0";
+	case SND_DJM_CAP_XFADERA:	return "Cross Fader A\0";
+	case SND_DJM_CAP_XFADERB:	return "Cross Fader B\0";
+	case SND_DJM_CAP_MIC:		return "Mic\0";
+	case SND_DJM_CAP_RECOUT:	return "Rec Out\0";
+	case SND_DJM_CAP_AUX:		return "Aux\0";
+	case SND_DJM_CAP_NONE:		return "None\0";
+	case SND_DJM_CAP_CH1PFADER:	return "Post Fader Ch1\0";
+	case SND_DJM_CAP_CH2PFADER:	return "Post Fader Ch2\0";
+	default:			return "\0"; // 'EINVAL'
+	}
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_12[] = {
-	{ .name =  "CH1",                    .wValue = 0x0100, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0101, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0104, .wIndex = 0x8016 }
+static char *snd_djm_get_label_pb(u16 wvalue)
+{
+	switch (wvalue & 0x00ff) {
+	case SND_DJM_PB_CH1:	return "Ch1\0";
+	case SND_DJM_PB_CH2:	return "Ch2\0";
+	case SND_DJM_PB_AUX:	return "Aux\0";
+	default:		return "\0"; // 'EINVAL'
+	}
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_34[] = {
-	{ .name =  "CH1",                    .wValue = 0x0200, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0201, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0204, .wIndex = 0x8016 }
+static char *snd_djm_get_label(u16 wvalue, u16 windex)
+{
+	switch (windex) {
+	case SND_DJM_WINDEX_CAPLVL:	return snd_djm_get_label_caplevel(wvalue);
+	case SND_DJM_WINDEX_CAP:	return snd_djm_get_label_cap(wvalue);
+	case SND_DJM_WINDEX_PB:		return snd_djm_get_label_pb(wvalue);
+	default:			return "\0"; // 'EINVAL';
+	}
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_56[] = {
-	{ .name =  "CH1",                    .wValue = 0x0300, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0301, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0304, .wIndex = 0x8016 }
+
+// DJM-250MK2
+
+static const u16 snd_djm_opts_cap_level[] = {
+	0x0000, 0x0100, 0x0200, 0x0300 };
+
+static const u16 snd_djm_opts_250mk2_cap1[] = {
+	0x0103, 0x0100, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d, 0x010a };
+
+static const u16 snd_djm_opts_250mk2_cap2[] = {
+	0x0203, 0x0200, 0x0206, 0x0207, 0x0208, 0x0209, 0x020d, 0x020a };
+
+static const u16 snd_djm_opts_250mk2_cap3[] = {
+	0x030a, 0x0311, 0x0312, 0x0307, 0x0308, 0x0309, 0x030d };
+
+static const u16 snd_djm_opts_250mk2_pb1[] = { 0x0100, 0x0101, 0x0104 };
+static const u16 snd_djm_opts_250mk2_pb2[] = { 0x0200, 0x0201, 0x0204 };
+static const u16 snd_djm_opts_250mk2_pb3[] = { 0x0300, 0x0301, 0x0304 };
+
+static const struct snd_djm_ctl snd_djm_ctls_250mk2[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch1 Output",   250mk2_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch2 Output",   250mk2_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch3 Output",   250mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
-struct snd_pioneer_djm_option_group {
-	const char *name;
-	const struct snd_pioneer_djm_option *options;
-	const size_t count;
-	const u16 default_value;
+
+// DJM-750
+static const u16 snd_djm_opts_750_cap1[] = { 0x0100, 0x0103, 0x0106, 0x0107, 0x0108 };
+static const u16 snd_djm_opts_750_cap2[] = { 0x0200, 0x0201, 0x0206, 0x0207, 0x0208 };
+static const u16 snd_djm_opts_750_cap3[] = { 0x0300, 0x0301, 0x0306, 0x0307, 0x0308 };
+static const u16 snd_djm_opts_750_cap4[] = { 0x0400, 0x0403, 0x0406, 0x0407, 0x0408 };
+
+static const struct snd_djm_ctl snd_djm_ctls_750[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   750_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   750_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   750_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch4 Input",   750_cap4, 0, SND_DJM_WINDEX_CAP)
 };
 
-#define snd_pioneer_djm_option_group_item(_name, suffix, _default_value) { \
-	.name = _name, \
-	.options = snd_pioneer_djm_options_##suffix, \
-	.count = ARRAY_SIZE(snd_pioneer_djm_options_##suffix), \
-	.default_value = _default_value }
-
-static const struct snd_pioneer_djm_option_group snd_pioneer_djm_option_groups[] = {
-	snd_pioneer_djm_option_group_item("Master Capture Level Capture Switch", capture_level, 0),
-	snd_pioneer_djm_option_group_item("Capture 1-2 Capture Switch",          capture_ch12,  2),
-	snd_pioneer_djm_option_group_item("Capture 3-4 Capture Switch",          capture_ch34,  2),
-	snd_pioneer_djm_option_group_item("Capture 5-6 Capture Switch",          capture_ch56,  0),
-	snd_pioneer_djm_option_group_item("Playback 1-2 Playback Switch",        playback_12,   0),
-	snd_pioneer_djm_option_group_item("Playback 3-4 Playback Switch",        playback_34,   1),
-	snd_pioneer_djm_option_group_item("Playback 5-6 Playback Switch",        playback_56,   2)
+
+static const struct snd_djm_device snd_djm_devices[] = {
+	SND_DJM_DEVICE(250mk2),
+	SND_DJM_DEVICE(750)
 };
 
-// layout of the kcontrol->private_value:
-#define SND_PIONEER_DJM_VALUE_MASK 0x0000ffff
-#define SND_PIONEER_DJM_GROUP_MASK 0xffff0000
-#define SND_PIONEER_DJM_GROUP_SHIFT 16
 
-static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *info)
+static int snd_djm_controls_info(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_info *info)
 {
-	u16 group_index = kctl->private_value >> SND_PIONEER_DJM_GROUP_SHIFT;
-	size_t count;
+	unsigned long private_value = kctl->private_value;
+	u8 device_idx = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 ctl_idx = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
+	const struct snd_djm_device device = snd_djm_devices[device_idx];
 	const char *name;
-	const struct snd_pioneer_djm_option_group *group;
+	const struct snd_djm_ctl *ctl;
+	size_t noptions;
+
+	if (ctl_idx >= device.ncontrols)
+		return -EINVAL;
+
+	ctl = &device.controls[ctl_idx];
+	noptions = ctl->noptions;
+	if (info->value.enumerated.item >= noptions)
+		info->value.enumerated.item = noptions - 1;
 
-	if (group_index >= ARRAY_SIZE(snd_pioneer_djm_option_groups))
+	name = snd_djm_get_label(
+		ctl->options[info->value.enumerated.item],
+		ctl->wIndex
+	);
+	if (strlen(name) == 0)
 		return -EINVAL;
 
-	group = &snd_pioneer_djm_option_groups[group_index];
-	count = group->count;
-	if (info->value.enumerated.item >= count)
-		info->value.enumerated.item = count - 1;
-	name = group->options[info->value.enumerated.item].name;
 	strscpy(info->value.enumerated.name, name, sizeof(info->value.enumerated.name));
 	info->type = SNDRV_CTL_ELEM_TYPE_ENUMERATED;
 	info->count = 1;
-	info->value.enumerated.items = count;
+	info->value.enumerated.items = noptions;
 	return 0;
 }
 
-static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer, u16 group, u16 value)
+static int snd_djm_controls_update(struct usb_mixer_interface *mixer,
+				u8 device_idx, u8 group, u16 value)
 {
 	int err;
+	const  struct snd_djm_device *device = &snd_djm_devices[device_idx];
 
-	if (group >= ARRAY_SIZE(snd_pioneer_djm_option_groups)
-			|| value >= snd_pioneer_djm_option_groups[group].count)
+	if ((group >= device->ncontrols) || value >= device->controls[group].noptions)
 		return -EINVAL;
 
 	err = snd_usb_lock_shutdown(mixer->chip);
@@ -2748,63 +2824,76 @@ static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer, u1
 		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
 		USB_REQ_SET_FEATURE,
 		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
-		snd_pioneer_djm_option_groups[group].options[value].wValue,
-		snd_pioneer_djm_option_groups[group].options[value].wIndex,
+		device->controls[group].options[value],
+		device->controls[group].wIndex,
 		NULL, 0);
 
 	snd_usb_unlock_shutdown(mixer->chip);
 	return err;
 }
 
-static int snd_pioneer_djm_controls_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
+static int snd_djm_controls_get(struct snd_kcontrol *kctl,
+				struct snd_ctl_elem_value *elem)
 {
-	elem->value.enumerated.item[0] = kctl->private_value & SND_PIONEER_DJM_VALUE_MASK;
+	elem->value.enumerated.item[0] = kctl->private_value & SND_DJM_VALUE_MASK;
 	return 0;
 }
 
-static int snd_pioneer_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
+static int snd_djm_controls_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
 {
 	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer = list->mixer;
 	unsigned long private_value = kctl->private_value;
-	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+
+	u8 device = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
 	u16 value = elem->value.enumerated.item[0];
 
-	kctl->private_value = (group << SND_PIONEER_DJM_GROUP_SHIFT) | value;
+	kctl->private_value = ((device << SND_DJM_DEVICE_SHIFT) |
+			      (group << SND_DJM_GROUP_SHIFT) |
+			      value);
 
-	return snd_pioneer_djm_controls_update(mixer, group, value);
+	return snd_djm_controls_update(mixer, device, group, value);
 }
 
-static int snd_pioneer_djm_controls_resume(struct usb_mixer_elem_list *list)
+static int snd_djm_controls_resume(struct usb_mixer_elem_list *list)
 {
 	unsigned long private_value = list->kctl->private_value;
-	u16 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
-	u16 value = (private_value & SND_PIONEER_DJM_VALUE_MASK);
+	u8 device = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
+	u16 value = (private_value & SND_DJM_VALUE_MASK);
 
-	return snd_pioneer_djm_controls_update(list->mixer, group, value);
+	return snd_djm_controls_update(list->mixer, device, group, value);
 }
 
-static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer)
+static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
+		const u8 device_idx)
 {
 	int err, i;
-	const struct snd_pioneer_djm_option_group *group;
+	u16 value;
+
+	const struct snd_djm_device device = snd_djm_devices[device_idx];
+
 	struct snd_kcontrol_new knew = {
 		.iface  = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 		.index = 0,
-		.info = snd_pioneer_djm_controls_info,
-		.get  = snd_pioneer_djm_controls_get,
-		.put  = snd_pioneer_djm_controls_put
+		.info = snd_djm_controls_info,
+		.get  = snd_djm_controls_get,
+		.put  = snd_djm_controls_put
 	};
 
-	for (i = 0; i < ARRAY_SIZE(snd_pioneer_djm_option_groups); i++) {
-		group = &snd_pioneer_djm_option_groups[i];
-		knew.name = group->name;
-		knew.private_value = (i << SND_PIONEER_DJM_GROUP_SHIFT) | group->default_value;
-		err = snd_pioneer_djm_controls_update(mixer, i, group->default_value);
+	for (i = 0; i < device.ncontrols; i++) {
+		value = device.controls[i].default_value;
+		knew.name = device.controls[i].name;
+		knew.private_value = (
+			(device_idx << SND_DJM_DEVICE_SHIFT) |
+			(i << SND_DJM_GROUP_SHIFT) |
+			value);
+		err = snd_djm_controls_update(mixer, device_idx, i, value);
 		if (err)
 			return err;
-		err = add_single_ctl_with_resume(mixer, 0, snd_pioneer_djm_controls_resume,
+		err = add_single_ctl_with_resume(mixer, 0, snd_djm_controls_resume,
 						 &knew, NULL);
 		if (err)
 			return err;
@@ -2917,7 +3006,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_bbfpro_controls_create(mixer);
 		break;
 	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
-		err = snd_pioneer_djm_controls_create(mixer);
+		err = snd_djm_controls_create(mixer, SND_DJM_250MK2_IDX);
+		break;
+	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
+		err = snd_djm_controls_create(mixer, SND_DJM_750_IDX);
 		break;
 	}
 
-- 
2.30.0

