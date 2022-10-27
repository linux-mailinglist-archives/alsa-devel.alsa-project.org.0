Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFA60F1E1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 10:09:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ECA3132E9;
	Thu, 27 Oct 2022 10:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ECA3132E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666858156;
	bh=X5RaVP6ovgJ2pb7UBXvGxFeO7CVEU9xAwZaQ1Lj2nTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BRWCmZ1MsymJ74WYRPmij0/jcd+Lrh2EAVX4BYGA7n9+rTpgwhaALh+XEe1hg4FnE
	 rgj/r+t8Xen2CYIppmYmWDG6AyJHsD7/T9RtQTeKcAYqmj1+j+/RWBD9xYkoPKELP9
	 BK1h9lJth5z8+yDWbh3w06ofiqDP1DWZCU6M6P4E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B832FF8054A;
	Thu, 27 Oct 2022 10:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5E0DF80578; Thu, 27 Oct 2022 10:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38B5DF80559
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 10:07:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B5DF80559
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fl8TFnFa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666858046; x=1698394046;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5RaVP6ovgJ2pb7UBXvGxFeO7CVEU9xAwZaQ1Lj2nTA=;
 b=fl8TFnFayUTlnKgtPagNgVCCOPFA9DynG6X5K+l4x49moWnQNjBMLyBC
 NvnQ6ZmJVqGHD1IvIheeCGmPQj85O/Ho7wjBecaFpW4hNM/woEOg6HUpi
 0rMADRlKgXrKpRXyxTTMVjzuGLHHzGZmMHO64Hq6lPi/WUWpVGJqsEjo0
 l9QB3uh+FTGZpQ3WT+M2LKxPTwMUAmvNQvyBBLKx9s1rHAJ3GIQBBD7bz
 sWUzBRW1Lm4QEbEckK5QuE2AS8VIATk1NWLp0wymzktmP09bA7Y0ENc0Z
 5+DAv2VhPEb1cf2MjqWAWu1Hl2tDtZ8QsU/Z3ZHXpx6EVf0tijVgofdn8 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="291462738"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="291462738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 01:07:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="961534889"
X-IronPort-AV: E=Sophos;i="5.95,217,1661842800"; d="scan'208";a="961534889"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga005.fm.intel.com with ESMTP; 27 Oct 2022 01:07:12 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v3 8/9] ASoC: Intel: avs: Power and clock gating policy
 overriding
Date: Thu, 27 Oct 2022 10:23:30 +0200
Message-Id: <20221027082331.1561740-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221027082331.1561740-1-cezary.rojewski@intel.com>
References: <20221027082331.1561740-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Provide pgctl/cgctl_mask module parameters for overriding power and
clock gating policies respectively. These help deal with rare firmware
loading failures on some configurations. There're no golden masks that
cover all known problems so leave the defaults as is.

While at it, update avs_hda_l1sen_enable()'s definition so it aligns
with its power/clock friends.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/core.c | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 6b68d926c9f4..f7bc06404dbc 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -27,6 +27,14 @@
 #include "avs.h"
 #include "cldma.h"
 
+static u32 pgctl_mask = AZX_PGCTL_LSRMD_MASK;
+module_param(pgctl_mask, uint, 0444);
+MODULE_PARM_DESC(pgctl_mask, "PCI PGCTL policy override");
+
+static u32 cgctl_mask = AZX_CGCTL_MISCBDCGE_MASK;
+module_param(cgctl_mask, uint, 0444);
+MODULE_PARM_DESC(cgctl_mask, "PCI CGCTL policy override");
+
 static void
 avs_hda_update_config_dword(struct hdac_bus *bus, u32 reg, u32 mask, u32 value)
 {
@@ -41,19 +49,16 @@ avs_hda_update_config_dword(struct hdac_bus *bus, u32 reg, u32 mask, u32 value)
 
 void avs_hda_power_gating_enable(struct avs_dev *adev, bool enable)
 {
-	u32 value;
+	u32 value = enable ? 0 : pgctl_mask;
 
-	value = enable ? 0 : AZX_PGCTL_LSRMD_MASK;
-	avs_hda_update_config_dword(&adev->base.core, AZX_PCIREG_PGCTL,
-				    AZX_PGCTL_LSRMD_MASK, value);
+	avs_hda_update_config_dword(&adev->base.core, AZX_PCIREG_PGCTL, pgctl_mask, value);
 }
 
 static void avs_hdac_clock_gating_enable(struct hdac_bus *bus, bool enable)
 {
-	u32 value;
+	u32 value = enable ? cgctl_mask : 0;
 
-	value = enable ? AZX_CGCTL_MISCBDCGE_MASK : 0;
-	avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL, AZX_CGCTL_MISCBDCGE_MASK, value);
+	avs_hda_update_config_dword(bus, AZX_PCIREG_CGCTL, cgctl_mask, value);
 }
 
 void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
@@ -63,9 +68,8 @@ void avs_hda_clock_gating_enable(struct avs_dev *adev, bool enable)
 
 void avs_hda_l1sen_enable(struct avs_dev *adev, bool enable)
 {
-	u32 value;
+	u32 value = enable ? AZX_VS_EM2_L1SEN : 0;
 
-	value = enable ? AZX_VS_EM2_L1SEN : 0;
 	snd_hdac_chip_updatel(&adev->base.core, VS_EM2, AZX_VS_EM2_L1SEN, value);
 }
 
-- 
2.25.1

