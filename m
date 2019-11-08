Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA2F43F3
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Nov 2019 10:55:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7766166B;
	Fri,  8 Nov 2019 10:54:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7766166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573206909;
	bh=ZJUOzNDHf4cY6iCEFFtCEy8xzbTgviRCNgqenBRAXY8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g9iND7rKou+FxWaErppmacRXB96KgbAks0vx8FBfLV/lL6k5tXPTwpjWcC637xBtH
	 UMguQsmy2T7Z8zmuNmx/+M09r0SqSTuWbSczx6YmsunluzIfr7r6Wck6N4rRhhMT15
	 xD3FUN8QS9uVDOz+92cxWw93qYM1DZGCW6+xvogU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF952F8065A;
	Fri,  8 Nov 2019 10:49:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43340F803F4; Fri,  8 Nov 2019 10:48:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC230F804CF
 for <alsa-devel@alsa-project.org>; Fri,  8 Nov 2019 10:46:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC230F804CF
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0DAE9B152;
 Fri,  8 Nov 2019 09:46:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  8 Nov 2019 10:46:41 +0100
Message-Id: <20191108094641.20086-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191108094641.20086-1-tiwai@suse.de>
References: <20191108094641.20086-1-tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Curtis Malainey <cujomalainey@chromium.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/8] ALSA: pcm: Unexport snd_pcm_sgbuf_ops_page
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

The helper is no longer referred after the recent code refactoring.
Drop the export for saving some bits and future misuse.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/pcm.h     | 8 --------
 sound/core/pcm_local.h  | 5 +++++
 sound/core/pcm_memory.c | 3 +--
 3 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index bbe6eb1ff5d2..2c0aa884f5f1 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -1236,14 +1236,6 @@ static inline int snd_pcm_lib_alloc_vmalloc_32_buffer
  */
 #define snd_pcm_substream_sgbuf(substream) \
 	snd_pcm_get_dma_buf(substream)->private_data
-
-struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream,
-				    unsigned long offset);
-#else /* !SND_DMA_SGBUF */
-/*
- * fake using a continuous buffer
- */
-#define snd_pcm_sgbuf_ops_page	NULL
 #endif /* SND_DMA_SGBUF */
 
 /**
diff --git a/sound/core/pcm_local.h b/sound/core/pcm_local.h
index 1161ab2d6a5b..5565e1c4196a 100644
--- a/sound/core/pcm_local.h
+++ b/sound/core/pcm_local.h
@@ -67,4 +67,9 @@ static inline void snd_pcm_timer_done(struct snd_pcm_substream *substream) {}
 void __snd_pcm_xrun(struct snd_pcm_substream *substream);
 void snd_pcm_group_init(struct snd_pcm_group *group);
 
+#ifdef CONFIG_SND_DMA_SGBUF
+struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream,
+				    unsigned long offset);
+#endif
+
 #endif	/* __SOUND_CORE_PCM_LOCAL_H */
diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 17ee361ce791..286f333f8e4c 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -255,7 +255,7 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
 EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages_for_all);
 
 #ifdef CONFIG_SND_DMA_SGBUF
-/**
+/*
  * snd_pcm_sgbuf_ops_page - get the page struct at the given offset
  * @substream: the pcm substream instance
  * @offset: the buffer offset
@@ -273,7 +273,6 @@ struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream, unsigne
 		return NULL;
 	return sgbuf->page_table[idx];
 }
-EXPORT_SYMBOL(snd_pcm_sgbuf_ops_page);
 #endif /* CONFIG_SND_DMA_SGBUF */
 
 /**
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
