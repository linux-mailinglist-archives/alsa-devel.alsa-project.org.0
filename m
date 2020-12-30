Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CED1F2E78E6
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 14:05:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5EA4F183A;
	Wed, 30 Dec 2020 14:04:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5EA4F183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609333537;
	bh=zGv/m5AikMZ667F9yl+zvQX9024+DMSLSU/2yaYPhcc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kW52OkQBT2C/hhszP55u8uo2+4yHfDo6HHmaZpYsgeKbTNdJu3C+HWKdtgw8m8nDE
	 K9Eq0jRpjh4aX63nsNDO340nLie3vijQNoiVqezHZ0JWVztqK5oMG/pxHb7qDZ63ly
	 aNdsJ6bquTObuR/I/EcGIplU23b0NGLxwfplKBtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFF77F80132;
	Wed, 30 Dec 2020 14:04:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FD0FF801F5; Wed, 30 Dec 2020 14:04:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BCEFF80162
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 14:03:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BCEFF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cKu2GX4K"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D9C222475;
 Wed, 30 Dec 2020 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609333431;
 bh=zGv/m5AikMZ667F9yl+zvQX9024+DMSLSU/2yaYPhcc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cKu2GX4KaR2u/pGLbnA5HT98ofpxh2C9Vg5VWf3ULgvDekx/psp81RI5GscfZL4Uf
 mA66kDcxaPPffUgXJocYq0UwxC1CLRjOqKjJGH8crfNbjuqqJz/khfaog8a+F/Tm4s
 NQTHtqmx9PxlxGmaokSOELNjsdn0B1pxpKQh8bFxGtkS1OI5MuSLJhzi8Ry+CW5aW+
 MBafoHbq4v35jLGdgZjAg6zJ3Pz0MeBJHjYduubOjMFtwyCaXtQ04xoPIZWE2nvgHk
 aBOGIPQzR+FReMB5dp/Ohrg6JWvbYVtn2xZGspehcUP1/Yjyqz4zfliA6733qEnyPZ
 ErvDs/wM1AayA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 28/31] ALSA: pcm: Clear the full allocated memory
 at hw_params
Date: Wed, 30 Dec 2020 08:03:10 -0500
Message-Id: <20201230130314.3636961-28-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201230130314.3636961-1-sashal@kernel.org>
References: <20201230130314.3636961-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org, Lars-Peter Clausen <lars@metafoo.de>
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

From: Takashi Iwai <tiwai@suse.de>

[ Upstream commit 618de0f4ef11acd8cf26902e65493d46cc20cc89 ]

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

Reviewed-by: Lars-Peter Clausen <lars@metafoo.de>
Link: https://lore.kernel.org/r/20201218145625.2045-3-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/core/pcm_native.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 47b155a49226f..9f3f8e953ff04 100644
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
2.27.0

