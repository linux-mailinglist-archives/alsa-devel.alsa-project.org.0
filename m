Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B56B81AB29F
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Apr 2020 22:41:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63C3582A;
	Wed, 15 Apr 2020 22:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63C3582A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586983268;
	bh=PgcqFUVEurRsatQAnw8GYwBXrIsDBbPMwTO4Vq9WdgI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sIDZAUPKvt4ujKWj0ch56SS1n7MctrNORd5CqPsJk/AvYwcSz1vs8KtPMkLDCGXE1
	 fTKar6fmS13/DgdofIVfVY8cYkPWCY6bDBSDl6H16GTxd1w4XbLvJgqFEgnbypKmnO
	 jCHv1y2DADWc2TbO89g9JPae1EZvtuJJCwQjQYDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 732AEF8034B;
	Wed, 15 Apr 2020 22:29:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7203EF802F7; Wed, 15 Apr 2020 22:29:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FB47F802BD
 for <alsa-devel@alsa-project.org>; Wed, 15 Apr 2020 22:29:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FB47F802BD
IronPort-SDR: 0lhpyIjvb6xtBryTAhduLejUC7UpYQYptxtNaApAySvAlatF5mv2ItI1e0/yH7fgAHJvuZbv9A
 3GkrTw762Y1A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2020 13:29:14 -0700
IronPort-SDR: nxXRjGf4JHsCW9/YrEnwuDwK3/aRs5JrTIDdt2Yb4pX2ATlNVke83h/JM0pNCGz9q8XwWWcglE
 hKwxPX1lUbCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,388,1580803200"; d="scan'208";a="288656325"
Received: from jplam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.82.197])
 by fmsmga002.fm.intel.com with ESMTP; 15 Apr 2020 13:29:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 17/24] ASoC: SOF: Intel: Change DMIC load IPC to fixed length
Date: Wed, 15 Apr 2020 15:28:09 -0500
Message-Id: <20200415202816.934-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
References: <20200415202816.934-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>

This patch changes the flexible array member pdm[] into a fixed
array of four that is the max. number of stereo PDM controllers
in the current Intel platforms. The change simplifies DMIC DAI
load code and aligns the IPC with other DAI types.

The change is compatible with old and new firmware with similar
change. The ABI minor version is increased due to change in
IPC headers.

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Seppo Ingalsuo <seppo.ingalsuo@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/dai-intel.h | 10 +++--
 sound/soc/sof/topology.c      | 75 ++++++++++++-----------------------
 2 files changed, 32 insertions(+), 53 deletions(-)

diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 988cddb8b04b..59fa73f3e34d 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -49,6 +49,9 @@
 /* bclk idle */
 #define SOF_DAI_INTEL_SSP_CLKCTRL_BCLK_IDLE_HIGH	BIT(5)
 
+/* DMIC max. four controllers for eight microphone channels */
+#define SOF_DAI_INTEL_DMIC_NUM_CTRL			4
+
 /* SSP Configuration Request - SOF_IPC_DAI_SSP_CONFIG */
 struct sof_ipc_dai_ssp_params {
 	struct sof_ipc_hdr hdr;
@@ -175,7 +178,8 @@ struct sof_ipc_dai_dmic_params {
 	uint16_t duty_min;	/**< Min. mic clock duty cycle in % (20..80) */
 	uint16_t duty_max;	/**< Max. mic clock duty cycle in % (min..80) */
 
-	uint32_t num_pdm_active; /**< Number of active pdm controllers */
+	uint32_t num_pdm_active; /**< Number of active pdm controllers. */
+				 /**< Range is 1..SOF_DAI_INTEL_DMIC_NUM_CTRL */
 
 	uint32_t wake_up_time;      /**< Time from clock start to data (us) */
 	uint32_t min_clock_on_time; /**< Min. time that clk is kept on (us) */
@@ -184,8 +188,8 @@ struct sof_ipc_dai_dmic_params {
 	/* reserved for future use */
 	uint32_t reserved[5];
 
-	/**< variable number of pdm controller config */
-	struct sof_ipc_dai_dmic_pdm_ctrl pdm[0];
+	/**< PDM controllers configuration */
+	struct sof_ipc_dai_dmic_pdm_ctrl pdm[SOF_DAI_INTEL_DMIC_NUM_CTRL];
 } __packed;
 
 #endif
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index e988e6b1a594..602406ff8e4c 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -2891,18 +2891,13 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 {
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	struct snd_soc_tplg_private *private = &cfg->priv;
-	struct sof_ipc_dai_config *ipc_config;
 	struct sof_ipc_reply reply;
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
-	u32 size;
+	size_t size = sizeof(*config);
 	int ret, j;
 
-	/*
-	 * config is only used for the common params in dmic_params structure
-	 * that does not include the PDM controller config array
-	 * Set the common params to 0.
-	 */
+	/* Ensure the entire DMIC config struct is zeros */
 	memset(&config->dmic, 0, sizeof(struct sof_ipc_dai_dmic_params));
 
 	/* get DMIC tokens */
@@ -2915,33 +2910,16 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 		return ret;
 	}
 
-	/*
-	 * allocate memory for dmic dai config accounting for the
-	 * variable number of active pdm controllers
-	 * This will be the ipc payload for setting dai config
-	 */
-	size = sizeof(*config) + sizeof(struct sof_ipc_dai_dmic_pdm_ctrl) *
-					config->dmic.num_pdm_active;
-
-	ipc_config = kzalloc(size, GFP_KERNEL);
-	if (!ipc_config)
-		return -ENOMEM;
-
-	/* copy the common dai config and dmic params */
-	memcpy(ipc_config, config, sizeof(*config));
-
 	/*
 	 * alloc memory for private member
 	 * Used to track the pdm config array index currently being parsed
 	 */
 	sdev->private = kzalloc(sizeof(u32), GFP_KERNEL);
-	if (!sdev->private) {
-		kfree(ipc_config);
+	if (!sdev->private)
 		return -ENOMEM;
-	}
 
 	/* get DMIC PDM tokens */
-	ret = sof_parse_tokens(scomp, &ipc_config->dmic.pdm[0], dmic_pdm_tokens,
+	ret = sof_parse_tokens(scomp, &config->dmic.pdm[0], dmic_pdm_tokens,
 			       ARRAY_SIZE(dmic_pdm_tokens), private->array,
 			       le32_to_cpu(private->size));
 	if (ret != 0) {
@@ -2951,44 +2929,42 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	}
 
 	/* set IPC header size */
-	ipc_config->hdr.size = size;
+	config->hdr.size = size;
 
 	/* debug messages */
 	dev_dbg(scomp->dev, "tplg: config DMIC%d driver version %d\n",
-		ipc_config->dai_index, ipc_config->dmic.driver_ipc_version);
+		config->dai_index, config->dmic.driver_ipc_version);
 	dev_dbg(scomp->dev, "pdmclk_min %d pdm_clkmax %d duty_min %hd\n",
-		ipc_config->dmic.pdmclk_min, ipc_config->dmic.pdmclk_max,
-		ipc_config->dmic.duty_min);
+		config->dmic.pdmclk_min, config->dmic.pdmclk_max,
+		config->dmic.duty_min);
 	dev_dbg(scomp->dev, "duty_max %hd fifo_fs %d num_pdms active %d\n",
-		ipc_config->dmic.duty_max, ipc_config->dmic.fifo_fs,
-		ipc_config->dmic.num_pdm_active);
-	dev_dbg(scomp->dev, "fifo word length %hd\n",
-		ipc_config->dmic.fifo_bits);
+		config->dmic.duty_max, config->dmic.fifo_fs,
+		config->dmic.num_pdm_active);
+	dev_dbg(scomp->dev, "fifo word length %hd\n", config->dmic.fifo_bits);
 
-	for (j = 0; j < ipc_config->dmic.num_pdm_active; j++) {
+	for (j = 0; j < config->dmic.num_pdm_active; j++) {
 		dev_dbg(scomp->dev, "pdm %hd mic a %hd mic b %hd\n",
-			ipc_config->dmic.pdm[j].id,
-			ipc_config->dmic.pdm[j].enable_mic_a,
-			ipc_config->dmic.pdm[j].enable_mic_b);
+			config->dmic.pdm[j].id,
+			config->dmic.pdm[j].enable_mic_a,
+			config->dmic.pdm[j].enable_mic_b);
 		dev_dbg(scomp->dev, "pdm %hd polarity a %hd polarity b %hd\n",
-			ipc_config->dmic.pdm[j].id,
-			ipc_config->dmic.pdm[j].polarity_mic_a,
-			ipc_config->dmic.pdm[j].polarity_mic_b);
+			config->dmic.pdm[j].id,
+			config->dmic.pdm[j].polarity_mic_a,
+			config->dmic.pdm[j].polarity_mic_b);
 		dev_dbg(scomp->dev, "pdm %hd clk_edge %hd skew %hd\n",
-			ipc_config->dmic.pdm[j].id,
-			ipc_config->dmic.pdm[j].clk_edge,
-			ipc_config->dmic.pdm[j].skew);
+			config->dmic.pdm[j].id,
+			config->dmic.pdm[j].clk_edge,
+			config->dmic.pdm[j].skew);
 	}
 
 	if (SOF_ABI_VER(v->major, v->minor, v->micro) < SOF_ABI_VER(3, 0, 1)) {
 		/* this takes care of backwards compatible handling of fifo_bits_b */
-		ipc_config->dmic.reserved_2 = ipc_config->dmic.fifo_bits;
+		config->dmic.reserved_2 = config->dmic.fifo_bits;
 	}
 
 	/* send message to DSP */
-	ret = sof_ipc_tx_message(sdev->ipc,
-				 ipc_config->hdr.cmd, ipc_config, size, &reply,
-				 sizeof(reply));
+	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, size,
+				 &reply, sizeof(reply));
 
 	if (ret < 0) {
 		dev_err(scomp->dev,
@@ -2998,14 +2974,13 @@ static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 	}
 
 	/* set config for all DAI's with name matching the link name */
-	ret = sof_set_dai_config(sdev, size, link, ipc_config);
+	ret = sof_set_dai_config(sdev, size, link, config);
 	if (ret < 0)
 		dev_err(scomp->dev, "error: failed to save DAI config for DMIC%d\n",
 			config->dai_index);
 
 err:
 	kfree(sdev->private);
-	kfree(ipc_config);
 
 	return ret;
 }
-- 
2.20.1

