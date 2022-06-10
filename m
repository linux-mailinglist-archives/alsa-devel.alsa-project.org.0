Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4A545E10
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:02:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF79E1EF1;
	Fri, 10 Jun 2022 10:01:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF79E1EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654848157;
	bh=bsjlU4WdaVedTinYzD8yfFZY8yRFASxRB/jOkDQuRsk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tK2Fq7XJYeAdmHuPUSIEUUnooWt3Wl87PU3vAplaVa1Rmb4IDEFcxxIWfjmrqNzTR
	 buCEsWsWkJaiZwntPL0ssM3Ey5o/IxmBnLtMcClZE52/xWQvZWbVY3icSdszNCflZ/
	 IPCQaj8MhyLzPaBqGd4vzXRCCNVCtyzJqMnBraVo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25152F80537;
	Fri, 10 Jun 2022 10:01:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D938BF80536; Fri, 10 Jun 2022 10:01:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 354D1F80515
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:00:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 354D1F80515
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FPlIg7Xs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654848056; x=1686384056;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bsjlU4WdaVedTinYzD8yfFZY8yRFASxRB/jOkDQuRsk=;
 b=FPlIg7Xs8ICMSqOVISTxkDRiTY6kpAu4ngH/KgU4PqZGkQASkPX1Wlgc
 3dREK3hf3Omm+Ri1zMj2x8iKC6rM6sZvMPuO5X5TGX5xK1sqmHOwwNVGI
 9d/+GtgM8rpA6cL7fcLztiGdE9n227Fy1e0rG4fzJJUkKHo2OUTVlIIoE
 X1/K9rH6h8EqnZdSKxqs7ykIVUVq+XnS3AcNnXwXcEDqwJZVpAtr/mNeP
 5SpeTIjgf9Ph8pqGO7j/4NDDutK9gSMGtQ4c/OIkP7mvSgHJChBvTD04V
 9lbsOfY6fB58wJ6UrTj7WK04qAR4wfDQwNbN0bgmYeI2bq6RBSJ6aP/zH Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339305566"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="339305566"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:51 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638007978"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:49 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH 2/3] ASoC: SOF: ipc3-dtrace: Add helper function to update the
 sdev->host_offset
Date: Fri, 10 Jun 2022 11:01:18 +0300
Message-Id: <20220610080119.30880-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
References: <20220610080119.30880-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
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

We are using the READ_ONCE() on the debugfs read path for accessing
sdev->host_offset, but the set is not atomic or protected in any way.

Add a small helper to do the host_offset update and be really paranoid
about the a possible race in update

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 9292ff7ce1e8..1f4d7a98c8fc 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -252,6 +252,21 @@ static int debugfs_create_trace_filter(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static bool sof_dtrace_set_host_offset(struct sof_dtrace_priv *priv, u32 new_offset)
+{
+	u32 host_offset = READ_ONCE(priv->host_offset);
+
+	if (host_offset != new_offset) {
+		/* This is a bit paranoid and unlikely that it is needed */
+		u32 ret = cmpxchg(&priv->host_offset, host_offset, new_offset);
+
+		if (ret == host_offset)
+			return true;
+	}
+
+	return false;
+}
+
 static size_t sof_dtrace_avail(struct snd_sof_dev *sdev,
 			       loff_t pos, size_t buffer_size)
 {
@@ -368,7 +383,7 @@ static int dfsentry_dtrace_release(struct inode *inode, struct file *file)
 
 	/* avoid duplicate traces at next open */
 	if (priv->dtrace_state != SOF_DTRACE_ENABLED)
-		priv->host_offset = 0;
+		sof_dtrace_set_host_offset(priv, 0);
 
 	return 0;
 }
@@ -444,7 +459,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	params.buffer.pages = priv->dma_trace_pages;
 	params.stream_tag = 0;
 
-	priv->host_offset = 0;
+	sof_dtrace_set_host_offset(priv, 0);
 	priv->dtrace_draining = false;
 
 	ret = sof_dtrace_host_init(sdev, &priv->dmatb, &params);
@@ -559,10 +574,8 @@ int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 		return 0;
 
 	if (trace_pos_update_expected(priv) &&
-	    priv->host_offset != posn->host_offset) {
-		priv->host_offset = posn->host_offset;
+	    sof_dtrace_set_host_offset(priv, posn->host_offset))
 		wake_up(&priv->trace_sleep);
-	}
 
 	if (posn->overflow != 0)
 		dev_err(sdev->dev,
-- 
2.36.1

