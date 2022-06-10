Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C46545F52
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22CEA1FC9;
	Fri, 10 Jun 2022 10:36:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22CEA1FC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850228;
	bh=h/0cKNkrPm1Tx7gyOtfBeNx1LiIa4Zt2WhE3H0JCZC8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZXdz84HeA12NvddAP40WiVmDxIT1Fgi0aRHRtmqgnhb7IfaFReKbqCwDXfyKL07L8
	 iSdWgFOF/aOe8LVmimJVDkN1jS7wQS4fnyolSWZM5gHXhdwDFKIyHkElx2yOrtAQa2
	 /8LyBhNKEQziF+R5r2kW31pKnNZ1NOlLP8YQDPW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D55F8052F;
	Fri, 10 Jun 2022 10:35:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09CD5F8052D; Fri, 10 Jun 2022 10:35:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58730F800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58730F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U3SC6IDW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850125; x=1686386125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/0cKNkrPm1Tx7gyOtfBeNx1LiIa4Zt2WhE3H0JCZC8=;
 b=U3SC6IDWFoTiN3AFnlEun08l1WEoLfgHOP55czoJHn2xiTrz/lTByNVj
 YiHjvmVscnFZjT/gaN4ZbQtj5bN1jjBGSEN6nFlYRprADpw2B7N8Q+9t0
 9Pnpwf8j9F/7etkMDwmAWZS72IgXUsyoSe0QxV4mVhxHFzRCWphzQT0Zf
 Wj764I+BBy6Bj13KSZvRdwq11rFz+bX2Qbak3j6UeFm6WroUPUKG89+Dk
 o7A3oHGGn21/3pkNzzixuckzlf9M4LaPqD2gBBHl9DwtcnUwE2GJmk0ek
 OIDf0sSp2vpxBHG+2mMu/bxfPkWqFYO8vWG8KC89G5H/JLebyfoDbhnb8 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936613"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936613"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:22 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020863"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:20 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 3/6] ASoC: SOF: ipc3: Add set_core_state pm_ops implementation
Date: Fri, 10 Jun 2022 11:35:46 +0300
Message-Id: <20220610083549.16773-4-peter.ujfalusi@linux.intel.com>
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

IPC3 uses sof_ipc_pm_core_config message
(SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE) to enable/disable cores
managed by the DSP.
The core state is set via a single bitfield, if the bit is 1 the core
should be on, if it is 0 then it is off.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index dff5feaad370..ba81a6c490e9 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -1037,6 +1037,23 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 	ipc3_log_header(sdev->dev, "ipc rx done", hdr.cmd);
 }
 
+static int sof_ipc3_set_core_state(struct snd_sof_dev *sdev, int core_idx, bool on)
+{
+	struct sof_ipc_pm_core_config core_cfg = {
+		.hdr.size = sizeof(core_cfg),
+		.hdr.cmd = SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CORE_ENABLE,
+	};
+	struct sof_ipc_reply reply;
+
+	if (on)
+		core_cfg.enable_mask = sdev->enabled_cores_mask | BIT(core_idx);
+	else
+		core_cfg.enable_mask = sdev->enabled_cores_mask & ~BIT(core_idx);
+
+	return sof_ipc3_tx_msg(sdev, &core_cfg, sizeof(core_cfg),
+			       &reply, sizeof(reply), false);
+}
+
 static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
 	struct sof_ipc_pm_ctx pm_ctx = {
@@ -1063,6 +1080,7 @@ static int sof_ipc3_ctx_restore(struct snd_sof_dev *sdev)
 static const struct sof_ipc_pm_ops ipc3_pm_ops = {
 	.ctx_save = sof_ipc3_ctx_save,
 	.ctx_restore = sof_ipc3_ctx_restore,
+	.set_core_state = sof_ipc3_set_core_state,
 };
 
 const struct sof_ipc_ops ipc3_ops = {
-- 
2.36.1

