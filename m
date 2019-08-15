Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 631E68F1EC
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:17:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D82C611C;
	Thu, 15 Aug 2019 19:17:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D82C611C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889472;
	bh=KohO5ggdcKS0MO8F6pGKn5kiDmZS3EEwddyYoDtUDw8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GpYyh+tlZhoRlOHl70NWC8fgqCnAu79gct8TDEGHj/P4mUOVgDl+d4nH8W3PskVcn
	 K+CUkfqYhG4YOpN63KebbtpifbfmgYatH6TZLlHeXsVA0rsvTN9C5xzQwlmTvo4Ufm
	 QjruIf1mQC+ACfylxRZu04OdAMCd3NGPRFSfdmsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAFA7F80641;
	Thu, 15 Aug 2019 19:14:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA309F80636; Thu, 15 Aug 2019 19:14:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-f100.google.com (mail-wm1-f100.google.com
 [209.85.128.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 603CDF80273
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 603CDF80273
Received: by mail-wm1-f100.google.com with SMTP id 10so1879427wmp.3
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=6GDdFvkKObUTC4K3AyBpdOiCIGDpuXP8eSZdi0b1bp0=;
 b=s4EkXvqXuEg1oUoe7LK8lVsXZRMaUmVI/jy4Ve1l5Bi5mhhNabUBA+oBl0gzjTeuMg
 0KddgAs2Iuu4Ttneg2HIqQUGqVJjuOoqokf6Tl9FdUs07ZCpNwX07jK/ECPkZlWLrrt1
 nlyUt+beJJYh9wbQmoz76T5Bness2HNZXLbEKP6i1gmXK3BqorWVbExlyJHAGMb8MWJi
 m2xL5JFH1TT/a8j2C+Yn9VoPB24m/XzKxsPsiDboq23NrW1nVX6yir37KJv9JGHRV75n
 4rYK9YpNJla1vLkgQDPDXeRFL7if5DwQMQOyoKI/rMYGDSQK2n+Yiam7QfQwC0O64qaA
 oV9g==
X-Gm-Message-State: APjAAAUgKDmeKFMKTuIMGvz/hNLJVEImMZ5AhMiqsr7NTWCvsD945riA
 nMKQw0YGYZRmvJjOLYNnQps8L7y8/XZNB7P9hGK5ardjdz1rFo24rg7zGYNVixduiw==
X-Google-Smtp-Source: APXvYqykQEw3DGMw9uMyhMNvtT9A5hVF7VBdSUbnNsVoNHrcBOyf+X+kpfMWipsj3TsO6OwJvI9UsX9vZk4X
X-Received: by 2002:a05:600c:22c7:: with SMTP id
 7mr3795862wmg.129.1565889262027; 
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id q187sm9050wma.20.2019.08.15.10.14.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKP-00050p-Ls; Thu, 15 Aug 2019 17:14:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id DEBD62742BC7; Thu, 15 Aug 2019 18:14:20 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20190815155749.29304-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171420.DEBD62742BC7@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:20 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: add ACPI matching tables
	for EHL" to the asoc tree
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

   ASoC: Intel: common: add ACPI matching tables for EHL

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

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

From f4ead53241c7dcd2f3130e059cb3dfdec0ec9871 Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Thu, 15 Aug 2019 10:57:48 -0500
Subject: [PATCH] ASoC: Intel: common: add ACPI matching tables for EHL

There are no upstream machine drivers just yet so just add dummy table
for compilation in nocodec-mode.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815155749.29304-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
