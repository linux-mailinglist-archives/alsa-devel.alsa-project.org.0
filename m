Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C10118B4A
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:41:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F7EB1687;
	Tue, 10 Dec 2019 15:40:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F7EB1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575988898;
	bh=ptra0HZx1on2Q3Y+oAR8DOQyZH+ZxKXu4VyIrGW6OXI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D828vpCb9eYu7+bQWBcWLtyWhP78rRmDBqvtUL9Le2akLB5a0Zt7ZkmJD4mqmoXUX
	 8Egbpq422DBW1YoWG9HAVNr7De1POq+T3ioZIm86KbAT2HdgkwPDS0eBMT+KdEAl00
	 ymNMKzolTWR890C9EISvQqmpuIruIaTZh5kkk4XQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2870BF8034B;
	Tue, 10 Dec 2019 15:27:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9BDB2F802C4; Tue, 10 Dec 2019 15:27:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86C83F8011E
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:26:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C83F8011E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E782FB226;
 Tue, 10 Dec 2019 14:26:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Dec 2019 15:26:14 +0100
Message-Id: <20191210142614.19405-24-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210142614.19405-1-tiwai@suse.de>
References: <20191210142614.19405-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 Jie Yang <yang.jie@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
Subject: [alsa-devel] [PATCH for-5.6 23/23] ASoC: intel: skylake: Use
	managed buffer allocation
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
The pcm_construct ops contains only the superfluous call of
snd_pcm_lib_preallocate_free_for_all(), so dropped, too.

Cc: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Cc: Jie Yang <yang.jie@linux.intel.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/skylake/skl-pcm.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 8b9abb79a69e..ce14fa735d73 100644
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
@@ -1483,7 +1470,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.get_time_info	= skl_platform_soc_get_time_info,
 	.mmap		= skl_platform_soc_mmap,
 	.pcm_construct	= skl_platform_soc_new,
-	.pcm_destruct	= skl_platform_soc_free,
 	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
