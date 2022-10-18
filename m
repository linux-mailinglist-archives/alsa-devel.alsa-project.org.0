Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B88602B65
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:12:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C8C49CD6;
	Tue, 18 Oct 2022 14:12:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C8C49CD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095171;
	bh=cIfPwd6KcUAgITrYV7LBA6hnFXIOA6UGS6RaevgUzu4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=odPQ5BDNa84zUdK7mdUiFSEP2U8z0Th9UOLi+X3vve4/aIj189DGAaBIoZ+migTOm
	 3cRDVf7P+SVQchMytcyMJfNQY/5auTmeDn8frTIfyxgB6ft4JpaqVG5gVf+wV4h9pd
	 LsgWNZ6ArDhfPVFCAnPGlVp2HhJwa0ZjQ+mLmsQQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 85CDAF805AF;
	Tue, 18 Oct 2022 14:09:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 01ACAF80571; Tue, 18 Oct 2022 14:09:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F1E4AF80571
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F1E4AF80571
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lmIXV/Q/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094968; x=1697630968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cIfPwd6KcUAgITrYV7LBA6hnFXIOA6UGS6RaevgUzu4=;
 b=lmIXV/Q/9XJ2RxZBNp4Rj7egPrVSCR+ZHK9f7wp6JGWMv68L5lNHePAw
 9B8eFjqa69/6Xy0mCQ+MBWeuld218rbBx6MT/qY6Nnw6GBlDO09W3po1z
 40/YO/BiqOZJGCf909M4vjWmc63ejqHkO0ACvr9KV+1m4xhgZjiG2xPAi
 MgPPMrxJsge0WgoyASqzv78wcqu4oEYPyyfW2v5cRGtlyfgTkwHWd02Dq
 XIhsFMgPu4fgcSkcR4Nb/x0FBVDS/jj4ORrA3GyuiPFTdF2wsYPpZ7vnv
 yPxmKi6hEX36k5ALK4pB+kiZ/W/KO4xg2WbAobKjqxmxAQbZuzKvUZx02 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452960"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452960"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:22 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757936"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757936"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/19] ASoC: SOF: IPC4: Add helper for looking up module by
 UUID
Date: Tue, 18 Oct 2022 15:09:07 +0300
Message-Id: <20221018120916.19820-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Add a simple helper to walk the loaded libraries and their modules to make
the ipc4-topology not aware of the underlying infrastructure and simplify
the code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c   | 21 +++++++++++++++++++++
 sound/soc/sof/ipc4-priv.h     |  3 +++
 sound/soc/sof/ipc4-topology.c | 17 +++--------------
 3 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 5506ec997328..b7e8b3f3d4f0 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -160,6 +160,27 @@ static size_t sof_ipc4_fw_parse_basefw_ext_man(struct snd_sof_dev *sdev)
 	return payload_offset;
 }
 
+struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
+							const guid_t *uuid)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	struct sof_ipc4_fw_library *fw_lib;
+	unsigned long lib_id;
+	int i;
+
+	if (guid_is_null(uuid))
+		return NULL;
+
+	xa_for_each(&ipc4_data->fw_lib_xa, lib_id, fw_lib) {
+		for (i = 0; i < fw_lib->num_modules; i++) {
+			if (guid_equal(uuid, &fw_lib->modules[i].man4_module_entry.uuid))
+				return &fw_lib->modules[i];
+		}
+	}
+
+	return NULL;
+}
+
 static int sof_ipc4_validate_firmware(struct snd_sof_dev *sdev)
 {
 	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index bce168083f09..ecfa9f701ef1 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -84,4 +84,7 @@ extern const struct sof_ipc_fw_tracing_ops ipc4_mtrace_ops;
 
 int sof_ipc4_set_pipeline_state(struct snd_sof_dev *sdev, u32 id, u32 state);
 int sof_ipc4_mtrace_update_pos(struct snd_sof_dev *sdev, int core);
+
+struct sof_ipc4_fw_module *sof_ipc4_find_module_by_uuid(struct snd_sof_dev *sdev,
+							const guid_t *uuid);
 #endif
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 98f7f5421ba5..ab85dde4303b 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -289,22 +289,11 @@ static int sof_ipc4_widget_set_module_info(struct snd_sof_widget *swidget)
 {
 	struct snd_soc_component *scomp = swidget->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
-	struct sof_ipc4_fw_library *fw_lib;
-	unsigned long lib_id;
-	int i;
 
-	xa_for_each(&ipc4_data->fw_lib_xa, lib_id, fw_lib) {
-		/* set module info */
-		for (i = 0; i < fw_lib->num_modules; i++) {
-			struct sof_ipc4_fw_module *module = &fw_lib->modules[i];
+	swidget->module_info = sof_ipc4_find_module_by_uuid(sdev, &swidget->uuid);
 
-			if (guid_equal(&swidget->uuid, &module->man4_module_entry.uuid)) {
-				swidget->module_info = module;
-				return 0;
-			}
-		}
-	}
+	if (swidget->module_info)
+		return 0;
 
 	dev_err(sdev->dev, "failed to find module info for widget %s with UUID %pUL\n",
 		swidget->widget->name, &swidget->uuid);
-- 
2.38.0

