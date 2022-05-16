Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2FC528297
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:50:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 828011692;
	Mon, 16 May 2022 12:50:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 828011692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698255;
	bh=pxU/GCQ/1AXArwiD8r7gIVHtyJp8ogicckG6HqApsyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBZGCxdcwKkvxZ/Hfo48HJapjtxKeElDhWp2FI/RDxM70Ma/fs+8sL6DJj2T3BOhb
	 /yrv/wrcefRjZ7a5TJgrE6JTAslmQQKFOdoWxHWSvSz420XiS0lacSIzbPVMn5T2dg
	 StALtRf7cnOX/yVFJg0d3UWyh61+E1QufHWK/m14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50149F8053D;
	Mon, 16 May 2022 12:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE59AF80520; Mon, 16 May 2022 12:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 92EA9F8012F
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92EA9F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ioBwNSDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698050; x=1684234050;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxU/GCQ/1AXArwiD8r7gIVHtyJp8ogicckG6HqApsyQ=;
 b=ioBwNSDjg44QJb6ovU0zuYGfr0O49Q2tgYYJCZIih0XaScNKSDFBAUWY
 Ijfby5WVFKXflcCEeiIqarBRFgl1bye9/vlQ1xDOBoXDp9rlTKKOZcVP5
 iEGc8IxY6L5VHmlWfPfsJZnTVSgI0xIPGV59NLETjWiNAr+s1xfdMRdoP
 9T807xW18v2f7QPBj4RzqHMuOGyzdpY38C3fJ7vPM2WtL1btpjv0IcBLc
 cAD+IcWixh/LGP73wCGj00qjQC1yLDYB+tmP9LhVR7KoaCdweRFmorxx5
 gqMULre3h+8nexZNQo6YTad8MPN+G27s7GmEMBkYt47G1NiSwH+shbV+m A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853270"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853270"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:09 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459890"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:47:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 8/8] ASoC: SOF: ipc3-dtrace: Move dtrace related variables
 local from sof_dev
Date: Mon, 16 May 2022 13:47:11 +0300
Message-Id: <20220516104711.26115-9-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
References: <20220516104711.26115-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

The variables and structs for DMA trace can be moved local to ipc3-dtrace.c
and the storage can be allocated dynamically, stored behind the
fw_trace_data pointer.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 142 +++++++++++++++++++++++-------------
 sound/soc/sof/sof-priv.h    |  16 ----
 2 files changed, 93 insertions(+), 65 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 91a2792b9beb..b4e1343f9138 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -15,6 +15,23 @@
 #define TRACE_FILTER_ELEMENTS_PER_ENTRY 4
 #define TRACE_FILTER_MAX_CONFIG_STRING_LENGTH 1024
 
+enum sof_dtrace_state {
+	SOF_DTRACE_DISABLED,
+	SOF_DTRACE_STOPPED,
+	SOF_DTRACE_ENABLED,
+};
+
+struct sof_dtrace_priv {
+	struct snd_dma_buffer dmatb;
+	struct snd_dma_buffer dmatp;
+	int dma_trace_pages;
+	wait_queue_head_t trace_sleep;
+	u32 host_offset;
+	bool dtrace_error;
+	bool dtrace_draining;
+	enum sof_dtrace_state dtrace_state;
+};
+
 static int trace_filter_append_elem(struct snd_sof_dev *sdev, u32 key, u32 value,
 				    struct sof_ipc_trace_filter_elem *elem_list,
 				    int capacity, int *counter)
@@ -228,7 +245,8 @@ static int debugfs_create_trace_filter(struct snd_sof_dev *sdev)
 static size_t sof_dtrace_avail(struct snd_sof_dev *sdev,
 			       loff_t pos, size_t buffer_size)
 {
-	loff_t host_offset = READ_ONCE(sdev->host_offset);
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
+	loff_t host_offset = READ_ONCE(priv->host_offset);
 
 	/*
 	 * If host offset is less than local pos, it means write pointer of
@@ -248,32 +266,33 @@ static size_t sof_dtrace_avail(struct snd_sof_dev *sdev,
 static size_t sof_wait_dtrace_avail(struct snd_sof_dev *sdev, loff_t pos,
 				    size_t buffer_size)
 {
-	wait_queue_entry_t wait;
 	size_t ret = sof_dtrace_avail(sdev, pos, buffer_size);
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
+	wait_queue_entry_t wait;
 
 	/* data immediately available */
 	if (ret)
 		return ret;
 
-	if (sdev->dtrace_state != SOF_DTRACE_ENABLED && sdev->dtrace_draining) {
+	if (priv->dtrace_state != SOF_DTRACE_ENABLED && priv->dtrace_draining) {
 		/*
 		 * tracing has ended and all traces have been
 		 * read by client, return EOF
 		 */
-		sdev->dtrace_draining = false;
+		priv->dtrace_draining = false;
 		return 0;
 	}
 
 	/* wait for available trace data from FW */
 	init_waitqueue_entry(&wait, current);
 	set_current_state(TASK_INTERRUPTIBLE);
-	add_wait_queue(&sdev->trace_sleep, &wait);
+	add_wait_queue(&priv->trace_sleep, &wait);
 
 	if (!signal_pending(current)) {
 		/* set timeout to max value, no error code */
 		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
 	}
-	remove_wait_queue(&sdev->trace_sleep, &wait);
+	remove_wait_queue(&priv->trace_sleep, &wait);
 
 	return sof_dtrace_avail(sdev, pos, buffer_size);
 }
@@ -283,13 +302,14 @@ static ssize_t dfsentry_dtrace_read(struct file *file, char __user *buffer,
 {
 	struct snd_sof_dfsentry *dfse = file->private_data;
 	struct snd_sof_dev *sdev = dfse->sdev;
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
 	unsigned long rem;
 	loff_t lpos = *ppos;
 	size_t avail, buffer_size = dfse->size;
 	u64 lpos_64;
 
 	/* make sure we know about any failures on the DSP side */
-	sdev->dtrace_error = false;
+	priv->dtrace_error = false;
 
 	/* check pos and count */
 	if (lpos < 0)
@@ -303,7 +323,7 @@ static ssize_t dfsentry_dtrace_read(struct file *file, char __user *buffer,
 
 	/* get available count based on current host offset */
 	avail = sof_wait_dtrace_avail(sdev, lpos, buffer_size);
-	if (sdev->dtrace_error) {
+	if (priv->dtrace_error) {
 		dev_err(sdev->dev, "trace IO error\n");
 		return -EIO;
 	}
@@ -318,7 +338,7 @@ static ssize_t dfsentry_dtrace_read(struct file *file, char __user *buffer,
 	 * Note: snd_dma_buffer_sync() is called for normal audio playback and
 	 *	 capture streams also.
 	 */
-	snd_dma_buffer_sync(&sdev->dmatb, SNDRV_DMA_SYNC_CPU);
+	snd_dma_buffer_sync(&priv->dmatb, SNDRV_DMA_SYNC_CPU);
 	/* copy available trace data to debugfs */
 	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
 	if (rem)
@@ -334,10 +354,11 @@ static int dfsentry_dtrace_release(struct inode *inode, struct file *file)
 {
 	struct snd_sof_dfsentry *dfse = inode->i_private;
 	struct snd_sof_dev *sdev = dfse->sdev;
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
 
 	/* avoid duplicate traces at next open */
-	if (sdev->dtrace_state != SOF_DTRACE_ENABLED)
-		sdev->host_offset = 0;
+	if (priv->dtrace_state != SOF_DTRACE_ENABLED)
+		priv->host_offset = 0;
 
 	return 0;
 }
@@ -351,12 +372,15 @@ static const struct file_operations sof_dfs_dtrace_fops = {
 
 static int debugfs_create_dtrace(struct snd_sof_dev *sdev)
 {
+	struct sof_dtrace_priv *priv;
 	struct snd_sof_dfsentry *dfse;
 	int ret;
 
 	if (!sdev)
 		return -EINVAL;
 
+	priv = sdev->fw_trace_data;
+
 	ret = debugfs_create_trace_filter(sdev);
 	if (ret < 0)
 		dev_warn(sdev->dev, "failed to create filter debugfs file: %d", ret);
@@ -366,8 +390,8 @@ static int debugfs_create_dtrace(struct snd_sof_dev *sdev)
 		return -ENOMEM;
 
 	dfse->type = SOF_DFSENTRY_TYPE_BUF;
-	dfse->buf = sdev->dmatb.area;
-	dfse->size = sdev->dmatb.bytes;
+	dfse->buf = priv->dmatb.area;
+	dfse->size = priv->dmatb.bytes;
 	dfse->sdev = sdev;
 
 	debugfs_create_file("trace", 0444, sdev->debugfs_root, dfse,
@@ -378,6 +402,7 @@ static int debugfs_create_dtrace(struct snd_sof_dev *sdev)
 
 static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 {
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_dma_trace_params_ext params;
@@ -387,10 +412,10 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	if (!sdev->fw_trace_is_supported)
 		return 0;
 
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED || !sdev->dma_trace_pages)
+	if (priv->dtrace_state == SOF_DTRACE_ENABLED || !priv->dma_trace_pages)
 		return -EINVAL;
 
-	if (sdev->dtrace_state == SOF_DTRACE_STOPPED)
+	if (priv->dtrace_state == SOF_DTRACE_STOPPED)
 		goto start;
 
 	/* set IPC parameters */
@@ -404,15 +429,15 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 		params.hdr.size = sizeof(struct sof_ipc_dma_trace_params);
 		params.hdr.cmd |= SOF_IPC_TRACE_DMA_PARAMS;
 	}
-	params.buffer.phy_addr = sdev->dmatp.addr;
-	params.buffer.size = sdev->dmatb.bytes;
-	params.buffer.pages = sdev->dma_trace_pages;
+	params.buffer.phy_addr = priv->dmatp.addr;
+	params.buffer.size = priv->dmatb.bytes;
+	params.buffer.pages = priv->dma_trace_pages;
 	params.stream_tag = 0;
 
-	sdev->host_offset = 0;
-	sdev->dtrace_draining = false;
+	priv->host_offset = 0;
+	priv->dtrace_draining = false;
 
-	ret = sof_dtrace_host_init(sdev, &sdev->dmatb, &params);
+	ret = sof_dtrace_host_init(sdev, &priv->dmatb, &params);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Host dtrace init failed: %d\n", ret);
 		return ret;
@@ -433,7 +458,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 		goto trace_release;
 	}
 
-	sdev->dtrace_state = SOF_DTRACE_ENABLED;
+	priv->dtrace_state = SOF_DTRACE_ENABLED;
 
 	return 0;
 
@@ -444,18 +469,30 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 
 static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 {
+	struct sof_dtrace_priv *priv;
 	int ret;
 
 	/* dtrace is only supported with SOF_IPC */
 	if (sdev->pdata->ipc_type != SOF_IPC)
 		return -EOPNOTSUPP;
 
+	if (sdev->fw_trace_data) {
+		dev_err(sdev->dev, "fw_trace_data has been already allocated\n");
+		return -EBUSY;
+	}
+
+	priv = devm_kzalloc(sdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->fw_trace_data = priv;
+
 	/* set false before start initialization */
-	sdev->dtrace_state = SOF_DTRACE_DISABLED;
+	priv->dtrace_state = SOF_DTRACE_DISABLED;
 
 	/* allocate trace page table buffer */
 	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
-				  PAGE_SIZE, &sdev->dmatp);
+				  PAGE_SIZE, &priv->dmatp);
 	if (ret < 0) {
 		dev_err(sdev->dev, "can't alloc page table for trace %d\n", ret);
 		return ret;
@@ -464,21 +501,21 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 	/* allocate trace data buffer */
 	ret = snd_dma_alloc_dir_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
 				      DMA_FROM_DEVICE, DMA_BUF_SIZE_FOR_TRACE,
-				      &sdev->dmatb);
+				      &priv->dmatb);
 	if (ret < 0) {
 		dev_err(sdev->dev, "can't alloc buffer for trace %d\n", ret);
 		goto page_err;
 	}
 
 	/* create compressed page table for audio firmware */
-	ret = snd_sof_create_page_table(sdev->dev, &sdev->dmatb,
-					sdev->dmatp.area, sdev->dmatb.bytes);
+	ret = snd_sof_create_page_table(sdev->dev, &priv->dmatb,
+					priv->dmatp.area, priv->dmatb.bytes);
 	if (ret < 0)
 		goto table_err;
 
-	sdev->dma_trace_pages = ret;
+	priv->dma_trace_pages = ret;
 	dev_dbg(sdev->dev, "%s: dma_trace_pages: %d\n", __func__,
-		sdev->dma_trace_pages);
+		priv->dma_trace_pages);
 
 	if (sdev->first_boot) {
 		ret = debugfs_create_dtrace(sdev);
@@ -486,7 +523,7 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 			goto table_err;
 	}
 
-	init_waitqueue_head(&sdev->trace_sleep);
+	init_waitqueue_head(&priv->trace_sleep);
 
 	ret = ipc3_dtrace_enable(sdev);
 	if (ret < 0)
@@ -494,23 +531,25 @@ static int ipc3_dtrace_init(struct snd_sof_dev *sdev)
 
 	return 0;
 table_err:
-	sdev->dma_trace_pages = 0;
-	snd_dma_free_pages(&sdev->dmatb);
+	priv->dma_trace_pages = 0;
+	snd_dma_free_pages(&priv->dmatb);
 page_err:
-	snd_dma_free_pages(&sdev->dmatp);
+	snd_dma_free_pages(&priv->dmatp);
 	return ret;
 }
 
 int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 			    struct sof_ipc_dma_trace_posn *posn)
 {
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
+
 	if (!sdev->fw_trace_is_supported)
 		return 0;
 
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED &&
-	    sdev->host_offset != posn->host_offset) {
-		sdev->host_offset = posn->host_offset;
-		wake_up(&sdev->trace_sleep);
+	if (priv->dtrace_state == SOF_DTRACE_ENABLED &&
+	    priv->host_offset != posn->host_offset) {
+		priv->host_offset = posn->host_offset;
+		wake_up(&priv->trace_sleep);
 	}
 
 	if (posn->overflow != 0)
@@ -524,27 +563,30 @@ int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 /* an error has occurred within the DSP that prevents further trace */
 static void ipc3_dtrace_fw_crashed(struct snd_sof_dev *sdev)
 {
-	if (sdev->dtrace_state == SOF_DTRACE_ENABLED) {
-		sdev->dtrace_error = true;
-		wake_up(&sdev->trace_sleep);
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
+
+	if (priv->dtrace_state == SOF_DTRACE_ENABLED) {
+		priv->dtrace_error = true;
+		wake_up(&priv->trace_sleep);
 	}
 }
 
 static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 {
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
 	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
 	struct sof_ipc_fw_version *v = &ready->version;
 	struct sof_ipc_cmd_hdr hdr;
 	struct sof_ipc_reply ipc_reply;
 	int ret;
 
-	if (!sdev->fw_trace_is_supported || sdev->dtrace_state == SOF_DTRACE_DISABLED)
+	if (!sdev->fw_trace_is_supported || priv->dtrace_state == SOF_DTRACE_DISABLED)
 		return;
 
 	ret = sof_dtrace_host_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0)
 		dev_err(sdev->dev, "Host dtrace trigger stop failed: %d\n", ret);
-	sdev->dtrace_state = SOF_DTRACE_STOPPED;
+	priv->dtrace_state = SOF_DTRACE_STOPPED;
 
 	/*
 	 * stop and free trace DMA in the DSP. TRACE_DMA_FREE is only supported from
@@ -567,11 +609,11 @@ static void ipc3_dtrace_release(struct snd_sof_dev *sdev, bool only_stop)
 	if (ret < 0)
 		dev_err(sdev->dev, "Host dtrace release failed %d\n", ret);
 
-	sdev->dtrace_state = SOF_DTRACE_DISABLED;
+	priv->dtrace_state = SOF_DTRACE_DISABLED;
 
 out:
-	sdev->dtrace_draining = true;
-	wake_up(&sdev->trace_sleep);
+	priv->dtrace_draining = true;
+	wake_up(&priv->trace_sleep);
 }
 
 static void ipc3_dtrace_suspend(struct snd_sof_dev *sdev, pm_message_t pm_state)
@@ -586,13 +628,15 @@ static int ipc3_dtrace_resume(struct snd_sof_dev *sdev)
 
 static void ipc3_dtrace_free(struct snd_sof_dev *sdev)
 {
+	struct sof_dtrace_priv *priv = sdev->fw_trace_data;
+
 	/* release trace */
 	ipc3_dtrace_release(sdev, false);
 
-	if (sdev->dma_trace_pages) {
-		snd_dma_free_pages(&sdev->dmatb);
-		snd_dma_free_pages(&sdev->dmatp);
-		sdev->dma_trace_pages = 0;
+	if (priv->dma_trace_pages) {
+		snd_dma_free_pages(&priv->dmatb);
+		snd_dma_free_pages(&priv->dmatp);
+		priv->dma_trace_pages = 0;
 	}
 }
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d8d81e1ec259..9d7f53ff9c70 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -461,12 +461,6 @@ struct snd_sof_ipc {
 	const struct sof_ipc_ops *ops;
 };
 
-enum sof_dtrace_state {
-	SOF_DTRACE_DISABLED,
-	SOF_DTRACE_STOPPED,
-	SOF_DTRACE_ENABLED,
-};
-
 /*
  * SOF Device Level.
  */
@@ -551,16 +545,6 @@ struct snd_sof_dev {
 	bool fw_trace_is_supported; /* set with Kconfig or module parameter */
 	void *fw_trace_data; /* private data used by firmware tracing implementation */
 
-	/* DMA for Trace */
-	struct snd_dma_buffer dmatb;
-	struct snd_dma_buffer dmatp;
-	int dma_trace_pages;
-	wait_queue_head_t trace_sleep;
-	u32 host_offset;
-	bool dtrace_error;
-	bool dtrace_draining;
-	enum sof_dtrace_state dtrace_state;
-
 	bool msi_enabled;
 
 	/* DSP core context */
-- 
2.36.1

