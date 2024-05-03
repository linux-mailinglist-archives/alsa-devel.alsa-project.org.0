Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 410878BAE77
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:07:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C85DCE97;
	Fri,  3 May 2024 16:07:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C85DCE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745247;
	bh=vMRFQQdzv8KSlGyVTXJ5qwkLTTz29bT0y/mKFdFbTOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S4uQERt+j5We3cFsxvazpvGtmLJcbYCcSXTlYd/msJTvJV1ziL3T41FZbV1e/PDAU
	 N7tIV07fgILzKkAAffrk9HTxu/Kwsg0tdoobML205Bp7gdmAQIdnrSz7aMp5zFeWoC
	 73Woc850gef/jPqfiZYeznI8oo8JNesZmkU1ABEs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D949F806E8; Fri,  3 May 2024 16:05:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CF0A9F806E5;
	Fri,  3 May 2024 16:05:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 77281F80674; Fri,  3 May 2024 16:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90EB3F8023A
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90EB3F8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CCCeqVPn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745069; x=1746281069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vMRFQQdzv8KSlGyVTXJ5qwkLTTz29bT0y/mKFdFbTOM=;
  b=CCCeqVPni4HbQi9qerbTvRf98Z6++sTtFmqQvLem1sP4TQ3HPbX3/A7m
   drdmurYsDnLaLiilcHxKYY3jpqqk5eYkZYcWgBv3mas8FzeFTDZ4x4c+x
   cUX9Xy6njzx8IGysk/1Suw9MV7qMiJl3+wLHLMLXFU8ftsUgulNfV/0oE
   q+P5X04043FWaFmon888qQ6rPRieVGw6toK9j3UdCLfZUpTJhhGn5l6qB
   npvIxqUsVKRAnlzT7rrnpDAQXqsDw1WgUXpCpXuoIucS0BFfaINHlQI6j
   uP9u2KU4amZkKT+YdzNUn+DM879GN44MOHUa5pq5MdvChrdgD/6F9Ux6O
   Q==;
X-CSE-ConnectionGUID: CPQYrEJ8QfKmuR/rJJv5qA==
X-CSE-MsgGUID: Y/OPNXBFQ0W8LsFyDqGfpg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369508"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369508"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:18 -0700
X-CSE-ConnectionGUID: niSuKjKfT4KdYj+yM4HC/g==
X-CSE-MsgGUID: mhz1kAvLS4GX2oibR7bfgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908071"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 1/9] ASoC: SOF: Intel: clarify Copyright information
Date: Fri,  3 May 2024 09:03:51 -0500
Message-Id: <20240503140359.259762-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WC7UZZPEL4BYSEVAQ7FLRWEY4INFB4WE
X-Message-ID-Hash: WC7UZZPEL4BYSEVAQ7FLRWEY4INFB4WE
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WC7UZZPEL4BYSEVAQ7FLRWEY4INFB4WE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/control.c                        | 2 +-
 sound/soc/sof/core.c                           | 2 +-
 sound/soc/sof/debug.c                          | 2 +-
 sound/soc/sof/fw-file-profile.c                | 2 +-
 sound/soc/sof/intel/apl.c                      | 2 +-
 sound/soc/sof/intel/atom.c                     | 2 +-
 sound/soc/sof/intel/atom.h                     | 2 +-
 sound/soc/sof/intel/bdw.c                      | 2 +-
 sound/soc/sof/intel/byt.c                      | 2 +-
 sound/soc/sof/intel/cnl.c                      | 2 +-
 sound/soc/sof/intel/ext_manifest.h             | 2 +-
 sound/soc/sof/intel/hda-bus.c                  | 2 +-
 sound/soc/sof/intel/hda-codec.c                | 2 +-
 sound/soc/sof/intel/hda-common-ops.c           | 2 +-
 sound/soc/sof/intel/hda-ctrl.c                 | 2 +-
 sound/soc/sof/intel/hda-dai-ops.c              | 2 +-
 sound/soc/sof/intel/hda-dai.c                  | 2 +-
 sound/soc/sof/intel/hda-dsp.c                  | 2 +-
 sound/soc/sof/intel/hda-ipc.c                  | 2 +-
 sound/soc/sof/intel/hda-ipc.h                  | 2 +-
 sound/soc/sof/intel/hda-loader-skl.c           | 2 +-
 sound/soc/sof/intel/hda-loader.c               | 2 +-
 sound/soc/sof/intel/hda-mlink.c                | 2 +-
 sound/soc/sof/intel/hda-pcm.c                  | 2 +-
 sound/soc/sof/intel/hda-probes.c               | 2 +-
 sound/soc/sof/intel/hda-stream.c               | 2 +-
 sound/soc/sof/intel/hda-trace.c                | 2 +-
 sound/soc/sof/intel/hda.c                      | 2 +-
 sound/soc/sof/intel/hda.h                      | 2 +-
 sound/soc/sof/intel/icl.c                      | 2 +-
 sound/soc/sof/intel/lnl.c                      | 2 +-
 sound/soc/sof/intel/lnl.h                      | 2 +-
 sound/soc/sof/intel/mtl.c                      | 2 +-
 sound/soc/sof/intel/mtl.h                      | 2 +-
 sound/soc/sof/intel/pci-apl.c                  | 2 +-
 sound/soc/sof/intel/pci-cnl.c                  | 2 +-
 sound/soc/sof/intel/pci-icl.c                  | 2 +-
 sound/soc/sof/intel/pci-lnl.c                  | 2 +-
 sound/soc/sof/intel/pci-mtl.c                  | 2 +-
 sound/soc/sof/intel/pci-skl.c                  | 2 +-
 sound/soc/sof/intel/pci-tgl.c                  | 2 +-
 sound/soc/sof/intel/pci-tng.c                  | 2 +-
 sound/soc/sof/intel/shim.h                     | 2 +-
 sound/soc/sof/intel/skl.c                      | 2 +-
 sound/soc/sof/intel/telemetry.c                | 2 +-
 sound/soc/sof/intel/telemetry.h                | 2 +-
 sound/soc/sof/intel/tgl.c                      | 2 +-
 sound/soc/sof/iomem-utils.c                    | 2 +-
 sound/soc/sof/ipc.c                            | 2 +-
 sound/soc/sof/ipc3-control.c                   | 2 +-
 sound/soc/sof/ipc3-dtrace.c                    | 2 +-
 sound/soc/sof/ipc3-loader.c                    | 2 +-
 sound/soc/sof/ipc3-pcm.c                       | 2 +-
 sound/soc/sof/ipc3-priv.h                      | 2 +-
 sound/soc/sof/ipc3-topology.c                  | 2 +-
 sound/soc/sof/ipc3.c                           | 2 +-
 sound/soc/sof/ipc4-control.c                   | 2 +-
 sound/soc/sof/ipc4-fw-reg.h                    | 2 +-
 sound/soc/sof/ipc4-loader.c                    | 2 +-
 sound/soc/sof/ipc4-mtrace.c                    | 2 +-
 sound/soc/sof/ipc4-pcm.c                       | 2 +-
 sound/soc/sof/ipc4-priv.h                      | 2 +-
 sound/soc/sof/ipc4-telemetry.c                 | 2 +-
 sound/soc/sof/ipc4-telemetry.h                 | 2 +-
 sound/soc/sof/ipc4-topology.c                  | 2 +-
 sound/soc/sof/ipc4-topology.h                  | 2 +-
 sound/soc/sof/ipc4.c                           | 2 +-
 sound/soc/sof/loader.c                         | 2 +-
 sound/soc/sof/nocodec.c                        | 2 +-
 sound/soc/sof/ops.c                            | 2 +-
 sound/soc/sof/ops.h                            | 2 +-
 sound/soc/sof/pcm.c                            | 2 +-
 sound/soc/sof/pm.c                             | 2 +-
 sound/soc/sof/sof-acpi-dev.c                   | 2 +-
 sound/soc/sof/sof-acpi-dev.h                   | 2 +-
 sound/soc/sof/sof-audio.c                      | 2 +-
 sound/soc/sof/sof-audio.h                      | 2 +-
 sound/soc/sof/sof-client-ipc-flood-test.c      | 2 +-
 sound/soc/sof/sof-client-ipc-kernel-injector.c | 2 +-
 sound/soc/sof/sof-client-ipc-msg-injector.c    | 2 +-
 sound/soc/sof/sof-client-probes-ipc3.c         | 2 +-
 sound/soc/sof/sof-client-probes-ipc4.c         | 2 +-
 sound/soc/sof/sof-client-probes.c              | 2 +-
 sound/soc/sof/sof-client.c                     | 2 +-
 sound/soc/sof/sof-pci-dev.c                    | 2 +-
 sound/soc/sof/sof-pci-dev.h                    | 2 +-
 sound/soc/sof/sof-priv.h                       | 2 +-
 sound/soc/sof/sof-utils.c                      | 2 +-
 sound/soc/sof/sof-utils.h                      | 2 +-
 sound/soc/sof/stream-ipc.c                     | 2 +-
 sound/soc/sof/topology.c                       | 2 +-
 sound/soc/sof/trace.c                          | 2 +-
 sound/soc/sof/xtensa/core.c                    | 2 +-
 93 files changed, 93 insertions(+), 93 deletions(-)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index 75e13f4fd1eb..463d418e7200 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 238bda5f6b76..0a4917136ff9 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index a620d1bcd49d..d0ffa1d71145 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/fw-file-profile.c b/sound/soc/sof/fw-file-profile.c
index b56b14232444..1c0eb13ae557 100644
--- a/sound/soc/sof/fw-file-profile.c
+++ b/sound/soc/sof/fw-file-profile.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 //
 
 #include <linux/firmware.h>
diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index bc364c7cb3b6..76a92eaa1359 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/atom.c b/sound/soc/sof/intel/atom.c
index bd9789b483b1..86af4e9a716e 100644
--- a/sound/soc/sof/intel/atom.c
+++ b/sound/soc/sof/intel/atom.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2021 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/atom.h b/sound/soc/sof/intel/atom.h
index b965e5e080a6..20fb19102cb0 100644
--- a/sound/soc/sof/intel/atom.h
+++ b/sound/soc/sof/intel/atom.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2017-2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2017-2021 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 2e8926cd00f6..3262286a9a9d 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 14a065999a89..d78d11d4cfbf 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index 1936865b2937..6a8c7a108ef0 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/ext_manifest.h b/sound/soc/sof/intel/ext_manifest.h
index 2dfae9285d3c..1ca19c691852 100644
--- a/sound/soc/sof/intel/ext_manifest.h
+++ b/sound/soc/sof/intel/ext_manifest.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  */
 
 /*
diff --git a/sound/soc/sof/intel/hda-bus.c b/sound/soc/sof/intel/hda-bus.c
index 292fd334330b..1989147aa6a4 100644
--- a/sound/soc/sof/intel/hda-bus.c
+++ b/sound/soc/sof/intel/hda-bus.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Keyon Jie <yang.jie@linux.intel.com>
 
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 6a13f38a8d21..da3db3ed379e 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Keyon Jie <yang.jie@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/hda-common-ops.c b/sound/soc/sof/intel/hda-common-ops.c
index e4c5031d227e..5fc28039a8e8 100644
--- a/sound/soc/sof/intel/hda-common-ops.c
+++ b/sound/soc/sof/intel/hda-common-ops.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 
 /*
diff --git a/sound/soc/sof/intel/hda-ctrl.c b/sound/soc/sof/intel/hda-ctrl.c
index 810a2ba4fbe4..262b482dc0a8 100644
--- a/sound/soc/sof/intel/hda-ctrl.c
+++ b/sound/soc/sof/intel/hda-ctrl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-dai-ops.c b/sound/soc/sof/intel/hda-dai-ops.c
index 457144203999..484c76147885 100644
--- a/sound/soc/sof/intel/hda-dai-ops.c
+++ b/sound/soc/sof/intel/hda-dai-ops.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 #include <sound/pcm_params.h>
 #include <sound/hdaudio_ext.h>
diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index f494d8701345..ce675c22a5ab 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Keyon Jie <yang.jie@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4a27e1dfca39..1315f5bc3e31 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 6b7f2337567c..9feaaa2d166a 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-ipc.h b/sound/soc/sof/intel/hda-ipc.h
index 8ec5e9f6f8d7..ad9478b8c390 100644
--- a/sound/soc/sof/intel/hda-ipc.h
+++ b/sound/soc/sof/intel/hda-ipc.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ * Copyright(c) 2019 Intel Corporation
  *
  * Author: Keyon Jie <yang.jie@linux.intel.com>
  */
diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 1e77ca936f80..f38178c904de 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 
 #include <linux/delay.h>
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index df668806a8c4..b8b914eaf7e0 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-mlink.c b/sound/soc/sof/intel/hda-mlink.c
index b592e687a87a..04bbc5c9904c 100644
--- a/sound/soc/sof/intel/hda-mlink.c
+++ b/sound/soc/sof/intel/hda-mlink.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 
 /*
diff --git a/sound/soc/sof/intel/hda-pcm.c b/sound/soc/sof/intel/hda-pcm.c
index 27dc134f04a8..9fb8521b896b 100644
--- a/sound/soc/sof/intel/hda-pcm.c
+++ b/sound/soc/sof/intel/hda-pcm.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-probes.c b/sound/soc/sof/intel/hda-probes.c
index be0fd56ddb27..3e33101f0521 100644
--- a/sound/soc/sof/intel/hda-probes.c
+++ b/sound/soc/sof/intel/hda-probes.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2019-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2019-2021 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 // Converted to SOF client:
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 7a38bea663fe..8213debde497 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda-trace.c b/sound/soc/sof/intel/hda-trace.c
index f0d959ba50c4..351eb2eb184b 100644
--- a/sound/soc/sof/intel/hda-trace.c
+++ b/sound/soc/sof/intel/hda-trace.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 70b36b0b4147..e6a38de0a0aa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index e675ff8a83a5..3c9e1d59e1ab 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2017 Intel Corporation. All rights reserved.
+ * Copyright(c) 2017 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/sound/soc/sof/intel/icl.c b/sound/soc/sof/intel/icl.c
index 9b916eb4fc21..dad6bc72ad37 100644
--- a/sound/soc/sof/intel/icl.c
+++ b/sound/soc/sof/intel/icl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Fred Oh <fred.oh@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/lnl.c b/sound/soc/sof/intel/lnl.c
index a7446be36627..4b5665f82170 100644
--- a/sound/soc/sof/intel/lnl.c
+++ b/sound/soc/sof/intel/lnl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 /*
  * Hardware interface for audio DSP on LunarLake.
diff --git a/sound/soc/sof/intel/lnl.h b/sound/soc/sof/intel/lnl.h
index 4f4734fe7e08..79101af84b2e 100644
--- a/sound/soc/sof/intel/lnl.h
+++ b/sound/soc/sof/intel/lnl.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2024 Intel Corporation. All rights reserved.
+ * Copyright(c) 2024 Intel Corporation
  */
 
 #ifndef __SOF_INTEL_LNL_H
diff --git a/sound/soc/sof/intel/mtl.c b/sound/soc/sof/intel/mtl.c
index b9fc123be75d..1bf274509ee6 100644
--- a/sound/soc/sof/intel/mtl.c
+++ b/sound/soc/sof/intel/mtl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index d2d709fb4f06..7acaa7e724f4 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2020-2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020-2022 Intel Corporation
  */
 
 /* DSP Registers */
diff --git a/sound/soc/sof/intel/pci-apl.c b/sound/soc/sof/intel/pci-apl.c
index 7551d4eb150d..df6d897da290 100644
--- a/sound/soc/sof/intel/pci-apl.c
+++ b/sound/soc/sof/intel/pci-apl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2021 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-cnl.c b/sound/soc/sof/intel/pci-cnl.c
index f2584a314711..a39fa3657d55 100644
--- a/sound/soc/sof/intel/pci-cnl.c
+++ b/sound/soc/sof/intel/pci-cnl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-icl.c b/sound/soc/sof/intel/pci-icl.c
index a2826073ad3b..9f1fe47475fb 100644
--- a/sound/soc/sof/intel/pci-icl.c
+++ b/sound/soc/sof/intel/pci-icl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2021 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-lnl.c b/sound/soc/sof/intel/pci-lnl.c
index 5ad497826983..68e5c90151b2 100644
--- a/sound/soc/sof/intel/pci-lnl.c
+++ b/sound/soc/sof/intel/pci-lnl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 //
 // Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-mtl.c b/sound/soc/sof/intel/pci-mtl.c
index ad2615808394..c685cb8d6171 100644
--- a/sound/soc/sof/intel/pci-mtl.c
+++ b/sound/soc/sof/intel/pci-mtl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 // Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-skl.c b/sound/soc/sof/intel/pci-skl.c
index 0bbfc4f55ff3..862da8009543 100644
--- a/sound/soc/sof/intel/pci-skl.c
+++ b/sound/soc/sof/intel/pci-skl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 
 #include <linux/module.h>
diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index dc40ec8c6256..f73bb47cd79e 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2021 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/pci-tng.c b/sound/soc/sof/intel/pci-tng.c
index d8a36d5a29f7..5c3069588bb7 100644
--- a/sound/soc/sof/intel/pci-tng.c
+++ b/sound/soc/sof/intel/pci-tng.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2021 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/intel/shim.h b/sound/soc/sof/intel/shim.h
index 448ec54a6aa9..9328d2bbfd03 100644
--- a/sound/soc/sof/intel/shim.h
+++ b/sound/soc/sof/intel/shim.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2017 Intel Corporation. All rights reserved.
+ * Copyright(c) 2017 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 93824e6ce573..9a002811e9ff 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 
 /*
diff --git a/sound/soc/sof/intel/telemetry.c b/sound/soc/sof/intel/telemetry.c
index 042360f0d03f..2d2f96548310 100644
--- a/sound/soc/sof/intel/telemetry.c
+++ b/sound/soc/sof/intel/telemetry.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 /* telemetry data queried from debug window */
 
diff --git a/sound/soc/sof/intel/telemetry.h b/sound/soc/sof/intel/telemetry.h
index 3c2b23c75f5d..e4e91943a41a 100644
--- a/sound/soc/sof/intel/telemetry.h
+++ b/sound/soc/sof/intel/telemetry.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ * Copyright(c) 2023 Intel Corporation
  *
  * telemetry data in debug windows
  */
diff --git a/sound/soc/sof/intel/tgl.c b/sound/soc/sof/intel/tgl.c
index 062327d4f068..df2d26b78ddc 100644
--- a/sound/soc/sof/intel/tgl.c
+++ b/sound/soc/sof/intel/tgl.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Authors: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
diff --git a/sound/soc/sof/iomem-utils.c b/sound/soc/sof/iomem-utils.c
index 3f57f6cf6542..cd9cb54e7b23 100644
--- a/sound/soc/sof/iomem-utils.c
+++ b/sound/soc/sof/iomem-utils.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 // Author: Keyon Jie <yang.jie@linux.intel.com>
 //
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index febe372f9aa8..3fb8d3e9dc6a 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/ipc3-control.c b/sound/soc/sof/ipc3-control.c
index a8deec7dc021..2b1befad6d5c 100644
--- a/sound/soc/sof/ipc3-control.c
+++ b/sound/soc/sof/ipc3-control.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 //
 
diff --git a/sound/soc/sof/ipc3-dtrace.c b/sound/soc/sof/ipc3-dtrace.c
index 0dca139322f3..744a91a150bc 100644
--- a/sound/soc/sof/ipc3-dtrace.c
+++ b/sound/soc/sof/ipc3-dtrace.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 
diff --git a/sound/soc/sof/ipc3-loader.c b/sound/soc/sof/ipc3-loader.c
index 6e3ef0672110..35b89c2b9d4c 100644
--- a/sound/soc/sof/ipc3-loader.c
+++ b/sound/soc/sof/ipc3-loader.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 #include <linux/firmware.h>
 #include "sof-priv.h"
diff --git a/sound/soc/sof/ipc3-pcm.c b/sound/soc/sof/ipc3-pcm.c
index af0bf354cb20..1c1b8f595367 100644
--- a/sound/soc/sof/ipc3-pcm.c
+++ b/sound/soc/sof/ipc3-pcm.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 //
 
diff --git a/sound/soc/sof/ipc3-priv.h b/sound/soc/sof/ipc3-priv.h
index 9cd7794f3cb6..866c5f67b91a 100644
--- a/sound/soc/sof/ipc3-priv.h
+++ b/sound/soc/sof/ipc3-priv.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SOF_IPC3_PRIV_H
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index ab7f46a162da..32c7d1f3b528 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 //
 
diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index c03dd513fbff..83c22d4a4830 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2021 Intel Corporation. All rights reserved.
+// Copyright(c) 2021 Intel Corporation
 //
 //
 
diff --git a/sound/soc/sof/ipc4-control.c b/sound/soc/sof/ipc4-control.c
index 1be9519de909..576f407cd456 100644
--- a/sound/soc/sof/ipc4-control.c
+++ b/sound/soc/sof/ipc4-control.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 //
 
diff --git a/sound/soc/sof/ipc4-fw-reg.h b/sound/soc/sof/ipc4-fw-reg.h
index 7226161e57e1..7b85a364a6a6 100644
--- a/sound/soc/sof/ipc4-fw-reg.h
+++ b/sound/soc/sof/ipc4-fw-reg.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 #ifndef __IPC4_FW_REG_H__
diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 641c4f24cca9..bcdb33d03682 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 #include <linux/firmware.h>
 #include <sound/sof/ext_manifest4.h>
diff --git a/sound/soc/sof/ipc4-mtrace.c b/sound/soc/sof/ipc4-mtrace.c
index 0e04bea9432d..aa5b78604db6 100644
--- a/sound/soc/sof/ipc4-mtrace.c
+++ b/sound/soc/sof/ipc4-mtrace.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 #include <linux/debugfs.h>
 #include <linux/sched/signal.h>
diff --git a/sound/soc/sof/ipc4-pcm.c b/sound/soc/sof/ipc4-pcm.c
index 4594470ed08b..307bee63756b 100644
--- a/sound/soc/sof/ipc4-pcm.c
+++ b/sound/soc/sof/ipc4-pcm.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 
 #include <sound/pcm_params.h>
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index e157ab80a103..ea3323b90343 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SOF_IPC4_PRIV_H
diff --git a/sound/soc/sof/ipc4-telemetry.c b/sound/soc/sof/ipc4-telemetry.c
index ec4ae9674364..ddc3bc494ffe 100644
--- a/sound/soc/sof/ipc4-telemetry.c
+++ b/sound/soc/sof/ipc4-telemetry.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2023 Intel Corporation
 //
 
 #include <linux/debugfs.h>
diff --git a/sound/soc/sof/ipc4-telemetry.h b/sound/soc/sof/ipc4-telemetry.h
index ab3599e3d87d..9298f8acc648 100644
--- a/sound/soc/sof/ipc4-telemetry.h
+++ b/sound/soc/sof/ipc4-telemetry.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2023 Intel Corporation. All rights reserved.
+ * Copyright(c) 2023 Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SOF_IPC4_TELEMETRY_H
diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index d0125fd1c09f..beff10989324 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 //
 #include <linux/bitfield.h>
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 6e33208a357f..4488762f6a71 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 #ifndef __INCLUDE_SOUND_SOF_IPC4_TOPOLOGY_H__
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index ac5c6bc66d2a..4386cbae16d4 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Rander Wang <rander.wang@linux.intel.com>
 //	    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 2f8555f11c03..0baf316b0064 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 34aa8a7cfc7d..fdcbe33d3dcf 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/ops.c b/sound/soc/sof/ops.c
index ff066de4ceb9..bd52e7ec6883 100644
--- a/sound/soc/sof/ops.c
+++ b/sound/soc/sof/ops.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 3cd748e13460..2584621c3b2d 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index cb774e011e31..baad4c1445aa 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 704b21413c71..8e3bcf602beb 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-acpi-dev.c b/sound/soc/sof/sof-acpi-dev.c
index 2977f0a63fba..2d96d00f1c44 100644
--- a/sound/soc/sof/sof-acpi-dev.c
+++ b/sound/soc/sof/sof-acpi-dev.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-acpi-dev.h b/sound/soc/sof/sof-acpi-dev.h
index 9bf8f75ceaae..89adfa507035 100644
--- a/sound/soc/sof/sof-acpi-dev.h
+++ b/sound/soc/sof/sof-acpi-dev.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SOF_ACPI_H
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 32fef64ef10d..b3ac040811e7 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2019 Intel Corporation. All rights reserved.
+// Copyright(c) 2019 Intel Corporation
 //
 // Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-audio.h b/sound/soc/sof/sof-audio.h
index 2aeb269af752..ec2a3bb644d2 100644
--- a/sound/soc/sof/sof-audio.h
+++ b/sound/soc/sof/sof-audio.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2019 Intel Corporation. All rights reserved.
+ * Copyright(c) 2019 Intel Corporation
  *
  * Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
  */
diff --git a/sound/soc/sof/sof-client-ipc-flood-test.c b/sound/soc/sof/sof-client-ipc-flood-test.c
index 1b2e9e25a836..435614926092 100644
--- a/sound/soc/sof/sof-client-ipc-flood-test.c
+++ b/sound/soc/sof/sof-client-ipc-flood-test.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //	    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
diff --git a/sound/soc/sof/sof-client-ipc-kernel-injector.c b/sound/soc/sof/sof-client-ipc-kernel-injector.c
index ad0ed2d570a9..6973b6690df4 100644
--- a/sound/soc/sof/sof-client-ipc-kernel-injector.c
+++ b/sound/soc/sof/sof-client-ipc-kernel-injector.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Google Inc. All rights reserved.
+// Copyright(c) 2023 Google Inc
 //
 // Author: Curtis Malainey <cujomalainey@chromium.org>
 //
diff --git a/sound/soc/sof/sof-client-ipc-msg-injector.c b/sound/soc/sof/sof-client-ipc-msg-injector.c
index e249d3a9afb5..af22e6421029 100644
--- a/sound/soc/sof/sof-client-ipc-msg-injector.c
+++ b/sound/soc/sof/sof-client-ipc-msg-injector.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Author: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-client-probes-ipc3.c b/sound/soc/sof/sof-client-probes-ipc3.c
index 5e8eb19582a8..816df745c9af 100644
--- a/sound/soc/sof/sof-client-probes-ipc3.c
+++ b/sound/soc/sof/sof-client-probes-ipc3.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2019-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2019-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/sof/sof-client-probes-ipc4.c b/sound/soc/sof/sof-client-probes-ipc4.c
index c56a85854d92..796eac0a2e74 100644
--- a/sound/soc/sof/sof-client-probes-ipc4.c
+++ b/sound/soc/sof/sof-client-probes-ipc4.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2019-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2019-2022 Intel Corporation
 //
 // Author: Jyri Sarha <jyri.sarha@intel.com>
 //
diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index 30f771ac7bbf..b8f297307565 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2019-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2019-2022 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 54dca91255a0..99f74def4ab6 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 //
 // Authors: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //	    Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index aab5c900cecf..4365405783e6 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-pci-dev.h b/sound/soc/sof/sof-pci-dev.h
index 81155a59e63a..c90e6276c83b 100644
--- a/sound/soc/sof/sof-pci-dev.h
+++ b/sound/soc/sof/sof-pci-dev.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2021 Intel Corporation. All rights reserved.
+ * Copyright(c) 2021 Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SOF_PCI_H
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index d3c436f82604..4d6a1517f9b3 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2018 Intel Corporation. All rights reserved.
+ * Copyright(c) 2018 Intel Corporation
  *
  * Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
  */
diff --git a/sound/soc/sof/sof-utils.c b/sound/soc/sof/sof-utils.c
index b6345a7345af..cad041bf56cc 100644
--- a/sound/soc/sof/sof-utils.c
+++ b/sound/soc/sof/sof-utils.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018-2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2018-2022 Intel Corporation
 //
 // Author: Keyon Jie <yang.jie@linux.intel.com>
 //
diff --git a/sound/soc/sof/sof-utils.h b/sound/soc/sof/sof-utils.h
index 6f902893807e..9ac6de9a6d6a 100644
--- a/sound/soc/sof/sof-utils.h
+++ b/sound/soc/sof/sof-utils.h
@@ -3,7 +3,7 @@
  * This file is provided under a dual BSD/GPLv2 license.  When using or
  * redistributing this file, you may do so under either license.
  *
- * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ * Copyright(c) 2022 Intel Corporation
  */
 
 #ifndef __SOC_SOF_UTILS_H
diff --git a/sound/soc/sof/stream-ipc.c b/sound/soc/sof/stream-ipc.c
index 216b454f6b94..eb71303aa24c 100644
--- a/sound/soc/sof/stream-ipc.c
+++ b/sound/soc/sof/stream-ipc.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2019 Intel Corporation. All rights reserved.
+// Copyright(c) 2019 Intel Corporation
 //
 // Authors: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
 
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index ec931a26b54f..da182314aa87 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
 //
diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index b2ab51e5214a..fe6c67c01b0d 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 #include "sof-priv.h"
 
diff --git a/sound/soc/sof/xtensa/core.c b/sound/soc/sof/xtensa/core.c
index 7c91a919eadc..ccbc3fcdadd5 100644
--- a/sound/soc/sof/xtensa/core.c
+++ b/sound/soc/sof/xtensa/core.c
@@ -3,7 +3,7 @@
 // This file is provided under a dual BSD/GPLv2 license.  When using or
 // redistributing this file, you may do so under either license.
 //
-// Copyright(c) 2018 Intel Corporation. All rights reserved.
+// Copyright(c) 2018 Intel Corporation
 //
 // Author: Pan Xiuli <xiuli.pan@linux.intel.com>
 //
-- 
2.40.1

