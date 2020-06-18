Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E666B1FDFEA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 03:45:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DDB916BD;
	Thu, 18 Jun 2020 03:45:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DDB916BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592444752;
	bh=ufG/LO2wu+SJn0Q769p90/ZBOImZJGlo/tsAnXrUPqI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qPDLmBmowJ2p9iyEninRUs0TEATyI52CSeAWPKKlTFBHmXqlhq+J/MlVKTy2jTUqx
	 t+A+Dzaju5JNMZQr8quLy50TMolyI1+AGi2nGendj8rct3fCjA4pswHWsPZ8uL10t+
	 yOWKtGngoCQbGDVSpyohzFX49/NRXkbra1YGPuYU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A34B6F8034F;
	Thu, 18 Jun 2020 03:21:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D67EF8034E; Thu, 18 Jun 2020 03:21:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2B8FF80348
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 03:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2B8FF80348
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="WKXReXu1"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8C4AC21D82;
 Thu, 18 Jun 2020 01:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592443262;
 bh=ufG/LO2wu+SJn0Q769p90/ZBOImZJGlo/tsAnXrUPqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WKXReXu1XfOn6FiCsWXQmewqkK3un/zKOCuiSXoKrTKMsIt7FQcOjYsDTJZcISgRp
 hmuZqRKpet1TrTtfsCxrFXqMh8Lr7B4MJodTDQ0aMb/S2iSiixbnvOkPG1td4oPIMH
 ylnEm2xPhO9+hNIRuAyX2HtXSD2XRBeSVxDhF0oQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 209/266] ASoC: fsl_asrc_dma: Fix dma_chan leak
 when config DMA channel failed
Date: Wed, 17 Jun 2020 21:15:34 -0400
Message-Id: <20200618011631.604574-209-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618011631.604574-1-sashal@kernel.org>
References: <20200618011631.604574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Xin Tan <tanxin.ctf@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
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

From: Xiyu Yang <xiyuyang19@fudan.edu.cn>

[ Upstream commit 36124fb19f1ae68a500cd76a76d40c6e81bee346 ]

fsl_asrc_dma_hw_params() invokes dma_request_channel() or
fsl_asrc_get_dma_channel(), which returns a reference of the specified
dma_chan object to "pair->dma_chan[dir]" with increased refcnt.

The reference counting issue happens in one exception handling path of
fsl_asrc_dma_hw_params(). When config DMA channel failed for Back-End,
the function forgets to decrease the refcnt increased by
dma_request_channel() or fsl_asrc_get_dma_channel(), causing a refcnt
leak.

Fix this issue by calling dma_release_channel() when config DMA channel
failed.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
Link: https://lore.kernel.org/r/1590415966-52416-1-git-send-email-xiyuyang19@fudan.edu.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_asrc_dma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 01052a0808b0..5aee6b8366d2 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -241,6 +241,7 @@ static int fsl_asrc_dma_hw_params(struct snd_pcm_substream *substream,
 	ret = dmaengine_slave_config(pair->dma_chan[dir], &config_be);
 	if (ret) {
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
+		dma_release_channel(pair->dma_chan[dir]);
 		return ret;
 	}
 
-- 
2.25.1

