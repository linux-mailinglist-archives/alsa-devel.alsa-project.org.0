Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3E38F004
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:03:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B97451674;
	Thu, 15 Aug 2019 18:02:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B97451674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565884985;
	bh=bROOzq+74aqmvyL007UnqrB2xYS8QQxy9eylU0TEBWk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tt0eA4U5JWNYC6ishI+M5ymzCl7u5Zc+B6OH8hwwkfrsnV3dqmb3ZOu5Cw0QmB+xI
	 o6fgXuf063c9+O6oGmngnqYKnU2TTuS17h0e/UTvypfdKVgCVNKEQP+q8bXi9zaVPO
	 7qJQvBWOCfIhfcNfvI+Sn5wWZ72xmuBfuHJ/1zwU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABBDF8044C;
	Thu, 15 Aug 2019 18:01:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E933F80290; Thu, 15 Aug 2019 18:01:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 93CE4F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:01:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93CE4F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:58:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="194790037"
Received: from ranofal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.136.131])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 08:58:04 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 10:57:46 -0500
Message-Id: <20190815155749.29304-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
References: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/4] ASoC: Intel: common: add ACPI matching
	tables for Tiger Lake
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pan Xiuli <xiuli.pan@linux.intel.com>

Initial support for TGL w/ RT1308

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  1 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-tgl-match.c   | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-tgl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index bb5e1e4ce8bf..ce6c4a970939 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -25,6 +25,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 56c81e20b5bf..a14aca62ff96 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -8,6 +8,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-skl-match.o soc-acpi-intel-kbl-match.o \
 	soc-acpi-intel-bxt-match.o soc-acpi-intel-glk-match.o \
 	soc-acpi-intel-cnl-match.o soc-acpi-intel-icl-match.o \
+	soc-acpi-intel-tgl-match.o \
 	soc-acpi-intel-hda-match.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
new file mode 100644
index 000000000000..57a6298d6dca
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
+	{
+		.id = "10EC1308",
+		.drv_name = "tgl_rt1308",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt1308.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Common ACPI Match module");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
