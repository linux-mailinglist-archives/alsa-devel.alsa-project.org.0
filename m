Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2008D80095
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 21:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8623C16CF;
	Fri,  2 Aug 2019 21:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8623C16CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564772533;
	bh=WoTAIMvkvXRDLJq783AxXgqIPb5afldfnICkljNdDik=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=bON0xuEMs+qQ4j5DgnOBNY0+T0w5mxct8vDdJXA1ZCn38rgErp2IgnbSBqrp7f9uj
	 VAZYpbv5vQKjUbal50XC9DTuNChKreQOUKkJP756WiznGQmmNZZ7gZz/fCSnwy70Or
	 Pj7t/ChxneSFd10QJor/lExmqU0cj1gX7WLfMN/U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD4F7F8048F;
	Fri,  2 Aug 2019 21:00:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3D18F80214; Fri,  2 Aug 2019 21:00:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E6B7BF80214
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 21:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E6B7BF80214
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="gQTTNZKZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Lc5K16BdSsvadr8ePzLWUSeCePK+/fvGUChe3owFx+8=; b=gQTTNZKZx5+i
 eH6NwlTYIhBqeAmbTdPEoT0pDjbm2GiyX+5ODoM7WfxTslXbe0T92TFNthE3iiLu3IUZSOU8JAciW
 lywZ4KfAg16kZQvBKPe1VInNHR46X4xD+jrKVXzCmWWDn54/fUAFrvAgpUVQ7yI68hXE4h/3rOkE0
 SRqh4=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1htcmq-0000AC-8t; Fri, 02 Aug 2019 19:00:20 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2AB762742DA7; Fri,  2 Aug 2019 20:00:19 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
In-Reply-To: <1564753899-17124-2-git-send-email-Vijendar.Mukunda@amd.com>
X-Patchwork-Hint: ignore
Message-Id: <20190802190019.2AB762742DA7@ypsilon.sirena.org.uk>
Date: Fri,  2 Aug 2019 20:00:19 +0100 (BST)
Cc: SOC@sirena.org.uk, alsa-devel@alsa-project.org,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 "Gustavo A.R.Silva" <gustavo@embeddedor.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 moderated@sirena.org.uk, "Cc:"@sirena.org.uk, -@sirena.org.uk,
 Mark Brown <broonie@kernel.org>, "list:SOUND"@sirena.org.uk,
 Vijendar Mukunda <vijendar.mukunda@amd.com>, Alexander.Deucher@amd.com
Subject: [alsa-devel] Applied "ASoC: amd: acp3x: use dma address for acp3x
	dma driver" to the asoc tree
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

The patch

   ASoC: amd: acp3x: use dma address for acp3x dma driver

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 30c21734d853dae99d05a5295a59b7e26ccd5135 Mon Sep 17 00:00:00 2001
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Date: Fri, 2 Aug 2019 19:21:24 +0530
Subject: [PATCH] ASoC: amd: acp3x: use dma address for acp3x dma driver

We shouldn't assume CPU physical address we get from page_to_phys()
is same as DMA address we get from dma_alloc_coherent(). On x86_64,
we won't run into any problem with the assumption when dma_ops is
nommu_dma_ops. However, DMA address is IOVA when IOMMU is enabled.
And it's most likely different from CPU physical address when AMD
IOMMU is not in passthrough mode.

This patch fixes page faults when IOMMU is enabled.

Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
Link: https://lore.kernel.org/r/1564753899-17124-2-git-send-email-Vijendar.Mukunda@amd.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 905ed2f1861b..bc4dfafdfcd1 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -31,8 +31,8 @@ struct i2s_stream_instance {
 	u16 num_pages;
 	u16 channels;
 	u32 xfer_resolution;
-	struct page *pg;
 	u64 bytescount;
+	dma_addr_t dma_addr;
 	void __iomem *acp3x_base;
 };
 
@@ -211,9 +211,8 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
-	u64 addr;
 	u32 low, high, val, acp_fifo_addr;
-	struct page *pg = rtd->pg;
+	dma_addr_t addr = rtd->dma_addr;
 
 	/* 8 scratch registers used to map one 64 bit address */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
@@ -229,7 +228,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
 		/* Load the low address of page int ACP SRAM through SRBM */
-		addr = page_to_phys(pg);
 		low = lower_32_bits(addr);
 		high = upper_32_bits(addr);
 
@@ -239,7 +237,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 				+ 4);
 		/* Move to next physically contiguos page */
 		val += 8;
-		pg++;
+		addr += PAGE_SIZE;
 	}
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -341,7 +339,6 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 {
 	int status;
 	u64 size;
-	struct page *pg;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct i2s_stream_instance *rtd = runtime->private_data;
 
@@ -354,9 +351,8 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 		return status;
 
 	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
-	pg = virt_to_page(substream->dma_buffer.area);
-	if (pg) {
-		rtd->pg = pg;
+	if (substream->dma_buffer.area) {
+		rtd->dma_addr = substream->dma_buffer.addr;
 		rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 		config_acp3x_dma(rtd, substream->stream);
 		status = 0;
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
