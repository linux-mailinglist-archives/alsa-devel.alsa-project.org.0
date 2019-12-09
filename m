Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C29116A7C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACC50167A;
	Mon,  9 Dec 2019 11:03:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACC50167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885868;
	bh=ZFgLQXfJq9dvermPvX7PnWzxIJew+7rzlYJ+2StN2Yg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AbR2gsoj/2jh96ESMaDnbPhZFSsAsNV0jJev7z28hNp8xVAHA/JpWGBslIoBbUXWU
	 sFlTvDuZ8mPDn7Fyn8TDPVyQExCT8uJwQZYAyNpA3UiM4Flb338IrWtlhTC9atTesg
	 bmXgTTWbKrk3tA1gmaqeM22B5XOdfYCXEs/wpT14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52983F801F4;
	Mon,  9 Dec 2019 10:51:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BAEFF80333; Mon,  9 Dec 2019 10:50:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1DCF80265
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1DCF80265
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 613AAB2B1
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:52 +0100
Message-Id: <20191209094943.14984-21-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 20/71] ALSA: ali5451: Use managed buffer
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
 sound/pci/ali5451/ali5451.c | 30 +++---------------------------
 1 file changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index ae29df085ae1..8d8d54be331b 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -1138,13 +1138,7 @@ static int snd_ali_playback_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_ali_voice *pvoice = runtime->private_data;
 	struct snd_ali_voice *evoice = pvoice->extra;
-	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
-	
 	/* voice management */
 
 	if (params_buffer_size(hw_params) / 2 !=
@@ -1175,7 +1169,6 @@ static int snd_ali_playback_hw_free(struct snd_pcm_substream *substream)
 	struct snd_ali_voice *pvoice = runtime->private_data;
 	struct snd_ali_voice *evoice = pvoice ? pvoice->extra : NULL;
 
-	snd_pcm_lib_free_pages(substream);
 	if (evoice) {
 		snd_ali_free_voice(codec, evoice);
 		pvoice->extra = NULL;
@@ -1183,18 +1176,6 @@ static int snd_ali_playback_hw_free(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_ali_hw_params(struct snd_pcm_substream *substream,
-			     struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-}
-
-static int snd_ali_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_ali_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_ali *codec = snd_pcm_substream_chip(substream);
@@ -1538,8 +1519,6 @@ static const struct snd_pcm_ops snd_ali_capture_ops = {
 	.open =		snd_ali_capture_open,
 	.close =	snd_ali_close,
 	.ioctl =	snd_pcm_lib_ioctl,
-	.hw_params =	snd_ali_hw_params,
-	.hw_free =	snd_ali_hw_free,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
 	.pointer =	snd_ali_pointer,
@@ -1557,7 +1536,7 @@ static int snd_ali_modem_hw_params(struct snd_pcm_substream *substream,
 	snd_ac97_write(chip->ac97[modem_num], AC97_LINE1_RATE,
 		       params_rate(hw_params));
 	snd_ac97_write(chip->ac97[modem_num], AC97_LINE1_LEVEL, 0);
-	return snd_ali_hw_params(substream, hw_params);
+	return 0;
 }
 
 static struct snd_pcm_hardware snd_ali_modem =
@@ -1614,7 +1593,6 @@ static const struct snd_pcm_ops snd_ali_modem_playback_ops = {
 	.close =	snd_ali_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ali_modem_hw_params,
-	.hw_free =	snd_ali_hw_free,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
 	.pointer =	snd_ali_pointer,
@@ -1625,7 +1603,6 @@ static const struct snd_pcm_ops snd_ali_modem_capture_ops = {
 	.close =	snd_ali_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_ali_modem_hw_params,
-	.hw_free =	snd_ali_hw_free,
 	.prepare =	snd_ali_prepare,
 	.trigger =	snd_ali_trigger,
 	.pointer =	snd_ali_pointer,
@@ -1671,9 +1648,8 @@ static int snd_ali_pcm(struct snd_ali *codec, int device,
 		snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 				desc->capture_ops);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &codec->pci->dev,
-					      64*1024, 128*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &codec->pci->dev, 64*1024, 128*1024);
 
 	pcm->info_flags = 0;
 	pcm->dev_class = desc->class;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
