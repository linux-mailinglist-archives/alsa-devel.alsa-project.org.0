Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A287E7BC726
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Oct 2023 13:34:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61CC4828;
	Sat,  7 Oct 2023 13:33:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61CC4828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696678471;
	bh=xSyYfMLiQ7KL55p+55h14kqrQJiUg1Oxy3XjQ8olF3s=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ZuvTfsN9+y4FB26ZoyDQBzXAAWk5HagAwa/L/v4JFVy7INJCUoIjt7bpRS4iGf9ny
	 6BfWsKN4P/qoBHEvZr81iUSYFymvrLG6x5CiZ0A7tyhN0ax/7h8l4MI//DbtX0keEl
	 /X7YpJsy0PJ8My6Q0Giz7UXC2TbTdXaXgHrM2Vhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3A10EF80310; Sat,  7 Oct 2023 13:33:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9291FF80310;
	Sat,  7 Oct 2023 13:33:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 83FD3F8047D; Sat,  7 Oct 2023 13:33:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 36E77F801EB
	for <alsa-devel@alsa-project.org>; Sat,  7 Oct 2023 13:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36E77F801EB
Received: by m.b4.vu (Postfix, from userid 1000)
	id 83518604F298; Sat,  7 Oct 2023 22:03:04 +1030 (ACDT)
Date: Sat, 7 Oct 2023 22:03:04 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: scarlett2: Add Focusrite Clarett 2Pre and 4Pre USB
 support
Message-ID: <ZSFB8EVTG1PK1eq/@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: EZ2U7KXSV7QFSSAHFHA2BWEEGLZ2I44P
X-Message-ID-Hash: EZ2U7KXSV7QFSSAHFHA2BWEEGLZ2I44P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZ2U7KXSV7QFSSAHFHA2BWEEGLZ2I44P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It has been confirmed that all devices in the Focusrite Clarett USB
series work the same as the devices in the Clarett+ series. Add the
missing PIDs to enable support for the Clarett 2Pre and 4Pre USB.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_quirks.c        | 2 ++
 sound/usb/mixer_scarlett_gen2.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 0db94ead1b93..ac521b71cb57 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -3420,6 +3420,8 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x1235, 0x8213): /* Focusrite Scarlett 8i6 3rd Gen */
 	case USB_ID(0x1235, 0x8214): /* Focusrite Scarlett 18i8 3rd Gen */
 	case USB_ID(0x1235, 0x8215): /* Focusrite Scarlett 18i20 3rd Gen */
+	case USB_ID(0x1235, 0x8206): /* Focusrite Clarett 2Pre USB */
+	case USB_ID(0x1235, 0x8207): /* Focusrite Clarett 4Pre USB */
 	case USB_ID(0x1235, 0x8208): /* Focusrite Clarett 8Pre USB */
 	case USB_ID(0x1235, 0x820a): /* Focusrite Clarett+ 2Pre */
 	case USB_ID(0x1235, 0x820b): /* Focusrite Clarett+ 4Pre */
diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 57e7fdff6905..ffd398f26d2c 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -5,7 +5,7 @@
  *   Supported models:
  *   - 6i6/18i8/18i20 Gen 2
  *   - Solo/2i2/4i4/8i6/18i8/18i20 Gen 3
- *   - Clarett 8Pre USB
+ *   - Clarett 2Pre/4Pre/8Pre USB
  *   - Clarett+ 2Pre/4Pre/8Pre
  *
  *   Copyright (c) 2018-2023 by Geoffrey D. Bennett <g at b4.vu>
@@ -64,6 +64,8 @@
  * Gregory Rozzo for donating a 4Pre, and David Sherwood and Patrice
  * Peterson for usbmon output).
  *
+ * Support for Clarett 2Pre and 4Pre USB added in Oct 2023.
+ *
  * This ALSA mixer gives access to (model-dependent):
  *  - input, output, mixer-matrix muxes
  *  - mixer-matrix gain stages
@@ -999,6 +1001,8 @@ static const struct scarlett2_device_entry scarlett2_devices[] = {
 	{ USB_ID(0x1235, 0x8215), &s18i20_gen3_info, "Scarlett Gen 3" },
 
 	/* Supported Clarett USB/Clarett+ devices */
+	{ USB_ID(0x1235, 0x8206), &clarett_2pre_info, "Clarett USB" },
+	{ USB_ID(0x1235, 0x8207), &clarett_4pre_info, "Clarett USB" },
 	{ USB_ID(0x1235, 0x8208), &clarett_8pre_info, "Clarett USB" },
 	{ USB_ID(0x1235, 0x820a), &clarett_2pre_info, "Clarett+" },
 	{ USB_ID(0x1235, 0x820b), &clarett_4pre_info, "Clarett+" },
@@ -1197,7 +1201,7 @@ static const struct scarlett2_config
 	[SCARLETT2_CONFIG_TALKBACK_MAP] = {
 		.offset = 0xb0, .size = 16, .activate = 10 },
 
-/* Clarett+ 8Pre */
+/* Clarett USB and Clarett+ devices: 2Pre, 4Pre, 8Pre */
 }, {
 	[SCARLETT2_CONFIG_DIM_MUTE] = {
 		.offset = 0x31, .size = 8, .activate = 2 },
-- 
2.41.0

