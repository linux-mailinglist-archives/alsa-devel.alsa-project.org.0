Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF9889580F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:22:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2232C2F;
	Tue,  2 Apr 2024 17:21:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2232C2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071325;
	bh=czAjr/eYzpK29kh91QDsvNPki5Hw4h0Zlv7iYd4PYec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ouGDHEKFNZoX+35o4w6tAAuqJLh6ZN4ezFQ7qWX1kCpEiTKjKAhnCdrl79oZbkLl4
	 Mw+3WRYWOh1R22W/GdPwYsfd2mQ5VYfwwR/tWUDt6qReSGPC1+2sf8RT3yJQT40z+8
	 nQiRg5C/uXxh3i9yomNy5Lc8pidXXe3Qq0uKlkHc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA3ECF80733; Tue,  2 Apr 2024 17:19:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 199E0F8074B;
	Tue,  2 Apr 2024 17:19:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ABD48F80612; Tue,  2 Apr 2024 17:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E2D13F80589
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2D13F80589
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AibXHiG6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071132; x=1743607132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=czAjr/eYzpK29kh91QDsvNPki5Hw4h0Zlv7iYd4PYec=;
  b=AibXHiG68lg+jimUXwGa/XZSMVUs1Uv51EKJVU5D7+JAT08ZU4AhOgFt
   az0ngWSMQ+tstkY3iGoeHDPSixcscJY7mkZs9JHjGsKFEzerLlluCQW3L
   V3+uFW4wlpDSWVG/AQhlaipfypIdrw1e60jkc2Qz6HDNff3zbOwlyy6Qu
   xHLHru4esJPEFpFQPyVcCwjuIQlwViPByRc/oh9o4uu1NtbGvqVNODIw7
   Af5xLDXSK2tDMqNBVJw1/7lwYiJd7F7LlBEWovFPXawoCujv3VpwdqDzR
   rrEF3QbnxNNf4aAGEKJWqZi4s6SPjsopvhe/DYkAeHX5Gi/A/CdMPQQek
   g==;
X-CSE-ConnectionGUID: t6kOaZSUQgKaM2elJjDikA==
X-CSE-MsgGUID: npo4rAPRQA68+Ej/MR3rog==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730081"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730081"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:43 -0700
X-CSE-ConnectionGUID: FK8obrWjRzSQweIer0vwmQ==
X-CSE-MsgGUID: 3pFlMhjaT/2Fe4InC68U7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796516"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 10/17] ASoC: SOF: IPC4: extend dai_data with node_id
Date: Tue,  2 Apr 2024 10:18:21 -0500
Message-Id: <20240402151828.175002-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QVWFSG27TAWNGBLOJ7SN3QZZXMTYNUCV
X-Message-ID-Hash: QVWFSG27TAWNGBLOJ7SN3QZZXMTYNUCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QVWFSG27TAWNGBLOJ7SN3QZZXMTYNUCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The node_id value needs to be handled specifically for ALH.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 1 +
 sound/soc/sof/intel/hda.c     | 1 +
 sound/soc/sof/ipc4-topology.c | 8 ++++++--
 sound/soc/sof/sof-audio.h     | 1 +
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 5e3229c8fe13..86c2325e5949 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -491,6 +491,7 @@ int sdw_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	int i;
 
 	data.dai_index = (link_id << 8) | cpu_dai->id;
+	data.dai_node_id = intel_alh_id;
 	ret = non_hda_dai_hw_params_data(substream, params, cpu_dai, &data, flags);
 	if (ret < 0) {
 		dev_err(cpu_dai->dev, "%s: non_hda_dai_hw_params failed %d\n", __func__, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 63f1cf3b915f..ae1a38f20bdb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -145,6 +145,7 @@ static int sdw_params_stream(struct device *dev,
 
 	data.dai_index = (params_data->link_id << 8) | d->id;
 	data.dai_data = params_data->alh_stream_id;
+	data.dai_node_id = data.dai_data;
 
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 28ab687a1d9c..6b9b16f3157e 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -2857,7 +2857,11 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 	case SOF_DAI_INTEL_HDA:
 		gtw_attr = ipc4_copier->gtw_attr;
 		gtw_attr->lp_buffer_alloc = pipeline->lp_mode;
-		fallthrough;
+		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
+			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+		}
+		break;
 	case SOF_DAI_INTEL_ALH:
 		/*
 		 * Do not clear the node ID when this op is invoked with
@@ -2866,7 +2870,7 @@ static int sof_ipc4_dai_config(struct snd_sof_dev *sdev, struct snd_sof_widget *
 		 */
 		if (flags & SOF_DAI_CONFIG_FLAGS_HW_PARAMS) {
 			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
-			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_data);
+			copier_data->gtw_cfg.node_id |= SOF_IPC4_NODE_INDEX(data->dai_node_id);
 		}
 		break;
 	case SOF_DAI_INTEL_DMIC:
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 86bbb531e142..7c08f915b35b 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -91,6 +91,7 @@ struct snd_sof_pcm;
 struct snd_sof_dai_config_data {
 	int dai_index;
 	int dai_data; /* contains DAI-specific information */
+	int dai_node_id; /* contains DAI-specific information for Gateway configuration */
 };
 
 /**
-- 
2.40.1

