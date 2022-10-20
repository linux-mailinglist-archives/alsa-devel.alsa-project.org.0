Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99624605FED
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Oct 2022 14:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3BE77716C;
	Thu, 20 Oct 2022 14:15:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3BE77716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666268176;
	bh=harZd7Lz+mWF1/Yn+jBNxNUw+FZSRnSwIU7PbYqHggE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R2PFGzRWWNUC08A81WCXdMN3UW/lSnB8oymxGNt06QaPMRgWuQdnW/TUuYdbMy93y
	 lmkjoFZ5JfeEHSpxMO5KMTQIfKB6XdjY388mpaigoPBDyLCZg+akhomfci0INbIYpJ
	 q+c+S2opbQzq/XEJQTYFB1M1nra0utbk+LsDXbxM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D348CF805AF;
	Thu, 20 Oct 2022 14:12:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 098A9F805A0; Thu, 20 Oct 2022 14:12:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDA8DF80589
 for <alsa-devel@alsa-project.org>; Thu, 20 Oct 2022 14:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDA8DF80589
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="QEIaKLuz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666267968; x=1697803968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=harZd7Lz+mWF1/Yn+jBNxNUw+FZSRnSwIU7PbYqHggE=;
 b=QEIaKLuzy7NXGLPj2Hel4stBHYpatuznLcfb5tUOQPq/Zm+sKqZU0mA6
 +fBk8BSzPXTwIYqgVR+7HfLT938pm39VgXt2D08PVKlV/pd/rj8uT6VZy
 OYdbyQTWhFtig1ITFNfvTiTesffV9vOiBnOcYgdeCh3kcBj8E29Ca5RTv
 HjyMiHLrDSJDKbHprjuGhpE3yVDbRJYd5+dCB+/a5ChXpSv66vmDabjKS
 Kwk0MizZECJbxZ2Ebs7R8FjhcQeFT1GDPnZ8IUDQjzbMngKHm7m39wRIs
 YvIM2+tpOZQotZb0fihWaTq54ZhH1tYTUCP2+8TJNBOYzJySBaqV6duN6 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333256370"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="333256370"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="663010033"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; d="scan'208";a="663010033"
Received: from awrynn-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.12.86])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2022 05:12:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 10/19] ASoC: SOF: IPC4: Add helper for looking up module by
 UUID
Date: Thu, 20 Oct 2022 15:12:29 +0300
Message-Id: <20221020121238.18339-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
References: <20221020121238.18339-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, amadeuszx.slawinski@linux.intel.com,
 chao.song@intel.com
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
2.38.1

