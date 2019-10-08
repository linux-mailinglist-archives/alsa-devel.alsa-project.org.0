Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 839EDCFF43
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Oct 2019 18:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FFE81657;
	Tue,  8 Oct 2019 18:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FFE81657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570553470;
	bh=EA1OMy9QUONg4YtOTkhRmqj2jvvDBvCObV/LDfTvP4E=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mnvbp4RQZwTWZSxlsJ3yO8QXnsWbYnk092hb/r2vLi7z/DdmxdUMJ9FlK6QvOLoNj
	 l0dfqTohU3WGAFHPkgplkPVyloSRqY7zlv/7jbak0WOwLAjl2CLoE34nHMqFFCqQNH
	 FkhAfDLaKvLd6sGUpkOgvnWqVzl2gU0AxPk9qgAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E44AF8065A;
	Tue,  8 Oct 2019 18:45:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F062BF8060D; Tue,  8 Oct 2019 18:44:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EC01F8059F
 for <alsa-devel@alsa-project.org>; Tue,  8 Oct 2019 18:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EC01F8059F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:44:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="218338338"
Received: from kwwong-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.150.53])
 by fmsmga004.fm.intel.com with ESMTP; 08 Oct 2019 09:44:50 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  8 Oct 2019 11:44:40 -0500
Message-Id: <20191008164443.1358-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
References: <20191008164443.1358-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/9] ASoC: SOF: imx: Read ESAI parameters and
	send them to DSP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

ESAI parameters are read for topology file, packed into
sof_ipc_dai_esai_parms struct and then sent to DSP.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c      |  8 +++++
 sound/soc/sof/topology.c | 69 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 2b876d497447..b0f4217433e5 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -691,6 +691,14 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
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
index 0aabb3190ddc..d8172d3f672f 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -798,6 +798,13 @@ static const struct sof_topology_token dmic_tokens[] = {
 
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
@@ -2535,8 +2542,66 @@ static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
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
