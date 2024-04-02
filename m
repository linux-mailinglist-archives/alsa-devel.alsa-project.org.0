Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0304A895814
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 17:22:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1E362C5D;
	Tue,  2 Apr 2024 17:22:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1E362C5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712071376;
	bh=49ld4xJDHyZWnbGo+NFQDCKqv0fbH2lyVV3hubBlVwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ELdIGGtN9QCF7wcV+jI+ev+Ryyhbf1uB+IB3Z2ko92s3ZQGocyvpb5n1QF6kXmblD
	 TNhnKIygTNQ6xuiO+acITl2GrZgPPMteEVYRCcI+T4LMyaZT9SEYJzXu/A67uiIwyE
	 zPjFbmbTXYSd0XxtWuFf15BTUMpOTHC6ZanQA6hA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 100ADF80806; Tue,  2 Apr 2024 17:19:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 08433F805D2;
	Tue,  2 Apr 2024 17:19:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FF91F80623; Tue,  2 Apr 2024 17:19:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 71BEBF805B4
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 17:18:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71BEBF805B4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=F5oHPqwV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071132; x=1743607132;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=49ld4xJDHyZWnbGo+NFQDCKqv0fbH2lyVV3hubBlVwQ=;
  b=F5oHPqwVSQD0498BdyyiVbxriBWlGXZybPj1WNQKlR3MzAwLjdTROMhY
   DIRcu3cCF1klLUOdhRphghU35GzvCCXuKX+HwFsFK1qcTXDqRL10DUQDi
   RgdkUBpXt6/sCbmjJlUoLNMlVE6gDMnn8eyTbNisUn/2QCFDcs+2iaqJP
   tjaY+1h/3Demz5BSfNsJxYSYVkyC+WzZLqqt2WLxwCCYQKTgDCMkBjmNG
   BEo5E4QBge8/ynqbvlOat3rdRtoPeAw/eazUWnwJyKV3fX2IHjOaXax07
   ZRlESHsL7Gn2t3C1QhFFsT0KyUxujwruPDNp4/8rHS6rJEBzks26PKImv
   A==;
X-CSE-ConnectionGUID: pcd+KN2ESxCxvfsmDNK8dw==
X-CSE-MsgGUID: vMlga9HVSV2+p0SDi2cDRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730142"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="29730142"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:45 -0700
X-CSE-ConnectionGUID: vqu8mBJnTEqoCOWdzxkO7Q==
X-CSE-MsgGUID: tkvqeGYSQGebpCJPTkW9cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000";
   d="scan'208";a="22796534"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 08:18:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 12/17] ASoC: SOF: Intel: hda: Clear Soundwire node ID during
 BE DAI hw_free
Date: Tue,  2 Apr 2024 10:18:23 -0500
Message-Id: <20240402151828.175002-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SZLWGBM2LVOOM4HUV6SP2JOKT26DD2ZW
X-Message-ID-Hash: SZLWGBM2LVOOM4HUV6SP2JOKT26DD2ZW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SZLWGBM2LVOOM4HUV6SP2JOKT26DD2ZW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

When an xrun happens, the BE DAI hw_params doesn't get invoked before
the stream restarts with a prepare. In this case, clearing the node ID
when the DAI widget is freed and unprepared will result in an error when
it is re-initialized. In order to avoid this, move the code to clear the
node ID to the BE DAI hw_free op to keep it balanced with the BE DAI
hw_params.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c     | 24 ++++++++++++++++++++++++
 sound/soc/sof/ipc4-topology.c |  4 ----
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ae1a38f20bdb..2c64c25d6f3b 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -31,6 +31,7 @@
 #include "../sof-audio.h"
 #include "../sof-pci-dev.h"
 #include "../ops.h"
+#include "../ipc4-topology.h"
 #include "hda.h"
 #include "telemetry.h"
 
@@ -150,8 +151,31 @@ static int sdw_params_stream(struct device *dev,
 	return hda_dai_config(w, SOF_DAI_CONFIG_FLAGS_HW_PARAMS, &data);
 }
 
+static int sdw_params_free(struct device *dev, struct sdw_intel_stream_free_data *free_data)
+{
+	struct snd_soc_dai *d = free_data->dai;
+	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget(d, free_data->substream->stream);
+	struct snd_sof_dev *sdev = widget_to_sdev(w);
+
+	if (sdev->pdata->ipc_type == SOF_IPC_TYPE_4) {
+		struct snd_sof_widget *swidget = w->dobj.private;
+		struct snd_sof_dai *dai = swidget->private;
+		struct sof_ipc4_copier_data *copier_data;
+		struct sof_ipc4_copier *ipc4_copier;
+
+		ipc4_copier = dai->private;
+		copier_data = &ipc4_copier->data;
+
+		/* clear the node ID */
+		copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
+	}
+
+	return 0;
+}
+
 struct sdw_intel_ops sdw_callback = {
 	.params_stream = sdw_params_stream,
+	.free_stream = sdw_params_free,
 };
 
 static int sdw_ace2x_params_stream(struct device *dev,
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 6b9b16f3157e..e0e4f356275f 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -1296,7 +1296,6 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 		}
 
 		if (ipc4_copier->dai_type == SOF_DAI_INTEL_ALH) {
-			struct sof_ipc4_copier_data *copier_data = &ipc4_copier->data;
 			struct sof_ipc4_alh_configuration_blob *blob;
 			unsigned int group_id;
 
@@ -1306,9 +1305,6 @@ static void sof_ipc4_unprepare_copier_module(struct snd_sof_widget *swidget)
 					   ALH_MULTI_GTW_BASE;
 				ida_free(&alh_group_ida, group_id);
 			}
-
-			/* clear the node ID */
-			copier_data->gtw_cfg.node_id &= ~SOF_IPC4_NODE_INDEX_MASK;
 		}
 	}
 
-- 
2.40.1

