Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A52640925
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Dec 2022 16:16:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4766B184D;
	Fri,  2 Dec 2022 16:15:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4766B184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669994179;
	bh=ZUO2Xh3/mt/TDW+MY4Lc0/z+D/4ZkLLW6lTtunZ01fw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nFUS6TPrNPT8QdM9KSgb4C++Qfh+I66s60Cf6HdEARZ/1sLojElLaoh767MocJ1KA
	 faIPVvvhKLf43T/i3i/4U7mYwyO6hyAT3ex8YIxFfP7E9umD2wXAhi2f395QMNZnpN
	 UCcG0yDZnlG6RT84mWyqrVSskiw0TZbnSxq3fMiM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 98AB0F805D6;
	Fri,  2 Dec 2022 16:12:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6949DF805C5; Fri,  2 Dec 2022 16:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7270F805C5
 for <alsa-devel@alsa-project.org>; Fri,  2 Dec 2022 16:12:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7270F805C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="h6KSLn5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669993930; x=1701529930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZUO2Xh3/mt/TDW+MY4Lc0/z+D/4ZkLLW6lTtunZ01fw=;
 b=h6KSLn5dqFS92fuY2zt0/qmH7f/PynxnMq+z2Kpk+PvuNjVEZrxwpRqf
 H9w4p1gJVp2GAwfWUbJE8AtfwuHwXhjEtNPpyCjzL5h4GYUr/nsUZTzbl
 vkxYxhjI2KePRL6+m9HrDu7Hf8xaYZ++HxBGNjvAj0hka/lnzuXZ+LksH
 92j0jGipIkArNV5hgVUzPGC4tG9dYgZSckC1d6dXF8UOy5ProZEzXvVU3
 vC9i0S05poa3x3DQpJIfvFbyyZsxT9rBuRrIYIvobXgP1ycXW9AIEh5UT
 pQBELc7aNT1rboc5Q47de0kHr8EpDZB5twGN1umObRp+IS0LzPKJK9J3j w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="402251857"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="402251857"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2022 07:12:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10548"; a="708504786"
X-IronPort-AV: E=Sophos;i="5.96,212,1665471600"; d="scan'208";a="708504786"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 02 Dec 2022 07:12:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 16/16] ASoC: Intel: avs: Allow for dumping debug window
 snapshot
Date: Fri,  2 Dec 2022 16:28:41 +0100
Message-Id: <20221202152841.672536-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221202152841.672536-1-cezary.rojewski@intel.com>
References: <20221202152841.672536-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Add new read-only debugfs entry which dumps entire content of the SRAM
window 2 i.e.: the debug window.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/debugfs.c   | 26 ++++++++++++++++++++++++++
 sound/soc/intel/avs/registers.h |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/debugfs.c b/sound/soc/intel/avs/debugfs.c
index e9042d4328c4..bdd388ec01ea 100644
--- a/sound/soc/intel/avs/debugfs.c
+++ b/sound/soc/intel/avs/debugfs.c
@@ -71,6 +71,31 @@ static const struct file_operations fw_regs_fops = {
 	.llseek = no_llseek,
 };
 
+static ssize_t debug_window_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
+{
+	struct avs_dev *adev = file->private_data;
+	size_t size;
+	char *buf;
+	int ret;
+
+	size = adev->hw_cfg.dsp_cores * AVS_WINDOW_CHUNK_SIZE;
+	buf = kzalloc(size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	memcpy_fromio(buf, avs_sram_addr(adev, AVS_DEBUG_WINDOW), size);
+
+	ret = simple_read_from_buffer(to, count, ppos, buf, size);
+	kfree(buf);
+	return ret;
+}
+
+static const struct file_operations debug_window_fops = {
+	.open = simple_open,
+	.read = debug_window_read,
+	.llseek = no_llseek,
+};
+
 static ssize_t probe_points_read(struct file *file, char __user *to, size_t count, loff_t *ppos)
 {
 	struct avs_dev *adev = file->private_data;
@@ -393,6 +418,7 @@ void avs_debugfs_init(struct avs_dev *adev)
 	debugfs_create_file("strace", 0444, adev->debugfs_root, adev, &strace_fops);
 	debugfs_create_file("trace_control", 0644, adev->debugfs_root, adev, &trace_control_fops);
 	debugfs_create_file("fw_regs", 0444, adev->debugfs_root, adev, &fw_regs_fops);
+	debugfs_create_file("debug_window", 0444, adev->debugfs_root, adev, &debug_window_fops);
 
 	debugfs_create_u32("trace_aging_period", 0644, adev->debugfs_root,
 			   &adev->aging_timer_period);
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 95be86148cf3..2b464e466ed5 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -59,7 +59,8 @@
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
 #define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
 
-#define AVS_FW_REGS_SIZE		PAGE_SIZE
+#define AVS_WINDOW_CHUNK_SIZE		PAGE_SIZE
+#define AVS_FW_REGS_SIZE		AVS_WINDOW_CHUNK_SIZE
 #define AVS_FW_REGS_WINDOW		0
 /* DSP -> HOST communication window */
 #define AVS_UPLINK_WINDOW		AVS_FW_REGS_WINDOW
-- 
2.25.1

