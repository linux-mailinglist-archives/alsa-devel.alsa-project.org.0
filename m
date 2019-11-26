Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D2410A0D2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Nov 2019 15:57:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 847C31746;
	Tue, 26 Nov 2019 15:56:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 847C31746
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574780219;
	bh=Ok+QEtb8Bl9v4Wud3uFWc0RtehEv4X4azwT4pYj8tpc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qp/W1gloJfh4IUoDoPGg7wUOQywfFIrAxwgFln6YdFHLNZvBTu7w7t3hv0Z7ir7jf
	 OMVD5YhJE4ngQnDBqbAjWxvKGOomiQJWHiORrH/sNX+FhWULALDwHXJuLSKJwd/iTo
	 32fFyIq7KSblTk5OGi9Z7jC0RLRIeF8zcwpts9V4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 61083F80214;
	Tue, 26 Nov 2019 15:53:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E90E3F801F7; Tue, 26 Nov 2019 15:53:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9ADC8F801ED
 for <alsa-devel@alsa-project.org>; Tue, 26 Nov 2019 15:53:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9ADC8F801ED
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Nov 2019 06:53:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,246,1571727600"; d="scan'208";a="239951780"
Received: from vramali2-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.155.193])
 by fmsmga002.fm.intel.com with ESMTP; 26 Nov 2019 06:53:35 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue, 26 Nov 2019 08:53:03 -0600
Message-Id: <20191126145304.24204-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191126145304.24204-1-pierre-louis.bossart@linux.intel.com>
References: <20191126145304.24204-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/3] ASoC: Intel: boards: make common HDMI
	driver the default for SOF
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Modify Kconfig rules for machine drivers used by SOF to pick
SND_HDA_CODEC_HDMI by default if other conditions are met. For
shared machine drivers used also by older SST driver, keep using
HDAC_HDMI.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index ef20316e83d1..575064b315ef 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -261,6 +261,7 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_CODEC
 	select SND_SOC_HDAC_HDMI
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
@@ -387,6 +388,7 @@ config SND_SOC_INTEL_GLK_RT5682_MAX98357A_MACH
 	select SND_SOC_RT5682
 	select SND_SOC_MAX98357A
 	select SND_SOC_DMIC
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for Geminilake platforms
@@ -400,6 +402,7 @@ if SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC || SND_SOC_SOF_HDA_AUDIO_CODEC
 
 config SND_SOC_INTEL_SKL_HDA_DSP_GENERIC_MACH
 	tristate "SKL/KBL/BXT/APL with HDA Codecs"
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_CODEC
 	select SND_SOC_HDAC_HDMI
 	select SND_SOC_DMIC
 	# SND_SOC_HDAC_HDA is already selected
@@ -419,6 +422,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_CODEC
 	select SND_SOC_HDAC_HDMI
 	help
 	   This adds support for ASoC machine driver for SOF platforms
@@ -448,6 +452,7 @@ config SND_SOC_INTEL_SOF_CML_RT1011_RT5682_MACH
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
+	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platform with
 	  RT1011 + RT5682 I2S codec.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
