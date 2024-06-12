Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F993904C35
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 09:00:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19593BC0;
	Wed, 12 Jun 2024 09:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19593BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718175640;
	bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U7j5vMwsQKsosnDb2uQHeOsUttdDDdLBTupfNUgYVsmzaskVxIF904cOcQ00YMZ82
	 7pjLyKeqKK3EiDqJUZf/M6gOyeSgtQbdyjMiG6US4yfRJ2XCkbXyPsvmtlKv3U43wZ
	 2fxtH/iXzVQ/GJYRHTOtKyjr/1zN/0FsKzTVAKOM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB46AF805E0; Wed, 12 Jun 2024 09:00:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5D03F8058C;
	Wed, 12 Jun 2024 09:00:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A4A5F805A8; Wed, 12 Jun 2024 08:59:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C7B3F8058C
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:59:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C7B3F8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SNCxjF/K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718175577; x=1749711577;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
  b=SNCxjF/KeLx1X3UX1J8vmgjPXe5vILSUdO/aYmtv7YKc+EItT5M/Q24w
   eCye8SjzsEsZa+xpGufN3D0I73zSW0l62it4Aab+Ofm0xDfIg0Bv+gCgH
   xidkP2aqePMU13xcY6XJ2Hz9w3YdOwj/Ane2+gCvTFPkcN189+AA8uuTF
   Q2g2hZAu+FD1mhhDG8+zxPLJkE+jq8MifzsC7tLn3c6w3Ric9SJYlKHrD
   1MK/jxaNGkJX7H8wUou6ZJPO/XFJHMwfxcDUslc5RzfGngjJKH9augnpm
   0a0J2yOkQFFNosrAZ4AwY4+2G+Fw8ZHuEU84xX+iolh7PxRw8PTH/eKMl
   A==;
X-CSE-ConnectionGUID: t4ZRoHC8R22lYQ4kH/Zqmw==
X-CSE-MsgGUID: ncp6Suv5R76mZeNmSUbvpQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="15147441"
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="15147441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:33 -0700
X-CSE-ConnectionGUID: oS8CGpk6SvOBozNq5yyDrQ==
X-CSE-MsgGUID: jUmtxlBfTT28fepGiQHBPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,232,1712646000";
   d="scan'208";a="70486890"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.245.246.56])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2024 23:59:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH 3/5] ASoC: Intel: soc-acpi: add PTL match tables
Date: Wed, 12 Jun 2024 08:58:56 +0200
Message-ID: <20240612065858.53041-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
References: <20240612065858.53041-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WRAD63L2QJ7RTER7OAJSOZ234OXQKGBI
X-Message-ID-Hash: WRAD63L2QJ7RTER7OAJSOZ234OXQKGBI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WRAD63L2QJ7RTER7OAJSOZ234OXQKGBI/>
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

