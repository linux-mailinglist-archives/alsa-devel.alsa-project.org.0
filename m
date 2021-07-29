Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A083DA0D3
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D4B11F14;
	Thu, 29 Jul 2021 12:06:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D4B11F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553230;
	bh=+8sBkXiEx/zPHAn5WCRNN7kDJOfqCSZY94uwIPvg/kM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zn9JR17TdEUq9/QwvFiuXjfQRwP8IoUVFE/QeIjliLGSxUokwpfcP4hz2zpuNh7eJ
	 3J8q52QRjB0aZ8nrpbaeCJ+HZlj1O1QFSqxAxw/pEkU7Go4n3OmDdcQYv9yPLkdUZc
	 QOoO+qp8SBT2nKuZroAPQvRFD14LPGhaOy03noLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9481F804E4;
	Thu, 29 Jul 2021 12:04:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDF3DF804FD; Thu, 29 Jul 2021 12:04:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80022F804B2
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80022F804B2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="i4FZ1H1z"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="GsWeGfUM"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id E575020203
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553025; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cf2D9g0+6GuvLMcYtJLjMaJaSV0svwCNmB0umTKyKE=;
 b=i4FZ1H1zMyZLthcVYiFWNREGs07p50/CUXPQwePDo45nZu6f6Z3UTdVM3PFej2msi0iIPr
 gXtkQ//R5r5ndj8j6KG+l7k06AZqzZpxeRiSMHB2K4tBsZDzHvrzD6Q4RvVwI03d2uEXFa
 BFleJDU5DvltWOVA1Cngn169upg0QIU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553025;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cf2D9g0+6GuvLMcYtJLjMaJaSV0svwCNmB0umTKyKE=;
 b=GsWeGfUMdxeCrsOMqZAnswZiz8omnOuhTh7OJBX/mzjv5+4TIsv+dbVhecB283wWHONpkj
 +x9/cc4ieaJ/O2DA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D6B98A3BD5;
 Thu, 29 Jul 2021 07:38:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/15] ALSA: usb-audio: Move media-controller API quirk into
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:48 +0200
Message-Id: <20210729073855.19043-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210729073855.19043-1-tiwai@suse.de>
References: <20210729073855.19043-1-tiwai@suse.de>
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

The devices that can have media-controller API entries are currently
specified via tables in quirks-table.h, as a part of descriptor
override.  This can fit better to the new quirk_flags, as we just need
a matching with the given ID and create the MC entries accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.c         |  2 +-
 sound/usb/quirks-table.h |  1 -
 sound/usb/quirks.c       | 34 ++++++++++++++++++++++++++++++++++
 sound/usb/usbaudio.h     |  4 +++-
 4 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/sound/usb/card.c b/sound/usb/card.c
index 8fee90b9776e..5f5095890a29 100644
--- a/sound/usb/card.c
+++ b/sound/usb/card.c
@@ -826,7 +826,7 @@ static int usb_audio_probe(struct usb_interface *intf,
 			goto __error;
 	}
 
-	if (quirk && quirk->shares_media_device) {
+	if (chip->quirk_flags & QUIRK_FLAG_SHARE_MEDIA_DEVICE) {
 		/* don't want to fail when snd_media_device_create() fails */
 		snd_media_device_create(chip, intf);
 	}
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 19bb499c17da..d644b31c4c7f 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2816,7 +2816,6 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		.product_name = pname, \
 		.ifnum = QUIRK_ANY_INTERFACE, \
 		.type = QUIRK_AUDIO_ALIGN_TRANSFER, \
-		.shares_media_device = 1, \
 	} \
 }
 
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 9c3d234c8b32..798aec4298f4 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1913,12 +1913,46 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x05a7, 0x1020, /* Bose Companion 5 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x05e1, 0x0480, /* Hauppauge Woodbury */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
 	DEVICE_FLG(0x074d, 0x3553, /* Outlaw RR2150 (Micronas UAC3553B) */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x0fd9, 0x0008, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
 	DEVICE_FLG(0x1395, 0x740a, /* Sennheiser DECT */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x1901, 0x0191, /* GE B850V3 CP2114 audio interface */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	DEVICE_FLG(0x2040, 0x7200, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7201, /* Hauppauge HVR-950Q-MXL */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7210, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7211, /* Hauppauge HVR-950Q-MXL */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7213, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7217, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x721b, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x721e, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x721f, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7240, /* Hauppauge HVR-850 */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7260, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7270, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7280, /* Hauppauge HVR-950Q */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x7281, /* Hauppauge HVR-950Q-MXL */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
+	DEVICE_FLG(0x2040, 0x8200, /* Hauppauge Woodbury */
+		   QUIRK_FLAG_SHARE_MEDIA_DEVICE),
 	DEVICE_FLG(0x21b4, 0x0081, /* AudioQuest DragonFly */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x2912, 0x30c8, /* Audioengine D1 */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 37195ac26ac9..ece244637798 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -116,7 +116,6 @@ struct snd_usb_audio_quirk {
 	const char *product_name;
 	int16_t ifnum;
 	uint16_t type;
-	bool shares_media_device;
 	const void *data;
 };
 
@@ -136,8 +135,11 @@ extern bool snd_usb_skip_validation;
  * QUIRK_FLAG_GET_SAMPLE_RATE:
  *  Skip reading sample rate for devices, as some devices behave inconsistently
  *  or return error
+ * QUIRK_FLAG_SHARE_MEDIA_DEVICE:
+ *  Create Media Controller API entries
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
+#define QUIRK_FLAG_SHARE_MEDIA_DEVICE	(1U << 1)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

