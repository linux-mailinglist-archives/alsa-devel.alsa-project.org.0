Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF92B116A8E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A04674C;
	Mon,  9 Dec 2019 11:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A04674C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886106;
	bh=oRurn+h8y+TFJ5ZTRH6T2Z97uhpwT4sN6QNrh8RrwdI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UovPShd1f5egcdMzPn0vVxYsjP0gorQ28r1B7zD96ltpofqVIZen1pGe3eUajuuy2
	 CamQR5kHfdxzrhx9lOAGUK0yzTyCHOoS54kRPvVqb/cLw1TZmFPFq7rb8THNV+T9Ft
	 5MVsDQAnl1VbmBRzy6oWv+mxQwP8i0iP+sVVQf1U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FE03F80392;
	Mon,  9 Dec 2019 10:51:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E03EF80345; Mon,  9 Dec 2019 10:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B758BF8026A
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B758BF8026A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 37A5DB2AC
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:49 +0100
Message-Id: <20191209094943.14984-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 17/71] ALSA: mips: Use managed buffer
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
 sound/mips/hal2.c       | 25 ++-----------------------
 sound/mips/sgio2audio.c | 20 ++------------------
 2 files changed, 4 insertions(+), 41 deletions(-)

diff --git a/sound/mips/hal2.c b/sound/mips/hal2.c
index c9e060939708..e80ebe521218 100644
--- a/sound/mips/hal2.c
+++ b/sound/mips/hal2.c
@@ -505,23 +505,6 @@ static const struct snd_pcm_hardware hal2_pcm_hw = {
 	.periods_max =      1024,
 };
 
-static int hal2_pcm_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *params)
-{
-	int err;
-
-	err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (err < 0)
-		return err;
-
-	return 0;
-}
-
-static int hal2_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int hal2_playback_open(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
@@ -702,8 +685,6 @@ static const struct snd_pcm_ops hal2_playback_ops = {
 	.open =        hal2_playback_open,
 	.close =       hal2_playback_close,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   hal2_pcm_hw_params,
-	.hw_free =     hal2_pcm_hw_free,
 	.prepare =     hal2_playback_prepare,
 	.trigger =     hal2_playback_trigger,
 	.pointer =     hal2_playback_pointer,
@@ -714,8 +695,6 @@ static const struct snd_pcm_ops hal2_capture_ops = {
 	.open =        hal2_capture_open,
 	.close =       hal2_capture_close,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   hal2_pcm_hw_params,
-	.hw_free =     hal2_pcm_hw_free,
 	.prepare =     hal2_capture_prepare,
 	.trigger =     hal2_capture_trigger,
 	.pointer =     hal2_capture_pointer,
@@ -740,8 +719,8 @@ static int hal2_pcm_create(struct snd_hal2 *hal2)
 			&hal2_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 			&hal2_capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-					   NULL, 0, 1024 * 1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, 0, 1024 * 1024);
 
 	return 0;
 }
diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index 9d20ce6118a0..481f5ffff61b 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -577,20 +577,6 @@ static int snd_sgio2audio_pcm_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-
-/* hw_params callback */
-static int snd_sgio2audio_pcm_hw_params(struct snd_pcm_substream *substream,
-					struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-/* hw_free callback */
-static int snd_sgio2audio_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 /* prepare callback */
 static int snd_sgio2audio_pcm_prepare(struct snd_pcm_substream *substream)
 {
@@ -716,8 +702,7 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 			&snd_sgio2audio_playback1_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_sgio2audio_capture_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	/* create second  pcm device with one outputs and no input */
 	err = snd_pcm_new(chip->card, "SGI O2 Audio", 1, 1, 0, &pcm);
@@ -730,8 +715,7 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			&snd_sgio2audio_playback2_ops);
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-					      NULL, 0, 0);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC, NULL, 0, 0);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
