Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D228C50A67B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8703316AE;
	Thu, 21 Apr 2022 18:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8703316AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650560423;
	bh=YV0I0M0iaF3C53P4Ef62Uqf9Z32c4wgPjxGfmoQIxB0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRRkghc7FxFMOzEx59Nx//uz1iPcrE0FfRanB5Os2ZQCMTU+Xu5l3FStv393HUakZ
	 UzIPces3kAU6BAyNmbifn9yZAvMaAFvuF90ZHpu80ee8B61XRT7GUUB5ujRiFruxMS
	 crFuGH+t7eYwOBnPzd6SLCsIaSjvdMWDvCFYk6Iw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C77BBF804FE;
	Thu, 21 Apr 2022 18:58:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DCA88F80125; Thu, 21 Apr 2022 18:58:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8043DF8032D
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:58:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8043DF8032D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="RpixAtlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650560319; x=1682096319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YV0I0M0iaF3C53P4Ef62Uqf9Z32c4wgPjxGfmoQIxB0=;
 b=RpixAtlfTlPcnJkESl1yc4qB7pknZIPvVnLN8SuErqi+/nfTRfb8mS1d
 ZrwpvvqBcgcRYBITwmteOudr2EsQtqJmCn5Is9jko/7EKMNfsTiuOU9Oe
 3mgRkzKM3bbnOH0KTyg35LP9rOx1dU2ZdM9FG1wE15RukUgD6FvsRt1Rn
 jPn5W84LBxRBw3WMPfu170E5uxN8Fod1XwQMBJOqHLzzdTTQ6hmJpQKqW
 PGb4hwu79dIxP/MA6LLcnpQaMB1TLghzzVqyI2I3r1cvqzu+yK82kZndP
 ABxLinNyo7sNVZ3YSujshhwDGNmGR6Fo9MaToPrvLWavBseWVWvNSMxYf Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246317738"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="246317738"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:58:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="530390030"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:58:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/2] ASoC: SOF: amd: Use dedicated MBOX for ACP and PSP
 communication
Date: Thu, 21 Apr 2022 11:58:20 -0500
Message-Id: <20220421165820.337207-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
References: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

We are currently using generic PSP Mailbox register for sending SHA
complete command to PSP but observe random arbitration issue during
PSP validation as MP0_C2PMSG_26_REG used by other kernel modules.

Use separate mailbox registers and doorbell mechanism to send SHA_DMA
complete command to PSP. This fixes such validation issues and added
flexibility for sending more ACP commands to PSP in future as new mbox
registers i.e MP0_C2PMSG_114_REG and MP0_C2PMSG_73_REG are dedicated
by PSP for ACP communications.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 24 +++++++++++++++++++++---
 sound/soc/sof/amd/acp.h |  6 ++++--
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 8e88ae597fb88..0c272573df979 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -152,7 +152,7 @@ static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 
 	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
 		msleep(20);
-		smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
+		smn_read(adata->smn_dev, MP0_C2PMSG_114_REG, &data);
 		if (data & MBOX_READY_MASK)
 			return 0;
 	}
@@ -173,17 +173,35 @@ static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 
 static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
 {
-	int ret;
+	struct snd_sof_dev *sdev = adata->dev;
+	int ret, timeout;
+	u32 data;
 
 	if (!cmd)
 		return -EINVAL;
 
+	/* Get a non-zero Doorbell value from PSP */
+	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
+		msleep(MBOX_DELAY);
+		smn_read(adata->smn_dev, MP0_C2PMSG_73_REG, &data);
+		if (data)
+			break;
+	}
+
+	if (!timeout) {
+		dev_err(sdev->dev, "Failed to get Doorbell from MBOX %x\n", MP0_C2PMSG_73_REG);
+		return -EINVAL;
+	}
+
 	/* Check if PSP is ready for new command */
 	ret = psp_mbox_ready(adata, 0);
 	if (ret)
 		return ret;
 
-	smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, cmd);
+	smn_write(adata->smn_dev, MP0_C2PMSG_114_REG, cmd);
+
+	/* Ring the Doorbell for PSP */
+	smn_write(adata->smn_dev, MP0_C2PMSG_73_REG, data);
 
 	/* Check MBOX ready as PSP ack */
 	ret = psp_mbox_ready(adata, 1);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index ca69b4969ca22..de526a1bce131 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -57,8 +57,10 @@
 #define ACP_SHA_STAT				0x8000
 #define ACP_PSP_TIMEOUT_COUNTER			5
 #define ACP_EXT_INTR_ERROR_STAT			0x20000000
-#define MP0_C2PMSG_26_REG			0x03810570
-#define MBOX_ACP_SHA_DMA_COMMAND		0x330000
+#define MP0_C2PMSG_114_REG			0x3810AC8
+#define MP0_C2PMSG_73_REG			0x3810A24
+#define MBOX_ACP_SHA_DMA_COMMAND		0x70000
+#define MBOX_DELAY				1000
 #define MBOX_READY_MASK				0x80000000
 #define MBOX_STATUS_MASK			0xFFFF
 
-- 
2.30.2

