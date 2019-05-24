Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9DC29F10
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 21:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B71BE176D;
	Fri, 24 May 2019 21:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B71BE176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558725947;
	bh=0hXyFOJzqvNiuQO/y0wBqq95NmVFcV3gNV8raGCnEwY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oy9j+jZ9eY1dlC1ZE1YXjjiiV+p2wJ1gjtlVKARWAkiz/qRfnqjI/SYKIPQeDUyI3
	 UmaoOR3Q0fwzM/ML+hT6GRx69nonhZJZQZJ3bnRNxKNOesezqzhxq514pB4u4rsb/K
	 LeDqKM7YLUXqLPxxPYU+LRxvteoRDwM74ZWU97Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1117EF89720;
	Fri, 24 May 2019 21:23:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6385F89630; Fri, 24 May 2019 21:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4CA9F89625
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 21:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4CA9F89625
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 12:23:16 -0700
X-ExtLoop1: 1
Received: from tattafos-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.178.85])
 by orsmga002.jf.intel.com with ESMTP; 24 May 2019 12:23:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 24 May 2019 14:23:05 -0500
Message-Id: <20190524192309.6359-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
References: <20190524192309.6359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/5] ASoC: SOF: trace: remove code duplication
	in sof_wait_trace_avail()
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

Move duplicated code in sof_wait_trace_avail() to a helper function.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/trace.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index d588e4b70fad..a2d89d295f0f 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -13,10 +13,9 @@
 #include "sof-priv.h"
 #include "ops.h"
 
-static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
-				   loff_t pos, size_t buffer_size)
+static size_t sof_trace_avail(struct snd_sof_dev *sdev,
+			      loff_t pos, size_t buffer_size)
 {
-	wait_queue_entry_t wait;
 	loff_t host_offset = READ_ONCE(sdev->host_offset);
 
 	/*
@@ -31,6 +30,19 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	if (host_offset > pos)
 		return host_offset - pos;
 
+	return 0;
+}
+
+static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
+				   loff_t pos, size_t buffer_size)
+{
+	wait_queue_entry_t wait;
+	size_t ret = sof_trace_avail(sdev, pos, buffer_size);
+
+	/* data immediately available */
+	if (ret)
+		return ret;
+
 	/* wait for available trace data from FW */
 	init_waitqueue_entry(&wait, current);
 	set_current_state(TASK_INTERRUPTIBLE);
@@ -42,12 +54,7 @@ static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
 	}
 	remove_wait_queue(&sdev->trace_sleep, &wait);
 
-	/* return bytes available for copy */
-	host_offset = READ_ONCE(sdev->host_offset);
-	if (host_offset < pos)
-		return buffer_size - pos;
-
-	return host_offset - pos;
+	return sof_trace_avail(sdev, pos, buffer_size);
 }
 
 static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
