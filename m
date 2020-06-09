Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B300F1F3408
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 08:22:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F3C21678;
	Tue,  9 Jun 2020 08:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F3C21678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591683751;
	bh=yKCS/dqk/dAEYnZDVX29ttRIicPyiV8P00D8pgveCA8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E+zRLpS4lzVUT9FfJeyy1XlXJ5ksGdJABiC3yElWWdKU6nKoVIucU22arZKA4msSl
	 t8iN0H7J6cQMdOx+rxI1I5q+BoNJyP1VQpLSltX9/7iZtIkfPootMSiBsZgWZkJQOr
	 8onfW2aSajtOwsY3TgiO8b0r1tiN76qdXfdgVmok=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20ECEF802A1;
	Tue,  9 Jun 2020 08:19:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDC83F802A2; Tue,  9 Jun 2020 08:19:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8BFF9F80291
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 08:19:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8BFF9F80291
IronPort-SDR: me21AYB1iT7tdZX4uVdgn46J5M2LhvPdQnmG254izmvQFzvZh9kDExCKGmh4p+oLdJPD2C5SEr
 ebIwJgHdslmQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2020 23:19:45 -0700
IronPort-SDR: dJ03He+rOCJ6CM+Jy6c87kbTkSsOnuUQkx2UWJF7PB8wY3ABz4k4ygFPMXVNxgEcPkmMZo+31+
 +QBRz2JDQU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,490,1583222400"; d="scan'208";a="288728687"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by orsmga002.jf.intel.com with ESMTP; 08 Jun 2020 23:19:44 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v5 2/3] ASoC: Intel: Add makefiles and kconfig changes for
 KeemBay
Date: Tue,  9 Jun 2020 14:06:22 +0800
Message-Id: <1591682783-1923-3-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
References: <1591682783-1923-1-git-send-email-jee.heng.sia@intel.com>
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

Add makefile and kconfig changes for Intel KeemBay platform driver.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Signed-off-by: Sia Jee Heng <jee.heng.sia@intel.com>
---
 sound/soc/intel/Kconfig  | 7 +++++++
 sound/soc/intel/Makefile | 1 +
 2 files changed, 8 insertions(+)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index 36f5479..82805a8 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -240,6 +240,13 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
+config SND_SOC_INTEL_KEEMBAY
+	tristate "Keembay Platforms"
+	depends on ARM64 || COMPILE_TEST
+	depends on COMMON_CLK
+	help
+	  If you have a Intel Keembay platform then enable this option
+	  by saying Y or m.
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index e16d6dc..04ee482 100644
--- a/sound/soc/intel/Makefile
+++ b/sound/soc/intel/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_SND_SOC_INTEL_HASWELL) += haswell/
 obj-$(CONFIG_SND_SOC_INTEL_BAYTRAIL) += baytrail/
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += atom/
 obj-$(CONFIG_SND_SOC_INTEL_SKYLAKE) += skylake/
+obj-$(CONFIG_SND_SOC_INTEL_KEEMBAY) += keembay/
 
 # Machine support
 obj-$(CONFIG_SND_SOC) += boards/
-- 
1.9.1

