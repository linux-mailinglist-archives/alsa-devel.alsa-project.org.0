Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7652AFA98
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 22:38:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC0B317A1;
	Wed, 11 Nov 2020 22:37:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC0B317A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605130710;
	bh=lV1Ciee+TQLt10DBGG+WWJAxjIryMdw98slI9ZlZ39s=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BNBxZ5grq5AZpFZ0yJUJCL2Q3UtUVQsBm/Fem6ceADG6a9e/E/SRZkMECap0N/Mcs
	 wZgwIYM81pDDT2R1xlSi5Pee0JhPvmli3bD7QDyz5oP4843SjgxnwzD5KuEk3bg7Bd
	 JGhYJBi0QwrUZl07ZEM4d2W2k99ACVHPlQiVnAhU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4F81AF804C3;
	Wed, 11 Nov 2020 22:36:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDB09F804CA; Wed, 11 Nov 2020 22:36:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B045EF8007E
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 22:35:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B045EF8007E
IronPort-SDR: uVH6FIC/HXLsu3HfUoirTeTGl+/hl7VapeB2fNMGuUI+xsNAfVRdsjX9iWTZ23fAgpdX7uGwW5
 fG1p3wtah/dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9802"; a="157237665"
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="157237665"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:47 -0800
IronPort-SDR: 4albLXzaVWtgJSW5amkQcATj7HIgBLxUxmQJYfr5WQEAIHyQxO0fPAnRhaJFfFPTDRv1C/qNeb
 WwaaRDHBpA5w==
X-IronPort-AV: E=Sophos;i="5.77,470,1596524400"; d="scan'208";a="328266633"
Received: from cmurill1-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.130.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2020 13:35:46 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: Kconfig: fix Kconfig punctuation and wording
Date: Wed, 11 Nov 2020 15:35:31 -0600
Message-Id: <20201111213533.149963-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
References: <20201111213533.149963-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@linux.intel.com>
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

From: Randy Dunlap <rdunlap@infradead.org>

Add periods at the end of sentences in help text.
Drop "a" in one place where it is not needed.
Fix a verb.
Add some capitalization.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/Kconfig | 42 +++++++++++++++++++++---------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 8c1f0829de40..031dad5fc4c7 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -2,7 +2,7 @@
 config SND_SOC_SOF_TOPLEVEL
 	bool "Sound Open Firmware Support"
 	help
-	  This adds support for Sound Open Firmware (SOF). SOF is a free and
+	  This adds support for Sound Open Firmware (SOF). SOF is free and
 	  generic open source audio DSP firmware for multiple devices.
 	  Say Y if you have such a device that is supported by SOF.
 	  If unsure select "N".
@@ -16,8 +16,8 @@ config SND_SOC_SOF_PCI
 	select SND_SOC_ACPI if ACPI
 	help
 	  This adds support for PCI enumeration. This option is
-	  required to enable Intel Skylake+ devices
-	  Say Y if you need this option
+	  required to enable Intel Skylake+ devices.
+	  Say Y if you need this option.
 	  If unsure select "N".
 
 config SND_SOC_SOF_ACPI
@@ -28,8 +28,8 @@ config SND_SOC_SOF_ACPI
 	select IOSF_MBI if X86 && PCI
 	help
 	  This adds support for ACPI enumeration. This option is required
-	  to enable Intel Broadwell/Baytrail/Cherrytrail devices
-	  Say Y if you need this option
+	  to enable Intel Broadwell/Baytrail/Cherrytrail devices.
+	  Say Y if you need this option.
 	  If unsure select "N".
 
 config SND_SOC_SOF_OF
@@ -54,12 +54,12 @@ config SND_SOC_SOF_DEVELOPER_SUPPORT
 	bool "SOF developer options support"
 	depends on EXPERT
 	help
-	  This option unlock SOF developer options for debug/performance/
+	  This option unlocks SOF developer options for debug/performance/
 	  code hardening.
 	  Distributions should not select this option, only SOF development
 	  teams should select it.
-	  Say Y if you are involved in SOF development and need this option
-	  If not, select N
+	  Say Y if you are involved in SOF development and need this option.
+	  If not, select N.
 
 if SND_SOC_SOF_DEVELOPER_SUPPORT
 
@@ -72,13 +72,13 @@ config SND_SOC_SOF_NOCODEC_SUPPORT
 	  This adds support for a dummy/nocodec machine driver fallback
 	  option if no known codec is detected. This is typically only
 	  enabled for developers or devices where the sound card is
-	  controlled externally
-	  This option is mutually exclusive with the Intel HDAudio support,
-	  selecting it may have negative impacts and prevent e.g. microphone
+	  controlled externally.
+	  This option is mutually exclusive with the Intel HDAudio support.
+	  Selecting it may have negative impacts and prevent e.g. microphone
 	  functionality from being enabled on Intel CoffeeLake and later
 	  platforms.
 	  Distributions should not select this option!
-	  Say Y if you need this nocodec fallback option
+	  Say Y if you need this nocodec fallback option.
 	  If unsure select "N".
 
 config SND_SOC_SOF_STRICT_ABI_CHECKS
@@ -92,8 +92,8 @@ config SND_SOC_SOF_STRICT_ABI_CHECKS
 	  is invoked.
 	  This option will stop topology creation and firmware load upfront.
 	  It is intended for SOF CI/releases and not for users or distros.
-	  Say Y if you want strict ABI checks for an SOF release
-	  If you are not involved in SOF releases and CI development
+	  Say Y if you want strict ABI checks for an SOF release.
+	  If you are not involved in SOF releases and CI development,
 	  select "N".
 
 config SND_SOC_SOF_DEBUG
@@ -114,8 +114,8 @@ config SND_SOC_SOF_FORCE_NOCODEC_MODE
 	  though there is a codec detected on the real platform. This is
 	  typically only enabled for developers for debug purposes, before
 	  codec/machine driver is ready, or to exclude the impact of those
-	  drivers
-	  Say Y if you need this force nocodec mode option
+	  drivers.
+	  Say Y if you need this force nocodec mode option.
 	  If unsure select "N".
 
 config SND_SOC_SOF_DEBUG_XRUN_STOP
@@ -137,12 +137,12 @@ config SND_SOC_SOF_DEBUG_VERBOSE_IPC
 config SND_SOC_SOF_DEBUG_FORCE_IPC_POSITION
 	bool "SOF force to use IPC for position update on SKL+"
 	help
-	  This option force to handle stream position update IPCs and run pcm
+	  This option forces to handle stream position update IPCs and run PCM
 	  elapse to inform ALSA about that, on platforms (e.g. Intel SKL+) that
 	  with other approach (e.g. HDAC DPIB/posbuf) to elapse PCM.
 	  On platforms (e.g. Intel SKL-) where position update IPC is the only
 	  one choice, this setting won't impact anything.
-	  if you are trying to debug pointer update with position IPCs or where
+	  If you are trying to debug pointer update with position IPCs or where
 	  DPIB/posbuf is not ready, select "Y".
 	  If unsure select "N".
 
@@ -161,7 +161,7 @@ config SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE_TRACE
 	help
 	  The firmware trace can be enabled either at build-time with
 	  this option, or dynamically by setting flags in the SOF core
-	  module parameter (similar to dynamic debug)
+	  module parameter (similar to dynamic debug).
 	  If unsure, select "N".
 
 config SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST
@@ -190,7 +190,7 @@ config SND_SOC_SOF
 	select SND_SOC_SOF_NOCODEC if SND_SOC_SOF_NOCODEC_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 	  The selection is made at the top level and does not exactly follow
 	  module dependencies but since the module or built-in type is decided
 	  at the top level it doesn't matter.
@@ -199,7 +199,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 	bool
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 	  When selected, the probe is handled in two steps, for example to
 	  avoid lockdeps if request_module is used in the probe.
 
-- 
2.25.1

