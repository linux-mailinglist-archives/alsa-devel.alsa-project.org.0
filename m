Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DE2423C2F
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2633483B;
	Wed,  6 Oct 2021 13:11:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2633483B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518721;
	bh=mOwNo4Usa7VI4bysTGToE6DZw5j0lZpbrNu+xRZy0ig=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dyYlPPAqPfml77g70csRehU6TkieV/nvVmBlLLGRLz6FjtiOF25Nxx3G9ZnyCE9Xa
	 M7RUCCG3H6jWSymUxTy07NJCcN/TH/v4CdyZVTIXX8pOWvHPcFnfIZ5TsAHu7oCvtG
	 WqocRYqAh5CkISK7RofFgxxO+x7N6ktLZ9B4WF7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC2FF80538;
	Wed,  6 Oct 2021 13:07:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FB9BF80539; Wed,  6 Oct 2021 13:07:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 37016F80524
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:07:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37016F80524
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366480"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366480"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:15 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081166"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:07:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 14/19] ASoC: SOF: Introduce macro to set the firmware state
Date: Wed,  6 Oct 2021 14:06:40 +0300
Message-Id: <20211006110645.26679-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
References: <20211006110645.26679-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Add sof_set_fw_state() macro to wrap the sdev->fw_state management to allow
actions to be taken when certain state is set or when state is changing.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c     |  8 ++++----
 sound/soc/sof/ipc.c      |  4 ++--
 sound/soc/sof/loader.c   |  2 +-
 sound/soc/sof/pm.c       |  6 +++---
 sound/soc/sof/sof-priv.h | 13 +++++++++++++
 5 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2ea29186e397..22a1c5090ae0 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -147,7 +147,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	sdev->fw_state = SOF_FW_BOOT_PREPARE;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
 	/* check machine info */
 	ret = sof_machine_check(sdev);
@@ -189,7 +189,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 		goto fw_load_err;
 	}
 
-	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_IN_PROGRESS);
 
 	/*
 	 * Boot the firmware. The FW boot status will be modified
@@ -265,7 +265,7 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	snd_sof_remove(sdev);
 
 	/* all resources freed, update state to match */
-	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 	sdev->first_boot = true;
 
 	return ret;
@@ -300,7 +300,7 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 
 	sdev->pdata = plat_data;
 	sdev->first_boot = true;
-	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_PROBES)
 	sdev->extractor_stream_tag = SOF_PROBE_INVALID_NODE_ID;
 #endif
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5c698fa662f4..5a308c62f7ca 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -458,9 +458,9 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 		if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS) {
 			err = sof_ops(sdev)->fw_ready(sdev, cmd);
 			if (err < 0)
-				sdev->fw_state = SOF_FW_BOOT_READY_FAILED;
+				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_FAILED);
 			else
-				sdev->fw_state = SOF_FW_BOOT_COMPLETE;
+				sof_set_fw_state(sdev, SOF_FW_BOOT_COMPLETE);
 
 			/* wake up firmware loader */
 			wake_up(&sdev->boot_wait);
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index a0ae174f9bb0..de7082f3226c 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -838,7 +838,7 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "error: firmware boot failure\n");
 		snd_sof_dsp_dbg_dump(sdev, SOF_DBG_DUMP_REGS | SOF_DBG_DUMP_MBOX |
 				     SOF_DBG_DUMP_TEXT | SOF_DBG_DUMP_PCI);
-		sdev->fw_state = SOF_FW_BOOT_FAILED;
+		sof_set_fw_state(sdev, SOF_FW_BOOT_FAILED);
 		return -EIO;
 	}
 
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 77a3496d3dbd..bf759bfa305e 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -122,7 +122,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 	    old_state == SOF_DSP_PM_D0)
 		return 0;
 
-	sdev->fw_state = SOF_FW_BOOT_PREPARE;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_PREPARE);
 
 	/* load the firmware */
 	ret = snd_sof_load_firmware(sdev);
@@ -133,7 +133,7 @@ static int sof_resume(struct device *dev, bool runtime_resume)
 		return ret;
 	}
 
-	sdev->fw_state = SOF_FW_BOOT_IN_PROGRESS;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_IN_PROGRESS);
 
 	/*
 	 * Boot the firmware. The FW boot status will be modified
@@ -257,7 +257,7 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 		return ret;
 
 	/* reset FW state */
-	sdev->fw_state = SOF_FW_BOOT_NOT_STARTED;
+	sof_set_fw_state(sdev, SOF_FW_BOOT_NOT_STARTED);
 	sdev->enabled_cores_mask = 0;
 
 	return ret;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 5c1939339936..d9525f3ff5cd 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -561,6 +561,19 @@ static inline void sof_oops(struct snd_sof_dev *sdev, void *oops)
 
 extern const struct dsp_arch_ops sof_xtensa_arch_ops;
 
+/*
+ * Firmware state tracking
+ */
+static inline void sof_set_fw_state(struct snd_sof_dev *sdev,
+				    enum snd_sof_fw_state new_state)
+{
+	if (sdev->fw_state == new_state)
+		return;
+
+	dev_dbg(sdev->dev, "fw_state change: %d -> %d\n", sdev->fw_state, new_state);
+	sdev->fw_state = new_state;
+}
+
 /*
  * Utilities
  */
-- 
2.33.0

