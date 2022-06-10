Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3E8545E0D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:02:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85AFD1E7B;
	Fri, 10 Jun 2022 10:01:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85AFD1E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654848120;
	bh=JluXeIPfCgMOMur4k5WuOu7ujvoG0GASReiXRlR7PLg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=j5cw2f8fltjUJvLBI4mibZ+TxrLU1oDIHiODqyL8B4+59Hym5xwEJ1xadfFtU0b7s
	 wZqXrj9FnCC47LdGPDeZmK7WL2Qh35S6R/1PZV9LtnNdRiRE3Ia6iiN9pcS9/8v3CF
	 sdPXDBjYMkxPs6b+ZXhHPqJOdzuk93hOTUdhyyIk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04A71F800C7;
	Fri, 10 Jun 2022 10:01:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF892F80526; Fri, 10 Jun 2022 10:00:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 105FCF804CF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:00:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 105FCF804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="W08H5xNf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654848054; x=1686384054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JluXeIPfCgMOMur4k5WuOu7ujvoG0GASReiXRlR7PLg=;
 b=W08H5xNff3kxiu0nnkmm4kLuSjMaQOwu9un+C3hT4aw3PSobb5o6RAHY
 zXxE47jZAxh4TDENCPT7qOHDLaJ4xp3HIPFmp7yO9gdNqfoPsh3hjdicN
 /ImCz1jdSf+JmTevLKiAXIkgDs4dF7erOQ4NeK3jKB+ETBwj1Bakt2/bw
 gu8jY+xi2XYTRsxLjAAqCOLAczQCTC+P8E55pMyHfRcCZzzPuZbcYMI2x
 Ul5DorjdRMW4gVabZNF9ltcVORmZToA4I0gwyC5IAi/ZP4ALFqCiZfEIX
 6PjWDBWUDvYZ6vIsgJuykie2VZ7gM5gpALlOoHRdehDdMrBFS4HkuMziZ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="339305540"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="339305540"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638007958"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:00:46 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH 1/3] ASoC: SOF: ipc3-dtrace: Introduce SOF_DTRACE_INITIALIZING
 state
Date: Fri, 10 Jun 2022 11:01:17 +0300
Message-Id: <20220610080119.30880-2-peter.ujfalusi@linux.intel.com>
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

With the new state we can make sure we are not missing the first
host_offset update.

In case the dtrace is small, the DMA copy will be fast and depending on
the moonphase it might be done before we set the sdev->dtrace_state  to
SOF_DTRACE_ENABLED.

The DMA will start the copy as soon as the host starts the DMA. Set the
dtrace to enabled before we let the DMA to run in order to avoid missing
the position update.

The new state is needed to cover architectures where the host side
snd_sof_dma_trace_trigger() is a NOP and the dtrace in the firmware is
ready as soon as the IPC message has been processed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/ipc3-dtrace.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index b4e1343f9138..9292ff7ce1e8 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -18,6 +18,7 @@
 enum sof_dtrace_state {
 	SOF_DTRACE_DISABLED,
 	SOF_DTRACE_STOPPED,
+	SOF_DTRACE_INITIALIZING,
 	SOF_DTRACE_ENABLED,
 };
 
@@ -32,6 +33,15 @@ struct sof_dtrace_priv {
 	enum sof_dtrace_state dtrace_state;
 };
 
+static bool trace_pos_update_expected(struct sof_dtrace_priv *priv)
+{
+	if (priv->dtrace_state == SOF_DTRACE_ENABLED ||
+	    priv->dtrace_state == SOF_DTRACE_INITIALIZING)
+		return true;
+
+	return false;
+}
+
 static int trace_filter_append_elem(struct snd_sof_dev *sdev, u32 key, u32 value,
 				    struct sof_ipc_trace_filter_elem *elem_list,
 				    int capacity, int *counter)
@@ -274,7 +284,7 @@ static size_t sof_wait_dtrace_avail(struct snd_sof_dev *sdev, loff_t pos,
 	if (ret)
 		return ret;
 
-	if (priv->dtrace_state != SOF_DTRACE_ENABLED && priv->dtrace_draining) {
+	if (priv->dtrace_draining && !trace_pos_update_expected(priv)) {
 		/*
 		 * tracing has ended and all traces have been
 		 * read by client, return EOF
@@ -445,6 +455,7 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "%s: stream_tag: %d\n", __func__, params.stream_tag);
 
 	/* send IPC to the DSP */
+	priv->dtrace_state = SOF_DTRACE_INITIALIZING;
 	ret = sof_ipc_tx_message(sdev->ipc, &params, sizeof(params), &ipc_reply, sizeof(ipc_reply));
 	if (ret < 0) {
 		dev_err(sdev->dev, "can't set params for DMA for trace %d\n", ret);
@@ -452,17 +463,18 @@ static int ipc3_dtrace_enable(struct snd_sof_dev *sdev)
 	}
 
 start:
+	priv->dtrace_state = SOF_DTRACE_ENABLED;
+
 	ret = sof_dtrace_host_trigger(sdev, SNDRV_PCM_TRIGGER_START);
 	if (ret < 0) {
 		dev_err(sdev->dev, "Host dtrace trigger start failed: %d\n", ret);
 		goto trace_release;
 	}
 
-	priv->dtrace_state = SOF_DTRACE_ENABLED;
-
 	return 0;
 
 trace_release:
+	priv->dtrace_state = SOF_DTRACE_DISABLED;
 	sof_dtrace_host_release(sdev);
 	return ret;
 }
@@ -546,7 +558,7 @@ int ipc3_dtrace_posn_update(struct snd_sof_dev *sdev,
 	if (!sdev->fw_trace_is_supported)
 		return 0;
 
-	if (priv->dtrace_state == SOF_DTRACE_ENABLED &&
+	if (trace_pos_update_expected(priv) &&
 	    priv->host_offset != posn->host_offset) {
 		priv->host_offset = posn->host_offset;
 		wake_up(&priv->trace_sleep);
-- 
2.36.1

