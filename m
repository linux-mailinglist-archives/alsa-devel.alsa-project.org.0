Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 819E8F82E5
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Nov 2019 23:31:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28841682;
	Mon, 11 Nov 2019 23:31:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28841682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573511514;
	bh=U3kRaC9N+P4+Gq5PkaSA1gxIt0TNlozCY70ulab9by8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hJOdS2kIZ+FDr1QtJpcZZeFUWWW9VHEWYMTUpKb7YLFKLE3vYxlH6lTOaXA8/lpkG
	 //8gUqT+j2ToO+Fl8w0sSKWjeZi5DwTqQ9U72TcMHchAs0iIuEwEXpXvPt3eRKamuH
	 eyzd+WVLg7n+6kJpRXfBOHORjYwvmAqeW6i1ww4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 28978F805FE;
	Mon, 11 Nov 2019 23:29:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E856FF80275; Mon, 11 Nov 2019 23:29:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D56B5F80275
 for <alsa-devel@alsa-project.org>; Mon, 11 Nov 2019 23:29:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D56B5F80275
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 14:29:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,294,1569308400"; d="scan'208";a="354902147"
Received: from kathyche-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.27.186])
 by orsmga004.jf.intel.com with ESMTP; 11 Nov 2019 14:29:07 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 11 Nov 2019 16:28:59 -0600
Message-Id: <20191111222901.19892-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191111222901.19892-1-pierre-louis.bossart@linux.intel.com>
References: <20191111222901.19892-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: Intel: acpi-match: split CNL tables
	in three
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

Due to firmware manifest/signature differences, we have to use
different firmware names, so split CNL machine table in three (CNL,
CFL, CML).

The CFL table is currently empty since all known platforms use
HDaudio, but let's plan ahead.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi-intel-match.h          |  2 +
 sound/soc/intel/common/Makefile               |  3 +-
 .../intel/common/soc-acpi-intel-cfl-match.c   | 18 ++++++
 .../intel/common/soc-acpi-intel-cml-match.c   | 56 +++++++++++++++++++
 .../intel/common/soc-acpi-intel-cnl-match.c   | 38 -------------
 5 files changed, 78 insertions(+), 39 deletions(-)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-cfl-match.c
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-cml-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index 4e44782862df..20c0bee3b959 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -24,6 +24,8 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_kbl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_ehl_machines[];
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index eafe95ead49b..bd352878f89a 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -7,7 +7,8 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-hsw-bdw-match.o \
 	soc-acpi-intel-skl-match.o soc-acpi-intel-kbl-match.o \
 	soc-acpi-intel-bxt-match.o soc-acpi-intel-glk-match.o \
-	soc-acpi-intel-cnl-match.o soc-acpi-intel-icl-match.o \
+	soc-acpi-intel-cnl-match.o soc-acpi-intel-cfl-match.o \
+	soc-acpi-intel-cml-match.o soc-acpi-intel-icl-match.o \
 	soc-acpi-intel-tgl-match.o soc-acpi-intel-ehl-match.o \
 	soc-acpi-intel-jsl-match.o \
 	soc-acpi-intel-hda-match.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
new file mode 100644
index 000000000000..d6fd2026d0b8
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * soc-apci-intel-cfl-match.c - tables and support for CFL ACPI enumeration.
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_cfl_machines[] = {
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cfl_machines);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
new file mode 100644
index 000000000000..5d08ae066738
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * soc-acpi-intel-cml-match.c - tables and support for CML ACPI enumeration.
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+static struct snd_soc_acpi_codecs cml_codecs = {
+	.num_codecs = 1,
+	.codecs = {"10EC5682"}
+};
+
+static struct snd_soc_acpi_codecs cml_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98357A"}
+};
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
+	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.quirk_data = &cml_spk_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
+	{
+		.id = "MX98357A",
+		.drv_name = "sof_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
+	},
+	{
+		.id = "10EC1011",
+		.drv_name = "cml_rt1011_rt5682",
+		.quirk_data = &cml_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
+	},
+	{
+		.id = "10EC5682",
+		.drv_name = "sof_rt5682",
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-rt5682.tplg",
+	},
+
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_machines);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Common ACPI Match module");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 16d0bae8b316..27588841c8b0 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -14,16 +14,6 @@ static struct skl_machine_pdata cnl_pdata = {
 	.use_tplg_pcm = true,
 };
 
-static struct snd_soc_acpi_codecs cml_codecs = {
-	.num_codecs = 1,
-	.codecs = {"10EC5682"}
-};
-
-static struct snd_soc_acpi_codecs cml_spk_codecs = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 	{
 		.id = "INT34C2",
@@ -33,34 +23,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[] = {
 		.sof_fw_filename = "sof-cnl.ri",
 		.sof_tplg_filename = "sof-cnl-rt274.tplg",
 	},
-	{
-		.id = "DLGS7219",
-		.drv_name = "cml_da7219_max98357a",
-		.quirk_data = &cml_spk_codecs,
-		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
-	},
-	{
-		.id = "MX98357A",
-		.drv_name = "sof_rt5682",
-		.quirk_data = &cml_codecs,
-		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682-max98357a.tplg",
-	},
-	{
-		.id = "10EC1011",
-		.drv_name = "cml_rt1011_rt5682",
-		.quirk_data = &cml_codecs,
-		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt1011-rt5682.tplg",
-	},
-	{
-		.id = "10EC5682",
-		.drv_name = "sof_rt5682",
-		.sof_fw_filename = "sof-cnl.ri",
-		.sof_tplg_filename = "sof-cml-rt5682.tplg",
-	},
-
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cnl_machines);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
