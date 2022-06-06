Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AE553F0E0
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Jun 2022 22:49:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 122C81B40;
	Mon,  6 Jun 2022 22:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 122C81B40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654548597;
	bh=GOzKZSNCLi8ldnC5vhezfth9Monw581sz9W3fdd36Rg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PU985Vy/wyDJLcCpf9eCDywaZ9Legn09SrdW+6JPhOIvihGjuKJBtQpr23q7L/vfU
	 OSh2AErQOFfKc63iKxMdnGScvsJomLW5ceTWnv4eWcS4vz2v8Dm/Zj9wIXMNtnrgtu
	 FL+UP4l2+ZMaCisJ8I+l/JlgihzOY7oW4QhoDoqM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34EC8F8051E;
	Mon,  6 Jun 2022 22:48:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D1D9F8051E; Mon,  6 Jun 2022 22:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8EC3F80116
 for <alsa-devel@alsa-project.org>; Mon,  6 Jun 2022 22:48:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EC3F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="IuN39NyD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654548504; x=1686084504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GOzKZSNCLi8ldnC5vhezfth9Monw581sz9W3fdd36Rg=;
 b=IuN39NyDJt4HAEAk1rfFF4hgRM77MJOI8PeYccdZKVPj5lzfz4fRPNdL
 xEIUuyPxqH9zcEeVKi9f/OIpBIetvn3RI6o/FwxnlSROmlA+w7fwO99lH
 ZHH6DHM5McQ5uT2g/ij1cV371HrnEjF8q/46SHYWbneqC0r8ccofOyB17
 8Ivg5cU3KCRBO12X5v958qSVwkyAur3ovimt4P2S4jM5kTPUuxodfIEd7
 EuHcNJmQE1l8QOAfIYfR1ES6AcSIlwHlbe9QmWagKJ4fOjWeefvaKYWvq
 i/oDXm02KO/YZwu01g1ci35chAQT2cLOXqUq0d+qH7aIejxlDWEbb2mQp Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="277173710"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="277173710"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:35 -0700
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; d="scan'208";a="906739461"
Received: from yantem-mobl9.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.24.154])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2022 13:46:33 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: add MeteorLake machines
Date: Mon,  6 Jun 2022 15:46:20 -0500
Message-Id: <20220606204622.144424-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
References: <20220606204622.144424-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add support for MeteorLake (MTL) machines support, starting with mockup
devices.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-mtl-match.c   | 41 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-mtl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index 59551b1f22f3c..bc7fd46ec2bc8 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -30,6 +30,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[];
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_sdw_machines[];
@@ -37,6 +38,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index fef0b2d1de68b..8ca8f872ec80c 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -9,6 +9,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-cml-match.o soc-acpi-intel-icl-match.o \
 	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-jsl-match.o soc-acpi-intel-adl-match.o \
+	soc-acpi-intel-mtl-match.o \
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
new file mode 100644
index 0000000000000..cc594b27e03be
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-acpi-intel-mtl-match.c - tables and support for MTL ACPI enumeration.
+ *
+ * Copyright (c) 2022, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include "soc-acpi-intel-sdw-mockup-match.h"
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_machines);
+
+/* this table is used when there is no I2S codec present */
+struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
+	/* mockup tests need to be first */
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = sdw_mockup_headset_2amps_mic,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt711-rt1308-rt715.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = sdw_mockup_headset_1amp_mic,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt711-rt1308-mono-rt715.tplg",
+	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = sdw_mockup_mic_headset_1amp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt715-rt711-rt1308-mono.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_mtl_sdw_machines);
-- 
2.34.1

