Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3399425B5CF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 23:24:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 629421870;
	Wed,  2 Sep 2020 23:24:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 629421870
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599081892;
	bh=J60TIVT1goSzJshRkQz85qcx1BeHHadqDN2uZlq00YE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RX6ZkBQi7SPdjhl83rU/Y2c9RrvizDllfoEQBA3duU9I68A13QgZQKKTiGJLn52Up
	 iILlAweHEAZrbUf6rRB9BjpdzJIuR7OwKWVunF05xC41VCqFFLpufHllpoICsm3a7f
	 CnoK8DqZPuHpRFkBppgQiYo6VCrw9sL1Li8GnHaQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9895FF802A1;
	Wed,  2 Sep 2020 23:22:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB4C7F802EB; Wed,  2 Sep 2020 23:22:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2F99F8024A
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 23:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2F99F8024A
IronPort-SDR: 7IVpiP/kAhhoT8HK3P3spd+Vln97NLrc8FFVFV9MiL5PzxYRxb8oSNEB6eQ2KXVXAPGOgkx+pJ
 hvRnx0mJfINw==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="157482852"
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="157482852"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:22:00 -0700
IronPort-SDR: 7WcfeQ8IIQtAH3wZz6nFe2lQJvmb0docn7pLwmnWaKqdgV64JZXMK0IWCb2RuSqvkKZevV62jO
 d42lINv/WdWg==
X-IronPort-AV: E=Sophos;i="5.76,384,1592895600"; d="scan'208";a="477798267"
Received: from rnagarat-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.56.27])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 14:21:59 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/18] ALSA: core: pcm_memory: dereference pointer after NULL
 checks
Date: Wed,  2 Sep 2020 16:21:18 -0500
Message-Id: <20200902212133.30964-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
References: <20200902212133.30964-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Fix cppcheck warnings:

sound/core/pcm_memory.c:380:26: warning: Either the condition
'!substream' is redundant or there is possible null pointer
dereference: substream. [nullPointerRedundantCheck]
 struct snd_card *card = substream->pcm->card;
                         ^
sound/core/pcm_memory.c:384:6: note: Assuming that condition
'!substream' is not redundant
 if (PCM_RUNTIME_CHECK(substream))
     ^
sound/core/pcm_memory.c:380:26: note: Null pointer dereference
 struct snd_card *card = substream->pcm->card;
                         ^
sound/core/pcm_memory.c:433:26: warning: Either the condition
'!substream' is redundant or there is possible null pointer
dereference: substream. [nullPointerRedundantCheck]
 struct snd_card *card = substream->pcm->card;
                         ^
sound/core/pcm_memory.c:436:6: note: Assuming that condition
'!substream' is not redundant
 if (PCM_RUNTIME_CHECK(substream))
     ^
sound/core/pcm_memory.c:433:26: note: Null pointer dereference
 struct snd_card *card = substream->pcm->card;
                         ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/core/pcm_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
index 1bf6a3d9e0c2..4f03ba8ed0ae 100644
--- a/sound/core/pcm_memory.c
+++ b/sound/core/pcm_memory.c
@@ -377,7 +377,7 @@ struct page *snd_pcm_sgbuf_ops_page(struct snd_pcm_substream *substream, unsigne
  */
 int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 {
-	struct snd_card *card = substream->pcm->card;
+	struct snd_card *card;
 	struct snd_pcm_runtime *runtime;
 	struct snd_dma_buffer *dmab = NULL;
 
@@ -387,6 +387,7 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size)
 		       SNDRV_DMA_TYPE_UNKNOWN))
 		return -EINVAL;
 	runtime = substream->runtime;
+	card = substream->pcm->card;
 
 	if (runtime->dma_buffer_p) {
 		/* perphaps, we might free the large DMA memory region
-- 
2.25.1

