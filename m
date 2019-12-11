Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E27D11B964
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 17:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9F99166C;
	Wed, 11 Dec 2019 17:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9F99166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576083515;
	bh=9ulmUVS+Z+f+mcgjFbdDnQuzN2YnCnb0wC/lVe6xgxQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=i5NZsakk1qAJihMWp+uNiemfRaLCUEYbbJfML8tLdcMfMbGNcKofCXVg6tzIWSG0R
	 3bMlVcPYriC9KtE5oEA6JbR/1HoTRs1s7/C0spU/zjfPaA+zypnLcQ/4NGr7fJxkLF
	 CAEG3rOYfxog9pcbygLGHKmG1gVtRVTupd1Ic2lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DEE33F80290;
	Wed, 11 Dec 2019 17:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49001F8028B; Wed, 11 Dec 2019 17:53:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 3EDE5F80269
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 17:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EDE5F80269
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B44530E;
 Wed, 11 Dec 2019 08:53:19 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07B353F52E;
 Wed, 11 Dec 2019 08:53:18 -0800 (PST)
Date: Wed, 11 Dec 2019 16:53:17 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20191210142614.19405-24-tiwai@suse.de>
Message-Id: <applied-20191210142614.19405-24-tiwai@suse.de>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: intel: skylake: Use managed buffer
	allocation" to the asoc tree
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

The patch

   ASoC: intel: skylake: Use managed buffer allocation

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 51240953f28e0528a975db686d4e9e5938d55829 Mon Sep 17 00:00:00 2001
From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 10 Dec 2019 15:26:14 +0100
Subject: [PATCH] ASoC: intel: skylake: Use managed buffer allocation

Clean up the drivers with the new managed buffer allocation API.
The superfluous snd_pcm_lib_malloc_pages() and
snd_pcm_lib_free_pages() calls are dropped.
The pcm_construct ops contains only the superfluous call of
snd_pcm_lib_preallocate_free_for_all(), so dropped, too.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20191210142614.19405-24-tiwai@suse.de
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/skylake/skl-pcm.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index bec5cee19566..355165fd6b6a 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -77,13 +77,7 @@ static int skl_substream_alloc_pages(struct hdac_bus *bus,
 	hdac_stream(stream)->period_bytes = 0;
 	hdac_stream(stream)->format_val = 0;
 
-	return snd_pcm_lib_malloc_pages(substream, size);
-}
-
-static int skl_substream_free_pages(struct hdac_bus *bus,
-				struct snd_pcm_substream *substream)
-{
-	return snd_pcm_lib_free_pages(substream);
+	return 0;
 }
 
 static void skl_set_pcm_constrains(struct hdac_bus *bus,
@@ -385,7 +379,6 @@ static void skl_pcm_close(struct snd_pcm_substream *substream,
 static int skl_pcm_hw_free(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
-	struct hdac_bus *bus = dev_get_drvdata(dai->dev);
 	struct hdac_ext_stream *stream = get_hdac_ext_stream(substream);
 	struct skl_dev *skl = get_skl_ctx(dai->dev);
 	struct skl_module_cfg *mconfig;
@@ -405,7 +398,7 @@ static int skl_pcm_hw_free(struct snd_pcm_substream *substream,
 	snd_hdac_stream_cleanup(hdac_stream(stream));
 	hdac_stream(stream)->prepared = 0;
 
-	return skl_substream_free_pages(bus, substream);
+	return 0;
 }
 
 static int skl_be_hw_params(struct snd_pcm_substream *substream,
@@ -1289,12 +1282,6 @@ static int skl_platform_soc_get_time_info(
 	return 0;
 }
 
-static void skl_platform_soc_free(struct snd_soc_component *component,
-				  struct snd_pcm *pcm)
-{
-	snd_pcm_lib_preallocate_free_for_all(pcm);
-}
-
 #define MAX_PREALLOC_SIZE	(32 * 1024 * 1024)
 
 static int skl_platform_soc_new(struct snd_soc_component *component,
@@ -1312,10 +1299,10 @@ static int skl_platform_soc_new(struct snd_soc_component *component,
 		size = CONFIG_SND_HDA_PREALLOC_SIZE * 1024;
 		if (size > MAX_PREALLOC_SIZE)
 			size = MAX_PREALLOC_SIZE;
-		snd_pcm_lib_preallocate_pages_for_all(pcm,
-						SNDRV_DMA_TYPE_DEV_SG,
-						&skl->pci->dev,
-						size, MAX_PREALLOC_SIZE);
+		snd_pcm_set_managed_buffer_all(pcm,
+					       SNDRV_DMA_TYPE_DEV_SG,
+					       &skl->pci->dev,
+					       size, MAX_PREALLOC_SIZE);
 	}
 
 	return 0;
@@ -1482,7 +1469,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.get_time_info	= skl_platform_soc_get_time_info,
 	.mmap		= skl_platform_soc_mmap,
 	.pcm_construct	= skl_platform_soc_new,
-	.pcm_destruct	= skl_platform_soc_free,
 	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
 };
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
