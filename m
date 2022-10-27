Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E196101CF
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 51B992DC7;
	Thu, 27 Oct 2022 21:37:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 51B992DC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899522;
	bh=L1063eZtklbm6ElAIxkRuZKBHgzNXoZuZOYreC68obE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SWLRTteGqpNChgvOqNGT/MAURh1+Y4nfduEre05qWqfpXAHzm94uJM1x+wTB3KA8e
	 /gz3DGBbXiJz4ujI4Ryfrbl7GkicheNV1tGR3GOrqxtQaChqPNHiqq3nBKzxK4/rem
	 nq6VYM4+zm9/GNpQ7BmWp7/a1w6b1zNByU6HeOEg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9949F80587;
	Thu, 27 Oct 2022 21:36:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E04F8056F; Thu, 27 Oct 2022 21:36:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C181FF804D9
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C181FF804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kIqAngRd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899370; x=1698435370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=L1063eZtklbm6ElAIxkRuZKBHgzNXoZuZOYreC68obE=;
 b=kIqAngRdBmwU7MaCCYou/DxQuoMFDO3LN67jynPLiv3DPK/h+R1sIUej
 iEtgdMC0E3w1+XlqGuKkEhEKMZv78sDin254nwvFoEUS7UkpC+gJtwSuN
 Re6G55TXH/A4YEtrlmT3kcjKLXgzFX55kXCVVQkQ0x4EPreoX+V022DXT
 J5TbSV9uIWESifxHZiAnkMBVAHMo9S5FfeV3ibJG9l6JSTCg1FuDJlXhA
 k2N1gQDxbd05G2vAzBCIdc8dWUMdGpcfTcVLC9Jz8o8jxJqWvw41Slm9k
 RasOWMrg8UAjbug9/h05IRko+tho6N2lU7xgimxmJ8n3UUKlY9aYNhTQY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957818"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957818"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:08 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526979"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526979"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:07 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/21] ASoC: SOF: Intel: start moving multi-link handling in
 dedicated file
Date: Thu, 27 Oct 2022 15:35:24 -0400
Message-Id: <20221027193540.259520-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

The multi-link handling needs to be handled with dedicated helpers
before cleanups and extensions.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Makefile    |  2 +-
 sound/soc/sof/intel/hda-mlink.c | 45 +++++++++++++++++++++++++++++++++
 sound/soc/sof/intel/hda.c       | 15 +++--------
 sound/soc/sof/intel/hda.h       | 12 +++++++++
 4 files changed, 61 insertions(+), 13 deletions(-)
 create mode 100644 sound/soc/sof/intel/hda-mlink.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 8b8ea0361785..8201cbdd654c 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -5,7 +5,7 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
-				 hda-dai.o hda-bus.o \
+				 hda-dai.o hda-bus.o hda-mlink.o \
 				 skl.o hda-loader-skl.o \
 				 apl.o cnl.o tgl.o icl.o mtl.o hda-common-ops.o
 
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
new file mode 100644
index 000000000000..228ec35017ec
--- /dev/null
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2022 Intel Corporation. All rights reserved.
+//
+
+/*
+ * Management of HDaudio multi-link (capabilities, power, coupling)
+ */
+
+#include <sound/hdaudio_ext.h>
+#include <sound/hda_register.h>
+
+#include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
+#include <sound/intel-dsp-config.h>
+#include <sound/intel-nhlt.h>
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include "../sof-audio.h"
+#include "../sof-pci-dev.h"
+#include "../ops.h"
+#include "hda.h"
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+void hda_bus_ml_get_capabilities(struct hdac_bus *bus)
+{
+	if (bus->mlcap)
+		snd_hdac_ext_bus_get_ml_capabilities(bus);
+}
+
+void hda_bus_ml_put_all(struct hdac_bus *bus)
+{
+	struct hdac_ext_link *hlink;
+
+	list_for_each_entry(hlink, &bus->hlink_list, list)
+		snd_hdac_ext_bus_link_put(bus, hlink);
+}
+
+#endif
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index fe2f1e42420c..6a1ee7f81d61 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -871,9 +871,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	struct hdac_ext_link *hlink;
-#endif
 	struct sof_intel_hda_dev *hdev = pdata->hw_pdata;
 	u32 link_mask;
 	int ret = 0;
@@ -918,9 +915,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 
 skip_soundwire:
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-	if (bus->mlcap)
-		snd_hdac_ext_bus_get_ml_capabilities(bus);
+	hda_bus_ml_get_capabilities(bus);
 
 	/* create codec instances */
 	hda_codec_probe_bus(sdev);
@@ -928,12 +923,8 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (!HDA_IDISP_CODEC(bus->codec_mask))
 		hda_codec_i915_display_power(sdev, false);
 
-	/*
-	 * we are done probing so decrement link counts
-	 */
-	list_for_each_entry(hlink, &bus->hlink_list, list)
-		snd_hdac_ext_bus_link_put(bus, hlink);
-#endif
+	hda_bus_ml_put_all(bus);
+
 	return 0;
 }
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e5932763d1fc..c40364a9a761 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -742,6 +742,18 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+void hda_bus_ml_get_capabilities(struct hdac_bus *bus);
+void hda_bus_ml_put_all(struct hdac_bus *bus);
+
+#else
+
+static inline void hda_bus_ml_get_capabilities(struct hdac_bus *bus) { }
+static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
+
+#endif /* CONFIG_SND_SOC_SOF_HDA */
+
 /*
  * Trace Control.
  */
-- 
2.34.1

