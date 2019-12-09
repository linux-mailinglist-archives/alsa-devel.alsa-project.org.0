Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2412116A76
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:03:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B59C1662;
	Mon,  9 Dec 2019 11:02:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B59C1662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885826;
	bh=X2ImIkAakJTSqhIcILANYK/af5rQNdCT0G7dDZJERgM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uHTurHaiCTMLKq/aMnkPza3Qbo2y1ooWgKqZFcaziYw8VEagqi7HUoQZzPcs+hBsv
	 2kKeeybZQjXGYwNjlrCZ4k1D60ZnXjT3a8yI/As5c69fqqzsqfFRjrr10h46supDQn
	 yepnxM+0ZkF3pWdUQY7BtPePNJMIjQzgdqByTtG4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9C5F80291;
	Mon,  9 Dec 2019 10:51:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3636F80333; Mon,  9 Dec 2019 10:50:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FEA7F8011E
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FEA7F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7BE18B2B5
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:54 +0100
Message-Id: <20191209094943.14984-23-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 22/71] ALSA: als4000: Use managed buffer
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
 sound/pci/als4000.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/sound/pci/als4000.c b/sound/pci/als4000.c
index d6f5487afe52..ea51913ea134 100644
--- a/sound/pci/als4000.c
+++ b/sound/pci/als4000.c
@@ -354,18 +354,6 @@ CMD_SIGNED|CMD_STEREO,			/* ALS4000_FORMAT_S16L_STEREO */
 };	
 #define capture_cmd(chip) (capture_cmd_vals[(chip)->capture_format])
 
-static int snd_als4000_hw_params(struct snd_pcm_substream *substream,
-				 struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_als4000_hw_free(struct snd_pcm_substream *substream)
-{
-	snd_pcm_lib_free_pages(substream);
-	return 0;
-}
-
 static int snd_als4000_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
@@ -633,7 +621,6 @@ static int snd_als4000_playback_close(struct snd_pcm_substream *substream)
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 
 	chip->playback_substream = NULL;
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -652,7 +639,6 @@ static int snd_als4000_capture_close(struct snd_pcm_substream *substream)
 	struct snd_sb *chip = snd_pcm_substream_chip(substream);
 
 	chip->capture_substream = NULL;
-	snd_pcm_lib_free_pages(substream);
 	return 0;
 }
 
@@ -662,8 +648,6 @@ static const struct snd_pcm_ops snd_als4000_playback_ops = {
 	.open =		snd_als4000_playback_open,
 	.close =	snd_als4000_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_als4000_hw_params,
-	.hw_free =	snd_als4000_hw_free,
 	.prepare =	snd_als4000_playback_prepare,
 	.trigger =	snd_als4000_playback_trigger,
 	.pointer =	snd_als4000_playback_pointer
@@ -673,8 +657,6 @@ static const struct snd_pcm_ops snd_als4000_capture_ops = {
 	.open =		snd_als4000_capture_open,
 	.close =	snd_als4000_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_als4000_hw_params,
-	.hw_free =	snd_als4000_hw_free,
 	.prepare =	snd_als4000_capture_prepare,
 	.trigger =	snd_als4000_capture_trigger,
 	.pointer =	snd_als4000_capture_pointer
@@ -693,9 +675,8 @@ static int snd_als4000_pcm(struct snd_sb *chip, int device)
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &snd_als4000_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &snd_als4000_capture_ops);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 64*1024);
 
 	chip->pcm = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
