Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD4589580A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:21:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60AB92C3A;
	Tue,  2 Apr 2024 17:21:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60AB92C3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071295;
	bh=DellMu4C0z2SqkW/GwLBIPF8taj4i2Q0cZ8ESqFaIqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DKTCEK+tFiwd1xL4uVo+4Ee1vBVf48i+LKvd5XffNQUrsRphPTDlno5mx14cqDxwi
	 xq3FLfsTnEyiQuHf5Oi1MEivddn6p7onApO1fNImQYA4jPBxUxfNWqTXr29YWQI2Bu
	 qai4XnibViLJr51qyhSFejECU3874yzNG7UYMKDw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84640F806DE; Tue,  2 Apr 2024 17:19:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 821FBF806D0;
	Tue,  2 Apr 2024 17:19:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F5C8F805FB; Tue,  2 Apr 2024 17:18:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD17F80238
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD17F80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EEO+Mf7M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071128; x=1743607128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DellMu4C0z2SqkW/GwLBIPF8taj4i2Q0cZ8ESqFaIqo=;
  b=EEO+Mf7MGW9CbOI/NrhDzxAzHfQgqT1jZbbppDsTe/A9BfqKZziDdwiV
   uILEMQkgZjz+eGg+dfgXwMxuhxHPoIsJ8YBi2yki6QtU1bTYQjQsDacAN
   EzdoOdEhkd73X8zu+9WkI4BuMp1gkOWnsLwkQ0JSb0e8339tMarEhGVlQ
   4cmZqY0W+2hJ+tUmbh68WeCF9jQWp6kCSE8OVi9u+4UAcHF1VGkB48rCy
   AaaUlNivNmqrApkQZ9hQDfc1c0N8s6JByfM0fv9owirl7Zm8KaXDiruOH
   1CZOsHHBSguoLa60wIJijPawQ10iO2CMTleVzLsnXkz5Mywe9ZaMNlbCO
   g==;
X-CSE-ConnectionGUID: igtUrwZdRC6MKMrASX6Y2Q==
X-CSE-MsgGUID: zC55UCe3SPKVsGUinR4bZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29729940"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29729940"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:39 -0700
X-CSE-ConnectionGUID: 9+0bWIcCT1SyLGaOAeBmFg==
X-CSE-MsgGUID: 16er1bKtTPuzsFoN/NDyFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796494"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:38 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 04/17] ASoC: SOF: make dma_config_tlv be an array
Date: Tue,  2 Apr 2024 10:18:15 -0500
Message-Id: <20240402151828.175002-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4CY6OQRBS3WSDOAJD7CLP7BR6PV4VI6F
X-Message-ID-Hash: 4CY6OQRBS3WSDOAJD7CLP7BR6PV4VI6F
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4CY6OQRBS3WSDOAJD7CLP7BR6PV4VI6F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Each stream needs a dma_config_tlv. We will handle multi dma_config_tlv
in the follow up commits.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c |  2 +-
 sound/soc/sof/ipc4-topology.c | 25 ++++++++++++-------------
 sound/soc/sof/ipc4-topology.h |  2 +-
 3 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 6a39ca632f55..01c544b7e046 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -392,7 +392,7 @@ static int non_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	/* configure TLV */
 	ipc4_copier = widget_to_copier(w);
 
-	dma_config_tlv = &ipc4_copier->dma_config_tlv;
+	dma_config_tlv = &ipc4_copier->dma_config_tlv[0];
 	dma_config_tlv->type = SOF_IPC4_GTW_DMA_CONFIG_ID;
 	/* dma_config_priv_size is zero */
 	dma_config_tlv->length = sizeof(dma_config_tlv->dma_config);
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 427f186ddc11..1870488b3cf6 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1486,6 +1486,7 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	u32 deep_buffer_dma_ms = 0;
 	int output_fmt_index;
 	bool single_output_format;
+	int i;
 
 	dev_dbg(sdev->dev, "copier %s, type %d", swidget->widget->name, swidget->id);
 
@@ -1711,7 +1712,6 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			u32 ch_map;
 			u32 step;
 			u32 mask;
-			int i;
 
 			blob = (struct sof_ipc4_alh_configuration_blob *)ipc4_copier->copier_config;
 
@@ -1821,19 +1821,18 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
 	ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
 
-	if (ipc4_copier->dma_config_tlv.type == SOF_IPC4_GTW_DMA_CONFIG_ID &&
-	    ipc4_copier->dma_config_tlv.length) {
-		dma_config_tlv_size = sizeof(ipc4_copier->dma_config_tlv) +
-			ipc4_copier->dma_config_tlv.dma_config.dma_priv_config_size;
-
-		/* paranoia check on TLV size/length */
-		if (dma_config_tlv_size != ipc4_copier->dma_config_tlv.length +
-		    sizeof(uint32_t) * 2) {
-			dev_err(sdev->dev, "Invalid configuration, TLV size %d length %d\n",
-				dma_config_tlv_size, ipc4_copier->dma_config_tlv.length);
-			return -EINVAL;
-		}
+	dma_config_tlv_size = 0;
+	for (i = 0; i < SOF_IPC4_DMA_DEVICE_MAX_COUNT; i++) {
+		if (ipc4_copier->dma_config_tlv[i].type != SOF_IPC4_GTW_DMA_CONFIG_ID)
+			continue;
+		dma_config_tlv_size += ipc4_copier->dma_config_tlv[i].length;
+		dma_config_tlv_size +=
+			ipc4_copier->dma_config_tlv[i].dma_config.dma_priv_config_size;
+		dma_config_tlv_size += (sizeof(ipc4_copier->dma_config_tlv[i]) -
+			sizeof(ipc4_copier->dma_config_tlv[i].dma_config));
+	}
 
+	if (dma_config_tlv_size) {
 		ipc_size += dma_config_tlv_size;
 
 		/* we also need to increase the size at the gtw level */
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index dce174a190dd..aa5122c3721d 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -313,7 +313,7 @@ struct sof_ipc4_copier {
 	struct sof_ipc4_gtw_attributes *gtw_attr;
 	u32 dai_type;
 	int dai_index;
-	struct sof_ipc4_dma_config_tlv dma_config_tlv;
+	struct sof_ipc4_dma_config_tlv dma_config_tlv[SOF_IPC4_DMA_DEVICE_MAX_COUNT];
 };
 
 /**
-- 
2.40.1

