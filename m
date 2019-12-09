Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D79116B2B
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:37:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9480D16E5;
	Mon,  9 Dec 2019 11:36:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9480D16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887860;
	bh=sAfa8KQbZFYoKuJykNZ/4vpu21Lk/cxk06XKcnkWOoI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=btw8hjCCYHFI0D8nd5Dief7mVE770FcQgdXHhlIai+teKcweMMlhsvQCj96SuyBez
	 F+8ZvtgeEiXZIOYyybuTOfC1HKalB6YDTy2mcl99fCvjVQIvJYKqUyMiBWaEAz22hH
	 uKf4DEOzWCEdayB5PTwWze9FcsdOUPx2Y+7kljBY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5511CF805EC;
	Mon,  9 Dec 2019 10:52:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BAD9BF80385; Mon,  9 Dec 2019 10:51:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9E31AF802C2
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E31AF802C2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA422B2D5
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:23 +0100
Message-Id: <20191209094943.14984-52-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 51/71] ALSA: rme32: Use managed buffer
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
The hw_free callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/rme32.c | 35 +++++++----------------------------
 1 file changed, 7 insertions(+), 28 deletions(-)

diff --git a/sound/pci/rme32.c b/sound/pci/rme32.c
index 58a4b8df25d4..aab47e5d96dc 100644
--- a/sound/pci/rme32.c
+++ b/sound/pci/rme32.c
@@ -662,11 +662,7 @@ snd_rme32_playback_hw_params(struct snd_pcm_substream *substream,
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	if (rme32->fullduplex_mode) {
-		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-		if (err < 0)
-			return err;
-	} else {
+	if (!rme32->fullduplex_mode) {
 		runtime->dma_area = (void __force *)(rme32->iobase +
 						     RME32_IO_DATA_BUFFER);
 		runtime->dma_addr = rme32->port + RME32_IO_DATA_BUFFER;
@@ -717,11 +713,7 @@ snd_rme32_capture_hw_params(struct snd_pcm_substream *substream,
 	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
-	if (rme32->fullduplex_mode) {
-		err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-		if (err < 0)
-			return err;
-	} else {
+	if (!rme32->fullduplex_mode) {
 		runtime->dma_area = (void __force *)rme32->iobase +
 					RME32_IO_DATA_BUFFER;
 		runtime->dma_addr = rme32->port + RME32_IO_DATA_BUFFER;
@@ -771,14 +763,6 @@ snd_rme32_capture_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_rme32_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	struct rme32 *rme32 = snd_pcm_substream_chip(substream);
-	if (! rme32->fullduplex_mode)
-		return 0;
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static void snd_rme32_pcm_start(struct rme32 * rme32, int from_pause)
 {
 	if (!from_pause) {
@@ -1195,7 +1179,6 @@ static const struct snd_pcm_ops snd_rme32_playback_spdif_ops = {
 	.close =	snd_rme32_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
-	.hw_free =	snd_rme32_pcm_hw_free,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_playback_pointer,
@@ -1210,7 +1193,6 @@ static const struct snd_pcm_ops snd_rme32_capture_spdif_ops = {
 	.close =	snd_rme32_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
-	.hw_free =	snd_rme32_pcm_hw_free,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_capture_pointer,
@@ -1252,7 +1234,6 @@ static const struct snd_pcm_ops snd_rme32_playback_spdif_fd_ops = {
 	.close =	snd_rme32_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_playback_hw_params,
-	.hw_free =	snd_rme32_pcm_hw_free,
 	.prepare =	snd_rme32_playback_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_playback_fd_pointer,
@@ -1264,7 +1245,6 @@ static const struct snd_pcm_ops snd_rme32_capture_spdif_fd_ops = {
 	.close =	snd_rme32_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_rme32_capture_hw_params,
-	.hw_free =	snd_rme32_pcm_hw_free,
 	.prepare =	snd_rme32_capture_prepare,
 	.trigger =	snd_rme32_pcm_trigger,
 	.pointer =	snd_rme32_capture_fd_pointer,
@@ -1374,9 +1354,8 @@ static int snd_rme32_create(struct rme32 *rme32)
 				&snd_rme32_playback_spdif_fd_ops);
 		snd_pcm_set_ops(rme32->spdif_pcm, SNDRV_PCM_STREAM_CAPTURE,
 				&snd_rme32_capture_spdif_fd_ops);
-		snd_pcm_lib_preallocate_pages_for_all(rme32->spdif_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-						      NULL,
-						      0, RME32_MID_BUFFER_SIZE);
+		snd_pcm_set_managed_buffer_all(rme32->spdif_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+					       NULL, 0, RME32_MID_BUFFER_SIZE);
 		rme32->spdif_pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
 	} else {
 		snd_pcm_set_ops(rme32->spdif_pcm, SNDRV_PCM_STREAM_PLAYBACK,
@@ -1406,9 +1385,9 @@ static int snd_rme32_create(struct rme32 *rme32)
 					&snd_rme32_playback_adat_fd_ops);
 			snd_pcm_set_ops(rme32->adat_pcm, SNDRV_PCM_STREAM_CAPTURE, 
 					&snd_rme32_capture_adat_fd_ops);
-			snd_pcm_lib_preallocate_pages_for_all(rme32->adat_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-							      NULL,
-							      0, RME32_MID_BUFFER_SIZE);
+			snd_pcm_set_managed_buffer_all(rme32->adat_pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+						       NULL,
+						       0, RME32_MID_BUFFER_SIZE);
 			rme32->adat_pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
 		} else {
 			snd_pcm_set_ops(rme32->adat_pcm, SNDRV_PCM_STREAM_PLAYBACK, 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
