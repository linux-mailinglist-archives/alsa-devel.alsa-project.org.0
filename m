Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64E2A30EB21
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 04:48:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 046061713;
	Thu,  4 Feb 2021 04:47:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 046061713
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612410492;
	bh=ubrNBp33GaX7vtjJ6DSCLWcJ/eihyI5qjjrFE46TM8Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lw2O7DtbDp6sYsX9ft/eFM5SC5BL2brTasm2O1QJ/sGQMtrwur7xOcI2sDo6agfo0
	 vcLy1mLHwLrzcuWV9EG7/bxDQfZYH6RqsZ9Ngtx+lmI91R1GGelXiTZfbEoY5KkuAJ
	 wssSZIqzam38snE6BCuytGwUfpDl4QfsqMlEsrOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C4173F802A0;
	Thu,  4 Feb 2021 04:45:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B951EF80264; Thu,  4 Feb 2021 04:45:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from hellmouth.base.nu (hellmouth.base.nu [192.248.168.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55194F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 04:45:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55194F80139
Received: from baphomet.hell (<unknown> [192.168.179.1])
 by hellmouth.base.nu (OpenSMTPD) with ESMTP id f6790f96;
 Thu, 4 Feb 2021 03:45:44 +0000 (UTC)
Received: from baphomet.hell (localhost [127.0.0.1])
 by baphomet.hell (OpenSMTPD) with ESMTP id cf06accb;
 Thu, 4 Feb 2021 03:45:43 +0000 (GMT)
Received: from localhost.localdomain ([192.168.178.2])
 by baphomet.hell with ESMTPSA id yMRcOeZtG2AqYAAAnQSWfg
 (envelope-from <livvy@base.nu>); Thu, 04 Feb 2021 03:45:42 +0000
From: Olivia Mackintosh <livvy@base.nu>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ALSA: usb-audio: Simplify DJM mixer quirks
Date: Thu,  4 Feb 2021 03:44:32 +0000
Message-Id: <20210204034432.15504-3-livvy@base.nu>
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

More DJM devices are due to be addded to Mixer quirks. This removes some
of the device-specific duplication by doing the following:

	1. Don't specify wIndex on each value, just specify it on the
	   control.
	2. Lookup the control labels dynamically based on the wValue.
	3. Shorten the namespace prefix to "snd_djm_"

Signed-off-by: Olivia Mackintosh <livvy@base.nu>
---
 sound/usb/mixer_quirks.c | 370 +++++++++++++++++++--------------------
 1 file changed, 178 insertions(+), 192 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 8518691509d9..0080187e891c 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2602,228 +2602,214 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 	return 0;
 }
 
+
 /*
  * Pioneer DJ DJM Mixers
  *
  * These devices generally have options for soft-switching the playback and
  * capture sources in addition to the recording level. Although different
  * devices have different configurations, there seems to be canonical values
- * for specific capture/playback types:
- *
- * 	Capture 			| Playback
- * 	================================|===========
- * 	Control Tone Line	0x00	| Ch1	0x00
- * 	Control Tone CD/Line	0x01	| Ch2	0x01
- * 	Control Tone Phono	0x03	| Aux	0x04
- * 	Post Fader		0x06	|
- * 	Cross Fader A		0x07	|
- * 	Cross Fader B		0x08	|
- * 	Mic			0x09	|
- * 	Aux			0x0d	|
- * 	Rec_Out			0x0a	|
- * 	None			0x0f	|
- * 	Ch1 Post Fader		0x11	|
- * 	Ch2 Post Fader		0x12	|
- *
- * The wValue for configuring playback/capture type also contains the channel
- * the input type should apply to:
- * 	CHANNEL NUMBER	0xff00
- * 	INPUT TYPE	0x00ff
- * e.g. Channel 2 set to 'Control Tone Phono' will have wValue 0x0203
- *
- * The wIndex values are below:
- * 	CAPTURE		0x8002
- * 	CAPTURE LEVEL	0x8003
- * 	PLAYBACK	0x8016
- *
+ * for specific capture/playback types:  See the definitions below.
  */
 
-#define snd_pioneer_djm_option_group_item(_name, suffix, _default_value) { \
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
 	.name = _name, \
-	.options = snd_pioneer_djm_options_##suffix, \
-	.count = ARRAY_SIZE(snd_pioneer_djm_options_##suffix), \
-	.default_value = _default_value }
+	.options = snd_djm_opts_##suffix, \
+	.noptions = ARRAY_SIZE(snd_djm_opts_##suffix), \
+	.default_value = _default_value, \
+	.wIndex = _windex }
 
-struct snd_pioneer_djm_device {
+#define SND_DJM_DEVICE(suffix) { \
+	.controls = snd_djm_ctls_##suffix, \
+	.ncontrols = ARRAY_SIZE(snd_djm_ctls_##suffix) }
+
+
+struct snd_djm_device {
 	char *name;
-	const struct snd_pioneer_djm_option_group *controls;
+	const struct snd_djm_ctl *controls;
 	const size_t ncontrols;
 };
 
-struct snd_pioneer_djm_option {
-	const u16 wIndex;
-	const u16 wValue;
+struct snd_djm_ctl {
 	const char *name;
-};
-
-struct snd_pioneer_djm_option_group {
-	const char *name;
-	const struct snd_pioneer_djm_option *options;
-	const size_t count;
+	const u16 *options;
+	const size_t noptions;
 	const u16 default_value;
+	const u16 wIndex;
 };
 
-/* Common Options
- */
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_level[] = {
-	{ .name =  "-5 dB",                  .wValue = 0x0300, .wIndex = 0x8003 },
-	{ .name = "-10 dB",                  .wValue = 0x0200, .wIndex = 0x8003 },
-	{ .name = "-15 dB",                  .wValue = 0x0100, .wIndex = 0x8003 },
-	{ .name = "-19 dB",                  .wValue = 0x0000, .wIndex = 0x8003 }
+static char *snd_djm_get_label_caplevel(u16 wvalue) {
+	switch(wvalue) {
+	case 0x0000:	return "-19dB";
+	case 0x0100:	return "-15dB";
+	case 0x0200:	return "-10dB";
+	case 0x0300:	return "-5dB";
+	default:	return "\0"; // 'EINVAL'
+	}
 };
 
-/* DJM250MK2 Options
- */
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch12[] = {
-	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
-	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
-	{ .name =  "Post CH1 Fader",         .wValue = 0x0106, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0107, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0108, .wIndex = 0x8002 },
-	{ .name =  "MIC",                    .wValue = 0x0109, .wIndex = 0x8002 },
-	{ .name =  "AUX",                    .wValue = 0x010d, .wIndex = 0x8002 },
-	{ .name =  "REC OUT",                .wValue = 0x010a, .wIndex = 0x8002 }
+static char *snd_djm_get_label_cap(u16 wvalue) {
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
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_capture_ch34[] = {
-	{ .name =  "CH2 Control Tone PHONO", .wValue = 0x0203, .wIndex = 0x8002 },
-	{ .name =  "CH2 Control Tone LINE",  .wValue = 0x0200, .wIndex = 0x8002 },
-	{ .name =  "Post CH2 Fader",         .wValue = 0x0206, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0207, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0208, .wIndex = 0x8002 },
-	{ .name =  "MIC",                    .wValue = 0x0209, .wIndex = 0x8002 },
-	{ .name =  "AUX",                    .wValue = 0x020d, .wIndex = 0x8002 },
-	{ .name =  "REC OUT",                .wValue = 0x020a, .wIndex = 0x8002 }
+static char *snd_djm_get_label_pb(u16 wvalue) {
+	switch (wvalue & 0x00ff) {
+	case SND_DJM_PB_CH1:	return "Ch1\0";
+	case SND_DJM_PB_CH2:	return "Ch2\0";
+	case SND_DJM_PB_AUX:	return "Aux\0";
+	default:		return "\0"; // 'EINVAL'
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
+static char *snd_djm_get_label(u16 wvalue, u16 windex) {
+	switch(windex) {
+	case SND_DJM_WINDEX_CAPLVL:	return snd_djm_get_label_caplevel(wvalue);
+	case SND_DJM_WINDEX_CAP:	return snd_djm_get_label_cap(wvalue);
+	case SND_DJM_WINDEX_PB:		return snd_djm_get_label_pb(wvalue);
+	default:			return "\0"; // 'EINVAL';
+	}
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_12[] = {
-	{ .name =  "CH1",                    .wValue = 0x0100, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0101, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0104, .wIndex = 0x8016 }
-};
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_34[] = {
-	{ .name =  "CH1",                    .wValue = 0x0200, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0201, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0204, .wIndex = 0x8016 }
-};
+// DJM-250MK2
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_playback_56[] = {
-	{ .name =  "CH1",                    .wValue = 0x0300, .wIndex = 0x8016 },
-	{ .name =  "CH2",                    .wValue = 0x0301, .wIndex = 0x8016 },
-	{ .name =  "AUX",                    .wValue = 0x0304, .wIndex = 0x8016 }
-};
+static const u16 snd_djm_opts_cap_level[] = {
+	0x0000, 0x0100, 0x0200, 0x0300 };
 
+static const u16 snd_djm_opts_250mk2_cap1[] = {
+	0x0103, 0x0100, 0x0106, 0x0107, 0x0108, 0x0109, 0x010d, 0x010a };
 
-static const struct snd_pioneer_djm_option_group snd_pioneer_djm250mk2_option_groups[] = {
-	snd_pioneer_djm_option_group_item("Master Capture Level Capture Switch", capture_level, 0),
-	snd_pioneer_djm_option_group_item("Capture 1-2 Capture Switch",          capture_ch12,  2),
-	snd_pioneer_djm_option_group_item("Capture 3-4 Capture Switch",          capture_ch34,  2),
-	snd_pioneer_djm_option_group_item("Capture 5-6 Capture Switch",          capture_ch56,  0),
-	snd_pioneer_djm_option_group_item("Playback 1-2 Playback Switch",        playback_12,   0),
-	snd_pioneer_djm_option_group_item("Playback 3-4 Playback Switch",        playback_34,   1),
-	snd_pioneer_djm_option_group_item("Playback 5-6 Playback Switch",        playback_56,   2)
-};
+static const u16 snd_djm_opts_250mk2_cap2[] = {
+	0x0203, 0x0200, 0x0206, 0x0207, 0x0208, 0x0209, 0x020d, 0x020a };
 
+static const u16 snd_djm_opts_250mk2_cap3[] = {
+	0x030a, 0x0311, 0x0312, 0x0307, 0x0308, 0x0309, 0x030d };
 
-/* DJM750 */
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch1[] = {
-	{ .name =  "CH1 Control Tone LINE",  .wValue = 0x0100, .wIndex = 0x8002 },
-	{ .name =  "CH1 Control Tone PHONO", .wValue = 0x0103, .wIndex = 0x8002 },
-	{ .name =  "Post CH1 Fader",         .wValue = 0x0106, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0107, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0108, .wIndex = 0x8002 },
-};
+static const u16 snd_djm_opts_250mk2_pb1[] = { 0x0100, 0x0101, 0x0104 };
+static const u16 snd_djm_opts_250mk2_pb2[] = { 0x0200, 0x0201, 0x0204 };
+static const u16 snd_djm_opts_250mk2_pb3[] = { 0x0300, 0x0301, 0x0304 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch2[] = {
-	{ .name =  "CH2 Control Tone LINE",  .wValue = 0x0200, .wIndex = 0x8002 },
-	{ .name =  "CH2 Control Tone CDLINE",.wValue = 0x0201, .wIndex = 0x8002 },
-	{ .name =  "Post CH2 Fader",         .wValue = 0x0206, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0207, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0208, .wIndex = 0x8002 },
+static const struct snd_djm_ctl snd_djm_ctls_250mk2[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   250mk2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   250mk2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   250mk2_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch1 Output",   250mk2_pb1, 0, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch2 Output",   250mk2_pb2, 1, SND_DJM_WINDEX_PB),
+	SND_DJM_CTL("Ch3 Output",   250mk2_pb3, 2, SND_DJM_WINDEX_PB)
 };
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch3[] = {
-	{ .name =  "CH3 Control Tone LINE",  .wValue = 0x0300, .wIndex = 0x8002 },
-	{ .name =  "CH3 Control Tone CDLINE",.wValue = 0x0301, .wIndex = 0x8002 },
-	{ .name =  "Post CH3 Fader",         .wValue = 0x0306, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0307, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0308, .wIndex = 0x8002 },
-};
 
-static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm750_capture_ch4[] = {
-	{ .name =  "CH4 Control Tone LINE",  .wValue = 0x0400, .wIndex = 0x8002 },
-	{ .name =  "CH4 Control Tone PHONO", .wValue = 0x0403, .wIndex = 0x8002 },
-	{ .name =  "Post CH4 Fader",         .wValue = 0x0406, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader A",          .wValue = 0x0407, .wIndex = 0x8002 },
-	{ .name =  "Cross Fader B",          .wValue = 0x0408, .wIndex = 0x8002 },
-};
+// DJM-750
+static const u16 snd_djm_opts_750_cap1[] = { 0x0100, 0x0103, 0x0106, 0x0107, 0x0108 };
+static const u16 snd_djm_opts_750_cap2[] = { 0x0200, 0x0201, 0x0206, 0x0207, 0x0208 };
+static const u16 snd_djm_opts_750_cap3[] = { 0x0300, 0x0301, 0x0306, 0x0307, 0x0308 };
+static const u16 snd_djm_opts_750_cap4[] = { 0x0400, 0x0403, 0x0406, 0x0407, 0x0408 };
 
-static const struct snd_pioneer_djm_option_group snd_pioneer_djm750_option_groups[] = {
-	snd_pioneer_djm_option_group_item("Capture Level", capture_level, 0),
-	snd_pioneer_djm_option_group_item("CH1 Input", djm750_capture_ch1, 2),
-	snd_pioneer_djm_option_group_item("CH2 Input", djm750_capture_ch2, 2),
-	snd_pioneer_djm_option_group_item("CH3 Input", djm750_capture_ch3, 0),
-	snd_pioneer_djm_option_group_item("CH4 Input", djm750_capture_ch4, 0),
+static const struct snd_djm_ctl snd_djm_ctls_750[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   750_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   750_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   750_cap3, 0, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch4 Input",   750_cap4, 0, SND_DJM_WINDEX_CAP)
 };
 
-static const struct snd_pioneer_djm_device snd_pioneer_djm_devices[] = {
-	{ .name = "DJM-250Mk2", .controls = snd_pioneer_djm250mk2_option_groups, .ncontrols = 7},
-	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5}
-};
 
-// layout of the kcontrol->private_value:
-#define SND_PIONEER_DJM_VALUE_MASK 0x0000ffff
-#define SND_PIONEER_DJM_GROUP_MASK 0x00ff0000
-#define SND_PIONEER_DJM_DEVICE_MASK 0xff000000
-#define SND_PIONEER_DJM_GROUP_SHIFT 16
-#define SND_PIONEER_DJM_DEVICE_SHIFT 24
+static const struct snd_djm_device snd_djm_devices[] = {
+	SND_DJM_DEVICE(250mk2),
+	SND_DJM_DEVICE(750)
+};
 
 
-static int snd_pioneer_djm_controls_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *info)
+static int snd_djm_controls_info(struct snd_kcontrol *kctl,
+		                 struct snd_ctl_elem_info *info)
 {
 	unsigned long private_value = kctl->private_value;
-	u8 device_idx = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
-	u8 group_idx = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+	u8 device_idx = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 ctl_idx = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
+	const struct snd_djm_device device = snd_djm_devices[device_idx];
+	const char *name;
+	const struct snd_djm_ctl *ctl;
+	size_t noptions;
 
-	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
+	if (ctl_idx >= device.ncontrols)
+		return -EINVAL;
 
-	size_t count;
-	const char *name;
-	const struct snd_pioneer_djm_option_group *group;
+	ctl = &device.controls[ctl_idx];
+	noptions = ctl->noptions;
+	if (info->value.enumerated.item >= noptions)
+		info->value.enumerated.item = noptions - 1;
 
-	if (group_idx >= device.ncontrols)
+	name = snd_djm_get_label(
+		ctl->options[info->value.enumerated.item],
+		ctl->wIndex
+	);
+	if (strlen(name) == 0)
 		return -EINVAL;
 
-	group = &device.controls[group_idx];
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
 
-static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer,
-		u8 device_idx, u8 group, u16 value)
+static int snd_djm_controls_update(struct usb_mixer_interface *mixer,
+		                   u8 device_idx, u8 group, u16 value)
 {
 	int err;
-	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
+	const  struct snd_djm_device *device = &snd_djm_devices[device_idx];
 
-	if ((group >= device.ncontrols) || value >= device.controls[group].count)
+	if ((group >= device->ncontrols) || value >= device->controls[group].noptions)
 		return -EINVAL;
 
 	err = snd_usb_lock_shutdown(mixer->chip);
@@ -2833,76 +2819,76 @@ static int snd_pioneer_djm_controls_update(struct usb_mixer_interface *mixer,
 	err = snd_usb_ctl_msg(
 		mixer->chip->dev, usb_sndctrlpipe(mixer->chip->dev, 0),
 		USB_REQ_SET_FEATURE,
-		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE, device.controls[group].options[value].wValue,
-		device.controls[group].options[value].wIndex,
+		USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_DEVICE,
+		device->controls[group].options[value],
+		device->controls[group].wIndex,
 		NULL, 0);
 
 	snd_usb_unlock_shutdown(mixer->chip);
 	return err;
 }
 
-static int snd_pioneer_djm_controls_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *elem)
+static int snd_djm_controls_get(struct snd_kcontrol *kctl,
+		                struct snd_ctl_elem_value *elem)
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
 
-	u8 device = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
-	u8 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
+	u8 device = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
 	u16 value = elem->value.enumerated.item[0];
 
-	kctl->private_value = ((device << SND_PIONEER_DJM_DEVICE_SHIFT) |
-			      (group << SND_PIONEER_DJM_GROUP_SHIFT) |
+	kctl->private_value = ((device << SND_DJM_DEVICE_SHIFT) |
+			      (group << SND_DJM_GROUP_SHIFT) |
 			      value);
 
-	return snd_pioneer_djm_controls_update(mixer, device, group, value);
+	return snd_djm_controls_update(mixer, device, group, value);
 }
 
-static int snd_pioneer_djm_controls_resume(struct usb_mixer_elem_list *list)
+static int snd_djm_controls_resume(struct usb_mixer_elem_list *list)
 {
 	unsigned long private_value = list->kctl->private_value;
-	u8 device = (private_value & SND_PIONEER_DJM_DEVICE_MASK) >> SND_PIONEER_DJM_DEVICE_SHIFT;
-	u8 group = (private_value & SND_PIONEER_DJM_GROUP_MASK) >> SND_PIONEER_DJM_GROUP_SHIFT;
-	u16 value = (private_value & SND_PIONEER_DJM_VALUE_MASK);
-	return snd_pioneer_djm_controls_update(list->mixer, device, group, value);
+	u8 device = (private_value & SND_DJM_DEVICE_MASK) >> SND_DJM_DEVICE_SHIFT;
+	u8 group = (private_value & SND_DJM_GROUP_MASK) >> SND_DJM_GROUP_SHIFT;
+	u16 value = (private_value & SND_DJM_VALUE_MASK);
+	return snd_djm_controls_update(list->mixer, device, group, value);
 }
 
-static int snd_pioneer_djm_controls_create(struct usb_mixer_interface *mixer,
+static int snd_djm_controls_create(struct usb_mixer_interface *mixer,
 		const u8 device_idx)
 {
 	int err, i;
 
-	const struct snd_pioneer_djm_device device = snd_pioneer_djm_devices[device_idx];
+	const struct snd_djm_device device = snd_djm_devices[device_idx];
 
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
 
 	u16 value;
 	for (i = 0; i < device.ncontrols; i++) {
 		value = device.controls[i].default_value;
-
 		knew.name = device.controls[i].name;
 		knew.private_value = (
-			(device_idx << SND_PIONEER_DJM_DEVICE_SHIFT) |
-			(i << SND_PIONEER_DJM_GROUP_SHIFT) |
+			(device_idx << SND_DJM_DEVICE_SHIFT) |
+			(i << SND_DJM_GROUP_SHIFT) |
 			value);
-
-		err = snd_pioneer_djm_controls_update(mixer, device_idx, i, value);
+		err = snd_djm_controls_update(mixer, device_idx, i, value);
 		if (err)
 			return err;
-		err = add_single_ctl_with_resume(mixer, 0, snd_pioneer_djm_controls_resume,
+		err = add_single_ctl_with_resume(mixer, 0, snd_djm_controls_resume,
 						 &knew, NULL);
 		if (err)
 			return err;
@@ -3015,10 +3001,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 		err = snd_bbfpro_controls_create(mixer);
 		break;
 	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
-		err = snd_pioneer_djm_controls_create(mixer, 0x00);
+		err = snd_djm_controls_create(mixer, SND_DJM_250MK2_IDX);
 		break;
 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
-		err = snd_pioneer_djm_controls_create(mixer, 0x01);
+		err = snd_djm_controls_create(mixer, SND_DJM_750_IDX);
 		break;
 	}
 
-- 
2.30.0

