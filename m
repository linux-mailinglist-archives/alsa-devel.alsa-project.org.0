Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12B53F156
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 23:04:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C32F61B4E;
	Mon,  6 Jun 2022 23:03:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C32F61B4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654549448;
	bh=rZxsCW2pyx3YV8zgwUEVyc5u2163ejubHWDdrZDbcHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c5ZSOio88DWCa0W2yMnTx3PP40O7qPsXzwT3rk7QW4e7MetqpNZ6Ej5t74cF5b3VT
	 ea6J9jE6Yvbmm5YtQhSDAhyBSjciVWe48hitVIOExGnmXb3wZBMvX6vtsCLMiU8T/T
	 uR6uhfrHYxMCScG9vkFdn3vJSvKxrbtvp9JHEacI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECC1BF80526;
	Mon,  6 Jun 2022 23:02:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1562DF80520; Mon,  6 Jun 2022 23:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70DAEF80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 23:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70DAEF80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X921M3nF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654549355; x=1686085355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rZxsCW2pyx3YV8zgwUEVyc5u2163ejubHWDdrZDbcHI=;
 b=X921M3nFf5YFtcniL/daT/gEx1WpCSEjrxofuftOAFtOCKSDwNzifjaz
 ib71XpbUaM9EINmx2SYE0+VnHeDHj7sdQ4MW6uVopqF9xDqd5lWogEIdb
 Yic8c13hNgpFzS6Ri5F55aIpR/cLhqmIeHCJbOI83c2sBnqZ7nCqvGZw4
 Tit+V3v/PZcTbK4VARzUcSW6n/fjeks1yyeenJw58oaVZX+s4S7eGSiGy
 kad6d3S3qFZh2YoDzwwkeZoRy9lNk12m9s19BxFLj/3ze3OBbxxDQMIjf
 loYG0zv8Y4UkAMIr3HoiRZbxcaIaStojKOS03ClZJp6cqGFFyG8Fu8gbs Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275467621"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="275467621"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:28 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="608914447"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 14:02:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: amd: Add SOF pm ops callback for Renoir
Date: Mon,  6 Jun 2022 16:02:08 -0500
Message-Id: <20220606210212.146626-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
References: <20220606210212.146626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
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

Add SOF PM ops callback in renoir dsp ops to power off and on ACP
IP block during system suspend and resume on Renoir platform.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  2 ++
 sound/soc/sof/amd/acp.c            | 36 ++++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h            |  4 ++++
 sound/soc/sof/amd/pci-rn.c         |  4 ++++
 sound/soc/sof/amd/renoir.c         |  4 ++++
 5 files changed, 50 insertions(+)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 40fbf11facba5..56cefd4a84fcd 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -46,12 +46,14 @@
 #define ACPAXI2AXI_ATU_BASE_ADDR_GRP_8		0xC3C
 #define ACPAXI2AXI_ATU_CTRL			0xC40
 #define ACP_SOFT_RESET				0x1000
+#define ACP_CONTROL				0x1004
 
 #define ACP_I2S_PIN_CONFIG			0x1400
 
 /* Registers from ACP_PGFSM block */
 #define ACP_PGFSM_CONTROL			0x141C
 #define ACP_PGFSM_STATUS			0x1420
+#define ACP_CLKMUX_SEL				0x1424
 
 /* Registers from ACP_INTR block */
 #define ACP_EXTERNAL_INTR_ENB			0x1800
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 0c272573df979..c40d2900dd36d 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -413,10 +413,46 @@ static int acp_init(struct snd_sof_dev *sdev)
 		dev_err(sdev->dev, "ACP power on failed\n");
 		return ret;
 	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, 0x01);
 	/* Reset */
 	return acp_reset(sdev);
 }
 
+int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state)
+{
+	int ret;
+
+	ret = acp_reset(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "ACP Reset failed\n");
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CONTROL, 0x00);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS(amd_sof_acp_suspend, SND_SOC_SOF_AMD_COMMON);
+
+int amd_sof_acp_resume(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	ret = acp_init(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "ACP Init failed\n");
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_CLKMUX_SEL, 0x03);
+
+	ret = acp_memory_init(sdev);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(amd_sof_acp_resume, SND_SOC_SOF_AMD_COMMON);
+
 int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 291b44c54bcc2..4c42b8fd6abf1 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -216,6 +216,10 @@ int acp_sof_trace_init(struct snd_sof_dev *sdev, struct snd_dma_buffer *dmab,
 		       struct sof_ipc_dma_trace_params_ext *dtrace_params);
 int acp_sof_trace_release(struct snd_sof_dev *sdev);
 
+/* PM Callbacks */
+int amd_sof_acp_suspend(struct snd_sof_dev *sdev, u32 target_state);
+int amd_sof_acp_resume(struct snd_sof_dev *sdev);
+
 struct sof_amd_acp_desc {
 	unsigned int host_bridge_id;
 };
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index d5d9bcc2c997d..3a7fed25a2267 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -49,6 +49,7 @@ static const struct sof_amd_acp_desc renoir_chip_info = {
 
 static const struct sof_dev_desc renoir_desc = {
 	.machines		= snd_soc_acpi_amd_sof_machines,
+	.use_acpi_target_states	= true,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
@@ -166,6 +167,9 @@ static struct pci_driver snd_sof_pci_amd_rn_driver = {
 	.id_table = rn_pci_ids,
 	.probe = acp_pci_rn_probe,
 	.remove = acp_pci_rn_remove,
+	.driver = {
+		.pm = &sof_pci_pm,
+	},
 };
 module_pci_driver(snd_sof_pci_amd_rn_driver);
 
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
index 70190365328ce..9261c8bc2236d 100644
--- a/sound/soc/sof/amd/renoir.c
+++ b/sound/soc/sof/amd/renoir.c
@@ -173,6 +173,10 @@ struct snd_sof_dsp_ops sof_renoir_ops = {
 	/* Trace Logger */
 	.trace_init		= acp_sof_trace_init,
 	.trace_release		= acp_sof_trace_release,
+
+	/* PM */
+	.suspend                = amd_sof_acp_suspend,
+	.resume                 = amd_sof_acp_resume,
 };
 EXPORT_SYMBOL(sof_renoir_ops);
 
-- 
2.34.1

