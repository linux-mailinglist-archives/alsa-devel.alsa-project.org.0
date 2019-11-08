Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC44F43DE
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 10:50:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9124C1685;
	Fri,  8 Nov 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9124C1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573206636;
	bh=ZHcqq8wJ4PmdLXmkAoFjJYphkE9zdTvKqHXtDckzRx4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iqLQcwWXlirsdBCe7a76dk6i2ual5Htk6weVHn08Epw30R83cHG08bFqHPtFv6tw3
	 fHq1ktVIlQn8qDB3bWLcV8jMkAN+UyHre02rDvDaj5hvlgxpcwmKAdGFKeoqEJL2Ap
	 d/qLMAyK3N9Y33H9rdNEQ7FtW+zP5GIJKnotxmKg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 569B3F8045F;
	Fri,  8 Nov 2019 10:48:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 25B21F800F3; Fri,  8 Nov 2019 10:48:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA6DCF80321
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 10:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA6DCF80321
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id B4541AEC4;
 Fri,  8 Nov 2019 09:46:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 10:46:35 +0100
Message-Id: <20191108094641.20086-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108094641.20086-1-tiwai@suse.de>
References: <20191108094641.20086-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/8] ASoC: rt5514-spi: Convert to the common
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
(*) 1fe7f397cfe2: ALSA: memalloc: Add vmalloc buffer allocation
                  support
    7e8edae39fd1: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Since it requires the specific buffer type (SNDRV_DMA_TYPE_VMALLOC),
it's set in the pcm_new ops now.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5514-spi.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 57ff5aee452d..f1b7b947ecbd 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -219,8 +219,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	u8 buf[8];
 
 	mutex_lock(&rt5514_dsp->dma_lock);
-	ret = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-			params_buffer_bytes(hw_params));
+	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -246,7 +245,7 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static snd_pcm_uframes_t rt5514_spi_pcm_pointer(
@@ -260,12 +259,6 @@ static snd_pcm_uframes_t rt5514_spi_pcm_pointer(
 	return bytes_to_frames(runtime, rt5514_dsp->dma_offset);
 }
 
-static struct page *rt5514_spi_pcm_page(struct snd_soc_component *component,
-					struct snd_pcm_substream *substream,
-					unsigned long offset)
-{
-	return snd_pcm_lib_get_vmalloc_page(substream, offset);
-}
 
 static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 {
@@ -298,6 +291,14 @@ static int rt5514_spi_pcm_probe(struct snd_soc_component *component)
 	return 0;
 }
 
+static int rt5514_spi_pcm_new(struct snd_soc_component *component,
+			      struct snd_soc_pcm_runtime *rtd)
+{
+	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
+	return 0;
+}
+
 static const struct snd_soc_component_driver rt5514_spi_component = {
 	.name		= DRV_NAME,
 	.probe		= rt5514_spi_pcm_probe,
@@ -305,7 +306,7 @@ static const struct snd_soc_component_driver rt5514_spi_component = {
 	.hw_params	= rt5514_spi_hw_params,
 	.hw_free	= rt5514_spi_hw_free,
 	.pointer	= rt5514_spi_pcm_pointer,
-	.page		= rt5514_spi_pcm_page,
+	.pcm_construct	= rt5514_spi_pcm_new,
 };
 
 /**
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
