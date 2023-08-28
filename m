Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D114A78AA41
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Aug 2023 12:20:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8E7E950;
	Mon, 28 Aug 2023 12:19:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8E7E950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693218049;
	bh=hPYVBqPiGjkQ28N3Ns1qyXR1SyRRGlEMw27n/JUhdSo=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tOU7eEoTPj6uIsyP6liYj1VcX8sSGGoQ3DQ3qSkBB9l8zzuhCfIw3gge+6pjNz/8J
	 6OGcGRCy7zo4tYNPOe872dUDV24UyQiMScQdtN6WiUxthBSsdbILVTyEyfFwgWkZEy
	 rg6SgZ5KiGQnnvRvvnTRLR8OwsUji2Ej4W8WgOyE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F256EF80537; Mon, 28 Aug 2023 12:19:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5269FF80236;
	Mon, 28 Aug 2023 12:19:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8C33F8023B; Mon, 28 Aug 2023 12:19:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1B274F80155
	for <alsa-devel@alsa-project.org>; Mon, 28 Aug 2023 12:19:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B274F80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=rK/Ac9wP;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=7HBTvQgN
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 48FA71F37F;
	Mon, 28 Aug 2023 10:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1693217969; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SSBKJKS7JjPcRXdBgIA0/8VE5vaSgjnNoxCoUgky+BY=;
	b=rK/Ac9wPauWswkyDmbQPQUvXBvHBPTfMxUa3HUqiwt+XCo+laX5SGelxU04ZyB7/xP5V6d
	Ar9L4BzxcJFgJZIRQL9vO/Fvh+vWVZaEFLif/i6d2MjNo8I81hn2HTC0Wgj1FxsdOaZDkf
	L0XutynkjKFEV6NYNmdRFYQvoqqHUBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1693217969;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=SSBKJKS7JjPcRXdBgIA0/8VE5vaSgjnNoxCoUgky+BY=;
	b=7HBTvQgNm5V6RGMdRd70eNv7i7ix9narK3N80In9xvUoQIlWkMaHGfurouVnewcJ5YWugm
	NWaeK0y6Q1OVjWBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 232CF139CC;
	Mon, 28 Aug 2023 10:19:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id u3GdB7F07GR2TwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 28 Aug 2023 10:19:29 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Don't try to submit URBs after disconnection
Date: Mon, 28 Aug 2023 12:19:24 +0200
Message-Id: <20230828101924.27107-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D7SK7JFPCCFQUTSE2EA7GB27EPL2N6XL
X-Message-ID-Hash: D7SK7JFPCCFQUTSE2EA7GB27EPL2N6XL
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D7SK7JFPCCFQUTSE2EA7GB27EPL2N6XL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

USB-audio driver can still submit URBs while the device is being
disconnected, and it may result in spurious error messages like:
  usb 1-2: cannot submit urb (err = -19)
  usb 1-2: Unable to submit urb #0: -19 at snd_usb_queue_pending_output_urbs
  usb 1-2: cannot submit urb 0, error -19: no device
Although those are harmless, they are just ugly.

This patch tries to avoid spewing such error messages when the device
is already at the disconnected state.  It also skips the superfluous
xfer notification, too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index a385e85c4650..8f65349a06d3 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -505,13 +505,18 @@ int snd_usb_queue_pending_output_urbs(struct snd_usb_endpoint *ep,
 			return -EPIPE;
 		}
 
-		err = usb_submit_urb(ctx->urb, GFP_ATOMIC);
+		if (!atomic_read(&ep->chip->shutdown))
+			err = usb_submit_urb(ctx->urb, GFP_ATOMIC);
+		else
+			err = -ENODEV;
 		if (err < 0) {
-			usb_audio_err(ep->chip,
-				      "Unable to submit urb #%d: %d at %s\n",
-				      ctx->index, err, __func__);
-			if (!in_stream_lock)
-				notify_xrun(ep);
+			if (!atomic_read(&ep->chip->shutdown)) {
+				usb_audio_err(ep->chip,
+					      "Unable to submit urb #%d: %d at %s\n",
+					      ctx->index, err, __func__);
+				if (!in_stream_lock)
+					notify_xrun(ep);
+			}
 			return -EPIPE;
 		}
 
@@ -575,12 +580,17 @@ static void snd_complete_urb(struct urb *urb)
 		prepare_inbound_urb(ep, ctx);
 	}
 
-	err = usb_submit_urb(urb, GFP_ATOMIC);
+	if (!atomic_read(&ep->chip->shutdown))
+		err = usb_submit_urb(urb, GFP_ATOMIC);
+	else
+		err = -ENODEV;
 	if (err == 0)
 		return;
 
-	usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
-	notify_xrun(ep);
+	if (!atomic_read(&ep->chip->shutdown)) {
+		usb_audio_err(ep->chip, "cannot submit urb (err = %d)\n", err);
+		notify_xrun(ep);
+	}
 
 exit_clear:
 	clear_bit(ctx->index, &ep->active_mask);
@@ -1603,11 +1613,15 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 			goto __error;
 		}
 
-		err = usb_submit_urb(urb, GFP_ATOMIC);
+		if (!atomic_read(&ep->chip->shutdown))
+			err = usb_submit_urb(urb, GFP_ATOMIC);
+		else
+			err = -ENODEV;
 		if (err < 0) {
-			usb_audio_err(ep->chip,
-				"cannot submit urb %d, error %d: %s\n",
-				i, err, usb_error_string(err));
+			if (!atomic_read(&ep->chip->shutdown))
+				usb_audio_err(ep->chip,
+					      "cannot submit urb %d, error %d: %s\n",
+					      i, err, usb_error_string(err));
 			goto __error;
 		}
 		set_bit(i, &ep->active_mask);
-- 
2.35.3

