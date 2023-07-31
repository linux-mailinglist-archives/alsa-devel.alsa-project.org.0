Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E52769B6B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:55:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A609693A;
	Mon, 31 Jul 2023 17:54:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A609693A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818908;
	bh=0F1/IIweBnRzvRe7MBa/nxzJ1sXGdycbTAfWOtRTt7g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WDW1bo0OeVLBC3uFf0o2ZFU5PCpzF0YhdBiyr2qKYjaJf14Iq1QlMmlOTzzH86JRT
	 D9rAT2FRJzS24lud9rsftNDHDJC7oud86ZLfO/0AqNULvvdHphSDYRFecIWgxsRdNF
	 TC7OslQpxe9Fe4znSDeit/u0tqD0Hzb6+o/V87Po=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CB9EF80558; Mon, 31 Jul 2023 17:50:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D75F7F80520;
	Mon, 31 Jul 2023 17:50:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32284F805BD; Mon, 31 Jul 2023 17:49:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1664F80535
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1664F80535
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=yA1h4VU2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+VOTK6T0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C19F1F897;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818445;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MexT8NL+1vwMVjV4cfikcPxrrKoiTFUYYm0OdbGYxVw=;
	b=yA1h4VU2zjrggnrKDO4Oa4lfRry3Pd9X/qyb0TaE8QIK3Euckmmnh636f2Qs48LLeejCsW
	/qVEnYUvDuylZ2kWX27TvS1Me3RyxIvp4yL+kJlZO5T02m1UnE2gIfWIP94lAjbtHux3WW
	NWvfjax+dM/oE3mttbaIEnu65JryikU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818445;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MexT8NL+1vwMVjV4cfikcPxrrKoiTFUYYm0OdbGYxVw=;
	b=+VOTK6T0y/p+TDL4kSFqeGsRdLroK3t8i6za0FZtqYL3zD/NNyUCflmj5EzuvWx/RzSkbF
	azpjU6Z/uuLjx6CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D6031322C;
	Mon, 31 Jul 2023 15:47:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id oCclDo3Xx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:25 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 12/24] ALSA: rme9652: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:06 +0200
Message-Id: <20230731154718.31048-13-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7DKKFRQSYYKKRSFHOG5WGMF54RZ3KQMX
X-Message-ID-Hash: 7DKKFRQSYYKKRSFHOG5WGMF54RZ3KQMX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7DKKFRQSYYKKRSFHOG5WGMF54RZ3KQMX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the rme9652 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/rme9652.c | 46 +++++--------------------------------
 1 file changed, 6 insertions(+), 40 deletions(-)

diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index e7c320afefe8..a1f844799466 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1844,7 +1844,7 @@ static signed char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
 
 static int snd_rme9652_playback_copy(struct snd_pcm_substream *substream,
 				     int channel, unsigned long pos,
-				     void __user *src, unsigned long count)
+				     sockptr_t src, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -1857,30 +1857,14 @@ static int snd_rme9652_playback_copy(struct snd_pcm_substream *substream,
 						       channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_from_user(channel_buf + pos, src, count))
+	if (copy_from_sockptr(channel_buf + pos, src, count))
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
+				    sockptr_t dst, unsigned long count)
 {
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	signed char *channel_buf;
@@ -1893,27 +1877,11 @@ static int snd_rme9652_capture_copy(struct snd_pcm_substream *substream,
 						       channel);
 	if (snd_BUG_ON(!channel_buf))
 		return -EIO;
-	if (copy_to_user(dst, channel_buf + pos, count))
+	if (copy_to_sockptr(dst, channel_buf + pos, count))
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

