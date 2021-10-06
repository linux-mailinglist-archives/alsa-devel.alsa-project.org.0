Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E49B423C16
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 13:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E29B11677;
	Wed,  6 Oct 2021 13:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E29B11677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633518603;
	bh=LokYPlp0FQgJL/DcnaZGeBBWTM/aHfu2mlvf5rI4J5o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSyxivY6xuzuqiWauxHY1mhmozcn8ypn0CtKnGwTmI1JMpuTNmte016y5V7QXFEV6
	 /O5X3bAGr+0ElCd9GZ+1m4YUafaGUssH0oN8PR+7ONcB+PUWHhHT9e5Q+AH+F2+gQz
	 Ae6EWRm6YeXyq2/zWMreGXK1dYYJXhbN5UdrrPIw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C738F80511;
	Wed,  6 Oct 2021 13:07:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B39A5F804F3; Wed,  6 Oct 2021 13:07:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5252F804EC
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 13:06:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5252F804EC
X-IronPort-AV: E=McAfee;i="6200,9189,10128"; a="223366451"
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="223366451"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:58 -0700
X-IronPort-AV: E=Sophos;i="5.85,350,1624345200"; d="scan'208";a="439081033"
Received: from byurovit-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.39.239])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 04:06:56 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 07/19] ASoC: SOF: debug/ops: Move the IPC and DSP dump
 functions out from the header
Date: Wed,  6 Oct 2021 14:06:33 +0300
Message-Id: <20211006110645.26679-8-peter.ujfalusi@linux.intel.com>
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

To be usable in platform code, move the IPC and DSP dump function to
debug.c and export it in a similar way as the snd_sof_handle_fw_exception()

Make the snd_sof_ipc_dump() static as it is only used in debug.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 23 +++++++++++++++++++++++
 sound/soc/sof/ops.h   | 22 +---------------------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 221808a8e759..9ed6728c2017 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -822,6 +822,29 @@ void snd_sof_free_debug(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_GPL(snd_sof_free_debug);
 
+void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
+		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
+		sof_ops(sdev)->dbg_dump(sdev, flags);
+		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
+		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+			sdev->dbg_dump_printed = true;
+	}
+}
+EXPORT_SYMBOL(snd_sof_dsp_dbg_dump);
+
+static void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->ipc_dump  && !sdev->ipc_dump_printed) {
+		dev_err(sdev->dev, "------------[ IPC dump start ]------------\n");
+		sof_ops(sdev)->ipc_dump(sdev);
+		dev_err(sdev->dev, "------------[ IPC dump end ]------------\n");
+		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
+			sdev->ipc_dump_printed = true;
+	}
+}
+
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev)
 {
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_RETAIN_DSP_CONTEXT) ||
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index c7670514aa68..290e32a8a7d4 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -241,27 +241,7 @@ snd_sof_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* debug */
-static inline void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
-{
-	if (sof_ops(sdev)->dbg_dump && !sdev->dbg_dump_printed) {
-		dev_err(sdev->dev, "------------[ DSP dump start ]------------\n");
-		sof_ops(sdev)->dbg_dump(sdev, flags);
-		dev_err(sdev->dev, "------------[ DSP dump end ]------------\n");
-		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
-			sdev->dbg_dump_printed = true;
-	}
-}
-
-static inline void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
-{
-	if (sof_ops(sdev)->ipc_dump  && !sdev->ipc_dump_printed) {
-		dev_err(sdev->dev, "------------[ IPC dump start ]------------\n");
-		sof_ops(sdev)->ipc_dump(sdev);
-		dev_err(sdev->dev, "------------[ IPC dump end ]------------\n");
-		if (!(sof_core_debug & SOF_DBG_PRINT_ALL_DUMPS))
-			sdev->ipc_dump_printed = true;
-	}
-}
+void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags);
 
 static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
 		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
-- 
2.33.0

