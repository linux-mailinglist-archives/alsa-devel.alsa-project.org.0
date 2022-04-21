Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C482450A672
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 19:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 612831680;
	Thu, 21 Apr 2022 18:59:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 612831680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650560412;
	bh=7NVTujoxKPsisklg27RWMMOBecNRQk4Dakx0qxFgzqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MSpXIoESQwU9iZ/fa7fIksLjPCaatckx6ftoJ2HjDi0//UNxiK5ZTIb5UkryyghXI
	 HYEOyHjKEWjtCugfQ1I+40l8KhswMggK5RbWSz56cbojUN0A4D/dTvp5BMMAmt3vzP
	 lVz85nB2GQSDvPlLyxI7AdEjzOzOoKaQOxrUqDzg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 46D94F80125;
	Thu, 21 Apr 2022 18:58:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C7582F804C1; Thu, 21 Apr 2022 18:58:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4EAEF80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:58:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4EAEF80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="eu4P3Cgw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650560319; x=1682096319;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7NVTujoxKPsisklg27RWMMOBecNRQk4Dakx0qxFgzqk=;
 b=eu4P3CgwT35FtTDHK8VUuI98P501KlsdT7dtsCEUeV6HPvUAT4cg0vUf
 S4MbL8ULxLVFi1P6obmUGUGph1Be4utavKqBlTn+S/GbHQ64WeDd7Rcwd
 wjbUG76Qm3DU7j/t5wn0kOiTLU57whMIfYYrDA0V4zQ3u0yCi+QRy5044
 hauBPovjKdi1Rhx+BlF97i9+/qVmufzeuxNiHI15WJGZYr/oW3MWpk6Dm
 cebrGCVQKB59E/TNWgkZsl3/kcKvnOfnhztFS5Bo0b8RvD2JclwdVwWcT
 0aiI+lxXT/3IKKf6XXUparK4HnNlmdU+do7uIU6Ap8rz+Zso3edV217DC g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246317732"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="246317732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:58:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="530390028"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:58:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/2] ASoC: SOF: amd: Add psp_mbox_ready() and
 psp_send_cmd() callback
Date: Thu, 21 Apr 2022 11:58:19 -0500
Message-Id: <20220421165820.337207-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
References: <20220421165820.337207-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

We need to ensure if PSP is mbox ready before and after sending cmd
to PSP over SMN interface. Add method to check MBOX_READY bit of PSP
with some delay over ACP_PSP_TIMEOUT_COUNTER. Replace psp_fw_validate
with new method psp_send_cmd() to send command via psp mailbox.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 46 +++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 71d71c152342a..8e88ae597fb88 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -138,14 +138,18 @@ int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
 	return ret;
 }
 
-static int psp_fw_validate(struct acp_dev_data *adata)
+/*
+ * psp_mbox_ready- function to poll ready bit of psp mbox
+ * @adata: acp device data
+ * @ack: bool variable to check ready bit status or psp ack
+ */
+
+static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 {
 	struct snd_sof_dev *sdev = adata->dev;
 	int timeout;
 	u32 data;
 
-	smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, MBOX_ACP_SHA_DMA_COMMAND);
-
 	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
 		msleep(20);
 		smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
@@ -153,8 +157,38 @@ static int psp_fw_validate(struct acp_dev_data *adata)
 			return 0;
 	}
 
-	dev_err(sdev->dev, "FW validation timedout: status %x\n", data & MBOX_STATUS_MASK);
-	return -ETIMEDOUT;
+	dev_err(sdev->dev, "PSP error status %x\n", data & MBOX_STATUS_MASK);
+
+	if (ack)
+		return -ETIMEDOUT;
+
+	return -EBUSY;
+}
+
+/*
+ * psp_send_cmd - function to send psp command over mbox
+ * @adata: acp device data
+ * @cmd: non zero integer value for command type
+ */
+
+static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
+{
+	int ret;
+
+	if (!cmd)
+		return -EINVAL;
+
+	/* Check if PSP is ready for new command */
+	ret = psp_mbox_ready(adata, 0);
+	if (ret)
+		return ret;
+
+	smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, cmd);
+
+	/* Check MBOX ready as PSP ack */
+	ret = psp_mbox_ready(adata, 1);
+
+	return ret;
 }
 
 int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
@@ -196,7 +230,7 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return ret;
 	}
 
-	ret = psp_fw_validate(adata);
+	ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
 	if (ret)
 		return ret;
 
-- 
2.30.2

