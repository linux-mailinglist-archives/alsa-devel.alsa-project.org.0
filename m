Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B283219D35C
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Apr 2020 11:17:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64C0E1677;
	Fri,  3 Apr 2020 11:16:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64C0E1677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585905442;
	bh=c7SIsHAAXjU1YLHnq0zVFulXi1hfunmviwHY2Bjo2p0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vru4pxsKhYre+gHzG/6s2gS/tDfmFzqXqij5M8+jo9GEaW0GeYxgvCajkg5+sPHmc
	 pE46eqCBu0LNKi8WHFsejL7QR3udcYmGnMHz0MMWrHT+bekeiUP7tBcQrdB+lrGliN
	 ZE3DwKOHXrTOY72VxTxFXbWy3Yu1O4hNMsXgXH5M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95180F80141;
	Fri,  3 Apr 2020 11:14:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6E8BF80291; Fri,  3 Apr 2020 11:14:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF34EF8015C;
 Fri,  3 Apr 2020 11:14:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF34EF8015C
IronPort-SDR: 0t3Cqv3wqpB5sUKsIaAZ8WJEDCKo5ihHCFfnKcBHMmdnrcPNxjzV8aOgJoTJuvxH+l7AZJYmTd
 HDkm9rjbLE/g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 02:14:18 -0700
IronPort-SDR: OCue0bINJGROa8N/tV+9dQU/BLsjQFjpuvsaGRWVTU8cmuItoSbzgDJGLGt0IAPpLXWDd5t4ot
 xLrFpTVw0+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="451234953"
Received: from gliakhov-mobl2.ger.corp.intel.com (HELO
 ubuntu.ger.corp.intel.com) ([10.249.36.113])
 by fmsmga006.fm.intel.com with ESMTP; 03 Apr 2020 02:14:16 -0700
From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/12] [RESEND] ASoC: SOF: support IPC with immediate
 response
Date: Fri,  3 Apr 2020 11:13:59 +0200
Message-Id: <20200403091406.22381-6-guennadi.liakhovetski@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
References: <20200403091406.22381-1-guennadi.liakhovetski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

Usually when an IPC message is sent, we have to wait for a reply from
the DSP or from the host in the VirtIO case. However, sometimes in
the VirtIO case a response is available immediately. Skip sleeping in
such cases.

Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/ipc.c |  9 +++++----
 sound/soc/sof/ops.h | 10 +++++++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index cf57085..6fa501c1 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -262,6 +262,10 @@ int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 
 	sdev->msg = msg;
 
+	/*
+	 * If snd_sof_dsp_send_msg() returns a positive number it means, that a
+	 * response is already available, no need to sleep waiting for it
+	 */
 	ret = snd_sof_dsp_send_msg(sdev, msg);
 	/* Next reply that we receive will be related to this message */
 	if (!ret)
@@ -279,10 +283,7 @@ int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	ipc_log_header(sdev->dev, "ipc tx", msg->header);
 
 	/* now wait for completion */
-	if (!ret)
-		ret = tx_wait_done(ipc, msg, reply_data);
-
-	return ret;
+	return tx_wait_done(ipc, msg, reply_data);
 }
 EXPORT_SYMBOL(sof_ipc_tx_message_unlocked);
 
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a771500..43bcfbf 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -274,7 +274,15 @@ static inline void snd_sof_dsp_block_write(struct snd_sof_dev *sdev, u32 bar,
 	sof_ops(sdev)->block_write(sdev, bar, offset, src, bytes);
 }
 
-/* ipc */
+/**
+ * snd_sof_dsp_send_msg - call sdev ops to send a message
+ * @sdev:	sdev context
+ * @msg:	message to send
+ *
+ * Returns	< 0 - an error code
+ *		  0 - the message has been sent, wait for a reply
+ *		> 0 - the message has been sent, a reply is already available
+ */
 static inline int snd_sof_dsp_send_msg(struct snd_sof_dev *sdev,
 				       struct snd_sof_ipc_msg *msg)
 {
-- 
1.9.3

