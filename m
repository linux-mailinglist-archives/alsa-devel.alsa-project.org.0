Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D06A77B816
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C71F84B;
	Mon, 14 Aug 2023 13:59:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C71F84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014427;
	bh=r6zg+Zlj4TbW2irAkSArgJWLVUMnOil9X5H0olQN/Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iuJP08bKLTpkIDEAimzeGv+9dX9znLyqXVo6YmlDEXq9BF7Z6eFM2QwYXjzPwhCbP
	 GMxuHD3jeD8hmQaVhQ36xE3g2tV3f7ih/D7Ai5iI4R+Rf/2U4T0Kik3eVhRaFfLeEo
	 pdgiW7+S8G1qyry9q7Em0HY8H7+H926t5poFv3m4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCEB9F805C6; Mon, 14 Aug 2023 13:57:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64009F805D5;
	Mon, 14 Aug 2023 13:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB3BCF80290; Mon, 14 Aug 2023 13:56:09 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BB7F1F80557
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7F1F80557
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=MqkYUKC8;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=stzyMsXS
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 99A1E2199F;
	Mon, 14 Aug 2023 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjxBtA0K776P/pHFSLKAptmDdu6ejterm7BFJcjarEE=;
	b=MqkYUKC84WDh0gijsgQg5GT4ops+uhrtNgO+PUaxJh9gTyqfGkVbk6dozpItWX5TRqwaJv
	VbmN5TLs4zrL4yVyWUQaObv3zwmNgudpAEVkqptaFex4Y7PooidF73qC7B5q/9roflRL1c
	j3WZbnoAaLRTQsJWHPc4XEeedRmzRJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjxBtA0K776P/pHFSLKAptmDdu6ejterm7BFJcjarEE=;
	b=stzyMsXS3ZvNbIFzAMJllCGovy9cDi/l5ZyOEvHECSH4fBzWMGMqM9jufjE4jJ4/22eZ9r
	a9Dj6xuIobDxRPCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7AE86138EE;
	Mon, 14 Aug 2023 11:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id IIjvHEUW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:49 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 11/25] ALSA: rme96: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:09 +0200
Message-Id: <20230814115523.15279-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ASAU6BKICRH44OCQN3EKNSQ5UM6A7YIE
X-Message-ID-Hash: ASAU6BKICRH44OCQN3EKNSQ5UM6A7YIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ASAU6BKICRH44OCQN3EKNSQ5UM6A7YIE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the rme96 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme96.c | 42 ++++++++----------------------------------
 1 file changed, 8 insertions(+), 34 deletions(-)

diff --git a/sound/pci/rme96.c b/sound/pci/rme96.c
index bccb7e0d3d11..6b5ffb18197b 100644
--- a/sound/pci/rme96.c
+++ b/sound/pci/rme96.c
@@ -320,48 +320,26 @@ snd_rme96_playback_silence(struct snd_pcm_substream *substream,
 static int
 snd_rme96_playback_copy(struct snd_pcm_substream *substream,
 			int channel, unsigned long pos,
-			void __user *src, unsigned long count)
+			struct iov_iter *src, unsigned long count)
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 
-	return copy_from_user_toio(rme96->iobase + RME96_IO_PLAY_BUFFER + pos,
+	return copy_from_iter_toio(rme96->iobase + RME96_IO_PLAY_BUFFER + pos,
 				   src, count);
 }
 
-static int
-snd_rme96_playback_copy_kernel(struct snd_pcm_substream *substream,
-			       int channel, unsigned long pos,
-			       void *src, unsigned long count)
-{
-	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
-
-	memcpy_toio(rme96->iobase + RME96_IO_PLAY_BUFFER + pos, src, count);
-	return 0;
-}
-
 static int
 snd_rme96_capture_copy(struct snd_pcm_substream *substream,
 		       int channel, unsigned long pos,
-		       void __user *dst, unsigned long count)
+		       struct iov_iter *dst, unsigned long count)
 {
 	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
 
-	return copy_to_user_fromio(dst,
+	return copy_to_iter_fromio(dst,
 				   rme96->iobase + RME96_IO_REC_BUFFER + pos,
 				   count);
 }
 
-static int
-snd_rme96_capture_copy_kernel(struct snd_pcm_substream *substream,
-			      int channel, unsigned long pos,
-			      void *dst, unsigned long count)
-{
-	struct rme96 *rme96 = snd_pcm_substream_chip(substream);
-
-	memcpy_fromio(dst, rme96->iobase + RME96_IO_REC_BUFFER + pos, count);
-	return 0;
-}
-
 /*
  * Digital output capabilities (S/PDIF)
  */
@@ -1518,8 +1496,7 @@ static const struct snd_pcm_ops snd_rme96_playback_spdif_ops = {
 	.prepare =	snd_rme96_playback_prepare,
 	.trigger =	snd_rme96_playback_trigger,
 	.pointer =	snd_rme96_playback_pointer,
-	.copy_user =	snd_rme96_playback_copy,
-	.copy_kernel =	snd_rme96_playback_copy_kernel,
+	.copy =		snd_rme96_playback_copy,
 	.fill_silence =	snd_rme96_playback_silence,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
@@ -1531,8 +1508,7 @@ static const struct snd_pcm_ops snd_rme96_capture_spdif_ops = {
 	.prepare =	snd_rme96_capture_prepare,
 	.trigger =	snd_rme96_capture_trigger,
 	.pointer =	snd_rme96_capture_pointer,
-	.copy_user =	snd_rme96_capture_copy,
-	.copy_kernel =	snd_rme96_capture_copy_kernel,
+	.copy =		snd_rme96_capture_copy,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
@@ -1543,8 +1519,7 @@ static const struct snd_pcm_ops snd_rme96_playback_adat_ops = {
 	.prepare =	snd_rme96_playback_prepare,
 	.trigger =	snd_rme96_playback_trigger,
 	.pointer =	snd_rme96_playback_pointer,
-	.copy_user =	snd_rme96_playback_copy,
-	.copy_kernel =	snd_rme96_playback_copy_kernel,
+	.copy =		snd_rme96_playback_copy,
 	.fill_silence =	snd_rme96_playback_silence,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
@@ -1556,8 +1531,7 @@ static const struct snd_pcm_ops snd_rme96_capture_adat_ops = {
 	.prepare =	snd_rme96_capture_prepare,
 	.trigger =	snd_rme96_capture_trigger,
 	.pointer =	snd_rme96_capture_pointer,
-	.copy_user =	snd_rme96_capture_copy,
-	.copy_kernel =	snd_rme96_capture_copy_kernel,
+	.copy =		snd_rme96_capture_copy,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
-- 
2.35.3

