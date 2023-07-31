Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F3F769B2A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 17:49:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF777827;
	Mon, 31 Jul 2023 17:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF777827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690818565;
	bh=KPXZ1ZbXG3BWRVFcLrpr4Mcp3ccSU0mFFwSGrbbkG8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pjwGuILCIMoNJmmApoSFW3UjKHR0TaIWqg2+vRLGjbyTy5xPK++BZftvIFJ0I1P57
	 BedaQUadQ1fRlNeXAPpaLu7zxSgAy7Q4hc+4CjBbeSd9z5nuA2/xs0r57n5ypJ4FGe
	 GXTih1YLOzz0y0wrFCln8tPcDVWwhR0BdLnUadHg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30BC9F805A8; Mon, 31 Jul 2023 17:47:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D823F80580;
	Mon, 31 Jul 2023 17:47:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 961B7F8057E; Mon, 31 Jul 2023 17:47:40 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 11695F8016D
	for <alsa-devel@alsa-project.org>; Mon, 31 Jul 2023 17:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11695F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=KGBKhCUW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=cMmwQfmI
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 87CAB1F86B;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1690818444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocb2iaZLSY/Mo6h70ckS5fI0amTcB8dwyZywSMtbbcw=;
	b=KGBKhCUW+zO2sugXtK2N3bvAtr7ekjBFL7Ydn52fRgrFjmY69PXM0CTpVyZ779tvNVvqgw
	sbK4DX6wwJW7qMOYqkP4ODYRBDKPomVVHVDJlF/BrA5bFEWYtPtq5nEx+yhIYVS5b2kduG
	PHPYQnZ913N8MEz4qKlKj1c22yeQlBw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1690818444;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ocb2iaZLSY/Mo6h70ckS5fI0amTcB8dwyZywSMtbbcw=;
	b=cMmwQfmIAnWW0gOakMX/7ru3CIINo825UMNBSvNh95g0K2gU8RCQkf1qiuFnjs16MgSTXU
	EslNVhbM+XFEUlCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6643D1322C;
	Mon, 31 Jul 2023 15:47:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id aCXdF4zXx2Q3fwAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 31 Jul 2023 15:47:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 06/24] ALSA: es1938: Convert to generic PCM copy ops
Date: Mon, 31 Jul 2023 17:47:00 +0200
Message-Id: <20230731154718.31048-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230731154718.31048-1-tiwai@suse.de>
References: <20230731154718.31048-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AHYOQJLPZTPK4IUP7CZB5T7ABGAR4LPI
X-Message-ID-Hash: AHYOQJLPZTPK4IUP7CZB5T7ABGAR4LPI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AHYOQJLPZTPK4IUP7CZB5T7ABGAR4LPI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch converts the es1938 driver code to use the new unified PCM
copy callback.  It's a straightforward conversion from *_user() to
*_sockptr() variants in most parts.  The only no 1:1 conversion is
put_user() for a byte write, which was replaced with
copy_to_sockptr*(), too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/es1938.c | 31 ++++++-------------------------
 1 file changed, 6 insertions(+), 25 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index e34ec6f89e7e..1fddbca395d0 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -824,7 +824,7 @@ static snd_pcm_uframes_t snd_es1938_playback_pointer(struct snd_pcm_substream *s
 
 static int snd_es1938_capture_copy(struct snd_pcm_substream *substream,
 				   int channel, unsigned long pos,
-				   void __user *dst, unsigned long count)
+				   sockptr_t dst, unsigned long count)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct es1938 *chip = snd_pcm_substream_chip(substream);
@@ -832,36 +832,18 @@ static int snd_es1938_capture_copy(struct snd_pcm_substream *substream,
 	if (snd_BUG_ON(pos + count > chip->dma1_size))
 		return -EINVAL;
 	if (pos + count < chip->dma1_size) {
-		if (copy_to_user(dst, runtime->dma_area + pos + 1, count))
+		if (copy_to_sockptr(dst, runtime->dma_area + pos + 1, count))
 			return -EFAULT;
 	} else {
-		if (copy_to_user(dst, runtime->dma_area + pos + 1, count - 1))
+		if (copy_to_sockptr(dst, runtime->dma_area + pos + 1, count - 1))
 			return -EFAULT;
-		if (put_user(runtime->dma_area[0],
-			     ((unsigned char __user *)dst) + count - 1))
+		if (copy_to_sockptr_offset(dst, count - 1,
+					   runtime->dma_area, 1))
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
@@ -987,8 +969,7 @@ static const struct snd_pcm_ops snd_es1938_capture_ops = {
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

