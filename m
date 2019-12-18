Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BC4123B9A
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Dec 2019 01:31:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D5B3166B;
	Wed, 18 Dec 2019 01:30:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D5B3166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576629105;
	bh=nGNT/7ogrRiM39xPp9Jh9VvJg3Z36di7Qo6y/ZcBBDE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JcD8uB+3wowDv/WpUITwrw/QZ8HRYOEm6CwPHicESZRlvdfwwit5r9B1KIVs9Chyp
	 DexG80o/Ocg19sKdkEyan7jqjztvVtUqtDlBLTfgzd5Xwe1b6FNdhAiCQEaMBB+8qn
	 HUM0gFSq4/wkyh197IGfLEM93qqwUoGnmgMOWrl8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 000EEF802A1;
	Wed, 18 Dec 2019 01:26:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFDB0F80274; Wed, 18 Dec 2019 01:26:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F5FFF80266
 for <alsa-devel@alsa-project.org>; Wed, 18 Dec 2019 01:26:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F5FFF80266
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 16:26:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="217974253"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.3.243])
 by orsmga003.jf.intel.com with ESMTP; 17 Dec 2019 16:26:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 17 Dec 2019 18:26:16 -0600
Message-Id: <20191218002616.7652-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
References: <20191218002616.7652-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Guido Roncarolo <guido.roncarolo@nxp.com>
Subject: [alsa-devel] [PATCH 8/8] ASoC: SOF: imx: Read SAI parameters and
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

From: Guido Roncarolo <guido.roncarolo@nxp.com>

Follow example from Intel SSP.

Signed-off-by: Guido Roncarolo <guido.roncarolo@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c      |  8 +++++
 sound/soc/sof/topology.c | 69 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 86829e5bd62d..9bb6388742e1 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -693,6 +693,14 @@ static int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd,
 		channels->min = dai->dai_config->esai.tdm_slots;
 		channels->max = dai->dai_config->esai.tdm_slots;
 
+		dev_dbg(component->dev,
+			"channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_IMX_SAI:
+		channels->min = dai->dai_config->sai.tdm_slots;
+		channels->max = dai->dai_config->sai.tdm_slots;
+
 		dev_dbg(component->dev,
 			"channels_min: %d channels_max: %d\n",
 			channels->min, channels->max);
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e06fa7c7e502..9f4f8868b386 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -695,6 +695,13 @@ static const struct sof_topology_token esai_tokens[] = {
 		offsetof(struct sof_ipc_dai_esai_params, mclk_id), 0},
 };
 
+/* SAI */
+static const struct sof_topology_token sai_tokens[] = {
+	{SOF_TKN_IMX_SAI_MCLK_ID,
+		SND_SOC_TPLG_TUPLE_TYPE_SHORT, get_token_u16,
+		offsetof(struct sof_ipc_dai_sai_params, mclk_id), 0},
+};
+
 /*
  * DMIC PDM Tokens
  * SOF_TKN_INTEL_DMIC_PDM_CTRL_ID should be the first token
@@ -2704,8 +2711,66 @@ static int sof_link_sai_load(struct snd_soc_component *scomp, int index,
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
+	memset(&config->sai, 0, sizeof(struct sof_ipc_dai_sai_params));
+	config->hdr.size = size;
+
+	ret = sof_parse_tokens(scomp, &config->sai, sai_tokens,
+			       ARRAY_SIZE(sai_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "error: parse sai tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
+	config->sai.mclk_rate = le32_to_cpu(hw_config->mclk_rate);
+	config->sai.mclk_direction = hw_config->mclk_direction;
+
+	config->sai.tdm_slots = le32_to_cpu(hw_config->tdm_slots);
+	config->sai.tdm_slot_width = le32_to_cpu(hw_config->tdm_slot_width);
+	config->sai.rx_slots = le32_to_cpu(hw_config->rx_slots);
+	config->sai.tx_slots = le32_to_cpu(hw_config->tx_slots);
+
+	dev_info(scomp->dev,
+		 "tplg: config SAI%d fmt 0x%x mclk %d width %d slots %d mclk id %d\n",
+		config->dai_index, config->format,
+		config->sai.mclk_rate, config->sai.tdm_slot_width,
+		config->sai.tdm_slots, config->sai.mclk_id);
+
+	if (config->sai.tdm_slots < 1 || config->sai.tdm_slots > 8) {
+		dev_err(scomp->dev, "error: invalid channel count for SAI%d\n",
+			config->dai_index);
+		return -EINVAL;
+	}
+
+	/* send message to DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 config->hdr.cmd, config, size, &reply,
+				 sizeof(reply));
+
+	if (ret < 0) {
+		dev_err(scomp->dev, "error: failed to set DAI config for SAI%d\n",
+			config->dai_index);
+		return ret;
+	}
+
+	/* set config for all DAI's with name matching the link name */
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "error: failed to save DAI config for SAI%d\n",
+			config->dai_index);
+
+	return ret;
 }
 
 static int sof_link_esai_load(struct snd_soc_component *scomp, int index,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
