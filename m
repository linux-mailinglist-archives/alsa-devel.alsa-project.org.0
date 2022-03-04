Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020A4CDEE4
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:47:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5D251F46;
	Fri,  4 Mar 2022 21:46:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5D251F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646426861;
	bh=wrZboFzFu2txjepiK5VJgebOImXh1Iskcke9yA0NWZM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I8fbVBcZ7PTTh3kiwwWZ0k48Nl0xmLAwiGvEx8LRnDIcxH81X20QCdftRzjrcaNYW
	 yyPv8XjpDo0x3WwhccnVur4OAz5y+zGNmNAnSXBnL8Ut57vxjtWleW8pf2po0sa5pW
	 sTKsDMVKhKeSe5mRcdmPVkMFHDBc0tEn4Oweqv5c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA994F80518;
	Fri,  4 Mar 2022 21:45:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20A50F804E4; Fri,  4 Mar 2022 21:45:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D21C1F800FA
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D21C1F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OPHMGaLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646426753; x=1677962753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wrZboFzFu2txjepiK5VJgebOImXh1Iskcke9yA0NWZM=;
 b=OPHMGaLFdW9Cu3IPIuhmC4Y6NLfFn7aCl0ob0CO9WP9C7vfuPnOqoTv3
 ag6FjpLRhTgs2uUxR7MgKDpUtT4jPmbggsWYwdllJg2bI15AClrZ0AQg3
 7l3GOS4FYuduDqYv8js0LXCVNVvSy1bTbITMou7gv5VqjxB8lDQPvta5y
 spbhRCBeg74D3r/4iwYtbd7vWDP+jd6gfo849qhlRTgao/Pds2oMpC1iX
 0NCkWqVC/UOdi8z9PNOE0H+M3Y+eDDmYB+m9+NaxEjs0MMWn3k4dBqC1z
 +s79B5Oa1pLgHCZF/RsaMg3JyWlBU0utaTnC2DwfGc8q9glJUIHQ7H7vl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="314776825"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="314776825"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="640695972"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: Intel: boards: add GPIOLIB dependency where missed
Date: Fri,  4 Mar 2022 14:45:31 -0600
Message-Id: <20220304204532.54675-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
References: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

We have eleven machine drivers who make explicit references to
gpios. Let's add the dependency.

The use of 'depends on' instead of 'select' is intentional. On one
side it could be argued that the GPIOs are required, but on the other
it might create more issues with randconfig builds. This patch sticks
with the existing direction of using 'depends' on high-level non-audio
dependencies

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index b0baf3fce05b..6884ddf9edad 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -103,6 +103,7 @@ config SND_SOC_INTEL_BYTCR_RT5640_MACH
 	tristate "Baytrail and Baytrail-CR with RT5640 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5640
 	help
@@ -115,6 +116,7 @@ config SND_SOC_INTEL_BYTCR_RT5651_MACH
 	tristate "Baytrail and Baytrail-CR with RT5651 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5651
 	help
@@ -127,6 +129,7 @@ config SND_SOC_INTEL_BYTCR_WM5102_MACH
 	tristate "Baytrail and Baytrail-CR with WM5102 codec"
 	depends on MFD_ARIZONA && MFD_WM5102 && SPI_MASTER && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_WM5102
 	help
@@ -139,6 +142,7 @@ config SND_SOC_INTEL_CHT_BSW_RT5672_MACH
 	tristate "Cherrytrail & Braswell with RT5672 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_RT5670
 	help
@@ -163,6 +167,7 @@ config SND_SOC_INTEL_CHT_BSW_MAX98090_TI_MACH
 	tristate "Cherrytrail & Braswell with MAX98090 & TI codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_MAX98090
 	select SND_SOC_TS3A227E
 	help
@@ -187,6 +192,7 @@ config SND_SOC_INTEL_BYT_CHT_CX2072X_MACH
 	tristate "Baytrail & Cherrytrail with CX2072X codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_CX2072X
 	help
@@ -211,6 +217,7 @@ config SND_SOC_INTEL_BYT_CHT_ES8316_MACH
 	tristate "Baytrail & Cherrytrail with ES8316 codec"
 	depends on I2C && ACPI
 	depends on X86_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_ACPI
 	select SND_SOC_ES8316
 	help
@@ -332,6 +339,7 @@ config SND_SOC_INTEL_SOF_WM8804_MACH
 	tristate "SOF with Wolfson/Cirrus WM8804 codec"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_WM8804_I2C
 	help
 	  This adds support for ASoC machine driver for Intel platforms
@@ -404,6 +412,7 @@ config SND_SOC_INTEL_KBL_RT5660_MACH
 	tristate "KBL with RT5660 in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	select SND_SOC_RT5660
 	select SND_SOC_HDAC_HDMI
 	help
@@ -522,8 +531,9 @@ config SND_SOC_INTEL_SOF_PCM512x_MACH
 
 config SND_SOC_INTEL_SOF_ES8336_MACH
 	tristate "SOF with ES8336 codec in I2S mode"
-	depends on I2C && ACPI && GPIOLIB
+	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on GPIOLIB || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI && SND_SOC_SOF_HDA_AUDIO_CODEC
 	select SND_SOC_ES8316
 	select SND_SOC_DMIC
-- 
2.30.2

