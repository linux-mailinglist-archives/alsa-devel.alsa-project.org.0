Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4323E404D63
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 14:04:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC5DF1786;
	Thu,  9 Sep 2021 14:03:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC5DF1786
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631189061;
	bh=76Fui7fuF8HRtuOBN0LKMcUQ/CbVv8jOsvJDzktitnQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=izMkwixsqjsDCDorVPDn2i++zoWtqM6kjJwApm3trO5fsBc9FuYUndjuGuUWq3Hdp
	 mNrMNT5OUOMbo8tirJa/KG2dkCSnl9YQQIOywPFDQJ60IeBgRojJOGbaD6muSOJQk1
	 UZPRgqfHrHLEFNqT11xwyxFdcsynqaVwdXV36ohA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7003F804CF;
	Thu,  9 Sep 2021 14:02:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AE0BF804E6; Thu,  9 Sep 2021 14:02:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B9A4F804E4
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 14:01:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B9A4F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="RdrwGPif"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24635632DF;
 Thu,  9 Sep 2021 12:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188912;
 bh=76Fui7fuF8HRtuOBN0LKMcUQ/CbVv8jOsvJDzktitnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RdrwGPifZTK8/sEeJ5yR+y2DcX348g5Jv7lDC2W9X5HxVwifi7FH7SRfbDuik6A6u
 m9EVLW2yiXotU9RsdIFQWP1ssn3u8NijgwR9c2eaAtPOrumD8uMTVrqoSO9MzdC6A8
 oaIabVXM/G91DL9Xj02v0FgEBYWAVGNJHv8et5K4alzKgaJRkswAAEoVeYM/IRwJQl
 YqTMsLyLn8oGLyPPmibUgm0BDFlhuu2QZqhoc1INB/oPz/4a8pizL+t/yM2wvaOw9g
 adpT8BAnaGfT6zRSZGIABE9n9jmSzn1dNpUwqQXlOQmSzO+a/jFwnzOYkNakwLaKor
 A5DaOxuLbHKFg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 29/35] ASoC: intel: atom: Revert PCM buffer
 address setup workaround again
Date: Thu,  9 Sep 2021 08:01:10 -0400
Message-Id: <20210909120116.150912-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909120116.150912-1-sashal@kernel.org>
References: <20210909120116.150912-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Sasha Levin <sashal@kernel.org>,
 alsa-devel@alsa-project.org
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

[ Upstream commit e28ac04a705e946eddc5e7d2fc712dea3f20fe9e ]

We worked around the breakage of PCM buffer setup by the commit
65ca89c2b12c ("ASoC: intel: atom: Fix breakage for PCM buffer address
setup"), but this isn't necessary since the CONTINUOUS buffer type
also sets runtime->dma_addr since commit f84ba106a018 ("ALSA:
memalloc: Store snd_dma_buffer.addr for continuous pages, too").
Let's revert the change again.

Link: https://lore.kernel.org/r/20210822072127.9786-1-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/intel/atom/sst-mfld-platform-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index d0d338533eb6..64079423b298 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -134,7 +134,7 @@ static void sst_fill_alloc_params(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t period_size;
 	ssize_t periodbytes;
 	ssize_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-	u32 buffer_addr = virt_to_phys(substream->runtime->dma_area);
+	u32 buffer_addr = substream->runtime->dma_addr;
 
 	channels = substream->runtime->channels;
 	period_size = substream->runtime->period_size;
-- 
2.30.2

