Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B64282A27
	for <lists+alsa-devel@lfdr.de>; Sun,  4 Oct 2020 12:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 335F318D4;
	Sun,  4 Oct 2020 12:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 335F318D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601806185;
	bh=r/hHH7y8XmgNdP9W0Yn9CiSozUtvz3J6rmGYmjhVPoo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rC9u/ivhFBiEYPFAyUd8SIjyYoKVahzhZIaPsrYO4yo5wgcdwFLPLNmtluCyiUpws
	 uym7yg/pTuhL6FMSVqvMEJWCJvXNp1vmxQwec8GH+7GHp/6XvMUpIw5G0Nbzu+GaiP
	 F+CXNn0J0Jj/FaVAgzY7hqIHWhyaTG30IF3qCshs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CADB2F8034E;
	Sun,  4 Oct 2020 12:02:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7ACFF80337; Sun,  4 Oct 2020 12:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=PRX_BODY_65,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C62FDF80246
 for <alsa-devel@alsa-project.org>; Sun,  4 Oct 2020 12:02:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C62FDF80246
IronPort-SDR: 5kRz+Zzh/fXCCzXeYjMmcQmdo1qCr8CclAdErcD06nZ1BZHrQu8qU+vBlFDr0XLekMP/zGHqJM
 1eJeALBQkNTQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9763"; a="163384018"
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="163384018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2020 03:02:22 -0700
IronPort-SDR: uparHFx+YyRFF7K3ncn0jknHel9DQdjUbCrxXp73KVBz6IhnbjMgWJ0yIRVA+NZqy8wUryCVcC
 cYYHDsP+/hrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,335,1596524400"; d="scan'208";a="340527959"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 04 Oct 2020 03:02:18 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/13] ASoC: Intel: Make atom components independent of sst-dsp
Date: Sun,  4 Oct 2020 12:01:26 +0200
Message-Id: <20201004100128.5842-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201004100128.5842-1-cezary.rojewski@intel.com>
References: <20201004100128.5842-1-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, andriy.shevchenko@linux.intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, michal.wasko@intel.com,
 cujomalainey@chromium.org, krzysztof.hejmowski@intel.com,
 ppapierkowski@habana.ai, vamshi.krishna.gopal@intel.com
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

With sound/soc/intel/haswell and /baytrail gone, registers left within
sst-dsp header are atom-specific. Relocate these to atom internal header
to make atom truely independent of sound/soc/common processing code.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/atom/sst/sst.c               |  1 -
 sound/soc/intel/atom/sst/sst.h               |  7 +++++++
 sound/soc/intel/atom/sst/sst_acpi.c          |  1 -
 sound/soc/intel/atom/sst/sst_drv_interface.c |  3 ---
 sound/soc/intel/atom/sst/sst_ipc.c           |  1 -
 sound/soc/intel/atom/sst/sst_loader.c        |  1 -
 sound/soc/intel/atom/sst/sst_pvt.c           |  1 -
 sound/soc/intel/atom/sst/sst_stream.c        |  1 -
 sound/soc/intel/boards/bytcht_es8316.c       |  1 -
 sound/soc/intel/boards/bytcr_rt5640.c        |  1 -
 sound/soc/intel/common/sst-dsp.h             | 10 ----------
 11 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.c b/sound/soc/intel/atom/sst/sst.c
index d450b9848028..e90590559185 100644
--- a/sound/soc/intel/atom/sst/sst.c
+++ b/sound/soc/intel/atom/sst/sst.c
@@ -26,7 +26,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
 
 MODULE_AUTHOR("Vinod Koul <vinod.koul@intel.com>");
 MODULE_AUTHOR("Harsha Priya <priya.harsha@intel.com>");
diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 2bee646e81b8..4d37d39fd8f4 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -34,6 +34,13 @@
 #define MRFLD_FW_FEATURE_BASE_OFFSET 0x4
 #define MRFLD_FW_BSS_RESET_BIT 0
 
+/* SST Shim register map */
+#define SST_CSR			0x00
+#define SST_ISRX		0x18
+#define SST_IMRX		0x28
+#define SST_IPCX		0x38 /* IPC IA -> SST */
+#define SST_IPCD		0x40 /* IPC SST -> IA */
+
 extern const struct dev_pm_ops intel_sst_pm;
 enum sst_states {
 	SST_FW_LOADING = 1,
diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index f3cfe83b9ac6..f943a0884976 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -31,7 +31,6 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 #include "../sst-mfld-platform.h"
-#include "../../common/sst-dsp.h"
 #include "../../common/soc-intel-quirks.h"
 #include "sst.h"
 
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index 762495385d5c..0af618dd8073 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -24,9 +24,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
-
-
 
 #define NUM_CODEC 2
 #define MIN_FRAGMENT 2
diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index c2851a829a64..a8a9aa0057d3 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -24,7 +24,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
 
 struct sst_block *sst_create_block(struct intel_sst_drv *ctx,
 					u32 msg_id, u32 drv_id)
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index 5c42cce90ce2..1c9b0c9ec483 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -29,7 +29,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
 
 void memcpy32_toio(void __iomem *dst, const void *src, int count)
 {
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index c099f7df6168..e6a5c18a7018 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -26,7 +26,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
 
 int sst_shim_write(void __iomem *addr, int offset, int value)
 {
diff --git a/sound/soc/intel/atom/sst/sst_stream.c b/sound/soc/intel/atom/sst/sst_stream.c
index c0221e103e79..ea1ef8a61fa6 100644
--- a/sound/soc/intel/atom/sst/sst_stream.c
+++ b/sound/soc/intel/atom/sst/sst_stream.c
@@ -23,7 +23,6 @@
 #include <asm/platform_sst_audio.h>
 #include "../sst-mfld-platform.h"
 #include "sst.h"
-#include "../../common/sst-dsp.h"
 
 int sst_alloc_stream_mrfld(struct intel_sst_drv *sst_drv_ctx, void *params)
 {
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 7ae34b49815c..7ed869bf1a92 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -28,7 +28,6 @@
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
 #include "../atom/sst-atom-controls.h"
-#include "../common/sst-dsp.h"
 #include "../common/soc-intel-quirks.h"
 
 /* jd-inv + terminating entry */
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index fc202747ba83..9dadf6561444 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -28,7 +28,6 @@
 #include <dt-bindings/sound/rt5640.h>
 #include "../../codecs/rt5640.h"
 #include "../atom/sst-atom-controls.h"
-#include "../common/sst-dsp.h"
 #include "../common/soc-intel-quirks.h"
 
 enum {
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index f580e718b183..021a36b2398a 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -12,16 +12,6 @@
 #include <linux/types.h>
 #include <linux/interrupt.h>
 
-/* SST Shim register map
- * The register naming can differ between products. Some products also
- * contain extra functionality.
- */
-#define SST_CSR			0x00
-#define SST_ISRX		0x18
-#define SST_IMRX		0x28
-#define SST_IPCX		0x38 /* IPC IA -> SST */
-#define SST_IPCD		0x40 /* IPC SST -> IA */
-
 struct sst_dsp;
 
 /*
-- 
2.17.1

