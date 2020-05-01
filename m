Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E32A1C18DA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 May 2020 17:00:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A41FF1697;
	Fri,  1 May 2020 17:00:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A41FF1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588345256;
	bh=VRpW7mWsE9h+ATq1mQ/rb3fMyOpAej8TWYxsiXwEQx0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R4QKogH/9YOslLG4MYdEANU+uvykxQXtCanbPrdraT2MC/nmLKZDRfXs7/u1MA1un
	 W2hZXVd+WxtS9IRk2OUk22afYX7SrY9MmS35wa/paI/muRgTGUa3XhyLzAJ9f6v+j8
	 sxHoA1O5Qiy5HrZQBGmAMMuyUnNB2UnF0vuxIKV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30F5BF80232;
	Fri,  1 May 2020 16:59:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 75464F8022B; Fri,  1 May 2020 16:59:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 014B3F800B9
 for <alsa-devel@alsa-project.org>; Fri,  1 May 2020 16:59:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 014B3F800B9
IronPort-SDR: JqLfPoJKi/p97vkTtDJupfUihgubZ/IYajjMoe59G8ZahQ5NvS6qszoKvHOJfiJfnpTN92pggg
 QviBflrYS0tg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2020 07:58:57 -0700
IronPort-SDR: 1sEDIb8kp9QFfIs8oA6u2XxviptZIbexfNgtPAMb+Zhn+A0+XOPhY2umKsDFn5wdsbJ/OABPrw
 LbzQOyr/+Wtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,339,1583222400"; d="scan'208";a="250035110"
Received: from srodrig5-mobl2.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.111.158])
 by fmsmga008.fm.intel.com with ESMTP; 01 May 2020 07:58:55 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF/Intel: clarify SPDX license with GPL-2.0-only
Date: Fri,  1 May 2020 09:58:50 -0500
Message-Id: <20200501145850.15178-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>
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

Remove the ambiguity with GPL-2.0 and use an explicit GPL-2.0-only
tag.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/soc-acpi.h                          | 2 +-
 include/sound/sof.h                               | 2 +-
 include/sound/sof/channel_map.h                   | 2 +-
 include/sound/sof/control.h                       | 2 +-
 include/sound/sof/dai-imx.h                       | 2 +-
 include/sound/sof/dai-intel.h                     | 2 +-
 include/sound/sof/dai.h                           | 2 +-
 include/sound/sof/header.h                        | 2 +-
 include/sound/sof/info.h                          | 2 +-
 include/sound/sof/pm.h                            | 2 +-
 include/sound/sof/stream.h                        | 2 +-
 include/sound/sof/topology.h                      | 2 +-
 include/sound/sof/trace.h                         | 2 +-
 include/sound/sof/xtensa.h                        | 2 +-
 sound/hda/intel-nhlt.c                            | 2 +-
 sound/soc/intel/Makefile                          | 2 +-
 sound/soc/intel/atom/Makefile                     | 2 +-
 sound/soc/intel/atom/sst/Makefile                 | 2 +-
 sound/soc/intel/boards/Makefile                   | 2 +-
 sound/soc/intel/boards/bytcht_cx2072x.c           | 2 +-
 sound/soc/intel/boards/cml_rt1011_rt5682.c        | 2 +-
 sound/soc/intel/boards/ehl_rt5660.c               | 2 +-
 sound/soc/intel/boards/glk_rt5682_max98357a.c     | 2 +-
 sound/soc/intel/boards/hda_dsp_common.c           | 2 +-
 sound/soc/intel/boards/hda_dsp_common.h           | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98357a.c     | 2 +-
 sound/soc/intel/boards/kbl_da7219_max98927.c      | 2 +-
 sound/soc/intel/boards/kbl_rt5660.c               | 2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.c       | 2 +-
 sound/soc/intel/boards/skl_hda_dsp_common.h       | 2 +-
 sound/soc/intel/boards/skl_hda_dsp_generic.c      | 2 +-
 sound/soc/intel/boards/sof_da7219_max98373.c      | 2 +-
 sound/soc/intel/boards/sof_maxim_common.c         | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h         | 2 +-
 sound/soc/intel/boards/sof_pcm512x.c              | 2 +-
 sound/soc/intel/boards/sof_rt5682.c               | 2 +-
 sound/soc/intel/boards/sof_sdw.c                  | 2 +-
 sound/soc/intel/boards/sof_sdw_common.h           | 2 +-
 sound/soc/intel/boards/sof_sdw_dmic.c             | 2 +-
 sound/soc/intel/boards/sof_sdw_hdmi.c             | 2 +-
 sound/soc/intel/boards/sof_sdw_rt1308.c           | 2 +-
 sound/soc/intel/boards/sof_sdw_rt5682.c           | 2 +-
 sound/soc/intel/boards/sof_sdw_rt700.c            | 2 +-
 sound/soc/intel/boards/sof_sdw_rt711.c            | 2 +-
 sound/soc/intel/boards/sof_sdw_rt715.c            | 2 +-
 sound/soc/intel/common/Makefile                   | 2 +-
 sound/soc/intel/common/soc-acpi-intel-bxt-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-cfl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-cml-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-cnl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ehl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-glk-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-hda-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-icl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-kbl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-skl-match.c | 2 +-
 sound/soc/intel/common/soc-acpi-intel-tgl-match.c | 2 +-
 sound/soc/intel/common/soc-intel-quirks.h         | 2 +-
 sound/soc/intel/skylake/Makefile                  | 2 +-
 sound/soc/intel/skylake/skl-ssp-clk.c             | 2 +-
 sound/soc/sof/Makefile                            | 2 +-
 sound/soc/sof/compress.c                          | 2 +-
 sound/soc/sof/compress.h                          | 2 +-
 sound/soc/sof/control.c                           | 2 +-
 sound/soc/sof/core.c                              | 2 +-
 sound/soc/sof/debug.c                             | 2 +-
 sound/soc/sof/imx/Kconfig                         | 2 +-
 sound/soc/sof/imx/Makefile                        | 2 +-
 sound/soc/sof/imx/imx8.c                          | 2 +-
 sound/soc/sof/imx/imx8m.c                         | 2 +-
 sound/soc/sof/intel/Makefile                      | 2 +-
 sound/soc/sof/intel/apl.c                         | 2 +-
 sound/soc/sof/intel/bdw.c                         | 2 +-
 sound/soc/sof/intel/byt.c                         | 2 +-
 sound/soc/sof/intel/cnl.c                         | 2 +-
 sound/soc/sof/intel/hda-bus.c                     | 2 +-
 sound/soc/sof/intel/hda-codec.c                   | 2 +-
 sound/soc/sof/intel/hda-compress.c                | 2 +-
 sound/soc/sof/intel/hda-ctrl.c                    | 2 +-
 sound/soc/sof/intel/hda-dai.c                     | 2 +-
 sound/soc/sof/intel/hda-dsp.c                     | 2 +-
 sound/soc/sof/intel/hda-ipc.c                     | 2 +-
 sound/soc/sof/intel/hda-ipc.h                     | 2 +-
 sound/soc/sof/intel/hda-loader.c                  | 2 +-
 sound/soc/sof/intel/hda-pcm.c                     | 2 +-
 sound/soc/sof/intel/hda-stream.c                  | 2 +-
 sound/soc/sof/intel/hda-trace.c                   | 2 +-
 sound/soc/sof/intel/hda.c                         | 2 +-
 sound/soc/sof/intel/hda.h                         | 2 +-
 sound/soc/sof/intel/intel-ipc.c                   | 2 +-
 sound/soc/sof/intel/shim.h                        | 2 +-
 sound/soc/sof/ipc.c                               | 2 +-
 sound/soc/sof/loader.c                            | 2 +-
 sound/soc/sof/nocodec.c                           | 2 +-
 sound/soc/sof/ops.c                               | 2 +-
 sound/soc/sof/ops.h                               | 2 +-
 sound/soc/sof/pcm.c                               | 2 +-
 sound/soc/sof/pm.c                                | 2 +-
 sound/soc/sof/probe.c                             | 2 +-
 sound/soc/sof/probe.h                             | 2 +-
 sound/soc/sof/sof-acpi-dev.c                      | 2 +-
 sound/soc/sof/sof-audio.c                         | 2 +-
 sound/soc/sof/sof-audio.h                         | 2 +-
 sound/soc/sof/sof-of-dev.c                        | 2 +-
 sound/soc/sof/sof-pci-dev.c                       | 2 +-
 sound/soc/sof/sof-priv.h                          | 2 +-
 sound/soc/sof/topology.c                          | 2 +-
 sound/soc/sof/trace.c                             | 2 +-
 sound/soc/sof/utils.c                             | 2 +-
 sound/soc/sof/xtensa/Makefile                     | 2 +-
 sound/soc/sof/xtensa/core.c                       | 2 +-
 112 files changed, 112 insertions(+), 112 deletions(-)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 392e953d561e..d2e9e3b4d7ea 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0-only
  *
  * Copyright (C) 2013-15, Intel Corporation. All rights reserved.
  */
diff --git a/include/sound/sof.h b/include/sound/sof.h
index 969f554b0b7d..f3e716c8ce1c 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/channel_map.h b/include/sound/sof/channel_map.h
index 21044eb5f377..fd3a30fcf756 100644
--- a/include/sound/sof/channel_map.h
+++ b/include/sound/sof/channel_map.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/control.h b/include/sound/sof/control.h
index 6080ea0facd7..7379a33d7247 100644
--- a/include/sound/sof/control.h
+++ b/include/sound/sof/control.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/dai-imx.h b/include/sound/sof/dai-imx.h
index ff9088dcc6f2..ca8325353d41 100644
--- a/include/sound/sof/dai-imx.h
+++ b/include/sound/sof/dai-imx.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * Copyright 2019 NXP
  *
diff --git a/include/sound/sof/dai-intel.h b/include/sound/sof/dai-intel.h
index 896db2243d87..136adf6686e2 100644
--- a/include/sound/sof/dai-intel.h
+++ b/include/sound/sof/dai-intel.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 2565edd336f1..34f135adf8ec 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index b79479575cc8..2d35997ace40 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index d5eff3179a39..5a55ba8b7e56 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/pm.h b/include/sound/sof/pm.h
index 3cf2e0f39d94..366aa6ec442b 100644
--- a/include/sound/sof/pm.h
+++ b/include/sound/sof/pm.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/stream.h b/include/sound/sof/stream.h
index 7facefb541b3..58a0d49977d6 100644
--- a/include/sound/sof/stream.h
+++ b/include/sound/sof/stream.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 08267d284edc..872de52b3144 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index 8056f214946d..c31a94a13ce0 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/include/sound/sof/xtensa.h b/include/sound/sof/xtensa.h
index dd53d36b34e1..87a07e520415 100644
--- a/include/sound/sof/xtensa.h
+++ b/include/sound/sof/xtensa.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
index 99a23fe7fab9..73d4f8c4f4c7 100644
--- a/sound/hda/intel-nhlt.c
+++ b/sound/hda/intel-nhlt.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2015-2019 Intel Corporation
 
 #include <linux/acpi.h>
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 8160520fd74c..e16d6dc4d4e6 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 # Core support
 obj-$(CONFIG_SND_SOC) += common/
 
diff --git a/sound/soc/intel/atom/Makefile b/sound/soc/intel/atom/Makefile
index 1dc60471b399..a9326d5ec44c 100644
--- a/sound/soc/intel/atom/Makefile
+++ b/sound/soc/intel/atom/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-atom-hifi2-platform-objs :=	sst-mfld-platform-pcm.o \
 					sst-mfld-platform-compress.o \
 					sst-atom-controls.o
diff --git a/sound/soc/intel/atom/sst/Makefile b/sound/soc/intel/atom/sst/Makefile
index 795d1cf8f386..f17c905df3e2 100644
--- a/sound/soc/intel/atom/sst/Makefile
+++ b/sound/soc/intel/atom/sst/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 snd-intel-sst-core-objs := sst.o sst_ipc.o sst_stream.o sst_drv_interface.o sst_loader.o sst_pvt.o
 snd-intel-sst-pci-objs += sst_pci.o
 snd-intel-sst-acpi-objs += sst_acpi.o
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 98bf42463a1b..2c9d891a84b8 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-haswell-objs := haswell.o
 snd-soc-sst-byt-rt5640-mach-objs := byt-rt5640.o
 snd-soc-sst-byt-max98090-mach-objs := byt-max98090.o
diff --git a/sound/soc/intel/boards/bytcht_cx2072x.c b/sound/soc/intel/boards/bytcht_cx2072x.c
index 3b3df7c9008c..c7f81a93d7c8 100644
--- a/sound/soc/intel/boards/bytcht_cx2072x.c
+++ b/sound/soc/intel/boards/bytcht_cx2072x.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // ASoC DPCM Machine driver for Baytrail / Cherrytrail platforms with
 // CX2072X codec
diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index da6fefaf6785..68eff29daf8f 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2019 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/ehl_rt5660.c b/sound/soc/intel/boards/ehl_rt5660.c
index 2e3244d5496b..78160e3b1615 100644
--- a/sound/soc/intel/boards/ehl_rt5660.c
+++ b/sound/soc/intel/boards/ehl_rt5660.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/glk_rt5682_max98357a.c b/sound/soc/intel/boards/glk_rt5682_max98357a.c
index f13158e4a1fc..48eda1a8aa6c 100644
--- a/sound/soc/intel/boards/glk_rt5682_max98357a.c
+++ b/sound/soc/intel/boards/glk_rt5682_max98357a.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2018 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 9179f07f9ee4..244b57fba64c 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Copyright(c) 2019 Intel Corporation. All rights reserved.
 
diff --git a/sound/soc/intel/boards/hda_dsp_common.h b/sound/soc/intel/boards/hda_dsp_common.h
index 431f7f09dccb..727edd256962 100644
--- a/sound/soc/intel/boards/hda_dsp_common.h
+++ b/sound/soc/intel/boards/hda_dsp_common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright(c) 2019 Intel Corporation.
  */
diff --git a/sound/soc/intel/boards/kbl_da7219_max98357a.c b/sound/soc/intel/boards/kbl_da7219_max98357a.c
index 32cd90b8d4c4..dc3d897ad280 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98357a.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98357a.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2017-18 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/kbl_da7219_max98927.c b/sound/soc/intel/boards/kbl_da7219_max98927.c
index abd4e3839678..cc9b5eab8b4a 100644
--- a/sound/soc/intel/boards/kbl_da7219_max98927.c
+++ b/sound/soc/intel/boards/kbl_da7219_max98927.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2018 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/kbl_rt5660.c b/sound/soc/intel/boards/kbl_rt5660.c
index 6460e3f0c974..d2a078454784 100644
--- a/sound/soc/intel/boards/kbl_rt5660.c
+++ b/sound/soc/intel/boards/kbl_rt5660.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2018-19 Canonical Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 78ff5f24c40e..07bfb2e64b3b 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2015-18 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index e8545d13062f..507750ef67f3 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright(c) 2015-18 Intel Corporation.
  */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index fc9290fb4e99..79c8947f840b 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2015-18 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 8ca8f76470fa..703703858595 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2019 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 463b39a7ccfd..1a549b32d1c9 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Copyright(c) 2020 Intel Corporation. All rights reserved.
 #include <linux/string.h>
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 406bf0e81155..785b34335368 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Copyright(c) 2020 Intel Corporation.
  */
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index fb7811899999..f983c7fbb1d1 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2018-2020 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 8c29431b5847..13a48b0c35ae 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2019-2020 Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index cffc790fc2ea..bbbc802624f8 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index dd593ff3575b..69b363b8a686 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0
+/* SPDX-License-Identifier: GPL-2.0-only
  *  Copyright (c) 2020 Intel Corporation
  */
 
diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/intel/boards/sof_sdw_dmic.c
index e92176bf0ad4..89b0824b2381 100644
--- a/sound/soc/intel/boards/sof_sdw_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_dmic.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_hdmi.c b/sound/soc/intel/boards/sof_sdw_hdmi.c
index cb1118e78e89..b60852339330 100644
--- a/sound/soc/intel/boards/sof_sdw_hdmi.c
+++ b/sound/soc/intel/boards/sof_sdw_hdmi.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt1308.c
index a3d0e053b1a6..177cc781ada6 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1308.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1308.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index 6680dde76682..da354ba83939 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index d3725bb91e43..5515f397a3dd 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 8590a8a8889f..1ded5d9895cf 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/boards/sof_sdw_rt715.c b/sound/soc/intel/boards/sof_sdw_rt715.c
index 321e1cbc03ed..9b298f79e784 100644
--- a/sound/soc/intel/boards/sof_sdw_rt715.c
+++ b/sound/soc/intel/boards/sof_sdw_rt715.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2020 Intel Corporation
 
 /*
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index bd352878f89a..2674c9790fa1 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 snd-soc-sst-dsp-objs := sst-dsp.o
 snd-soc-sst-acpi-objs := sst-acpi.o
 snd-soc-sst-ipc-objs := sst-ipc.o
diff --git a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
index f5092bc48364..68758e7a16d8 100644
--- a/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-bxt-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-bxt-match.c - tables and support for BXT ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
index ff9d6938b9f6..27b4b73d94d4 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cfl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-apci-intel-cfl-match.c - tables and support for CFL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index 7d85bd5aff9f..cdea0c09fe0a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-cml-match.c - tables and support for CML ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
index 828980d5630d..6a0bcc1a8429 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cnl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-cnl-match.c - tables and support for CNL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
index b9ae0e2c959f..45e07d886013 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ehl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-apci-intel-ehl-match.c - tables and support for EHL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-glk-match.c b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
index 60dea358fa04..26cb3b16cdd3 100644
--- a/sound/soc/intel/common/soc-acpi-intel-glk-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-glk-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-glk-match.c - tables and support for GLK ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-hda-match.c b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
index cc972d2ac691..aa9cb522aac9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-hda-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-hda-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018, Intel Corporation.
 
 /*
diff --git a/sound/soc/intel/common/soc-acpi-intel-icl-match.c b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
index 16ec9f382b0f..6927bbbc66fc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-icl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-icl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-icl-match.c - tables and support for ICL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index 4388a32718d8..859f8a1bd914 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-apci-intel-jsl-match.c - tables and support for JSL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
index e200baa11011..a4fbe6707ca7 100644
--- a/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-kbl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-kbl-match.c - tables and support for KBL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-skl-match.c b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
index 42fa40a8d932..26f9ce146523 100644
--- a/sound/soc/intel/common/soc-acpi-intel-skl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-skl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-acpi-intel-skl-match.c - tables and support for SKL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 449d9d2286ae..5a56f4359479 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * soc-apci-intel-tgl-match.c - tables and support for ICL ACPI enumeration.
  *
diff --git a/sound/soc/intel/common/soc-intel-quirks.h b/sound/soc/intel/common/soc-intel-quirks.h
index a9176150c6ed..b07df3059926 100644
--- a/sound/soc/intel/common/soc-intel-quirks.h
+++ b/sound/soc/intel/common/soc-intel-quirks.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * soc-intel-quirks.h - prototypes for quirk autodetection
  *
diff --git a/sound/soc/intel/skylake/Makefile b/sound/soc/intel/skylake/Makefile
index 48544ff1a3e6..dd39149b89b1 100644
--- a/sound/soc/intel/skylake/Makefile
+++ b/sound/soc/intel/skylake/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 snd-soc-skl-objs := skl.o skl-pcm.o skl-nhlt.o skl-messages.o skl-topology.o \
 		skl-sst-ipc.o skl-sst-dsp.o cnl-sst-dsp.o skl-sst-cldma.o \
 		skl-sst.o bxt-sst.o cnl-sst.o skl-sst-utils.o
diff --git a/sound/soc/intel/skylake/skl-ssp-clk.c b/sound/soc/intel/skylake/skl-ssp-clk.c
index bd43885f3805..a3a73c26f9aa 100644
--- a/sound/soc/intel/skylake/skl-ssp-clk.c
+++ b/sound/soc/intel/skylake/skl-ssp-clk.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL-2.0
+// SPDX-License-Identifier: GPL-2.0-only
 // Copyright(c) 2015-17 Intel Corporation
 
 /*
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 8eca2f85c90e..05718dfe6cd2 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
 		control.o trace.o utils.o sof-audio.o
diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 7294451cd67c..2d4969c705a4 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/compress.h b/sound/soc/sof/compress.h
index 0386844c0bf5..ca8790bd4b13 100644
--- a/sound/soc/sof/compress.h
+++ b/sound/soc/sof/compress.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index dfc412e2d956..97d5aca45de8 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 91acfae7935c..94a2cb58ab9a 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index b5c0d6cf72cc..8e15f105d1d5 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 66684d7590f4..8230285baa43 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 config SND_SOC_SOF_IMX_TOPLEVEL
 	bool "SOF support for NXP i.MX audio DSPs"
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index d9d8dc1765b8..2b933b02bbac 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 snd-sof-imx8-objs := imx8.o
 snd-sof-imx8m-objs := imx8m.o
 
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index b692752b2178..68b2edccd791 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // Copyright 2019 NXP
 //
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index 07451ba4efae..3ac0444dca93 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // Copyright 2020 NXP
 //
diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index cee02a2e00f4..f7e9358f1f06 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-intel-byt-objs := byt.o
 snd-sof-intel-bdw-objs := bdw.o
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index 02218d22e51f..9e29d4fd393a 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index a32a3ef78ec5..99fd0bd7276e 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 29fd1d86156c..f872bb1f2682 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e427d00eca71..16db0f50d139 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 1d2babdda9dd..789148e5584b 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 7e7e296a3953..c3299be119a1 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-compress.c b/sound/soc/sof/intel/hda-compress.c
index 38a1ebec8478..53c08034fa22 100644
--- a/sound/soc/sof/intel/hda-compress.c
+++ b/sound/soc/sof/intel/hda-compress.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 6288b2f99540..fa5f0a718901 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 833dc303b394..3934cd6bf87a 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index c780e1e6f895..9e5ff8c18f99 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 6062bb6011fb..c91aa951df22 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-ipc.h b/sound/soc/sof/intel/hda-ipc.h
index aef0ceac9803..ade4c3191a39 100644
--- a/sound/soc/sof/intel/hda-ipc.h
+++ b/sound/soc/sof/intel/hda-ipc.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 1beaaf5879e2..d762b3e1ce4a 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index a46a6baa1c3f..53a875ac52d6 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 5d386956906f..7f65dcc95811 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index 33b23bd6a01e..1eb746d5adeb 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 337dce3b5def..578ac7b036b0 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e9825798de77..fe452f0d0ec7 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/intel-ipc.c b/sound/soc/sof/intel/intel-ipc.c
index e935f70d611b..310f9168c124 100644
--- a/sound/soc/sof/intel/intel-ipc.c
+++ b/sound/soc/sof/intel/intel-ipc.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index daaf3364c177..6fe8b004b50e 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 1c6794918cbb..f7a0353596fb 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 89f35db2577d..4a5b57ecf359 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 5bf67b2aa4e7..ce053ba8f2e8 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index 7a27c3b719e7..1a394b4c6a2f 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index a771500ac442..b21632f5511a 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e9679fcba428..22fe9d5e932b 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index c410822d9920..1f8f7e33979d 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/probe.c b/sound/soc/sof/probe.c
index c38169fe00c5..14509f4d3f86 100644
--- a/sound/soc/sof/probe.c
+++ b/sound/soc/sof/probe.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/probe.h b/sound/soc/sof/probe.h
index 45daa5552834..b04b728c7224 100644
--- a/sound/soc/sof/probe.h
+++ b/sound/soc/sof/probe.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 1278aa95effa..c5eaaa978054 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index fc4ed2a8a914..1c7698f8edd6 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index bf65f31af858..41e2abd077e6 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index c6167597d6fe..f492c5dfa659 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // Copyright 2019 NXP
 //
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index b5f0221d624f..b13697dab7c0 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 965b9da696d5..a34dbae9f971 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
 /*
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 8ab0fc558054..42d1b1e55e55 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index d815090252f8..69889241a092 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/utils.c b/sound/soc/sof/utils.c
index 9831eb57df6c..5539d3afbe8f 100644
--- a/sound/soc/sof/utils.c
+++ b/sound/soc/sof/utils.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
diff --git a/sound/soc/sof/xtensa/Makefile b/sound/soc/sof/xtensa/Makefile
index cc89c7472a38..b8376ea04bcf 100644
--- a/sound/soc/sof/xtensa/Makefile
+++ b/sound/soc/sof/xtensa/Makefile
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-xtensa-dsp-objs := core.o
 
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index ea08651f0bb3..bbb9a2282ed9 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.

base-commit: e8e7ef43c73328276e1d446b02ae16006742ebb1
-- 
2.20.1

