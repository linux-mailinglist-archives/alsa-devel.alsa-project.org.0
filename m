Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BCD116AFC
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABD8316D1;
	Mon,  9 Dec 2019 11:27:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABD8316D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887299;
	bh=mXnRigxV9aA8n4hi6H75XeqPu6VgRimhsiB9Qtvq7Pc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PjAQf5a2lqmbJiVMtLvnRHhOmrAztN332OT6Pw+L8PAavNcGbSLv+0jQJYY2wi+WP
	 94yvvXR6Hw/Z29OezGq7PhXPKJXjdaMOlB0B9AK7wFZofV6x6sqE94+LQNJN0BmSIq
	 vN+AtWH7xtaLS/bTyDVSZ5w+XyFVrm56u4SZq7Nc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EFB77F80304;
	Mon,  9 Dec 2019 10:52:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C224FF80369; Mon,  9 Dec 2019 10:51:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8219F80292
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8219F80292
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9E575B28D
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:15 +0100
Message-Id: <20191209094943.14984-44-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 43/71] ALSA: intel8x0: Use managed buffer
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

Clean up the drivers with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and got
dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/intel8x0.c  | 11 ++++-------
 sound/pci/intel8x0m.c | 23 ++++-------------------
 2 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
index 12374ba08ca2..b171816e58a8 100644
--- a/sound/pci/intel8x0.c
+++ b/sound/pci/intel8x0.c
@@ -901,9 +901,6 @@ static int snd_intel8x0_hw_params(struct snd_pcm_substream *substream,
 	int dbl = params_rate(hw_params) > 48000;
 	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 	if (ichdev->pcm_open_flag) {
 		snd_ac97_pcm_close(ichdev->pcm);
 		ichdev->pcm_open_flag = 0;
@@ -929,7 +926,7 @@ static int snd_intel8x0_hw_free(struct snd_pcm_substream *substream)
 		snd_ac97_pcm_close(ichdev->pcm);
 		ichdev->pcm_open_flag = 0;
 	}
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static void snd_intel8x0_setup_pcm_out(struct intel8x0 *chip,
@@ -1487,9 +1484,9 @@ static int snd_intel8x0_pcm1(struct intel8x0 *chip, int device,
 		strcpy(pcm->name, chip->card->shortname);
 	chip->pcm[device] = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, intel8x0_dma_type(chip),
-					      &chip->pci->dev,
-					      rec->prealloc_size, rec->prealloc_max_size);
+	snd_pcm_set_managed_buffer_all(pcm, intel8x0_dma_type(chip),
+				       &chip->pci->dev,
+				       rec->prealloc_size, rec->prealloc_max_size);
 
 	if (rec->playback_ops &&
 	    rec->playback_ops->open == snd_intel8x0_playback_open) {
diff --git a/sound/pci/intel8x0m.c b/sound/pci/intel8x0m.c
index a9add5fedfcb..897c989bedd1 100644
--- a/sound/pci/intel8x0m.c
+++ b/sound/pci/intel8x0m.c
@@ -553,17 +553,6 @@ static int snd_intel8x0m_pcm_trigger(struct snd_pcm_substream *substream, int cm
 	return 0;
 }
 
-static int snd_intel8x0m_hw_params(struct snd_pcm_substream *substream,
-				  struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_intel8x0m_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static snd_pcm_uframes_t snd_intel8x0m_pcm_pointer(struct snd_pcm_substream *substream)
 {
 	struct intel8x0m *chip = snd_pcm_substream_chip(substream);
@@ -674,8 +663,6 @@ static const struct snd_pcm_ops snd_intel8x0m_playback_ops = {
 	.open =		snd_intel8x0m_playback_open,
 	.close =	snd_intel8x0m_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_intel8x0m_hw_params,
-	.hw_free =	snd_intel8x0m_hw_free,
 	.prepare =	snd_intel8x0m_pcm_prepare,
 	.trigger =	snd_intel8x0m_pcm_trigger,
 	.pointer =	snd_intel8x0m_pcm_pointer,
@@ -685,8 +672,6 @@ static const struct snd_pcm_ops snd_intel8x0m_capture_ops = {
 	.open =		snd_intel8x0m_capture_open,
 	.close =	snd_intel8x0m_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_intel8x0m_hw_params,
-	.hw_free =	snd_intel8x0m_hw_free,
 	.prepare =	snd_intel8x0m_pcm_prepare,
 	.trigger =	snd_intel8x0m_pcm_trigger,
 	.pointer =	snd_intel8x0m_pcm_pointer,
@@ -733,10 +718,10 @@ static int snd_intel8x0m_pcm1(struct intel8x0m *chip, int device,
 		strcpy(pcm->name, chip->card->shortname);
 	chip->pcm[device] = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      rec->prealloc_size,
-					      rec->prealloc_max_size);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev,
+				       rec->prealloc_size,
+				       rec->prealloc_max_size);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
