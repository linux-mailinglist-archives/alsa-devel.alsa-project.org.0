Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB1F116A37
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:53:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7CD515E0;
	Mon,  9 Dec 2019 10:52:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7CD515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885219;
	bh=exbhED0YWB9u+09jFiZa3x/F4FL6OGdjVci+k9Tl/3k=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pvi9F0HYn7fojjBH1DCx7+bezmavVrdRwR+tQN175O4riJ3bLJ5aWbAgAnlOc+MF8
	 9ZXCJY6jjn6spDj11yGAW0EuP7SeXZ6n93oh5LQcwI3og9vfffKmDKP8crZ3KhckRD
	 wKDG9jgqKDq3F4f6zYmrjz0XhBoLgbCJJ/PjSkBo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAE70F80256;
	Mon,  9 Dec 2019 10:50:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73665F802F7; Mon,  9 Dec 2019 10:49:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF238F80245
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF238F80245
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B2DA5B2A0
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:40 +0100
Message-Id: <20191209094943.14984-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 08/71] ALSA: vx: Use managed buffer
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
 sound/drivers/vx/vx_pcm.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/sound/drivers/vx/vx_pcm.c b/sound/drivers/vx/vx_pcm.c
index f17e0a76c73c..615e8b2b85f6 100644
--- a/sound/drivers/vx/vx_pcm.c
+++ b/sound/drivers/vx/vx_pcm.c
@@ -772,23 +772,6 @@ static snd_pcm_uframes_t vx_pcm_playback_pointer(struct snd_pcm_substream *subs)
 	return pipe->position;
 }
 
-/*
- * vx_pcm_hw_params - hw_params callback for playback and capture
- */
-static int vx_pcm_hw_params(struct snd_pcm_substream *subs,
-				     struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(subs, params_buffer_bytes(hw_params));
-}
-
-/*
- * vx_pcm_hw_free - hw_free callback for playback and capture
- */
-static int vx_pcm_hw_free(struct snd_pcm_substream *subs)
-{
-	return snd_pcm_lib_free_pages(subs);
-}
-
 /*
  * vx_pcm_prepare - prepare callback for playback and capture
  */
@@ -861,8 +844,6 @@ static const struct snd_pcm_ops vx_pcm_playback_ops = {
 	.open =		vx_pcm_playback_open,
 	.close =	vx_pcm_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	vx_pcm_hw_params,
-	.hw_free =	vx_pcm_hw_free,
 	.prepare =	vx_pcm_prepare,
 	.trigger =	vx_pcm_trigger,
 	.pointer =	vx_pcm_playback_pointer,
@@ -1081,8 +1062,6 @@ static const struct snd_pcm_ops vx_pcm_capture_ops = {
 	.open =		vx_pcm_capture_open,
 	.close =	vx_pcm_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	vx_pcm_hw_params,
-	.hw_free =	vx_pcm_hw_free,
 	.prepare =	vx_pcm_prepare,
 	.trigger =	vx_pcm_trigger,
 	.pointer =	vx_pcm_capture_pointer,
@@ -1230,9 +1209,9 @@ int snd_vx_pcm_new(struct vx_core *chip)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &vx_pcm_playback_ops);
 		if (ins)
 			snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &vx_pcm_capture_ops);
-		snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-						      snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
-						      0, 0);
+		snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					       snd_dma_continuous_data(GFP_KERNEL | GFP_DMA32),
+					       0, 0);
 
 		pcm->private_data = chip;
 		pcm->private_free = snd_vx_pcm_free;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
