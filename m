Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C308C206BD7
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jun 2020 07:38:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F874172C;
	Wed, 24 Jun 2020 07:37:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F874172C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592977099;
	bh=1rwLMM+C+hpVrXORuMN9FHNUK7fr8qy0T9M+rjM1a7I=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=EDDVx9S9zjOC8gX7zJwmsAQ3rh9jBRgWXHlzy2wTSXAIO3nfXevfV5mLyDMnQ6U1L
	 IwpCTLJwazhV/pLF0Fy4TJGseb/2/dOTj2n7fBLSwRBEB1anYS74rJq5+irZpVJrS+
	 p8hMIApMrl/gs/GngpeUvsnnTqFqmZRbNQnDykL0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57F8FF80268;
	Wed, 24 Jun 2020 07:36:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E506FF80268; Wed, 24 Jun 2020 07:36:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_06_12,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E32DAF801DB
 for <alsa-devel@alsa-project.org>; Wed, 24 Jun 2020 07:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E32DAF801DB
IronPort-SDR: JCRCMpxKtZmMaA/TPXb2p4dEQVXdo1ZkkGhWXbSXPz2addqvHHF8ZwT/SArD3i7SKGz8E8dZHt
 2dIFKpxLw5ww==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="144376538"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="144376538"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 22:35:57 -0700
IronPort-SDR: zm0cy0sBNBM6Ra4I/wkyFB5B3eTDdrgjqO9tZXD5a+2LVH8lrG1fHAqAQujYyHWws2gRVFZdFo
 GBQ7gHFJULXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="301504939"
Received: from bard-ubuntu.sh.intel.com ([10.239.13.33])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 22:35:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH] ASoC: SOF: Intel: add build support for SoundWire
Date: Wed, 24 Jun 2020 01:41:47 +0800
Message-Id: <20200623174147.22061-1-yung-chuan.liao@linux.intel.com>
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
index c9a2bee4b55c..79741fc50de1 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -167,6 +167,7 @@ config SND_SOC_SOF_CANNONLAKE_SUPPORT
 config SND_SOC_SOF_CANNONLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -182,6 +183,7 @@ config SND_SOC_SOF_COFFEELAKE_SUPPORT
 config SND_SOC_SOF_COFFEELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -197,6 +199,7 @@ config SND_SOC_SOF_ICELAKE_SUPPORT
 config SND_SOC_SOF_ICELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -204,6 +207,7 @@ config SND_SOC_SOF_ICELAKE
 config SND_SOC_SOF_COMETLAKE_LP
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -242,6 +246,7 @@ config SND_SOC_SOF_TIGERLAKE_SUPPORT
 config SND_SOC_SOF_TIGERLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -257,6 +262,7 @@ config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 config SND_SOC_SOF_ELKHARTLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -342,6 +348,29 @@ config SND_SOC_SOF_HDA
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

