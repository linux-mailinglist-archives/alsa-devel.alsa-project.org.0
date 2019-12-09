Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 547BC116B38
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:39:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D92B81701;
	Mon,  9 Dec 2019 11:38:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D92B81701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887979;
	bh=1tmQyCar1HlXMa0lWg5fAnOpH1DaueVHq2TotXRluFY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F9AmKb/1Gn775e0SlfHnvM6nY+wc4hE6UJk99ZYqXoy7a45tzUee4ZjR+uTfMcO72
	 XuwFXePHppRHHnNwF869Bypee5lWmxYI7/NsClLMPjxPpd5N8gOou2Fm83h2uch/p7
	 VjvCkrHnkd61IGcIJhdvzpjb6nzE7K1ORvWyh0+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 970E0F805FA;
	Mon,  9 Dec 2019 10:52:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE542F80392; Mon,  9 Dec 2019 10:51:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA393F802D2
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA393F802D2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5B14AB2DF
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:31 +0100
Message-Id: <20191209094943.14984-60-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 59/71] ALSA: ps3: Use managed buffer
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
 sound/ppc/snd_ps3.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index c213eb7ca23c..c6c004958e6f 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -535,22 +535,6 @@ static int snd_ps3_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 };
 
-static int snd_ps3_pcm_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
-{
-	size_t size;
-
-	/* alloc transport buffer */
-	size = params_buffer_bytes(hw_params);
-	snd_pcm_lib_malloc_pages(substream, size);
-	return 0;
-};
-
-static int snd_ps3_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-};
-
 static int snd_ps3_delay_to_bytes(struct snd_pcm_substream *substream,
 				  unsigned int delay_ms)
 {
@@ -759,8 +743,6 @@ static const struct snd_pcm_ops snd_ps3_pcm_spdif_ops = {
 	.open = snd_ps3_pcm_open,
 	.close = snd_ps3_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_ps3_pcm_hw_params,
-	.hw_free = snd_ps3_pcm_hw_free,
 	.prepare = snd_ps3_pcm_prepare,
 	.trigger = snd_ps3_pcm_trigger,
 	.pointer = snd_ps3_pcm_pointer,
@@ -1007,11 +989,11 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 
 	the_card.pcm->info_flags = SNDRV_PCM_INFO_NONINTERLEAVED;
 	/* pre-alloc PCM DMA buffer*/
-	snd_pcm_lib_preallocate_pages_for_all(the_card.pcm,
-					SNDRV_DMA_TYPE_DEV,
-					&dev->core,
-					SND_PS3_PCM_PREALLOC_SIZE,
-					SND_PS3_PCM_PREALLOC_SIZE);
+	snd_pcm_set_managed_buffer_all(the_card.pcm,
+				       SNDRV_DMA_TYPE_DEV,
+				       &dev->core,
+				       SND_PS3_PCM_PREALLOC_SIZE,
+				       SND_PS3_PCM_PREALLOC_SIZE);
 
 	/*
 	 * allocate null buffer
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
