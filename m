Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AED14116B00
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35E7116C6;
	Mon,  9 Dec 2019 11:28:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35E7116C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575887336;
	bh=iy7YKAeOnKwlGlHmOWNKaac7PQxmyryQGdg2Rpd/1d4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NIAqS7VnD+ZE0DKQQkL8Gh94Llp0+xP1+KWw13EhLtVcdObWwAJezQY9snJoClUeE
	 Ft6pWh6Y/jEB3aFtKUbX11LgEHfhsHArKfKztmAFDTAO8NVDvgbwr4OZVTgdI2GZmt
	 4ZJsmiJjmfdyW9jRxPeho6/5NOBg7Kp1JX8lt+fs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2925F802FD;
	Mon,  9 Dec 2019 10:52:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 639D9F80368; Mon,  9 Dec 2019 10:51:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03CCDF80277
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03CCDF80277
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 59CC2B2CD
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:10 +0100
Message-Id: <20191209094943.14984-39-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 38/71] ALSA: es1938: Use managed buffer
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
 sound/pci/es1938.c | 28 ++--------------------------
 1 file changed, 2 insertions(+), 26 deletions(-)

diff --git a/sound/pci/es1938.c b/sound/pci/es1938.c
index c571c5d380ca..95d562fff06c 100644
--- a/sound/pci/es1938.c
+++ b/sound/pci/es1938.c
@@ -863,25 +863,6 @@ static int snd_es1938_capture_copy_kernel(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-/*
- * buffer management
- */
-static int snd_es1938_pcm_hw_params(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *hw_params)
-
-{
-	int err;
-
-	if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
-		return err;
-	return 0;
-}
-
-static int snd_es1938_pcm_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 /* ----------------------------------------------------------------------
  * Audio1 Capture (ADC)
  * ----------------------------------------------------------------------*/
@@ -997,8 +978,6 @@ static const struct snd_pcm_ops snd_es1938_playback_ops = {
 	.open =		snd_es1938_playback_open,
 	.close =	snd_es1938_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_es1938_pcm_hw_params,
-	.hw_free =	snd_es1938_pcm_hw_free,
 	.prepare =	snd_es1938_playback_prepare,
 	.trigger =	snd_es1938_playback_trigger,
 	.pointer =	snd_es1938_playback_pointer,
@@ -1008,8 +987,6 @@ static const struct snd_pcm_ops snd_es1938_capture_ops = {
 	.open =		snd_es1938_capture_open,
 	.close =	snd_es1938_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_es1938_pcm_hw_params,
-	.hw_free =	snd_es1938_pcm_hw_free,
 	.prepare =	snd_es1938_capture_prepare,
 	.trigger =	snd_es1938_capture_trigger,
 	.pointer =	snd_es1938_capture_pointer,
@@ -1031,9 +1008,8 @@ static int snd_es1938_new_pcm(struct es1938 *chip, int device)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, "ESS Solo-1");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->pci->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->pci->dev, 64*1024, 64*1024);
 
 	chip->pcm = pcm;
 	return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
