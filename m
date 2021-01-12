Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF8A2F3B88
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jan 2021 21:34:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 184E41725;
	Tue, 12 Jan 2021 21:33:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 184E41725
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610483666;
	bh=TYGoP0e4lWzfWMsLEoepcVFfraVvg0SxO3S88gQBLrc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d3qlcSNxKTWhaTReR7cxNIkiY0/7K/V5dl1TV0yPni9EJAZqjICOkrUPR7h/ldcn/
	 nuUOJayLRrQb3G5qJ21iXz7NIUI1JnW6hSHlYoi9bDRAs27T/XSjSMAjNpirfl4OP4
	 b7MW1BrPuLLQnihgJLjMhHOiugsraSLAOATA64T0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92C86F804C1;
	Tue, 12 Jan 2021 21:33:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A0ADF804AB; Tue, 12 Jan 2021 21:33:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E5DA5F80249;
 Tue, 12 Jan 2021 21:33:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E5DA5F80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nNWek36z"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9635823120;
 Tue, 12 Jan 2021 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610483589;
 bh=TYGoP0e4lWzfWMsLEoepcVFfraVvg0SxO3S88gQBLrc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nNWek36zVFKo7ntNqeLSZASuPLtqfR4fzqFvMignoc0GasY2x7F10w65qOdBK/mMH
 C1jQOpecLerK3l5C4M3CWDE6fTvijR6uEekAI9JJO0QXAJS0TXHMm93l1Dc4a9ei6I
 YgrnFuTK0/8loApW5DcBP4UNCM+CXXgIM5YXONM/R31t3eTmyjWdwwSL32IDmYR9v7
 qrsQD4rJNvEIGOvs/vNZz84lgdQbEjC06nSCfOvSNXz7A+A01qMMx7Sb+dzLy0l9za
 y5HWz1opIog26drQO1/7SfQqi3shJblHxgCXiyCo5ssKzqX5yF+d+jvPVX+dtVe8WW
 xhyphVLsf95ng==
From: Arnd Bergmann <arnd@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/2] ASoC: intel: fix soundwire dependencies
Date: Tue, 12 Jan 2021 21:32:18 +0100
Message-Id: <20210112203250.2576775-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112203250.2576775-1-arnd@kernel.org>
References: <20210112203250.2576775-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

From: Arnd Bergmann <arnd@arndb.de>

The Kconfig logic around SND_SOC_SOF_INTEL_SOUNDWIRE tries to
ensure that all sound modules can be built with the minimal
dependencies, but this fails in some configurations:

x86_64-linux-ld: sound/hda/intel-dsp-config.o: in function `snd_intel_dsp_driver_probe':
intel-dsp-config.c:(.text+0x134): undefined reference to `sdw_intel_acpi_scan'

Specifically, this happens if the dsp-config driver is built-in but does
not need to use soundwire, while CONFIG_SOUNDWIRE_INTEL is enabled as
a loadable module.

An easier and more correct way to do this is to remove
CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE_LINK and instead have
the two drivers that can link against SOUNDWIRE_INTEL,
i.e. DSP_CONFIG and SND_SOC_SOF_HDA, select that driver whenever
SND_SOC_SOF_INTEL_SOUNDWIRE_LINK is set.

This however means that SND_SOC_SOF_INTEL_SOUNDWIRE cannot be selected
by users when SOUNDWIRE is only usable by loadable modules and one or
more drivers using SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE is built-in.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 sound/hda/Kconfig           |  1 +
 sound/soc/sof/intel/Kconfig | 16 ++++++----------
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/hda/Kconfig b/sound/hda/Kconfig
index 3bc9224d5e4f..ecab814d7698 100644
--- a/sound/hda/Kconfig
+++ b/sound/hda/Kconfig
@@ -44,5 +44,6 @@ config SND_INTEL_NHLT
 config SND_INTEL_DSP_CONFIG
 	tristate
 	select SND_INTEL_NHLT if ACPI
+	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE
 	# this config should be selected only for Intel DSP platforms.
 	# A fallback is provided so that the code compiles in all cases.
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 67365ce0d86d..df8f9760870e 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -330,13 +330,17 @@ config SND_SOC_SOF_HDA
 	tristate
 	select SND_HDA_EXT_CORE if SND_SOC_SOF_HDA_LINK
 	select SND_SOC_HDAC_HDA if SND_SOC_SOF_HDA_AUDIO_CODEC
+	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
+config SND_SOC_SOF_INTEL_SOUNDWIRE
 	bool "SOF support for SoundWire"
-	depends on SOUNDWIRE && ACPI
+	depends on SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	depends on SOUNDWIRE
+	depends on ACPI
+	depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)
 	help
 	  This adds support for SoundWire with Sound Open Firmware
 	  for Intel(R) platforms.
@@ -345,14 +349,6 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	tristate
-	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-config SND_SOC_SOF_INTEL_SOUNDWIRE
-	tristate
-	select SOUNDWIRE_INTEL
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
-- 
2.29.2

