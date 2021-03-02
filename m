Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B8732956F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:34:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D535169A;
	Tue,  2 Mar 2021 01:33:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D535169A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645263;
	bh=r9M/0VtHR2KZZWHCJdyWRB1K6m5+NR3vCuCPbI4qxIA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dzF68yqOHQ+SEXxmCbPJUHWvgOzpTjr9enKWMwqYtwtCt7amLk6evY5tFFisoDKWr
	 QciWWFrviqp3LCXn0jUIwjVsb7en9eWYHvNKcLsTdIfg0nP6XCFz8HUgfPnYqkAeiK
	 y5Ava1AibyEtNkD9Yt4ieW83quMJXTAFUDNpnXbA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5207F802E0;
	Tue,  2 Mar 2021 01:31:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEE67F8049C; Tue,  2 Mar 2021 01:31:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6E39F8025E
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6E39F8025E
IronPort-SDR: Jtykpv2dYqVLpSihDU8HNFoTTcBsJwbyKPYNj/z0G7jkoAju34oX5D/fMODAN1C8Ob1k7wcq9M
 uFK2t/ucU7CQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048789"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048789"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:44 -0800
IronPort-SDR: 0+UFhUompKZkf4nzhwhzmok1dTr0jekqFBgaoGWhUIZIiW2Vxs6LlBsEuDpocPqfXHVRxMh/Di
 AOUbR4Alcoqw==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512580"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/7] ASoC: SOF: pci: move DSP_CONFIG use to platform-specific
 drivers
Date: Mon,  1 Mar 2021 18:31:22 -0600
Message-Id: <20210302003125.1178419-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

There is no reason why we should call the intel_dspcfg helpers from
common code, this should be moved in Intel-specific code and only
called from platforms where a conflict may occur with the HDaudio or
SST/Skylake driver.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/intel/hda.c     | 17 +++++++++++++++++
 sound/soc/sof/intel/hda.h     |  3 +++
 sound/soc/sof/intel/pci-apl.c |  2 +-
 sound/soc/sof/intel/pci-cnl.c |  2 +-
 sound/soc/sof/intel/pci-icl.c |  2 +-
 sound/soc/sof/intel/pci-tgl.c |  2 +-
 sound/soc/sof/sof-pci-dev.c   |  8 --------
 7 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 25b799f0accc..2b2829655bfb 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -22,10 +22,12 @@
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_intel.h>
+#include <sound/intel-dsp-config.h>
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include "../sof-audio.h"
+#include "../sof-pci-dev.h"
 #include "../ops.h"
 #include "hda.h"
 
@@ -1256,7 +1258,22 @@ void hda_machine_select(struct snd_sof_dev *sdev)
 		dev_warn(sdev->dev, "warning: No matching ASoC machine driver found\n");
 }
 
+int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
+{
+	int ret;
+
+	ret = snd_intel_dsp_driver_probe(pci);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
+		dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
+	return sof_pci_probe(pci, pci_id);
+}
+EXPORT_SYMBOL_NS(hda_pci_intel_probe, SND_SOC_SOF_INTEL_HDA_COMMON);
+
 MODULE_LICENSE("Dual BSD/GPL");
+MODULE_IMPORT_NS(SND_SOC_SOF_PCI_DEV);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC);
 MODULE_IMPORT_NS(SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index d1c38c37bc9d..7c7579daee7f 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -764,4 +764,7 @@ void hda_machine_select(struct snd_sof_dev *sdev);
 void hda_set_mach_params(const struct snd_soc_acpi_mach *mach,
 			 struct device *dev);
 
+/* PCI driver selection and probe */
+int hda_pci_intel_probe(struct pci_dev *pci, const struct pci_device_id *pci_id);
+
 #endif
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index e83ddbaafa29..f89e746c2570 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -67,7 +67,7 @@ MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 static struct pci_driver snd_sof_pci_intel_apl_driver = {
 	.name = "sof-audio-pci-intel-apl",
 	.id_table = sof_pci_ids,
-	.probe = sof_pci_probe,
+	.probe = hda_pci_intel_probe,
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index f974d3a77217..f23257adf2ab 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -90,7 +90,7 @@ MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 static struct pci_driver snd_sof_pci_intel_cnl_driver = {
 	.name = "sof-audio-pci-intel-cnl",
 	.id_table = sof_pci_ids,
-	.probe = sof_pci_probe,
+	.probe = hda_pci_intel_probe,
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index d5d7cefa6ef9..2f60c28ae81f 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -70,7 +70,7 @@ MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 static struct pci_driver snd_sof_pci_intel_icl_driver = {
 	.name = "sof-audio-pci-intel-icl",
 	.id_table = sof_pci_ids,
-	.probe = sof_pci_probe,
+	.probe = hda_pci_intel_probe,
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index d35c25a450aa..485607471181 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -106,7 +106,7 @@ MODULE_DEVICE_TABLE(pci, sof_pci_ids);
 static struct pci_driver snd_sof_pci_intel_tgl_driver = {
 	.name = "sof-audio-pci-intel-tgl",
 	.id_table = sof_pci_ids,
-	.probe = sof_pci_probe,
+	.probe = hda_pci_intel_probe,
 	.remove = sof_pci_remove,
 	.shutdown = sof_pci_shutdown,
 	.driver = {
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index cfcbd9754c03..b842a414e1df 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -13,7 +13,6 @@
 #include <linux/module.h>
 #include <linux/pci.h>
 #include <linux/pm_runtime.h>
-#include <sound/intel-dsp-config.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include <sound/sof.h>
@@ -120,13 +119,6 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	const struct snd_sof_dsp_ops *ops;
 	int ret;
 
-	if (IS_REACHABLE(CONFIG_SND_INTEL_DSP_CONFIG)) {
-		ret = snd_intel_dsp_driver_probe(pci);
-		if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SOF) {
-			dev_dbg(&pci->dev, "SOF PCI driver not selected, aborting probe\n");
-			return -ENODEV;
-		}
-	}
 	dev_dbg(&pci->dev, "PCI DSP detected");
 
 	/* get ops for platform */
-- 
2.25.1

