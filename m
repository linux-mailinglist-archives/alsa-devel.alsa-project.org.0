Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF852E30D
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 05:19:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65B4D1721;
	Fri, 20 May 2022 05:18:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65B4D1721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653016787;
	bh=TXIHYnYENYGpRJWQugU21BcaK1JFTBfeDgXBv5kU/s0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LV59bb6rJQHB2r4mAd05SudNisNLM8pz9Cs73iBhmuVfvuyAx5QbE9zpFiVpeEA4r
	 h1E14urF0ZQHHJ/yfI2e7x6Zb3/rHbIb7LdEe46bkT1w2Pv7DrkhmEas75PYu4gpXM
	 L7vQneVRA0gudoUVHOpO7ia3ghzXLAIegmehs1Ck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D206CF801F5;
	Fri, 20 May 2022 05:18:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5690CF8019D; Fri, 20 May 2022 05:18:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46224F800D2
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 05:18:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46224F800D2
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 169FF201365;
 Fri, 20 May 2022 05:18:40 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D0E79201362;
 Fri, 20 May 2022 05:18:39 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id AB7CE180031F;
 Fri, 20 May 2022 11:18:38 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_asrc_dma: enable dual fifo for ASRC P2P
Date: Fri, 20 May 2022 11:06:00 +0800
Message-Id: <1653015960-15474-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

The SSI and SPDIF has dual fifos, enhance P2P for these
case with using the sdma_peripheral_config struct

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 5038faf035cb..aaf7993935b7 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -129,6 +129,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_hw_params *params)
 {
 	enum dma_slave_buswidth buswidth = DMA_SLAVE_BUSWIDTH_2_BYTES;
+	enum sdma_peripheral_type be_peripheral_type = IMX_DMATYPE_SSI;
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_dmaengine_dai_dma_data *dma_params_fe = NULL;
@@ -139,6 +140,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	struct snd_soc_component *component_be = NULL;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct dma_slave_config config_fe, config_be;
+	struct sdma_peripheral_config audio_config;
 	enum asrc_pair_index index = pair->index;
 	struct device *dev = component->dev;
 	struct device_node *of_dma_node;
@@ -221,6 +223,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		/* Get DMA request of Back-End */
 		tmp_data = tmp_chan->private;
 		pair->dma_data.dma_request = tmp_data->dma_request;
+		be_peripheral_type = tmp_data->peripheral_type;
 		if (!be_chan)
 			dma_release_channel(tmp_chan);
 
@@ -268,6 +271,17 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	config_be.dst_addr_width = buswidth;
 	config_be.dst_maxburst = dma_params_be->maxburst;
 
+	memset(&audio_config, 0, sizeof(audio_config));
+	config_be.peripheral_config = &audio_config;
+	config_be.peripheral_size  = sizeof(audio_config);
+
+	if (tx && (be_peripheral_type == IMX_DMATYPE_SSI_DUAL ||
+		   be_peripheral_type == IMX_DMATYPE_SPDIF))
+		audio_config.n_fifos_dst = 2;
+	if (!tx && (be_peripheral_type == IMX_DMATYPE_SSI_DUAL ||
+		    be_peripheral_type == IMX_DMATYPE_SPDIF))
+		audio_config.n_fifos_src = 2;
+
 	if (tx) {
 		config_be.src_addr = asrc->paddr + asrc->get_fifo_addr(OUT, index);
 		config_be.dst_addr = dma_params_be->addr;
-- 
2.17.1

