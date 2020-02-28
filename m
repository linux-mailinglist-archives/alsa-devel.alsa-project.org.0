Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C6D1742DC
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Feb 2020 00:15:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16B0D1698;
	Sat, 29 Feb 2020 00:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16B0D1698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582931713;
	bh=1YzXLD8X/B/ox1IE6m9u03jmAA24VC+PknXItfGfz+M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NWU9WwZlECp5qspEA1MEj+IK4WSJf9YFjdogCr8lBLY4y0gamID1UeMqfsrkDyHIJ
	 xuWVK1t/9QWHtemC30D3AlC+gKja6WcBRFWNEBZS4lGXt/elL20BnJcY2SUUH1iDii
	 5xYX55EJwLLrnakUNUM6rZja2iErj1oDVxrcHuek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7876EF8028A;
	Sat, 29 Feb 2020 00:12:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EC994F80213; Sat, 29 Feb 2020 00:12:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0814FF80086
 for <alsa-devel@alsa-project.org>; Sat, 29 Feb 2020 00:12:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0814FF80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Feb 2020 15:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,497,1574150400"; d="scan'208";a="232402937"
Received: from rbconrad-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.95.100])
 by orsmga008.jf.intel.com with ESMTP; 28 Feb 2020 15:12:14 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ASoC: Intel: sof_pcm512x: drop reverse deps for
 SND_HDA_CODEC_HDMI
Date: Fri, 28 Feb 2020 17:11:57 -0600
Message-Id: <20200228231204.9026-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
References: <20200228231204.9026-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

Having a reverse dependency to a config that has its own additional
dependencies, is generally not recommended. And this applies to
select statements for SND_HDA_CODEC_HDMI, e.g. the case where SND_HDA
and SND_SOC_SOF_HDA are built as modules, but the machine driver is
built-in, leading to compile errors (reported as
i386-randconfig-e003-20200206).

Give up on trying to define different dependencies based on SOF/SST
selection, and simply add a "depends on" for SND_HDA_CODEC_HDMI. This
fixes the issue with randconfigs. Only downside is that SND_HDA_CODEC_HDMI
may be built unnecessarily in some cases, but this seems like the lesser
evil.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 67d85a7be559..6833ef548710 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -464,8 +464,8 @@ config SND_SOC_INTEL_SOF_PCM512x_MACH
 	depends on I2C && ACPI
 	depends on (SND_SOC_SOF_HDA_AUDIO_CODEC && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
+	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_PCM512x_I2C
-	select SND_HDA_CODEC_HDMI if SND_SOC_SOF_HDA_AUDIO_CODEC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
 	  with TI PCM512x I2S audio codec.
-- 
2.20.1

