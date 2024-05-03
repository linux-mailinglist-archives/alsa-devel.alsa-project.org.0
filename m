Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2870E8BAE1E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 May 2024 15:54:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68FA9A4B;
	Fri,  3 May 2024 15:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68FA9A4B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714744486;
	bh=sIoVJ5Da2HwESOH6d+Mlq5Qfn1752f4j0Gjxy0qZU/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LAlIK3Sbm/BM1r0Yj/QZQ5NDmz1p7Pu0m2dBtWH090Mr93Kna0R51/qvKs6BiMO8V
	 IeucS1f9K05cdmUczLUtpVgwcCFrBWyfvmZiOpUdhEukGbwNFq4nWdEpCA8s5sLeZ1
	 HueVhKci7gzNLlB2O1USIsvrEF+y6l8mjT3Ge2Qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A4463F80690; Fri,  3 May 2024 15:53:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B17FF8068A;
	Fri,  3 May 2024 15:53:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E574F8060B; Fri,  3 May 2024 15:52:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 58C4BF8049C
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 15:52:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58C4BF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LxyxuZH0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714744360; x=1746280360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sIoVJ5Da2HwESOH6d+Mlq5Qfn1752f4j0Gjxy0qZU/E=;
  b=LxyxuZH0NJUA+P/aKnlusQZed+FnJTorZ1tqn9Bghd2l5nnxcWBmBGDP
   Xp9iogHmNqoHrMdd8mvoP4506N+GwV1CHzoxr/GRRxqBZSpY2dcsKYB4V
   swMkg4RKELbSIwjvgHnxmrpIPEYp9pyamoQvax1Pkv8oW8It2019FiMeD
   3AKLFLECobvEdVdAUTIbtNxSqQs9Cfc9XsSGQpaJGYXvxfZSI6MJcpivX
   7iZScFr6hQBybo3Hhv4MFTLm5WeBViKmNFxqcShspMVD4py5QkedQ7735
   +gQsCa2eTfAQIlW703lkYUp/W+j4XG9Bqad7ffGm3SfRvwJy3dHj24zkR
   A==;
X-CSE-ConnectionGUID: 9kJCtPMdSyiE77luW0SEng==
X-CSE-MsgGUID: /pPu/wciRxOq7R4KIxy+Aw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28029426"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="28029426"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:37 -0700
X-CSE-ConnectionGUID: LJLy3QkKTa+3zIUE/u0MtQ==
X-CSE-MsgGUID: PA434yMmSuGfcJglKsYL/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000";
   d="scan'208";a="27548765"
Received: from sjslinke-mobl.amr.corp.intel.com (HELO
 pbossart-mobl6.intel.com) ([10.212.113.3])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2024 06:52:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: [PATCH 5/7] ASoC: SOF: Intel: move tracepoint creation
Date: Fri,  3 May 2024 08:52:19 -0500
Message-Id: <20240503135221.229202-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
References: <20240503135221.229202-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FON2SE2R25QKIPHUK2JN6O72BHOAO2GZ
X-Message-ID-Hash: FON2SE2R25QKIPHUK2JN6O72BHOAO2GZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FON2SE2R25QKIPHUK2JN6O72BHOAO2GZ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CREATE_TRACEPOINTS is supposed to be used once. To avoid modpost
issues when creating modules, let's move the tracepoint creation in a
single object file.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/Makefile      | 2 +-
 sound/soc/sof/intel/hda.c         | 1 -
 sound/soc/sof/intel/tracepoints.c | 3 +++
 3 files changed, 4 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/intel/tracepoints.c

diff --git a/sound/soc/sof/intel/Makefile b/sound/soc/sof/intel/Makefile
index c895bae0efdd..cf74548f87ad 100644
--- a/sound/soc/sof/intel/Makefile
+++ b/sound/soc/sof/intel/Makefile
@@ -7,7 +7,7 @@ snd-sof-intel-hda-common-objs := hda.o hda-loader.o hda-stream.o hda-trace.o \
 				 hda-dsp.o hda-ipc.o hda-ctrl.o hda-pcm.o \
 				 hda-dai.o hda-dai-ops.o hda-bus.o \
 				 hda-common-ops.o \
-				 telemetry.o
+				 telemetry.o tracepoints.o
 
 snd-sof-intel-hda-mlink-objs := hda-mlink.o
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index a6d16314879f..b15b1f5edcea 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -35,7 +35,6 @@
 #include "../ipc4-topology.h"
 #include "hda.h"
 
-#define CREATE_TRACE_POINTS
 #include <trace/events/sof_intel.h>
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
diff --git a/sound/soc/sof/intel/tracepoints.c b/sound/soc/sof/intel/tracepoints.c
new file mode 100644
index 000000000000..c223c96fe0e3
--- /dev/null
+++ b/sound/soc/sof/intel/tracepoints.c
@@ -0,0 +1,3 @@
+// SPDX-License-Identifier: GPL-2.0
+#define CREATE_TRACE_POINTS
+#include <trace/events/sof_intel.h>
-- 
2.40.1

