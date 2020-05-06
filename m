Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E81C7B95
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 22:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF40517C1;
	Wed,  6 May 2020 22:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF40517C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588798507;
	bh=CeArJqahaxKs+auljReP8+zWNLucxIsQDhn3iDPoQ7c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HO59Ruey+lADNAULEc3JSf3eQu/QOAEMYy+GoC1r09cGfCL3ecUkvlmoe8DRAWdm3
	 RfQ00kFk1qWAnoJbztwpXBhFtpU39GTWbpuOeepfjRPy8YDlZuWA1AskxYv33aXTs/
	 c93a/3IhHRV0Zu2TSlL1apFMWctl3gzaFWvyCaNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9530F800DF;
	Wed,  6 May 2020 22:53:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9D6E0F80249; Wed,  6 May 2020 22:53:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2DFBF800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 22:52:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2DFBF800AD
IronPort-SDR: XbDuSn9uwuQyZsw748/sI+9fd+eTR2pgPQ/sLas6nfCYXD7vdxu1xXPtG+7Px7ZmmBY42C045m
 ofJd8lVZWucQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 13:52:47 -0700
IronPort-SDR: dje3RtmbN20ZTD+aWke7ZgvqVqeesMgX7oaj/Ob/gqqGvXtwVacTOcwoTRW6UE2xJYs76NT9wX
 QT5xbs8jq+og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="284752293"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga004.fm.intel.com with ESMTP; 06 May 2020 13:52:46 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: Skylake: Update description for HDaudio kconfig
Date: Wed,  6 May 2020 22:52:24 +0200
Message-Id: <20200506205224.7577-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com
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

With 'ASoC: Intel: Skylake: Fix HDaudio and Dmic' series applied,
warning is no longer true. Remove it and update the description.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c8de0bb5bed9..4d11f4f3f7e2 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -209,12 +209,8 @@ config SND_SOC_INTEL_SKYLAKE_SSP_CLK
 config SND_SOC_INTEL_SKYLAKE_HDAUDIO_CODEC
 	bool "HDAudio codec support"
 	help
-	  This option broke audio on Linus' Skylake laptop in December 2018
-	  and the race conditions during the probe were not fixed since.
-	  This option is DEPRECATED, all HDaudio codec support needs
-	  to be handled by the SOF driver.
-	  Distributions should not enable this option and there are no known
-	  users of this capability.
+	  If you have Intel Skylake or Kabylake with HDaudio codec
+	  then enable this option by saying Y or m.
 
 config SND_SOC_INTEL_SKYLAKE_COMMON
 	tristate
-- 
2.17.1

