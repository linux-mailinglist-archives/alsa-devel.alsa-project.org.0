Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1B1FD2C8
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 18:50:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 785A31676;
	Wed, 17 Jun 2020 18:49:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 785A31676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592412640;
	bh=mNmfb1HSB4WNfbWui8FvqpiIMauzYi369x2gMnjq+XM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n8w7KqpwuENUfgsM7AGuBP4o7ORzPxk7FQr+DbaCt3oDgwLVFWoPMmKzOxyLMYEkF
	 kiPNqHNvnDt6rGeiY5wDTB4ETvYdxK9qz32ZSmGuGjMuDq2xJ9mm9tWOWOZDYzXhRp
	 dSnFuxuF8vdYX27QT0mQYzg2wfye0059++pXr9nY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04F00F801D9;
	Wed, 17 Jun 2020 18:48:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1819FF801EB; Wed, 17 Jun 2020 18:48:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 339C1F80116
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 18:48:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 339C1F80116
IronPort-SDR: JMBX0/9rWOqnCEew6AfydYHNhtpvrRgYqNa0Z6RwC8G9cnOlzXR1uo3gXl6FgvA51TdrBeSSVj
 IUM0KYfsLXPg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 09:48:01 -0700
IronPort-SDR: FwN7cfgpecogG39xFD0FH7WgC4TGGGDLa40Dwd6NdiGI2ZbWOQ3o9vNSOhDsG5SzoUgggfY4q/
 PrzMxmmSEDWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; d="scan'208";a="261776793"
Received: from zdsmith-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.229.128])
 by fmsmga007.fm.intel.com with ESMTP; 17 Jun 2020 09:48:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: Intel: SOF: merge COMETLAKE_LP and COMETLAKE_H
Date: Wed, 17 Jun 2020 11:47:53 -0500
Message-Id: <20200617164755.18104-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
References: <20200617164755.18104-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

We already have two configurations for CometLake, and a third one
coming. On other platforms, we used a single Kconfig option, so we
should follow the same trend by merging the two cases in a backwards
compatible way.

The backwards compatibility is handled by overloading the COMETLAKE_LP
kconfig as COMETLAKE. In practice we've never seen a case where
COMETLAKE_H is not selected along with COMETLAKE_LP, so keeping one
of the two is enough.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/intel-dsp-config.c   |  4 +---
 sound/soc/intel/boards/Kconfig |  4 ++--
 sound/soc/sof/intel/Kconfig    | 29 ++++++++---------------------
 sound/soc/sof/sof-pci-dev.c    | 12 ++++--------
 4 files changed, 15 insertions(+), 34 deletions(-)

diff --git a/sound/hda/intel-dsp-config.c b/sound/hda/intel-dsp-config.c
index 20b8f6cb3ff8..99aec7349167 100644
--- a/sound/hda/intel-dsp-config.c
+++ b/sound/hda/intel-dsp-config.c
@@ -208,8 +208,8 @@ static const struct config_entry config_table[] = {
 	},
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
 /* Cometlake-LP */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
 	{
 		.flags = FLAG_SOF,
 		.device = 0x02c8,
@@ -240,9 +240,7 @@ static const struct config_entry config_table[] = {
 		.flags = FLAG_SOF | FLAG_SOF_ONLY_IF_DMIC_OR_SOUNDWIRE,
 		.device = 0x02c8,
 	},
-#endif
 /* Cometlake-H */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
 	{
 		.flags = FLAG_SOF,
 		.device = 0x06c8,
diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a2a5798c9139..5dc489a79454 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -492,7 +492,7 @@ config SND_SOC_INTEL_SOF_PCM512x_MACH
 
 endif ## SND_SOC_SOF_HDA_LINK || SND_SOC_SOF_BAYTRAIL
 
-if (SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK)
+if (SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK)
 
 config SND_SOC_INTEL_CML_LP_DA7219_MAX98357A_MACH
 	tristate "CML_LP with DA7219 and MAX98357A in I2S Mode"
@@ -520,7 +520,7 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
+endif ## SND_SOC_SOF_COMETLAKE && SND_SOC_SOF_HDA_LINK
 
 if SND_SOC_SOF_JASPERLAKE
 
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index c9a2bee4b55c..3aaf25e4f766 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -25,8 +25,7 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_CANNONLAKE  if SND_SOC_SOF_CANNONLAKE_SUPPORT
 	select SND_SOC_SOF_COFFEELAKE  if SND_SOC_SOF_COFFEELAKE_SUPPORT
 	select SND_SOC_SOF_ICELAKE     if SND_SOC_SOF_ICELAKE_SUPPORT
-	select SND_SOC_SOF_COMETLAKE_LP if SND_SOC_SOF_COMETLAKE_LP_SUPPORT
-	select SND_SOC_SOF_COMETLAKE_H if SND_SOC_SOF_COMETLAKE_H_SUPPORT
+	select SND_SOC_SOF_COMETLAKE   if SND_SOC_SOF_COMETLAKE_SUPPORT
 	select SND_SOC_SOF_TIGERLAKE   if SND_SOC_SOF_TIGERLAKE_SUPPORT
 	select SND_SOC_SOF_ELKHARTLAKE if SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	select SND_SOC_SOF_JASPERLAKE  if SND_SOC_SOF_JASPERLAKE_SUPPORT
@@ -201,34 +200,22 @@ config SND_SOC_SOF_ICELAKE
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
-config SND_SOC_SOF_COMETLAKE_LP
+config SND_SOC_SOF_COMETLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
-config SND_SOC_SOF_COMETLAKE_LP_SUPPORT
-	bool "SOF support for CometLake-LP"
-	help
-	  This adds support for Sound Open Firmware for Intel(R) platforms
-	  using the Cometlake-LP processors.
-	  Say Y if you have such a device.
-	  If unsure select "N".
+config SND_SOC_SOF_COMETLAKE_SUPPORT
+	bool
 
-config SND_SOC_SOF_COMETLAKE_H
-	tristate
-	select SND_SOC_SOF_HDA_COMMON
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
-
-config SND_SOC_SOF_COMETLAKE_H_SUPPORT
-	bool "SOF support for CometLake-H"
+config SND_SOC_SOF_COMETLAKE_LP_SUPPORT
+	bool "SOF support for CometLake"
+	select SND_SOC_SOF_COMETLAKE_SUPPORT
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
-	  using the Cometlake-H processors.
-	  Say Y if you have such a device.
+	  using the Cometlake processors.
 	  If unsure select "N".
 
 config SND_SOC_SOF_TIGERLAKE_SUPPORT
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b13697dab7c0..7b5f6e17b05f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -151,9 +151,7 @@ static const struct sof_dev_desc cfl_desc = {
 };
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP) || \
-	IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
-
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
 static const struct sof_dev_desc cml_desc = {
 	.machines		= snd_soc_acpi_intel_cml_machines,
 	.alt_machines		= snd_soc_acpi_intel_cml_sdw_machines,
@@ -420,12 +418,10 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE(0x8086, 0x4dc8),
 		.driver_data = (unsigned long)&jsl_desc},
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_LP)
-	{ PCI_DEVICE(0x8086, 0x02c8),
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE)
+	{ PCI_DEVICE(0x8086, 0x02c8), /* CML-LP */
 		.driver_data = (unsigned long)&cml_desc},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_COMETLAKE_H)
-	{ PCI_DEVICE(0x8086, 0x06c8),
+	{ PCI_DEVICE(0x8086, 0x06c8), /* CML-H */
 		.driver_data = (unsigned long)&cml_desc},
 #endif
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_TIGERLAKE)
-- 
2.20.1

