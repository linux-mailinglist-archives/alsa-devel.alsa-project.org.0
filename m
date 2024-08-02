Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA4945DFC
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2024 14:42:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 384CE4154;
	Fri,  2 Aug 2024 14:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 384CE4154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722602531;
	bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rawfl3VV/yVSwwz4Yw5uWspnIH4AE/PcYjhSsDvm9XiqT8ywioQdBPf/vcJr1A2EE
	 1Pt8o7yFZtRh1VEYhiK6lta01PrCp0ZjgURoXsWatv2dDXy8VWACj3egJWUdn9wll6
	 IJpsaPGOzBXSeHGbHSdA2E1neDX3FelCb9GY54ZA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F3674F805ED; Fri,  2 Aug 2024 14:41:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A6F62F805ED;
	Fri,  2 Aug 2024 14:41:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 270DBF802DB; Fri,  2 Aug 2024 14:40:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEE61F800B0
	for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2024 14:40:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEE61F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=g+nTPcIv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722602428; x=1754138428;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JIOiMZEDwaqSLxMoTfruo+yYfdbcow0kQHxJBoAbvfw=;
  b=g+nTPcIv8Q3fSURHkl/fqWEjd4u/DjiNmfjN4YosyApN1YufeSv6an8o
   aW6/TOnvGGJetbt+CbuXqAZJSmhBOWQwkqjJjDVFOCWPkcyPEwfJFj9RZ
   i1cEL9R97Yde2VVN2PHBQ6TaOM6zV98aShFNNHLs4Lgqt0pZXOWpDR2D7
   uZliKvFxYcD2Af/Mv9um6b/Ks59WOwTcF4F1cKhTCqwjiyn0gn0GvR8vt
   iIe7GgTyaIc1ZfDnBwQr/qMqgrUgshVa3ZsxBG4SOsjRYT8Ky8X4G6NWK
   UIqjgbtt6QsG+048mpfEOY7W/E0vDHVKkFhcQi83HT3wIAxgu56qmbHKN
   g==;
X-CSE-ConnectionGUID: WzUO6J5rS4mOMhcv1GI+Yg==
X-CSE-MsgGUID: 6x9NjXNkQGmT3OtiooTO2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24488174"
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="24488174"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:25 -0700
X-CSE-ConnectionGUID: t/kLlsf0T6uHbPSmlffOiQ==
X-CSE-MsgGUID: Z4xl2zAoRmGu8iFOURSQ5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,257,1716274800";
   d="scan'208";a="55024715"
Received: from ltuz-desk.ger.corp.intel.com (HELO pbossart-mobl6.intel.com)
 ([10.245.246.89])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2024 05:40:23 -0700
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
Subject: [PATCH v4 1/5] ASoC: Intel: soc-acpi: add PTL match tables
Date: Fri,  2 Aug 2024 14:40:07 +0200
Message-ID: <20240802124011.173820-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
References: <20240802124011.173820-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CMBRAM6WOASBTQSIKOTWHMAQ3FWFFXHZ
X-Message-ID-Hash: CMBRAM6WOASBTQSIKOTWHMAQ3FWFFXHZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CMBRAM6WOASBTQSIKOTWHMAQ3FWFFXHZ/>
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

