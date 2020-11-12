Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1B42B11F8
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:43:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D836E1863;
	Thu, 12 Nov 2020 23:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D836E1863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605221031;
	bh=lI61Awzofp7JD5eLBv3A4Gs7SFPL59dS/EjSDT+6uPY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VRqvv0a8Gw/YSZizyO7j4PAqkjxHCPjUCzQeYBtl8HYwQI4eIJjVI+XIWGOkSOeST
	 GsyzCO4f1i2BY/1qrKUKGYPNFFtSHXBMpL8uNiWQfLY+PEnu0CBudBfaTzAI60hyhj
	 z78Byq2hzt9+VPmq43WxYiVsYCn/kVtKVRDj4Ogw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17F85F80507;
	Thu, 12 Nov 2020 23:39:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BB11F804BD; Thu, 12 Nov 2020 23:39:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 44C99F804BD
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:38:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44C99F804BD
IronPort-SDR: p6sSE2dGR8PvHnA6enf6gPY0qjtcw0Jonk5Yb2ZNu/PWhKgpSDmW3zMtzLPOnxtOS3Gp8IaHBN
 hpZ50lrQfNbQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885008"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885008"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:57 -0800
IronPort-SDR: 2l2UZvmnZfSU+YZQtAgukKOf9pGMugq65TnFR4IST1I+2aaOQ6ZBNv5pD0vwwiPOpCpKNO+9zl
 7dkQ2LX6ucYw==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797491"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:38:56 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 08/14] ASoC: Intel: Atom: add dynamic selection of DSP driver
Date: Thu, 12 Nov 2020 16:38:19 -0600
Message-Id: <20201112223825.39765-9-pierre-louis.bossart@linux.intel.com>
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
 sound/soc/intel/Kconfig             | 1 +
 sound/soc/intel/atom/sst/sst_acpi.c | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index a5b446d5af19..4e9f910751a9 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -55,6 +55,7 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 	depends on X86 && ACPI && PCI
 	select SND_SST_ATOM_HIFI2_PLATFORM
 	select SND_SOC_ACPI_INTEL_MATCH
+	select SND_INTEL_DSP_CONFIG
 	select IOSF_MBI
 	help
 	  If you have a Intel Baytrail or Cherrytrail platform with an I2S
diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index f943a0884976..2c1b8a2e3506 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -21,6 +21,7 @@
 #include <linux/acpi.h>
 #include <asm/platform_sst_audio.h>
 #include <sound/core.h>
+#include <sound/intel-dsp-config.h>
 #include <sound/soc.h>
 #include <sound/compress_driver.h>
 #include <acpi/acbuffer.h>
@@ -246,6 +247,13 @@ static int sst_acpi_probe(struct platform_device *pdev)
 	id = acpi_match_device(dev->driver->acpi_match_table, dev);
 	if (!id)
 		return -ENODEV;
+
+	ret = snd_intel_acpi_dsp_driver_probe(dev, id->id);
+	if (ret != SND_INTEL_DSP_DRIVER_ANY && ret != SND_INTEL_DSP_DRIVER_SST) {
+		dev_dbg(dev, "SST ACPI driver not selected, aborting probe\n");
+		return -ENODEV;
+	}
+
 	dev_dbg(dev, "for %s\n", id->id);
 
 	mach = (struct snd_soc_acpi_mach *)id->driver_data;
-- 
2.25.1

