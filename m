Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FB21A56A
	for <lists+alsa-devel@lfdr.de>; Sat, 11 May 2019 00:42:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930FE190F;
	Sat, 11 May 2019 00:41:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930FE190F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557528127;
	bh=5RIfAZ3zJnkZUjYtAKYHJcq2iwaSHa+93bZflbfJjNc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYU0y2APFpr4GjsUBEgUWP3ce306EzhBAkFl9xhsoS+LEG7AtFJgwXTEgjzjNAa2C
	 tnP42OPCtIg6+ttNsaoXz3wW3nOYQhyLm4P6uGrJLwVLAHQkJ0bVUBh8X/j4drXaeL
	 /5bha3exPGEw2Ab9LqS6z/TKTgtBGQzQ8qfcliC8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD2DF8970E;
	Sat, 11 May 2019 00:39:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 958F6F89726; Sat, 11 May 2019 00:39:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB036F8970E
 for <alsa-devel@alsa-project.org>; Sat, 11 May 2019 00:39:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB036F8970E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="a6OnrweB"
Received: by mail-pg1-x541.google.com with SMTP id t22so3649488pgi.10
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 15:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=btsWjRP5fMorg/50XHE1AhFeDHrZVO/tdOU3AkASJ7Q=;
 b=a6OnrweBxtt7NkvEdUNplsNNvQ4sNDXgesDB2iG1R1yxR5CioQT6uI6SsDYsOlRGVJ
 nXWhQA0mEOMVNhRtNUO4Ccl1UQirg8OZlU1AdDJDvs4SyaOwguDHbTj44A0Jakwozs1B
 wwinoq6Vors0uxxc591xIBjZ624499lmP2Bdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=btsWjRP5fMorg/50XHE1AhFeDHrZVO/tdOU3AkASJ7Q=;
 b=RcIEcDJmJuDOZbXWBUkjbZfKkrD5vCAo7CduuroR4IrfoCifhogQw8Jkpf/PPxq5/3
 /Nlh/I4vK0PlzadmbNxm/XIGb+sNZr3StEse4lJ57gGoI+5jv3PofhodhOoV2z70NQtZ
 BUXyzXJEGtYQxXUjwFK+bzTqQB83yuroKBOApFT2LkYxKeHuQFiaVqCESG8GWNdHyCrW
 NdR5FzhrMDwpBlwfsKlTf8ikPJP6o1I3BghPPtA/YR32Hae0CUooCknmacRpV2OGOEZp
 W9qnXjkqKi3gQujlcRCHCiI/o0Mp85OW1lFzHF0PudSp0DimQNIAy6GDPJwrJJFELXYd
 4C5g==
X-Gm-Message-State: APjAAAUpMZ2SZdbqyWdl12PNQfbAfbz9W36mIpCLTCj8hofYE2gIqKoT
 yHdFh0dIdwU2xbOPjleucjA64A==
X-Google-Smtp-Source: APXvYqweIgH4BFWK+Kw6cY3nsX0Zo2SGslEeQYFM8I6kmq6sGDYYG3FZxMlP8D3EIOb5rYXde/pNnw==
X-Received: by 2002:a65:4183:: with SMTP id a3mr16513747pgq.121.1557527985655; 
 Fri, 10 May 2019 15:39:45 -0700 (PDT)
Received: from evgreen2.mtv.corp.google.com
 ([2620:15c:202:201:ffda:7716:9afc:1301])
 by smtp.gmail.com with ESMTPSA id u66sm13300540pfa.36.2019.05.10.15.39.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 10 May 2019 15:39:44 -0700 (PDT)
From: Evan Green <evgreen@chromium.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
Date: Fri, 10 May 2019 15:39:28 -0700
Message-Id: <20190510223929.165569-2-evgreen@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190510223929.165569-1-evgreen@chromium.org>
References: <20190510223929.165569-1-evgreen@chromium.org>
MIME-Version: 1.0
Cc: Rajat Jain <rajatja@chromium.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Evan Green <evgreen@chromium.org>, Ben Zhang <benzh@chromium.org>,
 Sathya Prakash <sathya.prakash.m.r@intel.com>, Naveen M <naveen.m@intel.com>
Subject: [alsa-devel] [PATCH v3 1/2] ASoC: SOF: Add Comet Lake PCI IDs
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

Add support for Intel Comet Lake platforms by adding a new Kconfig
for CometLake and the appropriate PCI IDs.

Signed-off-by: Evan Green <evgreen@chromium.org>
---

Changes in v3:
- Copy cnl_desc to new cml_desc, and avoid selecting cannonlake (Pierre-Louis)

Changes in v2:
- Add CML-H ID 0x06c8 (Pierre-Louis)

 sound/soc/sof/intel/Kconfig | 32 ++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-pci-dev.c | 28 ++++++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 603e0db4f012..17e10d65fc0c 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -24,6 +24,8 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
 	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
 	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
+	select SND_SOC_SOF_COMETLAKE_LP if SND_SOC_SOF_COMETLAKE_LP_SUPPORT
+	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -179,6 +181,36 @@ config SND_SOC_SOF_ICELAKE
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_COMETLAKE_LP
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COMETLAKE_LP_SUPPORT
+	bool "SOF support for CometLake-LP"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cometlake-LP processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+config SND_SOC_SOF_COMETLAKE_H
+	tristate
+	select SND_SOC_SOF_HDA_COMMON
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_COMETLAKE_H_SUPPORT
+	bool "SOF support for CometLake-H"
+	help
+	  This adds support for Sound Open Firmware for Intel(R) platforms
+	  using the Cometlake-H processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_HDA_COMMON
 	tristate
 	select SND_SOC_SOF_INTEL_COMMON
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b778dffb2d25..d736806c2e0d 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -129,6 +129,26 @@ static const struct sof_dev_desc cfl_desc = {
 };
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP) || \
+	IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
+
+static const struct sof_dev_desc cml_desc = {
+	.machines		= snd_soc_acpi_intel_cnl_machines,
+	.resindex_lpe_base	= 0,
+	.resindex_pcicfg_base	= -1,
+	.resindex_imr_base	= -1,
+	.irqindex_host_ipc	= -1,
+	.resindex_dma_base	= -1,
+	.chip_info = &cnl_chip_info,
+	.default_fw_path = "intel/sof",
+	.default_tplg_path = "intel/sof-tplg",
+	.nocodec_fw_filename = "sof-cnl.ri",
+	.nocodec_tplg_filename = "sof-cnl-nocodec.tplg",
+	.ops = &sof_cnl_ops,
+	.arch_ops = &sof_xtensa_arch_ops
+};
+#endif
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 static const struct sof_dev_desc icl_desc = {
 	.machines               = snd_soc_acpi_intel_icl_machines,
@@ -353,6 +373,14 @@ static const struct pci_device_id sof_pci_ids[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_ICELAKE)
 	{ PCI_DEVICE(0x8086, 0x34C8),
 		.driver_data = (unsigned long)&icl_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
+	{ PCI_DEVICE(0x8086, 0x02c8),
+		.driver_data = (unsigned long)&cml_desc},
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
+	{ PCI_DEVICE(0x8086, 0x06c8),
+		.driver_data = (unsigned long)&cml_desc},
 #endif
 	{ 0, }
 };
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
