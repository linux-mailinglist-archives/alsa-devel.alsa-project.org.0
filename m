Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 651332B11FD
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Nov 2020 23:45:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 050101879;
	Thu, 12 Nov 2020 23:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 050101879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605221105;
	bh=qHNuKNXsoROQNlag1CH93aTErMkw+1jXa5vElriAIWs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HbJg2yx529Vdqg2Kz5OMPJclsxaQZtTiKZT0JootFGdZPVSYYpYiD2VtmnIPjv/Ew
	 J8ut8x5MsDDl/sq7TqnRu/fHJoEOdpcqr5xCkdPLOqF3NvYzSFY56n3dGpIGG5u0zv
	 32imzgZ6F4bxgP/Kh4UXm9fnfa8TJ1t5vzeBsn0Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A014F80524;
	Thu, 12 Nov 2020 23:39:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90BEEF804FB; Thu, 12 Nov 2020 23:39:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9FCFF804CB
 for <alsa-devel@alsa-project.org>; Thu, 12 Nov 2020 23:39:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9FCFF804CB
IronPort-SDR: 5Rh5VaPXxqcnV3Bs9TapFYI/GB4Vwpk2BHjD5tGCDC9RrJRWVFxvV+SsOt5tkVhDZAdNa0EX+e
 nTyJvgLRXy0w==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="166885018"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="166885018"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:39:01 -0800
IronPort-SDR: +5qd0d4wwTXVdf7N6kcHgxb8lQTRyz8CFl6IHywbf9HpN2rPOwLwGIc7B7DnQS5z/cOIpNE1R4
 gM3joHC5/E3Q==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="323797502"
Received: from gjshield-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.213.180.118])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 14:39:00 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/14] ASoC: SOF: Intel: allow for coexistence between SOF and
 catpt drivers
Date: Thu, 12 Nov 2020 16:38:24 -0600
Message-Id: <20201112223825.39765-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, broonie@kernel.org,
 Rander Wang <rander.wang@linux.intel.com>
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

Now that we have all the support needed for coexistence between ACPI
drivers for Broadwell, remove mutual exclusion in the Kconfig
file. The selection is done by playing with the snd_intel_dspcfg
module 'dsp_driver' parameter.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 59b35fa87e0e..084f5993f043 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -84,17 +84,18 @@ config SND_SOC_SOF_BAYTRAIL
 
 config SND_SOC_SOF_BROADWELL_SUPPORT
 	bool "SOF support for Broadwell"
-	depends on SND_SOC_INTEL_HASWELL=n
+	select SND_INTEL_DSP_CONFIG
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Broadwell processors.
-	  This option is mutually exclusive with the Haswell/Broadwell legacy
-	  driver. If you want to enable SOF on Broadwell you need to deselect
-	  the legacy driver first.
-	  SOF does not fully support Broadwell yet, so this option is not
-	  recommended for distros. At some point all legacy drivers will be
-	  deprecated but not before all userspace firmware/topology/UCM files
-	  are made available to downstream distros.
+	  This option can coexist in the same build with the default 'catpt'
+	  driver.
+	  Existing firmware/topology binaries and UCM configurations typically
+	  located in the root file system are already compatible with both SOF
+	  or catpt drivers.
+	  SOF does not fully support Broadwell and has limitations related to
+	  DMA and suspend-resume, this is not a recommended option for
+	  distributions.
 	  Say Y if you want to enable SOF on Broadwell.
 	  If unsure select "N".
 
-- 
2.25.1

