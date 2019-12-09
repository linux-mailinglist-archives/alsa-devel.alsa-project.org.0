Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 93294116A6C
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:01:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E6311690;
	Mon,  9 Dec 2019 11:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E6311690
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885703;
	bh=5uhWVpkDG8ect96mc734YpAS9ltBaIobVior6e2xFbc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hHnaiCEHXyVmCJlGh2N/jhp5YJXXtdSDpb/D/XDedcOwt9q17F40wYwCEMvjEIkuS
	 psb3gLl9QgGzazEBgWTeWHtcKCUCAeYP44Dw8sLg+xkl4RqXBgEAX+v9XihpPu6rZU
	 fUoSPBgCY6fiRx/Kip8hnAJbgzE99MG5RpYe+9mU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD0E5F802EA;
	Mon,  9 Dec 2019 10:50:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CD2EAF80332; Mon,  9 Dec 2019 10:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 05D24F80259
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 05D24F80259
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 29322B2AB
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:48 +0100
Message-Id: <20191209094943.14984-17-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 16/71] ALSA: wss: Use managed buffer
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
The hw_free callback became superfluous and got dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wss/wss_lib.c | 23 ++---------------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/sound/isa/wss/wss_lib.c b/sound/isa/wss/wss_lib.c
index c43f2602249b..0ef89c97ccd2 100644
--- a/sound/isa/wss/wss_lib.c
+++ b/sound/isa/wss/wss_lib.c
@@ -982,10 +982,7 @@ static int snd_wss_playback_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
 	unsigned char new_pdfr;
-	int err;
 
-	if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
-		return err;
 	new_pdfr = snd_wss_get_format(chip, params_format(hw_params),
 				params_channels(hw_params)) |
 				snd_wss_get_rate(params_rate(hw_params));
@@ -993,11 +990,6 @@ static int snd_wss_playback_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_wss_playback_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_wss_playback_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
@@ -1025,10 +1017,7 @@ static int snd_wss_capture_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
 	unsigned char new_cdfr;
-	int err;
 
-	if ((err = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params))) < 0)
-		return err;
 	new_cdfr = snd_wss_get_format(chip, params_format(hw_params),
 			   params_channels(hw_params)) |
 			   snd_wss_get_rate(params_rate(hw_params));
@@ -1036,11 +1025,6 @@ static int snd_wss_capture_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int snd_wss_capture_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_wss_capture_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_wss *chip = snd_pcm_substream_chip(substream);
@@ -1889,7 +1873,6 @@ static const struct snd_pcm_ops snd_wss_playback_ops = {
 	.close =	snd_wss_playback_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_wss_playback_hw_params,
-	.hw_free =	snd_wss_playback_hw_free,
 	.prepare =	snd_wss_playback_prepare,
 	.trigger =	snd_wss_trigger,
 	.pointer =	snd_wss_playback_pointer,
@@ -1900,7 +1883,6 @@ static const struct snd_pcm_ops snd_wss_capture_ops = {
 	.close =	snd_wss_capture_close,
 	.ioctl =	snd_pcm_lib_ioctl,
 	.hw_params =	snd_wss_capture_hw_params,
-	.hw_free =	snd_wss_capture_hw_free,
 	.prepare =	snd_wss_capture_prepare,
 	.trigger =	snd_wss_trigger,
 	.pointer =	snd_wss_capture_pointer,
@@ -1927,9 +1909,8 @@ int snd_wss_pcm(struct snd_wss *chip, int device)
 		pcm->info_flags |= SNDRV_PCM_INFO_JOINT_DUPLEX;
 	strcpy(pcm->name, snd_wss_chip_id(chip));
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      chip->card->dev,
-					      64*1024, chip->dma1 > 3 || chip->dma2 > 3 ? 128*1024 : 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, chip->card->dev,
+				       64*1024, chip->dma1 > 3 || chip->dma2 > 3 ? 128*1024 : 64*1024);
 
 	chip->pcm = pcm;
 	return 0;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
