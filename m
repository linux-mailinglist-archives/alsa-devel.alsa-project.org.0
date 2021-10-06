Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BED14423C07
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:09:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CC67836;
	Wed,  6 Oct 2021 13:08:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CC67836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518561;
	bh=aGy+2boTRu88hZfJ0mnPPlbyfx0jYAIM3mcgGAW3Vy0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tc26IU/ECaIzGxQMuJrb0fMvrc0wX4lOxWZkqhOkjfJk+2fYS91COykYHU6kOUW9T
	 ylZ0xK4Lw5Xop4wPA4blX2Vo3PXAEF73e6NRIQCFd8IbEQocoAfqjYWtgBqFr58fbr
	 nYFgbkx8wX5PYL6+b28omdftOgflm4Wsk3IHaeHU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D853F804FA;
	Wed,  6 Oct 2021 13:07:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18BEAF804F1; Wed,  6 Oct 2021 13:07:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AC52F8020D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AC52F8020D
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366439"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366439"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:51 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081006"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:48 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 04/19] ASoC: SOF: Print the dbg_dump and ipc_dump once to
 reduce kernel log noise
Date: Wed,  6 Oct 2021 14:06:30 +0300
Message-Id: <20211006110645.26679-5-peter.ujfalusi@linux.intel.com>
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

Do not print the dump more than once to keep the kernel log cleaner in case
of a firmware failure.

When the DSP is rebooted due to suspend or runtime_suspend reset the flags
to re-enable the dump prints.

Add also a debug flag to print all dumps to get more coverage if needed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c    | 4 +++-
 sound/soc/sof/loader.c   | 4 ++++
 sound/soc/sof/ops.h      | 8 ++++++--
 sound/soc/sof/sof-priv.h | 3 +++
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 3b85e0484411..221808a8e759 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -827,7 +827,9 @@ void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
 	    (sof_core_debug & SOF_DBG_RETAIN_CTX)) {
 		/* should we prevent DSP entering D3 ? */
-		dev_info(sdev->dev, "info: preventing DSP entering D3 state to preserve context\n");
+		if (!sdev->ipc_dump_printed)
+			dev_info(sdev->dev,
+				 "preventing DSP entering D3 state to preserve context\n");
 		pm_runtime_get_noresume(sdev->dev);
 	}
 
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 62e6f257c3f0..6a3bc1927627 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -791,6 +791,10 @@ int snd_sof_run_firmware(struct snd_sof_dev *sdev)
 
 	init_waitqueue_head(&sdev->boot_wait);
 
+	/* (re-)enable dsp dump */
+	sdev->dbg_dump_printed = false;
+	sdev->ipc_dump_printed = false;
+
 	/* create read-only fw_version debugfs to store boot version info */
 	if (sdev->first_boot) {
 		ret = snd_sof_debugfs_buf_item(sdev, &sdev->fw_version,
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index d143a35f16fc..c7670514aa68 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -243,19 +243,23 @@ snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 /* debug */
 static inline void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 {
-	if (sof_ops(sdev)->dbg_dump) {
+	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
 		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
 		sof_ops(sdev)->dbg_dump(sdev, flags);
 		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
+		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+			sdev->dbg_dump_printed = true;
 	}
 }
 
 static inline void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 {
-	if (sof_ops(sdev)->ipc_dump) {
+	if (sof_ops(sdev)->ipc_dump  && !sdev->ipc_dump_printed) {
 		dev_err(sdev->dev, "------------[ IPC dump start ]------------\n");
 		sof_ops(sdev)->ipc_dump(sdev);
 		dev_err(sdev->dev, "------------[ IPC dump end ]------------\n");
+		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+			sdev->ipc_dump_printed = true;
 	}
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 0ca64f0f8873..bb6de1c1e3ec 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -33,6 +33,7 @@
 #define SOF_DBG_DISABLE_MULTICORE		BIT(5) /* schedule all pipelines/widgets
 							* on primary core
 							*/
+#define SOF_DBG_PRINT_ALL_DUMPS		BIT(6) /* Print all ipc and dsp dumps */
 
 #define SOF_DBG_DUMP_REGS		BIT(0)
 #define SOF_DBG_DUMP_MBOX		BIT(1)
@@ -421,6 +422,8 @@ struct snd_sof_dev {
 	/* debug */
 	struct dentry *debugfs_root;
 	struct list_head dfsentry_list;
+	bool dbg_dump_printed;
+	bool ipc_dump_printed;
 
 	/* firmware loader */
 	struct snd_dma_buffer dmab;
-- 
2.33.0

