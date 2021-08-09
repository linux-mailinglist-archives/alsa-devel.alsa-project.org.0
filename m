Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B92793E4733
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 16:06:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184DC1658;
	Mon,  9 Aug 2021 16:05:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184DC1658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628518007;
	bh=a9m8q4KM29cZPPVTDfeGuDWYpK3TSiM7MCbi/px/ypk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vC/8y0vYxm9ei4ZcP5CNX6avASzXi5Gmgk6SZVf1ZXvL+2ab7jFn4wNP1XUY6DS8w
	 9MDAuLsGTn4+wmXEkMvSmhO2d2abtw49rbRhm1jEdM9q5ujCkyp1j8aA/HNOg4lkQ/
	 LmPTrN/0NggQZCvToy2qpSY1ixY+KSJIN6g/+vgM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF5B7F800CB;
	Mon,  9 Aug 2021 16:05:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C546AF804B0; Mon,  9 Aug 2021 16:05:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F986F800CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 16:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F986F800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="MGCJEC8C"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="G60BjBfU"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id DF07E21F73
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 14:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628517933; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0wFjtOO07VHTG08+v4kp6dNk+c1ti0IlwF+6rMt8/fU=;
 b=MGCJEC8Ck+YIjy9hMjgpytXNGKZKPjDTL3Scn+NuIPUAjWKJ6kE/ejFULyD8P6EXp0i6BQ
 QKKE/u5+AveCfbCh/p3fhlrEVP3kjOg9jYdBgqz8LISIzkYvGy/sDCA/xHnO+E8BTdC3AH
 +1ssQhxKKxxKjlyeOP4rXK3ssuOKRWA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628517933;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=0wFjtOO07VHTG08+v4kp6dNk+c1ti0IlwF+6rMt8/fU=;
 b=G60BjBfUb5UQ5mujoK2xkQWBeUUDf0pXtSDO7Kc4jz8itTe7vQjGE7O4Z2JRurk17XOBxm
 TN8PTO/t+ruMOpDg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id CE273A3B8B;
 Mon,  9 Aug 2021 14:05:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ALSA: msnd: Use proper mmap method
Date: Mon,  9 Aug 2021 16:05:32 +0200
Message-Id: <20210809140532.11006-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The old ISA MSND driver basically maps the iomem as the DMA buffer.
For this type of buffer, we have already the standard mmap helper,
snd_pcm_lib_mmap_iomem().  Correct the PCM info, set the DMA address
and use the standard helper for handling the mmap on all architectures
properly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/msnd/msnd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/isa/msnd/msnd.c b/sound/isa/msnd/msnd.c
index 4fbc22a5bc5a..c3fd1eb301bb 100644
--- a/sound/isa/msnd/msnd.c
+++ b/sound/isa/msnd/msnd.c
@@ -425,7 +425,7 @@ static void snd_msnd_capture_reset_queue(struct snd_msnd *chip,
 }
 
 static const struct snd_pcm_hardware snd_msnd_playback = {
-	.info =			SNDRV_PCM_INFO_MMAP |
+	.info =			SNDRV_PCM_INFO_MMAP_IOMEM |
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_BATCH,
@@ -444,7 +444,7 @@ static const struct snd_pcm_hardware snd_msnd_playback = {
 };
 
 static const struct snd_pcm_hardware snd_msnd_capture = {
-	.info =			SNDRV_PCM_INFO_MMAP |
+	.info =			SNDRV_PCM_INFO_MMAP_IOMEM |
 				SNDRV_PCM_INFO_INTERLEAVED |
 				SNDRV_PCM_INFO_MMAP_VALID |
 				SNDRV_PCM_INFO_BATCH,
@@ -473,6 +473,7 @@ static int snd_msnd_playback_open(struct snd_pcm_substream *substream)
 	snd_msnd_enable_irq(chip);
 
 	runtime->dma_area = (__force void *)chip->mappedbase;
+	runtime->dma_addr = chip->base;
 	runtime->dma_bytes = 0x3000;
 
 	chip->playback_substream = substream;
@@ -566,6 +567,7 @@ static const struct snd_pcm_ops snd_msnd_playback_ops = {
 	.prepare =	snd_msnd_playback_prepare,
 	.trigger =	snd_msnd_playback_trigger,
 	.pointer =	snd_msnd_playback_pointer,
+	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
 static int snd_msnd_capture_open(struct snd_pcm_substream *substream)
@@ -576,6 +578,7 @@ static int snd_msnd_capture_open(struct snd_pcm_substream *substream)
 	set_bit(F_AUDIO_READ_INUSE, &chip->flags);
 	snd_msnd_enable_irq(chip);
 	runtime->dma_area = (__force void *)chip->mappedbase + 0x3000;
+	runtime->dma_addr = chip->base + 0x3000;
 	runtime->dma_bytes = 0x3000;
 	memset(runtime->dma_area, 0, runtime->dma_bytes);
 	chip->capture_substream = substream;
@@ -662,6 +665,7 @@ static const struct snd_pcm_ops snd_msnd_capture_ops = {
 	.prepare =	snd_msnd_capture_prepare,
 	.trigger =	snd_msnd_capture_trigger,
 	.pointer =	snd_msnd_capture_pointer,
+	.mmap =		snd_pcm_lib_mmap_iomem,
 };
 
 
-- 
2.26.2

