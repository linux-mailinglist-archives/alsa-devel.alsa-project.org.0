Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC27D77B80C
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Aug 2023 13:59:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A60A852;
	Mon, 14 Aug 2023 13:58:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A60A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692014344;
	bh=+C2szD6elJThHysQJQkNfLdNkv1SUW91YHwC5NFyFrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OihTs+UGWhX+WWzlI1EOm80QVdxV21HDfjpVNP3XqYUGlzGT2YhGzEpJlLlCchNYe
	 KMGJ2tItSCFjxknVkpqhmpu+j5wgMHfhz7Fa029E8lHe38ftpbPELNBcLQk8JjUZ39
	 vgUX3u3+rUDMZJ6JCFNpeXQUkHT6UyfuKEA1WKxo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1B278F805A0; Mon, 14 Aug 2023 13:57:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0D048F8057E;
	Mon, 14 Aug 2023 13:57:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED45F80579; Mon, 14 Aug 2023 13:56:03 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CC6ECF80549
	for <alsa-devel@alsa-project.org>; Mon, 14 Aug 2023 13:55:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC6ECF80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=q6j8Sq+V;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=tUyIg3Ko
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6D7042199D;
	Mon, 14 Aug 2023 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692014147;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAHJRwwxBIt7oVQ3DFUfAfiPC2QJZm/gnznxANKuWo=;
	b=q6j8Sq+VuyZys5UA0A+j6C5kCPnT4mGjXLFJRxtq/sH3xg9efqGZG+fFwdiDQ4+PDgLI7N
	aUhHS2KD4Mioaeh+AOpVWDjAgFxFFeldZR6aU70n9plwVIZ0AG7sNU209wSnNvBla7JYYo
	ln5D63KYlS0X3EjYd6ZTgXIN00ZdZIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692014147;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cXAHJRwwxBIt7oVQ3DFUfAfiPC2QJZm/gnznxANKuWo=;
	b=tUyIg3Kohe4ZFcN1TosjJxVdIVr2mKiEbLr02YxsFC3rX+gWFswQ1a1mreCDqqRhlSS40b
	YVYI+jOIQnZTGoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4A7EB138EE;
	Mon, 14 Aug 2023 11:55:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id iDj8EEMW2mRnMAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 14 Aug 2023 11:55:47 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 07/25] ALSA: es1938: Convert to generic PCM copy ops
Date: Mon, 14 Aug 2023 13:55:05 +0200
Message-Id: <20230814115523.15279-8-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230814115523.15279-1-tiwai@suse.de>
References: <20230814115523.15279-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PGO6X2ZZCJ5EKQFYRGYKXGOE7LI5PKXD
X-Message-ID-Hash: PGO6X2ZZCJ5EKQFYRGYKXGOE7LI5PKXD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PGO6X2ZZCJ5EKQFYRGYKXGOE7LI5PKXD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the es1938 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_iter() variants in most parts.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is inverted from copy_from/to_user().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 30 +++++-------------------------
 1 file changed, 5 insertions(+), 25 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index e34ec6f89e7e..9e28e9fecd2a 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -824,7 +824,7 @@ static snd_pcm_uframes_t snd_es1938_playback_pointer(struct snd_pcm_substream *s
 
 static int snd_es1938_capture_copy(struct snd_pcm_substream *substream,
 				   int channel, unsigned long pos,
-				   void __user *dst, unsigned long count)
+				   struct iov_iter *dst, unsigned long count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct es1938 *chip = snd_pcm_substream_chip(substream);
@@ -832,36 +832,17 @@ static int snd_es1938_capture_copy(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(pos + count > chip->dma1_size))
 		return -EINVAL;
 	if (pos + count < chip->dma1_size) {
-		if (copy_to_user(dst, runtime->dma_area + pos + 1, count))
+		if (!copy_to_iter(runtime->dma_area + pos + 1, count, dst))
 			return -EFAULT;
 	} else {
-		if (copy_to_user(dst, runtime->dma_area + pos + 1, count - 1))
+		if (!copy_to_iter(runtime->dma_area + pos + 1, count - 1, dst))
 			return -EFAULT;
-		if (put_user(runtime->dma_area[0],
-			     ((unsigned char __user *)dst) + count - 1))
+		if (!copy_to_iter(runtime->dma_area, 1, dst))
 			return -EFAULT;
 	}
 	return 0;
 }
 
-static int snd_es1938_capture_copy_kernel(struct snd_pcm_substream *substream,
-					  int channel, unsigned long pos,
-					  void *dst, unsigned long count)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct es1938 *chip = snd_pcm_substream_chip(substream);
-
-	if (snd_BUG_ON(pos + count > chip->dma1_size))
-		return -EINVAL;
-	if (pos + count < chip->dma1_size) {
-		memcpy(dst, runtime->dma_area + pos + 1, count);
-	} else {
-		memcpy(dst, runtime->dma_area + pos + 1, count - 1);
-		runtime->dma_area[0] = *((unsigned char *)dst + count - 1);
-	}
-	return 0;
-}
-
 /* ----------------------------------------------------------------------
  * Audio1 Capture (ADC)
  * ----------------------------------------------------------------------*/
@@ -987,8 +968,7 @@ static const struct snd_pcm_ops snd_es1938_capture_ops = {
 	.prepare =	snd_es1938_capture_prepare,
 	.trigger =	snd_es1938_capture_trigger,
 	.pointer =	snd_es1938_capture_pointer,
-	.copy_user =	snd_es1938_capture_copy,
-	.copy_kernel =	snd_es1938_capture_copy_kernel,
+	.copy =		snd_es1938_capture_copy,
 };
 
 static int snd_es1938_new_pcm(struct es1938 *chip, int device)
-- 
2.35.3

