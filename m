Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8972C7A17E2
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 09:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A44BA9F6;
	Fri, 15 Sep 2023 09:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A44BA9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694764726;
	bh=Tn9oxM7Nk2s+bFo9hm0UDWLjqTRrU/ymSSS76x6wC1A=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=gUYTPGdvvagYvCqsNf+WQK5MOdgp/sQPZnph2w7F5KaDCMnOAgC83OgHVFYUEA3ka
	 6wXP5DBF82mHZ2ft3wrVGGUPlvOwtu6GdAtRwmPSvL8C0dGvc5KR1ujVvEuTRG4XK7
	 4pyVjlnBcR3kD7oKwOQGFCnsyySI5HOmYuBa2TP0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25910F80246; Fri, 15 Sep 2023 09:57:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C0633F80246;
	Fri, 15 Sep 2023 09:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4678EF80425; Fri, 15 Sep 2023 09:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9DCAF8007C
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 09:57:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9DCAF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hGOZrKu0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694764671; x=1726300671;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tn9oxM7Nk2s+bFo9hm0UDWLjqTRrU/ymSSS76x6wC1A=;
  b=hGOZrKu0+TXzOQTaE3ZUFRFW4OTqPfGkPo8ZDE7ayA3xTUINOdgBp/gk
   6V0QMBijLdvoCip4R1nBuEHB0jj7r8V9unIGchJ8KGs5BgmJmLG9v/Obm
   RHcfNYWN3SJmM0MlGTI+z5CU2wtEx4ZadI+FuIsJV0ZDOOVRp6Ux1Tou9
   YjMyp5UzTaPHC0RjLoWBaThBrTboM3nkQzYU+c1KdzJxHni0cx9VN/38s
   7EuQfAi7u7QR9WvYfFbb8QgHX2oj2HT2BePZ5hf8MxG773NufGQTU9gcP
   H5bd6Rwp0jnTdEzZ7xu1osjLZePJf8tXRz+51mQp2Vd7r8/4U7upepQeu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="445647569"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="445647569"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="888147574"
X-IronPort-AV: E=Sophos;i="6.02,148,1688454000";
   d="scan'208";a="888147574"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 00:57:09 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com,
	arun.t@intel.com
Subject: [PATCH 1/1] ASoC: Intel: common: add ACPI matching tables for Arrow
 Lake
Date: Fri, 15 Sep 2023 16:06:35 +0800
Message-Id: <20230915080635.1619942-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NILMYFVBG5ZZZSQDLD7V7PZ4Q7ICVKKZ
X-Message-ID-Hash: NILMYFVBG5ZZZSQDLD7V7PZ4Q7ICVKKZ
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NILMYFVBG5ZZZSQDLD7V7PZ4Q7ICVKKZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Arun T <arun.t@intel.com>

Initial support for ARL w/ RT711

Signed-off-by: Arun T <arun.t@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-arl-match.c   | 51 +++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-arl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index e49b97d9e3ff..845e7608ac37 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -32,6 +32,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[];
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_sdw_machines[];
@@ -42,6 +43,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 07aa37dd90e9..f7370e5b4e9e 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -10,6 +10,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-jsl-match.o soc-acpi-intel-adl-match.o \
 	soc-acpi-intel-rpl-match.o soc-acpi-intel-mtl-match.o \
+	soc-acpi-intel-arl-match.o \
 	soc-acpi-intel-lnl-match.o \
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
new file mode 100644
index 000000000000..e52797aae6e6
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-apci-intel-arl-match.c - tables and support for ARL ACPI enumeration.
+ *
+ * Copyright (c) 2023 Intel Corporation.
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+static const struct snd_soc_acpi_endpoint single_endpoint = {
+	.num = 0,
+	.aggregated = 0,
+	.group_position = 0,
+	.group_id = 0,
+};
+
+static const struct snd_soc_acpi_adr_device rt711_0_adr[] = {
+	{
+		.adr = 0x000020025D071100ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt711"
+	}
+};
+
+static const struct snd_soc_acpi_link_adr arl_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr_d = rt711_0_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_machines);
+
+/* this table is used when there is no I2S codec present */
+struct snd_soc_acpi_mach snd_soc_acpi_intel_arl_sdw_machines[] = {
+	{
+		.link_mask = 0x1, /* link0 required */
+		.links = arl_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-arl-rt711.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_arl_sdw_machines);
-- 
2.25.1

