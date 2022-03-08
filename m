Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB744D227D
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Mar 2022 21:25:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD56A1856;
	Tue,  8 Mar 2022 21:24:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD56A1856
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646771103;
	bh=Q3bjpe2on4mZCKxMvqTUessEuRTc3oSUUzcLD4Jfuh8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i7MXFMp1q+iovvXBRFw11Fx71fcKhY8K0FRtlB4N9WhT2cyUw1tpcyTsRDKxe9j7F
	 22uDKDr6JG4DPm6x85PhsGuxlnaq9+yQxivprsKO7b273HJtIXosIz3Q5Ns2IIUlPI
	 RRDT326WwHlCdSSHQ1XEXdhQNIQW6A2z2YVsYrq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10D3DF800D1;
	Tue,  8 Mar 2022 21:23:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96A44F8026A; Tue,  8 Mar 2022 21:23:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC1AEF80121
 for <alsa-devel@alsa-project.org>; Tue,  8 Mar 2022 21:23:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC1AEF80121
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GoemlVsc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646771029; x=1678307029;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q3bjpe2on4mZCKxMvqTUessEuRTc3oSUUzcLD4Jfuh8=;
 b=GoemlVscQVtmTHMSvCAAQi2iJApugd+2mB247G88nxMu+wArNKXmaDKJ
 yJcDYbxG77+f/J5fhquNuJKgnO5TOogFtZ6zornLMlwXokB6zla+afXCq
 VNB2d92wKGQx2YsTe48Ys98jN3C6sJCdM6FBGIe2m6j7fF8kd4dSEEuQU
 N/R9l/mjFd9L2rE0zxUNY/oXlhc9WXeanlatb3bkKsLWp8SwTqEYYs07W
 P/S41kG7Vqtibiwy2u6+BFGT0UBfdqKJgSvLcEMmQbdhab3sF4XnSiutU
 yLh6ZZU2huKtthJUMa3T+y6Q9jP6YPZiTX7equkpw/N9Up0f07gL7vfgf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10280"; a="254994144"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="254994144"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 12:23:39 -0800
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; d="scan'208";a="711673793"
Received: from jhaskins-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.53.149])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 12:23:38 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: boards: fix randconfig issue
Date: Tue,  8 Mar 2022 14:23:18 -0600
Message-Id: <20220308202318.401358-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
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

on x86_64:

ERROR: modpost: "sof_dai_get_bclk"
[sound/soc/intel/boards/snd-soc-intel-sof-cirrus-common.ko] undefined!

ERROR: modpost: "sof_dai_get_mclk"
[sound/soc/intel/boards/snd-soc-intel-sof-realtek-common.ko]
undefined!

This comes from a missing dependency on at least ONE SOF platform
being selected. This dependency exists for all other machine drivers,
this was missed in the earlier reviews.

Fixes: 2fe14ff61bd6 ("ASoC: Intel: sof_ssp_amp: rename driver and support cs35l41 amplifier")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index a62785893bec..f3873b5bea87 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -616,6 +616,8 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 
 endif ## SND_SOC_SOF_JASPERLAKE
 
+if SND_SOC_SOF_HDA_LINK
+
 config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	tristate "SOF with amplifiers in I2S Mode"
 	depends on I2C && ACPI
@@ -632,6 +634,7 @@ config SND_SOC_INTEL_SOF_SSP_AMP_MACH
 	   with RT1308/CS35L41 I2S audio codec.
 	   Say Y if you have such a device.
 	   If unsure select "N".
+endif ## SND_SOC_SOF_HDA_LINK
 
 if SND_SOC_SOF_ELKHARTLAKE
 
-- 
2.30.2

