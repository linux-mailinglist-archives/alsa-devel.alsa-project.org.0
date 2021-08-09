Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B8233E40C2
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 09:20:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B59101699;
	Mon,  9 Aug 2021 09:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B59101699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628493624;
	bh=wa3ECvKUvzRj9w+joOQgNMv6KQOSiljDeVGsFBFHiA8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b2K9U/B2O3ZRTGKh2DLaAZ+xmzsxHV7qZ+2MVjX7Okf6oXgerRmE8F8z4Z/M93551
	 Ji9J3pUn7wGR1LiwNCh00iAfafSxKkSIPTRkeC61a/AY4gQxgXUgds+PNO+NtICyus
	 BXagPaPzQgP1/3RwLygD/enx+C3sd5G7ZlJ83eG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42CA5F804D2;
	Mon,  9 Aug 2021 09:18:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B03B6F804C3; Mon,  9 Aug 2021 09:18:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD05F802D2
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD05F802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="uGa673Zw"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="CNxjEfAe"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id C067621F13
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628493510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5U7Bt+xk41x12EP0JD7yjXXTZNenN1t0UmEPtc7YZrA=;
 b=uGa673ZwnbDZkRHO/+5SmM2a1S7/cx8evxUFq1f1ILb7eApqNrviLH3M+kH8bzcxuEmIqT
 23w08Qb24jKX7SIo/7rkwoFKP9t/b4mHZ81UmVTXVsyzL5hn2RjFaWz1InOtbQig7nco6b
 kKiQZOpXkobKYo/u/KfFYeqfNMS0VCY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628493510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5U7Bt+xk41x12EP0JD7yjXXTZNenN1t0UmEPtc7YZrA=;
 b=CNxjEfAec+toS9rnu1NfEllha14VpjOJYRgR6t1kcc50MuOy5NgBV+0obBGUWKmglU999F
 doMUMG1gik/GMaDA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B091CA3B88;
 Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ALSA: pcm: Check mmap capability of runtime dma buffer at
 first
Date: Mon,  9 Aug 2021 09:18:27 +0200
Message-Id: <20210809071829.22238-2-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210809071829.22238-1-tiwai@suse.de>
References: <20210809071829.22238-1-tiwai@suse.de>
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

Currently we check only the substream->dma_buffer as the preset of the
buffer configuration for verifying the availability of mmap.  But a
few drivers rather set up the buffer in the own way without the
standard buffer preallocation using substream->dma_buffer, and they
miss the proper checks.  (Now it's working more or less fine as most
of them are running only on x86).

Actually, they may set up the runtime dma_buffer (referred via
snd_pcm_get_dma_buf()) at the open callback, though.  That is, this
could have been used as the primary source.

This patch changes the hw_support_mmap() function to check the runtime
dma buffer at first.  It's usually NULL with the standard buffer
preallocation, and in that case, we continue checking
substream->dma_buffer as fallback.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 71323d807dbf..dc9fa312fadd 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -243,13 +243,18 @@ int snd_pcm_info_user(struct snd_pcm_substream *substream,
 
 static bool hw_support_mmap(struct snd_pcm_substream *substream)
 {
+	struct snd_dma_buffer *dmabuf;
+
 	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
 		return false;
 
 	if (substream->ops->mmap || substream->ops->page)
 		return true;
 
-	switch (substream->dma_buffer.dev.type) {
+	dmabuf = snd_pcm_get_dma_buf(substream);
+	if (!dmabuf)
+		dmabuf = &substream->dma_buffer;
+	switch (dmabuf->dev.type) {
 	case SNDRV_DMA_TYPE_UNKNOWN:
 		/* we can't know the device, so just assume that the driver does
 		 * everything right
@@ -259,7 +264,7 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
 	case SNDRV_DMA_TYPE_VMALLOC:
 		return true;
 	default:
-		return dma_can_mmap(substream->dma_buffer.dev.dev);
+		return dma_can_mmap(dmabuf->dev.dev);
 	}
 }
 
-- 
2.26.2

