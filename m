Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E1D89581A
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:23:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B2912C35;
	Tue,  2 Apr 2024 17:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B2912C35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071426;
	bh=O3Xjhr5i4oX12VFxWeKbSmbwSd+1rJmt2zqPFSMxbVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mvKOgDTSWMZ9BIw7jfYX720VfItW4yJcec2AWf+7OtMAbvSBQFDgQsA29Kdm9u62r
	 a6zQZiusB1ixPTu7hxYmxcJ9BtQq2OmW7eYR4wZ8zRFchV2JRYHk03RUBJLco9TIJm
	 8sPOjRspmpOrR/YH7hNqpG6pdx7t0p7u/dUbFd74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B96B1F80C57; Tue,  2 Apr 2024 17:19:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08858F80C75;
	Tue,  2 Apr 2024 17:19:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 999E4F80681; Tue,  2 Apr 2024 17:19:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DECE2F805E4
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DECE2F805E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Zz+wP6NU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071136; x=1743607136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O3Xjhr5i4oX12VFxWeKbSmbwSd+1rJmt2zqPFSMxbVQ=;
  b=Zz+wP6NUJFG80KkGF8PUtBjXYLQyJA4B2MIlDbF8iixIXndHtlgIX333
   B8s4tSexJ2zrdX+AqPWY0Wqo2uFAsb1r4NQUQrqf1vFK4YO6HRc/qbON6
   LUY5wXjKaw13QLX8CyDlGxW8yi9XdICMOUwgZSDdjg0CTbCStKXVpagN+
   yWJ+SOtbz0HwIYwXVwndEJNxRFykJ+Zj8OvLBnR0+SLf2eGAlfRy8H7Dv
   rPnf2V1EiB38P2PC/7WpOzG/0sMmAxg2SfdYKg8a3QBptgTtvI5rBanoy
   PuJVg0F8Tqo1cF+ulD7pK7owwVQ3LC56XNMT4aiV3s6PFJ9jouGGOe44z
   g==;
X-CSE-ConnectionGUID: N/jZkPoWS6m2L3D1iNIXHA==
X-CSE-MsgGUID: UPKAtAJES66GLW7DJgXEng==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730252"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730252"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:49 -0700
X-CSE-ConnectionGUID: l4OevL10SqmZXeq5OCFxhA==
X-CSE-MsgGUID: 7l553nk0QIWtDyiIMrVUeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796559"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 17/17] ASoC: SOF: ipc4-topology: Save the ALH DAI index during
 hw_params
Date: Tue,  2 Apr 2024 10:18:28 -0500
Message-Id: <20240402151828.175002-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3Y24EJK246OAM7SBYNOBI6MBAECA55LX
X-Message-ID-Hash: 3Y24EJK246OAM7SBYNOBI6MBAECA55LX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3Y24EJK246OAM7SBYNOBI6MBAECA55LX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The node_id for multi-gateway ALH DAI's get overwritten with the
group_id during the DAI copier's ipc_prepare op. So, save the ALH
dai_index during the BE DAI hw_params in the dai_index field of struct
ipc4_copier and use that to set the device ID in the configuration blob.
This will avoid errors during copier init after an xrun.

Note that the dai_index is typically set in topology for DMIC/SSP, but
it's not used for ALH. Reclaiming this dai_index field to store the
node_id does not generate a conflict with topology-defined values.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c     |  1 +
 sound/soc/sof/ipc4-topology.c | 12 ++++++++++--
 sound/soc/sof/ipc4-topology.h |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 2c64c25d6f3b..d38dc43c2f1c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -164,6 +164,7 @@ static int sdw_params_free(struct device *dev, struct sdw_intel_stream_free_data
 		struct sof_ipc4_copier *ipc4_copier;
 
 		ipc4_copier = dai->private;
+		ipc4_copier->dai_index = 0;
 		copier_data = &ipc4_copier->data;
 
 		/* clear the node ID */
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index e0e4f356275f..c29c1de4e925 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1732,6 +1732,8 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 			 */
 			i = 0;
 			list_for_each_entry(w, &sdev->widget_list, list) {
+				u32 node_type;
+
 				if (w->widget->sname &&
 				    strcmp(w->widget->sname, swidget->widget->sname))
 					continue;
@@ -1739,7 +1741,10 @@ sof_ipc4_prepare_copier_module(struct snd_sof_widget *swidget,
 				dai = w->private;
 				alh_copier = (struct sof_ipc4_copier *)dai->private;
 				alh_data = &alh_copier->data;
-				blob->alh_cfg.mapping[i].device = alh_data->gtw_cfg.node_id;
+				node_type = SOF_IPC4_GET_NODE_TYPE(alh_data->gtw_cfg.node_id);
+				blob->alh_cfg.mapping[i].device = SOF_IPC4_NODE_TYPE(node_type);
+				blob->alh_cfg.mapping[i].device |=
+					SOF_IPC4_NODE_INDEX(alh_copier->dai_index);
 
 				/*
 				 * The mapping[i] device in ALH blob should be the same as the
@@ -2862,12 +2867,15 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		/*
 		 * Do not clear the node ID when this op is invoked with
 		 * SOF_DAI_CONFIG_FLAGS_HW_FREE. It is needed to free the group_ida during
-		 * unprepare.
+		 * unprepare. The node_id for multi-gateway DAI's will be overwritten with the
+		 * group_id during copier's ipc_prepare op.
 		 */
 		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+			ipc4_copier->dai_index = data->dai_node_id;
 			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_node_id);
 		}
+
 		break;
 	case SOF_DAI_INTEL_DMIC:
 	case SOF_DAI_INTEL_SSP:
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index aa5122c3721d..6e33208a357f 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -45,6 +45,7 @@
 #define SOF_IPC4_NODE_INDEX_MASK	0xFF
 #define SOF_IPC4_NODE_INDEX(x)	((x) & SOF_IPC4_NODE_INDEX_MASK)
 #define SOF_IPC4_NODE_TYPE(x)  ((x) << 8)
+#define SOF_IPC4_GET_NODE_TYPE(node_id) ((node_id) >> 8)
 
 /* Node ID for SSP type DAI copiers */
 #define SOF_IPC4_NODE_INDEX_INTEL_SSP(x) (((x) & 0xf) << 4)
-- 
2.40.1

