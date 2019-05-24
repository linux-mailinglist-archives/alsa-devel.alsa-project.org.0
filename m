Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C729F13
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E476B175C;
	Fri, 24 May 2019 21:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E476B175C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558725993;
	bh=LU0rBF3Zak7TDyIHfPJelOtJ6l+6kTRs7Aokfi+Qv7Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OQoAaFPZ/2+tHS/tanTmQgwc63XyDwN46b2teLc+S9ycKRNxRasZoWK+2yL5L6+3U
	 RD7hd3lLgGdMUbpejqW+hs5fLoOFQirIcsOdi29k68Jy9Qi7l3f0CemK2qoySKouSZ
	 fl7sDp65fa7qxufVLDCP+OD9T3TdxJvFdWs8CATk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49063F8972D;
	Fri, 24 May 2019 21:23:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A890F8963E; Fri, 24 May 2019 21:23:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91FC3F8962F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:23:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91FC3F8962F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:23:17 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2019 12:23:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:23:06 -0500
Message-Id: <20190524192309.6359-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
References: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/5] ASoC: SOF: force end-of-file for debugfs
	trace at suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Current trace implementation gets out of sync when sof device
is put to suspend. The debugfs file handle is kept open, but
firmware will reset its state. After resume, debugfs client's
read offset will not be synchronized to firmware and this may
result in traces read in incorrect order and/or stale data being
read after resume.

Add logic to signal end-of-file to read() when firmware tracing
has ended, and all trace data has been read. This allows debugfs
client to capture all trace data, and reopen the trace file to
ensure proper synchronization with firmware after reopening
the node.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h |  2 ++
 sound/soc/sof/trace.c    | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 1e85d6f9c5c3..01a6219c326b 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -417,6 +417,8 @@ struct snd_sof_dev {
 	u32 host_offset;
 	u32 dtrace_is_enabled;
 	u32 dtrace_error;
+	u32 dtrace_draining;
+
 	u32 msi_enabled;
 
 	void *private;			/* core does not touch this */
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index a2d89d295f0f..b02520f8e595 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -43,6 +43,15 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	if (ret)
 		return ret;
 
+	if (!sdev->dtrace_is_enabled && sdev->dtrace_draining) {
+		/*
+		 * tracing has ended and all traces have been
+		 * read by client, return EOF
+		 */
+		sdev->dtrace_draining = false;
+		return 0;
+	}
+
 	/* wait for available trace data from FW */
 	init_waitqueue_entry(&wait, current);
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -104,10 +113,23 @@ static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
 	return count;
 }
 
+static int sof_dfsentry_trace_release(struct inode *inode, struct file *file)
+{
+	struct snd_sof_dfsentry *dfse = inode->i_private;
+	struct snd_sof_dev *sdev = dfse->sdev;
+
+	/* avoid duplicate traces at next open */
+	if (!sdev->dtrace_is_enabled)
+		sdev->host_offset = 0;
+
+	return 0;
+}
+
 static const struct file_operations sof_dfs_trace_fops = {
 	.open = simple_open,
 	.read = sof_dfsentry_trace_read,
 	.llseek = default_llseek,
+	.release = sof_dfsentry_trace_release,
 };
 
 static int trace_debugfs_create(struct snd_sof_dev *sdev)
@@ -155,6 +177,7 @@ int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
 	params.stream_tag = 0;
 
 	sdev->host_offset = 0;
+	sdev->dtrace_draining = false;
 
 	ret = snd_sof_dma_trace_init(sdev, &params.stream_tag);
 	if (ret < 0) {
@@ -291,6 +314,8 @@ void snd_sof_release_trace(struct snd_sof_dev *sdev)
 			"error: fail in snd_sof_dma_trace_release %d\n", ret);
 
 	sdev->dtrace_is_enabled = false;
+	sdev->dtrace_draining = true;
+	wake_up(&sdev->trace_sleep);
 }
 EXPORT_SYMBOL(snd_sof_release_trace);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
