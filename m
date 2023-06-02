Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7157720AA9
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 23:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 190B0822;
	Fri,  2 Jun 2023 22:59:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 190B0822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685739603;
	bh=6tZT80OD9LvKjj6jgTBddSA+hm1CL820C5/hu5HzKWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rUWfqdFixR5z4v4Co6/34o7wOL/e60A18r+Ixpn62GPQaWbQkfn+TH1yOVpbCzoaF
	 E4o9O+zwkAm5wEKShnDMIJT9DLCJ6HulZ2K1TXgKts/mWh+xKnIaCSa9UULOPTMczJ
	 uDA+CwUqQOsc3Zk0et5qmkwwyBspaWcIJM+Z4uxE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E370F805D8; Fri,  2 Jun 2023 22:57:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A0DACF805CB;
	Fri,  2 Jun 2023 22:57:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8FC2FF80552; Fri,  2 Jun 2023 22:56:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6436DF80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:56:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6436DF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=h8TkEGzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685739402; x=1717275402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6tZT80OD9LvKjj6jgTBddSA+hm1CL820C5/hu5HzKWQ=;
  b=h8TkEGzfboZyanjk/BZq2D+HvUgkH/vcx6Tc6ku3sCQ3tu2qKkPt0oHW
   LUEU+K0k1WVoBUw/DkeTVoNAzMyMcoCKbiqzcmotR0eQhhKfwiirqoYXa
   dNFMkyk/zJbMICVQ5/ur5wVeKLSc8ZR+MIVjiSfwKt9xLpp2MDzNVyuk1
   HZqFuHgAp/EVbfR8TazXY1e2jrj5kBwFZ3t5VrCbOBjEinJcEwN6brXxV
   BEIaBpd4I1UDZFVeUqKHqHnBV5adlSQ5XlHLxlfiZ/oQVYVMR6PYmljB6
   6LIOcPqA2B7m8pLoOAt432OYnCyoDzvIGZzjuXy+lCkIABs/4tZq+qzLN
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="359272108"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="359272108"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="832092719"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="832092719"
Received: from sbalabha-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:56:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 7/9] ASoC: SOF: ipc4-topology: add DMA config TLV to IPC data
Date: Fri,  2 Jun 2023 15:56:18 -0500
Message-Id: <20230602205620.310879-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
References: <20230602205620.310879-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LL4H7YYT4W2O5G6N2RCBUVMFDFNHILLK
X-Message-ID-Hash: LL4H7YYT4W2O5G6N2RCBUVMFDFNHILLK
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LL4H7YYT4W2O5G6N2RCBUVMFDFNHILLK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch adds a DMA config TLV structure and the relevant code to
copy this TLV after the gateway configuration. For now this is an
iso-functionality change, the TLVs are not configured just
yet. Additional patches will be needed for DMIC/SSP/ALH (aka
SoundWire).

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c | 34 +++++++++++++++++++++++++++++++---
 sound/soc/sof/ipc4-topology.h |  2 ++
 2 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 31a97a4248f4..a4e1a70b607d 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1383,6 +1383,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	struct snd_sof_dai *dai;
 	struct snd_mask *fmt;
 	int out_sample_valid_bits;
+	u32 gtw_cfg_config_length;
+	u32 dma_config_tlv_size = 0;
 	void **ipc_config_data;
 	int *ipc_config_size;
 	u32 **data;
@@ -1699,7 +1701,27 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 	ipc_config_data = &ipc4_copier->ipc_config_data;
 
 	/* config_length is DWORD based */
-	ipc_size = sizeof(*copier_data) + copier_data->gtw_cfg.config_length * 4;
+	gtw_cfg_config_length = copier_data->gtw_cfg.config_length * 4;
+	ipc_size = sizeof(*copier_data) + gtw_cfg_config_length;
+
+	if (ipc4_copier->dma_config_tlv.type == SOF_IPC4_GTW_DMA_CONFIG_ID &&
+	    ipc4_copier->dma_config_tlv.length) {
+		dma_config_tlv_size = sizeof(ipc4_copier->dma_config_tlv) +
+			ipc4_copier->dma_config_tlv.dma_config.dma_priv_config_size;
+
+		/* paranoia check on TLV size/length */
+		if (dma_config_tlv_size != ipc4_copier->dma_config_tlv.length +
+		    sizeof(uint32_t) * 2) {
+			dev_err(sdev->dev, "Invalid configuration, TLV size %d length %d\n",
+				dma_config_tlv_size, ipc4_copier->dma_config_tlv.length);
+			return -EINVAL;
+		}
+
+		ipc_size += dma_config_tlv_size;
+
+		/* we also need to increase the size at the gtw level */
+		copier_data->gtw_cfg.config_length += dma_config_tlv_size / 4;
+	}
 
 	dev_dbg(sdev->dev, "copier %s, IPC size is %d", swidget->widget->name, ipc_size);
 
@@ -1711,9 +1733,15 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 
 	/* copy IPC data */
 	memcpy(*ipc_config_data, (void *)copier_data, sizeof(*copier_data));
-	if (copier_data->gtw_cfg.config_length)
+	if (gtw_cfg_config_length)
 		memcpy(*ipc_config_data + sizeof(*copier_data),
-		       *data, copier_data->gtw_cfg.config_length * 4);
+		       *data, gtw_cfg_config_length);
+
+	/* add DMA Config TLV, if configured */
+	if (dma_config_tlv_size)
+		memcpy(*ipc_config_data + sizeof(*copier_data) +
+		       gtw_cfg_config_length,
+		       &ipc4_copier->dma_config_tlv, dma_config_tlv_size);
 
 	/* update pipeline memory usage */
 	sof_ipc4_update_resource_usage(sdev, swidget, &copier_data->base_config);
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index f1d26b5c21d7..6dcf14886e85 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -300,6 +300,7 @@ struct sof_ipc4_alh_configuration_blob {
  * @gtw_attr: Gateway attributes for copier blob
  * @dai_type: DAI type
  * @dai_index: DAI index
+ * @dma_config_tlv: DMA configuration
  */
 struct sof_ipc4_copier {
 	struct sof_ipc4_copier_data data;
@@ -312,6 +313,7 @@ struct sof_ipc4_copier {
 	struct sof_ipc4_gtw_attributes *gtw_attr;
 	u32 dai_type;
 	int dai_index;
+	struct sof_ipc4_dma_config_tlv dma_config_tlv;
 };
 
 /**
-- 
2.37.2

