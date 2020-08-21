Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A94E24E1CE
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:05:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFC0C1612;
	Fri, 21 Aug 2020 22:04:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFC0C1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040330;
	bh=PAa2Q18rWMKy9TdxwbI9gD9v9cQ/ooBYLbBXnwX9QkY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nVetLxUoZOSe2lPTWXQi3s8LhJHGxcVvLZDyvK2qjRWwl0llernTXfyz4jlp4L9+k
	 0oi7AfcU3OUmRukshDFY0onTsOdNvsblsucVveDfSYBqW77MKzG7E46hr0dU9xSnao
	 A5N2hDhQvxt6LkSfA7ceUFtA/IKJeHWPPjAoJmsA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA6B4F80343;
	Fri, 21 Aug 2020 21:56:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC257F802FB; Fri, 21 Aug 2020 21:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6349BF802E1
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6349BF802E1
IronPort-SDR: 2Jthj5XZ6nu2Tlf5HZE9QgkA0b1p+8rbNnSwiNRjuXspyTOiJ4ynjuVZfDhHWuBb+xncNNjfa8
 9wBo3ba+oN+A==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158579"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158579"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:26 -0700
IronPort-SDR: cMu09dpQNgQ2QPz6eRwedPeQRmZY7xvpwsms4iYMRvVuZMRyS4rIFsHhRmUcIdYL0uAMMM/+tW
 /md2pOlQcT4Q==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002454"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/14] ASoC: Intel: sof_sdw: clean-up inclusion of header files
Date: Fri, 21 Aug 2020 14:56:03 -0500
Message-Id: <20200821195603.215535-17-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

"struct snd_soc_dapm_widget" and "struct snd_kcontrol_new" are used in most
of these .c files. Adding the header files to prevent from depending on
<sound/soc.h>

Reported-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw_dmic.c     | 1 +
 sound/soc/intel/boards/sof_sdw_max98373.c | 2 ++
 sound/soc/intel/boards/sof_sdw_rt1308.c   | 2 ++
 sound/soc/intel/boards/sof_sdw_rt5682.c   | 2 ++
 sound/soc/intel/boards/sof_sdw_rt700.c    | 2 ++
 sound/soc/intel/boards/sof_sdw_rt711.c    | 2 ++
 6 files changed, 11 insertions(+)

diff --git a/sound/soc/intel/boards/sof_sdw_dmic.c b/sound/soc/intel/boards/sof_sdw_dmic.c
index 89b0824b2381..19df0f7a1d85 100644
--- a/sound/soc/intel/boards/sof_sdw_dmic.c
+++ b/sound/soc/intel/boards/sof_sdw_dmic.c
@@ -7,6 +7,7 @@
 
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 
 static const struct snd_soc_dapm_widget dmic_widgets[] = {
diff --git a/sound/soc/intel/boards/sof_sdw_max98373.c b/sound/soc/intel/boards/sof_sdw_max98373.c
index 6437872a9b3d..905582aaf58c 100644
--- a/sound/soc/intel/boards/sof_sdw_max98373.c
+++ b/sound/soc/intel/boards/sof_sdw_max98373.c
@@ -6,8 +6,10 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 #include "sof_maxim_common.h"
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt1308.c b/sound/soc/intel/boards/sof_sdw_rt1308.c
index 3655e890acec..dba2fd28d77f 100644
--- a/sound/soc/intel/boards/sof_sdw_rt1308.c
+++ b/sound/soc/intel/boards/sof_sdw_rt1308.c
@@ -7,8 +7,10 @@
 
 #include <linux/device.h>
 #include <linux/errno.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include "sof_sdw_common.h"
 #include "../../codecs/rt1308.h"
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
index da354ba83939..5fa1a59615b6 100644
--- a/sound/soc/intel/boards/sof_sdw_rt5682.c
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -10,8 +10,10 @@
 #include <linux/input.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt700.c b/sound/soc/intel/boards/sof_sdw_rt700.c
index 5f50491ba5ee..bff69cfe27f4 100644
--- a/sound/soc/intel/boards/sof_sdw_rt700.c
+++ b/sound/soc/intel/boards/sof_sdw_rt700.c
@@ -8,8 +8,10 @@
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/input.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
diff --git a/sound/soc/intel/boards/sof_sdw_rt711.c b/sound/soc/intel/boards/sof_sdw_rt711.c
index 606009fa3901..04074c09dded 100644
--- a/sound/soc/intel/boards/sof_sdw_rt711.c
+++ b/sound/soc/intel/boards/sof_sdw_rt711.c
@@ -10,8 +10,10 @@
 #include <linux/input.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
 #include <sound/soc.h>
 #include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
 #include <sound/jack.h>
 #include "sof_sdw_common.h"
 
-- 
2.25.1

