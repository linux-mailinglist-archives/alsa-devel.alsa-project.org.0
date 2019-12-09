Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1482116B21
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:35:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CDF16AE;
	Mon,  9 Dec 2019 11:34:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CDF16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887706;
	bh=iVKFuUABqsKpeL34i0GdgvlmVHX3y6olCRj/xLlKy+o=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ey3VA33XAXVURj8Hy8IJ1mo642nZo931mm7uxow2x+td6rRE5/t0OeM2CRoZejSv1
	 zDU9HercVrxH0VsrthOWPtYOi4bb1AcTg5jUHVmD5f0O9KOMRrhTiI3ys15AHWIxnV
	 n/t8jvyUWQffJ160vUb6Hmu4qAhDBoqZpXECNIJI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 67075F805C9;
	Mon,  9 Dec 2019 10:52:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE7B0F802BD; Mon,  9 Dec 2019 10:51:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F208F802BD
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F208F802BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 40237B2DC
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:29 +0100
Message-Id: <20191209094943.14984-58-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 57/71] ALSA: pdaudiocf: Use managed buffer
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
 sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c | 25 +++----------------------
 1 file changed, 3 insertions(+), 22 deletions(-)

diff --git a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
index 067b1c3a3e02..a4be4d1b0f7d 100644
--- a/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
+++ b/sound/pcmcia/pdaudiocf/pdaudiocf_pcm.c
@@ -83,23 +83,6 @@ static int pdacf_pcm_trigger(struct snd_pcm_substream *subs, int cmd)
 	return ret;
 }
 
-/*
- * pdacf_pcm_hw_params - hw_params callback for playback and capture
- */
-static int pdacf_pcm_hw_params(struct snd_pcm_substream *subs,
-				     struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(subs, params_buffer_bytes(hw_params));
-}
-
-/*
- * pdacf_pcm_hw_free - hw_free callback for playback and capture
- */
-static int pdacf_pcm_hw_free(struct snd_pcm_substream *subs)
-{
-	return snd_pcm_lib_free_pages(subs);
-}
-
 /*
  * pdacf_pcm_prepare - prepare callback for playback and capture
  */
@@ -256,8 +239,6 @@ static const struct snd_pcm_ops pdacf_pcm_capture_ops = {
 	.open =		pdacf_pcm_capture_open,
 	.close =	pdacf_pcm_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	pdacf_pcm_hw_params,
-	.hw_free =	pdacf_pcm_hw_free,
 	.prepare =	pdacf_pcm_prepare,
 	.trigger =	pdacf_pcm_trigger,
 	.pointer =	pdacf_pcm_capture_pointer,
@@ -277,9 +258,9 @@ int snd_pdacf_pcm_new(struct snd_pdacf *chip)
 		return err;
 		
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &pdacf_pcm_capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
-					      0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+				       snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
+				       0, 0);
 
 	pcm->private_data = chip;
 	pcm->info_flags = 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
