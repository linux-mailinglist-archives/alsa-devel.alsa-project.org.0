Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04DBE77B80D
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 13:59:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FED886;
	Mon, 14 Aug 2023 13:58:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FED886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014353;
	bh=5dfq0o38IpOz9nawJ1TPgk+mfhgt/muSCta6ouUMlqE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lbxI+fIOv6NaDelOc2YXbPf6mSwPfw3RT5cc7K5Pfr+QsIgA4W+P7TtQwJLaoXAay
	 j1/PA1CAdJ+itD9ZsiCAoKozx3t1whKpVcSV3xaH/d64GLSTNjoXKQp95QKggWdDag
	 YXZmmqWbl9kVtKWqwn7VBIUZCOcWBkY6M7nJEw1I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C359CF805AC; Mon, 14 Aug 2023 13:57:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 286D3F8059F;
	Mon, 14 Aug 2023 13:57:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD77DF80578; Mon, 14 Aug 2023 13:56:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 1199DF80551
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1199DF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EgiGXoyf;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=QyhSlt4W
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 902921FD65;
	Mon, 14 Aug 2023 11:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014148;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xJHuvA5gT6n1i0ytgW/H7/p1r9TYXBmYRI/sH4EsE0=;
	b=EgiGXoyfzn5nBXtK41sjcigPXuRYxh+MelfhGukPTbEyJOYt7orpphuweZBBYZajNz9+2K
	FjmYBD62SeffkFxfmFxtATueLao+YCioYqN4Vdu92bOvW8b5QraxjlAZNEpnqbSxlcpwM4
	kNStJQyXCHmWZaiE+UTXunuHAt6Ql1w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014148;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xJHuvA5gT6n1i0ytgW/H7/p1r9TYXBmYRI/sH4EsE0=;
	b=QyhSlt4WQmz2MyW39c/3t1Znk45DBomh6WChw2kq0m6H5nZeAgtQ4shOCTS9VsItf8fonw
	TDCqd3WzCcoqVhBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72D47138EE;
	Mon, 14 Aug 2023 11:55:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aFwqG0QW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/25] ALSA: nm256: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:07 +0200
Message-Id: <20230814115523.15279-10-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RCPJSRMF4OLX535PTTLLESDJV6LM6YJY
X-Message-ID-Hash: RCPJSRMF4OLX535PTTLLESDJV6LM6YJY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RCPJSRMF4OLX535PTTLLESDJV6LM6YJY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the nm256 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 42 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index f99a1e96e923..34f90829e656 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -691,26 +691,12 @@ snd_nm256_playback_silence(struct snd_pcm_substream *substream,
 static int
 snd_nm256_playback_copy(struct snd_pcm_substream *substream,
 			int channel, unsigned long pos,
-			void __user *src, unsigned long count)
+			struct iov_iter *src, unsigned long count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct nm256_stream *s = runtime->private_data;
 
-	if (copy_from_user_toio(s->bufptr + pos, src, count))
-		return -EFAULT;
-	return 0;
-}
-
-static int
-snd_nm256_playback_copy_kernel(struct snd_pcm_substream *substream,
-			       int channel, unsigned long pos,
-			       void *src, unsigned long count)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nm256_stream *s = runtime->private_data;
-
-	memcpy_toio(s->bufptr + pos, src, count);
-	return 0;
+	return copy_from_iter_toio(s->bufptr + pos, src, count);
 }
 
 /*
@@ -719,26 +705,12 @@ snd_nm256_playback_copy_kernel(struct snd_pcm_substream *substream,
 static int
 snd_nm256_capture_copy(struct snd_pcm_substream *substream,
 		       int channel, unsigned long pos,
-		       void __user *dst, unsigned long count)
+		       struct iov_iter *dst, unsigned long count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct nm256_stream *s = runtime->private_data;
 
-	if (copy_to_user_fromio(dst, s->bufptr + pos, count))
-		return -EFAULT;
-	return 0;
-}
-
-static int
-snd_nm256_capture_copy_kernel(struct snd_pcm_substream *substream,
-			      int channel, unsigned long pos,
-			      void *dst, unsigned long count)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct nm256_stream *s = runtime->private_data;
-
-	memcpy_fromio(dst, s->bufptr + pos, count);
-	return 0;
+	return copy_to_iter_fromio(dst, s->bufptr + pos, count);
 }
 
 #endif /* !__i386__ */
@@ -909,8 +881,7 @@ static const struct snd_pcm_ops snd_nm256_playback_ops = {
 	.trigger =	snd_nm256_playback_trigger,
 	.pointer =	snd_nm256_playback_pointer,
 #ifndef __i386__
-	.copy_user =	snd_nm256_playback_copy,
-	.copy_kernel =	snd_nm256_playback_copy_kernel,
+	.copy =		snd_nm256_playback_copy,
 	.fill_silence =	snd_nm256_playback_silence,
 #endif
 	.mmap =		snd_pcm_lib_mmap_iomem,
@@ -924,8 +895,7 @@ static const struct snd_pcm_ops snd_nm256_capture_ops = {
 	.trigger =	snd_nm256_capture_trigger,
 	.pointer =	snd_nm256_capture_pointer,
 #ifndef __i386__
-	.copy_user =	snd_nm256_capture_copy,
-	.copy_kernel =	snd_nm256_capture_copy_kernel,
+	.copy =		snd_nm256_capture_copy,
 #endif
 	.mmap =		snd_pcm_lib_mmap_iomem,
 };
-- 
2.35.3

