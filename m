Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3AE70258F
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:58:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D8EE8DED;
	Mon, 15 May 2023 08:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D8EE8DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684133895;
	bh=8qoVMqaRyRfqkzBoyYI1vRz26d5h32BGobLS43A08RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vEc/QbIdWj86JZb2/cWRndmgfWnynXRwFVS2KxQDAYK8B3FGQZOXz3fpf/x9cybNA
	 ar3H/eM3NmBwCH+/cqFQpbvm/4e/ZqqfPb6g0xN4Y2kccXCtY+rbNehWPcdplfRoVf
	 fL4q8NYV7xXa5ve6g/hh7ADGPcUt+ahUTanW/45I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58895F80567; Mon, 15 May 2023 08:52:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC779F8025A;
	Mon, 15 May 2023 08:52:08 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 258F5F8055A; Mon, 15 May 2023 08:52:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A4EBF802E8
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:50:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A4EBF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=P7/SATY2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684133432; x=1715669432;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8qoVMqaRyRfqkzBoyYI1vRz26d5h32BGobLS43A08RI=;
  b=P7/SATY2iWA4aJByxxKXC1DNtuMd7RXBMs/0aWlznFtlDFUPCW1aFWIW
   D2zm0uBg+0szkqih4B1yOicm90uuIvOkGVEbVN5ZrVVkI4+3fE0wTlcFF
   ZfKQic/fRLzKVewx6Oan8gMSUvH+iAyHUOitvnt1KYt5Wvz7PuwEcx8uS
   tQJwW3tbWDXWZbENYsBJ1QC893kOYr+oH+bfQnIxirFHcQ3cBxua3lMYs
   SnhEc+WTMQuVUC13dVAcurGkkjMui7SgY9EvTu/CxMD8Z0omsROp+LeM+
   C3Tmh8Q4BCpHJzhQHqAgF0cUSL/r+O0RVbUGewxEc9F56o4jYdZ+v3gJe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="349966290"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="349966290"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10710"; a="694908603"
X-IronPort-AV: E=Sophos;i="5.99,275,1677571200";
   d="scan'208";a="694908603"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2023 23:50:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org,
	broonie@kernel.org,
	tiwai@suse.de
Cc: linux-kernel@vger.kernel.org,
	vinod.koul@linaro.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com
Subject: [PATCH v2 03/26] soundwire: intel_ace2x: add empty new ops for
 LunarLake
Date: Mon, 15 May 2023 15:10:19 +0800
Message-Id: <20230515071042.2038-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
References: <20230515071042.2038-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WOWON2L6JPNDQ76TJE3NU5JTN3XB6WZD
X-Message-ID-Hash: WOWON2L6JPNDQ76TJE3NU5JTN3XB6WZD
X-MailFrom: yung-chuan.liao@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WOWON2L6JPNDQ76TJE3NU5JTN3XB6WZD/>
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
index 925566ff4272..5d612c9b6362 100644
--- a/drivers/soundwire/Makefile
+++ b/drivers/soundwire/Makefile
@@ -24,7 +24,7 @@ soundwire-cadence-y := cadence_master.o
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

