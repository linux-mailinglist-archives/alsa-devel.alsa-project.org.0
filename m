Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FACEC7DA
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Nov 2019 18:35:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E6D8237B;
	Fri,  1 Nov 2019 18:34:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E6D8237B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572629730;
	bh=zOIvSYemcG1OVw70X5pClyeczinuMJ7MCwQbuE588D4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iHWWxT9NNgmRGGlssFLe7t60uj6LUeHGQKWCQA4+7r4vJ6sp1c0WuLnLdrEM/cEWG
	 45/jWk7iOvwdp+aJjsSOPaMD+ZjbENtlbBG6OpHSnl9q5T3PSKi9MmgzlvjVmGpQzp
	 grcsTp7CDOSh1FWIY0r3EwGYs7B/hvyHvBkds6uU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95E4BF80635;
	Fri,  1 Nov 2019 18:31:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF5B7F80611; Fri,  1 Nov 2019 18:31:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49660F8015A
 for <alsa-devel@alsa-project.org>; Fri,  1 Nov 2019 18:30:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49660F8015A
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Nov 2019 10:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,256,1569308400"; d="scan'208";a="206457405"
Received: from ggarreto-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.255.92.243])
 by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2019 10:30:54 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri,  1 Nov 2019 12:30:35 -0500
Message-Id: <20191101173045.27099-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
References: <20191101173045.27099-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 01/11] ASoC: SOF: Intel: Baytrail: clarify
	mutual exclusion with Atom/SST driver
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

Some distros select all options blindly, which leads to confusion and
bug reports. Since SOF does not support Baytrail-CR for now, and
UCM/topology files are still being propagated to downstream distros,
make SOF on Baytrail an opt-in option that first require distros to
opt-out of existing defaults.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/Kconfig     |  3 +++
 sound/soc/sof/intel/Kconfig | 10 +++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 3f9e65c10d5b..9376d72663ea 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -101,6 +101,9 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 	  If you have a Intel Baytrail or Cherrytrail platform with an I2S
 	  codec, then enable this option by saying Y or m. This is a
 	  recommended option
+	  This option is mutually exclusive with the SOF support on
+	  Baytrail/Cherrytrail. If you want to enable SOF on
+	  Baytrail/Cherrytrail, you need to deselect this option first.
 
 config SND_SOC_INTEL_SKYLAKE
 	tristate "All Skylake/SST Platforms"
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 36180af5c0aa..8f44b1e9c6bd 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -62,10 +62,18 @@ if SND_SOC_SOF_INTEL_ACPI
 
 config SND_SOC_SOF_BAYTRAIL_SUPPORT
 	bool "SOF support for Baytrail, Braswell and Cherrytrail"
+	depends on SND_SST_ATOM_HIFI2_PLATFORM_ACPI=n
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
 	  using the Baytrail, Braswell or Cherrytrail processors.
-	  Say Y if you have such a device.
+	  This option is mutually exclusive with the Atom/SST and Baytrail
+	  legacy drivers. If you want to enable SOF on Baytrail/Cherrytrail,
+	  you need to deselect those options first.
+	  SOF does not support Baytrail-CR for now, so this option is not
+	  recommended for distros. At some point all legacy drivers will be
+	  deprecated but not before all userspace firmware/topology/UCM files
+	  are made available to downstream distros.
+	  Say Y if you want to enable SOF on Baytrail/Cherrytrail
 	  If unsure select "N".
 
 config SND_SOC_SOF_BAYTRAIL
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
