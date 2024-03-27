Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BACC288EB1E
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:25:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BCDA2BFD;
	Wed, 27 Mar 2024 17:25:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BCDA2BFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556731;
	bh=ixlpjYepMerL+sZkIlATdm9JZRvwdM7F4qct3s4El6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=i6WqkUq5JntpHgxcyxGHuyqdbTAyx8smqpRsXrEBTnZRmawf0xsEL/VQbAci5BuHj
	 6jOMR+HXoFIP4cR8Idy8b51F7LDzI9XvCdZ7DaITB8+wev701YtnnmMJIorpXSuMft
	 Jph9PKdMaSdrpcZZSpm4fa85yFEXeFdennLUbDT4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6CA10F802DB; Wed, 27 Mar 2024 17:24:45 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2214F805DF;
	Wed, 27 Mar 2024 17:24:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 216B0F8057B; Wed, 27 Mar 2024 17:24:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA2D2F801EB
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA2D2F801EB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=EuIUc8GF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556674; x=1743092674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ixlpjYepMerL+sZkIlATdm9JZRvwdM7F4qct3s4El6w=;
  b=EuIUc8GFDmQ+CxpxqMjQxLAS7jVdXv+ZpZkyR7Mb9QrNkwRme7tVPF+S
   TGmL36ku3yQTF2or7+uDEHFOVhz0E/0ZdDPbO4zGPfWJQgLWK80dNnGbT
   1bBCmLazVHDD4wm6cUZC8I/KhxqgVAr3FgaWWUewRq9JkkuwAUZHYpylo
   /N+p9+CzKEk3p2RHqwpOmBbnb1HF9ADeFU8mK8Oh/USGQZBfPyeN7iOkJ
   gvQfHwqTUp+IEOyMgwo4ABgPwq21FUvz2QAa9loIimVGgqiWiDmrnCeRL
   EmShVBBF+x6R8XVBmCHB3VLnmzjQUw5xKSg28+IR+9Yyru31ajoi2m/+e
   w==;
X-CSE-ConnectionGUID: 3hg2S8q1R8+0jU4/76oLmw==
X-CSE-MsgGUID: aWy/uQGZTbCh9IWyM+f0eg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221481"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221481"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821247"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:26 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 01/18] ASoC: Intel: ssp-common: relocate source file
Date: Wed, 27 Mar 2024 11:23:51 -0500
Message-Id: <20240327162408.63953-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3ADIFAAQDYSEM6TQAY45Q3XBSY5YTBMI
X-Message-ID-Hash: 3ADIFAAQDYSEM6TQAY45Q3XBSY5YTBMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ADIFAAQDYSEM6TQAY45Q3XBSY5YTBMI/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Moving ssp-common source and header files from sound/soc/intel/boards
directory to sound/soc/intel/common directory and rename the source
file. Keep file content unchanged for tracking purpose.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Makefile                                | 3 ---
 sound/soc/intel/boards/sof_board_helpers.h                     | 2 +-
 sound/soc/intel/boards/sof_cirrus_common.h                     | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h                      | 2 +-
 sound/soc/intel/boards/sof_nuvoton_common.h                    | 2 +-
 sound/soc/intel/boards/sof_realtek_common.h                    | 2 +-
 sound/soc/intel/common/Makefile                                | 3 +++
 .../sof_ssp_common.c => common/soc-acpi-intel-ssp-common.c}    | 0
 sound/soc/intel/{boards => common}/sof_ssp_common.h            | 0
 9 files changed, 8 insertions(+), 8 deletions(-)
 rename sound/soc/intel/{boards/sof_ssp_common.c => common/soc-acpi-intel-ssp-common.c} (100%)
 rename sound/soc/intel/{boards => common}/sof_ssp_common.h (100%)

diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 8f711be46c43..a93b658ed672 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -101,8 +101,5 @@ obj-$(CONFIG_SND_SOC_INTEL_SOF_CIRRUS_COMMON) += snd-soc-intel-sof-cirrus-common
 snd-soc-intel-sof-nuvoton-common-objs += sof_nuvoton_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_NUVOTON_COMMON) += snd-soc-intel-sof-nuvoton-common.o
 
-snd-soc-intel-sof-ssp-common-objs += sof_ssp_common.o
-obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
-
 snd-soc-intel-sof-board-helpers-objs += sof_board_helpers.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_BOARD_HELPERS) += snd-soc-intel-sof-board-helpers.o
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index b6a83ca14fa8..bd5c48cd0649 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -8,7 +8,7 @@
 
 #include <sound/soc.h>
 #include "sof_hdmi_common.h"
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
index d4ecf8d023d1..445621466f05 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.h
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -9,7 +9,7 @@
 #define __SOF_CIRRUS_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Cirrus Logic CS35L41/CS35L53
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index fe0212fbad8e..63054bcd287b 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -11,7 +11,7 @@
 #define __SOF_MAXIM_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Maxim MAX98373
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.h b/sound/soc/intel/boards/sof_nuvoton_common.h
index 53a84f9a67c0..af2e58b1d393 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.h
+++ b/sound/soc/intel/boards/sof_nuvoton_common.h
@@ -9,7 +9,7 @@
 #define __SOF_NUVOTON_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Nuvoton NAU8318
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index e3fa2924c1c1..99b23d96521a 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -11,7 +11,7 @@
 #define __SOF_REALTEK_COMMON_H
 
 #include <sound/soc.h>
-#include "sof_ssp_common.h"
+#include "../common/sof_ssp_common.h"
 
 /*
  * Realtek ALC1011
diff --git a/sound/soc/intel/common/Makefile b/sound/soc/intel/common/Makefile
index f7370e5b4e9e..15c8a64368c5 100644
--- a/sound/soc/intel/common/Makefile
+++ b/sound/soc/intel/common/Makefile
@@ -17,3 +17,6 @@ snd-soc-acpi-intel-match-objs := soc-acpi-intel-byt-match.o soc-acpi-intel-cht-m
 
 obj-$(CONFIG_SND_SOC_INTEL_SST) += snd-soc-sst-dsp.o snd-soc-sst-ipc.o
 obj-$(CONFIG_SND_SOC_ACPI_INTEL_MATCH) += snd-soc-acpi-intel-match.o
+
+snd-soc-intel-sof-ssp-common-objs += soc-acpi-intel-ssp-common.o
+obj-$(CONFIG_SND_SOC_INTEL_SOF_SSP_COMMON) += snd-soc-intel-sof-ssp-common.o
diff --git a/sound/soc/intel/boards/sof_ssp_common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
similarity index 100%
rename from sound/soc/intel/boards/sof_ssp_common.c
rename to sound/soc/intel/common/soc-acpi-intel-ssp-common.c
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/common/sof_ssp_common.h
similarity index 100%
rename from sound/soc/intel/boards/sof_ssp_common.h
rename to sound/soc/intel/common/sof_ssp_common.h
-- 
2.40.1

