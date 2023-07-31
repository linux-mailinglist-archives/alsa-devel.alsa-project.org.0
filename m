Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B54769B5B
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:53:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72339851;
	Mon, 31 Jul 2023 17:52:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72339851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818810;
	bh=vPhW6GgPj2Mp2r2Kc/J8f224jR7RKWbcYEGQXOcKYxs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=riTjIieUTK5aOGS2OP7FBiOtYJEfZGSCE6KtHjt8ZmgrFNRaLisuQjJYKPWfDLGCL
	 /WE2wTdaN4N4rjBr7hAepuSUES697KLSxDDlfpcobz8l+277HchrFtUN3M4GqIypGI
	 EI6wCfg8ruRiaGvHdlaNSuilTuk/HySCUPcGbnR4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7A4E1F80620; Mon, 31 Jul 2023 17:48:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24B10F80552;
	Mon, 31 Jul 2023 17:48:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51D09F80617; Mon, 31 Jul 2023 17:48:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D5BE0F80544
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5BE0F80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=1vz1D/Mq;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=vQ/5W8DC
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A505E1F88C;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLu/886+eMoNnKsXPum3ivX7eNp+kDQms6PxS5YteFI=;
	b=1vz1D/MqOM552pnnKV4Qm999gkORwIKYXSozWmVGigTojm6y86yMhdj876nVGRt+RimTVK
	LRYo9WJNK35O9q57k8zae8+5AY9cBfXsU1vvcARXpnL5AGUyIj4nmAPTjqNA8M/rKbMno8
	CTXIWN9/Z4Qi4PWB9rv7UEAcYy+QVIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HLu/886+eMoNnKsXPum3ivX7eNp+kDQms6PxS5YteFI=;
	b=vQ/5W8DCPJB4y8n/TdXr1RLv8lPrmiyOg2wSjnJekWkZz1bB6o9QnVhc8YOubY9do/jFsH
	RwgEWpjRFrhoEJDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A3A3138EE;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id eNLkIIzXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 07/24] ALSA: korg1212: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:01 +0200
Message-Id: <20230731154718.31048-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D4O6YBVQQ35PZJWSVG7BWYXBX65D3UMW
X-Message-ID-Hash: D4O6YBVQQ35PZJWSVG7BWYXBX65D3UMW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D4O6YBVQQ35PZJWSVG7BWYXBX65D3UMW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the korg1212 driver code to use the new unified
PCM copy callback.  The open-coded conditional memory copies are
replaced with simpler copy_from/to_sockptr_offset() calls.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 46 ++++++++---------------------------
 1 file changed, 10 insertions(+), 36 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 33b4f95d65b3..644f8b392c54 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1285,8 +1285,7 @@ static int snd_korg1212_silence(struct snd_korg1212 *korg1212, int pos, int coun
 }
 
 static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
-				void __user *dst, int pos, int count,
-				bool in_kernel)
+				sockptr_t dst, int pos, int count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
         struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1310,20 +1309,16 @@ static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy((__force void *)dst, src, size);
-		else if (copy_to_user(dst, src, size))
+		if (copy_to_sockptr_offset(dst, i * size, src, size))
 			return -EFAULT;
 		src++;
-		dst += size;
 	}
 
 	return 0;
 }
 
 static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
-				  void __user *src, int pos, int count,
-				  bool in_kernel)
+				  sockptr_t src, int pos, int count)
 {
         struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1349,12 +1344,9 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy(dst, (__force void *)src, size);
-		else if (copy_from_user(dst, src, size))
+		if (copy_from_sockptr_offset(dst, src, i * size, size))
 			return -EFAULT;
 		dst++;
-		src += size;
 	}
 
 	return 0;
@@ -1642,17 +1634,9 @@ static snd_pcm_uframes_t snd_korg1212_capture_pointer(struct snd_pcm_substream *
 
 static int snd_korg1212_playback_copy(struct snd_pcm_substream *substream,
 				      int channel, unsigned long pos,
-				      void __user *src, unsigned long count)
+				      sockptr_t src, unsigned long count)
 {
-	return snd_korg1212_copy_from(substream, src, pos, count, false);
-}
-
-static int snd_korg1212_playback_copy_kernel(struct snd_pcm_substream *substream,
-				      int channel, unsigned long pos,
-				      void *src, unsigned long count)
-{
-	return snd_korg1212_copy_from(substream, (void __user *)src,
-				      pos, count, true);
+	return snd_korg1212_copy_from(substream, src, pos, count);
 }
 
 static int snd_korg1212_playback_silence(struct snd_pcm_substream *substream,
@@ -1670,17 +1654,9 @@ static int snd_korg1212_playback_silence(struct snd_pcm_substream *substream,
 
 static int snd_korg1212_capture_copy(struct snd_pcm_substream *substream,
 				     int channel, unsigned long pos,
-				     void __user *dst, unsigned long count)
+				     sockptr_t dst, unsigned long count)
 {
-	return snd_korg1212_copy_to(substream, dst, pos, count, false);
-}
-
-static int snd_korg1212_capture_copy_kernel(struct snd_pcm_substream *substream,
-				     int channel, unsigned long pos,
-				     void *dst, unsigned long count)
-{
-	return snd_korg1212_copy_to(substream, (void __user *)dst,
-				    pos, count, true);
+	return snd_korg1212_copy_to(substream, dst, pos, count);
 }
 
 static const struct snd_pcm_ops snd_korg1212_playback_ops = {
@@ -1691,8 +1667,7 @@ static const struct snd_pcm_ops snd_korg1212_playback_ops = {
         .prepare =	snd_korg1212_prepare,
         .trigger =	snd_korg1212_trigger,
         .pointer =	snd_korg1212_playback_pointer,
-	.copy_user =	snd_korg1212_playback_copy,
-	.copy_kernel =	snd_korg1212_playback_copy_kernel,
+	.copy =		snd_korg1212_playback_copy,
 	.fill_silence =	snd_korg1212_playback_silence,
 };
 
@@ -1704,8 +1679,7 @@ static const struct snd_pcm_ops snd_korg1212_capture_ops = {
 	.prepare =	snd_korg1212_prepare,
 	.trigger =	snd_korg1212_trigger,
 	.pointer =	snd_korg1212_capture_pointer,
-	.copy_user =	snd_korg1212_capture_copy,
-	.copy_kernel =	snd_korg1212_capture_copy_kernel,
+	.copy =		snd_korg1212_capture_copy,
 };
 
 /*
-- 
2.35.3

