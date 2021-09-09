Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB4A404CA7
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Sep 2021 13:59:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C877C1746;
	Thu,  9 Sep 2021 13:58:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C877C1746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631188755;
	bh=0OAIQSn2+lMCKkm9MukIrYLyF/l4Hgjf7LgoW1dyzu4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bx4XbQrc4jO79XtR9xytM1hlDDBg0l132aLyvTlwMmu3lylI5R+K8S84RyEAIrBnB
	 vWqVWe06hYtz5Crl15LM6RfuBMa97R92qgX95CCHlumiEbzN/GxSvjaiLn0+qRR/h0
	 OMzJ2zorhbylDLIAsaeJAQ61IhOpsIGwlZ+eudqk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C94CF80166;
	Thu,  9 Sep 2021 13:57:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0A81F804E3; Thu,  9 Sep 2021 13:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9033F80166
 for <alsa-devel@alsa-project.org>; Thu,  9 Sep 2021 13:56:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9033F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TEll6y+V"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 76D6F63212;
 Thu,  9 Sep 2021 11:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631188614;
 bh=0OAIQSn2+lMCKkm9MukIrYLyF/l4Hgjf7LgoW1dyzu4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TEll6y+VMvtPTys0tCHtoApWQdzqOJJqY8TeuycNI+Jja9xpf/XOAcsFNMrlW3HpI
 KX38mIdfzTdMOA9HPPYT2vzQ0MT7G5KDHRe84DlrPHyeEFN202R1s39ehq3PED3JU0
 MAPEX7vZ6uga1Om9WgI1bbPEzoQzb3Xsgxyq9HB/OteRYONMDTEcNJa3xJpUQvvMY1
 YGPkqnE/3DZm7En71dCIQjbPAigWFelScpUckBVrI5A6hhWzlrpksqfvQCAeeyvHrd
 g1TWTBh+69StrlQGLGTFP6zoIoXrN1HC8yHbC8ahz+Ui3s48lW/LgsiLLYCi43hLss
 HyB/gmpNXwqwA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 084/109] ASoC: intel: atom: Revert PCM buffer
 address setup workaround again
Date: Thu,  9 Sep 2021 07:54:41 -0400
Message-Id: <20210909115507.147917-84-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210909115507.147917-1-sashal@kernel.org>
References: <20210909115507.147917-1-sashal@kernel.org>
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
index 7d59846808b5..216e88624c5f 100644
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

