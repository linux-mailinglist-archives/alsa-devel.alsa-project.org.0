Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A89D38F1FE
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 19:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 447FF845;
	Thu, 15 Aug 2019 19:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 447FF845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565889659;
	bh=srm9GZxckOPHvR7DiG0XmA31cWG2ie9Rq96/gu1L64g=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Tgi2ISZuuBsNq4brZKxa5Yvytybuq3cMycX9UjEtG3T9e2mo59HZmkHHOlyCw7y/o
	 FSPntw6KHhYcVXEdxk/lWiaQpk9ip/CScEHHJn9AxlnBmdSI93hdYr3GJVAeQoDzin
	 v+ojGtFqbk2JbEj9JJ8KgQHMyNiOXpp4skHxUoIY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A064F805E2;
	Thu, 15 Aug 2019 19:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B19B8F8065C; Thu, 15 Aug 2019 19:14:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 RCVD_IN_MSPIKE_H2, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ed1-f98.google.com (mail-ed1-f98.google.com
 [209.85.208.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 942AEF80274
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 19:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 942AEF80274
Received: by mail-ed1-f98.google.com with SMTP id h8so2703738edv.7
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 10:14:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:message-id:date;
 bh=iTuZbVv0RD9v5h0wsdOVg08Bs8+3GnEFLGdWnHoNJNc=;
 b=l+1kIGeGL9uGelYQwSvEY0lvKo0AVv5yE5cf0IkefyvnEz+dE1CdqWUcknWvg3/Vfe
 jLYquy9EzASdHXel/SYOnaExzdO8I/CjVJiTq6Jv+V/7rSh07LEJz6RVNf2zmP1VyJo2
 OgB6GnCl4nVtq4WyDZVwsr8WwVq4r0e/2Ca8lDWkotFgDqndyL3CyOMwOWdL5o8SMVBB
 7dqvjpdZsUbMC31ZKcYW10YRBDeCjPiJePM1fez9DDASOt++qZPn2a0H+1mSAa6n3v7b
 vAqAJ2eddqjQDHZWothKGHr3dL4eVL2L41ZGaYxWgOaeKuBrkz8XMDqDjGBcaBQthIyp
 Sztg==
X-Gm-Message-State: APjAAAVQe600urb0YN1hZikxHw2JC7obaDpMQ4RFNQKUDDemE6GL68a9
 XKVdOau18c+ozD+1hhusrnPu+wIg5nfYykQ0TdRoSxUjSx5VMCDeKBZkGsOBTn9ocw==
X-Google-Smtp-Source: APXvYqwLWifibfoWfBNQMAGsi0SFj5bb14CTu1EssBwn6hdjNKXd7Ok4ATdfdO74mEccqkgPyAM6JQMgU692
X-Received: by 2002:a17:906:490d:: with SMTP id
 b13mr5562281ejq.16.1565889262604; 
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk.
 [2a01:7e01::f03c:91ff:fed4:a3b6])
 by smtp-relay.gmail.com with ESMTPS id rh24sm11224ejb.45.2019.08.15.10.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Aug 2019 10:14:22 -0700 (PDT)
X-Relaying-Domain: sirena.org.uk
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hyJKQ-00050s-1F; Thu, 15 Aug 2019 17:14:22 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 610972742BE8; Thu, 15 Aug 2019 18:14:21 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Pan Xiuli <xiuli.pan@linux.intel.com>
In-Reply-To: <20190815155749.29304-2-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190815171421.610972742BE8@ypsilon.sirena.org.uk>
Date: Thu, 15 Aug 2019 18:14:21 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: Intel: common: add ACPI matching tables
	for Tiger Lake" to the asoc tree
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

   ASoC: Intel: common: add ACPI matching tables for Tiger Lake

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

From 5f7af9ecebce7fab78b0237b0cd998f2ed3de03c Mon Sep 17 00:00:00 2001
From: Pan Xiuli <xiuli.pan@linux.intel.com>
Date: Thu, 15 Aug 2019 10:57:46 -0500
Subject: [PATCH] ASoC: Intel: common: add ACPI matching tables for Tiger Lake

Initial support for TGL w/ RT1308

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190815155749.29304-2-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-acpi-intel-match.h          |  1 +
 sound/soc/intel/common/Makefile               |  1 +
 .../intel/common/soc-acpi-intel-tgl-match.c   | 24 +++++++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 sound/soc/intel/common/soc-acpi-intel-tgl-match.c

diff --git a/include/sound/soc-acpi-intel-match.h b/include/sound/soc-acpi-intel-match.h
index bb5e1e4ce8bf..ce6c4a970939 100644
--- a/include/sound/soc-acpi-intel-match.h
+++ b/include/sound/soc-acpi-intel-match.h
@@ -25,6 +25,7 @@ extern struct snd_soc_acpi_mach snd_soc_acpi_intel_bxt_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_glk_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_cnl_machines[];
 extern struct snd_soc_acpi_mach snd_soc_acpi_intel_icl_machines[];
+extern struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[];
 
 /*
  * generic table used for HDA codec-based platforms, possibly with
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index 56c81e20b5bf..a14aca62ff96 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -8,6 +8,7 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 	soc-acpi-intel-skl-match.o soc-acpi-intel-kbl-match.o \
 	soc-acpi-intel-bxt-match.o soc-acpi-intel-glk-match.o \
 	soc-acpi-intel-cnl-match.o soc-acpi-intel-icl-match.o \
+	soc-acpi-intel-tgl-match.o \
 	soc-acpi-intel-hda-match.o
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
new file mode 100644
index 000000000000..57a6298d6dca
--- /dev/null
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.
+ *
+ * Copyright (c) 2019, Intel Corporation.
+ *
+ */
+
+#include <sound/soc-acpi.h>
+#include <sound/soc-acpi-intel-match.h>
+
+struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
+	{
+		.id = "10EC1308",
+		.drv_name = "tgl_rt1308",
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt1308.tplg",
+	},
+	{},
+};
+EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
+
+MODULE_LICENSE("GPL v2");
+MODULE_DESCRIPTION("Intel Common ACPI Match module");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
