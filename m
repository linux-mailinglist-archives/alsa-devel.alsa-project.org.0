Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F863F96FF
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 18:22:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29C69846;
	Tue, 12 Nov 2019 18:21:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29C69846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573579333;
	bh=HN/HU3b3y5AQyYS34In6CBsRWJBSsbONCv+2InVTJ/w=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=HWzmkdyL1FzpGmm3cg7lS3KUcBi9TBV/mBq9GAXz4yw+/LuFWrgIl3ibUTOv2UKsh
	 +ca1Mo3+V1FEfhIqVh+ObiK3OzQhwm/d10ppjVhATM4YUwjfIX1hv9Nk5g8ejL3GvW
	 EptlomUnbDh1D/yV5x0aLEVwA2D4MJDKrhlrGxL4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 592F5F8064C;
	Tue, 12 Nov 2019 18:16:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B94DF8049C; Tue, 12 Nov 2019 18:16:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18697F80483
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 18:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18697F80483
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="qbl572US"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=ZnSWd3J1NTBUrGRHXlGAqWgxy4r7S08M5a2kz80xVpA=; b=qbl572US2uxb
 ZGOIhpGNyrhEY090LGU0PgyR+2LVC2WNqLXUJUuWoEuT8hOdSd0q5Oumu/eir3K6DPwZMiR6814ZV
 VCpZXsrMsKIRMMh19b38yhZ0rE/VT2erkZrioIASYTwgSRdxIWqEiRcBSt1dNrcHG+tHwJvI/Bo4V
 Q0IyQ=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iUZm8-0008J2-Uv; Tue, 12 Nov 2019 17:16:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 5FB4B2742A8B; Tue, 12 Nov 2019 17:16:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20191111222901.19892-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191112171620.5FB4B2742A8B@ypsilon.sirena.org.uk>
Date: Tue, 12 Nov 2019 17:16:20 +0000 (GMT)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: acpi-match: split CNL tables in
	three" to the asoc tree
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

The patch

   ASoC: Intel: acpi-match: split CNL tables in three

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 1f24d93c4f4ec0bb0b73c5b020060aa2d9faa756 Mon Sep 17 00:00:00 2001
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Date: Mon, 11 Nov 2019 16:28:59 -0600
Subject: [PATCH] ASoC: Intel: acpi-match: split CNL tables in three

Due to firmware manifest/signature differences, we have to use
different firmware names, so split CNL machine table in three (CNL,
CFL, CML).

The CFL table is currently empty since all known platforms use
HDaudio, but let's plan ahead.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191111222901.19892-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
