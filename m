Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E06C5EF7
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Mar 2023 06:34:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 521CAECB;
	Thu, 23 Mar 2023 06:33:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 521CAECB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679549667;
	bh=QfbLjJIQPJg7lVSuxR7cbrpfZiSh+vhV76tbkAhqcic=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwMHanpZZfBCsCPEalcgx94++cJj/ePmLMKoWSNy+3rxvBgMAf3fLKOuaXf5RU4n8
	 qxsIGv6rR+DHy83UMX6AFKXAmeth/0u/WceYG3XnPLtDThjdTXiQjatfSSCZB4wadz
	 Q2FUwWQwwlBHB/j7NE85YXXTeoTwgKt7VjhVfK44=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14825F804FE;
	Thu, 23 Mar 2023 06:32:49 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B32C0F80548; Thu, 23 Mar 2023 06:30:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DEA04F8027B
	for <alsa-devel@alsa-project.org>; Thu, 23 Mar 2023 06:30:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA04F8027B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FY7uSsSO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679549420; x=1711085420;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QfbLjJIQPJg7lVSuxR7cbrpfZiSh+vhV76tbkAhqcic=;
  b=FY7uSsSOxnt0XwMr7gM2W4NiwgPmr1x2h71oCUdnub/Vn5Wn+bgt93La
   e9ducIgJPSOO85CEzd/5jvwBked83n+YL/0hJgLEMFUsf/YKTwzR0qloz
   KD7hW8KFg51EHJd8LTn6kwCAz9JU3OkRUd1mxSHC9FDs93fPOz544ynbX
   FDYHQnKcAqYN9CPhZCeqpyEmsBKVMye+DafSwbYeK4X4NlH5oZwTS1AwB
   SNeL56u7sfW6q8XZNm0xtZGw9TPTJU2XaezbPtTzBhrcepFVW4k0IeLpg
   snQAftN0tlCI1j1/0Mt7jxo6C36gSZjZ1FZrChlIa/CvrqVrTuRW+1AK9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="327779299"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="327779299"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="675566992"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400";
   d="scan'208";a="675566992"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2023 22:29:55 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org
Subject: [PATCH 03/20] soundwire: intel_ace2x: add empty new ops for LunarLake
Date: Thu, 23 Mar 2023 13:44:35 +0800
Message-Id: <20230323054452.1543233-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
References: <20230323054452.1543233-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VUCQURWP4DGESLO4F5EIEH2LHPKPCWKE
X-Message-ID-Hash: VUCQURWP4DGESLO4F5EIEH2LHPKPCWKE
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: vinod.koul@linaro.org, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com, tiwai@suse.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VUCQURWP4DGESLO4F5EIEH2LHPKPCWKE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The register map and programming sequences for the ACE2.x IP are
completely different and need to be abstracted with a different set of
callbacks.

This initial patch adds a new file, follow-up patches will add each
required callback.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/Makefile          |  2 +-
 drivers/soundwire/intel_ace2x.c     | 19 +++++++++++++++++++
 include/linux/soundwire/sdw_intel.h |  1 +
 3 files changed, 21 insertions(+), 1 deletion(-)
 create mode 100644 drivers/soundwire/intel_ace2x.c

diff --git a/drivers/soundwire/Makefile b/drivers/soundwire/Makefile
index 8038e840ac5b..d7212777a927 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -20,7 +20,7 @@ soundwire-cadence-y := cadence_master.o
 obj-$(CONFIG_SOUNDWIRE_CADENCE) += soundwire-cadence.o
 
 #Intel driver
-soundwire-intel-y :=	intel.o intel_auxdevice.o intel_init.o dmi-quirks.o \
+soundwire-intel-y :=	intel.o  intel_ace2x.o intel_auxdevice.o intel_init.o dmi-quirks.o \
 			intel_bus_common.o
 obj-$(CONFIG_SOUNDWIRE_INTEL) += soundwire-intel.o
 
diff --git a/drivers/soundwire/intel_ace2x.c b/drivers/soundwire/intel_ace2x.c
new file mode 100644
index 000000000000..623e4fd7db91
--- /dev/null
+++ b/drivers/soundwire/intel_ace2x.c
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+// Copyright(c) 2023 Intel Corporation. All rights reserved.
+
+/*
+ * Soundwire Intel ops for LunarLake
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/soundwire/sdw_registers.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_intel.h>
+#include "cadence_master.h"
+#include "bus.h"
+#include "intel.h"
+
+const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops = {
+};
+EXPORT_SYMBOL_NS(sdw_intel_lnl_hw_ops, SOUNDWIRE_INTEL);
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 8e6183e029fa..66687e83a94f 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -419,5 +419,6 @@ struct sdw_intel_hw_ops {
 };
 
 extern const struct sdw_intel_hw_ops sdw_intel_cnl_hw_ops;
+extern const struct sdw_intel_hw_ops sdw_intel_lnl_hw_ops;
 
 #endif
-- 
2.25.1

