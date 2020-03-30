Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A89197DB1
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Mar 2020 15:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABAB91660;
	Mon, 30 Mar 2020 15:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABAB91660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585576714;
	bh=84XR/kmAYuvrz4WThvTqKMY9cMOYbn7CIEC+zWMi9Fc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hAT50nVT7Dz9Hemje6p2mjqB6LAOxchynfssLJgOA7F/DsKaAitvO7AclDhlMFnV4
	 /BB9yGJAozZ3TNtUZBbWcXMn4ptdXx3pPSaLrKMUL2sVNe67NZ0ZbT2tDxDgSyAFzT
	 8/nL0qYG9gQX+S5SNN2zuJoLHe+JJAveiRIAJIl4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF420F800EB;
	Mon, 30 Mar 2020 15:56:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9861F80148; Mon, 30 Mar 2020 15:56:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34BA9F800EB
 for <alsa-devel@alsa-project.org>; Mon, 30 Mar 2020 15:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34BA9F800EB
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5035CAD57;
 Mon, 30 Mar 2020 13:56:46 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: bcm: Fix pointer cast warning
Date: Mon, 30 Mar 2020 15:56:45 +0200
Message-Id: <20200330135645.9707-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Cc: alsa-devel@alsa-project.org
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

The NULL check can be done gracefully without cast.  It fixes a
compile warning like:
  sound/soc/bcm/bcm63xx-pcm-whistler.c:184:6: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]

Fixes: 88eb404ccc3e ("ASoC: brcm: Add DSL/PON SoC audio driver")
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/bcm/bcm63xx-pcm-whistler.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/bcm/bcm63xx-pcm-whistler.c b/sound/soc/bcm/bcm63xx-pcm-whistler.c
index e46c390683e7..b7a1efc7406e 100644
--- a/sound/soc/bcm/bcm63xx-pcm-whistler.c
+++ b/sound/soc/bcm/bcm63xx-pcm-whistler.c
@@ -181,7 +181,7 @@ bcm63xx_pcm_pointer(struct snd_soc_component *component,
 	snd_pcm_uframes_t x;
 	struct bcm63xx_runtime_data *prtd = substream->runtime->private_data;
 
-	if ((void *)prtd->dma_addr_next == NULL)
+	if (!prtd->dma_addr_next)
 		prtd->dma_addr_next = substream->runtime->dma_addr;
 
 	x = bytes_to_frames(substream->runtime,
-- 
2.16.4

