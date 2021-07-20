Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C6B3CF6CC
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 11:28:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3CE51670;
	Tue, 20 Jul 2021 11:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3CE51670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626773298;
	bh=xpjM+CWm8NZPh48G63wpwxpB0T/7NA29fjT4tdYQS2k=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ckEm4ELWYnED1igNwwXGxEzgHiU7XUm7gj6/dy0I2oLmvvY0ACO5UBA2QrNJ7ak3e
	 6E/wpY7CSI12wskl6mLeJvC/gjLNKfpZqPjCpkh875d993W3PPr+1Bg7rmPia+0l9o
	 Ob+JQEkJYej3ornjkg8rmFhANiNzfa0Dm5GgQW0Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 465A8F80227;
	Tue, 20 Jul 2021 11:26:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C6C5F80104; Tue, 20 Jul 2021 11:26:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF46F80104
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 11:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF46F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="UD6NcusD"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="rywFjaui"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D3E9D223FB
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 09:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626773201; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KO1zLNs8YpHOxkmyQPfZyJwEux2dIZiQsv+vdxcZvLY=;
 b=UD6NcusDXu31tT+N6z4b5QTu/Y2W3f1pUS0UkR7U3ZNGHDskmBXven0e7zT+uZQ2l22GWw
 5zaO3ggL5hUVghfaa0GgPFwKwFcRpdozr+P/cr4HkOoxcAbsgWdm/x/7s5u4gLP7TcJFO8
 ocOPcp8F9GGSJ3qnb6O/xwwgiHsDglY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626773201;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=KO1zLNs8YpHOxkmyQPfZyJwEux2dIZiQsv+vdxcZvLY=;
 b=rywFjauid5k+nSLy3e/f28b3MNdgY48+eIJ+JHmPWFWvLoyIvjyNJZZoo1KsoZadgpL2tV
 FwwInCi988MSAUCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id C28D0A3B85;
 Tue, 20 Jul 2021 09:26:41 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pcm: Fix mmap capability check
Date: Tue, 20 Jul 2021 11:26:40 +0200
Message-Id: <20210720092640.12338-1-tiwai@suse.de>
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

The hw_support_mmap() doesn't cover all memory allocation types and
might use a wrong device pointer for checking the capability.
Check the all memory allocation types more completely.

Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index c88c4316c417..6919d2943b9d 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -246,12 +246,18 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
 		return false;
 
-	if (substream->ops->mmap ||
-	    (substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV &&
-	     substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV_UC))
+	if (substream->ops->mmap)
 		return true;
 
-	return dma_can_mmap(substream->dma_buffer.dev.dev);
+	switch (substream->dma_buffer.dev.type) {
+	case SNDRV_DMA_TYPE_UNKNOWN:
+		return false;
+	case SNDRV_DMA_TYPE_CONTINUOUS:
+	case SNDRV_DMA_TYPE_VMALLOC:
+		return true;
+	default:
+		return dma_can_mmap(substream->dma_buffer.dev.dev);
+	}
 }
 
 static int constrain_mask_params(struct snd_pcm_substream *substream,
-- 
2.26.2

