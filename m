Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D396C6009
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 07:54:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E4CDED4;
	Thu, 23 Mar 2023 07:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E4CDED4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679554472;
	bh=GhNqXSwzW3W51qSV0YrGDGApLsXAA1qmwF0CHISP3QQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=n5eNCZxODRXtzShX5kPBmYgCfQIkRenwdpH19c9jQAV4LdCIk7IApYh6i7Ri/KS9Z
	 qlnp3qveHy7kNLY9lfufu0xFAfRclrnU6I5VAIj5IhUCsULduifqwIimcrt5XjImA5
	 uYn3FM0jRW3/+ypPkVA1a+00f8N/tdmT6hhaU6RI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 37EDEF8052D;
	Thu, 23 Mar 2023 07:52:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E9E7F802E8; Thu, 23 Mar 2023 07:52:48 +0100 (CET)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 969DCF80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 07:52:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 969DCF80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=xzsFkUDG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=xO71Gb9Z
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E6FF55C441;
	Thu, 23 Mar 2023 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1679554360; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7DgMhstBA1sVwZ4ao6LCJN/mChAq5Mir/EE5WLuT2k=;
	b=xzsFkUDGRUDNyyyGxFe1KtbjKuc3Pi5t2b14Zc1UA92HryG7xPjQL0rUs7EGMmp0Cu8C0O
	y3wx8GL+iMgm3nmQ+u70hGiKe+oxXPFeq7SL+jFofWu0k0l7jJJJ7Wn221pozkXFoOhNUY
	pYjGbmhcLaUrAlPRlkvm3/OHvziole8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1679554360;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w7DgMhstBA1sVwZ4ao6LCJN/mChAq5Mir/EE5WLuT2k=;
	b=xO71Gb9ZQVZCN8QrV7EPOhICvQk1b2AIl+ezIW7spitE+fKvbpXzP/Vow3OOPV/KsBvlYN
	nRaEnr//gSleaPBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D051E13596;
	Thu, 23 Mar 2023 06:52:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id qKoqMjj3G2QJcQAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 23 Mar 2023 06:52:40 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: pcm: Improved XRUN handling for indirect PCM
 helpers
Date: Thu, 23 Mar 2023 07:52:35 +0100
Message-Id: <20230323065237.5062-2-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230323065237.5062-1-tiwai@suse.de>
References: <20230323065237.5062-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: JBUD7OJXBIPH2XQJJEA2NYBRSCQHLHZR
X-Message-ID-Hash: JBUD7OJXBIPH2XQJJEA2NYBRSCQHLHZR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JBUD7OJXBIPH2XQJJEA2NYBRSCQHLHZR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As PCM ack callback may handle the XRUN situation gracefully now,
change the indirect PCM helpers to give a proper error (-EPIPE).
Also, change the pointer callback helpers to deal with the XRUN error
properly, too.

This requires the PCM core change by the commit 8c721c53dda5
("ALSA: usb-audio: Fix recursive locking at XRUN during syncing").

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm-indirect.h | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/sound/pcm-indirect.h b/include/sound/pcm-indirect.h
index 04127686e8d0..98e06ea73b2b 100644
--- a/include/sound/pcm-indirect.h
+++ b/include/sound/pcm-indirect.h
@@ -44,7 +44,7 @@ snd_pcm_indirect_playback_transfer(struct snd_pcm_substream *substream,
 		if (diff < -(snd_pcm_sframes_t) (runtime->boundary / 2))
 			diff += runtime->boundary;
 		if (diff < 0)
-			return -EINVAL;
+			return -EPIPE;
 		rec->sw_ready += (int)frames_to_bytes(runtime, diff);
 		rec->appl_ptr = appl_ptr;
 	}
@@ -83,6 +83,8 @@ snd_pcm_indirect_playback_pointer(struct snd_pcm_substream *substream,
 				  struct snd_pcm_indirect *rec, unsigned int ptr)
 {
 	int bytes = ptr - rec->hw_io;
+	int err;
+
 	if (bytes < 0)
 		bytes += rec->hw_buffer_size;
 	rec->hw_io = ptr;
@@ -90,8 +92,11 @@ snd_pcm_indirect_playback_pointer(struct snd_pcm_substream *substream,
 	rec->sw_io += bytes;
 	if (rec->sw_io >= rec->sw_buffer_size)
 		rec->sw_io -= rec->sw_buffer_size;
-	if (substream->ops->ack)
-		substream->ops->ack(substream);
+	if (substream->ops->ack) {
+		err = substream->ops->ack(substream);
+		if (err == -EPIPE)
+			return SNDRV_PCM_POS_XRUN;
+	}
 	return bytes_to_frames(substream->runtime, rec->sw_io);
 }
 
@@ -112,7 +117,7 @@ snd_pcm_indirect_capture_transfer(struct snd_pcm_substream *substream,
 		if (diff < -(snd_pcm_sframes_t) (runtime->boundary / 2))
 			diff += runtime->boundary;
 		if (diff < 0)
-			return -EINVAL;
+			return -EPIPE;
 		rec->sw_ready -= frames_to_bytes(runtime, diff);
 		rec->appl_ptr = appl_ptr;
 	}
@@ -152,6 +157,8 @@ snd_pcm_indirect_capture_pointer(struct snd_pcm_substream *substream,
 {
 	int qsize;
 	int bytes = ptr - rec->hw_io;
+	int err;
+
 	if (bytes < 0)
 		bytes += rec->hw_buffer_size;
 	rec->hw_io = ptr;
@@ -162,8 +169,11 @@ snd_pcm_indirect_capture_pointer(struct snd_pcm_substream *substream,
 	rec->sw_io += bytes;
 	if (rec->sw_io >= rec->sw_buffer_size)
 		rec->sw_io -= rec->sw_buffer_size;
-	if (substream->ops->ack)
-		substream->ops->ack(substream);
+	if (substream->ops->ack) {
+		err = substream->ops->ack(substream);
+		if (err == -EPIPE)
+			return SNDRV_PCM_POS_XRUN;
+	}
 	return bytes_to_frames(substream->runtime, rec->sw_io);
 }
 
-- 
2.35.3

