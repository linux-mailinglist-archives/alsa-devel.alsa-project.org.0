Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7EB15FC00
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Feb 2020 02:25:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5064F1674;
	Sat, 15 Feb 2020 02:24:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5064F1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581729928;
	bh=ZNnD8tfO/3LpWc9mie7BxduRiLYEAzfp0HOykb+GIvU=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AIEdlROhyepo6Qg1nYK9P7QuyoRxT7Ta0OUW4BoUZee8Be805VRdu9PV/RHX1nVsv
	 W8uvhejmdW7kwSf/zSY8nR2dMxR/Xa/B4vBK+uW6L5OJShDXNN0suuZevwzeit2oF3
	 5XpEb5gGsK8XHk+L3dUgBrXsATOCoSWjZWM/9+g8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E87BF80157;
	Sat, 15 Feb 2020 02:23:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DEA00F8014F; Sat, 15 Feb 2020 02:23:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, PRX_BODY_65, SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC4FDF800F0
 for <alsa-devel@alsa-project.org>; Sat, 15 Feb 2020 02:23:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC4FDF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="lYnAbX3r"
Received: by mail-wr1-x442.google.com with SMTP id m16so12974332wrx.11
 for <alsa-devel@alsa-project.org>; Fri, 14 Feb 2020 17:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=G/MhTiUTvhzmSC2jMnyBcm3WGO3jZiRNY+aa4A8tgpY=;
 b=lYnAbX3rIKzQ3WGs6P4u5RJg9/xpWamrbzKX7eb1Rv1Ihq3kg/YwdHLgjE6VD/nvyJ
 Qyg4Azvc249L0NEYWzDV87q8sF0C7sR/EwoFr2+1vG/hEn10wD3KiHoWWlYQ78gSBKAZ
 SNZO2HAYXLss/PyWVrueXD7xNtef9fE1AwFniyRH6CBpxm3gCc+LZnTZfU+jlUtckb+E
 3TQybyFl2T1Hcx20FfmYaiylMIytNpZhzy6Ec4i3TnDc5Oche7NEvYkGaUDJrruAhsbX
 Mywdnwm5CV1dhdChQpgVljIBQcVAhJrqPJH65fCh9Ul00UzpFqwOANB8fgI0AbICX54c
 CCMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:from:to:cc:subject:date:mime-version
 :content-transfer-encoding;
 bh=G/MhTiUTvhzmSC2jMnyBcm3WGO3jZiRNY+aa4A8tgpY=;
 b=FdA5BAi9Rb50k4PnpOaK0zYjeY387J9zBNvqkjkPNfYZQc4/2yfVEXOkK6QLOFj+/H
 7wZoCyyu8BfSJkkD/WtkJnVCCzGD1d2bZwnY+OtLlixWaxg5NcgfWyH7lFzJfYHiflL9
 lBsv1B9bG3FCvCZpDz7Yyk5c8VjgFK7z4KaIMIKHwn1nLk/dovzznl4uBg74l9j6h3Tk
 Bk4JrVNCeU8ZpH7YOzSPS6glH0dT//XI5pRhxeqVW6Onb3Zk+hC1JqXnCHFTzebEkM70
 N2rXKJ5nfL/lPSExrcEKtRcBHgDtYxop+/vMADcgFbonLGsP8VB6acyBhGKnKjvZLtDc
 bEvw==
X-Gm-Message-State: APjAAAUGF4gJkqP1mPPv2wPjO8oi7Lcum9wIfYq7ivpUKBFg351zbaOC
 pqBpYVSrbRY3tTLYX92pLLVlt9mo
X-Google-Smtp-Source: APXvYqwh9awEvuJ/7HyqIwmuj9zKE8ARSUKMtdWWg8Cbprw1J6q3/pS/fUAhpGt29aqFxsdXtEEUxQ==
X-Received: by 2002:adf:e610:: with SMTP id p16mr7269841wrm.81.1581729818633; 
 Fri, 14 Feb 2020 17:23:38 -0800 (PST)
Received: from localhost.localdomain ([139.91.73.37])
 by smtp.gmail.com with ESMTPSA id 16sm9387736wmi.0.2020.02.14.17.23.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 17:23:38 -0800 (PST)
Message-ID: <5e47481a.1c69fb81.befb3.8dac@mx.google.com>
X-Google-Original-Message-ID: <20200215012335.2707-1---help>
From: mickflemm@gmail.com
X-Google-Original-From: --help
To: alsa-devel@alsa-project.org
Date: Sat, 15 Feb 2020 03:23:35 +0200
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Cc: tiwai@suse.de, Nick Kossifidis <mickflemm@gmail.com>
Subject: [alsa-devel] [PATCH v3] ALSA: usb-audio: Add support for Presonus
	Studio 1810c
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Nick Kossifidis <mickflemm@gmail.com>

This patch adds support for Presonus Studio 1810c, a usb interface
that's UAC2 compliant with a few quirks and a few extra hw-specific
controls. I've tested all 3 altsettings and the added switch
controls and they work as expected.

More infos on the card:
https://www.presonus.com/products/Studio-1810c

Note that this work is based on packet inspection with
usbmon. I just wanted to get this card to work for using
it on our open-source radio station:
https://github.com/UoC-Radio

v2 address issues reported by Takashi:
* Properly get/set enum type controls
* Prevent race condition on switch_get/set
* Various control naming changes
* Various coding style fixes

v3 improve readability of sample rate filtering
and some other minor changes.

Signed-off-by: Nick Kossifidis <mickflemm@gmail.com>
---
 sound/usb/Makefile       |   1 +
 sound/usb/format.c       |  37 +++
 sound/usb/mixer_quirks.c |   5 +
 sound/usb/mixer_s1810c.c | 595 +++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_s1810c.h |   7 +
 sound/usb/quirks.c       |  36 +++
 6 files changed, 681 insertions(+)
 create mode 100644 sound/usb/mixer_s1810c.c
 create mode 100644 sound/usb/mixer_s1810c.h

diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 78edd7d2f..56031026b 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -13,6 +13,7 @@ snd-usb-audio-objs := 	card.o \
 			mixer_scarlett.o \
 			mixer_scarlett_gen2.o \
 			mixer_us16x08.o \
+			mixer_s1810c.o \
 			pcm.o \
 			power.o \
 			proc.o \
diff --git a/sound/usb/format.c b/sound/usb/format.c
index d79db7130..462187953 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -226,6 +226,36 @@ static int parse_audio_format_rates_v1(struct snd_usb_audio *chip, struct audiof
 	return 0;
 }
 
+
+/*
+ * Presonus Studio 1810c supports a limited set of sampling
+ * rates per altsetting but reports the full set each time.
+ * If we don't filter out the unsupported rates and attempt
+ * to configure the card, it will hang refusing to do any
+ * further audio I/O until a hard reset is performed.
+ *
+ * The list of supported rates per altsetting (set of available
+ * I/O channels) is described in the owner's manual, section 2.2.
+ */
+static bool s1810c_valid_sample_rate(struct audioformat *fp,
+				     unsigned int rate)
+{
+	switch (fp->altsetting) {
+	case 1:
+		/* All ADAT ports available */
+		return rate <= 48000;
+	case 2:
+		/* Half of ADAT ports available */
+		return (rate == 88200 || rate == 96000);
+	case 3:
+		/* Analog I/O only (no S/PDIF nor ADAT) */
+		return rate >= 176400;
+	default:
+		return false;
+	}
+	return false;
+}
+
 /*
  * Helper function to walk the array of sample rate triplets reported by
  * the device. The problem is that we need to parse whole array first to
@@ -262,6 +292,12 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 		}
 
 		for (rate = min; rate <= max; rate += res) {
+
+			/* Filter out invalid rates on Presonus Studio 1810c */
+			if (chip->usb_id == USB_ID(0x0194f, 0x010c) &&
+			    !s1810c_valid_sample_rate(fp, rate))
+				goto skip_rate;
+
 			if (fp->rate_table)
 				fp->rate_table[nr_rates] = rate;
 			if (!fp->rate_min || rate < fp->rate_min)
@@ -276,6 +312,7 @@ static int parse_uac2_sample_rate_range(struct snd_usb_audio *chip,
 				break;
 			}
 
+skip_rate:
 			/* avoid endless loop */
 			if (res == 0)
 				break;
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 39e27ae6c..71e705fab 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -34,6 +34,7 @@
 #include "mixer_scarlett.h"
 #include "mixer_scarlett_gen2.h"
 #include "mixer_us16x08.h"
+#include "mixer_s1810c.h"
 #include "helper.h"
 
 struct std_mono_table {
@@ -2277,6 +2278,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x2a39, 0x3fd4): /* RME */
 		err = snd_rme_controls_create(mixer);
 		break;
+
+	case USB_ID(0x0194f, 0x010c): /* Presonus Studio 1810c */
+		err = snd_sc1810_init_mixer(mixer);
+		break;
 	}
 
 	return err;
diff --git a/sound/usb/mixer_s1810c.c b/sound/usb/mixer_s1810c.c
new file mode 100644
index 000000000..8e2a05f80
--- /dev/null
+++ b/sound/usb/mixer_s1810c.c
@@ -0,0 +1,595 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Presonus Studio 1810c driver for ALSA
+ * Copyright (C) 2019 Nick Kossifidis <mickflemm@gmail.com>
+ *
+ * Based on reverse engineering of the communication protocol
+ * between the windows driver / Univeral Control (UC) program
+ * and the device, through usbmon.
+ *
+ * For now this bypasses the mixer, with all channels split,
+ * so that the software can mix with greater flexibility.
+ * It also adds controls for the 4 buttons on the front of
+ * the device.
+ */
+
+#include <linux/usb.h>
+#include <linux/usb/audio-v2.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/control.h>
+
+#include "usbaudio.h"
+#include "mixer.h"
+#include "mixer_quirks.h"
+#include "helper.h"
+#include "mixer_s1810c.h"
+
+#define SC1810C_CMD_REQ	160
+#define SC1810C_CMD_REQTYPE \
+	(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_OUT)
+#define SC1810C_CMD_F1		0x50617269
+#define SC1810C_CMD_F2		0x14
+
+/*
+ * DISCLAIMER: These are just guesses based on the
+ * dumps I got.
+ *
+ * It seems like a selects between
+ * device (0), mixer (0x64) and output (0x65)
+ *
+ * For mixer (0x64):
+ *  * b selects an input channel (see below).
+ *  * c selects an output channel pair (see below).
+ *  * d selects left (0) or right (1) of that pair.
+ *  * e 0-> disconnect, 0x01000000-> connect,
+ *	0x0109-> used for stereo-linking channels,
+ *	e is also used for setting volume levels
+ *	in which case b is also set so I guess
+ *	this way it is possible to set the volume
+ *	level from the specified input to the
+ *	specified output.
+ *
+ * IN Channels:
+ * 0  - 7  Mic/Inst/Line (Analog inputs)
+ * 8  - 9  S/PDIF
+ * 10 - 17 ADAT
+ * 18 - 35 DAW (Inputs from the host)
+ *
+ * OUT Channels (pairs):
+ * 0 -> Main out
+ * 1 -> Line1/2
+ * 2 -> Line3/4
+ * 3 -> S/PDIF
+ * 4 -> ADAT?
+ *
+ * For device (0):
+ *  * b and c are not used, at least not on the
+ *    dumps I got.
+ *  * d sets the control id to be modified
+ *    (see below).
+ *  * e sets the setting for that control.
+ *    (so for the switches I was interested
+ *    in it's 0/1)
+ *
+ * For output (0x65):
+ *   * b is the output channel (see above).
+ *   * c is zero.
+ *   * e I guess the same as with mixer except 0x0109
+ *	 which I didn't see in my dumps.
+ *
+ * The two fixed fields have the same values for
+ * mixer and output but a different set for device.
+ */
+struct s1810c_ctl_packet {
+	u32 a;
+	u32 b;
+	u32 fixed1;
+	u32 fixed2;
+	u32 c;
+	u32 d;
+	u32 e;
+};
+
+#define SC1810C_CTL_LINE_SW	0
+#define SC1810C_CTL_MUTE_SW	1
+#define SC1810C_CTL_AB_SW	3
+#define SC1810C_CTL_48V_SW	4
+
+#define SC1810C_SET_STATE_REQ	161
+#define SC1810C_SET_STATE_REQTYPE SC1810C_CMD_REQTYPE
+#define SC1810C_SET_STATE_F1	0x64656D73
+#define SC1810C_SET_STATE_F2	0xF4
+
+#define SC1810C_GET_STATE_REQ	162
+#define SC1810C_GET_STATE_REQTYPE \
+	(USB_TYPE_VENDOR | USB_RECIP_DEVICE | USB_DIR_IN)
+#define SC1810C_GET_STATE_F1	SC1810C_SET_STATE_F1
+#define SC1810C_GET_STATE_F2	SC1810C_SET_STATE_F2
+
+#define SC1810C_STATE_F1_IDX	2
+#define SC1810C_STATE_F2_IDX	3
+
+/*
+ * This packet includes mixer volumes and
+ * various other fields, it's an extended
+ * version of ctl_packet, with a and b
+ * being zero and different f1/f2.
+ */
+struct s1810c_state_packet {
+	u32 fields[63];
+};
+
+#define SC1810C_STATE_48V_SW	58
+#define SC1810C_STATE_LINE_SW	59
+#define SC1810C_STATE_MUTE_SW	60
+#define SC1810C_STATE_AB_SW	62
+
+struct s1810_mixer_state {
+	uint16_t seqnum;
+	struct mutex usb_mutex;
+	struct mutex data_mutex;
+};
+
+static int
+snd_s1810c_send_ctl_packet(struct usb_device *dev, u32 a,
+			   u32 b, u32 c, u32 d, u32 e)
+{
+	struct s1810c_ctl_packet pkt = { 0 };
+	int ret = 0;
+
+	pkt.fixed1 = SC1810C_CMD_F1;
+	pkt.fixed2 = SC1810C_CMD_F2;
+
+	pkt.a = a;
+	pkt.b = b;
+	pkt.c = c;
+	pkt.d = d;
+	/*
+	 * Value for settings 0/1 for this
+	 * output channel is always 0 (probably because
+	 * there is no ADAT output on 1810c)
+	 */
+	pkt.e = (c == 4) ? 0 : e;
+
+	ret = snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			      SC1810C_CMD_REQ,
+			      SC1810C_CMD_REQTYPE, 0, 0, &pkt, sizeof(pkt));
+	if (ret < 0) {
+		dev_warn(&dev->dev, "could not send ctl packet\n");
+		return ret;
+	}
+	return 0;
+}
+
+/*
+ * When opening Universal Control the program periodicaly
+ * sends and receives state packets for syncinc state between
+ * the device and the host.
+ *
+ * Note that if we send only the request to get data back we'll
+ * get an error, we need to first send an empty state packet and
+ * then ask to receive a filled. Their seqnumbers must also match.
+ */
+static int
+snd_sc1810c_get_status_field(struct usb_device *dev,
+			     u32 *field, int field_idx, uint16_t *seqnum)
+{
+	struct s1810c_state_packet pkt_out = { 0 };
+	struct s1810c_state_packet pkt_in = { 0 };
+	int ret = 0;
+
+	pkt_out.fields[SC1810C_STATE_F1_IDX] = SC1810C_SET_STATE_F1;
+	pkt_out.fields[SC1810C_STATE_F2_IDX] = SC1810C_SET_STATE_F2;
+	ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			      SC1810C_SET_STATE_REQ,
+			      SC1810C_SET_STATE_REQTYPE,
+			      (*seqnum), 0, &pkt_out, sizeof(pkt_out));
+	if (ret < 0) {
+		dev_warn(&dev->dev, "could not send state packet (%d)\n", ret);
+		return ret;
+	}
+
+	ret = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			      SC1810C_GET_STATE_REQ,
+			      SC1810C_GET_STATE_REQTYPE,
+			      (*seqnum), 0, &pkt_in, sizeof(pkt_in));
+	if (ret < 0) {
+		dev_warn(&dev->dev, "could not get state field %u (%d)\n",
+			 field_idx, ret);
+		return ret;
+	}
+
+	(*field) = pkt_in.fields[field_idx];
+	(*seqnum)++;
+	return 0;
+}
+
+/*
+ * This is what I got when bypassing the mixer with
+ * all channels split. I'm not 100% sure of what's going
+ * on, I could probably clean this up based on my observations
+ * but I prefer to keep the same behavior as the windows driver.
+ */
+static int snd_s1810c_init_mixer_maps(struct snd_usb_audio *chip)
+{
+	u32 a, b, c, e, n, off;
+	struct usb_device *dev = chip->dev;
+
+	/* Set initial volume levels ? */
+	a = 0x64;
+	e = 0xbc;
+	for (n = 0; n < 2; n++) {
+		off = n * 18;
+		for (b = off, c = 0; b < 18 + off; b++) {
+			/* This channel to all outputs ? */
+			for (c = 0; c <= 8; c++) {
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+			}
+			/* This channel to main output (again) */
+			snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
+			snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+		}
+		/*
+		 * I noticed on UC that DAW channels have different
+		 * initial volumes, so this makes sense.
+		 */
+		e = 0xb53bf0;
+	}
+
+	/* Connect analog outputs ? */
+	a = 0x65;
+	e = 0x01000000;
+	for (b = 1; b < 3; b++) {
+		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+	}
+	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 0, e);
+	snd_s1810c_send_ctl_packet(dev, a, 0, 0, 1, e);
+
+	/* Set initial volume levels for S/PDIF mappings ? */
+	a = 0x64;
+	e = 0xbc;
+	c = 3;
+	for (n = 0; n < 2; n++) {
+		off = n * 18;
+		for (b = off; b < 18 + off; b++) {
+			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+		}
+		e = 0xb53bf0;
+	}
+
+	/* Connect S/PDIF output ? */
+	a = 0x65;
+	e = 0x01000000;
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+
+	/* Connect all outputs (again) ? */
+	a = 0x65;
+	e = 0x01000000;
+	for (b = 0; b < 4; b++) {
+		snd_s1810c_send_ctl_packet(dev, a, b, 0, 0, e);
+		snd_s1810c_send_ctl_packet(dev, a, b, 0, 1, e);
+	}
+
+	/* Basic routing to get sound out of the device */
+	a = 0x64;
+	e = 0x01000000;
+	for (c = 0; c < 4; c++) {
+		for (b = 0; b < 36; b++) {
+			if ((c == 0 && b == 18) ||	/* DAW1/2 -> Main */
+			    (c == 1 && b == 20) ||	/* DAW3/4 -> Line3/4 */
+			    (c == 2 && b == 22) ||	/* DAW4/5 -> Line5/6 */
+			    (c == 3 && b == 24)) {	/* DAW5/6 -> S/PDIF */
+				/* Left */
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+				b++;
+				/* Right */
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+			} else {
+				/* Leave the rest disconnected */
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 0, 0);
+				snd_s1810c_send_ctl_packet(dev, a, b, c, 1, 0);
+			}
+		}
+	}
+
+	/* Set initial volume levels for S/PDIF (again) ? */
+	a = 0x64;
+	e = 0xbc;
+	c = 3;
+	for (n = 0; n < 2; n++) {
+		off = n * 18;
+		for (b = off; b < 18 + off; b++) {
+			snd_s1810c_send_ctl_packet(dev, a, b, c, 0, e);
+			snd_s1810c_send_ctl_packet(dev, a, b, c, 1, e);
+		}
+		e = 0xb53bf0;
+	}
+
+	/* Connect S/PDIF outputs (again) ? */
+	a = 0x65;
+	e = 0x01000000;
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+
+	/* Again ? */
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 0, e);
+	snd_s1810c_send_ctl_packet(dev, a, 3, 0, 1, e);
+
+	return 0;
+}
+
+/*
+ * Sync state with the device and retrieve the requested field,
+ * whose index is specified in (kctl->private_value & 0xFF),
+ * from the received fields array.
+ */
+static int
+snd_s1810c_get_switch_state(struct usb_mixer_interface *mixer,
+			    struct snd_kcontrol *kctl, u32 *state)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct s1810_mixer_state *private = mixer->private_data;
+	u32 field = 0;
+	u32 ctl_idx = (u32) (kctl->private_value & 0xFF);
+	int ret = 0;
+
+	mutex_lock(&private->usb_mutex);
+	ret = snd_sc1810c_get_status_field(chip->dev, &field,
+					   ctl_idx, &private->seqnum);
+	if (ret < 0)
+		goto unlock;
+
+	*state = field;
+ unlock:
+	mutex_unlock(&private->usb_mutex);
+	return ret ? ret : 0;
+}
+
+/*
+ * Send a control packet to the device for the control id
+ * specified in (kctl->private_value >> 8) with value
+ * specified in (kctl->private_value >> 16).
+ */
+static int
+snd_s1810c_set_switch_state(struct usb_mixer_interface *mixer,
+			    struct snd_kcontrol *kctl)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct s1810_mixer_state *private = mixer->private_data;
+	u32 pval = (u32) kctl->private_value;
+	u32 ctl_id = (pval >> 8) & 0xFF;
+	u32 ctl_val = (pval >> 16) & 0x1;
+	int ret = 0;
+
+	mutex_lock(&private->usb_mutex);
+	ret = snd_s1810c_send_ctl_packet(chip->dev, 0, 0, 0, ctl_id, ctl_val);
+	mutex_unlock(&private->usb_mutex);
+	return ret;
+}
+
+/* Generic get/set/init functions for switch controls */
+
+static int
+snd_s1810c_switch_get(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_value *ctl_elem)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = list->mixer;
+	struct s1810_mixer_state *private = mixer->private_data;
+	u32 pval = (u32) kctl->private_value;
+	u32 ctl_idx = pval & 0xFF;
+	u32 state = 0;
+	int ret = 0;
+
+	mutex_lock(&private->data_mutex);
+	ret = snd_s1810c_get_switch_state(mixer, kctl, &state);
+	if (ret < 0)
+		goto unlock;
+
+	switch (ctl_idx) {
+	case SC1810C_STATE_LINE_SW:
+	case SC1810C_STATE_AB_SW:
+		ctl_elem->value.enumerated.item[0] = (int)state;
+		break;
+	default:
+		ctl_elem->value.integer.value[0] = (long)state;
+	}
+
+ unlock:
+	mutex_unlock(&private->data_mutex);
+	return (ret < 0) ? ret : 0;
+}
+
+static int
+snd_s1810c_switch_set(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_value *ctl_elem)
+{
+	struct usb_mixer_elem_list *list = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = list->mixer;
+	struct s1810_mixer_state *private = mixer->private_data;
+	u32 pval = (u32) kctl->private_value;
+	u32 ctl_idx = pval & 0xFF;
+	u32 curval = 0;
+	u32 newval = 0;
+	int ret = 0;
+
+	mutex_lock(&private->data_mutex);
+	ret = snd_s1810c_get_switch_state(mixer, kctl, &curval);
+	if (ret < 0)
+		goto unlock;
+
+	switch (ctl_idx) {
+	case SC1810C_STATE_LINE_SW:
+	case SC1810C_STATE_AB_SW:
+		newval = (u32) ctl_elem->value.enumerated.item[0];
+		break;
+	default:
+		newval = (u32) ctl_elem->value.integer.value[0];
+	}
+
+	if (curval == newval)
+		goto unlock;
+
+	kctl->private_value &= ~(0x1 << 16);
+	kctl->private_value |= (unsigned int)(newval & 0x1) << 16;
+	ret = snd_s1810c_set_switch_state(mixer, kctl);
+
+ unlock:
+	mutex_unlock(&private->data_mutex);
+	return (ret < 0) ? 0 : 1;
+}
+
+static int
+snd_s1810c_switch_init(struct usb_mixer_interface *mixer,
+		       const struct snd_kcontrol_new *new_kctl)
+{
+	struct snd_kcontrol *kctl;
+	struct usb_mixer_elem_info *elem;
+
+	elem = kzalloc(sizeof(struct usb_mixer_elem_info), GFP_KERNEL);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer = mixer;
+	elem->control = 0;
+	elem->head.id = 0;
+	elem->channels = 1;
+
+	kctl = snd_ctl_new1(new_kctl, elem);
+	if (!kctl) {
+		kfree(elem);
+		return -ENOMEM;
+	}
+	kctl->private_free = snd_usb_mixer_elem_free;
+
+	return snd_usb_mixer_add_control(&elem->head, kctl);
+}
+
+static int
+snd_s1810c_line_sw_info(struct snd_kcontrol *kctl,
+			struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const texts[2] = {
+		"Preamp On (Mic/Inst)",
+		"Preamp Off (Line in)"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
+static const struct snd_kcontrol_new snd_s1810c_line_sw = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Line 1/2 Source Type",
+	.info = snd_s1810c_line_sw_info,
+	.get = snd_s1810c_switch_get,
+	.put = snd_s1810c_switch_set,
+	.private_value = (SC1810C_STATE_LINE_SW | SC1810C_CTL_LINE_SW << 8)
+};
+
+static const struct snd_kcontrol_new snd_s1810c_mute_sw = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Mute Main Out Switch",
+	.info = snd_ctl_boolean_mono_info,
+	.get = snd_s1810c_switch_get,
+	.put = snd_s1810c_switch_set,
+	.private_value = (SC1810C_STATE_MUTE_SW | SC1810C_CTL_MUTE_SW << 8)
+};
+
+static const struct snd_kcontrol_new snd_s1810c_48v_sw = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "48V Phantom Power On Mic Inputs Switch",
+	.info = snd_ctl_boolean_mono_info,
+	.get = snd_s1810c_switch_get,
+	.put = snd_s1810c_switch_set,
+	.private_value = (SC1810C_STATE_48V_SW | SC1810C_CTL_48V_SW << 8)
+};
+
+static int
+snd_s1810c_ab_sw_info(struct snd_kcontrol *kctl,
+		      struct snd_ctl_elem_info *uinfo)
+{
+	static const char *const texts[2] = {
+		"1/2",
+		"3/4"
+	};
+
+	return snd_ctl_enum_info(uinfo, 1, ARRAY_SIZE(texts), texts);
+}
+
+static const struct snd_kcontrol_new snd_s1810c_ab_sw = {
+	.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+	.name = "Headphone 1 Source Route",
+	.info = snd_s1810c_ab_sw_info,
+	.get = snd_s1810c_switch_get,
+	.put = snd_s1810c_switch_set,
+	.private_value = (SC1810C_STATE_AB_SW | SC1810C_CTL_AB_SW << 8)
+};
+
+static void snd_sc1810_mixer_state_free(struct usb_mixer_interface *mixer)
+{
+	struct s1810_mixer_state *private = mixer->private_data;
+	kfree(private);
+	mixer->private_data = NULL;
+}
+
+/* Entry point, called from mixer_quirks.c */
+int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer)
+{
+	struct s1810_mixer_state *private = NULL;
+	struct snd_usb_audio *chip = mixer->chip;
+	struct usb_device *dev = chip->dev;
+	int ret = 0;
+
+	/* Run this only once */
+	if (!list_empty(&chip->mixer_list))
+		return 0;
+
+	dev_info(&dev->dev,
+		 "Presonus Studio 1810c, device_setup: %u\n", chip->setup);
+	if (chip->setup == 1)
+		dev_info(&dev->dev, "(8out/18in @ 48KHz)\n");
+	else if (chip->setup == 2)
+		dev_info(&dev->dev, "(6out/8in @ 192KHz)\n");
+	else
+		dev_info(&dev->dev, "(8out/14in @ 96KHz)\n");
+
+	ret = snd_s1810c_init_mixer_maps(chip);
+	if (ret < 0)
+		return ret;
+
+	private = kzalloc(sizeof(struct s1810_mixer_state), GFP_KERNEL);
+	if (!private)
+		return -ENOMEM;
+
+	mutex_init(&private->usb_mutex);
+	mutex_init(&private->data_mutex);
+
+	mixer->private_data = private;
+	mixer->private_free = snd_sc1810_mixer_state_free;
+
+	private->seqnum = 1;
+
+	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_line_sw);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_mute_sw);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_48v_sw);
+	if (ret < 0)
+		return ret;
+
+	ret = snd_s1810c_switch_init(mixer, &snd_s1810c_ab_sw);
+	if (ret < 0)
+		return ret;
+	return ret;
+}
diff --git a/sound/usb/mixer_s1810c.h b/sound/usb/mixer_s1810c.h
new file mode 100644
index 000000000..a79a3743c
--- /dev/null
+++ b/sound/usb/mixer_s1810c.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Presonus Studio 1810c driver for ALSA
+ * Copyright (C) 2019 Nick Kossifidis <mickflemm@gmail.com>
+ */
+
+int snd_sc1810_init_mixer(struct usb_mixer_interface *mixer);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index a81c20664..9bbdea882 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1227,6 +1227,38 @@ static int fasttrackpro_skip_setting_quirk(struct snd_usb_audio *chip,
 	return 0; /* keep this altsetting */
 }
 
+static int s1810c_skip_setting_quirk(struct snd_usb_audio *chip,
+					   int iface, int altno)
+{
+	/*
+	 * Altno settings:
+	 *
+	 * Playback (Interface 1):
+	 * 1: 6 Analog + 2 S/PDIF
+	 * 2: 6 Analog + 2 S/PDIF
+	 * 3: 6 Analog
+	 *
+	 * Capture (Interface 2):
+	 * 1: 8 Analog + 2 S/PDIF + 8 ADAT
+	 * 2: 8 Analog + 2 S/PDIF + 4 ADAT
+	 * 3: 8 Analog
+	 */
+
+	/*
+	 * I'll leave 2 as the default one and
+	 * use device_setup to switch to the
+	 * other two.
+	 */
+	if ((chip->setup == 0 || chip->setup > 2) && altno != 2)
+		return 1;
+	else if (chip->setup == 1 && altno != 1)
+		return 1;
+	else if (chip->setup == 2 && altno != 3)
+		return 1;
+
+	return 0;
+}
+
 int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 				  int iface,
 				  int altno)
@@ -1240,6 +1272,10 @@ int snd_usb_apply_interface_quirk(struct snd_usb_audio *chip,
 	/* fasttrackpro usb: skip altsets incompatible with device_setup */
 	if (chip->usb_id == USB_ID(0x0763, 0x2012))
 		return fasttrackpro_skip_setting_quirk(chip, iface, altno);
+	/* presonus studio 1810c: skip altsets incompatible with device_setup */
+	if (chip->usb_id == USB_ID(0x0194f, 0x010c))
+		return s1810c_skip_setting_quirk(chip, iface, altno);
+
 
 	return 0;
 }
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
