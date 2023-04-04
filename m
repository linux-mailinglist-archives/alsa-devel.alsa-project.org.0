Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 679806D5DCA
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Apr 2023 12:43:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4BDD832;
	Tue,  4 Apr 2023 12:43:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4BDD832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680605031;
	bh=texlN+ae0SmycWuXRad5CpiU9Xez+C8SyXvw+1hdOiY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iXATfdwnGL6gUPFQPqr7iHmGeFPi+k91gz4V8VeNcHSRlyeCVArB9G1QycZ+i5SKM
	 iDk59YL2tNQAsdURIrnEuoylFwKfy0MLq8df/6c1tlG8sswBe+NgaD+ZP5YujjGBye
	 t/4uhuc59p2AgOIz8dNNcznBQ5k5Y9RJSpV5CNL8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC7EF80578;
	Tue,  4 Apr 2023 12:41:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 632A7F80568; Tue,  4 Apr 2023 12:41:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 296F3F80054
	for <alsa-devel@alsa-project.org>; Tue,  4 Apr 2023 12:41:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296F3F80054
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=iobN5r9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680604871; x=1712140871;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=texlN+ae0SmycWuXRad5CpiU9Xez+C8SyXvw+1hdOiY=;
  b=iobN5r9BeHidKEkoTpOzTzvaBdVFs3T71qU9WDHLQj2vpTSvQTJEZ5O0
   vywGx88q0zBZNAWcpB9Ggsng2j4DjujXzZ+APAaegL+Oj6dkHuM1nQDkU
   i1Vu/S+76Hx/d+73RPe+7qn1r/UQOBSsX6tjrTzscwkbjxxCFvjpZyBLw
   Y8VV5uwgXq07gxkYw6xpOrk/gplzavmApRCNde64vXUNWApLsEz/wGyXr
   tXpvkM0VUr56b/4vV/uj557sROAyCTb1Xb5OdKb42A9e8Rq99Q+oQrY6K
   y5zKpJHr8YVh0jObyq20c4dnG2vDoHwGjjItvureMTfKvvUBG9aRTBRdm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340877976"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="340877976"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="829930140"
X-IronPort-AV: E=Sophos;i="5.98,317,1673942400";
   d="scan'208";a="829930140"
Received: from vsysoevx-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.33.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2023 03:41:06 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH v2 05/18] ASoC: SOF: Intel: hda-mlink: move to a dedicated
 module
Date: Tue,  4 Apr 2023 13:41:14 +0300
Message-Id: <20230404104127.5629-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
References: <20230404104127.5629-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L6NKMAH4QPJPMK27WSLZTHPHDEASCV3V
X-Message-ID-Hash: L6NKMAH4QPJPMK27WSLZTHPHDEASCV3V
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com, amadeuszx.slawinski@linux.intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/L6NKMAH4QPJPMK27WSLZTHPHDEASCV3V/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Some of the functions will be used for SoundWire enumeration and power
management, to avoid cycles in module dependencies and simplify
integration all the HDaudio multi-link needs to move to a dedicated
module.

Drop no longer needed headers at the same time.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/hda-mlink.h       | 31 +++++++++++++++++++++++++++++++
 sound/soc/sof/intel/Kconfig     |  7 +++++++
 sound/soc/sof/intel/Makefile    |  5 ++++-
 sound/soc/sof/intel/hda-ctrl.c  |  1 +
 sound/soc/sof/intel/hda-dsp.c   |  1 +
 sound/soc/sof/intel/hda-mlink.c | 24 +++++++++++-------------
 sound/soc/sof/intel/hda.c       |  2 ++
 sound/soc/sof/intel/hda.h       | 20 --------------------
 8 files changed, 57 insertions(+), 34 deletions(-)
 create mode 100644 include/sound/hda-mlink.h

diff --git a/include/sound/hda-mlink.h b/include/sound/hda-mlink.h
new file mode 100644
index 000000000000..beef5f509e47
--- /dev/null
+++ b/include/sound/hda-mlink.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022-2023 Intel Corporation. All rights reserved.
+ */
+
+struct hdac_bus;
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
+
+int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
+void hda_bus_ml_free(struct hdac_bus *bus);
+void hda_bus_ml_put_all(struct hdac_bus *bus);
+void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
+int hda_bus_ml_resume(struct hdac_bus *bus);
+int hda_bus_ml_suspend(struct hdac_bus *bus);
+
+#else
+
+static inline int
+hda_bus_ml_get_capabilities(struct hdac_bus *bus) { return 0; }
+
+static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
+static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
+static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
+static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
+static inline int hda_bus_ml_suspend(struct hdac_bus *bus) { return 0; }
+
+#endif /* CONFIG_SND_SOC_SOF_HDA */
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 715ba8a7f2f8..f4eeacf1f281 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -269,6 +269,13 @@ config SND_SOC_SOF_HDA_COMMON
 	select SND_INTEL_DSP_CONFIG
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	select SND_SOC_SOF_HDA_PROBES
+	select SND_SOC_SOF_HDA_MLINK if SND_SOC_SOF_HDA_LINK
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level.
+
+config SND_SOC_SOF_HDA_MLINK
+	tristate
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index 38ab86b6a9fe..fdb463c12e91 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -5,10 +5,12 @@ snd-sof-acpi-intel-bdw-objs := bdw.o
 
 snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
-				 hda-dai.o hda-dai-ops.o hda-bus.o hda-mlink.o \
+				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 skl.o hda-loader-skl.o \
 				 apl.o cnl.o tgl.o icl.o mtl.o hda-common-ops.o
 
+snd-sof-intel-hda-mlink-objs := hda-mlink.o
+
 snd-sof-intel-hda-common-$(CONFIG_SND_SOC_SOF_HDA_PROBES) += hda-probes.o
 
 snd-sof-intel-hda-objs := hda-codec.o
@@ -19,6 +21,7 @@ obj-$(CONFIG_SND_SOC_SOF_INTEL_ATOM_HIFI_EP) += snd-sof-intel-atom.o
 obj-$(CONFIG_SND_SOC_SOF_BAYTRAIL) += snd-sof-acpi-intel-byt.o
 obj-$(CONFIG_SND_SOC_SOF_BROADWELL) += snd-sof-acpi-intel-bdw.o
 obj-$(CONFIG_SND_SOC_SOF_HDA_COMMON) += snd-sof-intel-hda-common.o
+obj-$(CONFIG_SND_SOC_SOF_HDA_MLINK) += snd-sof-intel-hda-mlink.o
 obj-$(CONFIG_SND_SOC_SOF_HDA) += snd-sof-intel-hda.o
 
 snd-sof-pci-intel-tng-objs := pci-tng.o
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index e1dba6b79065..84bf01bd360a 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -19,6 +19,7 @@
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include <sound/hda_component.h>
+#include <sound/hda-mlink.h>
 #include "../ops.h"
 #include "hda.h"
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c9231aeacc53..a8722f0774b1 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
+#include <sound/hda-mlink.h>
 #include <trace/events/sof_intel.h>
 #include "../sof-audio.h"
 #include "../ops.h"
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index e426d5e41e52..fbf86f2350fb 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -12,21 +12,11 @@
 
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
+#include <sound/hda-mlink.h>
 
-#include <linux/acpi.h>
 #include <linux/module.h>
-#include <linux/soundwire/sdw.h>
-#include <linux/soundwire/sdw_intel.h>
-#include <sound/intel-dsp-config.h>
-#include <sound/intel-nhlt.h>
-#include <sound/sof.h>
-#include <sound/sof/xtensa.h>
-#include "../sof-audio.h"
-#include "../sof-pci-dev.h"
-#include "../ops.h"
-#include "hda.h"
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_MLINK)
 
 int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 {
@@ -34,6 +24,7 @@ int hda_bus_ml_get_capabilities(struct hdac_bus *bus)
 		return snd_hdac_ext_bus_get_ml_capabilities(bus);
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_get_capabilities, SND_SOC_SOF_HDA_MLINK);
 
 void hda_bus_ml_free(struct hdac_bus *bus)
 {
@@ -47,6 +38,7 @@ void hda_bus_ml_free(struct hdac_bus *bus)
 		kfree(hlink);
 	}
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_free, SND_SOC_SOF_HDA_MLINK);
 
 void hda_bus_ml_put_all(struct hdac_bus *bus)
 {
@@ -55,6 +47,7 @@ void hda_bus_ml_put_all(struct hdac_bus *bus)
 	list_for_each_entry(hlink, &bus->hlink_list, list)
 		snd_hdac_ext_bus_link_put(bus, hlink);
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_put_all, SND_SOC_SOF_HDA_MLINK);
 
 void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 {
@@ -64,6 +57,7 @@ void hda_bus_ml_reset_losidv(struct hdac_bus *bus)
 	list_for_each_entry(hlink, &bus->hlink_list, list)
 		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_reset_losidv, SND_SOC_SOF_HDA_MLINK);
 
 int hda_bus_ml_resume(struct hdac_bus *bus)
 {
@@ -80,10 +74,14 @@ int hda_bus_ml_resume(struct hdac_bus *bus)
 	}
 	return 0;
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_resume, SND_SOC_SOF_HDA_MLINK);
 
 int hda_bus_ml_suspend(struct hdac_bus *bus)
 {
 	return snd_hdac_ext_bus_link_power_down_all(bus);
 }
+EXPORT_SYMBOL_NS(hda_bus_ml_suspend, SND_SOC_SOF_HDA_MLINK);
 
 #endif
+
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 65389c7278e2..ac61233029b7 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -26,6 +26,7 @@
 #include <sound/intel-nhlt.h>
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
+#include <sound/hda-mlink.h>
 #include "../sof-audio.h"
 #include "../sof-pci-dev.h"
 #include "../ops.h"
@@ -1647,3 +1648,4 @@ MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_IMPORT_NS(SND_INTEL_SOUNDWIRE_ACPI);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL_INIT);
 MODULE_IMPORT_NS(SOUNDWIRE_INTEL);
+MODULE_IMPORT_NS(SND_SOC_SOF_HDA_MLINK);
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 259b34eea677..0e0cfa81a8f2 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -763,26 +763,6 @@ static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
 #endif
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-
-int hda_bus_ml_get_capabilities(struct hdac_bus *bus);
-void hda_bus_ml_free(struct hdac_bus *bus);
-void hda_bus_ml_put_all(struct hdac_bus *bus);
-void hda_bus_ml_reset_losidv(struct hdac_bus *bus);
-int hda_bus_ml_resume(struct hdac_bus *bus);
-int hda_bus_ml_suspend(struct hdac_bus *bus);
-
-#else
-
-static inline int hda_bus_ml_get_capabilities(struct hdac_bus *bus) { return 0; }
-static inline void hda_bus_ml_free(struct hdac_bus *bus) { }
-static inline void hda_bus_ml_put_all(struct hdac_bus *bus) { }
-static inline void hda_bus_ml_reset_losidv(struct hdac_bus *bus) { }
-static inline int hda_bus_ml_resume(struct hdac_bus *bus) { return 0; }
-static inline int hda_bus_ml_suspend(struct hdac_bus *bus) { return 0; }
-
-#endif /* CONFIG_SND_SOC_SOF_HDA */
-
 /*
  * Trace Control.
  */
-- 
2.40.0

