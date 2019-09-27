Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B36BFCE4
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 03:51:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 66C66167A;
	Fri, 27 Sep 2019 03:50:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 66C66167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569549101;
	bh=vTR6NxymOtvicRAP5/nFrqjlPHen0amRQ2n1XTeoQC0=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=gzqrzyI8O4R2tb7SjMOzaK59+EPGbUTfMFZPWpP3hSMajsOrP1OF6OxNe7HCm/SQH
	 4DR4v8fArkb5i/Fuu/XZmwyovyBcCZAz7Hsf0d7HgLeYmIzarluSLbmlLZOwqMNmUt
	 J77Adyl5cltNybVCp1QL5hVP9DM65eMTCE/O+GAk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5BD5F805FF;
	Fri, 27 Sep 2019 03:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D8E2F805F7; Fri, 27 Sep 2019 03:48:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03A61F80535
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 03:48:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03A61F80535
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 964E620060B;
 Fri, 27 Sep 2019 03:48:07 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E8E902005DF;
 Fri, 27 Sep 2019 03:48:00 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id BA3E04029A;
 Fri, 27 Sep 2019 09:47:52 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org,
 lars@metafoo.de
Date: Fri, 27 Sep 2019 09:46:12 +0800
Message-Id: <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
In-Reply-To: <cover.1569493933.git.shengjiu.wang@nxp.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [alsa-devel] [PATCH V6 4/4] ASoC: fsl_asrc: Fix error with S24_3LE
	format bitstream in i.MX8
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

There is error "aplay: pcm_write:2023: write error: Input/output error"
on i.MX8QM/i.MX8QXP platform for S24_3LE format.

In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
sample, but we didn't add any constraint, that cause issues.

So we need to query the caps of dma, then update the hw parameters
according to the caps.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c     |  4 +--
 sound/soc/fsl/fsl_asrc.h     |  3 ++
 sound/soc/fsl/fsl_asrc_dma.c | 64 ++++++++++++++++++++++++++++++++----
 3 files changed, 62 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 584badf956d2..0bf91a6f54b9 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -115,7 +115,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
  * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
  * while pair A and pair C are comparatively independent.
  */
-static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
+int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 {
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
@@ -158,7 +158,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
  *
  * It clears the resource from asrc_priv and releases the occupied channels.
  */
-static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
+void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc_priv = pair->asrc_priv;
 	enum asrc_pair_index index = pair->index;
diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
index 38af485bdd22..2b57e8c53728 100644
--- a/sound/soc/fsl/fsl_asrc.h
+++ b/sound/soc/fsl/fsl_asrc.h
@@ -462,4 +462,7 @@ struct fsl_asrc {
 #define DRV_NAME "fsl-asrc-dai"
 extern struct snd_soc_component_driver fsl_asrc_component;
 struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir);
+int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair);
+void fsl_asrc_release_pair(struct fsl_asrc_pair *pair);
+
 #endif /* _FSL_ASRC_H */
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index 01052a0808b0..2a60fc6142b1 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -16,13 +16,11 @@
 
 #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
 
-static const struct snd_pcm_hardware snd_imx_hardware = {
+static struct snd_pcm_hardware snd_imx_hardware = {
 	.info = SNDRV_PCM_INFO_INTERLEAVED |
 		SNDRV_PCM_INFO_BLOCK_TRANSFER |
 		SNDRV_PCM_INFO_MMAP |
-		SNDRV_PCM_INFO_MMAP_VALID |
-		SNDRV_PCM_INFO_PAUSE |
-		SNDRV_PCM_INFO_RESUME,
+		SNDRV_PCM_INFO_MMAP_VALID,
 	.buffer_bytes_max = FSL_ASRC_DMABUF_SIZE,
 	.period_bytes_min = 128,
 	.period_bytes_max = 65535, /* Limited by SDMA engine */
@@ -270,12 +268,25 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
 
 static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
 {
+	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
+	struct snd_dmaengine_dai_dma_data *dma_data;
 	struct device *dev = component->dev;
 	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
 	struct fsl_asrc_pair *pair;
+	struct dma_chan *tmp_chan = NULL;
+	u8 dir = tx ? OUT : IN;
+	bool release_pair = true;
+	int ret = 0;
+
+	ret = snd_pcm_hw_constraint_integer(substream->runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0) {
+		dev_err(dev, "failed to set pcm hw params periods\n");
+		return ret;
+	}
 
 	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
 	if (!pair)
@@ -285,11 +296,50 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
 
 	runtime->private_data = pair;
 
-	snd_pcm_hw_constraint_integer(substream->runtime,
-				      SNDRV_PCM_HW_PARAM_PERIODS);
+	/* Request a dummy pair, which will be released later.
+	 * Request pair function needs channel num as input, for this
+	 * dummy pair, we just request "1" channel temporarily.
+	 */
+	ret = fsl_asrc_request_pair(1, pair);
+	if (ret < 0) {
+		dev_err(dev, "failed to request asrc pair\n");
+		goto req_pair_err;
+	}
+
+	/* Request a dummy dma channel, which will be released later. */
+	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
+	if (!tmp_chan) {
+		dev_err(dev, "failed to get dma channel\n");
+		ret = -EINVAL;
+		goto dma_chan_err;
+	}
+
+	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
+
+	/* Refine the snd_imx_hardware according to caps of DMA. */
+	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+							dma_data,
+							&snd_imx_hardware,
+							tmp_chan);
+	if (ret < 0) {
+		dev_err(dev, "failed to refine runtime hwparams\n");
+		goto out;
+	}
+
+	release_pair = false;
 	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
 
-	return 0;
+out:
+	dma_release_channel(tmp_chan);
+
+dma_chan_err:
+	fsl_asrc_release_pair(pair);
+
+req_pair_err:
+	if (release_pair)
+		kfree(pair);
+
+	return ret;
 }
 
 static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
