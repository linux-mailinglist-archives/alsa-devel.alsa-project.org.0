Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F344D7D87F8
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Oct 2023 20:02:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2AE0686E;
	Thu, 26 Oct 2023 20:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2AE0686E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698343353;
	bh=HDEpKX/S+wM4Gg0v4TrUmCQAOUsU+ulqs/uHggFvVWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6oLn/E7hutJpLwiWJ2Io2FvyhPqNbkze/ymP+qDSX59bn9VcdQBjrKpfk+7ku0ge
	 bOYF9Bna9tSVfYxxW/h/0zuaELHqeI+hMri2WFY6ihxmr1+APBwXKauAG1Ziif7bqg
	 yUgS91n6xHWIOqJD8o17GA4qhGNb2PaAfqwHR0qI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E5A12F8028D; Thu, 26 Oct 2023 20:01:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A4DB8F8020D;
	Thu, 26 Oct 2023 20:01:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FB14F80557; Thu, 26 Oct 2023 20:01:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E8ED4F80165
	for <alsa-devel@alsa-project.org>; Thu, 26 Oct 2023 20:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8ED4F80165
Received: by m.b4.vu (Postfix, from userid 1000)
	id BDED1604F28E; Fri, 27 Oct 2023 04:31:28 +1030 (ACDT)
Date: Fri, 27 Oct 2023 04:31:28 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ALSA: scarlett2: Rename scarlett_gen2 to scarlett2
Message-ID: <e1ad7f69a1e20cdb39094164504389160c1a0a0b.1698342632.git.g@b4.vu>
References: <cover.1698342632.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698342632.git.g@b4.vu>
Message-ID-Hash: E2GGCBKTBDTQZZH567HDGBXWGMXTZLVU
X-Message-ID-Hash: E2GGCBKTBDTQZZH567HDGBXWGMXTZLVU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/E2GGCBKTBDTQZZH567HDGBXWGMXTZLVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This driver was originally developed for the Focusrite Scarlett Gen 2
series. Since then Focusrite have used a similar protocol for their
Gen 3, Gen 4, Clarett USB, Clarett+, and Vocaster series.

Let's call this common protocol the "Scarlett 2 Protocol" and rename
the driver to scarlett2 to not imply that it is restricted to Gen 2
series devices.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 MAINTAINERS                                          |  2 +-
 sound/usb/Makefile                                   |  2 +-
 sound/usb/mixer_quirks.c                             |  4 ++--
 .../usb/{mixer_scarlett_gen2.c => mixer_scarlett2.c} | 12 +++++++-----
 sound/usb/mixer_scarlett2.h                          |  7 +++++++
 sound/usb/mixer_scarlett_gen2.h                      |  7 -------
 6 files changed, 18 insertions(+), 16 deletions(-)
 rename sound/usb/{mixer_scarlett_gen2.c => mixer_scarlett2.c} (99%)
 create mode 100644 sound/usb/mixer_scarlett2.h
 delete mode 100644 sound/usb/mixer_scarlett_gen2.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4cc6bf79fdd8..ffa2367822fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8066,7 +8066,7 @@ M:	Geoffrey D. Bennett <g@b4.vu>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
-F:	sound/usb/mixer_scarlett_gen2.c
+F:	sound/usb/mixer_scarlett2.c
 
 FORCEDETH GIGABIT ETHERNET DRIVER
 M:	Rain River <rain.1986.08.12@gmail.com>
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index db5ff76d0e61..8c657c2753c8 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -12,7 +12,7 @@ snd-usb-audio-objs := 	card.o \
 			mixer.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
-			mixer_scarlett_gen2.o \
+			mixer_scarlett2.o \
 			mixer_us16x08.o \
 			mixer_s1810c.o \
 			pcm.o \
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index ac521b71cb57..898bc3baca7b 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -33,7 +33,7 @@
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "mixer_scarlett.h"
-#include "mixer_scarlett_gen2.h"
+#include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
 #include "helper.h"
@@ -3426,7 +3426,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x820a): /* Focusrite Clarett+ 2Pre */
 	case USB_ID(0x1235, 0x820b): /* Focusrite Clarett+ 4Pre */
 	case USB_ID(0x1235, 0x820c): /* Focusrite Clarett+ 8Pre */
-		err = snd_scarlett_gen2_init(mixer);
+		err = snd_scarlett2_init(mixer);
 		break;
 
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett2.c
similarity index 99%
rename from sound/usb/mixer_scarlett_gen2.c
rename to sound/usb/mixer_scarlett2.c
index ffd398f26d2c..1a9d62b67323 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- *   Focusrite Scarlett Gen 2/3 and Clarett USB/Clarett+ Driver for ALSA
+ *   Focusrite Scarlett 2 Protocol Driver for ALSA
+ *   (including Scarlett 2nd Gen, 3rd Gen, Clarett USB, and Clarett+
+ *   series products)
  *
  *   Supported models:
  *   - 6i6/18i8/18i20 Gen 2
@@ -149,7 +151,7 @@
 #include "mixer.h"
 #include "helper.h"
 
-#include "mixer_scarlett_gen2.h"
+#include "mixer_scarlett2.h"
 
 /* device_setup value to allow turning MSD mode back on */
 #define SCARLETT2_MSD_ENABLE 0x02
@@ -4174,7 +4176,7 @@ static const struct scarlett2_device_entry *get_scarlett2_device_entry(
 	return entry;
 }
 
-static int snd_scarlett_gen2_controls_create(
+static int snd_scarlett2_controls_create(
 	struct usb_mixer_interface *mixer,
 	const struct scarlett2_device_entry *entry)
 {
@@ -4262,7 +4264,7 @@ static int snd_scarlett_gen2_controls_create(
 	return 0;
 }
 
-int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
+int snd_scarlett2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
 	const struct scarlett2_device_entry *entry;
@@ -4301,7 +4303,7 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 		entry->series_name,
 		USB_ID_PRODUCT(chip->usb_id));
 
-	err = snd_scarlett_gen2_controls_create(mixer, entry);
+	err = snd_scarlett2_controls_create(mixer, entry);
 	if (err < 0)
 		usb_audio_err(mixer->chip,
 			      "Error initialising %s Mixer Driver: %d",
diff --git a/sound/usb/mixer_scarlett2.h b/sound/usb/mixer_scarlett2.h
new file mode 100644
index 000000000000..d209362cf41a
--- /dev/null
+++ b/sound/usb/mixer_scarlett2.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USB_MIXER_SCARLETT2_H
+#define __USB_MIXER_SCARLETT2_H
+
+int snd_scarlett2_init(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_SCARLETT2_H */
diff --git a/sound/usb/mixer_scarlett_gen2.h b/sound/usb/mixer_scarlett_gen2.h
deleted file mode 100644
index 668c6b0cb50a..000000000000
--- a/sound/usb/mixer_scarlett_gen2.h
+++ /dev/null
@@ -1,7 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __USB_MIXER_SCARLETT_GEN2_H
-#define __USB_MIXER_SCARLETT_GEN2_H
-
-int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer);
-
-#endif /* __USB_MIXER_SCARLETT_GEN2_H */
-- 
2.41.0

