Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B98063DA0D8
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 12:08:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B81F1F30;
	Thu, 29 Jul 2021 12:07:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B81F1F30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627553329;
	bh=AqGLMMTWrFXlQ4uep/O9orxvJtUttdEkXVLhzEv6KC0=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHLp9QFP80zr2RHPmsIAe0TGBHU4nfFpPXELKhamNDrs9yT5ZOJ6jlWtC6uXg3SXp
	 5uFUeaTZbJq8q+zg3o/L579RYDZPsqSELQEt4+rsbWjk/PGn/wkHLiQhuK4mN3T+4z
	 Preg/ujJGYj+EF6zNr+1YNtBHI6Ax/AfDa178hjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3B220F80526;
	Thu, 29 Jul 2021 12:04:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F6DCF8051D; Thu, 29 Jul 2021 12:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42C21F804AF
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 12:03:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42C21F804AF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="QW9ZIKNw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HPuMKZ3Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 028FC20218
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 10:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627553026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvuFxLwt+SNcyZVY+/IADyn+HegfE6fWeXH/zM71u0g=;
 b=QW9ZIKNwvyZ/1RTWrSD7plyXYAN1zvDel5uyr0k0pnbViz9IgVeDVT85wTy0QHZceDm/MJ
 866e+iaPWF7ywL/Ex/vAjTVgv162rYCBJ48VrpeDlwhUVIN50H/pANhQvSkn7CfzWro+ld
 tnAOJQilUV9FP4ac4Vt2P51Sh4+yKCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627553026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mvuFxLwt+SNcyZVY+/IADyn+HegfE6fWeXH/zM71u0g=;
 b=HPuMKZ3QKh3ENRizRHEta4ACo5gq+TU3Sc1W2IrYijdEaPcglwltcB6WRMUfDFieas9ELi
 v7LQN1z5UQjOVoAQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 04E2BA3BDB;
 Thu, 29 Jul 2021 07:38:58 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/15] ALSA: usb-audio: Move playback_first flag into
 quirk_flags
Date: Thu, 29 Jul 2021 09:38:51 +0200
Message-Id: <20210729073855.19043-6-tiwai@suse.de>
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

The snd_usb_audio.playback_first flag is used by the implicit feedback
mode handling, and this can be also moved to quirk_flags.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 2 +-
 sound/usb/implicit.c | 6 +++---
 sound/usb/usbaudio.h | 4 +++-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 16c36e43c16f..6016e97faf69 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1382,7 +1382,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 		goto __error;
 
 	if (snd_usb_endpoint_implicit_feedback_sink(ep) &&
-	    !ep->chip->playback_first) {
+	    !(ep->chip->quirk_flags & QUIRK_FLAG_PLAYBACK_FIRST)) {
 		for (i = 0; i < ep->nurbs; i++) {
 			struct snd_urb_ctx *ctx = ep->urb + i;
 			list_add_tail(&ctx->ready_list, &ep->ready_playback_urbs);
diff --git a/sound/usb/implicit.c b/sound/usb/implicit.c
index 590a0dbba7a2..23767a14d126 100644
--- a/sound/usb/implicit.c
+++ b/sound/usb/implicit.c
@@ -171,7 +171,7 @@ static int add_roland_implicit_fb(struct snd_usb_audio *chip,
 	if (!usb_endpoint_is_isoc_in(epd) ||
 	    (epd->bmAttributes & USB_ENDPOINT_SYNCTYPE) != USB_ENDPOINT_SYNC_ASYNC)
 		return 0;
-	chip->playback_first = 1;
+	chip->quirk_flags |= QUIRK_FLAG_PLAYBACK_FIRST;
 	return add_implicit_fb_sync_ep(chip, fmt, epd->bEndpointAddress, 0,
 				       alts->desc.bInterfaceNumber, alts);
 }
@@ -320,7 +320,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 		case IMPLICIT_FB_FIXED:
 			return 0; /* no quirk */
 		case IMPLICIT_FB_BOTH:
-			chip->playback_first = 1;
+			chip->quirk_flags |= QUIRK_FLAG_PLAYBACK_FIRST;
 			return add_generic_implicit_fb(chip, fmt, alts);
 		}
 	}
@@ -344,7 +344,7 @@ static int audioformat_implicit_fb_quirk(struct snd_usb_audio *chip,
 
 	/* Pioneer devices with vendor spec class */
 	if (is_pioneer_implicit_fb(chip, alts)) {
-		chip->playback_first = 1;
+		chip->quirk_flags |= QUIRK_FLAG_PLAYBACK_FIRST;
 		return add_implicit_fb_sync_ep(chip, fmt,
 					       get_endpoint(alts, 1)->bEndpointAddress,
 					       1, alts->desc.bInterfaceNumber,
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 4003ca99d4ac..8de2b6c51dad 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -36,7 +36,6 @@ struct snd_usb_audio {
 	wait_queue_head_t shutdown_wait;
 	unsigned int quirk_flags;
 	unsigned int need_delayed_register:1; /* warn for delayed registration */
-	unsigned int playback_first:1;	/* for implicit fb: don't wait for the first capture URBs */
 	int num_interfaces;
 	int num_suspended_intf;
 	int sample_rate_read_error;
@@ -139,11 +138,14 @@ extern bool snd_usb_skip_validation;
  *  slots (audio frames)
  * QUIRK_TX_LENGTH:
  *  Add length specifier to transfers
+ * QUIRK_FLAG_PLAYBACK_FIRST:
+ *  Start playback stream at first even in implement feedback mode
  */
 
 #define QUIRK_FLAG_GET_SAMPLE_RATE	(1U << 0)
 #define QUIRK_FLAG_SHARE_MEDIA_DEVICE	(1U << 1)
 #define QUIRK_FLAG_ALIGN_TRANSFER	(1U << 2)
 #define QUIRK_FLAG_TX_LENGTH		(1U << 3)
+#define QUIRK_FLAG_PLAYBACK_FIRST	(1U << 4)
 
 #endif /* __USBAUDIO_H */
-- 
2.26.2

