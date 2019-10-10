Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26352D2C5D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 16:25:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E7F1682;
	Thu, 10 Oct 2019 16:24:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E7F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570717508;
	bh=i3ZtQ9OJlpVtS3mKCZdAJNSkF+LqVqroJznUr6nFUVQ=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=ATJoMF9zoPQek+fxlSMkC97U4STxJ335ky68CQvUtN9MSFseakzjg4hrlU5uxB/An
	 aSBU/8pmMddQi4V+ef+ZjohBKReVMF0EckCQcAXbSh9n26l59DbUiSEr5QJ0DYh+ZY
	 uk7CYuihNXCtI646z6ZJc/7bV/Gf3SRlsdmqKJ+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1BDD3F80322;
	Thu, 10 Oct 2019 16:22:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42F34F80113; Thu, 10 Oct 2019 16:22:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F247F802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 16:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F247F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="fA8ncRc6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=eS4XRVuj+d+m068P+iGRtV+RR5DBYHsFV0RY52uS3t8=; b=fA8ncRc6OYNF
 ozlUWdYMezH6i7ytXIYYoA6TmiFRz613Lzew8eEx9MSwNyQBesJO3Dtl4CM5e8DQ5nalVxM8x8oPG
 4rd/IVTDhe6El4XCPvYisP1FLSm5m+ufzrOWB5sYFLEZeWxE/d0geT6cuHf3f49Mi0J/ODpe/a8BO
 Q7ZoA=;
Received: from fw-tnat-cam3.arm.com ([217.140.106.51]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iIZKp-0001ZT-BI; Thu, 10 Oct 2019 14:22:31 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 053B9D0003B; Thu, 10 Oct 2019 15:22:31 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20191008164443.1358-7-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191010142231.053B9D0003B@fitzroy.sirena.org.uk>
Date: Thu, 10 Oct 2019 15:22:31 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: imx: Read ESAI parameters and send
	them to DSP" to the asoc tree
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

   ASoC: SOF: imx: Read ESAI parameters and send them to DSP

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From a4eff5f86c9c5e7d07d880bd86ce8faad19d7063 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Tue, 8 Oct 2019 11:44:40 -0500
Subject: [PATCH] ASoC: SOF: imx: Read ESAI parameters and send them to DSP

ESAI parameters are read for topology file, packed into
sof_ipc_dai_esai_parms struct and then sent to DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191008164443.1358-7-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/pcm.c      |  8 +++++
 sound/soc/sof/topology.c | 69 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 6490b1577152..d72798d2b302 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -682,6 +682,14 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 	case SOF_DAI_INTEL_ALH:
 		/* do nothing for ALH dai_link */
 		break;
+	case SOF_DAI_IMX_ESAI:
+		channels->min = dai->dai_config->esai.tdm_slots;
+		channels->max = dai->dai_config->esai.tdm_slots;
+
+		dev_dbg(sdev->dev,
+			"channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
 	default:
 		dev_err(sdev->dev, "error: invalid DAI type %d\n",
 			dai->dai_config->type);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2e5fab1cfbb4..a29109ea3c06 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -641,6 +641,13 @@ static const struct sof_topology_token dmic_tokens[] = {
 
 };
 
+/* ESAI */
+static const struct sof_topology_token esai_tokens[] = {
+	{SOF_TKN_IMX_ESAI_MCLK_ID,
+		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
+		offsetof(struct sof_ipc_dai_esai_params, mclk_id), 0},
+};
+
 /*
  * DMIC PDM Tokens
  * SOF_TKN_INTEL_DMIC_PDM_CTRL_ID should be the first token
@@ -2549,8 +2556,66 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_tplg_hw_config *hw_config,
 			      struct sof_ipc_dai_config *config)
 {
-	/*TODO: Add implementation */
-	return 0;
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_private *private = &cfg->priv;
+	struct sof_ipc_reply reply;
+	u32 size = sizeof(*config);
+	int ret;
+
+	/* handle master/slave and inverted clocks */
+	sof_dai_set_format(hw_config, config);
+
+	/* init IPC */
+	memset(&config->esai, 0, sizeof(struct sof_ipc_dai_esai_params));
+	config->hdr.size = size;
+
+	ret = sof_parse_tokens(scomp, &config->esai, esai_tokens,
+			       ARRAY_SIZE(esai_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(sdev->dev, "error: parse esai tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
+	config->esai.mclk_rate = le32_to_cpu(hw_config->mclk_rate);
+	config->esai.bclk_rate = le32_to_cpu(hw_config->bclk_rate);
+	config->esai.fsync_rate = le32_to_cpu(hw_config->fsync_rate);
+	config->esai.mclk_direction = hw_config->mclk_direction;
+	config->esai.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+	config->esai.tdm_slot_width = le32_to_cpu(hw_config->tdm_slot_width);
+	config->esai.rx_slots = le32_to_cpu(hw_config->rx_slots);
+	config->esai.tx_slots = le32_to_cpu(hw_config->tx_slots);
+
+	dev_info(sdev->dev,
+		 "tplg: config ESAI%d fmt 0x%x mclk %d width %d slots %d mclk id %d\n",
+		config->dai_index, config->format,
+		config->esai.mclk_rate, config->esai.tdm_slot_width,
+		config->esai.tdm_slots, config->esai.mclk_id);
+
+	if (config->esai.tdm_slots < 1 || config->esai.tdm_slots > 8) {
+		dev_err(sdev->dev, "error: invalid channel count for ESAI%d\n",
+			config->dai_index);
+		return -EINVAL;
+	}
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config->hdr.cmd, config, size, &reply,
+				 sizeof(reply));
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: failed to set DAI config for ESAI%d\n",
+			config->dai_index);
+		return ret;
+	}
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(sdev->dev, "error: failed to save DAI config for ESAI%d\n",
+			config->dai_index);
+
+	return ret;
 }
 
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
