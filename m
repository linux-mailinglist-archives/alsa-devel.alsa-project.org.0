Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4AFB437D
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Sep 2019 23:48:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE79E167D;
	Mon, 16 Sep 2019 23:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE79E167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568670494;
	bh=74SK5f64eSY8OAaggGnyaoREe07IOnAx+Q2yxyl4Tjo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OUuQQJJ/mQda4nFwx813kIbbmUWM71Dv99a39SRENYYcP3AXFx9binO+Yk0m2y3Bo
	 fUuivjgxWIakL3hARC66z4qdi6e8FK3O7w78WujxjpGddcNjKtrrtXElzB3Wi3QBVn
	 g2bBKgWItzoLMDMNNy/2cEpk04IXIRVesUAqAVYo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A40CF80642;
	Mon, 16 Sep 2019 23:43:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB6B4F8063B; Mon, 16 Sep 2019 23:43:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC57EF80636
 for <alsa-devel@alsa-project.org>; Mon, 16 Sep 2019 23:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC57EF80636
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Sep 2019 14:43:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,514,1559545200"; d="scan'208";a="198480039"
Received: from dgitin-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.251.142.45])
 by orsmga002.jf.intel.com with ESMTP; 16 Sep 2019 14:43:46 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon, 16 Sep 2019 16:42:44 -0500
Message-Id: <20190916214251.13130-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190916214251.13130-1-pierre-louis.bossart@linux.intel.com>
References: <20190916214251.13130-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de, gregkh@linuxfoundation.org,
 Takashi Iwai <tiwai@suse.com>, Pan Xiuli <xiuli.pan@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, vkoul@kernel.org,
 broonie@kernel.org, srinivas.kandagatla@linaro.org, jank@cadence.com,
 slawomir.blauciak@intel.com,
 Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
Subject: [alsa-devel] [RFC PATCH 05/12] ASoC: SOF: Intel: add build support
	for SoundWire
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Select SoundWire capabilities on newer Intel platforms, starting with
CannonLake/CoffeeLake/CometLake.

As done for HDaudio, the SoundWire link is an opt-in capability. We
explicitly test for ACPI to avoid warnings on unmet dependencies on
the SoundWire side.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 479ba249e219..1adff7be5b40 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -150,6 +150,7 @@ config SND_SOC_SOF_CANNONLAKE_SUPPORT
 config SND_SOC_SOF_CANNONLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -165,6 +166,7 @@ config SND_SOC_SOF_COFFEELAKE_SUPPORT
 config SND_SOC_SOF_COFFEELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -180,6 +182,7 @@ config SND_SOC_SOF_ICELAKE_SUPPORT
 config SND_SOC_SOF_ICELAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -187,6 +190,7 @@ config SND_SOC_SOF_ICELAKE
 config SND_SOC_SOF_COMETLAKE_LP
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -202,6 +206,7 @@ config SND_SOC_SOF_COMETLAKE_LP_SUPPORT
 config SND_SOC_SOF_COMETLAKE_H
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -225,6 +230,7 @@ config SND_SOC_SOF_TIGERLAKE_SUPPORT
 config SND_SOC_SOF_TIGERLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
           This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -240,6 +246,7 @@ config SND_SOC_SOF_ELKHARTLAKE_SUPPORT
 config SND_SOC_SOF_ELKHARTLAKE
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_INTEL_SOUNDWIRE
 	help
           This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
@@ -291,6 +298,22 @@ config SND_SOC_SOF_HDA
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
+	bool "SOF support for SoundWire"
+	depends on SOUNDWIRE && ACPI
+	help
+	  This adds support for SoundWire with Sound Open Firmware
+		  for Intel(R) platforms.
+	  Say Y if you want to enable SoundWire links with SOF.
+	  If unsure select "N".
+
+config SND_SOC_SOF_INTEL_SOUNDWIRE
+	tristate
+	select SOUNDWIRE_INTEL if SND_SOC_SOF_INTEL_SOUNDWIRE_LINK
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level
+
 endif ## SND_SOC_SOF_INTEL_PCI
 
 endif ## SND_SOC_SOF_INTEL_TOPLEVEL
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
