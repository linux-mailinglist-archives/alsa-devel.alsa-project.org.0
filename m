Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BDA08BAE6B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:05:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43ED4A4B;
	Fri,  3 May 2024 16:05:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43ED4A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745112;
	bh=0H2zSOR0rKxo2NoMTNKq1Y9+E//VFKuom/IJErWjXFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E8UlCtjmz7wfT+XDy8T/TZ4jPRyoFsgRQZz8uG4C877jPMBrHk/ARnIQ8A3RgQYo9
	 SrOsCrw1bJOvS48KRtQcaXHrc35VPb32P++STM+O87TkyB2b0nHBWV6U7OATtHDgeQ
	 /nNXK5xiVG8il2N8ZbKI/XDzdYj6hRILeLV4ibZU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3910AF805BD; Fri,  3 May 2024 16:04:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4A11F805AD;
	Fri,  3 May 2024 16:04:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79D6FF80578; Fri,  3 May 2024 16:04:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D4CBCF800E2
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4CBCF800E2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=k3Sh0KL/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745068; x=1746281068;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0H2zSOR0rKxo2NoMTNKq1Y9+E//VFKuom/IJErWjXFs=;
  b=k3Sh0KL/r0ta5yyHKEVl5nvWr289rqF2jqwcosoHnKpnOXvi4yFrA6HE
   OeEFpClQxW9qkVb8+YNYlbZLNwEcHVGYhxtAdy6gR/GacEsOE9mx3ypV+
   VLIk8bi4YzHtyRGTBP95pJP1A9UUcyfT6VnzjxoOJPLpg8hYP+rzYgmxt
   6jnBJLMeXGAfTlAdzi6cvE3fcQXwF/edoHRsqOHE5Ovrt+nw0BL7EbKiV
   hjKzwS7EA5AhmeNwS8kwxkY8GUP+b1T0VFtKWk588sAq/T1YAB//ELMBc
   YwES2nqNojs3CIYRJ4KgRHRdzVLf07+592BUVfFOCONv3GFPZ1zRV7Cce
   w==;
X-CSE-ConnectionGUID: IKKvxzhWQb2YYyd/6BOXtA==
X-CSE-MsgGUID: /Ftgh09vS3q7GyT4A0KRKg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369513"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369513"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:19 -0700
X-CSE-ConnectionGUID: a64iTUUaQn+Rxc5lwbv9CQ==
X-CSE-MsgGUID: HiayOhVySIO++8f0Lraviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908076"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:19 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 2/9] ASoC: Intel: boards: clarify Copyright information
Date: Fri,  3 May 2024 09:03:52 -0500
Message-Id: <20240503140359.259762-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6KP5XLU73KVTJ2UPN5BSNC3FVQAZ5KN6
X-Message-ID-Hash: 6KP5XLU73KVTJ2UPN5BSNC3FVQAZ5KN6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6KP5XLU73KVTJ2UPN5BSNC3FVQAZ5KN6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

For some reason a number of files included the "All rights reserved"
statement. Good old copy-paste made sure this mistake proliferated.

Remove the "All rights reserved" in all Intel-copyright to align with
internal guidance.

Acked-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c                  | 2 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c       | 2 +-
 sound/soc/intel/boards/bxt_rt298.c                  | 2 +-
 sound/soc/intel/boards/hda_dsp_common.c             | 2 +-
 sound/soc/intel/boards/hsw_rt5640.c                 | 2 +-
 sound/soc/intel/boards/kbl_rt5663_max98927.c        | 2 +-
 sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c | 2 +-
 sound/soc/intel/boards/skl_nau88l25_max98357a.c     | 2 +-
 sound/soc/intel/boards/skl_nau88l25_ssm4567.c       | 4 ++--
 sound/soc/intel/boards/skl_rt286.c                  | 4 ++--
 sound/soc/intel/boards/sof_board_helpers.c          | 2 +-
 sound/soc/intel/boards/sof_maxim_common.c           | 2 +-
 sound/soc/intel/boards/sof_realtek_common.c         | 2 +-
 sound/soc/intel/boards/sof_ssp_amp.c                | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c  | 2 +-
 15 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 7f20159c23e5..58db09d9b6e1 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -2,7 +2,7 @@
 /*
  * Sound card driver for Intel Broadwell Wildcat Point with Realtek 286
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 57e75f87bea6..e1082bfe5ca9 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -2,7 +2,7 @@
 /*
  * Intel Broxton-P I2S Machine Driver
  *
- * Copyright (C) 2016, Intel Corporation. All rights reserved.
+ * Copyright (C) 2016, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/bxt_rt298.c b/sound/soc/intel/boards/bxt_rt298.c
index afc499be8db2..dce6a2086f2a 100644
--- a/sound/soc/intel/boards/bxt_rt298.c
+++ b/sound/soc/intel/boards/bxt_rt298.c
@@ -2,7 +2,7 @@
 /*
  * Intel Broxton-P I2S Machine Driver
  *
- * Copyright (C) 2014-2016, Intel Corporation. All rights reserved.
+ * Copyright (C) 2014-2016, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
index 04b7d4f7f9e2..fda5a92b0006 100644
--- a/sound/soc/intel/boards/hda_dsp_common.c
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2019 Intel Corporation. All rights reserved.
+// Copyright(c) 2019 Intel Corporation
 
 #include <linux/module.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/intel/boards/hsw_rt5640.c b/sound/soc/intel/boards/hsw_rt5640.c
index 2a2fe27dff0e..1826a4dfd0f3 100644
--- a/sound/soc/intel/boards/hsw_rt5640.c
+++ b/sound/soc/intel/boards/hsw_rt5640.c
@@ -2,7 +2,7 @@
 /*
  * Sound card driver for Intel Haswell Lynx Point with Realtek 5640
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/kbl_rt5663_max98927.c b/sound/soc/intel/boards/kbl_rt5663_max98927.c
index 646e8ff8e961..e16c42e81eca 100644
--- a/sound/soc/intel/boards/kbl_rt5663_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_max98927.c
@@ -3,7 +3,7 @@
  * Intel Kabylake I2S Machine Driver with MAXIM98927
  * and RT5663 Codecs
  *
- * Copyright (C) 2017, Intel Corporation. All rights reserved.
+ * Copyright (C) 2017, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine driver
diff --git a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
index 924d5d1de03a..a9501cd106ff 100644
--- a/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
+++ b/sound/soc/intel/boards/kbl_rt5663_rt5514_max98927.c
@@ -3,7 +3,7 @@
  * Intel Kabylake I2S Machine Driver with MAXIM98927
  * RT5514 and RT5663 Codecs
  *
- * Copyright (C) 2017, Intel Corporation. All rights reserved.
+ * Copyright (C) 2017, Intel Corporation
  *
  * Modified from:
  *   Intel Kabylake I2S Machine driver supporting MAXIM98927 and
diff --git a/sound/soc/intel/boards/skl_nau88l25_max98357a.c b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
index e4630c33176e..91fe9834aab4 100644
--- a/sound/soc/intel/boards/skl_nau88l25_max98357a.c
+++ b/sound/soc/intel/boards/skl_nau88l25_max98357a.c
@@ -3,7 +3,7 @@
  * Intel Skylake I2S Machine Driver with MAXIM98357A
  * and NAU88L25
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
index fadc25a536b4..d53bf3516c0d 100644
--- a/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
+++ b/sound/soc/intel/boards/skl_nau88l25_ssm4567.c
@@ -2,12 +2,12 @@
 /*
  * Intel Skylake I2S Machine Driver for NAU88L25+SSM4567
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  *
  * Modified from:
  *   Intel Skylake I2S Machine Driver for NAU88L25 and SSM4567
  *
- *   Copyright (C) 2015, Intel Corporation. All rights reserved.
+ *   Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/skl_rt286.c b/sound/soc/intel/boards/skl_rt286.c
index 9a8044274908..3ea03f814403 100644
--- a/sound/soc/intel/boards/skl_rt286.c
+++ b/sound/soc/intel/boards/skl_rt286.c
@@ -2,12 +2,12 @@
 /*
  * Intel Skylake I2S Machine Driver
  *
- * Copyright (C) 2014-2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2014-2015, Intel Corporation
  *
  * Modified from:
  *   Intel Broadwell Wildcatpoint SST Audio
  *
- *   Copyright (C) 2013, Intel Corporation. All rights reserved.
+ *   Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/module.h>
diff --git a/sound/soc/intel/boards/sof_board_helpers.c b/sound/soc/intel/boards/sof_board_helpers.c
index eb140e13153f..7519c545cbe2 100644
--- a/sound/soc/intel/boards/sof_board_helpers.c
+++ b/sound/soc/intel/boards/sof_board_helpers.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 #include <sound/soc.h>
 #include "../common/soc-intel-quirks.h"
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index bb12aab15ad5..7e1f485dce7a 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 #include <linux/module.h>
 #include <linux/string.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
index 1476daa96a95..dda346e0f737 100644
--- a/sound/soc/intel/boards/sof_realtek_common.c
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 
 #include <linux/device.h>
 #include <linux/kernel.h>
diff --git a/sound/soc/intel/boards/sof_ssp_amp.c b/sound/soc/intel/boards/sof_ssp_amp.c
index 206c9b723805..f51f1008e016 100644
--- a/sound/soc/intel/boards/sof_ssp_amp.c
+++ b/sound/soc/intel/boards/sof_ssp_amp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2022 Intel Corporation. All rights reserved.
+// Copyright(c) 2022 Intel Corporation
 
 /*
  * sof_ssp_amp.c - ASoc Machine driver for Intel platforms
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index a887f019afe2..75d0b931d895 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2023 Intel Corporation. All rights reserved.
+// Copyright(c) 2023 Intel Corporation
 
 #include <linux/device.h>
 #include <sound/soc-acpi.h>
-- 
2.40.1

