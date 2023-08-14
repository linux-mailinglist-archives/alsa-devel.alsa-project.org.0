Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226E677B81E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 14:01:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A6BA4E;
	Mon, 14 Aug 2023 14:01:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A6BA4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014516;
	bh=I1cdgVxKie3gunKrwVu1E8i0WZ9iuoxq8NSIvwZHTok=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KL7ymHFn+yRLzu63zbn3NkG/pKCnzM4NVEh7bs7sHhCw3sd9hROJlWAOk/hq5sbu9
	 r8jOgj0MCFRfL+Y0L0ixcof9PJocj4WRoO89ScFEvA323ymWmf8hcoAz7RfMeAgTZP
	 niHYcbkmyglAOeQm+7bBR+MWBLLEH10r4iCj3odw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8310F80290; Mon, 14 Aug 2023 13:57:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF837F8060B;
	Mon, 14 Aug 2023 13:57:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1E45F80272; Mon, 14 Aug 2023 13:56:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C0B9F80552
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C0B9F80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bvGEUTw2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GfwwALyr
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F6FF2199E;
	Mon, 14 Aug 2023 11:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014149;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmpMqv9W8iYfflO8sQaY3lJwfHw1dyMQl8ItqzCOPcc=;
	b=bvGEUTw2CwAiDiv1mgn4AyDtJvCWFDa3fwh51fjpT5Yi/rUSz12wE7/bFx9mRXXK6cpO1t
	z236YYDoriOvfCDEGBigeaFIoT9I1YGec9wIDRtvKjR23/Bl2Wb3d6s8oDSZ9RcvLAP8K/
	PMMJWTu4OzFnQ46w85ppmthkI2TACeA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014149;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KmpMqv9W8iYfflO8sQaY3lJwfHw1dyMQl8ItqzCOPcc=;
	b=GfwwALyrad6hFArGHYPP9TVCTSawZpjZ1OVB2Kr/WdQwh25KElC4La+sY6rJN3iTz61kZJ
	3d7303dUOScDtfBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F2E8B138EE;
	Mon, 14 Aug 2023 11:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2ModOkQW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 10/25] ALSA: rme32: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:08 +0200
Message-Id: <20230814115523.15279-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TT4Z6TN6OSFIGNHAT7GJO3D3NSVMYC56
X-Message-ID-Hash: TT4Z6TN6OSFIGNHAT7GJO3D3NSVMYC56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TT4Z6TN6OSFIGNHAT7GJO3D3NSVMYC56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the rme32 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 50 +++++++++++------------------------------------
 1 file changed, 11 insertions(+), 39 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 9c0ac025e143..02144bbee6d5 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -252,48 +252,24 @@ static int snd_rme32_playback_silence(struct snd_pcm_substream *substream,
 /* copy callback for halfduplex mode */
 static int snd_rme32_playback_copy(struct snd_pcm_substream *substream,
 				   int channel, unsigned long pos,
-				   void __user *src, unsigned long count)
+				   struct iov_iter *src, unsigned long count)
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	if (copy_from_user_toio(rme32->iobase + RME32_IO_DATA_BUFFER + pos,
-				src, count))
-		return -EFAULT;
-	return 0;
-}
-
-static int snd_rme32_playback_copy_kernel(struct snd_pcm_substream *substream,
-					  int channel, unsigned long pos,
-					  void *src, unsigned long count)
-{
-	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
-
-	memcpy_toio(rme32->iobase + RME32_IO_DATA_BUFFER + pos, src, count);
-	return 0;
+	return copy_from_iter_toio(rme32->iobase + RME32_IO_DATA_BUFFER + pos,
+				   src, count);
 }
 
 /* copy callback for halfduplex mode */
 static int snd_rme32_capture_copy(struct snd_pcm_substream *substream,
 				  int channel, unsigned long pos,
-				  void __user *dst, unsigned long count)
+				  struct iov_iter *dst, unsigned long count)
 {
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 
-	if (copy_to_user_fromio(dst,
-			    rme32->iobase + RME32_IO_DATA_BUFFER + pos,
-			    count))
-		return -EFAULT;
-	return 0;
-}
-
-static int snd_rme32_capture_copy_kernel(struct snd_pcm_substream *substream,
-					 int channel, unsigned long pos,
-					 void *dst, unsigned long count)
-{
-	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
-
-	memcpy_fromio(dst, rme32->iobase + RME32_IO_DATA_BUFFER + pos, count);
-	return 0;
+	return copy_to_iter_fromio(dst,
+				   rme32->iobase + RME32_IO_DATA_BUFFER + pos,
+				   count);
 }
 
 /*
@@ -1194,8 +1170,7 @@ static const struct snd_pcm_ops snd_rme32_playback_spdif_ops = {
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_playback_pointer,
-	.copy_user =	snd_rme32_playback_copy,
-	.copy_kernel =	snd_rme32_playback_copy_kernel,
+	.copy =		snd_rme32_playback_copy,
 	.fill_silence =	snd_rme32_playback_silence,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
@@ -1207,8 +1182,7 @@ static const struct snd_pcm_ops snd_rme32_capture_spdif_ops = {
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_capture_pointer,
-	.copy_user =	snd_rme32_capture_copy,
-	.copy_kernel =	snd_rme32_capture_copy_kernel,
+	.copy =		snd_rme32_capture_copy,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
@@ -1219,8 +1193,7 @@ static const struct snd_pcm_ops snd_rme32_playback_adat_ops = {
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_playback_pointer,
-	.copy_user =	snd_rme32_playback_copy,
-	.copy_kernel =	snd_rme32_playback_copy_kernel,
+	.copy =		snd_rme32_playback_copy,
 	.fill_silence =	snd_rme32_playback_silence,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
@@ -1232,8 +1205,7 @@ static const struct snd_pcm_ops snd_rme32_capture_adat_ops = {
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_capture_pointer,
-	.copy_user =	snd_rme32_capture_copy,
-	.copy_kernel =	snd_rme32_capture_copy_kernel,
+	.copy =		snd_rme32_capture_copy,
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
-- 
2.35.3

