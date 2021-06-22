Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 910BE3AFDDD
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Jun 2021 09:26:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110621696;
	Tue, 22 Jun 2021 09:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110621696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624346791;
	bh=PDCzCAjWk5wsXgyODSBjtabOnFKZGhXbpdja0hQvlEo=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=cZPQO3uwIDGgVgmo9ujaoyj4MthnNdoArqTeMO0atHCfhZIHPIQgUZtOoNiRcvGlq
	 j4vGtZaUJMKEFhh1KgoKNCs4JA1838M9MRYACBnxTN4W1drDgpSHiGif/br9S5Buhi
	 +tPNVnnQ3KXCZevSMcsf4oy/YauMAr+F6ItxLo7Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5944F80271;
	Tue, 22 Jun 2021 09:25:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDC9DF80424; Tue, 22 Jun 2021 09:25:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E80BF8026A
 for <alsa-devel@alsa-project.org>; Tue, 22 Jun 2021 09:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E80BF8026A
Received: by m.b4.vu (Postfix, from userid 1000)
 id AA80661E2869; Tue, 22 Jun 2021 16:55:14 +0930 (ACST)
Date: Tue, 22 Jun 2021 16:55:14 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 16/31] ALSA: usb-audio: scarlett2: Add Gen 3 mixer support
Message-ID: <20210622072514.GA13651@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b00f3a5-fe31-0ad5-c723-d354dc724e58@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

Add mixer support for the Focusrite Scarlett 4i4, 8i6, 18i8, and 18i20
Gen 3 devices.

Change mixer.c MAX_ID_ELEMS from 256 to 512 as there are now more than
256 controls needed by the 18i20 Gen 3. The majority of these are the
gain controls for the mixer matrix which has 25 inputs and 12 outputs,
so 300 controls.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer.c               |   2 +-
 sound/usb/mixer_quirks.c        |   4 +
 sound/usb/mixer_scarlett_gen2.c | 260 +++++++++++++++++++++++++++++---
 3 files changed, 246 insertions(+), 20 deletions(-)

diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
index 428d581f988f..ba4aa1eacb04 100644
--- a/sound/usb/mixer.c
+++ b/sound/usb/mixer.c
@@ -50,7 +50,7 @@
 #include "mixer_quirks.h"
 #include "power.h"
 
-#define MAX_ID_ELEMS	256
+#define MAX_ID_ELEMS	512
 
 struct usb_audio_term {
 	int id;
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 37ad77524c0b..df7492594e91 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3060,6 +3060,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8203): /* Focusrite Scarlett 6i6 2nd Gen */
 	case USB_ID(0x1235, 0x8204): /* Focusrite Scarlett 18i8 2nd Gen */
 	case USB_ID(0x1235, 0x8201): /* Focusrite Scarlett 18i20 2nd Gen */
+	case USB_ID(0x1235, 0x8212): /* Focusrite Scarlett 4i4 3rd Gen */
+	case USB_ID(0x1235, 0x8213): /* Focusrite Scarlett 8i6 3rd Gen */
+	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
+	case USB_ID(0x1235, 0x8215): /* Focusrite Scarlett 18i20 3rd Gen */
 		err = snd_scarlett_gen2_init(mixer);
 		break;
 
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index dde008ea21d7..c4bcccb5aecd 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -1,8 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *   Focusrite Scarlett 6i6/18i8/18i20 Gen 2 Driver for ALSA
+ *   Focusrite Scarlett Gen 2/3 Driver for ALSA
  *
- *   Copyright (c) 2018-2019 by Geoffrey D. Bennett <g at b4.vu>
+ *   Supported models:
+ *   - 6i6/18i8/18i20 Gen 2
+ *   - 4i4/8i6/18i8/18i20 Gen 3
+ *
+ *   Copyright (c) 2018-2021 by Geoffrey D. Bennett <g at b4.vu>
  *
  *   Based on the Scarlett (Gen 1) Driver for ALSA:
  *
@@ -19,10 +23,6 @@
  *   David Henningsson <david.henningsson at canonical.com>
  */
 
-/* Mixer Interface for the Focusrite Scarlett 6i6/18i8/18i20 Gen 2 audio
- * interface. Based on the Gen 1 driver and rewritten.
- */
-
 /* The protocol was reverse engineered by looking at the communication
  * between Focusrite Control 2.3.4 and the Focusrite(R) Scarlett 18i20
  * (firmware 1083) using usbmon in July-August 2018.
@@ -32,13 +32,21 @@
  * Scarlett 6i6 support added in June 2019 (thanks to Martin Wittmann
  * for providing usbmon output and testing).
  *
+ * Scarlett 4i4/8i6 Gen 3 support added in May 2020 (thanks to Laurent
+ * Debricon for donating a 4i4 and to Fredrik Unger for providing 8i6
+ * usbmon output and testing).
+ *
+ * Scarlett 18i8/18i20 Gen 3 support added in June 2020 (thanks to
+ * Darren Jaeckel, Alex Sedlack, and Clovis Lunel for providing usbmon
+ * output, protocol traces and testing).
+ *
  * Support for loading mixer volume and mux configuration from the
  * interface during driver initialisation added in May 2021 (thanks to
  * Vladimir Sadovnikov for figuring out how).
  *
  * This ALSA mixer gives access to:
  *  - input, output, mixer-matrix muxes
- *  - 18x10 mixer-matrix gain stages
+ *  - mixer-matrix gain stages
  *  - gain/volume/mute controls
  *  - level meters
  *  - line/inst level and pad controls
@@ -148,21 +156,21 @@ static const u16 scarlett2_mixer_values[SCARLETT2_MIXER_VALUE_COUNT] = {
 
 /* Maximum number of level and pad switches */
 #define SCARLETT2_LEVEL_SWITCH_MAX 2
-#define SCARLETT2_PAD_SWITCH_MAX 4
+#define SCARLETT2_PAD_SWITCH_MAX 8
 
 /* Maximum number of inputs to the mixer */
-#define SCARLETT2_INPUT_MIX_MAX 18
+#define SCARLETT2_INPUT_MIX_MAX 25
 
 /* Maximum number of outputs from the mixer */
-#define SCARLETT2_OUTPUT_MIX_MAX 10
+#define SCARLETT2_OUTPUT_MIX_MAX 12
 
 /* Maximum size of the data in the USB mux assignment message:
- * 18 inputs, 20 outputs, 18 matrix inputs, 8 spare
+ * 20 inputs, 20 outputs, 25 matrix inputs, 12 spare
  */
-#define SCARLETT2_MUX_MAX 64
+#define SCARLETT2_MUX_MAX 77
 
 /* Maximum number of meters (sum of output port counts) */
-#define SCARLETT2_MAX_METERS 56
+#define SCARLETT2_MAX_METERS 65
 
 /* Hardware port types:
  * - None (no input to mux)
@@ -256,7 +264,7 @@ static const struct scarlett2_port scarlett2_ports[SCARLETT2_PORT_TYPE_COUNT] =
 #define SCARLETT2_MUX_TABLES 3
 
 /* Maximum number of entries in a mux table */
-#define SCARLETT2_MAX_MUX_ENTRIES 7
+#define SCARLETT2_MAX_MUX_ENTRIES 10
 
 /* One entry within mux_assignment defines the port type and range of
  * ports to add to the set_mux message. The end of the list is marked
@@ -475,12 +483,226 @@ static const struct scarlett2_device_info s18i20_gen2_info = {
 	} },
 };
 
+static const struct scarlett2_device_info s4i4_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8212),
+
+	.level_input_count = 2,
+	.pad_input_count = 2,
+
+	.line_out_descrs = {
+		"Monitor L",
+		"Monitor R",
+		"Headphones L",
+		"Headphones R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = { 1, 0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = { 4, 4 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 6, 8 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 4, 6 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 16 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 16 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  6 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 16 },
+		{ 0,                            0,  0 },
+	} },
+};
+
+static const struct scarlett2_device_info s8i6_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8213),
+
+	.level_input_count = 2,
+	.pad_input_count = 2,
+
+	.line_out_descrs = {
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = { 1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = { 6,  4 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = { 2,  2 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 8,  8 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 6, 10 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,      8,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 18 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,      8,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 18 },
+		{ 0,                            0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE, 0,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,    0,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,      8,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_NONE,     0, 18 },
+		{ 0,                            0,  0 },
+	} },
+};
+
+static const struct scarlett2_device_info s18i8_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8214),
+
+	.line_out_hw_vol = 1,
+	.level_input_count = 2,
+	.pad_input_count = 2,
+
+	.line_out_descrs = {
+		"Monitor L",
+		"Monitor R",
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
+		"Alt Monitor L",
+		"Alt Monitor R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  8,  8 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  0 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 10, 20 },
+		[SCARLETT2_PORT_TYPE_PCM]      = {  8, 20 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_PCM,      12,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  6,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  2,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,      10,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 20 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 10 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_PCM,      12,  4 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  6,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  2,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_PCM,      10,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 20 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 10 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  6,  2 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  2,  4 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 20 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 10 },
+		{ 0,                             0,  0 },
+	} },
+};
+
+static const struct scarlett2_device_info s18i20_gen3_info = {
+	.usb_id = USB_ID(0x1235, 0x8215),
+
+	.line_out_hw_vol = 1,
+	.level_input_count = 2,
+	.pad_input_count = 8,
+
+	.line_out_descrs = {
+		"Monitor 1 L",
+		"Monitor 1 R",
+		"Monitor 2 L",
+		"Monitor 2 R",
+		NULL,
+		NULL,
+		"Headphones 1 L",
+		"Headphones 1 R",
+		"Headphones 2 L",
+		"Headphones 2 R",
+	},
+
+	.port_count = {
+		[SCARLETT2_PORT_TYPE_NONE]     = {  1,  0 },
+		[SCARLETT2_PORT_TYPE_ANALOGUE] = {  9, 10 },
+		[SCARLETT2_PORT_TYPE_SPDIF]    = {  2,  2 },
+		[SCARLETT2_PORT_TYPE_ADAT]     = {  8,  8 },
+		[SCARLETT2_PORT_TYPE_MIX]      = { 12, 25 },
+		[SCARLETT2_PORT_TYPE_PCM]      = { 20, 20 },
+	},
+
+	.mux_assignment = { {
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  8 },
+		{ SCARLETT2_PORT_TYPE_PCM,      10, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_PCM,       8,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 25 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 12 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,       0,  8 },
+		{ SCARLETT2_PORT_TYPE_PCM,      10,  8 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_ADAT,      0,  8 },
+		{ SCARLETT2_PORT_TYPE_PCM,       8,  2 },
+		{ SCARLETT2_PORT_TYPE_MIX,       0, 25 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 10 },
+		{ 0,                             0,  0 },
+	}, {
+		{ SCARLETT2_PORT_TYPE_PCM,       0, 10 },
+		{ SCARLETT2_PORT_TYPE_ANALOGUE,  0, 10 },
+		{ SCARLETT2_PORT_TYPE_SPDIF,     0,  2 },
+		{ SCARLETT2_PORT_TYPE_NONE,      0, 24 },
+		{ 0,                             0,  0 },
+	} },
+};
+
 static const struct scarlett2_device_info *scarlett2_devices[] = {
 	/* Supported Gen 2 devices */
 	&s6i6_gen2_info,
 	&s18i8_gen2_info,
 	&s18i20_gen2_info,
 
+	/* Supported Gen 3 devices */
+	&s4i4_gen3_info,
+	&s8i6_gen3_info,
+	&s18i8_gen3_info,
+	&s18i20_gen3_info,
+
 	/* End of list */
 	NULL
 };
@@ -674,7 +896,7 @@ static int scarlett2_usb(
 	if (err != req_buf_size) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2 USB request result cmd %x was %d\n",
+			"Scarlett Gen 2/3 USB request result cmd %x was %d\n",
 			cmd, err);
 		err = -EINVAL;
 		goto unlock;
@@ -691,7 +913,7 @@ static int scarlett2_usb(
 	if (err != resp_buf_size) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2 USB response result cmd %x was %d "
+			"Scarlett Gen 2/3 USB response result cmd %x was %d "
 			"expected %d\n",
 			cmd, err, resp_buf_size);
 		err = -EINVAL;
@@ -709,7 +931,7 @@ static int scarlett2_usb(
 	    resp->pad) {
 		usb_audio_err(
 			mixer->chip,
-			"Scarlett Gen 2 USB invalid response; "
+			"Scarlett Gen 2/3 USB invalid response; "
 			   "cmd tx/rx %d/%d seq %d/%d size %d/%d "
 			   "error %d pad %d\n",
 			le32_to_cpu(req->cmd), le32_to_cpu(resp->cmd),
@@ -2485,7 +2707,7 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 
 	if (!(chip->setup & SCARLETT2_ENABLE)) {
 		usb_audio_info(chip,
-			"Focusrite Scarlett Gen 2 Mixer Driver disabled; "
+			"Focusrite Scarlett Gen 2/3 Mixer Driver disabled; "
 			"use options snd_usb_audio vid=0x%04x pid=0x%04x "
 			"device_setup=1 to enable and report any issues "
 			"to g@b4.vu",
@@ -2495,7 +2717,7 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 	}
 
 	usb_audio_info(chip,
-		"Focusrite Scarlett Gen 2 Mixer Driver enabled pid=0x%04x",
+		"Focusrite Scarlett Gen 2/3 Mixer Driver enabled pid=0x%04x",
 		USB_ID_PRODUCT(chip->usb_id));
 
 	err = snd_scarlett_gen2_controls_create(mixer);
-- 
2.31.1

