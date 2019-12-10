Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB1119397
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 22:13:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC0DB1669;
	Tue, 10 Dec 2019 22:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC0DB1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576012432;
	bh=vGaT4X/CbbO06ApbVVIsuoREQjnR7cayIaMijzC7xVM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cab+52OMaO4mgGjacCt5wgmTs8jkqOX9J6FQJDvYBxmbj63qr2lTU55bB48QFA0JJ
	 pyvHtfT3UCn+H/oc9pS91BFygYJAxLl+MTL919lo3Su/v0lU6T0uQxJyZmyL6TUEC/
	 oYk6AG/YiXoMI6drmpQgsiSFvd0yN+Uoio29xAMk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7755CF80272;
	Tue, 10 Dec 2019 22:10:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94E2AF80271; Tue, 10 Dec 2019 22:10:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B081CF80268
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 22:10:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B081CF80268
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nyASVQNi"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C691324680;
 Tue, 10 Dec 2019 21:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576012247;
 bh=rwRuxKl4wtv89HyUaQghbveRZ1eF/vZ80lSEysd1yrE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nyASVQNiWzYQc+Ng6KrcidsG7svF0H+iMDxF+pxT8UhWFzrkBjxZWYDGDXwjjKhbR
 h03NvsvUdVPfHDqcAxNWIA2pqmb24ZibGjWZfbymA/uYQC27yfWQ8CTcx6WjQjqbq6
 XasLOGciwaDyG14SjFtg23kCalV8DNtS7y8aslLM=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Tue, 10 Dec 2019 16:05:00 -0500
Message-Id: <20191210210735.9077-156-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210210735.9077-1-sashal@kernel.org>
References: <20191210210735.9077-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH AUTOSEL 5.4 195/350] ALSA: pcm: Fix missing
	check of the new non-cached buffer type
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 6111fd2370eecae9f11bfdc08ba097e0b51fcfd3 ]

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
Link: https://lore.kernel.org/r/20191104101115.27311-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/pcm_native.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 91c6ad58729fe..c3a139436ac26 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
