Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D6A88EB20
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 17:25:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC3582C33;
	Wed, 27 Mar 2024 17:25:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC3582C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711556749;
	bh=3kkrMBxxqe8gX3azfqO+74/qGoMD7vgBEGBNeX8kchM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qp1e0+d4IyiXT2cIuADTVkPgG73WtqJuvGUarCYvhYruFtr7rMyEBB3IOt8Twtchv
	 OPCS3b5lzHip54RUHyuJqbMJIuqPkgeggj2B3jxb4NYjIlwYwBvGnTpK2r/9Z+4Vwo
	 dNns4bsj2DbwtSBGd9W4wBgSp2AVJWoa+H6hnMBE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5032CF805F0; Wed, 27 Mar 2024 17:24:49 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5C31F805F0;
	Wed, 27 Mar 2024 17:24:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 09C3AF8057B; Wed, 27 Mar 2024 17:24:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2DEEAF8025F
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 17:24:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DEEAF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VK/YRTO0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556674; x=1743092674;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3kkrMBxxqe8gX3azfqO+74/qGoMD7vgBEGBNeX8kchM=;
  b=VK/YRTO0z1MIzJQn474iOKZPu55DSyYi7xwIfnRusI8jUs+VDeeyN9fv
   G7LSpp9WWtWCLJ5yCKUimgscBFfjvMBQrgke1E1oEQ24+7QpbuhAuVCSL
   V16yYRAoBaMktaMQBHQD5PxBt6J8hwDfKoWhMHiTn8geZO/UBCO03sOT8
   OLbmHf2Rnxq2q3NA7zAC5cwKON54nQPz+dp0BTOfGX9cZe0eXdjzQ3xzf
   yOQ5OMCCIanP0C0GL3ZBoY6Hj1AYpWaIEPHQTKf1V7oaIZqhvPXvwgHFF
   dalLrtDiIWJNekwv1V6R4xPA4SRzyX9nk0EoK3sXEP104boJsBohIfRYW
   Q==;
X-CSE-ConnectionGUID: Bl4015AOTdC0dtlr0upNwA==
X-CSE-MsgGUID: q+NABznSScaLAjErxZKTeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221485"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="17221485"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000";
   d="scan'208";a="53821251"
Received: from ssherman-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2024 09:24:27 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/18] ASoC: Intel: ssp-common: relocate header file
Date: Wed, 27 Mar 2024 11:23:52 -0500
Message-Id: <20240327162408.63953-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4NBHOV5FABMPRBB77BTWCG7HRMAGQAJJ
X-Message-ID-Hash: 4NBHOV5FABMPRBB77BTWCG7HRMAGQAJJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4NBHOV5FABMPRBB77BTWCG7HRMAGQAJJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Brent Lu <brent.lu@intel.com>

Moving ssp-common header file from sound/soc/intel/common directory to
include/sound directory and rename the file. Keep file content
unchanged for tracking purpose.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../sound/soc-acpi-intel-ssp-common.h                           | 0
 sound/soc/intel/boards/sof_board_helpers.h                      | 2 +-
 sound/soc/intel/boards/sof_cirrus_common.h                      | 2 +-
 sound/soc/intel/boards/sof_maxim_common.h                       | 2 +-
 sound/soc/intel/boards/sof_nuvoton_common.h                     | 2 +-
 sound/soc/intel/boards/sof_realtek_common.h                     | 2 +-
 sound/soc/intel/common/soc-acpi-intel-ssp-common.c              | 2 +-
 7 files changed, 6 insertions(+), 6 deletions(-)
 rename sound/soc/intel/common/sof_ssp_common.h => include/sound/soc-acpi-intel-ssp-common.h (100%)

diff --git a/sound/soc/intel/common/sof_ssp_common.h b/include/sound/soc-acpi-intel-ssp-common.h
similarity index 100%
rename from sound/soc/intel/common/sof_ssp_common.h
rename to include/sound/soc-acpi-intel-ssp-common.h
diff --git a/sound/soc/intel/boards/sof_board_helpers.h b/sound/soc/intel/boards/sof_board_helpers.h
index bd5c48cd0649..34ea974c8493 100644
--- a/sound/soc/intel/boards/sof_board_helpers.h
+++ b/sound/soc/intel/boards/sof_board_helpers.h
@@ -7,8 +7,8 @@
 #define __SOF_INTEL_BOARD_HELPERS_H
 
 #include <sound/soc.h>
+#include <sound/soc-acpi-intel-ssp-common.h>
 #include "sof_hdmi_common.h"
-#include "../common/sof_ssp_common.h"
 
 /*
  * Common board quirks: from bit 8 to 31, LSB 8 bits reserved for machine
diff --git a/sound/soc/intel/boards/sof_cirrus_common.h b/sound/soc/intel/boards/sof_cirrus_common.h
index 445621466f05..1c87637b9ef7 100644
--- a/sound/soc/intel/boards/sof_cirrus_common.h
+++ b/sound/soc/intel/boards/sof_cirrus_common.h
@@ -9,7 +9,7 @@
 #define __SOF_CIRRUS_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Cirrus Logic CS35L41/CS35L53
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 63054bcd287b..8886f985de68 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -11,7 +11,7 @@
 #define __SOF_MAXIM_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Maxim MAX98373
diff --git a/sound/soc/intel/boards/sof_nuvoton_common.h b/sound/soc/intel/boards/sof_nuvoton_common.h
index af2e58b1d393..8a0f283260e7 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.h
+++ b/sound/soc/intel/boards/sof_nuvoton_common.h
@@ -9,7 +9,7 @@
 #define __SOF_NUVOTON_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Nuvoton NAU8318
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
index 99b23d96521a..289e85b61660 100644
--- a/sound/soc/intel/boards/sof_realtek_common.h
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -11,7 +11,7 @@
 #define __SOF_REALTEK_COMMON_H
 
 #include <sound/soc.h>
-#include "../common/sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Realtek ALC1011
diff --git a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
index 96072790e9c0..37758f4e3f32 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ssp-common.c
@@ -4,7 +4,7 @@
 
 #include <linux/device.h>
 #include <sound/soc-acpi.h>
-#include "sof_ssp_common.h"
+#include <sound/soc-acpi-intel-ssp-common.h>
 
 /*
  * Codec probe function
-- 
2.40.1

