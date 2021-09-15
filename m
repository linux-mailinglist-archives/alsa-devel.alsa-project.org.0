Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A991540C52C
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 528D01833;
	Wed, 15 Sep 2021 14:24:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 528D01833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708739;
	bh=XGApWWKtvbQAY+oiYxwLUmDLcjL8l6nZu3upaQGIh3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FUA2wKZpi0V0ru+WpDt63++Q8cUbSSEJNx39d6RhJD5VIoKf0tSDXBE4qooo81y03
	 aZhc9OKRLDieAlIJ4OQmSjgkfrUTZIL3rGhpsBauOny3ekorBJw5sqoeKZLQP6rmQ+
	 jVWdWcoI/kxpgiXtq9xWRGmsvdO/LgHoyCEyoMjk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7AA10F8050F;
	Wed, 15 Sep 2021 14:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4D0AF80507; Wed, 15 Sep 2021 14:21:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3743AF80132
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3743AF80132
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117519"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117519"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:39 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901618"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:37 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 08/12] ASoC: SOF: debug: Add generic API and ops for DSP
 regions
Date: Wed, 15 Sep 2021 15:21:12 +0300
Message-Id: <20210915122116.18317-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Add new debugfs_add_region_item along with a generic wrapper
snd_sof_debugfs_add_region_item() to abstract away the DSP regions related
debugfs support.

At the same commit add iomem based generic implementation for the new ops

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/debug.c    | 15 +++++++++++++++
 sound/soc/sof/ops.h      | 11 +++++++++++
 sound/soc/sof/sof-priv.h | 27 +++++++++++++++++----------
 3 files changed, 43 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index a51a928ea40a..c536ea71630f 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -588,6 +588,21 @@ int snd_sof_debugfs_io_item(struct snd_sof_dev *sdev,
 }
 EXPORT_SYMBOL_GPL(snd_sof_debugfs_io_item);
 
+int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
+					  enum snd_sof_fw_blk_type blk_type, u32 offset,
+					  size_t size, const char *name,
+					  enum sof_debugfs_access_type access_type)
+{
+	int bar = snd_sof_dsp_get_bar_index(sdev, blk_type);
+
+	if (bar < 0)
+		return bar;
+
+	return snd_sof_debugfs_io_item(sdev, sdev->bar[bar] + offset, size, name,
+				       access_type);
+}
+EXPORT_SYMBOL_GPL(snd_sof_debugfs_add_region_item_iomem);
+
 /* create FS entry for debug files to expose kernel memory */
 int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 			     void *base, size_t size,
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 8d7fb7fd72bb..2271bd0b25e3 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -253,6 +253,17 @@ static inline void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
 		sof_ops(sdev)->ipc_dump(sdev);
 }
 
+static inline int snd_sof_debugfs_add_region_item(struct snd_sof_dev *sdev,
+		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
+		const char *name, enum sof_debugfs_access_type access_type)
+{
+	if (sof_ops(sdev) && sof_ops(sdev)->debugfs_add_region_item)
+		return sof_ops(sdev)->debugfs_add_region_item(sdev, blk_type, offset,
+							      size, name, access_type);
+
+	return 0;
+}
+
 /* register IO */
 static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
 				     u32 offset, u32 value)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f9a39141e752..4f1dcfe4a7ec 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -83,6 +83,16 @@ enum sof_system_suspend_state {
 	SOF_SUSPEND_S3,
 };
 
+enum sof_dfsentry_type {
+	SOF_DFSENTRY_TYPE_IOMEM = 0,
+	SOF_DFSENTRY_TYPE_BUF,
+};
+
+enum sof_debugfs_access_type {
+	SOF_DEBUGFS_ACCESS_ALWAYS = 0,
+	SOF_DEBUGFS_ACCESS_D0_ONLY,
+};
+
 struct snd_sof_dev;
 struct snd_sof_ipc_msg;
 struct snd_sof_ipc;
@@ -237,6 +247,10 @@ struct snd_sof_dsp_ops {
 	void (*dbg_dump)(struct snd_sof_dev *sof_dev,
 			 u32 flags); /* optional */
 	void (*ipc_dump)(struct snd_sof_dev *sof_dev); /* optional */
+	int (*debugfs_add_region_item)(struct snd_sof_dev *sdev,
+				       enum snd_sof_fw_blk_type blk_type, u32 offset,
+				       size_t size, const char *name,
+				       enum sof_debugfs_access_type access_type); /* optional */
 
 	/* host DMA trace initialization */
 	int (*trace_init)(struct snd_sof_dev *sdev,
@@ -286,16 +300,6 @@ struct sof_ops_table {
 	const struct snd_sof_dsp_ops *ops;
 };
 
-enum sof_dfsentry_type {
-	SOF_DFSENTRY_TYPE_IOMEM = 0,
-	SOF_DFSENTRY_TYPE_BUF,
-};
-
-enum sof_debugfs_access_type {
-	SOF_DEBUGFS_ACCESS_ALWAYS = 0,
-	SOF_DEBUGFS_ACCESS_D0_ONLY,
-};
-
 /* FS entry for debug files that can expose DSP memories, registers */
 struct snd_sof_dfsentry {
 	size_t size;
@@ -535,6 +539,9 @@ void snd_sof_get_status(struct snd_sof_dev *sdev, u32 panic_code,
 int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev);
 void snd_sof_handle_fw_exception(struct snd_sof_dev *sdev);
 int snd_sof_dbg_memory_info_init(struct snd_sof_dev *sdev);
+int snd_sof_debugfs_add_region_item_iomem(struct snd_sof_dev *sdev,
+		enum snd_sof_fw_blk_type blk_type, u32 offset, size_t size,
+		const char *name, enum sof_debugfs_access_type access_type);
 
 /*
  * Platform specific ops.
-- 
2.33.0

