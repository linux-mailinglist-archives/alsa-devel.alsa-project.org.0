Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60660E237
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 15:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 497E315E2;
	Wed, 26 Oct 2022 15:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 497E315E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666791368;
	bh=X5RaVP6ovgJ2pb7UBXvGxFeO7CVEU9xAwZaQ1Lj2nTA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WI9z1VoMBfIeupqm+JguTjGrO9GMu2F4rkiNrbroalnM6bTXdzm2+7gAHCkQYy9B8
	 dzc6gHTTSLI2rDBR9RdTcS2NYvXTJRmnY6/BNhExQVwWdqaS6ovc3vLZsoQgAgvzYK
	 t7J9evVuQbkUtDRQ/7bv1GMvVEtWdwj1QMwlSWzQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE563F8057B;
	Wed, 26 Oct 2022 15:34:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E087F8057B; Wed, 26 Oct 2022 15:34:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8851F80570
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 15:33:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8851F80570
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZyEos/Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666791240; x=1698327240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X5RaVP6ovgJ2pb7UBXvGxFeO7CVEU9xAwZaQ1Lj2nTA=;
 b=ZyEos/HjTLK+MSAdUqIZ/kA2PHSdAnIu4pmw/WhgSMNl8HAALT6O+R5u
 gDrJ5onmhkQqXMEmbQ+QQGNZL1IAfy99i6lucG9JIYwXangLvYxS+fUqZ
 y5yGt3fC8MOqSj1bwxade4+YghNWZD4OY1M30s39c2l8GwsQyoXx8MKsG
 lUb0TRy75db80MQjOJYoK5frqwY1DwVX2t+vhrl2oKwY298koBur/aL4D
 DG/6Nu/fCmzVz/iF4SAjrCokibnIfmeOzxop4Mfec4DTCPWyxdOUlcBp+
 55dsRIMbCPlTNKNzqDtEEShYJMZTtoxbmMa+nbUT1yE7P4hSpTEGSRnUc w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="288340772"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="288340772"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2022 06:33:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10512"; a="609952742"
X-IronPort-AV: E=Sophos;i="5.95,214,1661842800"; d="scan'208";a="609952742"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 26 Oct 2022 06:33:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 8/9] ASoC: Intel: avs: Power and clock gating policy
 overriding
Date: Wed, 26 Oct 2022 15:50:13 +0200
Message-Id: <20221026135014.1403705-9-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221026135014.1403705-1-cezary.rojewski@intel.com>
References: <20221026135014.1403705-1-cezary.rojewski@intel.com>
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

