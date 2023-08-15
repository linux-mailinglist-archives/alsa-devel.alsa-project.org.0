Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 377E577D2F7
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:08:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBB0ADF2;
	Tue, 15 Aug 2023 21:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBB0ADF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126486;
	bh=r6zg+Zlj4TbW2irAkSArgJWLVUMnOil9X5H0olQN/Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dx4dq8LNDOqpBabX/qzBkRsxrg35jIaxe35H+i5LOhSGHiwFqsnY9nez7YD7zwfot
	 P2sA5kfZcEgzW6jnmeAOftVkOiDMuTva0IGgeGeVcxK7H4/AYhZl35XKjgt6dlW2rX
	 KafJZ46sehJ4GUhogGQyL00vLIRXcr5GWiuy7ku4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 43CC1F800EE; Tue, 15 Aug 2023 21:03:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BF367F8064C;
	Tue, 15 Aug 2023 21:03:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68E2EF80630; Tue, 15 Aug 2023 21:02:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A9993F80578
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9993F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=Yi1UMFdy;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=3mOjfjiJ
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D0A121FD68;
	Tue, 15 Aug 2023 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjxBtA0K776P/pHFSLKAptmDdu6ejterm7BFJcjarEE=;
	b=Yi1UMFdy/AKEMCC6k3tZ9C2ebOSUD8giq3eIIVdUwfu6N1MCqz1rEevLwxMQmEEePPnrGp
	6uMNBaTrYJ1MItBmLECev+7NYXAfdcuyl6VuBJBYJvuKVI+H42kKpDye35cVmZbjy+vVqu
	AIVA4qCGRqKAVpJwdGe2dx/eA0hCOZs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jjxBtA0K776P/pHFSLKAptmDdu6ejterm7BFJcjarEE=;
	b=3mOjfjiJV8gEjFikT0niNVAJiS4JgEQMsn09QJ0UEro9pGUCL3AWBJtvN+JByKDT0qDTUc
	1pZwFFWzSK3gH3BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFFCB1390C;
	Tue, 15 Aug 2023 19:01:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iAcAKpzL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 11/25] ALSA: rme96: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:22 +0200
Message-Id: <20230815190136.8987-12-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LOE23HCVFDIGCPJPKATTRWHRWAX4ZIXX
X-Message-ID-Hash: LOE23HCVFDIGCPJPKATTRWHRWAX4ZIXX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LOE23HCVFDIGCPJPKATTRWHRWAX4ZIXX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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

