Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB43105F5
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 08:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65D151676;
	Fri,  5 Feb 2021 08:38:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65D151676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612510754;
	bh=gEalmXNM1g5ccgQk7FnpawHlXE4W0cptxm4RGveUz6w=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FBU9YsqlaZZgm666uQ6D++UvTENrUIh2j8To9ealHdXyn9Lbjjx9H15dXs1P/00e/
	 fwmiMln1U+Nntpnp9NzHqHTKXB6nnxog0YMISowRInXAx8RLcL4/wht9lN1RJW1hxW
	 qtjcoPd5bU/7K3820J8fKkTMwyaHk6jHTSVUv2YY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 71E69F800C0;
	Fri,  5 Feb 2021 08:37:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E1DB2F8015A; Fri,  5 Feb 2021 08:37:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86DDCF800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 08:37:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86DDCF800C0
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 2452E1A01E1;
 Fri,  5 Feb 2021 08:37:32 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7410B1A1476;
 Fri,  5 Feb 2021 08:37:29 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C7911402B7;
 Fri,  5 Feb 2021 08:37:25 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 broonie@kernel.org
Subject: [RESEND PATH] ASoC: dmaengine_pcm: add peripheral configuration
Date: Fri,  5 Feb 2021 15:26:25 +0800
Message-Id: <1612509985-11063-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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

The commit e7bbb7acabf4 ("dmaengine: add peripheral configuration")
adds peripheral configuration for dma_slave_config.

This configuration is useful for some audio peripherals, for
example, the peripheral supports multi fifos, we can
let the DMA know which fifos are selected. So also add
this configuration for snd_dmaengine_dai_dma_data.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 include/sound/dmaengine_pcm.h | 5 +++++
 sound/core/pcm_dmaengine.c    | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index 8c5e38180fb0..96666efddb39 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -66,6 +66,9 @@ struct dma_chan *snd_dmaengine_pcm_get_chan(struct snd_pcm_substream *substream)
  * @chan_name: Custom channel name to use when requesting DMA channel.
  * @fifo_size: FIFO size of the DAI controller in bytes
  * @flags: PCM_DAI flags, only SND_DMAENGINE_PCM_DAI_FLAG_PACK for now
+ * @peripheral_config: peripheral configuration for programming peripheral
+ * for dmaengine transfer
+ * @peripheral_size: peripheral configuration buffer size
  */
 struct snd_dmaengine_dai_dma_data {
 	dma_addr_t addr;
@@ -76,6 +79,8 @@ struct snd_dmaengine_dai_dma_data {
 	const char *chan_name;
 	unsigned int fifo_size;
 	unsigned int flags;
+	void *peripheral_config;
+	size_t peripheral_size;
 };
 
 void snd_dmaengine_pcm_set_config_from_dai_data(
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 4d0e8fe535a1..1fc2fa077574 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -125,6 +125,8 @@ void snd_dmaengine_pcm_set_config_from_dai_data(
 	}
 
 	slave_config->slave_id = dma_data->slave_id;
+	slave_config->peripheral_config = dma_data->peripheral_config;
+	slave_config->peripheral_size = dma_data->peripheral_size;
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_set_config_from_dai_data);
 
-- 
2.27.0

