Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8104DCD04
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 18:57:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16D77189A;
	Thu, 17 Mar 2022 18:56:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16D77189A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647539836;
	bh=d7Jaj3et29s3ilvuz8zrQpLi6g1T1gU5riiWNKGfRQU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pkvfW9WQljS9PqVUSyzbI0gm68uIt1op4iPkfgndzO0O0nvwtHYexNLbc/Cn8wScG
	 aSV/kBNnxtyhMp/cYp/FyFFDAtVXEBEdawKYcTQi203vfg3a3BXAWroBdib4orLWhK
	 53JM1TMbUjPWk+PYBRvCh2Nw53LF57BssMXj5kH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6287EF8057A;
	Thu, 17 Mar 2022 18:52:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5977FF80519; Thu, 17 Mar 2022 18:52:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F6D7F80520
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 18:51:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F6D7F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="hBprmR+0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647539515; x=1679075515;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=d7Jaj3et29s3ilvuz8zrQpLi6g1T1gU5riiWNKGfRQU=;
 b=hBprmR+0A31Huny+enmjB0BW+pGI/CZjMMQZP12J41kzIMPI9mkvt3kZ
 Kuk7G+3MvBDEKsQq0NuXIV5PRt+4W/ZY2D8ZHFQnuw2OqWYL7Qvy74llN
 IW5cEfUY+ZSmPjTHEo+l4PoYq730nZCNOGlYc/wGeF+jNKt6G9x/7X8dC
 8+dliJjNX/766UaAjLxk9LeBox2Q6K3y8VQ3Ofze2kIgCCMVa47DxIFz5
 fMJPnwCeJCMdX9zCXeSbmLeBBzCFMwLA43oDpBgG4C/EXUqdBxZZFsEbV
 qcH8DErC9PcJ1KlWVCo17iy6J+oFuAi4XwBs+Q466DZ5LT3y/0JDpDzxI g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10289"; a="254492928"
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="254492928"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,188,1643702400"; d="scan'208";a="550431153"
Received: from jfbonin1-mobl6.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.255.92.163])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2022 10:51:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/19] ASoC: SOF: Define hw_params PCM op for IPC3
Date: Thu, 17 Mar 2022 10:50:39 -0700
Message-Id: <20220317175044.1752400-15-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
References: <20220317175044.1752400-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add the hw_params op for IPC3 and use it.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3-pcm.c | 100 +++++++++++++++++++++++++++++++++++
 sound/soc/sof/pcm.c      | 110 ++++++---------------------------------
 2 files changed, 115 insertions(+), 95 deletions(-)

diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index 96f498b4b2d6..b715199a2aaa 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -38,6 +38,106 @@ static int sof_ipc3_pcm_hw_free(struct snd_soc_component *component,
 				  sizeof(stream), &reply, sizeof(reply));
 }
 
+static int sof_ipc3_pcm_hw_params(struct snd_soc_component *component,
+				  struct snd_pcm_substream *substream,
+				  struct snd_pcm_hw_params *params,
+				  struct snd_sof_platform_stream_params *platform_params)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct sof_ipc_pcm_params_reply ipc_params_reply;
+	struct sof_ipc_pcm_params pcm;
+	struct snd_sof_pcm *spcm;
+	int ret;
+
+	spcm = snd_sof_find_spcm_dai(component, rtd);
+	if (!spcm)
+		return -EINVAL;
+
+	memset(&pcm, 0, sizeof(pcm));
+
+	/* number of pages should be rounded up */
+	pcm.params.buffer.pages = PFN_UP(runtime->dma_bytes);
+
+	/* set IPC PCM parameters */
+	pcm.hdr.size = sizeof(pcm);
+	pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
+	pcm.comp_id = spcm->stream[substream->stream].comp_id;
+	pcm.params.hdr.size = sizeof(pcm.params);
+	pcm.params.buffer.phy_addr = spcm->stream[substream->stream].page_table.addr;
+	pcm.params.buffer.size = runtime->dma_bytes;
+	pcm.params.direction = substream->stream;
+	pcm.params.sample_valid_bytes = params_width(params) >> 3;
+	pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
+	pcm.params.rate = params_rate(params);
+	pcm.params.channels = params_channels(params);
+	pcm.params.host_period_bytes = params_period_bytes(params);
+
+	/* container size */
+	ret = snd_pcm_format_physical_width(params_format(params));
+	if (ret < 0)
+		return ret;
+	pcm.params.sample_container_bytes = ret >> 3;
+
+	/* format */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_S16:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S16_LE;
+		break;
+	case SNDRV_PCM_FORMAT_S24:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S24_4LE;
+		break;
+	case SNDRV_PCM_FORMAT_S32:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
+		break;
+	case SNDRV_PCM_FORMAT_FLOAT:
+		pcm.params.frame_fmt = SOF_IPC_FRAME_FLOAT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Update the IPC message with information from the platform */
+	pcm.params.stream_tag = platform_params->stream_tag;
+
+	if (platform_params->use_phy_address)
+		pcm.params.buffer.phy_addr = platform_params->phy_addr;
+
+	if (platform_params->no_ipc_position) {
+		/* For older ABIs set host_period_bytes to zero to inform
+		 * FW we don't want position updates. Newer versions use
+		 * no_stream_position for this purpose.
+		 */
+		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
+			pcm.params.host_period_bytes = 0;
+		else
+			pcm.params.no_stream_position = 1;
+	}
+
+	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
+
+	/* send hw_params IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
+				 &ipc_params_reply, sizeof(ipc_params_reply));
+	if (ret < 0) {
+		dev_err(component->dev, "HW params ipc failed for stream %d\n",
+			pcm.params.stream_tag);
+		return ret;
+	}
+
+	ret = snd_sof_set_stream_data_offset(sdev, substream, ipc_params_reply.posn_offset);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: invalid stream data offset for PCM %d\n",
+			__func__, spcm->pcm.pcm_id);
+		return ret;
+	}
+
+	return ret;
+}
+
 const struct sof_ipc_pcm_ops ipc3_pcm_ops = {
+	.hw_params = sof_ipc3_pcm_hw_params,
 	.hw_free = sof_ipc3_pcm_hw_free,
 };
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 8ef477aff938..8a194c130981 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -119,15 +119,12 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
-	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct snd_sof_platform_stream_params platform_params = { 0 };
-	struct sof_ipc_fw_version *v = &sdev->fw_ready.version;
+	const struct sof_ipc_pcm_ops *pcm_ops = sdev->ipc->ops->pcm;
+	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_sof_pcm *spcm;
-	struct sof_ipc_pcm_params pcm;
-	struct sof_ipc_pcm_params_reply ipc_params_reply;
 	int ret;
 
 	/* nothing to do for BE */
@@ -153,117 +150,40 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 	dev_dbg(component->dev, "pcm: hw params stream %d dir %d\n",
 		spcm->pcm.pcm_id, substream->stream);
 
-	memset(&pcm, 0, sizeof(pcm));
+	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
+	if (!spcm->stream[substream->stream].list) {
+		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
+		if (ret < 0)
+			return ret;
+	}
 
 	/* create compressed page table for audio firmware */
 	if (runtime->buffer_changed) {
 		ret = create_page_table(component, substream, runtime->dma_area,
 					runtime->dma_bytes);
+
 		if (ret < 0)
 			return ret;
 	}
 
-	/* number of pages should be rounded up */
-	pcm.params.buffer.pages = PFN_UP(runtime->dma_bytes);
-
-	/* set IPC PCM parameters */
-	pcm.hdr.size = sizeof(pcm);
-	pcm.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_PCM_PARAMS;
-	pcm.comp_id = spcm->stream[substream->stream].comp_id;
-	pcm.params.hdr.size = sizeof(pcm.params);
-	pcm.params.buffer.phy_addr =
-		spcm->stream[substream->stream].page_table.addr;
-	pcm.params.buffer.size = runtime->dma_bytes;
-	pcm.params.direction = substream->stream;
-	pcm.params.sample_valid_bytes = params_width(params) >> 3;
-	pcm.params.buffer_fmt = SOF_IPC_BUFFER_INTERLEAVED;
-	pcm.params.rate = params_rate(params);
-	pcm.params.channels = params_channels(params);
-	pcm.params.host_period_bytes = params_period_bytes(params);
-
-	/* container size */
-	ret = snd_pcm_format_physical_width(params_format(params));
-	if (ret < 0)
-		return ret;
-	pcm.params.sample_container_bytes = ret >> 3;
-
-	/* format */
-	switch (params_format(params)) {
-	case SNDRV_PCM_FORMAT_S16:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S16_LE;
-		break;
-	case SNDRV_PCM_FORMAT_S24:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S24_4LE;
-		break;
-	case SNDRV_PCM_FORMAT_S32:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_S32_LE;
-		break;
-	case SNDRV_PCM_FORMAT_FLOAT:
-		pcm.params.frame_fmt = SOF_IPC_FRAME_FLOAT;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* firmware already configured host stream */
-	ret = snd_sof_pcm_platform_hw_params(sdev,
-					     substream,
-					     params,
-					     &platform_params);
+	ret = snd_sof_pcm_platform_hw_params(sdev, substream, params, &platform_params);
 	if (ret < 0) {
-		dev_err(component->dev, "error: platform hw params failed\n");
+		dev_err(component->dev, "platform hw params failed\n");
 		return ret;
 	}
 
-	/* Update the IPC message with information from the platform */
-	pcm.params.stream_tag = platform_params.stream_tag;
-
-	if (platform_params.use_phy_address)
-		pcm.params.buffer.phy_addr = platform_params.phy_addr;
-
-	if (platform_params.no_ipc_position) {
-		/* For older ABIs set host_period_bytes to zero to inform
-		 * FW we don't want position updates. Newer versions use
-		 * no_stream_position for this purpose.
-		 */
-		if (v->abi_version < SOF_ABI_VER(3, 10, 0))
-			pcm.params.host_period_bytes = 0;
-		else
-			pcm.params.no_stream_position = 1;
-	}
-
-	dev_dbg(component->dev, "stream_tag %d", pcm.params.stream_tag);
-
-	/* if this is a repeated hw_params without hw_free, skip setting up widgets */
-	if (!spcm->stream[substream->stream].list) {
-		ret = sof_pcm_setup_connected_widgets(sdev, rtd, spcm, substream->stream);
+	if (pcm_ops->hw_params) {
+		ret = pcm_ops->hw_params(component, substream, params, &platform_params);
 		if (ret < 0)
 			return ret;
 	}
 
-	/* send hw_params IPC to the DSP */
-	ret = sof_ipc_tx_message(sdev->ipc, pcm.hdr.cmd, &pcm, sizeof(pcm),
-				 &ipc_params_reply, sizeof(ipc_params_reply));
-	if (ret < 0) {
-		dev_err(component->dev, "error: hw params ipc failed for stream %d\n",
-			pcm.params.stream_tag);
-		return ret;
-	}
-
-	ret = snd_sof_set_stream_data_offset(sdev, substream,
-					     ipc_params_reply.posn_offset);
-	if (ret < 0) {
-		dev_err(component->dev, "%s: invalid stream data offset for PCM %d\n",
-			__func__, spcm->pcm.pcm_id);
-		return ret;
-	}
-
 	spcm->prepared[substream->stream] = true;
 
 	/* save pcm hw_params */
 	memcpy(&spcm->params[substream->stream], params, sizeof(*params));
 
-	return ret;
+	return 0;
 }
 
 static int sof_pcm_hw_free(struct snd_soc_component *component,
-- 
2.25.1

