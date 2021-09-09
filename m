Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D30404C7B
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:56:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BA3C1710;
	Thu,  9 Sep 2021 13:55:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BA3C1710
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188573;
	bh=vbdf67mGKnbL5mlvXwU/akyou7+baScr6JPATev4oJY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SGAmSXmv+awGLhJTBcs4DUg/G/kEtLKAPcCYgUFZz+ctqFXH9EKhAd08j4jOJhRYQ
	 BlmO78zClakubfQBQX5e8fOgI+XpUQHTp02KYCKdtxfzhLJE3jOq0LehJUQb8TFbe0
	 BQ+S9r9XZkbKuZF62JuF92ZRr1Yg+nErdvxxI+aE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B4B5F804FE;
	Thu,  9 Sep 2021 13:54:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FF40F804EB; Thu,  9 Sep 2021 13:54:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67ECBF80253
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:54:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67ECBF80253
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y7raYbtu"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21C6861BA7;
 Thu,  9 Sep 2021 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188461;
 bh=vbdf67mGKnbL5mlvXwU/akyou7+baScr6JPATev4oJY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y7raYbtujL8lh58SeOq5uNOax0GxF4ez4Lt3h4FaTGn24/+0F/Jx2905lz4InIZYU
 HdJ6+ptRgpb7GHqx06Dzad6a1Z92wQdl7O/tVobPlSE4Au19MKul7S4tnrROps7w8j
 IOaTjuqUps9Zi1Zgl2IAq5YVhruhRLJOFJIt0ouhByb6p5XsOXRbKGWQk3/AGTw9Bo
 MMU9NCrvliP0FQmzz1RnvI3lDxYxakE2CEAXdHlHU4k2YWXp+huzQw+1PWo23qYGg9
 qsz1nyXudeJl6lUxxQYdeyvfgflka66oDHCoXJBAzBZGyxBa3m3f5XlzzI2nnuX26H
 ARrxT5MKy4MfQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 141/176] ASoC: intel: atom: Revert PCM buffer
 address setup workaround again
Date: Thu,  9 Sep 2021 07:50:43 -0400
Message-Id: <20210909115118.146181-141-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115118.146181-1-sashal@kernel.org>
References: <20210909115118.146181-1-sashal@kernel.org>
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
index 255b4d528a66..2784611196f0 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -127,7 +127,7 @@ static void sst_fill_alloc_params(struct snd_pcm_substream *substream,
 	snd_pcm_uframes_t period_size;
 	ssize_t periodbytes;
 	ssize_t buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
-	u32 buffer_addr = virt_to_phys(substream->runtime->dma_area);
+	u32 buffer_addr = substream->runtime->dma_addr;
 
 	channels = substream->runtime->channels;
 	period_size = substream->runtime->period_size;
-- 
2.30.2

