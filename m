Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0007C94CF
	for <lists+alsa-devel@lfdr.de>; Sat, 14 Oct 2023 15:59:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84E49D8;
	Sat, 14 Oct 2023 15:58:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84E49D8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697291982;
	bh=h/KdBlbWEatr0f6JBl9UDUHW6Zjc80J0VIxwy6ZaqBk=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=bpa/9jSXQoQG8F6GtXkhDSizoSEXreDlsOryP60S/LuWyko6CUGgn/d5MEBu6qhVj
	 2RdW7pNfYuO+fWGw961+/9g3sh+NpuvpXsyCgx7n9IZQRJawc0Bqw6H/NJOWmfSvjU
	 vzfAC61d5CMM3XwxcsKhvdZpOBeI1tMLcb5FebLA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1092F80558; Sat, 14 Oct 2023 15:58:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A726FF802BE;
	Sat, 14 Oct 2023 15:58:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 667A7F802BE; Sat, 14 Oct 2023 15:58:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 32FEDF80130
	for <alsa-devel@alsa-project.org>; Sat, 14 Oct 2023 15:58:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32FEDF80130
Received: by m.b4.vu (Postfix, from userid 1000)
	id 490B9600146A; Sun, 15 Oct 2023 00:28:28 +1030 (ACDT)
Date: Sun, 15 Oct 2023 00:28:28 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH RFC] ALSA: scarlett2: Add ioctls for user-space access
Message-ID: <ZSqehHhedJQY9h/1@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: UAS4LO6K4R5KPNOFHUOXFRLSF7LATNDT
X-Message-ID-Hash: UAS4LO6K4R5KPNOFHUOXFRLSF7LATNDT
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UAS4LO6K4R5KPNOFHUOXFRLSF7LATNDT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to support functions such as firmware upgrade from
user-space, add ioctls for submitting arbitrary proprietary requests
through scarlett2_usb() and requesting/releasing exclusive access.
---

Hi Takashi,

I recently figured how to update the firmware on Scarlett Gen 2+
devices. I think the best way to implement this is with an ioctl
giving access to the scarlett2_usb() function from user-space, plus
two ioctls to request/release exclusive access.

Does something like this seem reasonable?

What ioctl magic/command values should I use?

Should lock/unlock be separate, or one ioctl takes an argument for
which operation to do?

Thanks,
Geoffrey.

 MAINTAINERS                        |  1 +
 include/uapi/sound/scarlett_gen2.h | 28 +++++++++
 sound/usb/mixer_scarlett_gen2.c    | 94 +++++++++++++++++++++++++++++-
 3 files changed, 121 insertions(+), 2 deletions(-)
 create mode 100644 include/uapi/sound/scarlett_gen2.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc6bf79fdd8..25e5e40f7118 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8066,6 +8066,7 @@ M:	Geoffrey D. Bennett <g@b4.vu>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
+F:	include/uapi/sound/scarlett_gen2.h
 F:	sound/usb/mixer_scarlett_gen2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
diff --git a/include/uapi/sound/scarlett_gen2.h b/include/uapi/sound/scarlett_gen2.h
new file mode 100644
index 000000000000..0b51a9754ba2
--- /dev/null
+++ b/include/uapi/sound/scarlett_gen2.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+/*
+ *   Focusrite Scarlett Gen 2/3 and Clarett USB/Clarett+ Driver for ALSA
+ *
+ *   Copyright (c) 2023 by Geoffrey D. Bennett <g at b4.vu>
+ */
+#ifndef __UAPI_SOUND_SCARLETT_GEN2_H
+#define __UAPI_SOUND_SCARLETT_GEN2_H
+
+#include <linux/types.h>
+#include <linux/ioctl.h>
+
+/* Send a proprietary format request to the interface */
+struct snd_scarlett_gen2_usb_cmd {
+	u32   cmd;
+	void *req_data;
+	u16   req_size;
+	void *resp_data;
+	u16   resp_size;
+};
+
+#define SCARLETT2_IOCTL_USB_CMD _IOWR('S', 0x60, struct snd_scarlett_gen2_usb_cmd)
+
+/* Request/release exclusive access */
+#define SCARLETT2_IOCTL_LOCK _IO('S', 0x61)
+#define SCARLETT2_IOCTL_UNLOCK _IO('S', 0x62)
+
+#endif /* __UAPI_SOUND_SCARLETT_GEN2_H */
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index ffd398f26d2c..f1ef87b54813 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -144,6 +144,9 @@
 
 #include <sound/control.h>
 #include <sound/tlv.h>
+#include <sound/hwdep.h>
+
+#include <uapi/sound/scarlett_gen2.h>
 
 #include "usbaudio.h"
 #include "mixer.h"
@@ -4262,10 +4265,84 @@ static int snd_scarlett_gen2_controls_create(
 	return 0;
 }
 
+static int scarlett_gen2_ioctl_usb_cmd(struct snd_hwdep *hw, unsigned long arg)
+{
+	struct scarlett2_data *private = hw->private_data;
+	struct snd_scarlett_gen2_usb_cmd usb_cmd;
+	int err;
+	void *req_data = NULL;
+	void *resp_data = NULL;
+
+	// get cmd & req/resp buffers
+	if (copy_from_user(&usb_cmd, (void __user *)arg, sizeof(usb_cmd)))
+		return -EFAULT;
+
+	// allocate request buffer, copy data from user
+	if (usb_cmd.req_size > 0) {
+		req_data = kmalloc(usb_cmd.req_size, GFP_KERNEL);
+		if (!req_data) {
+			err = -ENOMEM;
+			goto exit;
+		}
+		if (copy_from_user(req_data, usb_cmd.req_data,
+				   usb_cmd.req_size)) {
+			err = -EFAULT;
+			goto exit;
+		}
+	}
+
+	// allocate response buffer
+	if (usb_cmd.resp_size > 0) {
+		resp_data = kmalloc(usb_cmd.resp_size, GFP_KERNEL);
+		if (!resp_data) {
+			err = -ENOMEM;
+			goto exit;
+		}
+	}
+
+	// send request, get response
+	err = scarlett2_usb(private->mixer, usb_cmd.cmd,
+			    req_data, usb_cmd.req_size,
+			    resp_data, usb_cmd.resp_size);
+	if (err < 0)
+		goto exit;
+
+	// copy response to user
+	if (usb_cmd.resp_size > 0)
+		if (copy_to_user(usb_cmd.resp_data, resp_data,
+				 usb_cmd.resp_size))
+			err = -EFAULT;
+
+exit:
+	kfree(req_data);
+	kfree(resp_data);
+
+	return err;
+}
+
+static int scarlett_gen2_hwdep_ioctl(struct snd_hwdep *hw, struct file *file,
+				     unsigned int cmd, unsigned long arg)
+{
+	switch (cmd) {
+
+	case SCARLETT2_IOCTL_USB_CMD:
+		return scarlett_gen2_ioctl_usb_cmd(hw, arg);
+
+	// TODO
+	case SCARLETT2_IOCTL_LOCK:
+	case SCARLETT2_IOCTL_UNLOCK:
+		return -EINVAL;
+
+	default:
+		return -ENOIOCTLCMD;
+	}
+}
+
 int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
 	const struct scarlett2_device_entry *entry;
+	struct snd_hwdep *hw;
 	int err;
 
 	/* only use UAC_VERSION_2 */
@@ -4302,11 +4379,24 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 		USB_ID_PRODUCT(chip->usb_id));
 
 	err = snd_scarlett_gen2_controls_create(mixer, entry);
-	if (err < 0)
+	if (err < 0) {
 		usb_audio_err(mixer->chip,
 			      "Error initialising %s Mixer Driver: %d",
 			      entry->series_name,
 			      err);
+		return err;
+	}
+
+	err = snd_hwdep_new(mixer->chip->card, "Focusrite Control", 0, &hw);
+	if (err < 0) {
+		usb_audio_err(mixer->chip,
+			      "Error creating hwdep device: %d",
+			      err);
+		return err;
+	}
 
-	return err;
+	hw->private_data = mixer->private_data;
+	hw->ops.ioctl = scarlett_gen2_hwdep_ioctl;
+
+	return 0;
 }
-- 
2.41.0

