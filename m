Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F851742B1
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:14:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21F0516E3;
	Sat, 29 Feb 2020 00:13:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21F0516E3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582931648;
	bh=vtaK1KowhZJch2b+YATNlHyDR8xlGLN+TRxn4LlxzsY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ju/7/9faU6SGhUdYj5fSx2D24ZJMvIAH7aBx5k9+/MkL08PB3R9WtaYYlB9MLC+Fd
	 LhRKlpKSNLbO9K12bQhU36VcDZv6bUvvo46ktyEjRn7SqNKIG9Yf9EcKNiET67+beU
	 2iKEYr01szwX8JmdIAdNHEshd11ujU9xns62ADS8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C81E0F80213;
	Sat, 29 Feb 2020 00:12:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 954D7F8016F; Sat, 29 Feb 2020 00:12:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CBD2F8014D
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:12:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CBD2F8014D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:12:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="232402936"
Received: from rbconrad-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by orsmga008.jf.intel.com with ESMTP; 28 Feb 2020 15:12:13 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/9] ASoC: Intel: boards: drop reverse deps for
 SND_HDA_CODEC_HDMI
Date: Fri, 28 Feb 2020 17:11:56 -0600
Message-Id: <20200228231204.9026-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, kbuild test robot <lkp@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Having a reverse dependency to a config that has its own additional
dependencies, is generally not recommended. And this applies to
select statements for SND_HDA_CODEC_HDMI, e.g. the case where SND_HDA
and SND_SOC_SOF_HDA are built as modules, but the machine driver is
built-in, leading to compile errors (reported as
i386-randconfig-e003-20200206).

Give up on trying to define different dependencies based on SOF/SST
selection, and simply add a "depends on" for SND_HDA_CODEC_HDMI. This
fixes the issue with randconfigs. Only downside is that SND_HDA_CODEC_HDMI
may be built unnecessarily in some cases, but this seems like the lesser
evil.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: aa2b4a5 ('ASoC: Intel: boards: fix incorrect HDMI Kconfig dependency')
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 755e1de19df9..67d85a7be559 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -289,7 +289,6 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -302,6 +301,7 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
@@ -402,6 +402,7 @@ config SND_SOC_INTEL_GLK_DA7219_MAX98357A_MACH
 	tristate "GLK with DA7219 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
@@ -413,10 +414,10 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	tristate "GLK with RT5682 and MAX98357A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
@@ -430,7 +431,7 @@ if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "SKL/KBL/BXT/APL with HDA Codecs"
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
@@ -448,9 +449,9 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on I2C && ACPI
 	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for SOF platforms
@@ -490,11 +491,11 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	tristate "CML with RT1011 and RT5682 in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_RT1011
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platform with
 	  RT1011 + RT5682 I2S codec.
@@ -509,10 +510,10 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	tristate "SOF with DA7219 and MAX98373 in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98373
 	select SND_SOC_DMIC
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with DA7219 + MAX98373 I2S audio codec.
-- 
2.20.1

