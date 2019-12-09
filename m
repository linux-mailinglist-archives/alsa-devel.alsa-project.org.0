Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEB2116A91
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:09:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 476691662;
	Mon,  9 Dec 2019 11:08:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 476691662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886148;
	bh=xkdda3+QHKjIyK5auXTyD3gKYXazjJpxOxQNBXm2+Dw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8eM8Tf9meXJBBgVBwAufQQRHrD1/hZH4SPA3c2KTi2XsyJeHmuXMiO83YodFk+MT
	 QPDt28OYBVfSR2G3MjRFUJaX850Iyl6LKFQgO+j4SgJX8uUosqNBYvtj4FWAOGTSf7
	 B7UEVuOJPvimjQq0SgCliP48uQmbvXJPl/8n8NHo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C5BAF802DD;
	Mon,  9 Dec 2019 10:51:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBEC3F80344; Mon,  9 Dec 2019 10:50:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 33747F80268
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33747F80268
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DBD32B2C2
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:01 +0100
Message-Id: <20191209094943.14984-30-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 29/71] ALSA: ca0106: Use managed buffer
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
 sound/pci/ca0106/ca0106_main.c | 56 +++++-------------------------------------
 1 file changed, 6 insertions(+), 50 deletions(-)

diff --git a/sound/pci/ca0106/ca0106_main.c b/sound/pci/ca0106/ca0106_main.c
index abc2440dc2d9..758cb4dd4b00 100644
--- a/sound/pci/ca0106/ca0106_main.c
+++ b/sound/pci/ca0106/ca0106_main.c
@@ -707,34 +707,6 @@ static int snd_ca0106_pcm_open_3_capture(struct snd_pcm_substream *substream)
 	return snd_ca0106_pcm_open_capture_channel(substream, 3);
 }
 
-/* hw_params callback */
-static int snd_ca0106_pcm_hw_params_playback(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-/* hw_free callback */
-static int snd_ca0106_pcm_hw_free_playback(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
-/* hw_params callback */
-static int snd_ca0106_pcm_hw_params_capture(struct snd_pcm_substream *substream,
-				      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-/* hw_free callback */
-static int snd_ca0106_pcm_hw_free_capture(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 /* prepare playback callback */
 static int snd_ca0106_pcm_prepare_playback(struct snd_pcm_substream *substream)
 {
@@ -1097,8 +1069,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_front_ops = {
 	.open =        snd_ca0106_pcm_open_playback_front,
 	.close =       snd_ca0106_pcm_close_playback,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_ca0106_pcm_hw_params_playback,
-	.hw_free =     snd_ca0106_pcm_hw_free_playback,
 	.prepare =     snd_ca0106_pcm_prepare_playback,
 	.trigger =     snd_ca0106_pcm_trigger_playback,
 	.pointer =     snd_ca0106_pcm_pointer_playback,
@@ -1108,8 +1078,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_0_ops = {
 	.open =        snd_ca0106_pcm_open_0_capture,
 	.close =       snd_ca0106_pcm_close_capture,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_ca0106_pcm_hw_params_capture,
-	.hw_free =     snd_ca0106_pcm_hw_free_capture,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1119,8 +1087,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_1_ops = {
 	.open =        snd_ca0106_pcm_open_1_capture,
 	.close =       snd_ca0106_pcm_close_capture,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_ca0106_pcm_hw_params_capture,
-	.hw_free =     snd_ca0106_pcm_hw_free_capture,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1130,8 +1096,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_2_ops = {
 	.open =        snd_ca0106_pcm_open_2_capture,
 	.close =       snd_ca0106_pcm_close_capture,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_ca0106_pcm_hw_params_capture,
-	.hw_free =     snd_ca0106_pcm_hw_free_capture,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1141,8 +1105,6 @@ static const struct snd_pcm_ops snd_ca0106_capture_3_ops = {
 	.open =        snd_ca0106_pcm_open_3_capture,
 	.close =       snd_ca0106_pcm_close_capture,
 	.ioctl =       snd_pcm_lib_ioctl,
-	.hw_params =   snd_ca0106_pcm_hw_params_capture,
-	.hw_free =     snd_ca0106_pcm_hw_free_capture,
 	.prepare =     snd_ca0106_pcm_prepare_capture,
 	.trigger =     snd_ca0106_pcm_trigger_capture,
 	.pointer =     snd_ca0106_pcm_pointer_capture,
@@ -1152,8 +1114,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_center_lfe_ops = {
         .open =         snd_ca0106_pcm_open_playback_center_lfe,
         .close =        snd_ca0106_pcm_close_playback,
         .ioctl =        snd_pcm_lib_ioctl,
-        .hw_params =    snd_ca0106_pcm_hw_params_playback,
-        .hw_free =      snd_ca0106_pcm_hw_free_playback,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
@@ -1163,8 +1123,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_unknown_ops = {
         .open =         snd_ca0106_pcm_open_playback_unknown,
         .close =        snd_ca0106_pcm_close_playback,
         .ioctl =        snd_pcm_lib_ioctl,
-        .hw_params =    snd_ca0106_pcm_hw_params_playback,
-        .hw_free =      snd_ca0106_pcm_hw_free_playback,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
@@ -1174,8 +1132,6 @@ static const struct snd_pcm_ops snd_ca0106_playback_rear_ops = {
         .open =         snd_ca0106_pcm_open_playback_rear,
         .close =        snd_ca0106_pcm_close_playback,
         .ioctl =        snd_pcm_lib_ioctl,
-        .hw_params =    snd_ca0106_pcm_hw_params_playback,
-		.hw_free =      snd_ca0106_pcm_hw_free_playback,
         .prepare =      snd_ca0106_pcm_prepare_playback,     
         .trigger =      snd_ca0106_pcm_trigger_playback,  
         .pointer =      snd_ca0106_pcm_pointer_playback, 
@@ -1388,17 +1344,17 @@ static int snd_ca0106_pcm(struct snd_ca0106 *emu, int device)
 	for(substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream; 
 	    substream; 
 	    substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      64*1024, 64*1024);
+		snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+					   &emu->pci->dev,
+					   64*1024, 64*1024);
 	}
 
 	for (substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream; 
 	      substream; 
 	      substream = substream->next) {
-		snd_pcm_lib_preallocate_pages(substream, SNDRV_DMA_TYPE_DEV,
-					      &emu->pci->dev,
-					      64*1024, 64*1024);
+		snd_pcm_set_managed_buffer(substream, SNDRV_DMA_TYPE_DEV,
+					   &emu->pci->dev,
+					   64*1024, 64*1024);
 	}
   
 	err = snd_pcm_add_chmap_ctls(pcm, SNDRV_PCM_STREAM_PLAYBACK, map, 2,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
