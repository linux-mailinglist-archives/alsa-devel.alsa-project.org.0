Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F24B3DA0F0
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:16:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FE361F11;
	Thu, 29 Jul 2021 12:15:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FE361F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553773;
	bh=O/XYhMv07wGIYGQIAOvBG2xyv8kVKqvDaM7cRuD7bTI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pX4sUTpvrVy0rcZQsg7daN7Bx6N7p5+78fdKZMR3a2dZHPDFI9q2xRzEhcMVOskb8
	 +qIM0kkaY76cnredfmLvjviZEZz3FJ4ZarU4F2TkCQW3MKY/GDr2fDHMliuCDROYKk
	 0ZMvgY/6MuE0vcwIwDWC2wbJvYWq8yx4kQRPkTMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D735F804AF;
	Thu, 29 Jul 2021 12:14:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C7B6F804EB; Thu, 29 Jul 2021 12:13:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40552F800EB
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40552F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OWqMiXGS"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="Jgkop70B"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 48B3122482
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaoXcNEMZzOMvI84/JX59uVQbX+eIsMnZN0wPuCPQxA=;
 b=OWqMiXGSIuRd1gi09XeOPB21YzsAScNUAM5Sbme/JMaqgZiDXu4SHbZGrEf/ckNpkj7Hqo
 2ogaWQz0GfCnvTKtYgkWB9vkE9O4r62gtSdqxzI4LaNkHw+96h/PPN9iUZSD99D65rPpw6
 r4aOj1RwMfWto+nVTlPq+HfWi9aVSqg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oaoXcNEMZzOMvI84/JX59uVQbX+eIsMnZN0wPuCPQxA=;
 b=Jgkop70B63iSjGcQcsk/4UWyQqHIfLGGO2EZqG0KK9Q2RrgvE/hTLcLFUGQp/MmKPlpf/p
 ZzRemQYxaaMB2ZDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id D932DA3C82;
 Thu, 29 Jul 2021 07:44:05 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/15] ALSA: usb-audio: Move rate validation quirk into
 quirk_flags
Date: Thu, 29 Jul 2021 09:43:59 +0200
Message-Id: <20210729074404.19728-1-tiwai@suse.de>
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

The rate validation at the device probe is applied only to the
specific devices (currently only for MOTU devices), and this check can
be moved to quirk_flags gracefully, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/format.c   | 6 +-----
 sound/usb/quirks.c   | 2 ++
 sound/usb/usbaudio.h | 3 +++
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/sound/usb/format.c b/sound/usb/format.c
index eb216fef4ba7..50efccbffb8a 100644
--- a/sound/usb/format.c
+++ b/sound/usb/format.c
@@ -472,12 +472,8 @@ static int validate_sample_rate_table_v2v3(struct snd_usb_audio *chip,
 	 * behavior afterwards by some unknown reason.  Do this only for the
 	 * known devices.
 	 */
-	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x07fd: /* MOTU */
-		break;
-	default:
+	if (!(chip->quirk_flags & QUIRK_FLAG_VALIDATE_RATES))
 		return 0; /* don't perform the validation as default */
-	}
 
 	table = kcalloc(fp->nr_rates, sizeof(*table), GFP_KERNEL);
 	if (!table)
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index f47078209bcc..dc667b8c92f2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1907,6 +1907,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_CTL_MSG_DELAY),
 	VENDOR_FLG(0x0644, /* TEAC Corp. */
 		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
+	VENDOR_FLG(0x07fd, /* MOTU */
+		   QUIRK_FLAG_VALIDATE_RATES),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	VENDOR_FLG(0x23ba, /* Playback Design */
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 57b5dcf211d4..ea0e3deb2a23 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -155,6 +155,8 @@ extern bool snd_usb_skip_validation;
  *  Add a delay of 5-6ms at each control message handling
  * QUIRK_FLAG_IFACE_DELAY:
  *  Add a delay of 50ms at each interface setup
+ * QUIRK_FLAG_VALIDATE_RATES:
+ *  Perform sample rate validations at probe
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -169,5 +171,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_CTL_MSG_DELAY_1M	(1U << 9)
 #define QUIRK_FLAG_CTL_MSG_DELAY_5M	(1U << 10)
 #define QUIRK_FLAG_IFACE_DELAY		(1U << 11)
+#define QUIRK_FLAG_VALIDATE_RATES	(1U << 12)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

