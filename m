Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 31575604F05
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Oct 2022 19:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDE20AF30;
	Wed, 19 Oct 2022 19:39:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDE20AF30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666201235;
	bh=fK9NFEINxXbfBr0eds/T4+ud4oC36CMMgTBVFvTaKtY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dn10FjTH6l4nFXQdFYFmE21wqLtbdLCmYyMkQ+4peduWqoZIKpKa7TjhDFupolXpR
	 cCH29nJF79kbH2OZZs3wy++VTuTjjlOJWWpefnEKrRvBlOpPWpDcRWUgiZ5S23/nYi
	 z6o9ciC2WWOFTTQDZ+d06kB4wjYZbXQiZe4zpvKk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 723CBF8057B;
	Wed, 19 Oct 2022 19:37:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5DBADF80535; Wed, 19 Oct 2022 19:37:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9137CF80166
 for <alsa-devel@alsa-project.org>; Wed, 19 Oct 2022 19:37:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9137CF80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n8G361e7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666201058; x=1697737058;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fK9NFEINxXbfBr0eds/T4+ud4oC36CMMgTBVFvTaKtY=;
 b=n8G361e7ScfL1Svj3soz2zlsZjxW4kW2tpaOjs4rvM46nRiLBwA9IRgT
 ZE2EODbaOkBmHNayRUP9Cb+WLKy67cID/yh5AL+vaOjD7EQ3k9IbHs++b
 Um5m4VLKx0lZC9QdOjK9FOknQojtsGNdKfaXz7cYQhd3UjeZE6j06014v
 wIIx9X5dIbbf1OO0ooqwMMGS0tNWV8OH44i2dvtinnxgAnfbB+YbJnVIZ
 /ZpXd+Gq9Fe/gCTUupJmh8gHDpjBH4bm9YowGrZlLO4ne3LDxxgSeki8R
 rqs7EHRW+yqNS6Zo/qv11DhQrlAmzCYJz/etakGJnRSyF+d+irxJ+yMVB w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="333045712"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="333045712"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 10:37:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="771898575"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="771898575"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2022 10:37:23 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 7/8] ASoC: Intel: avs: Power and clock gating policy overriding
Date: Wed, 19 Oct 2022 19:53:16 +0200
Message-Id: <20221019175317.1540919-8-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019175317.1540919-1-cezary.rojewski@intel.com>
References: <20221019175317.1540919-1-cezary.rojewski@intel.com>
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
index 841bc9fa0d3b..da7aa7537435 100644
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

