Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E71E8D0C87
	for <lists+alsa-devel@lfdr.de>; Mon, 27 May 2024 21:20:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 85526868;
	Mon, 27 May 2024 21:20:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 85526868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1716837643;
	bh=T1IYaXqTO2TltVT85SSDSvSD+VRTNd6vm1fRgpgQWVM=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=scNUskbnOxFeFM03vQdIhxtwbjoHvlkCBl+OTm/78GaWweEGPnzvSLSk8RPZuFhbR
	 QMUudWlt78vfhFjsZ75p3P5N/SODK7EP0S1GetkjEpXFE6Szetnq7y5LPYsRAsdVDR
	 GTnH1ShAr2ukXc7g64I2CfgLM0WGnEGRF8LI3bME=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B01D2F8058C; Mon, 27 May 2024 21:20:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 407E2F8059F;
	Mon, 27 May 2024 21:20:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 923C4F8026D; Mon, 27 May 2024 21:19:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B6A4F800BA
	for <alsa-devel@alsa-project.org>; Mon, 27 May 2024 21:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B6A4F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YJyY8IVW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716837594; x=1748373594;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=T1IYaXqTO2TltVT85SSDSvSD+VRTNd6vm1fRgpgQWVM=;
  b=YJyY8IVWooAkbjxx8KYN+PR3ahNnoUEe6cE+cCYBJgoGZ8vEm0Brb/63
   ZUjucWfoO5ZMWxNa4bXyM3FF7m2zVPdvPJow0f5KS0T+bSTmmXWY2LSny
   97c/Kilm0Qy37DPeROMS5O6dcX4uIDNHkH0yZTrGP+n2BGY2bmFXAv70d
   KwSqRDXiSKtC316I5umozS71UlC1nykWr+xWH565sIJC2K34Hw8vPKabx
   45zWXZLp7ZG6l1QhLGm+wdsbScOzJ13/TZaiz1qTZs4rDpmzuqQkLdRI1
   wpXoI9D6l4/IbIesX89o22KntK13Db7JwJXWGBssCy9kmeqJ7LC4Une8l
   Q==;
X-CSE-ConnectionGUID: oSoCs1PKSEKVfD1GzEwL1w==
X-CSE-MsgGUID: 4BBbVBouRzqtg/v4FZY5zQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24580801"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="24580801"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:19:48 -0700
X-CSE-ConnectionGUID: XMT3tvi8RjSKYVhfjIKxHQ==
X-CSE-MsgGUID: +apK2q5RRLOyvkTxJoMmJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000";
   d="scan'208";a="72247644"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 12:19:47 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	kernel test robot <lkp@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: [PATCH] ASoC: Intel: sof-sdw: fix missing SPI_MASTER dependency
Date: Mon, 27 May 2024 14:19:40 -0500
Message-ID: <20240527191940.30107-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NSF4B53JSY7JBSCLM3NDXOORXA3KMPS4
X-Message-ID-Hash: NSF4B53JSY7JBSCLM3NDXOORXA3KMPS4
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NSF4B53JSY7JBSCLM3NDXOORXA3KMPS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The addition of the Cirrus Logic 'sidecar' amps adds a dependency on SPI_MASTER.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_CS35L56_SPI
   Depends on [n]:
     SOUND [=y] && SND [=y] && SND_SOC [=y] && SPI_MASTER [=n] &&
     (SOUNDWIRE [=y] || !SOUNDWIRE [=y])
   Selected by [y]:
    - SND_SOC_INTEL_SOUNDWIRE_SOF_MACH [=y] && SOUND [=y] && SND [=y]
      && SND_SOC [=y] && SND_SOC_INTEL_MACH [=y] &&
      SND_SOC_SOF_INTEL_SOUNDWIRE [=y] && I2C [=y] && ACPI [=y] &&
      (MFD_INTEL_LPSS [=y] || COMPILE_TEST [=n]) &&
      (SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES [=y] || COMPILE_TEST
      [=n]) && SOUNDWIRE [=y]

Fixes: b831b4dca48d ("ASoC: intel: sof_sdw: Add support for cs42l43-cs35l56 sidecar amps")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202405140758.o2HY4nYD-lkp@intel.com/
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3ed81ab649c5..4e0586034de4 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -652,7 +652,7 @@ if SND_SOC_SOF_INTEL_SOUNDWIRE
 
 config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	tristate "SoundWire generic machine driver"
-	depends on I2C && ACPI
+	depends on I2C && SPI_MASTER && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES || COMPILE_TEST
 	depends on SOUNDWIRE
-- 
2.43.0

