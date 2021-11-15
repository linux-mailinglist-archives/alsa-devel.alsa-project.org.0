Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCB894500B7
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Nov 2021 09:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C162167A;
	Mon, 15 Nov 2021 09:58:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C162167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636966745;
	bh=wn57j1S+OVDPjchxqdayqaIicCxtINUEg6GRzjIlw5A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WYfB+jI2T8brwvmiCdRCoNR+cXpfS7nrR9IjMzO6iyKlVViYAr9EW4X83Ia5vuCkd
	 N8664yo4oqhVJ7K45WPYgtaol/00Sw3tOG3GYVVuCuLavGVFSVof/OWlUgfnZbDurV
	 oJwF6ejlFsmv85gUyN36S74gwqIK3Hn/TwnXL0F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C26A3F804EB;
	Mon, 15 Nov 2021 09:57:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E426BF800FA; Mon, 15 Nov 2021 09:55:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E195CF800FA
 for <alsa-devel@alsa-project.org>; Mon, 15 Nov 2021 09:54:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E195CF800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YpPwnQ+Z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1F29161BF5;
 Mon, 15 Nov 2021 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636966493;
 bh=wn57j1S+OVDPjchxqdayqaIicCxtINUEg6GRzjIlw5A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YpPwnQ+ZywWiftbIGbvSME2DSkHoKYPFuU4+pHFPnVCL6fAFGd6mYmtgljVBSkmRJ
 pW1JZbsvnPgbWG3BIB1WxilpINGEKjCw9qhXl3qcYTQJs2ryMXJDzUYFTmV+bJ9clv
 93VV93b94yY9B4TxZ7B7hXK8AU350k/nQ0LP+ecDwB1REeriP9jE3UDWkfZnuLaeVM
 cjhwo1GJ6NlZbpRmqItwSJjTxt9iFUH4XKy1kf5swVCl5yYiAgReOUL0BXKR3AN91G
 tnDG8UAkjd/mH7+NAsriu0rVVog9i3scmEbYwpdOQPUe3HixNhQXEB6g/mtLNh/erJ
 SzxSnZNolHWtg==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 01/11] ASoC: dai_dma: remove slave_id field
Date: Mon, 15 Nov 2021 09:53:53 +0100
Message-Id: <20211115085403.360194-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211115085403.360194-1-arnd@kernel.org>
References: <20211115085403.360194-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 15 Nov 2021 09:57:03 +0100
Cc: alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-spi@vger.kernel.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Lars-Peter Clausen <lars@metafoo.de>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-staging@lists.linux.dev, Michal Simek <michal.simek@xilinx.com>,
 Jon Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Manivannan Sadhasivam <mani@kernel.org>,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-rpi-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Laxman Dewangan <ldewangan@nvidia.com>, Baolin Wang <baolin.wang7@gmail.com>
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

From: Arnd Bergmann <arnd@arndb.de>

This field is never set, and serves no purpose, so remove it.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h   | 2 --
 sound/core/pcm_dmaengine.c      | 5 ++---
 sound/soc/tegra/tegra20_spdif.c | 1 -
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 9144bd547851..7403870c28bd 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -58,7 +58,6 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
  * @maxburst: Maximum number of words(note: words, as in units of the
  * src_addr_width member, not bytes) that can be send to or received from the
  * DAI in one burst.
- * @slave_id: Slave requester id for the DMA channel.
  * @filter_data: Custom DMA channel filter data, this will usually be used when
  * requesting the DMA channel.
  * @chan_name: Custom channel name to use when requesting DMA channel.
@@ -72,7 +71,6 @@ struct snd_dmaengine_dai_dma_data {
 	dma_addr_t addr;
 	enum dma_slave_buswidth addr_width;
 	u32 maxburst;
-	unsigned int slave_id;
 	void *filter_data;
 	const char *chan_name;
 	unsigned int fifo_size;
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index af08bb4bf578..6762fb2083e1 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -91,8 +91,8 @@ EXPORT_SYMBOL_GPL(snd_hwparams_to_dma_slave_config);
  * @dma_data: DAI DMA data
  * @slave_config: DMA slave configuration
  *
- * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width and
- * slave_id fields of the DMA slave config from the same fields of the DAI DMA
+ * Initializes the {dst,src}_addr, {dst,src}_maxburst, {dst,src}_addr_width
+ * fields of the DMA slave config from the same fields of the DAI DMA
  * data struct. The src and dst fields will be initialized depending on the
  * direction of the substream. If the substream is a playback stream the dst
  * fields will be initialized, if it is a capture stream the src fields will be
@@ -124,7 +124,6 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 			slave_config->src_addr_width = dma_data->addr_width;
 	}
 
-	slave_config->slave_id = dma_data->slave_id;
 	slave_config->peripheral_config = dma_data->peripheral_config;
 	slave_config->peripheral_size = dma_data->peripheral_size;
 }
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index 9fdc82d58db3..1c3385da6f82 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -284,7 +284,6 @@ static int tegra20_spdif_platform_probe(struct platform_device *pdev)
 	spdif->playback_dma_data.addr = mem->start + TEGRA20_SPDIF_DATA_OUT;
 	spdif->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
 	spdif->playback_dma_data.maxburst = 4;
-	spdif->playback_dma_data.slave_id = dmareq->start;
 
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.30.2

