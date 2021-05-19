Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A192388C11
	for <lists+alsa-devel@lfdr.de>; Wed, 19 May 2021 12:51:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5044167E;
	Wed, 19 May 2021 12:50:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5044167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621421482;
	bh=kFvbkt+QgKqh1RR/T8GvsLtgxKyaio8KFYLcVIRZ/9s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=joqDlYKMRrEdIzIZDX7rM+4hpXj2ro3rasa3PQZrrp9AvMi+febyUE/byAUQMuZ1/
	 wtCioIrSwrpMuMUqFZi28djN6lFyNApCChVKAz4HMlX94zKiLS7ao68mjLd/IzBnRN
	 J/zKH1MPpYpLF4gUCY9Ls9fMGpJGGoMJ2PkSD3Cw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA83F80258;
	Wed, 19 May 2021 12:49:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 28502F80246; Wed, 19 May 2021 12:49:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06C03F80148
 for <alsa-devel@alsa-project.org>; Wed, 19 May 2021 12:49:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06C03F80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com
 header.b="AQghzPVz"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1621421384; x=1652957384;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kFvbkt+QgKqh1RR/T8GvsLtgxKyaio8KFYLcVIRZ/9s=;
 b=AQghzPVzIFIQTkHV4R4e+k/BG/cvlKkE5PmXpWmf2DHbWGk8+yEjRnA2
 2kQYI5Ll8EHlD0tHtGtRhK3kOzML8hgtmCJyL2kRVRnDpWm3UdiOvLR33
 jBqvMEOduepTCrARWqqtY1Ie6eGVVNEipj8fVVlejRtUwE/B7xPrU9ZzO
 yzwhtwiLUEvDwSzJyGoQnsUoXVWeX9VqveofWxnj8A5HtPZlOQIX86p61
 w1AU86zPqIZvd5OxQd0240RAEsa8JjZnbsIeAZGye/ZAGZNCaNnTilRww
 s2ajchVoaydlmBMxV8IJj0GQC3tPBsO2Cq1SSkn84ELoka1m+rfRukMfY A==;
IronPort-SDR: RSbC8ILc3hFXkjAJorW2jJyxxKJEdarEEa7D2fyBRufLeadke1cTeP3zQcddcdlA5IUBkZt8bq
 oNqznPgk5IHSNfPTLpzEz35S57wP+X3l7EyuMESD8Okma33vAWC/DB/NaO3LP+ubeAds4Ka3y3
 vrEJ0vM1SpdglEZDf33GjUPMwiJxC0KnljZRqAKUOW4QPFk7M6bq8bcXMVC9ZHcMx5WGFz4y6L
 1HpUTQNe9x4I6nsTOovFi5H1+KhliYenQ7HyFXmW4Iw5hGztZP+M7NEtbetJUBMpvtJHuWkyBw
 cDw=
X-IronPort-AV: E=Sophos;i="5.82,312,1613458800"; d="scan'208";a="118456735"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2021 03:49:39 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 19 May 2021 03:49:38 -0700
Received: from rob-ult-m19940.amer.actel.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Wed, 19 May 2021 03:49:34 -0700
From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
To: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>
Subject: [RFC PATCH 1/6] ALSA: core: pcm: Create helpers to allocate/free
 struct snd_pcm_runtime
Date: Wed, 19 May 2021 13:48:37 +0300
Message-ID: <20210519104842.977895-2-codrin.ciubotariu@microchip.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
References: <20210519104842.977895-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Cc: lars@metafoo.de, kuninori.morimoto.gx@renesas.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com, broonie@kernel.org,
 joe@perches.com, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Cristian.Birsan@microchip.com, nicolas.ferre@microchip.com
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Create helpers to be able to reuse code for allocation and freeing of
struct snd_pcm_runtime.

Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
---
 include/sound/pcm.h |  2 ++
 sound/core/pcm.c    | 82 +++++++++++++++++++++++++++------------------
 2 files changed, 52 insertions(+), 32 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 2e1200d17d0c..025b4d2ba0fe 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -574,6 +574,8 @@ static inline int snd_pcm_suspend_all(struct snd_pcm *pcm)
 }
 #endif
 int snd_pcm_kernel_ioctl(struct snd_pcm_substream *substream, unsigned int cmd, void *arg);
+struct snd_pcm_runtime *snd_pcm_runtime_alloc(void);
+void snd_pcm_runtime_free(struct snd_pcm_runtime *runtime);
 int snd_pcm_open_substream(struct snd_pcm *pcm, int stream, struct file *file,
 			   struct snd_pcm_substream **rsubstream);
 void snd_pcm_release_substream(struct snd_pcm_substream *substream);
diff --git a/sound/core/pcm.c b/sound/core/pcm.c
index b163164a83ec..8ecb14b27460 100644
--- a/sound/core/pcm.c
+++ b/sound/core/pcm.c
@@ -876,6 +876,53 @@ static int snd_pcm_dev_free(struct snd_device *device)
 	return snd_pcm_free(pcm);
 }
 
+struct snd_pcm_runtime *snd_pcm_runtime_alloc(void)
+{
+	struct snd_pcm_runtime *runtime;
+	size_t size;
+
+	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
+	if (!runtime)
+		return NULL;
+
+	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status));
+	runtime->status = alloc_pages_exact(size, GFP_KERNEL);
+	if (!runtime->status) {
+		kfree(runtime);
+		return NULL;
+	}
+	memset(runtime->status, 0, size);
+
+	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control));
+	runtime->control = alloc_pages_exact(size, GFP_KERNEL);
+	if (!runtime->control) {
+		free_pages_exact(runtime->status,
+				 PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
+		kfree(runtime);
+		return NULL;
+	}
+	memset(runtime->control, 0, size);
+
+	init_waitqueue_head(&runtime->sleep);
+	init_waitqueue_head(&runtime->tsleep);
+
+	runtime->status->state = SNDRV_PCM_STATE_OPEN;
+
+	return runtime;
+}
+EXPORT_SYMBOL_GPL(snd_pcm_runtime_alloc);
+
+void snd_pcm_runtime_free(struct snd_pcm_runtime *runtime)
+{
+	free_pages_exact(runtime->status,
+			 PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
+	free_pages_exact(runtime->control,
+			 PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control)));
+	kfree(runtime->hw_constraints.rules);
+	kfree(runtime);
+}
+EXPORT_SYMBOL_GPL(snd_pcm_runtime_free);
+
 int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 			     struct file *file,
 			     struct snd_pcm_substream **rsubstream)
@@ -885,7 +932,6 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 	struct snd_pcm_runtime *runtime;
 	struct snd_card *card;
 	int prefer_subdevice;
-	size_t size;
 
 	if (snd_BUG_ON(!pcm || !rsubstream))
 		return -ENXIO;
@@ -939,33 +985,10 @@ int snd_pcm_attach_substream(struct snd_pcm *pcm, int stream,
 	if (substream == NULL)
 		return -EAGAIN;
 
-	runtime = kzalloc(sizeof(*runtime), GFP_KERNEL);
-	if (runtime == NULL)
+	runtime = snd_pcm_runtime_alloc();
+	if (!runtime)
 		return -ENOMEM;
 
-	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status));
-	runtime->status = alloc_pages_exact(size, GFP_KERNEL);
-	if (runtime->status == NULL) {
-		kfree(runtime);
-		return -ENOMEM;
-	}
-	memset(runtime->status, 0, size);
-
-	size = PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control));
-	runtime->control = alloc_pages_exact(size, GFP_KERNEL);
-	if (runtime->control == NULL) {
-		free_pages_exact(runtime->status,
-			       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
-		kfree(runtime);
-		return -ENOMEM;
-	}
-	memset(runtime->control, 0, size);
-
-	init_waitqueue_head(&runtime->sleep);
-	init_waitqueue_head(&runtime->tsleep);
-
-	runtime->status->state = SNDRV_PCM_STATE_OPEN;
-
 	substream->runtime = runtime;
 	substream->private_data = pcm->private_data;
 	substream->ref_count = 1;
@@ -985,11 +1008,6 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	runtime = substream->runtime;
 	if (runtime->private_free != NULL)
 		runtime->private_free(runtime);
-	free_pages_exact(runtime->status,
-		       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_status)));
-	free_pages_exact(runtime->control,
-		       PAGE_ALIGN(sizeof(struct snd_pcm_mmap_control)));
-	kfree(runtime->hw_constraints.rules);
 	/* Avoid concurrent access to runtime via PCM timer interface */
 	if (substream->timer) {
 		spin_lock_irq(&substream->timer->lock);
@@ -998,7 +1016,7 @@ void snd_pcm_detach_substream(struct snd_pcm_substream *substream)
 	} else {
 		substream->runtime = NULL;
 	}
-	kfree(runtime);
+	snd_pcm_runtime_free(runtime);
 	put_pid(substream->pid);
 	substream->pid = NULL;
 	substream->pstr->substream_opened--;
-- 
2.27.0

