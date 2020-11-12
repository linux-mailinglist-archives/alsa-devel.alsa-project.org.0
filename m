Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBEF82B0AB3
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 17:48:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDE4F1854;
	Thu, 12 Nov 2020 17:47:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDE4F1854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605199690;
	bh=Vxmw4NfLxpxQ8aUAue3Bo/jZ6Yig/oMaQeR7oTApznA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K+DsUK07IAjWDh1D4/qpWshEoe0WSiiC3G0tDh6wVRAcse2Rx1tpGFdHAhxh0KXsO
	 +rAwebCe6OVlkqQqIb/5C69G4yIzz5FpJKgBAqfVoOH54Br0na1RQvIvI4vCbjx/ho
	 QgKYiGncqQSGk5B7EJAXrecQ7brt5Tk0S3mM6e70=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D00DF804E4;
	Thu, 12 Nov 2020 17:45:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F819F804E5; Thu, 12 Nov 2020 17:45:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CEF2CF804DF
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 17:45:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEF2CF804DF
IronPort-SDR: lOTFdwCwy3lHxbVY9sIEwEWXa84YlstkJxYMKUubWOb0bMMctN+y6BiMw5Ow1MDvrIwcs/gaQ4
 2BgQnCYxGipA==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170508866"
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="170508866"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:40 -0800
IronPort-SDR: eU7+8Igsp02NOzAtORq/AyxktJNKHnGQeqS4eUwwCA9HDZPtIJ4m3KsMFR1aH+OrNTV2Yi4xio
 /7+waracZUpA==
X-IronPort-AV: E=Sophos;i="5.77,472,1596524400"; d="scan'208";a="355251426"
Received: from uikram-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.181.67])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 08:44:39 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 3/4] ASoC: SOF: Intel: fix Kconfig punctuation and wording
Date: Thu, 12 Nov 2020 10:44:24 -0600
Message-Id: <20201112164425.25603-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
References: <20201112164425.25603-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Randy Dunlap <rdunlap@infradead.org>

Add periods at the end of sentences in help text.
Insert a "not" in one place.
Fix help text indentation.
Remove a duplicate "Intel(R)" in one place.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 62 ++++++++++++++++++-------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index a066e08860cb..75018e61fdda 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -15,7 +15,7 @@ config SND_SOC_SOF_INTEL_ACPI
 	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_PCI
 	def_tristate SND_SOC_SOF_PCI
@@ -31,13 +31,13 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_JASPERLAKE  if SND_SOC_SOF_JASPERLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	tristate
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	tristate
@@ -45,7 +45,7 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_COMMON
 	tristate
@@ -55,7 +55,7 @@ config SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_ACPI if ACPI
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 if SND_SOC_SOF_INTEL_ACPI
 
@@ -72,7 +72,7 @@ config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	  recommended for distros. At some point all legacy drivers will be
 	  deprecated but not before all userspace firmware/topology/UCM files
 	  are made available to downstream distros.
-	  Say Y if you want to enable SOF on Baytrail/Cherrytrail
+	  Say Y if you want to enable SOF on Baytrail/Cherrytrail.
 	  If unsure select "N".
 
 config SND_SOC_SOF_BAYTRAIL
@@ -80,7 +80,7 @@ config SND_SOC_SOF_BAYTRAIL
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
@@ -91,11 +91,11 @@ config SND_SOC_SOF_BROADWELL_SUPPORT
 	  This option is mutually exclusive with the Haswell/Broadwell legacy
 	  driver. If you want to enable SOF on Broadwell you need to deselect
 	  the legacy driver first.
-	  SOF does fully support Broadwell yet, so this option is not
+	  SOF does not fully support Broadwell yet, so this option is not
 	  recommended for distros. At some point all legacy drivers will be
 	  deprecated but not before all userspace firmware/topology/UCM files
 	  are made available to downstream distros.
-	  Say Y if you want to enable SOF on Broadwell
+	  Say Y if you want to enable SOF on Broadwell.
 	  If unsure select "N".
 
 config SND_SOC_SOF_BROADWELL
@@ -104,7 +104,7 @@ config SND_SOC_SOF_BROADWELL
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 endif ## SND_SOC_SOF_INTEL_ACPI
 
@@ -123,7 +123,7 @@ config SND_SOC_SOF_MERRIFIELD
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_APOLLOLAKE_SUPPORT
 	bool "SOF support for Apollolake"
@@ -138,7 +138,7 @@ config SND_SOC_SOF_APOLLOLAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_GEMINILAKE_SUPPORT
 	bool "SOF support for GeminiLake"
@@ -153,7 +153,7 @@ config SND_SOC_SOF_GEMINILAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_CANNONLAKE_SUPPORT
 	bool "SOF support for Cannonlake"
@@ -169,7 +169,7 @@ config SND_SOC_SOF_CANNONLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COFFEELAKE_SUPPORT
 	bool "SOF support for CoffeeLake"
@@ -185,7 +185,7 @@ config SND_SOC_SOF_COFFEELAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_ICELAKE_SUPPORT
 	bool "SOF support for Icelake"
@@ -201,7 +201,7 @@ config SND_SOC_SOF_ICELAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COMETLAKE
 	tristate
@@ -209,7 +209,7 @@ config SND_SOC_SOF_COMETLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COMETLAKE_SUPPORT
 	bool
@@ -236,7 +236,7 @@ config SND_SOC_SOF_TIGERLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	bool "SOF support for ElkhartLake"
@@ -252,7 +252,7 @@ config SND_SOC_SOF_ELKHARTLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_JASPERLAKE_SUPPORT
 	bool "SOF support for JasperLake"
@@ -267,7 +267,7 @@ config SND_SOC_SOF_JASPERLAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA_COMMON
 	tristate
@@ -275,7 +275,7 @@ config SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 if SND_SOC_SOF_HDA_COMMON
 
@@ -285,7 +285,7 @@ config SND_SOC_SOF_HDA_LINK
 	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDA links(HDA/HDMI) with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable HDA links with SOF.
 	  If unsure select "N".
 
@@ -294,7 +294,7 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	depends on SND_SOC_SOF_HDA_LINK
 	help
 	  This adds support for HDAudio codecs with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
@@ -302,8 +302,8 @@ config SND_SOC_SOF_HDA_PROBES
 	bool "SOF enable probes over HDA"
 	depends on SND_SOC_SOF_DEBUG_PROBES
 	help
-	  This option enables the data probing for Intel(R).
-		  Intel(R) Skylake and newer platforms.
+	  This option enables the data probing for Intel(R)
+	  Skylake and newer platforms.
 	  Say Y if you want to enable probes.
 	  If unsure, select "N".
 
@@ -314,7 +314,7 @@ config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
 	  and disables known workarounds for specific HDAudio platforms.
 	  Only use to look into power optimizations on platforms not
 	  affected by DMI L1 issues. This option is not recommended.
-	  Say Y if you want to enable DMI Link L1
+	  Say Y if you want to enable DMI Link L1.
 	  If unsure, select "N".
 
 endif ## SND_SOC_SOF_HDA_COMMON
@@ -324,7 +324,7 @@ config SND_SOC_SOF_HDA_LINK_BASELINE
 	select SND_SOC_SOF_HDA if SND_SOC_SOF_HDA_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA
 	tristate
@@ -333,14 +333,14 @@ config SND_SOC_SOF_HDA
 	select SND_INTEL_DSP_CONFIG
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
 	bool "SOF support for SoundWire"
 	depends on SOUNDWIRE && ACPI
 	help
 	  This adds support for SoundWire with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable SoundWire links with SOF.
 	  If unsure select "N".
 
@@ -349,14 +349,14 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE
 	tristate
 	select SOUNDWIRE_INTEL
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 endif ## SND_SOC_SOF_INTEL_PCI
 
-- 
2.25.1

