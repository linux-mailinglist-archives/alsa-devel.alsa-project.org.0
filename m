Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF799FE0
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 21:25:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C491693;
	Thu, 22 Aug 2019 21:24:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C491693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566501911;
	bh=vRXzNXTRHf85IOE0wRs9Ba+m2+KtVG684uY4ObBDfwo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ba0erJvvYca9yuJcFLEixZDYxu0PaJDJcffOz1kGVnYb8edvQUzoCQdroRhuEJvqq
	 CAV5a5/oArfpYJbpZzToAP5bqijPvMUcBTsy47Mi79wg85dZbw3R8MJNLoZws+5CiV
	 eG+ZXS/DJzDKeQBBYUT8fiCfMtzSDSF35JsVG7vQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AAFAF80C15;
	Thu, 22 Aug 2019 21:06:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17432F80715; Thu, 22 Aug 2019 21:06:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 17329F8036D
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 21:05:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 17329F8036D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 12:05:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,417,1559545200"; d="scan'208";a="203524575"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 12:05:24 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 22 Aug 2019 21:04:17 +0200
Message-Id: <20190822190425.23001-28-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190822190425.23001-1-cezary.rojewski@intel.com>
References: <20190822190425.23001-1-cezary.rojewski@intel.com>
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH 27/35] ASoC: Intel: Skylake: Define platform
	descriptors
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

Make use of sst_pdata and declare platform descriptors for all existing
cAVS platforms. Each carries information about base_fw filename,
platform specific operations and boards supported.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/bxt-sst.c |  4 ++--
 sound/soc/intel/skylake/cnl-sst.c |  4 ++--
 sound/soc/intel/skylake/skl-sst.c |  4 ++--
 sound/soc/intel/skylake/skl.c     | 38 ++++++++++++++++++++++++++++++-
 sound/soc/intel/skylake/skl.h     |  3 +++
 5 files changed, 46 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/skylake/bxt-sst.c b/sound/soc/intel/skylake/bxt-sst.c
index a547fb84eee9..06da822790a5 100644
--- a/sound/soc/intel/skylake/bxt-sst.c
+++ b/sound/soc/intel/skylake/bxt-sst.c
@@ -531,7 +531,7 @@ static const struct skl_dsp_fw_ops bxt_fw_ops = {
 	.load_library = bxt_load_library,
 };
 
-static struct sst_ops skl_ops = {
+struct sst_ops apl_sst_ops = {
 	.irq_handler = skl_dsp_sst_interrupt,
 	.thread_fn = skl_dsp_irq_thread_handler,
 	.write = sst_shim32_write,
@@ -542,7 +542,7 @@ static struct sst_ops skl_ops = {
 };
 
 static struct sst_pdata skl_dev = {
-	.ops = &skl_ops,
+	.ops = &apl_sst_ops,
 };
 
 int bxt_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
diff --git a/sound/soc/intel/skylake/cnl-sst.c b/sound/soc/intel/skylake/cnl-sst.c
index 5be0a8eb154d..c4dbf6655097 100644
--- a/sound/soc/intel/skylake/cnl-sst.c
+++ b/sound/soc/intel/skylake/cnl-sst.c
@@ -408,7 +408,7 @@ static int cnl_ipc_init(struct device *dev, struct skl_dev *cnl)
 	return 0;
 }
 
-static struct sst_ops cnl_ops = {
+struct sst_ops cnl_sst_ops = {
 	.irq_handler = cnl_dsp_sst_interrupt,
 	.thread_fn = cnl_dsp_irq_thread_handler,
 	.write = sst_shim32_write,
@@ -419,7 +419,7 @@ static struct sst_ops cnl_ops = {
 };
 
 static struct sst_pdata cnl_dev = {
-	.ops = &cnl_ops,
+	.ops = &cnl_sst_ops,
 };
 
 int cnl_sst_dsp_init(struct skl_dev *cnl, const char *fw_name)
diff --git a/sound/soc/intel/skylake/skl-sst.c b/sound/soc/intel/skylake/skl-sst.c
index 8ae7fe73534e..122c07290440 100644
--- a/sound/soc/intel/skylake/skl-sst.c
+++ b/sound/soc/intel/skylake/skl-sst.c
@@ -503,7 +503,7 @@ static const struct skl_dsp_fw_ops skl_fw_ops = {
 	.unload_mod = skl_unload_module,
 };
 
-static struct sst_ops skl_ops = {
+struct sst_ops skl_sst_ops = {
 	.irq_handler = skl_dsp_sst_interrupt,
 	.write = sst_shim32_write,
 	.read = sst_shim32_read,
@@ -513,7 +513,7 @@ static struct sst_ops skl_ops = {
 };
 
 static struct sst_pdata skl_dev = {
-	.ops = &skl_ops,
+	.ops = &skl_sst_ops,
 };
 
 int skl_sst_dsp_init(struct skl_dev *skl, const char *fw_name)
diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 54e1f957121d..d6d099aba834 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -27,6 +27,7 @@
 #include <sound/hda_i915.h>
 #include <sound/hda_codec.h>
 #include <sound/intel-nhlt.h>
+#include "../common/sst-dsp.h"
 #include "skl.h"
 #include "skl-sst-dsp.h"
 #include "skl-sst-ipc.h"
@@ -1063,7 +1064,6 @@ static int skl_probe(struct pci_dev *pci,
 
 	pci_set_drvdata(skl->pci, bus);
 
-
 	err = skl_find_machine(skl, (void *)pci_id->driver_data);
 	if (err < 0) {
 		dev_err(bus->dev, "skl_find_machine failed with err: %d\n", err);
@@ -1153,6 +1153,42 @@ static void skl_remove(struct pci_dev *pci)
 	dev_set_drvdata(&pci->dev, NULL);
 }
 
+static struct sst_pdata skl_desc = {
+	.fw_name = "intel/dsp_fw_release.bin",
+	.ops = &skl_sst_ops,
+	.boards = snd_soc_acpi_intel_skl_machines,
+};
+
+static struct sst_pdata kbl_desc = {
+	.fw_name = "intel/dsp_fw_kbl.bin",
+	.ops = &skl_sst_ops,
+	.boards = snd_soc_acpi_intel_kbl_machines,
+};
+
+static struct sst_pdata apl_desc = {
+	.fw_name = "intel/dsp_fw_bxtn.bin",
+	.ops = &apl_sst_ops,
+	.boards = snd_soc_acpi_intel_bxt_machines,
+};
+
+static struct sst_pdata glk_desc = {
+	.fw_name = "intel/dsp_fw_glk.bin",
+	.ops = &apl_sst_ops,
+	.boards = snd_soc_acpi_intel_glk_machines,
+};
+
+static struct sst_pdata cnl_desc = {
+	.fw_name = "intel/dsp_fw_cnl.bin",
+	.ops = &cnl_sst_ops,
+	.boards = snd_soc_acpi_intel_cnl_machines,
+};
+
+static struct sst_pdata icl_desc = {
+	.fw_name = "intel/dsp_fw_icl.bin",
+	.ops = &cnl_sst_ops,
+	.boards = snd_soc_acpi_intel_icl_machines,
+};
+
 /* PCI IDs */
 static const struct pci_device_id skl_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_INTEL_SKL)
diff --git a/sound/soc/intel/skylake/skl.h b/sound/soc/intel/skylake/skl.h
index 9f5aa53df9f8..2f2b5a141abf 100644
--- a/sound/soc/intel/skylake/skl.h
+++ b/sound/soc/intel/skylake/skl.h
@@ -42,6 +42,9 @@
 #define AZX_REG_VS_EM2_L1SEN		BIT(13)
 
 struct skl_debug;
+extern struct sst_ops skl_sst_ops;
+extern struct sst_ops apl_sst_ops;
+extern struct sst_ops cnl_sst_ops;
 
 struct skl_astate_param {
 	u32 kcps;
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
