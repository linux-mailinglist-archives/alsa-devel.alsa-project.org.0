Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9AD3E40C5
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Aug 2021 09:21:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 075E4168B;
	Mon,  9 Aug 2021 09:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 075E4168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628493673;
	bh=eZz5UE4QDJlouH8ZmReUTtrwGskpOvomdBfa5611i2o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dkrsfmXceliJfYQLNNkhI489r8PnLvBORZy0D+JVYbRZ4dWFR5wcfRJeb4yjf4sQ+
	 81zjfn6HQnXLID353RA0r2yzb3TXE1KZZsB9PokgJGbtDzKa2qpH/dDKYicCQGQZKD
	 38FYSP826RVsLHkWbs7isRsddQOeWQBO4mgqHggc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8F47F804E2;
	Mon,  9 Aug 2021 09:19:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0415DF8032D; Mon,  9 Aug 2021 09:19:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53F1BF8032D
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 09:18:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53F1BF8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="cw1x/iqY"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="lS11xGax"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id CD7C31FD98
 for <alsa-devel@alsa-project.org>; Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628493510; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWMB5noULf116aY9nZ0XBbz/CPmkpXZcNb6ydT2pm5s=;
 b=cw1x/iqYQtTljH0/CJcNLY73DrJApXU/Be9N5TFkPYuzlcub2yfJLs82bgOLp68TG6n6fT
 RbEndEP/LkG6nXr8VphSZj+XKz/LXvHOIRuDr2EMEifm+MQZN+xSLffvCoPxFwo6mgZ7HP
 QqzZDj4MpDY8MtJl4PT7ZyOnK96PNOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628493510;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWMB5noULf116aY9nZ0XBbz/CPmkpXZcNb6ydT2pm5s=;
 b=lS11xGaxhKO6dHeNz3XrnA2MYUzdj78eW/atKYGNRdbFTuUMRqTByZJYQtl5s9QKj+gY/5
 rC5E4UrvJRyEq2BA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id BE04CA3B81;
 Mon,  9 Aug 2021 07:18:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ALSA: pci: rme: Set up buffer type properly
Date: Mon,  9 Aug 2021 09:18:28 +0200
Message-Id: <20210809071829.22238-3-tiwai@suse.de>
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

Although the regression of the mmap was fixed in the recent commit
dc0dc8a73e8e ("ALSA: pcm: Fix mmap breakage without explicit buffer
setup"), RME9652 and HDSP drivers have still potential issues with
their mmap handling.  Namely, they use the default mmap handler
without the standard buffer preallocation, and PCM core wouldn't use
the coherent DMA mapping.  It's practically OK on x86, but on some
exotic architectures, it wouldn't work.

This patch addresses the potential breakage by replacing the buffer
setup with the proper macro.  It also simplifies the source code,
too.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c    | 6 ++----
 sound/pci/rme9652/rme9652.c | 6 ++----
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 982278f8724d..75aa2ea733a5 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -4507,8 +4507,7 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_hdsp_playback_subinfo;
-	runtime->dma_area = hdsp->playback_buffer;
-	runtime->dma_bytes = HDSP_DMA_AREA_BYTES;
+	snd_pcm_set_runtime_buffer(substream, hdsp->playback_dma_buf);
 
 	hdsp->playback_pid = current->pid;
 	hdsp->playback_substream = substream;
@@ -4584,8 +4583,7 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_hdsp_capture_subinfo;
-	runtime->dma_area = hdsp->capture_buffer;
-	runtime->dma_bytes = HDSP_DMA_AREA_BYTES;
+	snd_pcm_set_runtime_buffer(substream, hdsp->capture_dma_buf);
 
 	hdsp->capture_pid = current->pid;
 	hdsp->capture_substream = substream;
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index 45448a97070c..e76f737ac9e8 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -2259,8 +2259,7 @@ static int snd_rme9652_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_rme9652_playback_subinfo;
-	runtime->dma_area = rme9652->playback_buffer;
-	runtime->dma_bytes = RME9652_DMA_AREA_BYTES;
+	snd_pcm_set_runtime_buffer(substream, rme9652->playback_dma_buf);
 
 	if (rme9652->capture_substream == NULL) {
 		rme9652_stop(rme9652);
@@ -2319,8 +2318,7 @@ static int snd_rme9652_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_rme9652_capture_subinfo;
-	runtime->dma_area = rme9652->capture_buffer;
-	runtime->dma_bytes = RME9652_DMA_AREA_BYTES;
+	snd_pcm_set_runtime_buffer(substream, rme9652->capture_dma_buf);
 
 	if (rme9652->playback_substream == NULL) {
 		rme9652_stop(rme9652);
-- 
2.26.2

