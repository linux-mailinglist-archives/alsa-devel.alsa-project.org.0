Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45450116AA8
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 11:15:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE92B16B4;
	Mon,  9 Dec 2019 11:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE92B16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575886507;
	bh=nZa9/veZ4Myv/F8ME8NDDiww/rUWqCKzLqTEwn1159g=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b9yFONIgTCuMUsmP1KKWH2fcLJcnraze9hEtGVqTwBnYtlCGL9zVG6chsTyoD+2cK
	 fUZ4pwk/5ThwbyYkQ15D8n/A6qrhao6CtSQj+LNmbf2vvi3Y0kMSwnKXxzXohR646h
	 Mxne5NXAsmYEL1Sex743QVJoyp0wr68UStUlXyrc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BACD0F803FD;
	Mon,  9 Dec 2019 10:51:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15CC7F8034B; Mon,  9 Dec 2019 10:50:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 064F9F8027D
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 10:49:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 064F9F8027D
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7603BB2CE
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 09:49:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 10:49:12 +0100
Message-Id: <20191209094943.14984-41-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191209094943.14984-1-tiwai@suse.de>
References: <20191209094943.14984-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 5.6 40/71] ALSA: hda: Use managed buffer
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

Clean up the common driver module with the new managed buffer
allocation API.  The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_controller.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 2f3b7a35f2d9..eb0bb2265685 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -107,7 +107,7 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 	struct azx_pcm *apcm = snd_pcm_substream_chip(substream);
 	struct azx *chip = apcm->chip;
 	struct azx_dev *azx_dev = get_azx_dev(substream);
-	int ret;
+	int ret = 0;
 
 	trace_azx_pcm_hw_params(chip, azx_dev);
 	dsp_lock(azx_dev);
@@ -119,8 +119,6 @@ static int azx_pcm_hw_params(struct snd_pcm_substream *substream,
 	azx_dev->core.bufsize = 0;
 	azx_dev->core.period_bytes = 0;
 	azx_dev->core.format_val = 0;
-	ret = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
 
 unlock:
 	dsp_unlock(azx_dev);
@@ -132,7 +130,6 @@ static int azx_pcm_hw_free(struct snd_pcm_substream *substream)
 	struct azx_pcm *apcm = snd_pcm_substream_chip(substream);
 	struct azx_dev *azx_dev = get_azx_dev(substream);
 	struct hda_pcm_stream *hinfo = to_hda_pcm_stream(substream);
-	int err;
 
 	/* reset BDL address */
 	dsp_lock(azx_dev);
@@ -141,10 +138,9 @@ static int azx_pcm_hw_free(struct snd_pcm_substream *substream)
 
 	snd_hda_codec_cleanup(apcm->codec, hinfo, substream);
 
-	err = snd_pcm_lib_free_pages(substream);
 	azx_stream(azx_dev)->prepared = 0;
 	dsp_unlock(azx_dev);
-	return err;
+	return 0;
 }
 
 static int azx_pcm_prepare(struct snd_pcm_substream *substream)
@@ -766,9 +762,8 @@ int snd_hda_attach_pcm_stream(struct hda_bus *_bus, struct hda_codec *codec,
 		size = MAX_PREALLOC_SIZE;
 	if (chip->uc_buffer)
 		type = SNDRV_DMA_TYPE_DEV_UC_SG;
-	snd_pcm_lib_preallocate_pages_for_all(pcm, type,
-					      chip->card->dev,
-					      size, MAX_PREALLOC_SIZE);
+	snd_pcm_set_managed_buffer_all(pcm, type, chip->card->dev,
+				       size, MAX_PREALLOC_SIZE);
 	return 0;
 }
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
