Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F4C1C7C58
	for <lists+alsa-devel@lfdr.de>; Wed,  6 May 2020 23:23:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B7C417CE;
	Wed,  6 May 2020 23:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B7C417CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588800192;
	bh=4dPG9cQjf4sAWTf7T3fySUFlrnFDZAe3ZqaZ1kVLe48=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hx/U+3rf3PTuClIZpzhxo7tBuP/jWlbFC6XXlwbUeGeg9POBbtjf9Fni4x8MFtKTP
	 gg772q40BGbp6jNZWVPpkdPTfq/zdK1hWIdKxvSQKubEzy/Nq5JFQ6nI/sQSAIiERl
	 STv2GqMjVIXFE1BcvWZbBNKCuJvAW62tedUGfQ2A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60135F80253;
	Wed,  6 May 2020 23:21:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 310F9F80249; Wed,  6 May 2020 23:21:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4D18F800AD
 for <alsa-devel@alsa-project.org>; Wed,  6 May 2020 23:21:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4D18F800AD
IronPort-SDR: idHwr6uQ7/AjMwHPOGydcY+W7LyXIq0xh7GjTDCRZj0WcqhOVNQjeSNXLxHkCtIkb/9QDNnzH4
 RavPaMzfjJXA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2020 14:21:19 -0700
IronPort-SDR: oGboGQaw9de92lvThZ3WvNWLG/wSvcIVey2Z9qpW5wpTQcyTFK3klKTQBOcKWwv4RgOk4OS9i8
 AjFHRgzo4vOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,360,1583222400"; d="scan'208";a="278371270"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga002.jf.intel.com with ESMTP; 06 May 2020 14:21:17 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ASoC: Intel: Skylake: Update description for HDaudio
 kconfig
Date: Wed,  6 May 2020 23:21:14 +0200
Message-Id: <20200506212114.8502-1-cezary.rojewski@intel.com>
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

Changes in v3:
- no functional changes, made description more precise by mentioning
  DMIC

Changes in v2:
- no functional changes, removed 'or m' from description as this is a
  'bool' option


 sound/soc/intel/Kconfig | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index c8de0bb5bed9..36f547939f0a 100644
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
+	  and DMIC present then enable this option by saying Y.
 
 config SND_SOC_INTEL_SKYLAKE_COMMON
 	tristate
-- 
2.17.1

