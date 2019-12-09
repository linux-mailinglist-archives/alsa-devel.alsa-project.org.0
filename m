Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2B3116A29
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:51:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43BD11667;
	Mon,  9 Dec 2019 10:50:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43BD11667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885098;
	bh=WmI0lFD06G8OnNPbpyDqHbWqMMzXL4nU+yd2CtIMZao=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TROj3KZ0MK4kJHmag2eiadDzHiQq60977gAOjvbjyX9gkNP171eUR2kTSQkqQ4Mge
	 xl9MEIP54gf+U2W4PromQywoZbtq4lv+jCx6RA6FX/A0jehThS/36BDjRSf/PccsqG
	 jlCq38iEqzFkl2x1q3Jrx+9gDNvEaWp9hBeuqTmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B41FF8027C;
	Mon,  9 Dec 2019 10:49:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B268F8025E; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4DC42F8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DC42F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6DE52B298
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:35 +0100
Message-Id: <20191209094943.14984-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 03/71] ALSA: atmel: Use managed buffer
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
The hw_free_free callbacks became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/atmel/ac97c.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index eef7ec77db1a..44507e43ed28 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -159,12 +159,6 @@ static int atmel_ac97c_playback_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *hw_params)
 {
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
-	int retval;
-
-	retval = snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-	if (retval < 0)
-		return retval;
 
 	/* Set restrictions to params. */
 	mutex_lock(&opened_mutex);
@@ -172,19 +166,13 @@ static int atmel_ac97c_playback_hw_params(struct snd_pcm_substream *substream,
 	chip->cur_format = params_format(hw_params);
 	mutex_unlock(&opened_mutex);
 
-	return retval;
+	return 0;
 }
 
 static int atmel_ac97c_capture_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *hw_params)
 {
 	struct atmel_ac97c *chip = snd_pcm_substream_chip(substream);
-	int retval;
-
-	retval = snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-	if (retval < 0)
-		return retval;
 
 	/* Set restrictions to params. */
 	mutex_lock(&opened_mutex);
@@ -192,7 +180,7 @@ static int atmel_ac97c_capture_hw_params(struct snd_pcm_substream *substream,
 	chip->cur_format = params_format(hw_params);
 	mutex_unlock(&opened_mutex);
 
-	return retval;
+	return 0;
 }
 
 static int atmel_ac97c_playback_prepare(struct snd_pcm_substream *substream)
@@ -461,7 +449,6 @@ static const struct snd_pcm_ops atmel_ac97_playback_ops = {
 	.close		= atmel_ac97c_playback_close,
 	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= atmel_ac97c_playback_hw_params,
-	.hw_free	= snd_pcm_lib_free_pages,
 	.prepare	= atmel_ac97c_playback_prepare,
 	.trigger	= atmel_ac97c_playback_trigger,
 	.pointer	= atmel_ac97c_playback_pointer,
@@ -472,7 +459,6 @@ static const struct snd_pcm_ops atmel_ac97_capture_ops = {
 	.close		= atmel_ac97c_capture_close,
 	.ioctl		= snd_pcm_lib_ioctl,
 	.hw_params	= atmel_ac97c_capture_hw_params,
-	.hw_free	= snd_pcm_lib_free_pages,
 	.prepare	= atmel_ac97c_capture_prepare,
 	.trigger	= atmel_ac97c_capture_trigger,
 	.pointer	= atmel_ac97c_capture_pointer,
@@ -600,7 +586,7 @@ static int atmel_ac97c_pcm_new(struct atmel_ac97c *chip)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &atmel_ac97_capture_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &atmel_ac97_playback_ops);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
 			&chip->pdev->dev, hw.periods_min * hw.period_bytes_min,
 			hw.buffer_bytes_max);
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
