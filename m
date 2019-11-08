Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB74F43EA
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 10:52:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C7C21683;
	Fri,  8 Nov 2019 10:51:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C7C21683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573206747;
	bh=hI7IPFvH43H4+grGmbAgN+uQJtrhpeGrEpfrnIjUvXk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QouNo4QuoAqCqGa+QDw2OnHj5rBGDYXAVRT4vdpQraj5fdn6wKtxXB+8GfaYxDbTe
	 9S55sz5ZBdC3V7YQvYbL0rcVaPka/7kpuKGoYcAe12zUokf3dO+8judUqLU0pY9F+w
	 oYoS1Dq3ufVyfsOl3/Hrj/lJD7bEnIVj2L+X3XVU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4221F8060F;
	Fri,  8 Nov 2019 10:49:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D819F8045F; Fri,  8 Nov 2019 10:48:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17F71F803D0
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 10:46:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17F71F803D0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C53C8B03E;
 Fri,  8 Nov 2019 09:46:51 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 10:46:36 +0100
Message-Id: <20191108094641.20086-4-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108094641.20086-1-tiwai@suse.de>
References: <20191108094641.20086-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/8] ASoC: intel: Drop superfluous
	snd_pcm_sgbuf_ops_page
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

snd_pcm_sgbuf_ops_page is no longer needed to be set explicitly to PCM
page ops since the recent change in the PCM core (*).  Leaving it NULL
should work as long as the preallocation has been done properly.

This patch drops the redundant lines.

(*) 7e8edae39fd1: ALSA: pcm: Handle special page mapping in the
                  default mmap handler

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/intel/haswell/sst-haswell-pcm.c | 12 ------------
 sound/soc/intel/skylake/skl-pcm.c         | 12 ------------
 2 files changed, 24 deletions(-)

diff --git a/sound/soc/intel/haswell/sst-haswell-pcm.c b/sound/soc/intel/haswell/sst-haswell-pcm.c
index 6e498a581d20..a3a5bba2fbd9 100644
--- a/sound/soc/intel/haswell/sst-haswell-pcm.c
+++ b/sound/soc/intel/haswell/sst-haswell-pcm.c
@@ -796,17 +796,6 @@ static snd_pcm_uframes_t hsw_pcm_pointer(struct snd_soc_component *component,
 	return offset;
 }
 
-#ifdef CONFIG_SND_DMA_SGBUF
-static struct page *hsw_pcm_page(struct snd_soc_component *component,
-				 struct snd_pcm_substream *substream,
-				 unsigned long offset)
-{
-	return snd_pcm_sgbuf_ops_page(substream, offset);
-}
-#else
-#define hsw_pcm_page NULL
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 static int hsw_pcm_open(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
@@ -1128,7 +1117,6 @@ static const struct snd_soc_component_driver hsw_dai_component = {
 	.hw_free	= hsw_pcm_hw_free,
 	.trigger	= hsw_pcm_trigger,
 	.pointer	= hsw_pcm_pointer,
-	.page		= hsw_pcm_page,
 	.ioctl		= snd_soc_pcm_lib_ioctl,
 	.pcm_construct	= hsw_pcm_new,
 	.controls	= hsw_volume_controls,
diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index 0850141c7d47..6bd14f65fe71 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -1235,17 +1235,6 @@ static int skl_platform_soc_mmap(struct snd_soc_component *component,
 	return snd_pcm_lib_default_mmap(substream, area);
 }
 
-#ifdef CONFIG_SND_DMA_SGBUF
-static struct page *skl_platform_soc_page(struct snd_soc_component *component,
-					  struct snd_pcm_substream *substream,
-					  unsigned long offset)
-{
-	return snd_pcm_sgbuf_ops_page(substream, offset);
-}
-#else
-#define skl_platform_soc_page NULL
-#endif /* CONFIG_SND_DMA_SGBUF */
-
 static u64 skl_adjust_codec_delay(struct snd_pcm_substream *substream,
 				u64 nsec)
 {
@@ -1493,7 +1482,6 @@ static const struct snd_soc_component_driver skl_component  = {
 	.pointer	= skl_platform_soc_pointer,
 	.get_time_info	= skl_platform_soc_get_time_info,
 	.mmap		= skl_platform_soc_mmap,
-	.page		= skl_platform_soc_page,
 	.pcm_construct	= skl_platform_soc_new,
 	.pcm_destruct	= skl_platform_soc_free,
 	.module_get_upon_open = 1, /* increment refcount when a pcm is opened */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
