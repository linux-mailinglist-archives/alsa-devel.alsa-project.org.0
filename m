Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF12A116A98
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:11:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 317971669;
	Mon,  9 Dec 2019 11:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 317971669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886264;
	bh=iryZn+3PM9JzSmwrLsCb9OO73afRIzaANN4yv3lKsz4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qOHqoNQJ+qzqmu06V2BNoAInNmY6SGoI0I6TheHlo2KPeprh3/6yZXzrx/D0RtmyT
	 9Rz3Jgb0vqe1XMBUxhJcJga3kK2xjdfGUKpfL8ib25qUMDk6TvzudNbuCQ1C/298iN
	 bEFR3FFoKLDdWY/ujHqX6I3K5JXm0FY0hlztSXU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76720F8023F;
	Mon,  9 Dec 2019 10:51:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC99F80343; Mon,  9 Dec 2019 10:50:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C55AFF8026F
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C55AFF8026F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 544F0B2AE
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:51 +0100
Message-Id: <20191209094943.14984-20-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 19/71] ALSA: ad1889: Use managed buffer
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
 sound/pci/ad1889.c | 24 ++----------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/sound/pci/ad1889.c b/sound/pci/ad1889.c
index 5b6452df8bbd..12c6a7975100 100644
--- a/sound/pci/ad1889.c
+++ b/sound/pci/ad1889.c
@@ -257,20 +257,6 @@ snd_ad1889_ac97_ready(struct snd_ad1889 *chip)
 	return 0;
 }
 
-static int 
-snd_ad1889_hw_params(struct snd_pcm_substream *substream,
-			struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, 
-					params_buffer_bytes(hw_params));
-}
-
-static int
-snd_ad1889_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static const struct snd_pcm_hardware snd_ad1889_playback_hw = {
 	.info = SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_BLOCK_TRANSFER,
@@ -563,8 +549,6 @@ static const struct snd_pcm_ops snd_ad1889_playback_ops = {
 	.open = snd_ad1889_playback_open,
 	.close = snd_ad1889_playback_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_ad1889_hw_params,
-	.hw_free = snd_ad1889_hw_free,
 	.prepare = snd_ad1889_playback_prepare,
 	.trigger = snd_ad1889_playback_trigger,
 	.pointer = snd_ad1889_playback_pointer, 
@@ -574,8 +558,6 @@ static const struct snd_pcm_ops snd_ad1889_capture_ops = {
 	.open = snd_ad1889_capture_open,
 	.close = snd_ad1889_capture_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_ad1889_hw_params,
-	.hw_free = snd_ad1889_hw_free,
 	.prepare = snd_ad1889_capture_prepare,
 	.trigger = snd_ad1889_capture_trigger,
 	.pointer = snd_ad1889_capture_pointer, 
@@ -632,10 +614,8 @@ snd_ad1889_pcm_init(struct snd_ad1889 *chip, int device)
 	chip->psubs = NULL;
 	chip->csubs = NULL;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      BUFFER_BYTES_MAX / 2,
-					      BUFFER_BYTES_MAX);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
+				       BUFFER_BYTES_MAX / 2, BUFFER_BYTES_MAX);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
