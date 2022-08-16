Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49F595CB7
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 15:05:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8903164D;
	Tue, 16 Aug 2022 15:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8903164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660655103;
	bh=AZj4GLL4YRHZKUVcsOoMIwmuPIMgaKN9jpxt26EblgM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kMXavoBjeXho55mFC4kn2LGaADJFOAcd4WFNG48MknfdlZTXV6V/dmG5kcDzDv7jr
	 LSOr8XGUnUjKRvn6cNrisRttRjOuqVeVdlnB3xJYqV8JezA79BlE3c/Ef7tvE2nx6Y
	 U+VYBgHxwiMoIztiRkrVbb8a+PUBinn8bWUcLb9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDD3BF80424;
	Tue, 16 Aug 2022 15:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55B43F8032D; Tue, 16 Aug 2022 15:04:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF14F80118
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 15:03:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF14F80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WLG/o36I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660655037; x=1692191037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AZj4GLL4YRHZKUVcsOoMIwmuPIMgaKN9jpxt26EblgM=;
 b=WLG/o36IRwBO99lE5Rm3AS8kGc8XNUInKjUAAH6CRoIT0Essi/0JYrIF
 ghc/EQwC6XhQn6WF97erQCJFxK5HDYJqRGd6UrU4IxrsZSpvvEeY8PWEZ
 cuE6Zl3VoVVmnahneSqrgsZrfR7wRRe3vYY+l4yRCUcRMsDw+mmVLaAjy
 v7Aseda5fwR898tP2Nu+uUu+T7R9ylfUCuLSegFFNf2qaqvzZrR1HIdu+
 4cirfxClCdbTRDY3lBDdzH002kli3P6uvHRYvUYx9yq+T1z5zu6WXV+xa
 V5kFWn4yzPCfkqjfVGzWAXqF3qvG4yBxXr8wZejCGw0A9X3aUci5dRQTS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10440"; a="272603105"
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="272603105"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 06:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,241,1654585200"; d="scan'208";a="852636443"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 16 Aug 2022 06:03:50 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/2] ASoC: Intel: common: add ACPI matching tables for Raptor
 Lake
Date: Tue, 16 Aug 2022 16:05:09 +0300
Message-Id: <20220816130510.190427-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
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

Initial support for RPL w/ RT711

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Gopal Vamshi Krishna <vamshi.krishna.gopal@intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  2 +-
 .../intel/common/soc-acpi-intel-rpl-match.c   | 51 +++++++++++++++++++
 3 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-rpl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index bc7fd46ec2bc..ac750afa7bc6 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -30,6 +30,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_machines[];
 
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_sdw_machines[];
@@ -38,6 +39,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_sdw_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[];
 
 /*
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 8ca8f872ec80..41054cf09ec9 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -9,7 +9,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-cml-match.o soc-acpi-intel-icl-match.o \
 	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-jsl-match.o soc-acpi-intel-adl-match.o \
-	soc-acpi-intel-mtl-match.o \
+	soc-acpi-intel-rpl-match.o soc-acpi-intel-mtl-match.o \
 	soc-acpi-intel-hda-match.o \
 	soc-acpi-intel-sdw-mockup-match.o
 
diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
new file mode 100644
index 000000000000..0b77401e4e6f
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * soc-apci-intel-rpl-match.c - tables and support for RPL ACPI enumeration.
+ *
+ * Copyright (c) 2022 Intel Corporation.
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
+static const struct snd_soc_acpi_link_adr rpl_rvp[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_0_adr),
+		.adr_d = rt711_0_adr,
+	},
+	{}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
+
+/* this table is used when there is no I2S codec present */
+struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_sdw_machines[] = {
+	{
+		.link_mask = 0x1, /* link0 required */
+		.links = rpl_rvp,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-rpl-rt711.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_sdw_machines);

base-commit: efe30e2cb6ff87467389cece8ce604f6601059f9
-- 
2.37.2

