Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB0F116A4A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:55:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE655166C;
	Mon,  9 Dec 2019 10:54:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE655166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885344;
	bh=UzdeI2o6R+IvywT+4W1Q52keXtNdCVlHom60r/0L/uI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZfAn7TKzyUw5u4FJ5j6Ux2gsZsNDi33LxMFOe4WaxmllSbM2wvjmBybVQ3V54/8ct
	 6snktOKlTgRsLAyEGqo0sVaUfNjKtvCfXD8BCVJB8lom4y8b+zw8OPWGWshb/G/44V
	 UMFbnPjKWg1TE4/Eqxcc2XVFlxbn9ex1C9i85F8Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9CD1F80331;
	Mon,  9 Dec 2019 10:50:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4CE33F800C4; Mon,  9 Dec 2019 10:49:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C2465F800C4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2465F800C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7FC34B29D
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:36 +0100
Message-Id: <20191209094943.14984-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 04/71] ALSA: aloop: Use managed buffer
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
The hw_params callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/aloop.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/drivers/aloop.c b/sound/drivers/aloop.c
index 6bb46423f5ae..104fb738cf48 100644
--- a/sound/drivers/aloop.c
+++ b/sound/drivers/aloop.c
@@ -905,12 +905,6 @@ static void loopback_runtime_free(struct snd_pcm_runtime *runtime)
 	kfree(dpcm);
 }
 
-static int loopback_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-}
-
 static int loopback_hw_free(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -920,7 +914,7 @@ static int loopback_hw_free(struct snd_pcm_substream *substream)
 	mutex_lock(&dpcm->loopback->cable_lock);
 	cable->valid &= ~(1 << substream->stream);
 	mutex_unlock(&dpcm->loopback->cable_lock);
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static unsigned int get_cable_index(struct snd_pcm_substream *substream)
@@ -1306,7 +1300,6 @@ static const struct snd_pcm_ops loopback_pcm_ops = {
 	.open =		loopback_open,
 	.close =	loopback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	loopback_hw_params,
 	.hw_free =	loopback_hw_free,
 	.prepare =	loopback_prepare,
 	.trigger =	loopback_trigger,
@@ -1325,8 +1318,7 @@ static int loopback_pcm_new(struct loopback *loopback,
 		return err;
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &loopback_pcm_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &loopback_pcm_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	pcm->private_data = loopback;
 	pcm->info_flags = 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
