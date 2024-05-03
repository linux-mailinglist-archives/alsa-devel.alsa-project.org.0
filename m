Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492B8BAE6E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 16:05:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 186DBE7D;
	Fri,  3 May 2024 16:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 186DBE7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714745134;
	bh=+HI8RYLmUHciNMVJCenuLW56C8Es8SqMQLQaU3IKZV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uK+md985IwD2PI/jgYYvkJU7rZHzEJEs3mexOFx2TkO5bY9RGR1d+F9NVjxj3L3xX
	 GYZIW1JEFxZ0qb1WwYMUNyzqBhzPq9mxTV/MA1nTPgtuz5fMrveMlx5FvGeClX3SbL
	 mJUs6VVubzpA47zIOzGO5ZQBQPxgLBVinsnFFzmA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D971CF805C5; Fri,  3 May 2024 16:04:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B06DBF805D6;
	Fri,  3 May 2024 16:04:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 204AAF80578; Fri,  3 May 2024 16:04:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C72CFF80266
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 16:04:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C72CFF80266
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AWjXjSvE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714745070; x=1746281070;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+HI8RYLmUHciNMVJCenuLW56C8Es8SqMQLQaU3IKZV0=;
  b=AWjXjSvECdobzotUBJbHW6FAQxnblu2OuBQ7C/Wh9tjGO6Pg2tbpcF8N
   BNyUtMzpq59pLWB2egr1YZrL1Q8kt2mQSAlHW3Ve9KIikKKQnKkfq2zN7
   AeK7S1WBHxTh09BdzXWyxHf1oxIElGaTCDwg0hSOND+7GtRW5pI3YLUch
   +mVPj+u6ejZim4cFE4q9rusk4UwMDqGTgGhtSbRYPOS+q85MPA5avXaQK
   6bAc/+zQHBDeHZFEDIIG0459168f73ejBnxhCVhHisHRidphROcXvXDgY
   KtbWIhqfIYnxFNYeTnW2wZzp9J9pglpp9mhkgpB5RpuajOWMFmTjCmmgJ
   A==;
X-CSE-ConnectionGUID: jAZ78IaOTn62DWr1Qb9YUA==
X-CSE-MsgGUID: 3mBUmZEfSHm43LRjIrt3xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="14369517"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="14369517"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:20 -0700
X-CSE-ConnectionGUID: WYfwx+c3Qe2vZBZiiU9tgQ==
X-CSE-MsgGUID: GIjuGTf6RC6qMqH9h44SXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="64908084"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 07:04:20 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 3/9] ASoC: Intel: common: clarify Copyright information
Date: Fri,  3 May 2024 09:03:53 -0500
Message-Id: <20240503140359.259762-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
References: <20240503140359.259762-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KZFRAK4UXK5JEPRK35OGTQI5VRFCZS3R
X-Message-ID-Hash: KZFRAK4UXK5JEPRK35OGTQI5VRFCZS3R
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZFRAK4UXK5JEPRK35OGTQI5VRFCZS3R/>
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
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c | 2 +-
 sound/soc/intel/common/sst-dsp-priv.h             | 2 +-
 sound/soc/intel/common/sst-dsp.c                  | 2 +-
 sound/soc/intel/common/sst-dsp.h                  | 2 +-
 sound/soc/intel/common/sst-ipc.c                  | 2 +-
 sound/soc/intel/common/sst-ipc.h                  | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 0318c1a46f3c..0c08859c4773 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -2,7 +2,7 @@
 /*
  * soc-acpi-intel-lnl-match.c - tables and support for LNL ACPI enumeration.
  *
- * Copyright (c) 2023, Intel Corporation. All rights reserved.
+ * Copyright (c) 2023, Intel Corporation
  *
  */
 
diff --git a/sound/soc/intel/common/sst-dsp-priv.h b/sound/soc/intel/common/sst-dsp-priv.h
index de2b44568feb..de32bb9afccb 100644
--- a/sound/soc/intel/common/sst-dsp-priv.h
+++ b/sound/soc/intel/common/sst-dsp-priv.h
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SST_DSP_PRIV_H
diff --git a/sound/soc/intel/common/sst-dsp.c b/sound/soc/intel/common/sst-dsp.c
index 229d09d61afb..cdd2f7cf50ae 100644
--- a/sound/soc/intel/common/sst-dsp.c
+++ b/sound/soc/intel/common/sst-dsp.c
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology (SST) DSP Core Driver
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #include <linux/slab.h>
diff --git a/sound/soc/intel/common/sst-dsp.h b/sound/soc/intel/common/sst-dsp.h
index f111fd3f334b..998b1a052281 100644
--- a/sound/soc/intel/common/sst-dsp.h
+++ b/sound/soc/intel/common/sst-dsp.h
@@ -2,7 +2,7 @@
 /*
  * Intel Smart Sound Technology (SST) Core
  *
- * Copyright (C) 2013, Intel Corporation. All rights reserved.
+ * Copyright (C) 2013, Intel Corporation
  */
 
 #ifndef __SOUND_SOC_SST_DSP_H
diff --git a/sound/soc/intel/common/sst-ipc.c b/sound/soc/intel/common/sst-ipc.c
index 89c10724d2a3..6b2c83f9f010 100644
--- a/sound/soc/intel/common/sst-ipc.c
+++ b/sound/soc/intel/common/sst-ipc.c
@@ -2,7 +2,7 @@
 /*
  * Intel SST generic IPC Support
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #include <linux/types.h>
diff --git a/sound/soc/intel/common/sst-ipc.h b/sound/soc/intel/common/sst-ipc.h
index 77d651e888f9..86d44ceadc92 100644
--- a/sound/soc/intel/common/sst-ipc.h
+++ b/sound/soc/intel/common/sst-ipc.h
@@ -2,7 +2,7 @@
 /*
  * Intel SST generic IPC Support
  *
- * Copyright (C) 2015, Intel Corporation. All rights reserved.
+ * Copyright (C) 2015, Intel Corporation
  */
 
 #ifndef __SST_GENERIC_IPC_H
-- 
2.40.1

