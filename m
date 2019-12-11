Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 506F811BA49
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 18:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE962169E;
	Wed, 11 Dec 2019 18:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE962169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576085332;
	bh=++ch3kyyydlyfTeh24TgX53WgOOwF/r6QlhGNrsn/MA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rd7ijlbsCp+tB+nnqNU+zgMCQKBBvVp7VgfKId4ZmVx5djByRsXuinh+XFBBrnYjA
	 wH5+5Fwrrai2h0oPKKlbTKALk+3e27ZSKxlwW6SUIi5bXyYeE0Z3ymx1IiHGi0ci6T
	 Uo/v/4wzsGdVSeSarMl5aUe2U5zjG8ARymbnRdKY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BB27F80272;
	Wed, 11 Dec 2019 18:20:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A8355F8026A; Wed, 11 Dec 2019 18:20:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A69A2F800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 18:20:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A69A2F800F3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B757AF22;
 Wed, 11 Dec 2019 17:20:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Wed, 11 Dec 2019 18:20:19 +0100
Message-Id: <20191211172019.23206-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191211172019.23206-1-tiwai@suse.de>
References: <20191211172019.23206-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH v2 2/2] ASoC: SOF: Use managed buffer allocation
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
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.

Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sof/pcm.c | 34 ++++++++++------------------------
 1 file changed, 10 insertions(+), 24 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 54ec78799c30..99f6aa6841c3 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -118,20 +118,8 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 
 	memset(&pcm, 0, sizeof(pcm));
 
-	/* allocate audio buffer pages */
-	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
-	if (ret < 0) {
-		dev_err(component->dev, "error: could not allocate %d bytes for PCM %d\n",
-			params_buffer_bytes(params), spcm->pcm.pcm_id);
-		return ret;
-	}
-	if (ret) {
-		/*
-		 * ret == 1 means the buffer is changed
-		 * create compressed page table for audio firmware
-		 * ret == 0 means the buffer is not changed
-		 * so no need to regenerate the page table
-		 */
+	/* create compressed page table for audio firmware */
+	if (runtime->buffer_changed) {
 		ret = create_page_table(component, substream, runtime->dma_area,
 					runtime->dma_bytes);
 		if (ret < 0)
@@ -259,8 +247,6 @@ static int sof_pcm_hw_free(struct snd_soc_component *component,
 			err = ret;
 	}
 
-	snd_pcm_lib_free_pages(substream);
-
 	cancel_work_sync(&spcm->stream[substream->stream].period_elapsed_work);
 
 	ret = snd_sof_pcm_platform_hw_free(sdev, substream);
@@ -596,10 +582,10 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		"spcm: allocate %s playback DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
-	snd_pcm_lib_preallocate_pages(pcm->streams[stream].substream,
-				      SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				      le32_to_cpu(caps->buffer_size_min),
-				      le32_to_cpu(caps->buffer_size_max));
+	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
+				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
+				   le32_to_cpu(caps->buffer_size_min),
+				   le32_to_cpu(caps->buffer_size_max));
 capture:
 	stream = SNDRV_PCM_STREAM_CAPTURE;
 
@@ -614,10 +600,10 @@ static int sof_pcm_new(struct snd_soc_component *component,
 		"spcm: allocate %s capture DMA buffer size 0x%x max 0x%x\n",
 		caps->name, caps->buffer_size_min, caps->buffer_size_max);
 
-	snd_pcm_lib_preallocate_pages(pcm->streams[stream].substream,
-				      SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
-				      le32_to_cpu(caps->buffer_size_min),
-				      le32_to_cpu(caps->buffer_size_max));
+	snd_pcm_set_managed_buffer(pcm->streams[stream].substream,
+				   SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
+				   le32_to_cpu(caps->buffer_size_min),
+				   le32_to_cpu(caps->buffer_size_max));
 
 	return 0;
 }
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
