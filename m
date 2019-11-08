Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D10F43EF
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 10:53:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA10168C;
	Fri,  8 Nov 2019 10:53:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA10168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573206834;
	bh=A6hXHRbeJyDOIBkaCtur28IfqOIVzCXRNmT8cmHdUWM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HzLfiu3XV5BfN5AquEJBycKg/ZZOvhjPAFiRUCMHAkyImkfB7x6XZ1/8FIdLvPR/o
	 t5F1AuE5sdJhS61m4DrfeuQ1q1XcAON6Faf7bVLMZNPMxlu4zmJH7PQu3PN00E1U2M
	 XRcGYD9VcmILVzY0osEFfHOJeBe6x5LvXRNB248M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2789F8063C;
	Fri,  8 Nov 2019 10:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB382F8045F; Fri,  8 Nov 2019 10:48:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC84FF805A1
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 10:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC84FF805A1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E741FB129;
 Fri,  8 Nov 2019 09:46:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 10:46:39 +0100
Message-Id: <20191108094641.20086-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108094641.20086-1-tiwai@suse.de>
References: <20191108094641.20086-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/8] ASoC: rt5677-spi: Convert to the common
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

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/rt5677-spi.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt5677-spi.c b/sound/soc/codecs/rt5677-spi.c
index 3aa3ea7c2768..0c90f99b693f 100644
--- a/sound/soc/codecs/rt5677-spi.c
+++ b/sound/soc/codecs/rt5677-spi.c
@@ -128,8 +128,7 @@ static int rt5677_spi_hw_params(
 	int ret;
 
 	mutex_lock(&rt5677_dsp->dma_lock);
-	ret = snd_pcm_lib_alloc_vmalloc_buffer(substream,
-			params_buffer_bytes(hw_params));
+	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(hw_params));
 	rt5677_dsp->substream = substream;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
@@ -147,7 +146,7 @@ static int rt5677_spi_hw_free(
 	rt5677_dsp->substream = NULL;
 	mutex_unlock(&rt5677_dsp->dma_lock);
 
-	return snd_pcm_lib_free_vmalloc_buffer(substream);
+	return snd_pcm_lib_free_pages(substream);
 }
 
 static int rt5677_spi_prepare(
@@ -361,12 +360,12 @@ static void rt5677_spi_copy_work(struct work_struct *work)
 	mutex_unlock(&rt5677_dsp->dma_lock);
 }
 
-static struct page *rt5677_spi_pcm_page(
-		struct snd_soc_component *component,
-		struct snd_pcm_substream *substream,
-		unsigned long offset)
+static int rt5677_spi_pcm_new(struct snd_soc_component *component,
+			      struct snd_soc_pcm_runtime *rtd)
 {
-	return snd_pcm_lib_get_vmalloc_page(substream, offset);
+	snd_pcm_lib_preallocate_pages_for_all(rtd->pcm, SNDRV_DMA_TYPE_VMALLOC,
+					      NULL, 0, 0);
+	return 0;
 }
 
 static int rt5677_spi_pcm_probe(struct snd_soc_component *component)
@@ -394,7 +393,7 @@ static const struct snd_soc_component_driver rt5677_spi_dai_component = {
 	.hw_free	= rt5677_spi_hw_free,
 	.prepare	= rt5677_spi_prepare,
 	.pointer	= rt5677_spi_pcm_pointer,
-	.page		= rt5677_spi_pcm_page,
+	.pcm_construct	= rt5677_spi_pcm_new,
 };
 
 /* Select a suitable transfer command for the next transfer to ensure
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
