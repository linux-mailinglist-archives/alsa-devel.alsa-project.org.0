Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 385903DA0F5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:17:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEA0B1F19;
	Thu, 29 Jul 2021 12:16:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEA0B1F19
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553828;
	bh=DtRM9dv7NEpGxflpwiB0NWeVKcUG67n4+Enq7Le4G/4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PR191hFeU22vZsoR5BTgUuzihvnAimL2fsOXgcSffb1g/w5DUR4WghNRTIne1LjgE
	 8UHcAVNO8ufPxiA7EbXA+PR4T9TPTMrCfnk7CAPIp55Vkjpmf48l9XRG6jH1JfKBpr
	 TZCq0TbRXVgoe927eoQd7zPNGgcFS5iGy3MpXHrg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25EF6F804FF;
	Thu, 29 Jul 2021 12:14:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E8E19F804EC; Thu, 29 Jul 2021 12:14:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68B32F802E7
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:13:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68B32F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="oaA/qROd"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="pBdpNWI6"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 901E3224E0
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGMOViJ8/IVgqnD/FZvQigQyRIxfhB6rHYfXackLMdQ=;
 b=oaA/qROdz8Oyfe06zSULge3ONVnun/C3LCdZKxlSkwJMM1sUWF901umuaymw6pL9USl7NU
 t6/ZnPuCXvYvz9eA9jvBBTo67cdM9rs0S8cr9hxYXRibkXTb6wklm9mFjWlN/gvuf+pvUH
 I77+QtPeqTVXkdlufEWFicWrXLuH1WE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CGMOViJ8/IVgqnD/FZvQigQyRIxfhB6rHYfXackLMdQ=;
 b=pBdpNWI6KicA6npVMz2+Sf0YXXerM3kJPsJeQ7RbqEYzPAmTIYtgM4222KC8pTmacFXsvX
 +AZallnYLmCwlRDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 05E46A3C86;
 Thu, 29 Jul 2021 07:44:06 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/15] ALSA: usb-audio: Move generic DSD raw detection into
 quirk_flags
Date: Thu, 29 Jul 2021 09:44:02 +0200
Message-Id: <20210729074404.19728-4-tiwai@suse.de>
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

The generic DSD raw detection is based on the known allow list, and we
can integrate it into quirk_flags, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c   | 51 +++++++++++++++++++++++---------------------
 sound/usb/usbaudio.h |  3 +++
 2 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index fce3a341adc8..670abc6318f2 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1673,29 +1673,9 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
 	}
 
-	/* Mostly generic method to detect many DSD-capable implementations -
-	 * from XMOS/Thesycon
-	 */
-	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x152a:  /* Thesycon devices */
-	case 0x20b1:  /* XMOS based devices */
-	case 0x22d9:  /* Oppo */
-	case 0x23ba:  /* Playback Designs */
-	case 0x25ce:  /* Mytek devices */
-	case 0x278b:  /* Rotel? */
-	case 0x292b:  /* Gustard/Ess based devices */
-	case 0x2972:  /* FiiO devices */
-	case 0x2ab6:  /* T+A devices */
-	case 0x3353:  /* Khadas devices */
-	case 0x3842:  /* EVGA */
-	case 0xc502:  /* HiBy devices */
-		if (fp->dsd_raw)
-			return SNDRV_PCM_FMTBIT_DSD_U32_BE;
-		break;
-	default:
-		break;
-
-	}
+	/* Mostly generic method to detect many DSD-capable implementations */
+	if ((chip->quirk_flags & QUIRK_FLAG_DSD_RAW) && fp->dsd_raw)
+		return SNDRV_PCM_FMTBIT_DSD_U32_BE;
 
 	return 0;
 }
@@ -1917,10 +1897,33 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
+	VENDOR_FLG(0x152a, /* Thesycon devices */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
+	VENDOR_FLG(0x20b1, /* XMOS based devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x22d9, /* Oppo */
+		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x23ba, /* Playback Design */
-		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
+		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY |
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x25ce, /* Mytek devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x278b, /* Rotel? */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x292b, /* Gustard/Ess based devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2972, /* FiiO devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x2ab6, /* T+A devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x3353, /* Khadas devices */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0x3842, /* EVGA */
+		   QUIRK_FLAG_DSD_RAW),
+	VENDOR_FLG(0xc502, /* HiBy devices */
+		   QUIRK_FLAG_DSD_RAW),
 
 	{} /* terminator */
 };
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index a152f5b08c7a..4e93668a2a48 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -159,6 +159,8 @@ extern bool snd_usb_skip_validation;
  *  Disable runtime PM autosuspend
  * QUIRK_FLAG_IGNORE_CTL_ERROR:
  *  Ignore errors for mixer access
+ * QUIRK_FLAG_DSD_RAW:
+ *  Support generic DSD raw U32_BE format
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
@@ -176,5 +178,6 @@ extern bool snd_usb_skip_validation;
 #define QUIRK_FLAG_VALIDATE_RATES	(1U << 12)
 #define QUIRK_FLAG_DISABLE_AUTOSUSPEND	(1U << 13)
 #define QUIRK_FLAG_IGNORE_CTL_ERROR	(1U << 14)
+#define QUIRK_FLAG_DSD_RAW		(1U << 15)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

