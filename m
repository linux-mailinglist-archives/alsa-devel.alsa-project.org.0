Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 054EB545F5D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:37:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B81E1FF0;
	Fri, 10 Jun 2022 10:37:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B81E1FF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850278;
	bh=9TZmitV6e773p8c1DJyB7y/7VSXcFg1xpOC8mPkosas=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ImhVHKr07UJb++2UoGyjlKvlNhRTOCKt9Bni+6PsB+RxziSQx4k1+mrURu/EPyjwa
	 75Yrj9U34YBZCsNJANznWf/T0q+NVFUJA99SAG9iMHQyfk/CeNszr5dnCz7Tv3FEIF
	 WY4QxQmktTavL/3ePDUdOb8CgrG8EDRXCniMDCMs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40FF7F8053D;
	Fri, 10 Jun 2022 10:35:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 475CDF804DA; Fri, 10 Jun 2022 10:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA0ACF80520
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA0ACF80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HMnvAQyR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850126; x=1686386126;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9TZmitV6e773p8c1DJyB7y/7VSXcFg1xpOC8mPkosas=;
 b=HMnvAQyR/RcuFVZsgYIA2DFtIx1+8l3FhrAfaUA8pPcLDQ+Ze1QyOXlx
 XCXHoN19CKspAv9p15rSgKFT9IWfp6JgViizx4mie37bAfscpNtB+t6WZ
 p+B4leIFotRPQlkZ1xYlQ9lNodTTqvIBHZdt4LNnHXqFQUGqszNHHCRNw
 08AJIb0CLtxGE/RLYpGF8+du8pq9Y0QfjU8DOLlV51JUOMu4jw4GPm/ti
 0GyBiAnoYznAIa97ifp7KC4i2zCYtsj2ar4GkSFr2EA0m7P9d3Eci2mx3
 I3ACT51+XliEtW60UF4ydCkhrPq8edRWyBqwe8mXZLCZuAi3icWKJOgk+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936631"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936631"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:24 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020880"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 4/6] ASoC: SOF: ipc4: Add set_core_state pm_ops implementation
Date: Fri, 10 Jun 2022 11:35:47 +0300
Message-Id: <20220610083549.16773-5-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
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

IPC4 uses the SET_DX message to enable/disable cores managed by the DSP.
The dx_state.core_mask indicates which core is going to change state,
the dx_state.dx_mask is to power on (1) or off (0) the core.
In the dx_mask only those bits (cores) checked which bit is set in the
core_mask, other bits (cores) ignored.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/ipc4/header.h |  8 ++++++++
 sound/soc/sof/ipc4.c            | 26 ++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/sound/sof/ipc4/header.h b/include/sound/sof/ipc4/header.h
index b8b8e5b5e3e1..a795deacc2ea 100644
--- a/include/sound/sof/ipc4/header.h
+++ b/include/sound/sof/ipc4/header.h
@@ -385,6 +385,14 @@ struct sof_ipc4_fw_version {
 	uint16_t build;
 } __packed;
 
+/* Payload data for SOF_IPC4_MOD_SET_DX */
+struct sof_ipc4_dx_state_info {
+	/* core(s) to apply the change */
+	uint32_t core_mask;
+	/* core state: 0: put core_id to D3; 1: put core_id to D0 */
+	uint32_t dx_mask;
+} __packed __aligned(4);
+
 /* Reply messages */
 
 /*
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 658802c86685..b2cb92745ec6 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -597,10 +597,36 @@ static void sof_ipc4_rx_msg(struct snd_sof_dev *sdev)
 	}
 }
 
+static int sof_ipc4_set_core_state(struct snd_sof_dev *sdev, int core_idx, bool on)
+{
+	struct sof_ipc4_dx_state_info dx_state;
+	struct sof_ipc4_msg msg;
+
+	dx_state.core_mask = BIT(core_idx);
+	if (on)
+		dx_state.dx_mask = BIT(core_idx);
+	else
+		dx_state.dx_mask = 0;
+
+	msg.primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_MOD_SET_DX);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_MODULE_MSG);
+	msg.extension = 0;
+	msg.data_ptr = &dx_state;
+	msg.data_size = sizeof(dx_state);
+
+	return sof_ipc4_tx_msg(sdev, &msg, msg.data_size, NULL, 0, false);
+}
+
+static const struct sof_ipc_pm_ops ipc4_pm_ops = {
+	.set_core_state = sof_ipc4_set_core_state,
+};
+
 const struct sof_ipc_ops ipc4_ops = {
 	.tx_msg = sof_ipc4_tx_msg,
 	.rx_msg = sof_ipc4_rx_msg,
 	.set_get_data = sof_ipc4_set_get_data,
 	.get_reply = sof_ipc4_get_reply,
+	.pm = &ipc4_pm_ops,
 	.fw_loader = &ipc4_loader_ops,
 };
-- 
2.36.1

