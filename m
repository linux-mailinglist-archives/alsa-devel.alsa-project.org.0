Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 571E0459E00
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 09:29:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D579716C2;
	Tue, 23 Nov 2021 09:28:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D579716C2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637656149;
	bh=DkH2C/0N1WYbkBTHTcXs+UoiXTHoHZhSHgkMmx0w2Xc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ahLAi0eSK+xABVBIhUwDA0E4ycVwBI1ZRkvMXnl0rdMgkQYygmZ6d4/vrKjyR6wVR
	 YlKz8acMZOQ7P99PtL+i/+Ip/+fY5qzY5O021emcHfndI/4esmXrMU5B8Z9S3KHXzg
	 3aL/T2zfYUv/ntqpUv09c/+68GN1yMLRfgTkSG2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63BD8F805AF;
	Tue, 23 Nov 2021 09:21:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA109F80245; Mon, 22 Nov 2021 23:22:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62ADCF80141
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 23:22:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62ADCF80141
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2Oxdt95"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A4ED860F51;
 Mon, 22 Nov 2021 22:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637619765;
 bh=DkH2C/0N1WYbkBTHTcXs+UoiXTHoHZhSHgkMmx0w2Xc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=G2Oxdt95V8shdcCR4rf8/SnteVMCqPXu7ONpufFbqQSZlnD5v72OrbusBId0aTBCO
 pP7ckP/ytX0pvpQkWJncqKZTFopWpfw907t6DuIdqszCUJmEH0P8XVWEEcD9/Gc22x
 BsbBGBjcTwnJPUC00tjAyAiRRBB7Q+yLxDG1vNK4N+lQXd5vI+hHx06boyzMJ/jE1f
 5y/7vYtfL+uUibDbJ2SibZOim3YzH9m1BDyOZhEEUVCJq5dBjszMoc2+aYldAVpLgw
 ihYtpESUekvfxtkIZRBiMxX1y99UhIOUT9S4tCllpAW1AaavTuWHc9Nz22S82Orn3v
 7aynnt3oUMzkw==
From: Arnd Bergmann <arnd@kernel.org>
To: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 02/11] ASoC: dai_dma: remove slave_id field
Date: Mon, 22 Nov 2021 23:21:54 +0100
Message-Id: <20211122222203.4103644-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211122222203.4103644-1-arnd@kernel.org>
References: <20211122222203.4103644-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 Nov 2021 09:20:57 +0100
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

This field is no longer set from any driver now, so remove the
last references as well.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/sound/dmaengine_pcm.h | 2 --
 sound/core/pcm_dmaengine.c    | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)

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
-- 
2.29.2

