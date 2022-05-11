Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBAA9523B51
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 19:18:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E1F01A7C;
	Wed, 11 May 2022 19:17:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E1F01A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652289487;
	bh=tFOfQBiwWotYDEdRJ+yoDIS2SyWm6bXCqZFd5Fii63I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lIcLqg2If+7hNlkJf+F+D2Al+cbqakTcMSpI7VZQwqQuSHkpbj1Z2BVn5X6UlFzVW
	 /+BM7a7tQucxezK7NVyq1+U3SQS2fyggr2VxKYlqS+JkEHpqLeqphrZiirkprB7JtP
	 TwRXa3eHoKU7msSjsMJscpF8WMtO1ULXaYUVwFEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8867F804CA;
	Wed, 11 May 2022 19:17:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A836CF80116; Wed, 11 May 2022 19:17:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 98556F80116
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 19:16:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 98556F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZTaBwb5I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652289421; x=1683825421;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tFOfQBiwWotYDEdRJ+yoDIS2SyWm6bXCqZFd5Fii63I=;
 b=ZTaBwb5I2vJvPgBUwVlgdO3Q70YfX7A3003FyWmClCnqCUDUjHQF4ors
 hteUqmLqO2P4xq/Sotp5Oaam8yRY2rQBwSCgEdTqlZxwXCx+UiQp2HI+M
 4bXU45mde8IFMqOiDuNgPUg0I7IEV8513ff03HMVQnu2xB0xcKULOM6W+
 Xm6OC4UVgUYRi4yjtO2WyJxaPTLNTZliqaJvSqlb7GcmmPm35AIt+tjhw
 GU+pwk96e8ypQp9S0f7NqEKHy8wq6Zsc9/vclqbFbG38kEtAepiKx+ka7
 I7W9rXqpqDtCC6GcMvVLZJTuTs1KiwK95m/xhrzkUmGZmH/txWVWbf/42 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="269431628"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="269431628"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697663173"
Received: from sjbrune-mobl.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.32.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 10:16:54 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/5] ASoC: SOF: Add IPC4 private header
Date: Wed, 11 May 2022 10:16:45 -0700
Message-Id: <20220511171648.1622993-3-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
References: <20220511171648.1622993-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.com, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
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

Add a struct sof_ipc4_fw_data to hold the firmware module data and
manifest FW header offset.
The FW reports data about the modules supported by the base FW in its
manifest and the FW header offset is platform dependent information.

This structure will be allocated when the ops are initialized for each
platform and populated when the FW is loaded.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 sound/soc/sof/ipc4-priv.h

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
new file mode 100644
index 000000000000..3a1b97e93a7d
--- /dev/null
+++ b/sound/soc/sof/ipc4-priv.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2022 Intel Corporation. All rights reserved.
+ */
+
+#ifndef __SOUND_SOC_SOF_IPC4_PRIV_H
+#define __SOUND_SOC_SOF_IPC4_PRIV_H
+
+#include <linux/idr.h>
+#include "sof-priv.h"
+
+/**
+ * struct sof_ipc4_fw_data - IPC4-specific data
+ * @manifest_fw_hdr_offset: FW header offset in the manifest
+ * @num_fw_modules : Number of modules in base FW
+ * @fw_modules: Array of base FW modules
+ */
+struct sof_ipc4_fw_data {
+	u32 manifest_fw_hdr_offset;
+	int num_fw_modules;
+	void *fw_modules;
+};
+
+#endif
-- 
2.25.1

