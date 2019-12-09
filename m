Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F46116A58
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 10:59:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 12A8015F9;
	Mon,  9 Dec 2019 10:58:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 12A8015F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575885549;
	bh=fbCqPil9FdBDs4ab/yrau0Lxmrj7B74cB4OicLp4EUM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XfFWEWRbupzmXXgcpklte5KHR5nH1BjT44u9LBzSm1e+Ov6rC9J7bBCXjQiFpjwPq
	 Scxb+H8T3OG1CIbCa8tQYHygTjCoELGblCuUSsS7xHHfoYgodFeSnvyr38lTDY0lZo
	 tlZflTN/i2t6uArmAug7qtQPgaiOiB8XV3Fj9l/A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE80F80343;
	Mon,  9 Dec 2019 10:50:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBE1BF80323; Mon,  9 Dec 2019 10:50:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B8EEF80258
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B8EEF80258
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EDB29B2A4
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:48:44 +0100
Message-Id: <20191209094943.14984-13-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 12/71] ALSA: es1688: Use managed buffer
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
 sound/isa/es1688/es1688_lib.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/sound/isa/es1688/es1688_lib.c b/sound/isa/es1688/es1688_lib.c
index a28dabaae0d3..d2c268595168 100644
--- a/sound/isa/es1688/es1688_lib.c
+++ b/sound/isa/es1688/es1688_lib.c
@@ -341,17 +341,6 @@ static int snd_es1688_trigger(struct snd_es1688 *chip, int cmd, unsigned char va
 	return 0;
 }
 
-static int snd_es1688_hw_params(struct snd_pcm_substream *substream,
-				struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
-}
-
-static int snd_es1688_hw_free(struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int snd_es1688_playback_prepare(struct snd_pcm_substream *substream)
 {
 	unsigned long flags;
@@ -693,8 +682,6 @@ static const struct snd_pcm_ops snd_es1688_playback_ops = {
 	.open =			snd_es1688_playback_open,
 	.close =		snd_es1688_playback_close,
 	.ioctl =		snd_es1688_ioctl,
-	.hw_params =		snd_es1688_hw_params,
-	.hw_free =		snd_es1688_hw_free,
 	.prepare =		snd_es1688_playback_prepare,
 	.trigger =		snd_es1688_playback_trigger,
 	.pointer =		snd_es1688_playback_pointer,
@@ -704,8 +691,6 @@ static const struct snd_pcm_ops snd_es1688_capture_ops = {
 	.open =			snd_es1688_capture_open,
 	.close =		snd_es1688_capture_close,
 	.ioctl =		snd_es1688_ioctl,
-	.hw_params =		snd_es1688_hw_params,
-	.hw_free =		snd_es1688_hw_free,
 	.prepare =		snd_es1688_capture_prepare,
 	.trigger =		snd_es1688_capture_trigger,
 	.pointer =		snd_es1688_capture_pointer,
@@ -728,9 +713,8 @@ int snd_es1688_pcm(struct snd_card *card, struct snd_es1688 *chip, int device)
 	strcpy(pcm->name, snd_es1688_chip_id(chip));
 	chip->pcm = pcm;
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-					      card->dev,
-					      64*1024, 64*1024);
+	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, card->dev,
+				       64*1024, 64*1024);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
