Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26CC44974B
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Nov 2021 15:59:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F727165D;
	Mon,  8 Nov 2021 15:58:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F727165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636383561;
	bh=TTXn9PV3pI/D3clAVubM7m55ar5R3N6k31NqaMUVzIg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O/xyZOCgq2fedSLFz2IcW5K9RBDDv8T1u2wrOlFiwvUtOzH6lFUHvbh799X1XMMNM
	 Y73RPWNh6jp+he2H2CV6BCyQoFHIg0c/vjFEHs2S1GaDu9P5lofRh79UGRMYmOJe4F
	 QACjsoT/ZguZi+6linilH9IRukGwSA9c7ECjyY9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C138EF804B1;
	Mon,  8 Nov 2021 15:58:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85B84F8007E; Mon,  8 Nov 2021 15:58:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A6E3F8007E
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 15:57:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A6E3F8007E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="tnrVp+1l"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5MbrxT+Q"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8ABCE1FDBC
 for <alsa-devel@alsa-project.org>; Mon,  8 Nov 2021 14:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636383473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tVmtdW2sDCa6caQKsIZlSfjRb57NePUPljVA5yZB7JY=;
 b=tnrVp+1ljfT7WOF9wIdJIlLIzj/SpbHHCrPc4TJVd5evcxzcrGfN2QGO8ud338cHn0j3sl
 mlfVjicZ3CbU+n3p2dTYB8WYqdvz+cflIbjfi3e7gZcPmy81Udjp7AB1Hadyen/mv2pn2w
 EGvrJX+brKbgq/q/P1USrSET8FToOzM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636383473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=tVmtdW2sDCa6caQKsIZlSfjRb57NePUPljVA5yZB7JY=;
 b=5MbrxT+QyRiZ7EzrRVRIr/RCEzOxaTpwBqY0Kser30wy0k9k1e3xILLv0LhK56Ol3A0ekh
 +dx+HjcqbnBMGFCg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 777F2A3B87;
 Mon,  8 Nov 2021 14:57:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: pci: rme: Fix unaligned buffer addresses
Date: Mon,  8 Nov 2021 15:57:52 +0100
Message-Id: <20211108145752.30572-1-tiwai@suse.de>
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

The recent fix for setting up the DMA buffer type on RME drivers tried
to address the non-standard memory managements and changed the DMA
buffer information to the standard snd_dma_buffer object that is
allocated at the probe time.  However, I overlooked that the RME
drivers handle the buffer addresses based on 64k alignment, and the
previous conversion broke that silently.

This patch is an attempt to fix the regression.  The snd_dma_buffer
objects are copied to the original data with the correction to the
aligned accesses, and those are passed to snd_pcm_set_runtime_buffer()
helpers instead.  The original snd_dma_buffer objects are managed by
devres, hence they'll be released automagically.

Fixes: 0899a7a23047 ("ALSA: pci: rme: Set up buffer type properly")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme9652/hdsp.c    | 41 +++++++++++++++++++++----------------
 sound/pci/rme9652/rme9652.c | 41 +++++++++++++++++++++----------------
 2 files changed, 46 insertions(+), 36 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index 75aa2ea733a5..96c12dfb24cf 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -468,8 +468,11 @@ struct hdsp {
 	unsigned char         ss_out_channels;
 	u32                   io_loopback;          /* output loopback channel states*/
 
-	struct snd_dma_buffer *capture_dma_buf;
-	struct snd_dma_buffer *playback_dma_buf;
+	/* DMA buffers; those are copied instances from the original snd_dma_buf
+	 * objects (which are managed via devres) for the address alignments
+	 */
+	struct snd_dma_buffer capture_dma_buf;
+	struct snd_dma_buffer playback_dma_buf;
 	unsigned char        *capture_buffer;	    /* suitably aligned address */
 	unsigned char        *playback_buffer;	    /* suitably aligned address */
 
@@ -3764,30 +3767,32 @@ static void snd_hdsp_proc_init(struct hdsp *hdsp)
 
 static int snd_hdsp_initialize_memory(struct hdsp *hdsp)
 {
-	unsigned long pb_bus, cb_bus;
+	struct snd_dma_buffer *capture_dma, *playback_dma;
 
-	hdsp->capture_dma_buf =
-		snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
-	hdsp->playback_dma_buf =
-		snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
-	if (!hdsp->capture_dma_buf || !hdsp->playback_dma_buf) {
+	capture_dma = snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
+	playback_dma = snd_hammerfall_get_buffer(hdsp->pci, HDSP_DMA_AREA_BYTES);
+	if (!capture_dma || !playback_dma) {
 		dev_err(hdsp->card->dev,
 			"%s: no buffers available\n", hdsp->card_name);
 		return -ENOMEM;
 	}
 
-	/* Align to bus-space 64K boundary */
+	/* copy to the own data for alignment */
+	hdsp->capture_dma_buf = *capture_dma;
+	hdsp->playback_dma_buf = *playback_dma;
 
-	cb_bus = ALIGN(hdsp->capture_dma_buf->addr, 0x10000ul);
-	pb_bus = ALIGN(hdsp->playback_dma_buf->addr, 0x10000ul);
+	/* Align to bus-space 64K boundary */
+	hdsp->capture_dma_buf.addr = ALIGN(capture_dma->addr, 0x10000ul);
+	hdsp->playback_dma_buf.addr = ALIGN(playback_dma->addr, 0x10000ul);
 
 	/* Tell the card where it is */
+	hdsp_write(hdsp, HDSP_inputBufferAddress, hdsp->capture_dma_buf.addr);
+	hdsp_write(hdsp, HDSP_outputBufferAddress, hdsp->playback_dma_buf.addr);
 
-	hdsp_write(hdsp, HDSP_inputBufferAddress, cb_bus);
-	hdsp_write(hdsp, HDSP_outputBufferAddress, pb_bus);
-
-	hdsp->capture_buffer = hdsp->capture_dma_buf->area + (cb_bus - hdsp->capture_dma_buf->addr);
-	hdsp->playback_buffer = hdsp->playback_dma_buf->area + (pb_bus - hdsp->playback_dma_buf->addr);
+	hdsp->capture_dma_buf.area += hdsp->capture_dma_buf.addr - capture_dma->addr;
+	hdsp->playback_dma_buf.area += hdsp->playback_dma_buf.addr - playback_dma->addr;
+	hdsp->capture_buffer = hdsp->capture_dma_buf.area;
+	hdsp->playback_buffer = hdsp->playback_dma_buf.area;
 
 	return 0;
 }
@@ -4507,7 +4512,7 @@ static int snd_hdsp_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_hdsp_playback_subinfo;
-	snd_pcm_set_runtime_buffer(substream, hdsp->playback_dma_buf);
+	snd_pcm_set_runtime_buffer(substream, &hdsp->playback_dma_buf);
 
 	hdsp->playback_pid = current->pid;
 	hdsp->playback_substream = substream;
@@ -4583,7 +4588,7 @@ static int snd_hdsp_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_hdsp_capture_subinfo;
-	snd_pcm_set_runtime_buffer(substream, hdsp->capture_dma_buf);
+	snd_pcm_set_runtime_buffer(substream, &hdsp->capture_dma_buf);
 
 	hdsp->capture_pid = current->pid;
 	hdsp->capture_substream = substream;
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index e76f737ac9e8..7755e19aa776 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -208,8 +208,11 @@ struct snd_rme9652 {
 	unsigned char ds_channels;
 	unsigned char ss_channels;	/* different for hammerfall/hammerfall-light */
 
-	struct snd_dma_buffer *playback_dma_buf;
-	struct snd_dma_buffer *capture_dma_buf;
+	/* DMA buffers; those are copied instances from the original snd_dma_buf
+	 * objects (which are managed via devres) for the address alignments
+	 */
+	struct snd_dma_buffer playback_dma_buf;
+	struct snd_dma_buffer capture_dma_buf;
 
 	unsigned char *capture_buffer;	/* suitably aligned address */
 	unsigned char *playback_buffer;	/* suitably aligned address */
@@ -1719,30 +1722,32 @@ static void snd_rme9652_card_free(struct snd_card *card)
 
 static int snd_rme9652_initialize_memory(struct snd_rme9652 *rme9652)
 {
-	unsigned long pb_bus, cb_bus;
+	struct snd_dma_buffer *capture_dma, *playback_dma;
 
-	rme9652->capture_dma_buf =
-		snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
-	rme9652->playback_dma_buf =
-		snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
-	if (!rme9652->capture_dma_buf || !rme9652->playback_dma_buf) {
+	capture_dma = snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
+	playback_dma = snd_hammerfall_get_buffer(rme9652->pci, RME9652_DMA_AREA_BYTES);
+	if (!capture_dma || !playback_dma) {
 		dev_err(rme9652->card->dev,
 			"%s: no buffers available\n", rme9652->card_name);
 		return -ENOMEM;
 	}
 
-	/* Align to bus-space 64K boundary */
+	/* copy to the own data for alignment */
+	rme9652->capture_dma_buf = *capture_dma;
+	rme9652->playback_dma_buf = *playback_dma;
 
-	cb_bus = ALIGN(rme9652->capture_dma_buf->addr, 0x10000ul);
-	pb_bus = ALIGN(rme9652->playback_dma_buf->addr, 0x10000ul);
+	/* Align to bus-space 64K boundary */
+	rme9652->capture_dma_buf.addr = ALIGN(capture_dma->addr, 0x10000ul);
+	rme9652->playback_dma_buf.addr = ALIGN(playback_dma->addr, 0x10000ul);
 
 	/* Tell the card where it is */
+	rme9652_write(rme9652, RME9652_rec_buffer, rme9652->capture_dma_buf.addr);
+	rme9652_write(rme9652, RME9652_play_buffer, rme9652->playback_dma_buf.addr);
 
-	rme9652_write(rme9652, RME9652_rec_buffer, cb_bus);
-	rme9652_write(rme9652, RME9652_play_buffer, pb_bus);
-
-	rme9652->capture_buffer = rme9652->capture_dma_buf->area + (cb_bus - rme9652->capture_dma_buf->addr);
-	rme9652->playback_buffer = rme9652->playback_dma_buf->area + (pb_bus - rme9652->playback_dma_buf->addr);
+	rme9652->capture_dma_buf.area += rme9652->capture_dma_buf.addr - capture_dma->addr;
+	rme9652->playback_dma_buf.area += rme9652->playback_dma_buf.addr - playback_dma->addr;
+	rme9652->capture_buffer = rme9652->capture_dma_buf.area;
+	rme9652->playback_buffer = rme9652->playback_dma_buf.area;
 
 	return 0;
 }
@@ -2259,7 +2264,7 @@ static int snd_rme9652_playback_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
         runtime->hw = snd_rme9652_playback_subinfo;
-	snd_pcm_set_runtime_buffer(substream, rme9652->playback_dma_buf);
+	snd_pcm_set_runtime_buffer(substream, &rme9652->playback_dma_buf);
 
 	if (rme9652->capture_substream == NULL) {
 		rme9652_stop(rme9652);
@@ -2318,7 +2323,7 @@ static int snd_rme9652_capture_open(struct snd_pcm_substream *substream)
 	snd_pcm_set_sync(substream);
 
 	runtime->hw = snd_rme9652_capture_subinfo;
-	snd_pcm_set_runtime_buffer(substream, rme9652->capture_dma_buf);
+	snd_pcm_set_runtime_buffer(substream, &rme9652->capture_dma_buf);
 
 	if (rme9652->playback_substream == NULL) {
 		rme9652_stop(rme9652);
-- 
2.31.1

