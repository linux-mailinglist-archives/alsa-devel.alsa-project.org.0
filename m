Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D4B10343
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2019 01:21:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA99A16CD;
	Wed,  1 May 2019 01:20:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA99A16CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556666499;
	bh=ZrOLWRujv/17GOUE7m4oHHdqDACnxVn5X6s4EOEfXlA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SG7p5lZuNoEjTv/uF702TDQR1SuIs0u/dsAO0Br1JFlCFj8jm/FAdtH7WP9X5ixCx
	 q9KNtucMjdQMvzUJhWWvz8aTqfgcWy8qB35gjNmuY1EyTQDjMldW+hH82CNubpuSFm
	 4kD3Fk9FNr1mCzy5rb33VGgKkXUmhNi4Mi0gr62s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF4A8F8976A;
	Wed,  1 May 2019 01:10:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09FCBF8973F; Wed,  1 May 2019 01:10:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD03DF8972F
 for <alsa-devel@alsa-project.org>; Wed,  1 May 2019 01:10:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD03DF8972F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 16:10:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,415,1549958400"; d="scan'208";a="166540985"
Received: from slawsonx-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.128])
 by fmsmga004.fm.intel.com with ESMTP; 30 Apr 2019 16:10:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 30 Apr 2019 18:09:32 -0500
Message-Id: <20190430230934.4321-18-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
References: <20190430230934.4321-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 17/19] ASoC: SOF: IPC: add ipc dump function
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Dump IPC status when IPC timed out. IPC status is platform specific and
need bind to plaform.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 1 +
 sound/soc/sof/ops.h      | 6 ++++++
 sound/soc/sof/sof-priv.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 437e80a07bc2..ba1bb17a8d1e 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -207,6 +207,7 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 		dev_err(sdev->dev, "error: ipc timed out for 0x%x size %d\n",
 			hdr->cmd, hdr->size);
 		snd_sof_dsp_dbg_dump(ipc->sdev, SOF_DBG_REGS | SOF_DBG_MBOX);
+		snd_sof_ipc_dump(ipc->sdev);
 		snd_sof_trace_notify_for_error(ipc->sdev);
 		ret = -ETIMEDOUT;
 	} else {
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index b8e2bf1fee24..80fc3b374c2b 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -155,6 +155,12 @@ static inline void snd_sof_dsp_dbg_dump(struct snd_sof_dev *sdev, u32 flags)
 		return sof_ops(sdev)->dbg_dump(sdev, flags);
 }
 
+static inline void snd_sof_ipc_dump(struct snd_sof_dev *sdev)
+{
+	if (sof_ops(sdev)->ipc_dump)
+		return sof_ops(sdev)->ipc_dump(sdev);
+}
+
 /* register IO */
 static inline void snd_sof_dsp_write(struct snd_sof_dev *sdev, u32 bar,
 				     u32 offset, u32 value)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 170adc21ef17..1e85d6f9c5c3 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -176,6 +176,7 @@ struct snd_sof_dsp_ops {
 	int debug_map_count; /* optional */
 	void (*dbg_dump)(struct snd_sof_dev *sof_dev,
 			 u32 flags); /* optional */
+	void (*ipc_dump)(struct snd_sof_dev *sof_dev); /* optional */
 
 	/* host DMA trace initialization */
 	int (*trace_init)(struct snd_sof_dev *sdev,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
