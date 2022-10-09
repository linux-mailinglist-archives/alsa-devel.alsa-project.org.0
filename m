Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D8D5F8AB5
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 12:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F68A167E;
	Sun,  9 Oct 2022 12:42:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F68A167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665312221;
	bh=yC2/hH/XleuyEkKT3SKtZ3bSfCuDXpVdHjsvjIQiCR4=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KFLf3yAZhxrgnPYd4r5QuGlK53Vep5U9gkFtAlp1k1bLe5gdpSGM5Cnz5PnU/FHtF
	 UsaXm1IfkESNZesDnxe3LL3R8wAdIdEFcuHd6IzedNuJk0XSKZTaEaN6LiPnjYTedR
	 xaS3t8S6LAYC/MpCvkrXQdgcL0lHClVOiUq1z3bw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDD7F8052F;
	Sun,  9 Oct 2022 12:42:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FE7F8052F; Sun,  9 Oct 2022 12:42:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39CEBF800EC
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 12:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39CEBF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="yMoTywq1"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MpCGTXnZ"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D9ADB1F8AF;
 Sun,  9 Oct 2022 10:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665312135; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZs5k24zMJCinMNErz+bvmHJ+pr8wO/fj7nEjXZQeC8=;
 b=yMoTywq13fd7LGxb6NIvYN+gueVPmS0aOmhfmcgj3Ljpna5lc2cgDf92WP/Lg7uQVBwSAd
 F8Fr7WjYHAm/gENo9nreF8FVc9j1MPQRumw9hIqkPB7AL/f+OHzkXUE5+5Fy6wPRQSPoyB
 XLWWOAfb99CawdUKOJ48TBp6YzgXPn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665312135;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YZs5k24zMJCinMNErz+bvmHJ+pr8wO/fj7nEjXZQeC8=;
 b=MpCGTXnZ1d+gP1dJexzsE/5+SuLSQV8FSH2ujnyaod2u7GIVJqRF8wCpCcK9NOwq3XtqRO
 xxMRFy25tD5t52DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDC38139F0;
 Sun,  9 Oct 2022 10:42:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8DuXLYelQmMsfAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 09 Oct 2022 10:42:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ALSA: usb-audio: Apply mutex around
 snd_usb_endpoint_set_params()
Date: Sun,  9 Oct 2022 12:42:10 +0200
Message-Id: <20221009104212.18877-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221009104212.18877-1-tiwai@suse.de>
References: <20221009104212.18877-1-tiwai@suse.de>
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

The protection with chip->mutex was lost after splitting
snd_usb_endpoint_set_params() and snd_usb_endpoint_prepare().
Apply the same mutex again to the former function.

Fixes: 2be79d586454 ("ALSA: usb-audio: Split endpoint setups for hw_params and prepare (take#2)")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index f21acbc9f4f4..da378e565ef8 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1337,10 +1337,11 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	const struct audioformat *fmt = ep->cur_audiofmt;
 	int err;
 
+	mutex_lock(&chip->mutex);
 	/* release old buffers, if any */
 	err = release_urbs(ep, false);
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	ep->datainterval = fmt->datainterval;
 	ep->maxpacksize = fmt->maxpacksize;
@@ -1378,13 +1379,16 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	usb_audio_dbg(chip, "Set up %d URBS, ret=%d\n", ep->nurbs, err);
 
 	if (err < 0)
-		return err;
+		goto unlock;
 
 	/* some unit conversions in runtime */
 	ep->maxframesize = ep->maxpacksize / ep->cur_frame_bytes;
 	ep->curframesize = ep->curpacksize / ep->cur_frame_bytes;
 
-	return update_clock_ref_rate(chip, ep);
+	err = update_clock_ref_rate(chip, ep);
+ unlock:
+	mutex_unlock(&chip->mutex);
+	return err;
 }
 
 static int init_sample_rate(struct snd_usb_audio *chip,
-- 
2.35.3

