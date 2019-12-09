Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C67F9116AEE
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:25:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E2A916F2;
	Mon,  9 Dec 2019 11:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E2A916F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887139;
	bh=RsbrBaU3jMWUkAJI8FlgU3+lpSiPjyIe/t/tDnM7y7o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtDH8m8ot4CHLfcyCg5iJ4vF4XMGkG+wr8orybV/D7/OEL4Sf8YutYqy7pvyUFaor
	 oTo7XhntThs3nCLMDJjGa+TRgEgLEppDgbaC1SFIK6xeyP2iMBjyAtzh6BOJYedG53
	 nHoEb11ZbUudaP5yvTleBya4nQmdVC2YOq6X6MHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CB54F804E1;
	Mon,  9 Dec 2019 10:52:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8EABFF8035E; Mon,  9 Dec 2019 10:50:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81122F8028D
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81122F8028D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B163B2CB
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:09 +0100
Message-Id: <20191209094943.14984-38-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 37/71] ALSA: ens137x: Use managed buffer
	allocation
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ens1370.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/sound/pci/ens1370.c b/sound/pci/ens1370.c
index 0499dc863202..19d8238e130c 100644
--- a/sound/pci/ens1370.c
+++ b/sound/pci/ens1370.c
@@ -856,17 +856,6 @@ static int snd_ensoniq_trigger(struct snd_pcm_substream *substream, int cmd)
  *  PCM part
  */
 
-static int snd_ensoniq_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_ensoniq_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_ensoniq_playback1_prepare(struct snd_pcm_substream *substream)
 {
 	struct ensoniq *ensoniq = snd_pcm_substream_chip(substream);
@@ -1216,8 +1205,6 @@ static const struct snd_pcm_ops snd_ensoniq_playback1_ops = {
 	.open =		snd_ensoniq_playback1_open,
 	.close =	snd_ensoniq_playback1_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ensoniq_hw_params,
-	.hw_free =	snd_ensoniq_hw_free,
 	.prepare =	snd_ensoniq_playback1_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_playback1_pointer,
@@ -1227,8 +1214,6 @@ static const struct snd_pcm_ops snd_ensoniq_playback2_ops = {
 	.open =		snd_ensoniq_playback2_open,
 	.close =	snd_ensoniq_playback2_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ensoniq_hw_params,
-	.hw_free =	snd_ensoniq_hw_free,
 	.prepare =	snd_ensoniq_playback2_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_playback2_pointer,
@@ -1238,8 +1223,6 @@ static const struct snd_pcm_ops snd_ensoniq_capture_ops = {
 	.open =		snd_ensoniq_capture_open,
 	.close =	snd_ensoniq_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ensoniq_hw_params,
-	.hw_free =	snd_ensoniq_hw_free,
 	.prepare =	snd_ensoniq_capture_prepare,
 	.trigger =	snd_ensoniq_trigger,
 	.pointer =	snd_ensoniq_capture_pointer,
@@ -1274,9 +1257,8 @@ static int snd_ensoniq_pcm(struct ensoniq *ensoniq, int device)
 	strcpy(pcm->name, CHIP_NAME " DAC2/ADC");
 	ensoniq->pcm1 = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ensoniq->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ensoniq->pci->dev, 64*1024, 128*1024);
 
 #ifdef CHIP1370
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1307,9 +1289,8 @@ static int snd_ensoniq_pcm2(struct ensoniq *ensoniq, int device)
 	strcpy(pcm->name, CHIP_NAME " DAC1");
 	ensoniq->pcm2 = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &ensoniq->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &ensoniq->pci->dev, 64*1024, 128*1024);
 
 #ifdef CHIP1370
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
