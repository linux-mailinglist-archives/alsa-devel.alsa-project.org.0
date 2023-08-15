Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8AB77D305
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 21:10:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A2EFEAD;
	Tue, 15 Aug 2023 21:09:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A2EFEAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692126607;
	bh=pIVBG17tkSiebGHe94MtxJL6iPPGYcICxA79B8vLaFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QjGqLT2XAo1RAhhMOAfdqGZvbxpsW0T1p8n1705YTFOQ7cT6MoY3+GYuHSfVwZJro
	 eeBMVmKyQszu+jm0MBfYD8Y72ahDkDc2ohRYRr1eIXmBMrdSn+zoAkskcwZaIL1Hhb
	 cGCSiShabbZVKAd/xFpaLW9P8WuOUxH8jTFayDk0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CF17F805C4; Tue, 15 Aug 2023 21:04:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 69FF5F805AF;
	Tue, 15 Aug 2023 21:04:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 32BFAF805A0; Tue, 15 Aug 2023 21:04:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E22BCF801EB
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 21:01:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E22BCF801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G0Y7LAV+;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HLLejty9
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 611801FD65;
	Tue, 15 Aug 2023 19:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692126108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASUwd958P5x/mva8ZR+pltrHluFd6nJ8P9qOx6QddwI=;
	b=G0Y7LAV+S/FgM6AOhM28ndSn1Qz3m7uVuVFDSbKieVTcR+i0Mgln7Tildr8GVW2dRnYea2
	Q7PqSk779EFanAiaaUKcbdFTK0n1ZKcCzvWrj3AOFavqc0D3i225Th3kEuSMqA3v/Khoyu
	hzYZK+xJFx2pO1BNf2nVOll1pWAjOIk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692126108;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASUwd958P5x/mva8ZR+pltrHluFd6nJ8P9qOx6QddwI=;
	b=HLLejty9AB+8i7AzQ7TON8xut8eQQx3L3eywPI6mKjJjcUDu0TsqB/Nb8vA9tiGP6Q6iJY
	8ijncOpftX7onaBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 431601353E;
	Tue, 15 Aug 2023 19:01:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 0DGZD5zL22QTVAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 15 Aug 2023 19:01:48 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>
Subject: [PATCH v2 08/25] ALSA: korg1212: Convert to generic PCM copy ops
Date: Tue, 15 Aug 2023 21:01:19 +0200
Message-Id: <20230815190136.8987-9-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230815190136.8987-1-tiwai@suse.de>
References: <20230815190136.8987-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QMH2WB74AKDAZ24VDRBBISH7QONFIOM6
X-Message-ID-Hash: QMH2WB74AKDAZ24VDRBBISH7QONFIOM6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMH2WB74AKDAZ24VDRBBISH7QONFIOM6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the korg1212 driver code to use the new unified
PCM copy callback.  The open-coded conditional memory copies are
replaced with simpler copy_from/to_iter() calls.

Note that copy_from/to_iter() returns the copied bytes, hence the
error condition is adjusted accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/korg1212/korg1212.c | 50 +++++++++--------------------------
 1 file changed, 12 insertions(+), 38 deletions(-)

diff --git a/sound/pci/korg1212/korg1212.c b/sound/pci/korg1212/korg1212.c
index 33b4f95d65b3..5c2cac201a28 100644
--- a/sound/pci/korg1212/korg1212.c
+++ b/sound/pci/korg1212/korg1212.c
@@ -1285,8 +1285,7 @@ static int snd_korg1212_silence(struct snd_korg1212 *korg1212, int pos, int coun
 }
 
 static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
-				void __user *dst, int pos, int count,
-				bool in_kernel)
+				struct iov_iter *dst, int pos, int count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
         struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1306,24 +1305,20 @@ static int snd_korg1212_copy_to(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) src < (void *) korg1212->recordDataBufsPtr ||
 		     (void *) src > (void *) korg1212->recordDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_to KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
+			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_to KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst->kvec.iov_base, i);
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy((__force void *)dst, src, size);
-		else if (copy_to_user(dst, src, size))
+		if (copy_to_iter(src, size, dst) != size)
 			return -EFAULT;
 		src++;
-		dst += size;
 	}
 
 	return 0;
 }
 
 static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
-				  void __user *src, int pos, int count,
-				  bool in_kernel)
+				  struct iov_iter *src, int pos, int count)
 {
         struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_korg1212 *korg1212 = snd_pcm_substream_chip(substream);
@@ -1345,16 +1340,13 @@ static int snd_korg1212_copy_from(struct snd_pcm_substream *substream,
 #if K1212_DEBUG_LEVEL > 0
 		if ( (void *) dst < (void *) korg1212->playDataBufsPtr ||
 		     (void *) dst > (void *) korg1212->playDataBufsPtr[8].bufferData ) {
-			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_from KERNEL EFAULT, src=%p dst=%p iter=%d\n", src, dst, i);
+			printk(KERN_DEBUG "K1212_DEBUG: snd_korg1212_copy_from KERNEL EFAULT, src=%p dst=%p iter=%d\n", src->kvec.iov_base, dst, i);
 			return -EFAULT;
 		}
 #endif
-		if (in_kernel)
-			memcpy(dst, (__force void *)src, size);
-		else if (copy_from_user(dst, src, size))
+		if (copy_from_iter(dst, size, src) != size)
 			return -EFAULT;
 		dst++;
-		src += size;
 	}
 
 	return 0;
@@ -1642,17 +1634,9 @@ static snd_pcm_uframes_t snd_korg1212_capture_pointer(struct snd_pcm_substream *
 
 static int snd_korg1212_playback_copy(struct snd_pcm_substream *substream,
 				      int channel, unsigned long pos,
-				      void __user *src, unsigned long count)
+				      struct iov_iter *src, unsigned long count)
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
+				     struct iov_iter *dst, unsigned long count)
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

