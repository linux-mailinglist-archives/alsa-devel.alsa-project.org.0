Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A21329571
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 01:35:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF151698;
	Tue,  2 Mar 2021 01:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF151698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614645312;
	bh=iU1Dqou1SX3gMImOvPmTOLh+wtZtc0S9YsA0wVpI9yQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTVZMpICjHuLG7FdxX82tDjtg40xPyr/x3SCIfplQY9CzqVkqCek3bEypmv0mdH/w
	 ilushtL3AZC9Sz1EuxTmUFpDO2/AX3dyKL+65dzPERzoVkJxCRNp1kNVM2qrMUWmox
	 aNsfkbpeI+5tEUPYeD7oMU9H7aA+YsebovcyY91s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E2A25F804AD;
	Tue,  2 Mar 2021 01:31:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6951F80475; Tue,  2 Mar 2021 01:31:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 585D1F802DF
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 01:31:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 585D1F802DF
IronPort-SDR: t0YIoF+Y20AnVYvznhiZAMGk7/8lZ2nkXlUiMJ9YygmF8Ipjj+Pl3MzZdEguxW8/XJ6BE8lKaW
 MT9YJZsrQ3qA==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="248048794"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="248048794"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:46 -0800
IronPort-SDR: OQU2On855c9zhPJzAGdj0qCqRXeRRjuIaW05Lvee4wNQM0dGBCsMUviRBXm9zxOBq0IFGfulsf
 oqink6orrrQQ==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="444512592"
Received: from josemrod-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.215.233])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2021 16:31:44 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/7] ASoC: SOF: Intel: SoundWire: simplify Kconfig
Date: Mon,  1 Mar 2021 18:31:23 -0600
Message-Id: <20210302003125.1178419-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
References: <20210302003125.1178419-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, arnd@arndb.de, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, Bard Liao <bard.liao@intel.com>
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

The Kconfig file is way too convoluted. Track platforms where
SoundWire is supported, and add simpler conditions to make sure there
is no module/built-in issue.

The use of 'depends on' is less intuitive if a required 'depend' is
missing, but that's a small price to pay for clarity and simplicity.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/intel/Kconfig | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 7dcb61ba5763..21e24a3c64fb 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -276,29 +276,21 @@ config SND_SOC_SOF_HDA
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
-	bool "SOF support for SoundWire"
-	depends on ACPI
-	help
-	  This adds support for SoundWire with Sound Open Firmware
-	  for Intel(R) platforms.
-	  Say Y if you want to enable SoundWire links with SOF.
-	  If unsure select "N".
-
 config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	tristate
-	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE
-	tristate
-	select SOUNDWIRE
+	tristate "SOF support for SoundWire"
+	default SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	depends on SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	depends on ACPI && SOUNDWIRE
+	depends on !(SOUNDWIRE=m && SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE=y)
 	select SOUNDWIRE_INTEL
 	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
+	  This adds support for SoundWire with Sound Open Firmware
+	  for Intel(R) platforms.
+	  Say Y if you want to enable SoundWire links with SOF.
+	  If unsure select "N".
 
 endif ## SND_SOC_SOF_INTEL_PCI
 
-- 
2.25.1

