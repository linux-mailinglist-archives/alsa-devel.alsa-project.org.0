Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 472A2F0188
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:34:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 708FC16FE;
	Tue,  5 Nov 2019 16:33:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 708FC16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572968069;
	bh=hii5Q0tEuK0oh5QE/VgeA3s4dtWpXDKSxxJXBtAHS/M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rmidA0q3h+vu2iP5zVBqWpuxwBx6rz0RCH+OgfxRYC56SxE5qZYDb3jpl0eHCBxqF
	 CErWYcShAvNdeUE/3GYUSY9YYmWZ2dfq/q9oSi4WbkTnF4Jex4AlIafjwm/hA6CnlV
	 i1liQ05OCEQmblyVmtoEoxabhVwt0pc4ye3SjUzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDD76F807B6;
	Tue,  5 Nov 2019 16:19:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 980FFF8065A; Tue,  5 Nov 2019 16:19:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24287F80634
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24287F80634
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7B29AB340
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:49 +0100
Message-Id: <20191105151856.10785-18-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 17/24] ALSA: mips: Convert to the common
	vmalloc memalloc
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

The recent change (*) in the ALSA memalloc core allows us to drop the
special vmalloc-specific allocation and page handling.  This patch
coverts to the common code.
(*) df3fd6509421: ALSA: memalloc: Add vmalloc buffer allocation
                  support
    6ef6be988f98: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/mips/sgio2audio.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index fadc1194b136..9d20ce6118a0 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -582,14 +582,13 @@ static int snd_sgio2audio_pcm_close(struct snd_pcm_substream *substream)
 static int snd_sgio2audio_pcm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *hw_params)
 {
-	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
-						params_buffer_bytes(hw_params));
+	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 }
 
 /* hw_free callback */
 static int snd_sgio2audio_pcm_hw_free(struct snd_pcm_substream *substream)
 {
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 /* prepare callback */
@@ -670,7 +669,6 @@ static const struct snd_pcm_ops snd_sgio2audio_playback1_ops = {
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
-	.page =        snd_pcm_lib_get_vmalloc_page,
 };
 
 static const struct snd_pcm_ops snd_sgio2audio_playback2_ops = {
@@ -682,7 +680,6 @@ static const struct snd_pcm_ops snd_sgio2audio_playback2_ops = {
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
-	.page =        snd_pcm_lib_get_vmalloc_page,
 };
 
 static const struct snd_pcm_ops snd_sgio2audio_capture_ops = {
@@ -694,7 +691,6 @@ static const struct snd_pcm_ops snd_sgio2audio_capture_ops = {
 	.prepare =     snd_sgio2audio_pcm_prepare,
 	.trigger =     snd_sgio2audio_pcm_trigger,
 	.pointer =     snd_sgio2audio_pcm_pointer,
-	.page =        snd_pcm_lib_get_vmalloc_page,
 };
 
 /*
@@ -720,6 +716,8 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 			&snd_sgio2audio_playback1_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE,
 			&snd_sgio2audio_capture_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	/* create second  pcm device with one outputs and no input */
 	err = snd_pcm_new(chip->card, "SGI O2 Audio", 1, 1, 0, &pcm);
@@ -732,6 +730,8 @@ static int snd_sgio2audio_new_pcm(struct snd_sgio2audio *chip)
 	/* set operators */
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK,
 			&snd_sgio2audio_playback2_ops);
+	snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
