Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7493E3460
	for <lists+alsa-devel@lfdr.de>; Sat,  7 Aug 2021 11:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B00AC16B5;
	Sat,  7 Aug 2021 11:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B00AC16B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628329011;
	bh=yAHRmvW76n2qnKnQfIDsGd4zrK7E1BvV+t8Qnlkb5Yo=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YsF/dJamRHMu0YAY78Tx821RGMuyv/soPg/P2wOoRPuGIGWa/Bt697bs5AqEC2Yv+
	 8iU9Yy0Z4bkmlS5O15Tmi3gTNrCuvZaelnw09I+Iz3WL6GC2pM9kT08HNueFSbErhn
	 OdMLRYiEM61uoYxzFSRLnp4aLeUaPG4/H/T99r9A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B92BF802E8;
	Sat,  7 Aug 2021 11:35:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 79DC8F8027C; Sat,  7 Aug 2021 11:35:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DC6DF8014B
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 11:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DC6DF8014B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="I5BUuc26"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="S8R1cNbL"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F20A71FF3D
 for <alsa-devel@alsa-project.org>; Sat,  7 Aug 2021 09:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1628328913; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rnzt9k0Jv+SzziFauGhDtWBnS/2syywcLWYIg443YAU=;
 b=I5BUuc26Cm0fSIgTKLy86u65SACMrus+xn21eGFba0SkZYlEv43aNzC3rcpvTngX3CS5/4
 0fLHQhCqO7pA2acEtjZFFBiLnYruxbi54Qp72+kpEbLE3HeexViaC929I+FOa3YYbzM6WE
 VnTHyx5LLCuT0lgv89m7lzCPe4s6Y8w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1628328913;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=rnzt9k0Jv+SzziFauGhDtWBnS/2syywcLWYIg443YAU=;
 b=S8R1cNbLB1lEs8Jp+PHsD+JTKg7sAqv9DkXnt3f15sY0CG0rl1QlpFSm45/+NzILNhfpF7
 IDizvVMu1xraS6Cg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id E20ADA3B87;
 Sat,  7 Aug 2021 09:35:13 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: cs46xx: Fix possible mmap breakage
Date: Sat,  7 Aug 2021 11:35:13 +0200
Message-Id: <20210807093513.817-1-tiwai@suse.de>
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

CS46xx driver switches the buffer depending on the number of periods,
and in some cases it switches to the own buffer without updating the
buffer type properly.  This may cause a problem due to the recent
introduced more strict mmap buffer check.

This patch addresses the potential breakage by replacing the buffer
setup with the proper macro.  It also simplifies the source code,
too.

Fixes: c4824ae7db41 ("ALSA: pcm: Fix mmap capability check")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 1e1eb17f8e07..d43927dcd61e 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -1121,9 +1121,7 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 	if (params_periods(hw_params) == CS46XX_FRAGS) {
 		if (runtime->dma_area != cpcm->hw_buf.area)
 			snd_pcm_lib_free_pages(substream);
-		runtime->dma_area = cpcm->hw_buf.area;
-		runtime->dma_addr = cpcm->hw_buf.addr;
-		runtime->dma_bytes = cpcm->hw_buf.bytes;
+		snd_pcm_set_runtime_buffer(substream, &cpcm->hw_buf);
 
 
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
@@ -1143,11 +1141,8 @@ static int snd_cs46xx_playback_hw_params(struct snd_pcm_substream *substream,
 #endif
 
 	} else {
-		if (runtime->dma_area == cpcm->hw_buf.area) {
-			runtime->dma_area = NULL;
-			runtime->dma_addr = 0;
-			runtime->dma_bytes = 0;
-		}
+		if (runtime->dma_area == cpcm->hw_buf.area)
+			snd_pcm_set_runtime_buffer(substream, NULL);
 		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 		if (err < 0) {
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
@@ -1196,9 +1191,7 @@ static int snd_cs46xx_playback_hw_free(struct snd_pcm_substream *substream)
 	if (runtime->dma_area != cpcm->hw_buf.area)
 		snd_pcm_lib_free_pages(substream);
     
-	runtime->dma_area = NULL;
-	runtime->dma_addr = 0;
-	runtime->dma_bytes = 0;
+	snd_pcm_set_runtime_buffer(substream, NULL);
 
 	return 0;
 }
@@ -1287,16 +1280,11 @@ static int snd_cs46xx_capture_hw_params(struct snd_pcm_substream *substream,
 	if (runtime->periods == CS46XX_FRAGS) {
 		if (runtime->dma_area != chip->capt.hw_buf.area)
 			snd_pcm_lib_free_pages(substream);
-		runtime->dma_area = chip->capt.hw_buf.area;
-		runtime->dma_addr = chip->capt.hw_buf.addr;
-		runtime->dma_bytes = chip->capt.hw_buf.bytes;
+		snd_pcm_set_runtime_buffer(substream, &chip->capt.hw_buf);
 		substream->ops = &snd_cs46xx_capture_ops;
 	} else {
-		if (runtime->dma_area == chip->capt.hw_buf.area) {
-			runtime->dma_area = NULL;
-			runtime->dma_addr = 0;
-			runtime->dma_bytes = 0;
-		}
+		if (runtime->dma_area == chip->capt.hw_buf.area)
+			snd_pcm_set_runtime_buffer(substream, NULL);
 		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 		if (err < 0)
 			return err;
@@ -1313,9 +1301,7 @@ static int snd_cs46xx_capture_hw_free(struct snd_pcm_substream *substream)
 
 	if (runtime->dma_area != chip->capt.hw_buf.area)
 		snd_pcm_lib_free_pages(substream);
-	runtime->dma_area = NULL;
-	runtime->dma_addr = 0;
-	runtime->dma_bytes = 0;
+	snd_pcm_set_runtime_buffer(substream, NULL);
 
 	return 0;
 }
-- 
2.26.2

