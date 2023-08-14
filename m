Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C338177B81C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:01:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F6D0DF9;
	Mon, 14 Aug 2023 14:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F6D0DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014485;
	bh=tslXzhlrf3wKiQZgf/PhoqJ+yQfGP/oU15KZoqnJSAg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=V/SQ9ztuyWFD4NkkPhMa01VEG5h2o2/14LFi/agPENPeemRu5jAz+U5EusxFg3qUi
	 wIXXX6Dh8H0BAf5qJmMW7VWOU2hBCmAYeTz7GKlXLxBDYf5PrI8umLq7TWbiDrqYMk
	 K6MW02R4uHp7xYDdmH/od+MWWakkNmHcqFgJ+1CA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D39FF805FD; Mon, 14 Aug 2023 13:57:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C4836F805FC;
	Mon, 14 Aug 2023 13:57:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 74023F80272; Mon, 14 Aug 2023 13:56:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BE34FF80558
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE34FF80558
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=v+gVKG7A;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Atr9xTc9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9D27621997;
	Mon, 14 Aug 2023 11:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj4kVpKPycOnuk0PSnAEX3PBDOqTT9BbDloAvvcIDuk=;
	b=v+gVKG7AHRdXsPrzr5WS4g0zk6aej2YxUQ7W4MmOcYAGn16Tp6ak0xS5OZ4xKZ/pNVVl9a
	nCrPzStbxKKiqV9jmdrHt7PCPopASCZW217X/84AV4A/Tinkgt8R55Fnm+/xP9UEADU8OM
	shIMCqxRq2qjjBdGQb3CoviccpXAcRc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014150;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cj4kVpKPycOnuk0PSnAEX3PBDOqTT9BbDloAvvcIDuk=;
	b=Atr9xTc9QFkEzzPpvkjiqfww7dypbhe9YA41waabl7gEB7OF3DJGm/ADhonEITwQ2DkOm9
	IKGNqVZTXusw1iCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7BC68138EE;
	Mon, 14 Aug 2023 11:55:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id QADpHEYW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:50 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 13/25] ALSA: rme9652: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:11 +0200
Message-Id: <20230814115523.15279-14-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NRTEIKL3G4YCZXB3JFLMTHP6AMKWE3JW
X-Message-ID-Hash: NRTEIKL3G4YCZXB3JFLMTHP6AMKWE3JW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NRTEIKL3G4YCZXB3JFLMTHP6AMKWE3JW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the rme9652 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is inverted from copy_from/to_user().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 46 +++++--------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index e7c320afefe8..fb01d9c4247b 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1844,7 +1844,7 @@ static signed char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
 
 static int snd_rme9652_playback_copy(struct snd_pcm_substream *substream,
 				     int channel, unsigned long pos,
-				     void __user *src, unsigned long count)
+				     struct iov_iter *src, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -1857,30 +1857,14 @@ static int snd_rme9652_playback_copy(struct snd_pcm_substream *substream,
 						       channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_from_user(channel_buf + pos, src, count))
+	if (!copy_from_iter(channel_buf + pos, count, src))
 		return -EFAULT;
 	return 0;
 }
 
-static int snd_rme9652_playback_copy_kernel(struct snd_pcm_substream *substream,
-					    int channel, unsigned long pos,
-					    void *src, unsigned long count)
-{
-	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	signed char *channel_buf;
-
-	channel_buf = rme9652_channel_buffer_location(rme9652,
-						      substream->pstr->stream,
-						      channel);
-	if (snd_BUG_ON(!channel_buf))
-		return -EIO;
-	memcpy(channel_buf + pos, src, count);
-	return 0;
-}
-
 static int snd_rme9652_capture_copy(struct snd_pcm_substream *substream,
 				    int channel, unsigned long pos,
-				    void __user *dst, unsigned long count)
+				    struct iov_iter *dst, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -1893,27 +1877,11 @@ static int snd_rme9652_capture_copy(struct snd_pcm_substream *substream,
 						       channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_to_user(dst, channel_buf + pos, count))
+	if (!copy_to_iter(channel_buf + pos, count, dst))
 		return -EFAULT;
 	return 0;
 }
 
-static int snd_rme9652_capture_copy_kernel(struct snd_pcm_substream *substream,
-					   int channel, unsigned long pos,
-					   void *dst, unsigned long count)
-{
-	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
-	signed char *channel_buf;
-
-	channel_buf = rme9652_channel_buffer_location(rme9652,
-						      substream->pstr->stream,
-						      channel);
-	if (snd_BUG_ON(!channel_buf))
-		return -EIO;
-	memcpy(dst, channel_buf + pos, count);
-	return 0;
-}
-
 static int snd_rme9652_hw_silence(struct snd_pcm_substream *substream,
 				  int channel, unsigned long pos,
 				  unsigned long count)
@@ -2370,8 +2338,7 @@ static const struct snd_pcm_ops snd_rme9652_playback_ops = {
 	.prepare =	snd_rme9652_prepare,
 	.trigger =	snd_rme9652_trigger,
 	.pointer =	snd_rme9652_hw_pointer,
-	.copy_user =	snd_rme9652_playback_copy,
-	.copy_kernel =	snd_rme9652_playback_copy_kernel,
+	.copy =		snd_rme9652_playback_copy,
 	.fill_silence =	snd_rme9652_hw_silence,
 };
 
@@ -2383,8 +2350,7 @@ static const struct snd_pcm_ops snd_rme9652_capture_ops = {
 	.prepare =	snd_rme9652_prepare,
 	.trigger =	snd_rme9652_trigger,
 	.pointer =	snd_rme9652_hw_pointer,
-	.copy_user =	snd_rme9652_capture_copy,
-	.copy_kernel =	snd_rme9652_capture_copy_kernel,
+	.copy =		snd_rme9652_capture_copy,
 };
 
 static int snd_rme9652_create_pcm(struct snd_card *card,
-- 
2.35.3

