Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D5A118ADD
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:30:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46D23165D;
	Tue, 10 Dec 2019 15:29:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46D23165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988248;
	bh=Spy85HpQAhgd32PqRiQ0R9p6vfunFDCqLT6/QsEbzVE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IocQL9FwouZeGnNO9jiNTdmc6DgmRiM86GMabx+8Jl2L7U18ck0PRyYb1S2rifl2r
	 WWaEFfsd6E1N4HHRSyZg9RDRjSNbDP1qGeQBFrfhCJRvb4HkVu2sbW1u1uFAu9JReP
	 SwaVcIZum4D5fppfxcJeHMKUWxKy9fbv3dsenvhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF52F8028E;
	Tue, 10 Dec 2019 15:26:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C907FF80279; Tue, 10 Dec 2019 15:26:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2902F8024A
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2902F8024A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E29A6AD9F;
 Tue, 10 Dec 2019 14:26:25 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:25:57 +0100
Message-Id: <20191210142614.19405-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH for-5.6 06/23] ASoC: dma-sh7760: Use managed
	buffer allocation
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/sh/dma-sh7760.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/sound/soc/sh/dma-sh7760.c b/sound/soc/sh/dma-sh7760.c
index 2b0eca02a8b9..4d0f2f738ffa 100644
--- a/sound/soc/sh/dma-sh7760.c
+++ b/sound/soc/sh/dma-sh7760.c
@@ -179,11 +179,6 @@ static int camelot_hw_params(struct snd_soc_component *component,
 	int recv = substream->stream == SNDRV_PCM_STREAM_PLAYBACK ? 0:1;
 	int ret;
 
-	ret = snd_pcm_lib_malloc_pages(substream,
-				       params_buffer_bytes(hw_params));
-	if (ret < 0)
-		return ret;
-
 	if (recv) {
 		cam->rx_period_size = params_period_bytes(hw_params);
 		cam->rx_period = 0;
@@ -194,12 +189,6 @@ static int camelot_hw_params(struct snd_soc_component *component,
 	return 0;
 }
 
-static int camelot_hw_free(struct snd_soc_component *component,
-			   struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
-}
-
 static int camelot_prepare(struct snd_soc_component *component,
 			   struct snd_pcm_substream *substream)
 {
@@ -307,7 +296,7 @@ static int camelot_pcm_new(struct snd_soc_component *component,
 	/* dont use SNDRV_DMA_TYPE_DEV, since it will oops the SH kernel
 	 * in MMAP mode (i.e. aplay -M)
 	 */
-	snd_pcm_lib_preallocate_pages_for_all(pcm,
+	snd_pcm_set_managed_buffer_all(pcm,
 		SNDRV_DMA_TYPE_CONTINUOUS,
 		NULL,
 		DMABRG_PREALLOC_BUFFER,	DMABRG_PREALLOC_BUFFER_MAX);
@@ -320,7 +309,6 @@ static const struct snd_soc_component_driver sh7760_soc_component = {
 	.close		= camelot_pcm_close,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.hw_params	= camelot_hw_params,
-	.hw_free	= camelot_hw_free,
 	.prepare	= camelot_prepare,
 	.trigger	= camelot_trigger,
 	.pointer	= camelot_pos,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
