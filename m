Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1626A116A50
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:58:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A81121674;
	Mon,  9 Dec 2019 10:57:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A81121674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885504;
	bh=xfY6crhVOl322YR7vscNeKhI7Sd7vJXuL/r6nEi0BUE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p18vf16uTuLu4/as1FucZE/IqCZu+QInpLUHyUOdpPE7NEM0vldNXuT1NiIrKNIeD
	 LSuEgHZqu6sYYypeGs3J3a+r9hBqKuo3o+W6WrMvO0O5ele6k1Xq1OMB4j+/LE5gDc
	 A2iBvowM2V10o+MJ+OoKP5cRJ++OZEvVYnyC5Awk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AB66F8026A;
	Mon,  9 Dec 2019 10:50:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A9FF80315; Mon,  9 Dec 2019 10:50:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A74EF80256
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A74EF80256
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 16918B2A9
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:46 +0100
Message-Id: <20191209094943.14984-15-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 14/71] ALSA: sb: Use managed buffer
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
 sound/isa/sb/sb16_main.c | 21 ++-------------------
 sound/isa/sb/sb8_main.c  | 21 ++-------------------
 2 files changed, 4 insertions(+), 38 deletions(-)

diff --git a/sound/isa/sb/sb16_main.c b/sound/isa/sb/sb16_main.c
index 0768bbf8fd71..07ebf2c49443 100644
--- a/sound/isa/sb/sb16_main.c
+++ b/sound/isa/sb/sb16_main.c
@@ -232,18 +232,6 @@ static void snd_sb16_setup_rate(struct snd_sb *chip,
 	spin_unlock_irqrestore(&chip->reg_lock, flags);
 }
 
-static int snd_sb16_hw_params(struct snd_pcm_substream *substream,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_sb16_hw_free(struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
 static int snd_sb16_playback_prepare(struct snd_pcm_substream *substream)
 {
 	unsigned long flags;
@@ -830,8 +818,6 @@ static const struct snd_pcm_ops snd_sb16_playback_ops = {
 	.open =		snd_sb16_playback_open,
 	.close =	snd_sb16_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_sb16_hw_params,
-	.hw_free =	snd_sb16_hw_free,
 	.prepare =	snd_sb16_playback_prepare,
 	.trigger =	snd_sb16_playback_trigger,
 	.pointer =	snd_sb16_playback_pointer,
@@ -841,8 +827,6 @@ static const struct snd_pcm_ops snd_sb16_capture_ops = {
 	.open =		snd_sb16_capture_open,
 	.close =	snd_sb16_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_sb16_hw_params,
-	.hw_free =	snd_sb16_hw_free,
 	.prepare =	snd_sb16_capture_prepare,
 	.trigger =	snd_sb16_capture_trigger,
 	.pointer =	snd_sb16_capture_pointer,
@@ -873,9 +857,8 @@ int snd_sb16dsp_pcm(struct snd_sb *chip, int device)
 		pcm->info_flags = SNDRV_PCM_INFO_HALF_DUPLEX;
 	}
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      card->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, 64*1024, 128*1024);
 	return 0;
 }
 
diff --git a/sound/isa/sb/sb8_main.c b/sound/isa/sb/sb8_main.c
index 8221b85bb330..5804fa523600 100644
--- a/sound/isa/sb/sb8_main.c
+++ b/sound/isa/sb/sb8_main.c
@@ -225,18 +225,6 @@ static int snd_sb8_playback_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_sb8_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_sb8_hw_free(struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
 static int snd_sb8_capture_prepare(struct snd_pcm_substream *substream)
 {
 	unsigned long flags;
@@ -559,8 +547,6 @@ static const struct snd_pcm_ops snd_sb8_playback_ops = {
 	.open =			snd_sb8_open,
 	.close =		snd_sb8_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_sb8_hw_params,
-	.hw_free =		snd_sb8_hw_free,
 	.prepare =		snd_sb8_playback_prepare,
 	.trigger =		snd_sb8_playback_trigger,
 	.pointer =		snd_sb8_playback_pointer,
@@ -570,8 +556,6 @@ static const struct snd_pcm_ops snd_sb8_capture_ops = {
 	.open =			snd_sb8_open,
 	.close =		snd_sb8_close,
 	.ioctl =		snd_pcm_lib_ioctl,
-	.hw_params =		snd_sb8_hw_params,
-	.hw_free =		snd_sb8_hw_free,
 	.prepare =		snd_sb8_capture_prepare,
 	.trigger =		snd_sb8_capture_trigger,
 	.pointer =		snd_sb8_capture_pointer,
@@ -595,9 +579,8 @@ int snd_sb8dsp_pcm(struct snd_sb *chip, int device)
 
 	if (chip->dma8 > 3 || chip->dma16 >= 0)
 		max_prealloc = 128 * 1024;
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      card->dev,
-					      64*1024, max_prealloc);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       card->dev, 64*1024, max_prealloc);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
