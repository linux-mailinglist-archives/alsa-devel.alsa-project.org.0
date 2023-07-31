Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D810C769B6A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:54:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00FDCDEE;
	Mon, 31 Jul 2023 17:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00FDCDEE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818892;
	bh=ksf6dxlcRb7WHbU5QymLlCTWLOjv/oa6+vRrUrzRthg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=omuF6zHqhKgSY3dyjJwIFbBD/I2cGbxlbi9Cc0IfB2qYP59dQHBIn7LB6/7ljvirC
	 Z/F7Jb+ks40NZZS+EwjnZqm/sst7aUN22Z2d7CJL2/Odj2PcdrEERd83+imxMyX2N/
	 MPUljtYmTIt8Tv2FlnN1FEHnbcK2D3WvIYShhF5g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 521B4F805AE; Mon, 31 Jul 2023 17:49:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B8480F80587;
	Mon, 31 Jul 2023 17:49:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17941F80563; Mon, 31 Jul 2023 17:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 946EFF8025A
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 946EFF8025A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=eC90nKFG;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=8dA9JJBx
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C369E221D0;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+UvNpL4/S+CSFIeOjr2onpD1naPGq/p1VZg/xlZgSw=;
	b=eC90nKFGcmXmTeMzd5v6SB7CPhgJ5YLRftTtQCvlm6XD08hkgFCLZYUIlaRQLE1zEblkWi
	qFISVGWOCJUGgtYZiaqhzlxL5P2oQNJX34q1u3MqhPTG2UiwdmBbBO4PzJyN4najrYYFvU
	bhdj395W3rn3atIyeczlXTl0SbVctXw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e+UvNpL4/S+CSFIeOjr2onpD1naPGq/p1VZg/xlZgSw=;
	b=8dA9JJBx/k5CGUCB+Urk++hxfMW4vpcDBOOm6l/JgNgXg33Q88Lwxc1B040sUGNxmEuOqf
	RrYPl2sfCCotHRDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A95331322C;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +BKLKIzXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 08/24] ALSA: nm256: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:02 +0200
Message-Id: <20230731154718.31048-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MYIHVMBRWHALJMGBUGMKWCUH3ARCJ6BS
X-Message-ID-Hash: MYIHVMBRWHALJMGBUGMKWCUH3ARCJ6BS
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the nm256 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/nm256/nm256.c | 42 ++++++-----------------------------------
 1 file changed, 6 insertions(+), 36 deletions(-)

diff --git a/sound/pci/nm256/nm256.c b/sound/pci/nm256/nm256.c
index f99a1e96e923..136fd3fe3005 100644
--- a/sound/pci/nm256/nm256.c
+++ b/sound/pci/nm256/nm256.c
@@ -691,26 +691,12 @@ snd_nm256_playback_silence(struct snd_pcm_substream *substream,
 static int
 snd_nm256_playback_copy(struct snd_pcm_substream *substream,
 			int channel, unsigned long pos,
-			void __user *src, unsigned long count)
+			sockptr_t src, unsigned long count)
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
+	return copy_from_sockptr_toio(s->bufptr + pos, src, count);
 }
 
 /*
@@ -719,26 +705,12 @@ snd_nm256_playback_copy_kernel(struct snd_pcm_substream *substream,
 static int
 snd_nm256_capture_copy(struct snd_pcm_substream *substream,
 		       int channel, unsigned long pos,
-		       void __user *dst, unsigned long count)
+		       sockptr_t dst, unsigned long count)
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
+	return copy_to_sockptr_fromio(dst, s->bufptr + pos, count);
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

