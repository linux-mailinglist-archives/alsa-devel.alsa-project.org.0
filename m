Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C4F116AF0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:27:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 003DD166E;
	Mon,  9 Dec 2019 11:26:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 003DD166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887220;
	bh=7r13dP6/RX4n4kl9kBEo6j3Y12Y7hiNl8HLCHNmRLVM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaOzXCCZ6FpVgsIgWN/k4MsmkdwPROHzRVQkye/Dcz4iccxquIXlaDChIyiOj3xxK
	 84iMVq/Fxa8jDDnzC5hyLH5Uvb3jafKmaMUgF8QLqhIJFFNyPsf5giOtsU6+mtjXsS
	 rouJZMQ3Isp9F6pDhRlMtjlEEXYDffSBpd6KKu/4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C440BF804E4;
	Mon,  9 Dec 2019 10:52:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67FE2F80367; Mon,  9 Dec 2019 10:50:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A08BEF8028F
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A08BEF8028F
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 67252B298
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:11 +0100
Message-Id: <20191209094943.14984-40-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 39/71] ALSA: fm801: Use managed buffer
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
 sound/pci/fm801.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/pci/fm801.c b/sound/pci/fm801.c
index a7f8109acced..707173254c55 100644
--- a/sound/pci/fm801.c
+++ b/sound/pci/fm801.c
@@ -435,17 +435,6 @@ static int snd_fm801_capture_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_fm801_hw_params(struct snd_pcm_substream *substream,
-			       struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_fm801_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_fm801_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct fm801 *chip = snd_pcm_substream_chip(substream);
@@ -685,8 +674,6 @@ static const struct snd_pcm_ops snd_fm801_playback_ops = {
 	.open =		snd_fm801_playback_open,
 	.close =	snd_fm801_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_fm801_hw_params,
-	.hw_free =	snd_fm801_hw_free,
 	.prepare =	snd_fm801_playback_prepare,
 	.trigger =	snd_fm801_playback_trigger,
 	.pointer =	snd_fm801_playback_pointer,
@@ -696,8 +683,6 @@ static const struct snd_pcm_ops snd_fm801_capture_ops = {
 	.open =		snd_fm801_capture_open,
 	.close =	snd_fm801_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_fm801_hw_params,
-	.hw_free =	snd_fm801_hw_free,
 	.prepare =	snd_fm801_capture_prepare,
 	.trigger =	snd_fm801_capture_trigger,
 	.pointer =	snd_fm801_capture_pointer,
@@ -720,9 +705,8 @@ static int snd_fm801_pcm(struct fm801 *chip, int device)
 	strcpy(pcm->name, "FM801");
 	chip->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &pdev->dev,
-					      chip->multichannel ? 128*1024 : 64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, &pdev->dev,
+				       chip->multichannel ? 128*1024 : 64*1024, 128*1024);
 
 	return snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 				     snd_pcm_alt_chmaps,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
