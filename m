Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFE55F8AB6
	for <lists+alsa-devel@lfdr.de>; Sun,  9 Oct 2022 12:44:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A601686;
	Sun,  9 Oct 2022 12:43:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A601686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665312242;
	bh=EUNRPoD5pJUItv0SgzR9EWEVg1uaemwCW231Mec3XxA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ow0mbwO9giUAavqxhKgRI8W/x534n1dFRK3sJMrG3vCiPhK2FxbyYo5CHq9v5Riao
	 NdPEqJ1qHbCz0y7hIDnVKS9hebXqaxCDQvPVHlihIIUAy5abfR/ql+cW2zjwsfO6pG
	 e4KwiL3umzvPutxcQj8y1dpn6VHGGJ7RJTXxMzk4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23F73F80542;
	Sun,  9 Oct 2022 12:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 57069F8052E; Sun,  9 Oct 2022 12:42:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1E37F80256
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 12:42:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1E37F80256
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="rH4xgFyI"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UrX7cP2B"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2911621959;
 Sun,  9 Oct 2022 10:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665312136; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SFdCkWtHyd6HyEKsbsfhAzuOqk9dDoRmh24GJT0E3s=;
 b=rH4xgFyIzWCK17eYlVFDCbmQOitXzW+leyDlJpWaKQEoQrKWwC9F0aA3e/LydTf57UqvME
 BIFs220QweeaNnTx/r4yqkInBCvVDrKGlCWmAkzDfCuphBaFojMIag8g+aowF6ff/FHbKF
 k73vRJvTix/9i1Sw5hC33Gx6OEX3dAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665312136;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0SFdCkWtHyd6HyEKsbsfhAzuOqk9dDoRmh24GJT0E3s=;
 b=UrX7cP2Bt36i+FhEUE70BWyTbEixM8y8tCah0OcxNBaBU+WHOEhObFiA2i1148IxNzWxkA
 TtM/md8TGkEzWjDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0E316139F0;
 Sun,  9 Oct 2022 10:42:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id APGxAoilQmMsfAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sun, 09 Oct 2022 10:42:16 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ALSA: usb-audio: Avoid superfluous endpoint setup
Date: Sun,  9 Oct 2022 12:42:12 +0200
Message-Id: <20221009104212.18877-5-tiwai@suse.de>
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

After splitting to snd_usb_endpoint_set_params() and *_prepare(), the
skip of each function should be checked with different flags, while we
still use ep->need_setup as the single one.  Introduce
ep->need_prepare for indicating the need of prepare, and also add the
missing check of ep->need_setup at the set_params.

Fixes: 2be79d586454 ("ALSA: usb-audio: Split endpoint setups for hw_params and prepare (take#2)")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     |  3 ++-
 sound/usb/endpoint.c | 17 ++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index ca75f2206170..40061550105a 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -129,7 +129,8 @@ struct snd_usb_endpoint {
 					   in a stream */
 	bool implicit_fb_sync;		/* syncs with implicit feedback */
 	bool lowlatency_playback;	/* low-latency playback mode */
-	bool need_setup;		/* (re-)need for configure? */
+	bool need_setup;		/* (re-)need for hw_params? */
+	bool need_prepare;		/* (re-)need for prepare? */
 
 	/* for hw constraints */
 	const struct audioformat *cur_audiofmt;
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 44cce6cec9da..d0b8d61d1d22 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -824,6 +824,7 @@ snd_usb_endpoint_open(struct snd_usb_audio *chip,
 
 		ep->implicit_fb_sync = fp->implicit_fb;
 		ep->need_setup = true;
+		ep->need_prepare = true;
 
 		usb_audio_dbg(chip, "  channels=%d, rate=%d, format=%s, period_bytes=%d, periods=%d, implicit_fb=%d\n",
 			      ep->cur_channels, ep->cur_rate,
@@ -952,7 +953,7 @@ void snd_usb_endpoint_close(struct snd_usb_audio *chip,
 /* Prepare for suspening EP, called from the main suspend handler */
 void snd_usb_endpoint_suspend(struct snd_usb_endpoint *ep)
 {
-	ep->need_setup = true;
+	ep->need_prepare = true;
 	if (ep->iface_ref)
 		ep->iface_ref->need_setup = true;
 	if (ep->clock_ref)
@@ -1335,9 +1336,12 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 				struct snd_usb_endpoint *ep)
 {
 	const struct audioformat *fmt = ep->cur_audiofmt;
-	int err;
+	int err = 0;
 
 	mutex_lock(&chip->mutex);
+	if (!ep->need_setup)
+		goto unlock;
+
 	/* release old buffers, if any */
 	err = release_urbs(ep, false);
 	if (err < 0)
@@ -1386,8 +1390,11 @@ int snd_usb_endpoint_set_params(struct snd_usb_audio *chip,
 	ep->curframesize = ep->curpacksize / ep->cur_frame_bytes;
 
 	err = update_clock_ref_rate(chip, ep);
-	if (err >= 0)
+	if (err >= 0) {
+		ep->need_setup = false;
 		err = 0;
+	}
+
  unlock:
 	mutex_unlock(&chip->mutex);
 	return err;
@@ -1437,7 +1444,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	mutex_lock(&chip->mutex);
 	if (WARN_ON(!ep->iface_ref))
 		goto unlock;
-	if (!ep->need_setup)
+	if (!ep->need_prepare)
 		goto unlock;
 
 	/* If the interface has been already set up, just set EP parameters */
@@ -1491,7 +1498,7 @@ int snd_usb_endpoint_prepare(struct snd_usb_audio *chip,
 	ep->iface_ref->need_setup = false;
 
  done:
-	ep->need_setup = false;
+	ep->need_prepare = false;
 	err = 1;
 
 unlock:
-- 
2.35.3

