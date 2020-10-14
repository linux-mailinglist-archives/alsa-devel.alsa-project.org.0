Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD8A28D8C0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Oct 2020 04:59:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CCFD16AC;
	Wed, 14 Oct 2020 04:58:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CCFD16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602644369;
	bh=Z7xdWz29WTobA2/rbBFpNpxrlTvyjiUvhXyfNXbNrbk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PVGcJ2u3ZBi0drjBmFbFZIjX2AP1hySX22L8gfiefaQfbfOpOKyK5QaQreZs2repi
	 6hTkwR9J0rb2O/nsIYqg6gGlSaS1jw7YIEgRxUPJIv48Qve3jkr86RL0AlrlBsx3YZ
	 /rnb+pCtmYaLWr5sI0Q2gyAbzsJh/hiPrS0hpl8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A9AF8026A;
	Wed, 14 Oct 2020 04:57:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F147F8026B; Wed, 14 Oct 2020 04:57:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A17FF80217;
 Wed, 14 Oct 2020 04:56:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A17FF80217
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org
 header.b="FB0Gf5OS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lwPHh5BdJavllaLtSF8D3vBsOXpfavOHxY3/cELp04I=; b=FB0Gf5OSOkHsuV6SFksqCCaoKy
 iULnZ5uTiQ2cm1vpKaUwgXuEKsKZI1dZ3ucd6TyciOaUKDoP0LRf79FOLK4Zj0EzDYfqaP+V8geF9
 tmy/naNtu6w9bLA8KeGo0KSXLyR5PmbB7Adxe9Mt2IEdUioCH/NKg73BAfS4nW+c8LpF4D5/nDgEV
 1NI4nhDM/mOCVLVMFU82eL6CuuMvkP48sVn+mNqxxsZvhLnqrDVNXHVOVmKN7Abre7gUmN+6X8E+i
 znJLabfpERY3VZURx1oYEVS5NIvvLZtsN1fmqRgdAiE4bcJpLl/hVZLUMtEKPufzX06ZUgrdHerLa
 hzMayrPQ==;
Received: from [2601:1c0:6280:3f0::507c] (helo=smtpauth.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSWy5-0005zg-Qs; Wed, 14 Oct 2020 02:56:46 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] ASoC: sof: intel: fix Kconfig punctuation and wording
Date: Tue, 13 Oct 2020 19:56:32 -0700
Message-Id: <20201014025633.4879-3-rdunlap@infradead.org>
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
Insert a "not" in one place.
Fix help text indentation.
Remove a duplicate "Intel(R)" in one place.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>
Cc: sound-open-firmware@alsa-project.org
Cc: alsa-devel@alsa-project.org
---
 sound/soc/sof/intel/Kconfig |   62 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 31 deletions(-)

--- linux-next-20201013.orig/sound/soc/sof/intel/Kconfig
+++ linux-next-20201013/sound/soc/sof/intel/Kconfig
@@ -15,7 +15,7 @@ config SND_SOC_SOF_INTEL_ACPI
 	select SND_SOC_SOF_BROADWELL if SND_SOC_SOF_BROADWELL_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_PCI
 	def_tristate SND_SOC_SOF_PCI
@@ -31,13 +31,13 @@ config SND_SOC_SOF_INTEL_PCI
 	select SND_SOC_SOF_JASPERLAKE  if SND_SOC_SOF_JASPERLAKE_SUPPORT
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	tristate
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	tristate
@@ -45,7 +45,7 @@ config SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_COMMON
 	tristate
@@ -55,7 +55,7 @@ config SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_ACPI if ACPI
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 if SND_SOC_SOF_INTEL_ACPI
 
@@ -72,7 +72,7 @@ config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	  recommended for distros. At some point all legacy drivers will be
 	  deprecated but not before all userspace firmware/topology/UCM files
 	  are made available to downstream distros.
-	  Say Y if you want to enable SOF on Baytrail/Cherrytrail
+	  Say Y if you want to enable SOF on Baytrail/Cherrytrail.
 	  If unsure select "N".
 
 config SND_SOC_SOF_BAYTRAIL
@@ -80,7 +80,7 @@ config SND_SOC_SOF_BAYTRAIL
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
@@ -91,11 +91,11 @@ config SND_SOC_SOF_BROADWELL_SUPPORT
 	  This option is mutually exclusive with the Haswell/Broadwell legacy
 	  driver. If you want to enable SOF on Broadwell you need to deselect
 	  the legacy driver first.
-	  SOF does fully support Broadwell yet, so this option is not
+	  SOF does not fully support Broadwell yet, so this option is not
 	  recommended for distros. At some point all legacy drivers will be
 	  deprecated but not before all userspace firmware/topology/UCM files
 	  are made available to downstream distros.
-	  Say Y if you want to enable SOF on Broadwell
+	  Say Y if you want to enable SOF on Broadwell.
 	  If unsure select "N".
 
 config SND_SOC_SOF_BROADWELL
@@ -104,7 +104,7 @@ config SND_SOC_SOF_BROADWELL
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 endif ## SND_SOC_SOF_INTEL_ACPI
 
@@ -123,7 +123,7 @@ config SND_SOC_SOF_MERRIFIELD
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_APOLLOLAKE_SUPPORT
 	bool "SOF support for Apollolake"
@@ -138,7 +138,7 @@ config SND_SOC_SOF_APOLLOLAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_GEMINILAKE_SUPPORT
 	bool "SOF support for GeminiLake"
@@ -153,7 +153,7 @@ config SND_SOC_SOF_GEMINILAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_CANNONLAKE_SUPPORT
 	bool "SOF support for Cannonlake"
@@ -169,7 +169,7 @@ config SND_SOC_SOF_CANNONLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COFFEELAKE_SUPPORT
 	bool "SOF support for CoffeeLake"
@@ -185,7 +185,7 @@ config SND_SOC_SOF_COFFEELAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_ICELAKE_SUPPORT
 	bool "SOF support for Icelake"
@@ -201,7 +201,7 @@ config SND_SOC_SOF_ICELAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COMETLAKE
 	tristate
@@ -209,7 +209,7 @@ config SND_SOC_SOF_COMETLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_COMETLAKE_SUPPORT
 	bool
@@ -236,7 +236,7 @@ config SND_SOC_SOF_TIGERLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 	bool "SOF support for ElkhartLake"
@@ -252,7 +252,7 @@ config SND_SOC_SOF_ELKHARTLAKE
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_JASPERLAKE_SUPPORT
 	bool "SOF support for JasperLake"
@@ -267,7 +267,7 @@ config SND_SOC_SOF_JASPERLAKE
 	select SND_SOC_SOF_HDA_COMMON
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA_COMMON
 	tristate
@@ -275,7 +275,7 @@ config SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_HDA_LINK_BASELINE
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 if SND_SOC_SOF_HDA_COMMON
 
@@ -285,7 +285,7 @@ config SND_SOC_SOF_HDA_LINK
 	select SND_SOC_SOF_PROBE_WORK_QUEUE
 	help
 	  This adds support for HDA links(HDA/HDMI) with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable HDA links with SOF.
 	  If unsure select "N".
 
@@ -294,7 +294,7 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	depends on SND_SOC_SOF_HDA_LINK
 	help
 	  This adds support for HDAudio codecs with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
@@ -302,8 +302,8 @@ config SND_SOC_SOF_HDA_PROBES
 	bool "SOF enable probes over HDA"
 	depends on SND_SOC_SOF_DEBUG_PROBES
 	help
-	  This option enables the data probing for Intel(R).
-		  Intel(R) Skylake and newer platforms.
+	  This option enables the data probing for Intel(R)
+	  Skylake and newer platforms.
 	  Say Y if you want to enable probes.
 	  If unsure, select "N".
 
@@ -314,7 +314,7 @@ config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI
 	  and disables known workarounds for specific HDAudio platforms.
 	  Only use to look into power optimizations on platforms not
 	  affected by DMI L1 issues. This option is not recommended.
-	  Say Y if you want to enable DMI Link L1
+	  Say Y if you want to enable DMI Link L1.
 	  If unsure, select "N".
 
 endif ## SND_SOC_SOF_HDA_COMMON
@@ -324,7 +324,7 @@ config SND_SOC_SOF_HDA_LINK_BASELINE
 	select SND_SOC_SOF_HDA if SND_SOC_SOF_HDA_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_HDA
 	tristate
@@ -333,14 +333,14 @@ config SND_SOC_SOF_HDA
 	select SND_INTEL_DSP_CONFIG
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
 	bool "SOF support for SoundWire"
 	depends on SOUNDWIRE && ACPI
 	help
 	  This adds support for SoundWire with Sound Open Firmware
-		  for Intel(R) platforms.
+	  for Intel(R) platforms.
 	  Say Y if you want to enable SoundWire links with SOF.
 	  If unsure select "N".
 
@@ -349,14 +349,14 @@ config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_
 	select SND_SOC_SOF_INTEL_SOUNDWIRE if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 config SND_SOC_SOF_INTEL_SOUNDWIRE
 	tristate
 	select SOUNDWIRE_INTEL
 	help
 	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level
+	  'select' statements at a higher level.
 
 endif ## SND_SOC_SOF_INTEL_PCI
 
