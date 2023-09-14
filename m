Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E88F7A0BD1
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 19:33:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9ACAE8;
	Thu, 14 Sep 2023 19:32:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9ACAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694712820;
	bh=tp+h0m6AkwPa2Kfy6HlvhPcZxNXk9buNjQ6JXddMgkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jyWokUKiWkrBX6u832mSdIXIMyv6PsoE+9oiScarICv2qY5V4LwJYAIcyKiDApmHX
	 v/oTFsEw2KCW3PptuYz0VZYEK6FuK+nN0FN8zykz7ohSiUx2UbueOxQETYKPXHOioL
	 ECfOCj9TutdXBU3Q3pHMRoSx2T9K8YkKP4nKPqF0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B6A8F8056F; Thu, 14 Sep 2023 19:32:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D965BF8055A;
	Thu, 14 Sep 2023 19:32:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8C20F8055B; Thu, 14 Sep 2023 19:32:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3B805F80552
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 19:32:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3B805F80552
Received: by m.b4.vu (Postfix, from userid 1000)
	id DAFB2604F2A7; Fri, 15 Sep 2023 03:01:57 +0930 (ACST)
Date: Fri, 15 Sep 2023 03:01:57 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, Philippe Perrot <philippe@perrot-net.fr>
Subject: [PATCH 1/4] ALSA: scarlett2: Default mixer driver to enabled
Message-ID: <89600a35b40307f2766578ad1ca2f21801286b58.1694705811.git.g@b4.vu>
References: <cover.1694705811.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1694705811.git.g@b4.vu>
Message-ID-Hash: ZEIDMJ7IOBTWDBEHQF2MZ5BG26OVMPYP
X-Message-ID-Hash: ZEIDMJ7IOBTWDBEHQF2MZ5BG26OVMPYP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZEIDMJ7IOBTWDBEHQF2MZ5BG26OVMPYP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Early versions of this mixer driver did not work on all hardware, so
out of caution the driver was disabled by default and had to be
explicitly enabled with device_setup=1.

Since commit 764fa6e686e0 ("ALSA: usb-audio: scarlett2: Fix device
hang with ehci-pci") no more problems of this nature have been
reported. Therefore, enable the driver by default but provide a new
device_setup option to disable the driver in case that is needed.

- device_setup value of 0 now means "enable" rather than "disable".
- device_setup value of 1 is now ignored.
- device_setup value of 4 now means "disable".

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 9d11bb08667e..ecd148ba6908 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -141,12 +141,12 @@
 
 #include "mixer_scarlett_gen2.h"
 
-/* device_setup value to enable */
-#define SCARLETT2_ENABLE 0x01
-
 /* device_setup value to allow turning MSD mode back on */
 #define SCARLETT2_MSD_ENABLE 0x02
 
+/* device_setup value to disable this mixer driver */
+#define SCARLETT2_DISABLE 0x04
+
 /* some gui mixers can't handle negative ctl values */
 #define SCARLETT2_VOLUME_BIAS 127
 
@@ -4172,19 +4172,20 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 	if (!mixer->protocol)
 		return 0;
 
-	if (!(chip->setup & SCARLETT2_ENABLE)) {
+	if (chip->setup & SCARLETT2_DISABLE) {
 		usb_audio_info(chip,
-			"Focusrite Scarlett Gen 2/3 Mixer Driver disabled; "
-			"use options snd_usb_audio vid=0x%04x pid=0x%04x "
-			"device_setup=1 to enable and report any issues "
-			"to g@b4.vu",
+			"Focusrite Scarlett Gen 2/3 Mixer Driver disabled "
+			"by modprobe options (snd_usb_audio "
+			"vid=0x%04x pid=0x%04x device_setup=%d)\n",
 			USB_ID_VENDOR(chip->usb_id),
-			USB_ID_PRODUCT(chip->usb_id));
+			USB_ID_PRODUCT(chip->usb_id),
+			SCARLETT2_DISABLE);
 		return 0;
 	}
 
 	usb_audio_info(chip,
-		"Focusrite Scarlett Gen 2/3 Mixer Driver enabled pid=0x%04x",
+		"Focusrite Scarlett Gen 2/3 Mixer Driver enabled (pid=0x%04x); "
+		"report any issues to g@b4.vu",
 		USB_ID_PRODUCT(chip->usb_id));
 
 	err = snd_scarlett_gen2_controls_create(mixer);
-- 
2.41.0

