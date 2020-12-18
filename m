Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5392DE535
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 15:58:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8190317A8;
	Fri, 18 Dec 2020 15:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8190317A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608303499;
	bh=4ZmqnqE6DFql35Ec0rLznE8kxwp+MgLSN2HrkaLPnhk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QqY/fHM4pPWJELTpfNwJg+3qmwBFYnseeVsOl3uWBeo/jwerw8udBGZJ7djFX40wp
	 XWB/jc7sbXUufCtvq7PH7nLryqRfMkJpC/ltDEX10Gnofke3/mTkJMhEoULIxrI/QY
	 jXgQQcnUEKwldLYYPbkrg8g37pWekTOvx65AZaAw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A67D3F80272;
	Fri, 18 Dec 2020 15:56:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52D62F80274; Fri, 18 Dec 2020 15:56:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D990DF80171
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 15:56:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D990DF80171
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C77DCAD0B;
 Fri, 18 Dec 2020 14:56:27 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: pcm: Clear the full allocated memory at hw_params
Date: Fri, 18 Dec 2020 15:56:25 +0100
Message-Id: <20201218145625.2045-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201218145625.2045-1-tiwai@suse.de>
References: <20201218145625.2045-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Robin Gong <yibin.gong@nxp.com>, Lars-Peter Clausen <lars@metafoo.de>
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

The PCM hw_params core function tries to clear up the PCM buffer
before actually using for avoiding the information leak from the
previous usages or the usage before a new allocation.  It performs the
memset() with runtime->dma_bytes, but this might still leave some
remaining bytes untouched; namely, the PCM buffer size is aligned in
page size for mmap, hence runtime->dma_bytes doesn't necessarily cover
all PCM buffer pages, and the remaining bytes are exposed via mmap.

This patch changes the memory clearance to cover the all buffer pages
if the stream is supposed to be mmap-ready (that guarantees that the
buffer size is aligned in page size).

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 47b155a49226..9f3f8e953ff0 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -755,8 +755,13 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
 		runtime->boundary *= 2;
 
 	/* clear the buffer for avoiding possible kernel info leaks */
-	if (runtime->dma_area && !substream->ops->copy_user)
-		memset(runtime->dma_area, 0, runtime->dma_bytes);
+	if (runtime->dma_area && !substream->ops->copy_user) {
+		size_t size = runtime->dma_bytes;
+
+		if (runtime->info & SNDRV_PCM_INFO_MMAP)
+			size = PAGE_ALIGN(size);
+		memset(runtime->dma_area, 0, size);
+	}
 
 	snd_pcm_timer_resolution_change(substream);
 	snd_pcm_set_state(substream, SNDRV_PCM_STATE_SETUP);
-- 
2.26.2

