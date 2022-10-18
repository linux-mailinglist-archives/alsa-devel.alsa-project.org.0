Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94954602B78
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:15:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BDC29CF8;
	Tue, 18 Oct 2022 14:14:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BDC29CF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095332;
	bh=iQztqqt5coCVFouRka4JJh2HMiO5vP/507u+K2YWWNU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=o1zA/E+WCSADcB5QdWjZMsE2p8nH4ZDdZE+gc2Fd7dG+mlxldnso+9ucIlFYBh+OP
	 SjeU50SuSdKkxwk4nNIa1iSWjn7AOfjs2xFK9NC5rlyr/QaQvHVoMGcoCyGoHw1Xfn
	 9mtQD/tJIoICO+Eg1tU/i6Q0TwToYp6qViJFjamM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32A87F80571;
	Tue, 18 Oct 2022 14:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7957DF80568; Tue, 18 Oct 2022 14:13:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BCADF80566
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BCADF80566
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jn6Sl9u9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666095196; x=1697631196;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iQztqqt5coCVFouRka4JJh2HMiO5vP/507u+K2YWWNU=;
 b=Jn6Sl9u9d5nGt99ODzayGVl5oOsoF1vCIthNMIzhimv0ihMSGWC9w8u2
 CA6uHkQSXla3bK4j4vsznYTiB4UW1q2HYVlipqFYjxokURThOu6QUAaAx
 vxotjjOWcQ9JAuuDNoqCroXD0THuQ51CDQfbQNaxweaSMWLd30o+C223z
 D+epdIombcvq04g4dF3IIVoT6BmW4QBPs0RKMzZ+L4EvIPE90GjyV4F8R
 k/f1GYwJnkACYoNwrShoFocdW5A0GnAwMrMcwHMvHbSr4D7Gu5MGoHkj1
 Q6nawKEaSmy7jPcNT/UImoaQRPvue4tXRvy4xi+GgdDahZHzw3oE85cse g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="289380742"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="289380742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:13:11 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579759078"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579759078"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:13:09 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: ipc4-mtrace: protect per-core nodes against
 multiple open
Date: Tue, 18 Oct 2022 15:13:32 +0300
Message-Id: <20221018121332.20802-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Add protection against multiple open of the mtrace/coreN debugfs
nodes. This is not supported in the implementation, and this will
show up as unexpected behaviour of the interface, and potential
use of already freed memory.

Fixes: f4ea22f7aa75 ("ASoC: SOF: ipc4: Add support for mtrace log extraction")
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc4-mtrace.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 9c7080041d08..70dea8ae706e 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -108,6 +108,7 @@ struct sof_mtrace_core_data {
 	int id;
 	u32 slot_offset;
 	void *log_buffer;
+	struct mutex buffer_lock; /* for log_buffer alloc/free */
 	u32 host_read_ptr;
 	u32 dsp_write_ptr;
 	/* pos update IPC arrived before the slot offset is known, queried */
@@ -128,14 +129,22 @@ static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
 	struct sof_mtrace_core_data *core_data = inode->i_private;
 	int ret;
 
+	mutex_lock(&core_data->buffer_lock);
+
+	if (core_data->log_buffer) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	ret = debugfs_file_get(file->f_path.dentry);
 	if (unlikely(ret))
-		return ret;
+		goto out;
 
 	core_data->log_buffer = kmalloc(SOF_MTRACE_SLOT_SIZE, GFP_KERNEL);
 	if (!core_data->log_buffer) {
 		debugfs_file_put(file->f_path.dentry);
-		return -ENOMEM;
+		ret = -ENOMEM;
+		goto out;
 	}
 
 	ret = simple_open(inode, file);
@@ -144,6 +153,9 @@ static int sof_ipc4_mtrace_dfs_open(struct inode *inode, struct file *file)
 		debugfs_file_put(file->f_path.dentry);
 	}
 
+out:
+	mutex_unlock(&core_data->buffer_lock);
+
 	return ret;
 }
 
@@ -280,7 +292,10 @@ static int sof_ipc4_mtrace_dfs_release(struct inode *inode, struct file *file)
 
 	debugfs_file_put(file->f_path.dentry);
 
+	mutex_lock(&core_data->buffer_lock);
 	kfree(core_data->log_buffer);
+	core_data->log_buffer = NULL;
+	mutex_unlock(&core_data->buffer_lock);
 
 	return 0;
 }
@@ -563,6 +578,7 @@ static int ipc4_mtrace_init(struct snd_sof_dev *sdev)
 		struct sof_mtrace_core_data *core_data = &priv->cores[i];
 
 		init_waitqueue_head(&core_data->trace_sleep);
+		mutex_init(&core_data->buffer_lock);
 		core_data->sdev = sdev;
 		core_data->id = i;
 	}
-- 
2.38.0

