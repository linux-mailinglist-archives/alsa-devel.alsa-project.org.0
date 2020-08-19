Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B4324AC56
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Aug 2020 02:40:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F270168F;
	Thu, 20 Aug 2020 02:39:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F270168F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597884032;
	bh=PvnQ7rPY+1oDp5wgiT6xLrY9UAr6r6O3NXYvYPe0NEs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=b/KZ8NVmLW3X92wevSYu2SBvGImR6hp5iOtOCdsCSzUK8RiLTOKzDyV05KMMc/vNf
	 DnUABxthKF4u8tKsZZciGdmQzDVRiy34pr4GdbRSKRCw1oJFnBQ5y3XNO5h3NdlxS+
	 nEQ4DxK3BEQANPk1o0yvwYHYuI6MJhdGLXCDahxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FA24F80114;
	Thu, 20 Aug 2020 02:38:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6DE6F8025A; Thu, 20 Aug 2020 02:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67EBCF80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Aug 2020 02:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67EBCF80114
IronPort-SDR: oZkxZmN7adZAImvDo5GBvrFvCt/mgkD6ZRggu6P9cfsW2J3KoAdLHqZ92e1+4HiSWMo887pphU
 HI99IPVnUnLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9718"; a="143031990"
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="143031990"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 17:38:15 -0700
IronPort-SDR: DK4xeuBm6hCXz0Uru8ooTQDEMpzuloNBFLZFPUDxsxg6ldwCkr7FgX4D9dGF/ngGfFBAmaokiP
 KFQ5UjxWBiUw==
X-IronPort-AV: E=Sophos;i="5.76,332,1592895600"; d="scan'208";a="279836321"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 17:38:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [RESEND] ASoC: SOF: Intel: add build support for SoundWire
Date: Wed, 19 Aug 2020 20:44:29 +0800
Message-Id: <20200819124429.3785-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: vkoul@kernel.org, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Select SoundWire capabilities on newer Intel platforms, starting with
CannonLake/CoffeeLake/CometLake.

As done for HDaudio, the SoundWire link is an opt-in capability. We
explicitly test for ACPI to avoid warnings on unmet dependencies on
the SoundWire side.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 3aaf25e4f766..f644010cc568 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -166,6 +166,7 @@ config SND_SOC_SOF_CANNONLAKE_SUPPORT
 config SND_SOC_SOF_CANNONLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -181,6 +182,7 @@ config SND_SOC_SOF_COFFEELAKE_SUPPORT
 config SND_SOC_SOF_COFFEELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -196,6 +198,7 @@ config SND_SOC_SOF_ICELAKE_SUPPORT
 config SND_SOC_SOF_ICELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -203,6 +206,7 @@ config SND_SOC_SOF_ICELAKE
 config SND_SOC_SOF_COMETLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -229,6 +233,7 @@ config SND_SOC_SOF_TIGERLAKE_SUPPORT
 config SND_SOC_SOF_TIGERLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -244,6 +249,7 @@ config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 config SND_SOC_SOF_ELKHARTLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -329,6 +335,29 @@ config SND_SOC_SOF_HDA
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
+	bool "SOF support for SoundWire"
+	depends on SOUNDWIRE && ACPI
+	help
+	  This adds support for SoundWire with Sound Open Firmware
+		  for Intel(R) platforms.
+	  Say Y if you want to enable SoundWire links with SOF.
+	  If unsure select "N".
+
+config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	tristate
+	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_INTEL_SOUNDWIRE
+	tristate
+	select SOUNDWIRE_INTEL
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 endif ## SND_SOC_SOF_INTEL_PCI
 
 endif ## SND_SOC_SOF_INTEL_TOPLEVEL
-- 
2.17.1

