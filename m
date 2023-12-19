Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B9818E58
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 18:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D37FCE97;
	Tue, 19 Dec 2023 18:40:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D37FCE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703007653;
	bh=dz8d53A7UMa3K2UhxohEQElLO6LYJfXODNCXXNUKq4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rq5nyr4bNjaw7kM9DYWCOC+oxBnQmjqPB6N3yYQGM0fVQkj6WT6AVhspUotBAUc/7
	 BPu8+QXckrRzzZiCpBbX9lclsZl+9Q9+JoCqgYjdhwzVrrCH3hZ68in6DR6+Cyj9Qr
	 5npn2M74UGtRqcVTWW5qGEux8kVjjCGpkm4qc5Es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B7A2F805D8; Tue, 19 Dec 2023 18:40:10 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A830F805D9;
	Tue, 19 Dec 2023 18:40:10 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C0DD6F805BE; Tue, 19 Dec 2023 18:40:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B9F2F804DA
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 18:39:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B9F2F804DA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=G/3eEbQ+
Received: by m.b4.vu (Postfix, from userid 1000)
	id 50551604B9F7; Wed, 20 Dec 2023 04:09:23 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 50551604B9F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703007563; bh=Wwcw9RjvBs9K31sVeM8U0U+Xy1IA51F7Ah/eptGSN5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G/3eEbQ+yZ3imjDf8F2iRnOtUYpPbT2B/0/463WiEEpnVTl3GereBH1U4xfklNAHr
	 7nLn6XxQEZ0cAZoGIB4bvbHbKof1oHYqFU03rTkvs+hda78fNlyeLDaGl/CBjWX/cr
	 gfSTGBYlS4y3clVICar56hK2kXPkEtG946OSvyRd0cELVvWQpVm+6RXcFlt1LxUX5o
	 J4BQKc6CopqCgNYRGCiaDwQP2lki9tntrv8iFuQ9KZPr2RkTx4bZPtaARF5XBD/1h5
	 cbyT+mR1sSBZgZ36wmWYA7Lb0o73GYopSMXahHYaynnLfqz8MbAPub9AiKij4gzxwT
	 oaKuS3GTpmUsQ==
Date: Wed, 20 Dec 2023 04:09:23 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
Subject: [PATCH 09/11] ALSA: scarlett2: Add skeleton hwdep/ioctl interface
Message-ID: <24ffcd47a8a02ebad3c8b2438104af8f0169164e.1703001053.git.g@b4.vu>
References: <cover.1703001053.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703001053.git.g@b4.vu>
Message-ID-Hash: DXQW266PRLS6HXNPUQILWHLW5N6MHTXP
X-Message-ID-Hash: DXQW266PRLS6HXNPUQILWHLW5N6MHTXP
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DXQW266PRLS6HXNPUQILWHLW5N6MHTXP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add skeleton hwdep/ioctl interface, beginning with
SCARLETT2_IOCTL_PVERSION and SCARLETT2_IOCTL_REBOOT.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS                    |  1 +
 include/uapi/sound/scarlett2.h | 34 +++++++++++++++++
 sound/usb/mixer_scarlett2.c    | 67 +++++++++++++++++++++++++++++++++-
 3 files changed, 101 insertions(+), 1 deletion(-)
 create mode 100644 include/uapi/sound/scarlett2.h

diff --git a/MAINTAINERS b/MAINTAINERS
index ae3f72f57854..80c65096538c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8279,6 +8279,7 @@ S:	Maintained
 W:	https://github.com/geoffreybennett/scarlett-gen2
 B:	https://github.com/geoffreybennett/scarlett-gen2/issues
 T:	git https://github.com/geoffreybennett/scarlett-gen2.git
+F:	include/uapi/sound/scarlett2.h
 F:	sound/usb/mixer_scarlett2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
diff --git a/include/uapi/sound/scarlett2.h b/include/uapi/sound/scarlett2.h
new file mode 100644
index 000000000000..ec0b7da335ff
--- /dev/null
+++ b/include/uapi/sound/scarlett2.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ *   Focusrite Scarlett 2 Protocol Driver for ALSA
+ *   (including Scarlett 2nd Gen, 3rd Gen, Clarett USB, and Clarett+
+ *   series products)
+ *
+ *   Copyright (c) 2023 by Geoffrey D. Bennett <g at b4.vu>
+ */
+#ifndef __UAPI_SOUND_SCARLETT2_H
+#define __UAPI_SOUND_SCARLETT2_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+#define SCARLETT2_HWDEP_MAJOR 1
+#define SCARLETT2_HWDEP_MINOR 0
+#define SCARLETT2_HWDEP_SUBMINOR 0
+
+#define SCARLETT2_HWDEP_VERSION \
+	((SCARLETT2_HWDEP_MAJOR << 16) | \
+	 (SCARLETT2_HWDEP_MINOR << 8) | \
+	  SCARLETT2_HWDEP_SUBMINOR)
+
+#define SCARLETT2_HWDEP_VERSION_MAJOR(v) (((v) >> 16) & 0xFF)
+#define SCARLETT2_HWDEP_VERSION_MINOR(v) (((v) >> 8) & 0xFF)
+#define SCARLETT2_HWDEP_VERSION_SUBMINOR(v) ((v) & 0xFF)
+
+/* Get protocol version */
+#define SCARLETT2_IOCTL_PVERSION _IOR('S', 0x60, int)
+
+/* Reboot */
+#define SCARLETT2_IOCTL_REBOOT _IO('S', 0x61)
+
+#endif /* __UAPI_SOUND_SCARLETT2_H */
diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index 34878f9f9a55..c0c96d7c19fb 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -146,6 +146,9 @@
 
 #include <sound/control.h>
 #include <sound/tlv.h>
+#include <sound/hwdep.h>
+
+#include <uapi/sound/scarlett2.h>
 
 #include "usbaudio.h"
 #include "mixer.h"
@@ -1439,6 +1442,16 @@ static int scarlett2_usb(
 	/* validate the response */
 
 	if (err != resp_buf_size) {
+
+		/* ESHUTDOWN and EPROTO are valid responses to a
+		 * reboot request
+		 */
+		if (cmd == SCARLETT2_USB_REBOOT &&
+		    (err == -ESHUTDOWN || err == -EPROTO)) {
+			err = 0;
+			goto unlock;
+		}
+
 		usb_audio_err(
 			mixer->chip,
 			"%s USB response result cmd %x was %d expected %zu\n",
@@ -4697,6 +4710,49 @@ static int snd_scarlett2_controls_create(
 	return 0;
 }
 
+/*** hwdep interface ***/
+
+/* Reboot the device. */
+static int scarlett2_reboot(struct usb_mixer_interface *mixer)
+{
+	return scarlett2_usb(mixer, SCARLETT2_USB_REBOOT, NULL, 0, NULL, 0);
+}
+
+static int scarlett2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
+				 unsigned int cmd, unsigned long arg)
+{
+	struct usb_mixer_interface *mixer = hw->private_data;
+
+	switch (cmd) {
+
+	case SCARLETT2_IOCTL_PVERSION:
+		return put_user(SCARLETT2_HWDEP_VERSION,
+				(int __user *)arg) ? -EFAULT : 0;
+
+	case SCARLETT2_IOCTL_REBOOT:
+		return scarlett2_reboot(mixer);
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
+static int scarlett2_hwdep_init(struct usb_mixer_interface *mixer)
+{
+	struct snd_hwdep *hw;
+	int err;
+
+	err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
+	if (err < 0)
+		return err;
+
+	hw->private_data = mixer;
+	hw->exclusive = 1;
+	hw->ops.ioctl = scarlett2_hwdep_ioctl;
+
+	return 0;
+}
+
 int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
@@ -4738,11 +4794,20 @@ int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 		USB_ID_PRODUCT(chip->usb_id));
 
 	err = snd_scarlett2_controls_create(mixer, entry);
-	if (err < 0)
+	if (err < 0) {
 		usb_audio_err(mixer->chip,
 			      "Error initialising %s Mixer Driver: %d",
 			      entry->series_name,
 			      err);
+		return err;
+	}
+
+	err = scarlett2_hwdep_init(mixer);
+	if (err < 0)
+		usb_audio_err(mixer->chip,
+			      "Error creating %s hwdep device: %d",
+			      entry->series_name,
+			      err);
 
 	return err;
 }
-- 
2.43.0

