Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC9E8F010
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 18:04:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2218D1661;
	Thu, 15 Aug 2019 18:04:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2218D1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565885098;
	bh=I9kTQXNLkcXjK4iF2wT7zWjaFhCE9RtEDidZENM3g28=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aohgwpjryuwF1cNHg0a+s70koJLwEYpa691sORYFQz/tmd6sHqdsxXpveEEknky6Z
	 LXyVgMibrIGY+yGgkOmEoOZx5cJB1W3ZLmAoFRPZMoMwcpvWrxAqtJDcJH6S9wXUcM
	 MkIoQmYBJ18UPcygWhr0pqcOSJFC++GOOzGjsZ4s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3ADE0F805FC;
	Thu, 15 Aug 2019 18:01:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AE37F801DF; Thu, 15 Aug 2019 18:01:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7915F8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 18:01:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7915F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Aug 2019 08:58:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,389,1559545200"; d="scan'208";a="194790046"
Received: from ranofal-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.136.131])
 by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2019 08:58:06 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Thu, 15 Aug 2019 10:57:48 -0500
Message-Id: <20190815155749.29304-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
References: <20190815155749.29304-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 3/4] ASoC: Intel: common: add ACPI matching
	tables for EHL
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

There are no upstream machine drivers just yet so just add dummy table
for compilation in nocodec-mode.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h           |  1 +
 sound/soc/intel/common/Makefile                |  2 +-
 .../intel/common/soc-acpi-intel-ehl-match.c    | 18 ++++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ehl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index ce6c4a970939..6c9929abd90b 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -26,6 +26,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index a14aca62ff96..18d9630ae9a2 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -8,7 +8,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-skl-match.o soc-acpi-intel-kbl-match.o \
 	soc-acpi-intel-bxt-match.o soc-acpi-intel-glk-match.o \
 	soc-acpi-intel-cnl-match.o soc-acpi-intel-icl-match.o \
-	soc-acpi-intel-tgl-match.o \
+	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-hda-match.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
new file mode 100644
index 000000000000..a1290c3fa99f
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * soc-apci-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ehl_machines);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Common ACPI Match module");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
