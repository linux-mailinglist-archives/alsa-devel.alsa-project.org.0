Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A60F71F74D6
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Jun 2020 09:52:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 402F21676;
	Fri, 12 Jun 2020 09:52:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 402F21676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591948375;
	bh=uZ67riigIBKhrLIv4zFAsDMR0XbJeJ8E7ime//qLq80=;
	h=From:To:Subject:Date:In-Reply-To:References:In-Reply-To:
	 References:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From;
	b=jKE+yMQiXIWgurjlKMFAtrs/nUYYnBp5jnZViwGZHvKqlPYF9jzwab0WgRn26FmVO
	 U2lwtEc1435iSWbueDZloSVHHEO6XNodjV0CQx2xkanOvo0Je+ZkpiJ5+vAldWNq5T
	 uPTn+5kbIK31JzPQ+lic2S+qX75z2lVtclvCPo+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2127FF802E0;
	Fri, 12 Jun 2020 09:49:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BA3AF802DF; Fri, 12 Jun 2020 09:49:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8042F802A2
 for <alsa-devel@alsa-project.org>; Fri, 12 Jun 2020 09:48:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8042F802A2
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6C38B1A0B70;
 Fri, 12 Jun 2020 09:48:53 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 533FC1A0420;
 Fri, 12 Jun 2020 09:48:48 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D929E40307;
 Fri, 12 Jun 2020 15:48:40 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lars@metafoo.de, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com, festevam@gmail.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v3 4/4] ASoC: fsl_asrc_dma: Fix data copying speed issue
 with EDMA
Date: Fri, 12 Jun 2020 15:37:51 +0800
Message-Id: <424ed6c249bafcbe30791c9de0352821c5ea67e2.1591947428.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1591947428.git.shengjiu.wang@nxp.com>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
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

With EDMA, there is two dma channels can be used for dev_to_dev,
one is from ASRC, one is from another peripheral (ESAI or SAI).

If we select the dma channel of ASRC, there is an issue for ideal
ratio case, the speed of copy data is faster than sample
frequency, because ASRC output data is very fast in ideal ratio
mode.

So it is reasonable to use the dma channel of Back-End peripheral.
then copying speed of DMA is controlled by data consumption
speed in the peripheral FIFO,

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc_common.h |  2 ++
 sound/soc/fsl/fsl_asrc_dma.c    | 26 +++++++++++++++-----------
 2 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
index 77665b15c8db..7e1c13ca37f1 100644
--- a/sound/soc/fsl/fsl_asrc_common.h
+++ b/sound/soc/fsl/fsl_asrc_common.h
@@ -32,6 +32,7 @@ enum asrc_pair_index {
  * @dma_chan: inputer and output DMA channels
  * @dma_data: private dma data
  * @pos: hardware pointer position
+ * @req_dma_chan: flag to release dev_to_dev chan
  * @private: pair private area
  */
 struct fsl_asrc_pair {
@@ -45,6 +46,7 @@ struct fsl_asrc_pair {
 	struct dma_chan *dma_chan[2];
 	struct imx_dma_data dma_data;
 	unsigned int pos;
+	bool req_dma_chan;
 
 	void *private;
 };
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index d88e6343e0a2..5f01a58f422a 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -233,11 +233,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 
 		pair->dma_chan[dir] =
 			dma_request_channel(mask, filter, &pair->dma_data);
+		pair->req_dma_chan = true;
 	} else {
-		if (!be_chan)
-			dma_release_channel(tmp_chan);
-		pair->dma_chan[dir] =
-			asrc->get_dma_channel(pair, dir);
+		pair->dma_chan[dir] = tmp_chan;
+		/* Do not flag to release if we are reusing the Back-End one */
+		pair->req_dma_chan = !be_chan;
 	}
 
 	if (!pair->dma_chan[dir]) {
@@ -276,7 +276,8 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	ret = dmaengine_slave_config(pair->dma_chan[dir], &config_be);
 	if (ret) {
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
-		dma_release_channel(pair->dma_chan[dir]);
+		if (pair->req_dma_chan)
+			dma_release_channel(pair->dma_chan[dir]);
 		return ret;
 	}
 
@@ -288,19 +289,22 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 				struct snd_pcm_substream *substream)
 {
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct fsl_asrc_pair *pair = runtime->private_data;
+	u8 dir = tx ? OUT : IN;
 
 	snd_pcm_set_runtime_buffer(substream, NULL);
 
-	if (pair->dma_chan[IN])
-		dma_release_channel(pair->dma_chan[IN]);
+	if (pair->dma_chan[!dir])
+		dma_release_channel(pair->dma_chan[!dir]);
 
-	if (pair->dma_chan[OUT])
-		dma_release_channel(pair->dma_chan[OUT]);
+	/* release dev_to_dev chan if we aren't reusing the Back-End one */
+	if (pair->dma_chan[dir] && pair->req_dma_chan)
+		dma_release_channel(pair->dma_chan[dir]);
 
-	pair->dma_chan[IN] = NULL;
-	pair->dma_chan[OUT] = NULL;
+	pair->dma_chan[!dir] = NULL;
+	pair->dma_chan[dir] = NULL;
 
 	return 0;
 }
-- 
2.21.0

