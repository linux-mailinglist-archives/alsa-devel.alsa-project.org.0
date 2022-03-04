Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BD24CDEEE
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:59:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE59E1F64;
	Fri,  4 Mar 2022 21:59:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE59E1F64
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646427598;
	bh=/CrtTBpUSmCpKf1lL978G3wDpXv6ly7B9bzjmrbaO9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DDUIGcIQkQBvWCVy2hjVTVkmkx5dNloRvXx68FJt9G3yXjjarSlQOYzlBg2HTkkgi
	 MsiMfDULT8qpqC65owAhhnEjnhrs3Nn9gfGgnunN5bOMR+qwSZ+Aab4D0ijnJO8yrY
	 QHjH7B7HK+CvNAazPAyI6uxSbtxFld3+UPOgIeNA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82CE2F80519;
	Fri,  4 Mar 2022 21:57:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BEBA2F8051C; Fri,  4 Mar 2022 21:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E05B0F80139
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E05B0F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZRZ6GPHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646427470; x=1677963470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/CrtTBpUSmCpKf1lL978G3wDpXv6ly7B9bzjmrbaO9Y=;
 b=ZRZ6GPHRRq73lcawd8HUpOZg0zzpaEOb21JuDRGpn4ghpWgeE5T5rQEV
 IlVhIAuKGOXs+b947T+xZWCepmr0JcrS883o8dlDrqHN0V97ub5c3bkzj
 0kv43ha1JgsxN2kUXTXeNZtDR2mcmn0yOoC4X4JnSrj457F2l1dmcwVd2
 jMtBVBzdvjKjfLvVJEg98HyKuRtfZdBZvfamhzfOuqYoHWnlsMrz244jH
 mc82+LYVUlqQPEDKada77m2X5cWCmKFQjUiJ7bjpKvthCw9psr4T4qVaG
 H0an0RdAm9kHFKeEJxAMm6NhPnsA14YvfLHOgZXpxOSMZ8d4Q1F+VI2KR A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340492551"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="340492551"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:44 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="631271290"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:57:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/10] ASoC: SOF: amd: Use semaphore register to synchronize
 ipc's irq
Date: Fri,  4 Mar 2022 14:57:28 -0600
Message-Id: <20220304205733.62233-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
References: <20220304205733.62233-1-pierre-louis.bossart@linux.intel.com>
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

Add lock and unlock around ipc irq handling code using hw semaphore
register that exhibit special property for register read calls. As
host and DSP firmware uses few shared registers, there is a possible
race condition around those shared registers values. This lock ensure
synchronization between Firmware and host ipc interrupts.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  1 +
 sound/soc/sof/amd/acp-ipc.c        | 14 ++++++++++++++
 sound/soc/sof/amd/acp.c            | 15 ++++++++++++++-
 sound/soc/sof/amd/acp.h            |  1 +
 4 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 63f13c111b24..40fbf11facba 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -61,6 +61,7 @@
 #define ACP_DSP_SW_INTR_STAT                    0x1818
 #define ACP_SW_INTR_TRIG                        0x181C
 #define ACP_ERROR_STATUS			0x18C4
+#define ACP_AXI2DAGB_SEM_0			0x1880
 
 /* Registers from ACP_SHA block */
 #define ACP_SHA_DSP_FW_QUALIFIER		0x1C70
diff --git a/sound/soc/sof/amd/acp-ipc.c b/sound/soc/sof/amd/acp-ipc.c
index cd5af3d85002..9fcd2535fd3b 100644
--- a/sound/soc/sof/amd/acp-ipc.c
+++ b/sound/soc/sof/amd/acp-ipc.c
@@ -62,12 +62,26 @@ int acp_sof_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
 {
 	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
 	unsigned int offset = offsetof(struct scratch_ipc_conf, sof_in_box);
+	unsigned int count = ACP_HW_SEM_RETRY_COUNT;
+
+	while (snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_AXI2DAGB_SEM_0)) {
+		/* Wait until acquired HW Semaphore Lock or timeout*/
+		count--;
+		if (!count) {
+			dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
+			return -EINVAL;
+		}
+	};
 
 	acp_mailbox_write(sdev, offset, msg->msg_data, msg->msg_size);
 	acp_ipc_host_msg_set(sdev);
 
 	/* Trigger host to dsp interrupt for the msg */
 	acpbus_trigger_host_to_dsp_swintr(adata);
+
+	/* Unlock or Release HW Semaphore */
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_AXI2DAGB_SEM_0, 0x0);
+
 	return 0;
 }
 EXPORT_SYMBOL_NS(acp_sof_ipc_send_msg, SND_SOC_SOF_AMD_COMMON);
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index fe9b7dc5bc86..ba8b6427b59f 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -273,7 +273,7 @@ static int acp_memory_init(struct snd_sof_dev *sdev)
 static irqreturn_t acp_irq_thread(int irq, void *context)
 {
 	struct snd_sof_dev *sdev = context;
-	unsigned int val;
+	unsigned int val, count = ACP_HW_SEM_RETRY_COUNT;
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT);
 	if (val & ACP_SHA_STAT) {
@@ -284,9 +284,22 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
 	if (val & ACP_DSP_TO_HOST_IRQ) {
+		while (snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_AXI2DAGB_SEM_0)) {
+			/* Wait until acquired HW Semaphore lock or timeout */
+			count--;
+			if (!count) {
+				dev_err(sdev->dev, "%s: Failed to acquire HW lock\n", __func__);
+				return IRQ_NONE;
+			}
+		};
+
 		sof_ops(sdev)->irq_thread(irq, sdev);
 		val |= ACP_DSP_TO_HOST_IRQ;
 		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT, val);
+
+		/* Unlock or Release HW Semaphore */
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_AXI2DAGB_SEM_0, 0x0);
+
 		return IRQ_HANDLED;
 	}
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 8ed4e338467f..db1030d36811 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -17,6 +17,7 @@
 
 #define ACP_DSP_BAR	0
 
+#define ACP_HW_SEM_RETRY_COUNT			10
 #define ACP_REG_POLL_INTERVAL                   500
 #define ACP_REG_POLL_TIMEOUT_US                 2000
 #define ACP_DMA_COMPLETE_TIMEOUT_US		5000
-- 
2.30.2

