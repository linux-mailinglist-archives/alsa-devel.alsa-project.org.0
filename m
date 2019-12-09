Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6611F116A82
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:05:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E06351675;
	Mon,  9 Dec 2019 11:04:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E06351675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885950;
	bh=LRG5pOcbe9PZMX1t2+f49K3WUT7uQqbvk2memNJIwDc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kESNtYhQvwUc1TL6nwubnIY3uk56MOshFSxceH0QaDkfYtJNtIh0jsEBG+NQOMf77
	 u7/W0q2O95bzwGUi3csG6IsfxMn3hGE8HjsN9fqcHFetMtDcJtoSeUzk7XmMrcIKgp
	 baaYRQ+nkIv7B734IJ48qe04KMfWUni7y+jFt8p8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68399F802A9;
	Mon,  9 Dec 2019 10:51:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6A0EF8033D; Mon,  9 Dec 2019 10:50:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8183BF80264
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8183BF80264
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6F273B2B4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:53 +0100
Message-Id: <20191209094943.14984-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 21/71] ALSA: als300: Use managed buffer
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
 sound/pci/als300.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/sound/pci/als300.c b/sound/pci/als300.c
index cfbb8cacaaac..0bb5a0fea23a 100644
--- a/sound/pci/als300.c
+++ b/sound/pci/als300.c
@@ -378,7 +378,6 @@ static int snd_als300_playback_close(struct snd_pcm_substream *substream)
 	data = substream->runtime->private_data;
 	kfree(data);
 	chip->playback_substream = NULL;
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -407,22 +406,9 @@ static int snd_als300_capture_close(struct snd_pcm_substream *substream)
 	data = substream->runtime->private_data;
 	kfree(data);
 	chip->capture_substream = NULL;
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
-static int snd_als300_pcm_hw_params(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-static int snd_als300_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_als300_playback_prepare(struct snd_pcm_substream *substream)
 {
 	u32 tmp;
@@ -554,8 +540,6 @@ static const struct snd_pcm_ops snd_als300_playback_ops = {
 	.open =		snd_als300_playback_open,
 	.close =	snd_als300_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_als300_pcm_hw_params,
-	.hw_free =	snd_als300_pcm_hw_free,
 	.prepare =	snd_als300_playback_prepare,
 	.trigger =	snd_als300_trigger,
 	.pointer =	snd_als300_pointer,
@@ -565,8 +549,6 @@ static const struct snd_pcm_ops snd_als300_capture_ops = {
 	.open =		snd_als300_capture_open,
 	.close =	snd_als300_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_als300_pcm_hw_params,
-	.hw_free =	snd_als300_pcm_hw_free,
 	.prepare =	snd_als300_capture_prepare,
 	.trigger =	snd_als300_trigger,
 	.pointer =	snd_als300_pointer,
@@ -591,9 +573,8 @@ static int snd_als300_new_pcm(struct snd_als300 *chip)
 				&snd_als300_capture_ops);
 
 	/* pre-allocation of buffers */
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &chip->pci->dev,
+				       64*1024, 64*1024);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
