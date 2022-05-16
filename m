Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F26DA528286
	for <lists+alsa-devel@lfdr.de>; Mon, 16 May 2022 12:49:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70153167A;
	Mon, 16 May 2022 12:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70153167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652698145;
	bh=slIqjPWW+Rd6+alkrS9Z+VVatgFw4UUPxCLZE+uVPtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fsmckzOOeLZWob1GVMyijfv+YiRnG0bGV2I/bPuxnHMcOWQV8EVpTCmxNrNiBJeWa
	 JEt6DChTyTp/kNyypUkincnl15LIzKgkiI6VbkTpstnLNlyeE9mcCRCp2nqo8h9psa
	 MkFSUuJnAm4vVqmvkQKP3iSwQ5pFdta6XP2m55+I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28140F802DF;
	Mon, 16 May 2022 12:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AC8EF802DF; Mon, 16 May 2022 12:47:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D3CC9F8012F
 for <alsa-devel@alsa-project.org>; Mon, 16 May 2022 12:47:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D3CC9F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="BZ//2KvU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652698045; x=1684234045;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=slIqjPWW+Rd6+alkrS9Z+VVatgFw4UUPxCLZE+uVPtU=;
 b=BZ//2KvU7RMqHSkdWbEuFVITqCongPvlvacze4OUfoXgR5dXaTCGa2kW
 VhWbvGdUrDoIYpRmb3OFCVJXvZqJ56zQ9GnZ9KWVAsy2qSvIlUYqKgdDa
 ZMcvwcUHHayjJEN309hwQsF/JrlKffLkZIU8WbmZUmGFOg/31DM3UUwPL
 AE2uAdVqrIIwxa2+vFfMQU9TCWMAjmNh4Mx/XloaptPWHThABCJl3+c03
 RD5xZKHmBT7QcqQGKGWliWxdaTLrP0BUaImi4LtQmS7U5aTK4PlkQS1Vh
 f4/GeuRKnD9yTSWBEnMaCuW/M/gfAsXPwAEZWnmQ59+NkGELK9U1itvLM g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10348"; a="333853234"
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="333853234"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:49 -0700
X-IronPort-AV: E=Sophos;i="5.91,229,1647327600"; d="scan'208";a="596459727"
Received: from afialcko-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.51.55])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 May 2022 03:46:47 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 AjitKumar.Pandey@amd.com
Subject: [PATCH 1/8] ASoC: SOF: Introduce IPC independent ops for firmware
 tracing support
Date: Mon, 16 May 2022 13:47:04 +0300
Message-Id: <20220516104711.26115-2-peter.ujfalusi@linux.intel.com>
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

The current (dma-)trace is only supported with IPC3, it is not available
when IPC4 is used.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/sof-priv.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 8ea196305e4b..a7ffb6ecf332 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -357,6 +357,22 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+/**
+ * struct sof_ipc_fw_tracing_ops - IPC-specific firmware tracing ops
+ * @init:	Function pointer for initialization of the tracing
+ * @free:	Optional function pointer for freeing of the tracing
+ * @fw_crashed:	Optional function pointer to notify the tracing of a firmware crash
+ * @suspend:	Function pointer for system/runtime suspend
+ * @resume:	Function pointer for system/runtime resume
+ */
+struct sof_ipc_fw_tracing_ops {
+	int (*init)(struct snd_sof_dev *sdev);
+	void (*free)(struct snd_sof_dev *sdev);
+	void (*fw_crashed)(struct snd_sof_dev *sdev);
+	void (*suspend)(struct snd_sof_dev *sdev, pm_message_t pm_state);
+	int (*resume)(struct snd_sof_dev *sdev);
+};
+
 /**
  * struct sof_ipc_pm_ops - IPC-specific PM ops
  * @ctx_save:		Function pointer for context save
@@ -395,6 +411,7 @@ struct sof_ipc_pcm_ops;
  * @pm:		Pointer to PM ops
  * @pcm:	Pointer to PCM ops
  * @fw_loader:	Pointer to Firmware Loader ops
+ * @fw_tracing:	Pointer to Firmware tracing ops
  *
  * @tx_msg:	Function pointer for sending a 'short' IPC message
  * @set_get_data: Function pointer for set/get data ('large' IPC message). This
@@ -415,6 +432,7 @@ struct sof_ipc_ops {
 	const struct sof_ipc_pm_ops *pm;
 	const struct sof_ipc_pcm_ops *pcm;
 	const struct sof_ipc_fw_loader_ops *fw_loader;
+	const struct sof_ipc_fw_tracing_ops *fw_tracing;
 
 	int (*tx_msg)(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		      void *reply_data, size_t reply_bytes, bool no_pm);
-- 
2.36.1

