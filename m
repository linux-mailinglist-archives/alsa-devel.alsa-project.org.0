Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAF3F57C9
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 07:58:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A92F86F;
	Tue, 24 Aug 2021 07:57:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A92F86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629784729;
	bh=qLMOO1jMMBRdK55C26eSkIyPe219ArWnXtKBobVppOA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YaTeOLsOHZdF3cxQgEaqSSv02BcHoPoSI9gz+YqNCu/T7wAfJfy9rignTUyZGrCkQ
	 mwsn6aqRjN9ArhkRviHvEeCUKgoCzpzqK6XcDMdJAQcm07rf8o5FxcNwWjV0z3Q+Z5
	 hh6okF1jOc/vt4pj1npGzdkC+LGYXlUOjafb1hFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 75117F80087;
	Tue, 24 Aug 2021 07:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79526F801D8; Tue, 24 Aug 2021 07:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A3F82F80171
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 07:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F82F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="t7FHZ7BY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="FI3lB8w4"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 3307A21FFD
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 05:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629784641; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L580n69deo1opaNjUQcKX8H6/UDjpmXf2hUfYt/uOqo=;
 b=t7FHZ7BY/ZqTlOqLF87V/F4aTPBlt43BCcFYiKmcJ72sq82LpdsEFiv8UySirzyRk/l8eE
 fl7qAqG27qV8TX3Oh7Y4hGavDRKJIJQ+kWexT8eCKBc+QcQchXl2L6nhaSx/MVlpGtiWaC
 Aw5eH24Z4igpfdlm+oB3z4W6xEhsihc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629784641;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=L580n69deo1opaNjUQcKX8H6/UDjpmXf2hUfYt/uOqo=;
 b=FI3lB8w4u9Lvzp5qOGOmkHZnFqg2Y9hzUzi4nA0RaWWpWLNiUJL34qkhQdB+w+szE+c5Uf
 JkERNK8+HaybmKBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 1DB6DA3B87;
 Tue, 24 Aug 2021 05:57:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH for-5.15] ALSA: usb-audio: Move set-interface-first workaround
 into common quirk
Date: Tue, 24 Aug 2021 07:57:20 +0200
Message-Id: <20210824055720.9240-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The recent quirk for WALKMAN (commit 7af5a14371c1: "ALSA: usb-audio:
Fix regression on Sony WALKMAN NW-A45 DAC") may be required for other
devices and is worth to be put into the common quirk flags.
This patch adds a new quirk flag bit QUIRK_FLAG_SET_IFACE_FIRST and a
quirk table entry for the device.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/alsa-configuration.rst | 1 +
 sound/usb/endpoint.c                       | 6 ++----
 sound/usb/quirks.c                         | 2 ++
 sound/usb/usbaudio.h                       | 3 +++
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index e3c33b8d6d78..65f61695f561 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -2278,6 +2278,7 @@ quirk_flags
         * bit 13: Disable runtime PM autosuspend
         * bit 14: Ignore errors for mixer access
         * bit 15: Support generic DSD raw U32_BE format
+        * bit 16: Set up the interface at first like UAC1
 
 This module supports multiple devices, autoprobe and hotplugging.
 
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index e6d58d7674a0..79a8c569c62b 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1293,10 +1293,8 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	 * to be set up before parameter setups
 	 */
 	iface_first = ep->cur_audiofmt->protocol == UAC_VERSION_1;
-	/* Workaround for Sony WALKMAN NW-A45 DAC;
-	 * it requires the interface setup at first like UAC1
-	 */
-	if (chip->usb_id == USB_ID(0x054c, 0x0b8c))
+	/* Workaround for devices that require the interface setup at first like UAC1 */
+	if (chip->quirk_flags & QUIRK_FLAG_SET_IFACE_FIRST)
 		iface_first = true;
 	if (iface_first) {
 		err = endpoint_set_interface(chip, ep, true);
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 670abc6318f2..4479a590194f 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1790,6 +1790,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x04e8, 0xa051, /* Samsung USBC Headset (AKG) */
 		   QUIRK_FLAG_SKIP_CLOCK_SELECTOR | QUIRK_FLAG_CTL_MSG_DELAY_5M),
+	DEVICE_FLG(0x054c, 0x0b8c, /* Sony WALKMAN NW-A45 DAC */
+		   QUIRK_FLAG_SET_IFACE_FIRST),
 	DEVICE_FLG(0x0556, 0x0014, /* Phoenix Audio TMX320VC */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x05a3, 0x9420, /* ELP HD USB Camera */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 4e93668a2a48..94261d19cceb 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -161,6 +161,8 @@ extern bool snd_usb_skip_validation;
  *  Ignore errors for mixer access
  * QUIRK_FLAG_DSD_RAW:
  *  Support generic DSD raw U32_BE format
+ * QUIRK_FLAG_SET_IFACE_FIRST:
+ *  Set up the interface at first like UAC1
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -179,5 +181,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_DISABLE_AUTOSUSPEND	(1U << 13)
 #define QUIRK_FLAG_IGNORE_CTL_ERROR	(1U << 14)
 #define QUIRK_FLAG_DSD_RAW		(1U << 15)
+#define QUIRK_FLAG_SET_IFACE_FIRST	(1U << 16)
 
 #endif /* __USBAUDIO_H */
-- 
2.31.1

