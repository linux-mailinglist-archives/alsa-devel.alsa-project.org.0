Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 811BC34ACF5
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 17:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1011F1679;
	Fri, 26 Mar 2021 17:57:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1011F1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616777907;
	bh=Dt7AdIpDbv3r4nXyEM2vSt79detaopEWpOl4hYJh+ZY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OcSe0fmbhY689d2VFUM8B2lxuvkcQ5A6vkZPhXodwhV03oaxVDFKyUGka/IxgKuu3
	 vP++z6rAM7LmZyZAzD0LzJcGcLcO/9raD/Bnb3N3ny6AxP1SydnyIqBgU+CbCXTtQO
	 94UfyRkpKnJ7tduyzT+EtyV9XONayyJtCmwAzFDE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57337F80423;
	Fri, 26 Mar 2021 17:56:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4AAAF801EC; Fri, 26 Mar 2021 17:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD01F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 17:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD01F80103
IronPort-SDR: H0DnZL1L4TDzQTt8nJr67Xc2rYk/eIMFakVHX2XezFPKkyaWnQWc3C5YJYkgLxVUFlSy2rbzTh
 4QAcQyD6c6rg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="255177101"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="255177101"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 09:56:00 -0700
IronPort-SDR: f7q0YO7RhiW3eb3yATMN4u1eeSvBje7QLEZr107G0aVBTrx5zZ3IrUY3fnB1SyphUN5zkUbEq4
 BOYFQHPAQdJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="409978190"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga008.fm.intel.com with ESMTP; 26 Mar 2021 09:55:58 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: match SSP config with pcm hw params
Date: Fri, 26 Mar 2021 18:51:50 +0200
Message-Id: <20210326165150.255533-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326165150.255533-1-kai.vehmanen@linux.intel.com>
References: <20210326165150.255533-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 Jaska Uimonen <jaska.uimonen@linux.intel.com>
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

From: Jaska Uimonen <jaska.uimonen@linux.intel.com>

This patch adds a function to find a match between pcm hw params and SSP
DAI config. Config is matched against sample rate and if match is found
current config is set. If match isn't found last matched config is left
as current i.e. current config is not touched. Functionality for SSP
DAIs with 1 config remains the same as before.

Signed-off-by: Jaska Uimonen <jaska.uimonen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index c3dc533f2627..d6b1c8b7bdfb 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -619,6 +619,31 @@ static int sof_pcm_new(struct snd_soc_component *component,
 	return 0;
 }
 
+static void ssp_dai_config_pcm_params_match(struct snd_sof_dev *sdev, const char *link_name,
+					    struct snd_pcm_hw_params *params)
+{
+	struct sof_ipc_dai_config *config;
+	struct snd_sof_dai *dai;
+	int i;
+
+	/*
+	 * Search for all matching DAIs as we can have both playback and capture DAI
+	 * associated with the same link.
+	 */
+	list_for_each_entry(dai, &sdev->dai_list, list) {
+		if (!dai->name || strcmp(link_name, dai->name))
+			continue;
+		for (i = 0; i < dai->number_configs; i++) {
+			config = &dai->dai_config[i];
+			if (config->ssp.fsync_rate == params_rate(params)) {
+				dev_dbg(sdev->dev, "DAI config %d matches pcm hw params\n", i);
+				dai->current_config = i;
+				break;
+			}
+		}
+	}
+}
+
 /* fixup the BE DAI link to match any values from topology */
 int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_params *params)
 {
@@ -631,6 +656,7 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		snd_soc_rtdcom_lookup(rtd, SOF_AUDIO_PCM_DRV_NAME);
 	struct snd_sof_dai *dai =
 		snd_sof_find_dai(component, (char *)rtd->dai_link->name);
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(component);
 	struct snd_soc_dpcm *dpcm;
 
 	/* no topology exists for this BE, try a common configuration */
@@ -673,6 +699,9 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 	/* read rate and channels from topology */
 	switch (dai->dai_config->type) {
 	case SOF_DAI_INTEL_SSP:
+		/* search for config to pcm params match, if not found use default */
+		ssp_dai_config_pcm_params_match(sdev, (char *)rtd->dai_link->name, params);
+
 		rate->min = dai->dai_config[dai->current_config].ssp.fsync_rate;
 		rate->max = dai->dai_config[dai->current_config].ssp.fsync_rate;
 		channels->min = dai->dai_config[dai->current_config].ssp.tdm_slots;
-- 
2.31.0

