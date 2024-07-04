Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF68927281
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 11:01:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E8D81928;
	Thu,  4 Jul 2024 11:01:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E8D81928
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720083686;
	bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rp/UvQ4YBYHAcgmClNunEtuAZXXpZRPima/Yyor3W1r61jF2KpIn05NGSp+8IMsmb
	 FBNmxwvXXhm0nIxyOqq/IlOvosDY6kgFA60o5zLZ5chaB2EiSkRI2zSFO0Ly3mPBok
	 8+RaibtmNgkfCB0iGPCP5lSopKKOmSJpzEtCrjxI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60476F80699; Thu,  4 Jul 2024 10:59:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C33B3F806BC;
	Thu,  4 Jul 2024 10:59:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B23F8025E; Thu,  4 Jul 2024 10:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4DB3F800FE
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 10:53:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4DB3F800FE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i/8EASQL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720083231; x=1751619231;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
  b=i/8EASQLjKbR6q5MAz3zjf8qQc7J7JmSH6OBCOXiQXj/ZaYFdDB6fbEh
   7z0XS3B1TaLqRzl6OpJUZkdKRxyMdTez1XarEk+jm8+fAb6n2Ch26V9Zm
   z9qHqR6KxiIcZvdFkQoKySlCLjCPjY61cc0gdOMaCHG+eLs7CwvCj2J4W
   1XOIiJUXktAnbgCQ35dNOeKQ4dC5XEoplayvLagwXSSnjg2IR7AwQvwwp
   RJUP1ec3nI3dMVTFciKDMU+1pvHnK3hRJWi8T27Nl8d/M+SZkOB/RqwK9
   BiDniFd/opOVIgUZ2eX98VIrEgb/1yl+x1GvBbBIWKgQ7dUbrd4mj6YTs
   Q==;
X-CSE-ConnectionGUID: gJJLTDULRsqlUIiX5Sefrw==
X-CSE-MsgGUID: tHyzval9QNCkc5KP4E4y9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17300586"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="17300586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:53:47 -0700
X-CSE-ConnectionGUID: TmaWiE+QRX+F5gABRq3CpA==
X-CSE-MsgGUID: 7qMwUIm3Toy1JTUgYVEfyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800";
   d="scan'208";a="51708490"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.90])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2024 01:53:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH v3 1/6] ASoC: Intel: soc-acpi: add PTL match tables
Date: Thu,  4 Jul 2024 10:53:25 +0200
Message-ID: <20240704085330.371332-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240704085330.371332-1-pierre-louis.bossart@linux.intel.com>
References: <20240704085330.371332-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HVDI6VDTSGUU6EKZF2ORTPD2FQILA5R6
X-Message-ID-Hash: HVDI6VDTSGUU6EKZF2ORTPD2FQILA5R6
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HVDI6VDTSGUU6EKZF2ORTPD2FQILA5R6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For now the tables are basic for mockup devices and headset codec support

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-ptl-match.c   | 41 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-ptl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index 4843b57798f6..daed7123df9d 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -33,6 +33,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[];
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_sdw_machines[];
@@ -44,6 +45,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 40a74a19c508..91e146e2487d 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -12,6 +12,7 @@ snd-soc-acpi-intel-match-y := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-matc
 	soc-acpi-intel-rpl-match.o soc-acpi-intel-mtl-match.o \
 	soc-acpi-intel-arl-match.o \
 	soc-acpi-intel-lnl-match.o \
+	soc-acpi-intel-ptl-match.o \
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
new file mode 100644
index 000000000000..dba45fa7a453
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-acpi-intel-ptl-match.c - tables and support for PTL ACPI enumeration.
+ *
+ * Copyright (c) 2024, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+#include "soc-acpi-intel-sdw-mockup-match.h"
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
+
+/* this table is used when there is no I2S codec present */
+struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
+	/* mockup tests need to be first */
+	{
+		.link_mask = GENMASK(3, 0),
+		.links = sdw_mockup_headset_2amps_mic,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt711-rt1308-rt715.tplg",
+	},
+	{
+		.link_mask = BIT(0) | BIT(1) | BIT(3),
+		.links = sdw_mockup_headset_1amp_mic,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt711-rt1308-mono-rt715.tplg",
+	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = sdw_mockup_mic_headset_1amp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt715-rt711-rt1308-mono.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_sdw_machines);
-- 
2.43.0

