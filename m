Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F40C8BAE6F
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:05:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC0E9E80;
	Fri,  3 May 2024 16:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC0E9E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745144;
	bh=SyV9cOmA95Y8igvfR9thOhSeKWSs9M9BdgxVcIJETLQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z5nmwzhKp/ATASf4lJIuTxL9mmkPXhXNW5mCUFoqPz99q2KkgEhGEfp0q/Zc/xnit
	 EgRkgM1Ybx2rWIuH4fEJvT5Oq1e39mjEkSd3S5yWZg2oVulw+juw95hthIoSQu5y1F
	 AdwZTn2jcm6MlL60DdOaW08T3STobt1GNSaMq3dk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7CE5AF805FA; Fri,  3 May 2024 16:04:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 71AEDF805FC;
	Fri,  3 May 2024 16:04:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07FD4F80571; Fri,  3 May 2024 16:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EC385F804F2
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC385F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=md7QLnPo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745072; x=1746281072;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SyV9cOmA95Y8igvfR9thOhSeKWSs9M9BdgxVcIJETLQ=;
  b=md7QLnPo8cJpthWf9+6o75IlxMdOmOA7fhq8QQ9DfGwA0pZ5wr+y5Oul
   n0m/WwtsZItfglCInB4xUixMgpnYl+4+5TtnxGKUBnf2TYX2K7G1Whcwx
   4woQTaUEqFhMYBh/ST+vwnLaW9OX+RYOPw9xvMvvaiBnXOH9PaHz1zuUY
   WKur6z+cFTu1fqefnJkTNHhocWPaKG405JJSDJdL79Ttqncs8PvZXhXZc
   Ubz49RvDxmBsqHaUV5ll/Fjf9znRj1wp+TIq/fGzh2byTpIFUtImbMDsT
   qp/mR5DOXXFwk5yqLULexFv99Md/Eg5gxykRyxW2V0hYBTQncAeGEomzY
   A==;
X-CSE-ConnectionGUID: fswbwBTrQbW746pjNsS8iA==
X-CSE-MsgGUID: 04z6clyVTi++2iHUJ0bPew==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369526"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369526"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:21 -0700
X-CSE-ConnectionGUID: WNd/wI4sRte4EsfoCi4ojQ==
X-CSE-MsgGUID: O7BK7VsQQmmpwFoJjiAgwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908105"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:21 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 5/9] ASoC: Intel: catpt: clarify Copyright information
Date: Fri,  3 May 2024 09:03:55 -0500
Message-Id: <20240503140359.259762-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BVXH3GONSXOWHGOHAQVM4SMA2BGZ4ZLE
X-Message-ID-Hash: BVXH3GONSXOWHGOHAQVM4SMA2BGZ4ZLE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BVXH3GONSXOWHGOHAQVM4SMA2BGZ4ZLE/>
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
 sound/soc/intel/catpt/core.h      | 2 +-
 sound/soc/intel/catpt/device.c    | 2 +-
 sound/soc/intel/catpt/dsp.c       | 2 +-
 sound/soc/intel/catpt/ipc.c       | 2 +-
 sound/soc/intel/catpt/loader.c    | 2 +-
 sound/soc/intel/catpt/messages.c  | 2 +-
 sound/soc/intel/catpt/messages.h  | 2 +-
 sound/soc/intel/catpt/pcm.c       | 2 +-
 sound/soc/intel/catpt/registers.h | 2 +-
 sound/soc/intel/catpt/sysfs.c     | 2 +-
 sound/soc/intel/catpt/trace.h     | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index a64a0a77dcb7..c01d27e9fd88 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index cac3dffbd0d9..2e1fa79a04d4 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/dsp.c b/sound/soc/intel/catpt/dsp.c
index 5454c6d9ab5b..5993819cc58a 100644
--- a/sound/soc/intel/catpt/dsp.c
+++ b/sound/soc/intel/catpt/dsp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/ipc.c b/sound/soc/intel/catpt/ipc.c
index 5b718a846fda..d26863249097 100644
--- a/sound/soc/intel/catpt/ipc.c
+++ b/sound/soc/intel/catpt/ipc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index ff7b8f0d34ac..696d84314eeb 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/messages.c b/sound/soc/intel/catpt/messages.c
index a793d114afa4..30eec2de4dc1 100644
--- a/sound/soc/intel/catpt/messages.c
+++ b/sound/soc/intel/catpt/messages.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/messages.h b/sound/soc/intel/catpt/messages.h
index c17e948d9f52..a634943eb669 100644
--- a/sound/soc/intel/catpt/messages.h
+++ b/sound/soc/intel/catpt/messages.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 3daf5eb37f7b..81a2f0339e05 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/registers.h b/sound/soc/intel/catpt/registers.h
index 47280d82842e..6c1ad28c6d69 100644
--- a/sound/soc/intel/catpt/registers.h
+++ b/sound/soc/intel/catpt/registers.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
diff --git a/sound/soc/intel/catpt/sysfs.c b/sound/soc/intel/catpt/sysfs.c
index 9b6d2d93a2e7..936ac9d503ff 100644
--- a/sound/soc/intel/catpt/sysfs.c
+++ b/sound/soc/intel/catpt/sysfs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 //
-// Copyright(c) 2020 Intel Corporation. All rights reserved.
+// Copyright(c) 2020 Intel Corporation
 //
 // Author: Cezary Rojewski <cezary.rojewski@intel.com>
 //
diff --git a/sound/soc/intel/catpt/trace.h b/sound/soc/intel/catpt/trace.h
index bb3d627dbeaf..010f57b6a7a8 100644
--- a/sound/soc/intel/catpt/trace.h
+++ b/sound/soc/intel/catpt/trace.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright(c) 2020 Intel Corporation. All rights reserved.
+ * Copyright(c) 2020 Intel Corporation
  *
  * Author: Cezary Rojewski <cezary.rojewski@intel.com>
  */
-- 
2.40.1

