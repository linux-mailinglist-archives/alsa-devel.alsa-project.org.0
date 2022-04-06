Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E62254F6A2E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Apr 2022 21:42:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 128A91722;
	Wed,  6 Apr 2022 21:42:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 128A91722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649274172;
	bh=JMUwfmeKqzPOF+p5Fn2fUlc0g7MltptKQmzMhy3IwuI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eXhQ76168xKHbtxNDzw/+A8XZrOhWB+NzCevgDtpE8yBmtMOu0HoUdAr9R9wPAQNC
	 woKcmUi0z2T4YowK4DzuD0KB87PmXslFR1PdVsWOkFbTGf+BRYBZYiFOvwwi6bpfq5
	 9IEdQDgbBiOgZFlpuloPWiBwwEUDYBad0vECbxxU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B703F80141;
	Wed,  6 Apr 2022 21:41:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E368F80518; Wed,  6 Apr 2022 21:41:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC373F8019B
 for <alsa-devel@alsa-project.org>; Wed,  6 Apr 2022 21:41:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC373F8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Jd2XeiHu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649274068; x=1680810068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JMUwfmeKqzPOF+p5Fn2fUlc0g7MltptKQmzMhy3IwuI=;
 b=Jd2XeiHu5Z95p/1rvhfJg7dNSzkgMinte8I4NaLwHvmOAUOKYRnmo1BK
 W/MjluP9uBUN3hefTuzq8fBu08Hy3RuTvA85jYsb3zukfMZjZfiHmw63l
 XTNWjdXL7FJvKu6DI55jfaJAzfipSLAktxOX89U4DEHk2OGMw8C5RVx5H
 75Wdhh02giMY/bib7xzU647XwMsRweNc2c63WVWaBeUOvkDX399eQmZX/
 84U5IXfDYvDFnZGobxQEtQHBvsLHU/8HDZKbOtLB/wLvD6lDNdnm+MD7g
 eSqs1uochm2eNKnZXH+wvg6vaWy/a0lCnCsujYXO7UQZsvcd0nrcCl2mJ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="347582620"
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="347582620"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,240,1643702400"; d="scan'208";a="570713313"
Received: from cbok-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.137.86])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 12:41:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/4] ASoC: SOF: amd: Add psp_mbox_ready() and psp_send_cmd()
 callback
Date: Wed,  6 Apr 2022 14:40:47 -0500
Message-Id: <20220406194048.289787-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
References: <20220406194048.289787-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/amd/acp.c | 47 +++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 71d71c152342..461f9b0ce49e 100644
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
@@ -153,8 +157,39 @@ static int psp_fw_validate(struct acp_dev_data *adata)
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
+	struct snd_sof_dev *sdev = adata->dev;
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
@@ -196,7 +231,7 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return ret;
 	}
 
-	ret = psp_fw_validate(adata);
+	ret = psp_send_cmd(adata, MBOX_ACP_SHA_DMA_COMMAND);
 	if (ret)
 		return ret;
 
-- 
2.30.2

