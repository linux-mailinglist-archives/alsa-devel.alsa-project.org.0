Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A77116B47
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:41:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EAC51700;
	Mon,  9 Dec 2019 11:40:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EAC51700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575888090;
	bh=/ai+peOLrOK3yMCQQf7IZEb7se2ROAOw4TlIHJ2Porg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cqYzfsqtxRXn6DjYB/xcuNFBtI7TvSFdBTgMqAT3CVuiC7uBQhhwS/yz2GGTeBjuZ
	 OBS++KXD2rw4yjelZpRahqiv/4WcMGjA8+zPbBtXpZgN8+qrEWY9KZDMv/7oxd8fCc
	 mXEZRdT/e5fQKVf8VBmqkKJM5qX8LHNuongmw8G0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C54B7F80637;
	Mon,  9 Dec 2019 10:52:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C6ADF803AE; Mon,  9 Dec 2019 10:51:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11F70F802DB
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11F70F802DB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 83C81B2E2
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:49 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:34 +0100
Message-Id: <20191209094943.14984-63-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 62/71] ALSA: sparc: Use managed buffer
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
The hw_params and hw_free callbacks became superfluous and dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/sparc/amd7930.c | 20 ++------------------
 sound/sparc/cs4231.c  | 17 ++---------------
 sound/sparc/dbri.c    | 13 +++----------
 3 files changed, 7 insertions(+), 43 deletions(-)

diff --git a/sound/sparc/amd7930.c b/sound/sparc/amd7930.c
index d4b8ccc61dc2..d39973605cca 100644
--- a/sound/sparc/amd7930.c
+++ b/sound/sparc/amd7930.c
@@ -723,23 +723,10 @@ static int snd_amd7930_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_amd7930_hw_params(struct snd_pcm_substream *substream,
-				    struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_amd7930_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static const struct snd_pcm_ops snd_amd7930_playback_ops = {
 	.open		=	snd_amd7930_playback_open,
 	.close		=	snd_amd7930_playback_close,
 	.ioctl		=	snd_pcm_lib_ioctl,
-	.hw_params	=	snd_amd7930_hw_params,
-	.hw_free	=	snd_amd7930_hw_free,
 	.prepare	=	snd_amd7930_playback_prepare,
 	.trigger	=	snd_amd7930_playback_trigger,
 	.pointer	=	snd_amd7930_playback_pointer,
@@ -749,8 +736,6 @@ static const struct snd_pcm_ops snd_amd7930_capture_ops = {
 	.open		=	snd_amd7930_capture_open,
 	.close		=	snd_amd7930_capture_close,
 	.ioctl		=	snd_pcm_lib_ioctl,
-	.hw_params	=	snd_amd7930_hw_params,
-	.hw_free	=	snd_amd7930_hw_free,
 	.prepare	=	snd_amd7930_capture_prepare,
 	.trigger	=	snd_amd7930_capture_trigger,
 	.pointer	=	snd_amd7930_capture_pointer,
@@ -776,9 +761,8 @@ static int snd_amd7930_pcm(struct snd_amd7930 *amd)
 	strcpy(pcm->name, amd->card->shortname);
 	amd->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-					      NULL,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, 64*1024, 64*1024);
 
 	return 0;
 }
diff --git a/sound/sparc/cs4231.c b/sound/sparc/cs4231.c
index 138841e0f2ae..874da942b662 100644
--- a/sound/sparc/cs4231.c
+++ b/sound/sparc/cs4231.c
@@ -889,12 +889,7 @@ static int snd_cs4231_playback_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_cs4231 *chip = snd_pcm_substream_chip(substream);
 	unsigned char new_pdfr;
-	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 	new_pdfr = snd_cs4231_get_format(chip, params_format(hw_params),
 					 params_channels(hw_params)) |
 		snd_cs4231_get_rate(params_rate(hw_params));
@@ -933,12 +928,7 @@ static int snd_cs4231_capture_hw_params(struct snd_pcm_substream *substream,
 {
 	struct snd_cs4231 *chip = snd_pcm_substream_chip(substream);
 	unsigned char new_cdfr;
-	int err;
 
-	err = snd_pcm_lib_malloc_pages(substream,
-					params_buffer_bytes(hw_params));
-	if (err < 0)
-		return err;
 	new_cdfr = snd_cs4231_get_format(chip, params_format(hw_params),
 					 params_channels(hw_params)) |
 		snd_cs4231_get_rate(params_rate(hw_params));
@@ -1205,7 +1195,6 @@ static const struct snd_pcm_ops snd_cs4231_playback_ops = {
 	.close		=	snd_cs4231_playback_close,
 	.ioctl		=	snd_pcm_lib_ioctl,
 	.hw_params	=	snd_cs4231_playback_hw_params,
-	.hw_free	=	snd_pcm_lib_free_pages,
 	.prepare	=	snd_cs4231_playback_prepare,
 	.trigger	=	snd_cs4231_trigger,
 	.pointer	=	snd_cs4231_playback_pointer,
@@ -1216,7 +1205,6 @@ static const struct snd_pcm_ops snd_cs4231_capture_ops = {
 	.close		=	snd_cs4231_capture_close,
 	.ioctl		=	snd_pcm_lib_ioctl,
 	.hw_params	=	snd_cs4231_capture_hw_params,
-	.hw_free	=	snd_pcm_lib_free_pages,
 	.prepare	=	snd_cs4231_capture_prepare,
 	.trigger	=	snd_cs4231_trigger,
 	.pointer	=	snd_cs4231_capture_pointer,
@@ -1242,9 +1230,8 @@ static int snd_cs4231_pcm(struct snd_card *card)
 	pcm->info_flags = SNDRV_PCM_INFO_JOINT_DUPLEX;
 	strcpy(pcm->name, "CS4231");
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      &chip->op->dev,
-					      64 * 1024, 128 * 1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+				       &chip->op->dev, 64 * 1024, 128 * 1024);
 
 	chip->pcm = pcm;
 
diff --git a/sound/sparc/dbri.c b/sound/sparc/dbri.c
index 4911103421ff..315d5a04a33e 100644
--- a/sound/sparc/dbri.c
+++ b/sound/sparc/dbri.c
@@ -2099,12 +2099,6 @@ static int snd_dbri_hw_params(struct snd_pcm_substream *substream,
 	if (ret != 0)
 		return ret;
 
-	if ((ret = snd_pcm_lib_malloc_pages(substream,
-				params_buffer_bytes(hw_params))) < 0) {
-		printk(KERN_ERR "malloc_pages failed with %d\n", ret);
-		return ret;
-	}
-
 	/* hw_params can get called multiple times. Only map the DMA once.
 	 */
 	if (info->dvma_buffer == 0) {
@@ -2151,7 +2145,7 @@ static int snd_dbri_hw_free(struct snd_pcm_substream *substream)
 		info->pipe = -1;
 	}
 
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static int snd_dbri_prepare(struct snd_pcm_substream *substream)
@@ -2248,9 +2242,8 @@ static int snd_dbri_pcm(struct snd_card *card)
 	pcm->info_flags = 0;
 	strcpy(pcm->name, card->shortname);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
-					      NULL,
-					      64 * 1024, 64 * 1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL, 64 * 1024, 64 * 1024);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
