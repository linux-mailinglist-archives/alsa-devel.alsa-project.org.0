Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A93EDC35
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Nov 2019 11:13:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D882177E;
	Mon,  4 Nov 2019 11:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D882177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572862386;
	bh=l16DC9oLR0srj/MW7hglrzRLCTWvFTCoCU9dmfQV8CY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jimzk5eXZOyS46pnwHiBhpcMXh1psTKBpSYNL7HGd9Z+agyf4GOHxUAA/sI33HyUD
	 plC6CENchi/J0p8s9fmsLo+slkcbjufvGc8xRtQQt7fkDuXKxidT4/Me0e2Q4eNi4t
	 vWRaWNSIrnXOZ5M80k6qEm5XyAZ6bAxeYK4G8ubw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5054DF8048D;
	Mon,  4 Nov 2019 11:11:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97F95F803F4; Mon,  4 Nov 2019 11:11:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1227DF8015B
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 11:11:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1227DF8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 09329B3EF
 for <alsa-devel@alsa-project.org>; Mon,  4 Nov 2019 10:11:16 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon,  4 Nov 2019 11:11:15 +0100
Message-Id: <20191104101115.27311-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: pcm: Fix missing check of the new
	non-cached buffer type
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

The check for the mmap support via hw_support_mmap() function misses
the case where the device is with SNDRV_DMA_TYPE_DEV_UC, which should
have been treated equally as SNDRV_DMA_TYPE_DEV.  Let's fix it.

Note that this bug doesn't hit any practical problem, because
SNDRV_DMA_TYPE_DEV_UC is used only for x86-specific drivers
(snd-hda-intel and snd-intel8x0) for the specific platforms that need
the non-cached buffers.  And, on such platforms, hw_support_mmap()
already returns true in anyway.  That's the reason I didn't put
Cc-to-stable mark here.  This is only for any theoretical future
extension.

Fixes: 425da159707b ("ALSA: pcm: use dma_can_mmap() to check if a device supports dma_mmap_*")
Fixes: 42e748a0b325 ("ALSA: memalloc: Add non-cached buffer type")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 91c6ad58729f..c3a139436ac2 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -222,7 +222,8 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
 		return false;
 
 	if (substream->ops->mmap ||
-	    substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV)
+	    (substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV &&
+	     substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV_UC))
 		return true;
 
 	return dma_can_mmap(substream->dma_buffer.dev.dev);
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
