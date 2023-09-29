Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDCD7B3155
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Sep 2023 13:26:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D47DCDF0;
	Fri, 29 Sep 2023 13:25:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D47DCDF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695986804;
	bh=X3mZH5mj+m+yAXocSk20zTN+YXsT00bGyvoyMS4JOgU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ozlG7Hsree2kRzu3qSoRs72eHymu23TFoDE3/GVmX7KTelXN9ihrOXSGzTYyA9G1Z
	 yH7JShIRxraSZY2snauDBbFfPNXXaznH6YD+LQxBg87GYbtWTFea2I9Cllo8qhnfU5
	 S9BlolQ2NfHQOqILrhHpaHFmpY84PqGOcQ1daexc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9273F8057C; Fri, 29 Sep 2023 13:25:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CE2AF8016A;
	Fri, 29 Sep 2023 13:25:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64BC0F8047D; Fri, 29 Sep 2023 13:24:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2FF52F8007C
	for <alsa-devel@alsa-project.org>; Fri, 29 Sep 2023 13:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FF52F8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=euAkse7I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695986679; x=1727522679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=X3mZH5mj+m+yAXocSk20zTN+YXsT00bGyvoyMS4JOgU=;
  b=euAkse7I3CU7+JDkpJ7XVfj0u1IylMOVrNSDdq3sNcbXzDDWcbFC288i
   SpMBY22ptMG0mxxu60jVmtc0EliNfPodimD6Rhpspz4eFw8rZEqKWDM5/
   luj3R07e7iQT+K5S8+RmG4MTsrly2gs5ipDtWbDbZeHfv64faMO8KsEO2
   uKay+itl1cdGu99lAkoGbY38r6pZn1UzdK6FeHpgQMES6xGPj4gKXtQ47
   5xSfaBJLrHBBonRdXZtHseV1MUCrhNhnYhE8cgxHcCZYODadSf5Gvs7xY
   iC7q+E+opg4B3DYRl6HgsMyfYkfMP1XSPzumzyYS7/mqytOshcHVxsLvA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="880244"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="880244"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2023 04:24:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10847"; a="753353669"
X-IronPort-AV: E=Sophos;i="6.03,187,1694761200";
   d="scan'208";a="753353669"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga007.fm.intel.com with ESMTP; 29 Sep 2023 04:24:30 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/6] ASoC: Intel: avs: Use generic size defines
Date: Fri, 29 Sep 2023 13:24:32 +0200
Message-Id: <20230929112436.787058-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
References: <20230929112436.787058-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RTRZ34BDWZKEEVNR4524MYQGWPAK4MCR
X-Message-ID-Hash: RTRZ34BDWZKEEVNR4524MYQGWPAK4MCR
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RTRZ34BDWZKEEVNR4524MYQGWPAK4MCR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using PAGE_SIZE as base of definitions in headers, use
generic size defines. While x86 platforms use 4096 as page size, there
are platforms which use different page sizes. Two of changed defines are
for memory windows on DSP side, which have fixed size independent of
host side page size. Another one is for CLDMA buffer which also doesn't
need to change with page size.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/cldma.h     | 4 +++-
 sound/soc/intel/avs/messages.h  | 4 +++-
 sound/soc/intel/avs/registers.h | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/avs/cldma.h b/sound/soc/intel/avs/cldma.h
index 754fcf9ee585..223d3431ab81 100644
--- a/sound/soc/intel/avs/cldma.h
+++ b/sound/soc/intel/avs/cldma.h
@@ -8,7 +8,9 @@
 #ifndef __SOUND_SOC_INTEL_AVS_CLDMA_H
 #define __SOUND_SOC_INTEL_AVS_CLDMA_H
 
-#define AVS_CL_DEFAULT_BUFFER_SIZE	(32 * PAGE_SIZE)
+#include <linux/sizes.h>
+
+#define AVS_CL_DEFAULT_BUFFER_SIZE	SZ_128K
 
 struct hda_cldma;
 extern struct hda_cldma code_loader;
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 7f23a304b4a9..d0344e242e5b 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -9,9 +9,11 @@
 #ifndef __SOUND_SOC_INTEL_AVS_MSGS_H
 #define __SOUND_SOC_INTEL_AVS_MSGS_H
 
+#include <linux/sizes.h>
+
 struct avs_dev;
 
-#define AVS_MAILBOX_SIZE 4096
+#define AVS_MAILBOX_SIZE SZ_4K
 
 enum avs_msg_target {
 	AVS_FW_GEN_MSG = 0,
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 2b464e466ed5..078a0ebafa42 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -9,6 +9,8 @@
 #ifndef __SOUND_SOC_INTEL_AVS_REGS_H
 #define __SOUND_SOC_INTEL_AVS_REGS_H
 
+#include <linux/sizes.h>
+
 #define AZX_PCIREG_PGCTL		0x44
 #define AZX_PCIREG_CGCTL		0x48
 #define AZX_PGCTL_LSRMD_MASK		BIT(4)
@@ -59,7 +61,7 @@
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
 #define AVS_FW_REG_ERROR_CODE(adev)	(AVS_FW_REG_BASE(adev) + 0x4)
 
-#define AVS_WINDOW_CHUNK_SIZE		PAGE_SIZE
+#define AVS_WINDOW_CHUNK_SIZE		SZ_4K
 #define AVS_FW_REGS_SIZE		AVS_WINDOW_CHUNK_SIZE
 #define AVS_FW_REGS_WINDOW		0
 /* DSP -> HOST communication window */
-- 
2.34.1

