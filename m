Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5874CDEE5
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 21:48:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9156D1F38;
	Fri,  4 Mar 2022 21:47:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9156D1F38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646426883;
	bh=2XQkHL/LYNRUCOMXK6jk8BLlUCoV4YOWdgBztm7pl5c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hb49yo1UevDP7YPY4TqKKd9taqdC8gHeKdg62ei1z5rVDdnT0zH1QWHm6Sng/nN+k
	 p/nf8i+hYTop5LaDfwllvUuHr1FEw7tmYh2OuisvisBJHWIvhP+yJQk6ELL0igVwYO
	 dCjSXPZuNHEH51DVWRG/rbfPPg42ylYh8VefcJSE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32120F8051F;
	Fri,  4 Mar 2022 21:45:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49E49F80224; Fri,  4 Mar 2022 21:45:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2848AF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 21:45:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2848AF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="keh8/m6V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646426753; x=1677962753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2XQkHL/LYNRUCOMXK6jk8BLlUCoV4YOWdgBztm7pl5c=;
 b=keh8/m6Vd+uHhZf3V5SP8zmoNsrwxmbTHVs2DUi+xYxKScpK8a19mqtT
 oavrO0VSm1vM4xsmuHW0bS58KJSJTyfAkaR9SDC+vE0uVvDWub2IhBC0d
 /5xT0k+l4IfGZzZHv4k1Swaf+PATWRhFfgPUPaT4041/rkTv8DQIKdVHz
 hGACoYpXAo7ZL97VnY8sBdaxruzUr6YhapVZpic9bQVam/ujHijcwnuTG
 FnHCaJ6PKR0Axgc7w/oU21SJCMJ11Sn8SBWqGObMu0RgaPlYw+h4BPnHv
 ycXALeUFQYW+OxNGX2m1HvjV+S7wG+FBg9onRgI1zdthC5UVja2h8CyU/ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="314776828"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="314776828"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:48 -0800
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="640695979"
Received: from grmundad-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.209.115.48])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 12:45:47 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/3] ASoC: Intel: sof_sdw: fix quirks for 2022 HP Spectre x360
 13"
Date: Fri,  4 Mar 2022 14:45:32 -0600
Message-Id: <20220304204532.54675-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
References: <20220304204532.54675-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Anthony I Gilea <i@cpp.in>,
 Rander Wang <rander.wang@intel.com>
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

From: Anthony I Gilea <i@cpp.in>

HP changed the DMI identification for 2022 devices:
Product Name: HP Spectre x360 Conv 13-ap0001na
Product Name: 8709
This patch relaxes the DMI_MATCH criterion to work with all versions of this product.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Anthony I Gilea <i@cpp.in>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/dmi-quirks.c   | 2 +-
 sound/soc/intel/boards/sof_sdw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 0ca2a3e3a02e..747983743a14 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -59,7 +59,7 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 	{
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Conv"),
 		},
 		.driver_data = (void *)intel_tgl_bios,
 	},
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index da515eb1ddbe..1f00679b4240 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -185,7 +185,7 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		.callback = sof_sdw_quirk_cb,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Convertible"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x360 Conv"),
 		},
 		.driver_data = (void *)(SOF_SDW_TGL_HDMI |
 					SOF_SDW_PCH_DMIC |
-- 
2.30.2

