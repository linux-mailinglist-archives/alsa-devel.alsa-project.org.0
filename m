Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0742E28D8BC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 04:58:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CF1B16A1;
	Wed, 14 Oct 2020 04:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CF1B16A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602644326;
	bh=x7jWPaupvt55uZm9sQKcznNBmUsbObHfqd1kfpg+p9M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uYWZFpyd9L0iZpT+JMmWMJ0sKVCmwmpUbRFhE2DNQsBOtZdxjMYYbCWbnp9dEOHQO
	 D8w/Eim8wP6+sZpR10oKvAWuLSRjA5cjY9E19PkaDbHeuLIdkC4H2XwJzzPOkh7dFk
	 22AS6tNoM2gmXZx+J8CwFnfb96ydBzR+3kCc16+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9652F8020D;
	Wed, 14 Oct 2020 04:57:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C82F2F80224; Wed, 14 Oct 2020 04:57:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 895C2F8020D;
 Wed, 14 Oct 2020 04:56:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 895C2F8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="Tx7e5f0J"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=CaF6pMpXPj5y/q+2oCFYautSjCvrlnVUKiL8TX8FfZ8=; b=Tx7e5f0JRJxaO1FNHRXJzycOiW
 2SWRueV/pUtbwH0R2rUa4ghPihWX1aP8F98evI/gfj1rERqulrxPHJj3LWLHV8NeuDuO7+tWLLQS8
 XGVCDbZ7Gw19J1mmrKJ4SexAmSn1YiFN1EjlYTnX3CLLWOw9owBtsz7T37u41DhY+eu2lmR11hGTR
 pR7DDjLbamnNg3q2dNtv/VPtOE+AYmqATScHnYfywMf9fx00Bw9lUpfxpzXI7YHaZhGaj2jGH1zjh
 UaveJyjRljskx2KYt+wfIFtBJxxtQ03d+kkg3wXdNpTGlZjp8bW5EfxCos19a0GEEUmqDoSGKqB+e
 45lIwUhg==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSWy9-0005zg-D8; Wed, 14 Oct 2020 02:56:49 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ASoC: sof: Kconfig: fix Kconfig punctuation and wording
Date: Tue, 13 Oct 2020 19:56:33 -0700
Message-Id: <20201014025633.4879-4-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201014025633.4879-1-rdunlap@infradead.org>
References: <20201014025633.4879-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, sound-open-firmware@alsa-project.org
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

Add periods at the end of sentences in help text.
Drop "a" in one place where it is not needed.
Fix a verb.
Add some capitalization.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
---
 sound/soc/sof/Kconfig |   42 ++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

--- linux-next-20201013.orig/sound/soc/sof/Kconfig
+++ linux-next-20201013/sound/soc/sof/Kconfig
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
 
@@ -161,7 +161,7 @@ config SND_SOC_SOF_DEBUG_ENABLE_FIRMWARE
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
 
