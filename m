Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ACC22B1200
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3E56189B;
	Thu, 12 Nov 2020 23:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3E56189B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605221151;
	bh=HST3sPB1gwgaiboOLXPQtj9JXC0/Vmi8wAS1EZx43sY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNWW9dS7ZB9zVI6Kcs8cJ45WGJ/gc2nyZRIRad6tyBlD3mtHziGIT5oDFVQDLoOni
	 TpZXXygh1SlfuAyABYaDvqZSdDbLdVIBAZY7L3t7OWQbKNmU9auvGrlKh9jPDdh83j
	 JN2WxsIxXod2GSbhemNBUdlIObPpcGLkH9QUja+s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7CDDF80535;
	Thu, 12 Nov 2020 23:39:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1747DF804F2; Thu, 12 Nov 2020 23:39:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 979FCF804C2
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 979FCF804C2
IronPort-SDR: gnVmwekaNvOAJjlpOPoMD1qJFUImxZNXCfSdzAGaTf5HVS1cINnm2mT57PeV5T35LyjYA8+OCH
 /34n3jOdKbFQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885017"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885017"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:39:00 -0800
IronPort-SDR: GrVrePs9C3gxfiSsKrVBu6k/dt+lbVr5Nr7biB3aD7nWpOVrv1Wlro0ihRBuPndLq61oiSJrp8
 2Rb+GtBztonQ==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797501"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:59 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/14] ASoC: Intel: catpt: add dynamic selection of DSP driver
Date: Thu, 12 Nov 2020 16:38:23 -0600
Message-Id: <20201112223825.39765-13-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

Follow PCI example and stop the probe when another driver is desired
for the same ACPI HID.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/intel/Kconfig        |  1 +
 sound/soc/intel/catpt/device.c | 12 ++++++++++++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 4e9f910751a9..051687d97039 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -24,6 +24,7 @@ config SND_SOC_INTEL_CATPT
 	depends on DMADEVICES && SND_DMA_SGBUF
 	select DW_DMAC_CORE
 	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_INTEL_DSP_CONFIG
 	help
 	  Enable support for Intel(R) Haswell and Broadwell platforms
 	  with I2S codec present. This is a recommended option.
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index a70179959795..613585c3016f 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -19,6 +19,7 @@
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <sound/intel-dsp-config.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
@@ -239,9 +240,20 @@ static int catpt_acpi_probe(struct platform_device *pdev)
 	const struct catpt_spec *spec;
 	struct catpt_dev *cdev;
 	struct device *dev = &pdev->dev;
+	const struct acpi_device_id *id;
 	struct resource *res;
 	int ret;
 
+	id = acpi_match_device(dev->driver->acpi_match_table, dev);
+	if (!id)
+		return -ENODEV;
+
+	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
+		dev_dbg(dev, "CATPT ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
 	spec = device_get_match_data(dev);
 	if (!spec)
 		return -ENODEV;
-- 
2.25.1

