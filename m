Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4066599FED
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:25:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2F3316A5;
	Thu, 22 Aug 2019 21:24:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2F3316A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501949;
	bh=wgHcNYS00F594e5+X7PvGG3Xl2y63nxglVuaSLPpvzE=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LhJTbWoTIPljLhACV0N7AdUOqPV3044oK+bmyCWoS1xEMRq6k8pWKIW8EISRC+J9u
	 8Tou/eLaYcn7m5TgLpg4YjIi8Ia9kD7LS9y2OgByv+cnZzQEEIn2rZZkLeSElnFKZj
	 qEtJ6OIIDbzzV9m+nk+1+iyWXR9cGJnmlim1scSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE938F80C20;
	Thu, 22 Aug 2019 21:06:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A190F8071D; Thu, 22 Aug 2019 21:06:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65366F80671
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65366F80671
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524585"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:26 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:18 +0200
Message-Id: <20190822190425.23001-29-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 28/35] ASoC: Intel: Skylake: Update skl_ids
	table
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

With platform descriptors defined, update PCI ID table together with
skl_probe to retrieve supported boards from saved sst_pdata objects
instead.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index d6d099aba834..53a6befd5d68 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -985,6 +985,7 @@ static int skl_probe(struct pci_dev *pci,
 {
 	struct skl_dev *skl;
 	struct hdac_bus *bus = NULL;
+	struct sst_pdata *desc;
 	int err;
 
 	switch (skl_pci_binding) {
@@ -1064,7 +1065,8 @@ static int skl_probe(struct pci_dev *pci,
 
 	pci_set_drvdata(skl->pci, bus);
 
-	err = skl_find_machine(skl, (void *)pci_id->driver_data);
+	desc = (struct sst_pdata *)pci_id->driver_data;
+	err = skl_find_machine(skl, desc->boards);
 	if (err < 0) {
 		dev_err(bus->dev, "skl_find_machine failed with err: %d\n", err);
 		goto out_nhlt_free;
@@ -1194,42 +1196,42 @@ static const struct pci_device_id skl_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
 	/* Sunrise Point-LP */
 	{ PCI_DEVICE(0x8086, 0x9d70),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_skl_machines},
+		.driver_data = (unsigned long)&skl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_APL)
 	/* BXT-P */
 	{ PCI_DEVICE(0x8086, 0x5a98),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_bxt_machines},
+		.driver_data = (unsigned long)&apl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_KBL)
 	/* KBL */
 	{ PCI_DEVICE(0x8086, 0x9D71),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_kbl_machines},
+		.driver_data = (unsigned long)&kbl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_GLK)
 	/* GLK */
 	{ PCI_DEVICE(0x8086, 0x3198),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_glk_machines},
+		.driver_data = (unsigned long)&glk_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CNL)
 	/* CNL */
 	{ PCI_DEVICE(0x8086, 0x9dc8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+		.driver_data = (unsigned long)&cnl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CFL)
 	/* CFL */
 	{ PCI_DEVICE(0x8086, 0xa348),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+		.driver_data = (unsigned long)&cnl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_LP)
 	/* CML-LP */
 	{ PCI_DEVICE(0x8086, 0x02c8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+		.driver_data = (unsigned long)&cnl_desc },
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_CML_H)
 	/* CML-H */
 	{ PCI_DEVICE(0x8086, 0x06c8),
-		.driver_data = (unsigned long)&snd_soc_acpi_intel_cnl_machines},
+		.driver_data = (unsigned long)&cnl_desc },
 #endif
 	{ 0, }
 };
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
