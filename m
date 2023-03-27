Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B07146CA289
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 13:35:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11E06E71;
	Mon, 27 Mar 2023 13:34:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11E06E71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679916901;
	bh=texlN+ae0SmycWuXRad5CpiU9Xez+C8SyXvw+1hdOiY=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W0YlCqeyVyJgE2/oE+NGgVz4SgyOvNDjDh2QgX3GRZz1Bkk1cIDClmYAGxjXx+bxX
	 r/JqPWpiUwulaHmR5TDG8dFhytqvTYZLfq6yAI3ICV99J4pnpZ//PLyqcwjFo/enJp
	 hWCM0fzsUjQhxXqntzAkXbRP/B5kQBoYwAnHDLFs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7FA1EF8052D;
	Mon, 27 Mar 2023 13:32:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C790AF80272; Mon, 27 Mar 2023 13:32:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C0AD2F8032D
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 13:29:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0AD2F8032D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=YJhU2y0I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679916559; x=1711452559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=texlN+ae0SmycWuXRad5CpiU9Xez+C8SyXvw+1hdOiY=;
  b=YJhU2y0IZgF01Hztbjd3bzHG/qzizf2C5bEdac0Hedu9tfcrT9f2qSNu
   YMqp0F81f9WEl+loQq1HHSGcEWZHYjBkIzwAGlVApvS50TvcBgW4Jh0EH
   b7cAt4Bd7qCMMwxhKwR9tH69ZdzEkTPrOgXil8t1sj5mZOE9bhphclnsp
   kxt9ql68Co7YGaoPdIk7/4mQJtNru4KjOvIw1R/Gc2wiRw88z0m2rC4Z1
   nNB39tqrdZnAk5DW2q2nBieSb/+MRk1s1uukygUUjq15lk7pZ6xc0aNX+
   LzH7fto16lVB7pd1ImZKYX1MUuy37uudNRTEO/XMKMiK4y6SqeUIYlRUz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="367986930"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="367986930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857620404"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="857620404"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.223.110])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 04:29:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	tiwai@suse.de,
	perex@perex.cz
Subject: [PATCH 05/18] ASoC: SOF: Intel: hda-mlink: move to a dedicated module
Date: Mon, 27 Mar 2023 14:29:18 +0300
Message-Id: <20230327112931.23411-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
References: <20230327112931.23411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5JJDKLL6TQLBDFLEI33NAG5SRKMD5RQQ
X-Message-ID-Hash: 5JJDKLL6TQLBDFLEI33NAG5SRKMD5RQQ
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 rander.wang@intel.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5JJDKLL6TQLBDFLEI33NAG5SRKMD5RQQ/>
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

