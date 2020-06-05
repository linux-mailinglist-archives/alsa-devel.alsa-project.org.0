Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6441EF0DF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Jun 2020 07:28:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABA9E166E;
	Fri,  5 Jun 2020 07:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABA9E166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591334924;
	bh=dypPYZldkItkyyLdu/OKJjKDoJFjjvtn5dJO7H4V+Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qge7VIlS/0l5XwWXZJc1T0K5oH7AM0g+pvpclECMutpH1HpbkmlRaidwkcOv1xDzz
	 L5QNtIGydUdJUCUOo8XSbrc5bJWGI+kE1mwuT79UF4BifY8OdFd6lNPHKfWWbnLyfh
	 724ZtoFDjdMgx3yhEqNfWvrtuXBBpGCQQ2OzEwxc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60DF3F80292;
	Fri,  5 Jun 2020 07:26:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D87B6F801EC; Fri,  5 Jun 2020 07:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50E84F801ED
 for <alsa-devel@alsa-project.org>; Fri,  5 Jun 2020 07:22:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50E84F801ED
IronPort-SDR: XZIEs4R2JFi3Bs/jfk72p0hfWzvtBL77LupTy2kOUq6zozp8TW5yW61iQ04jXXGaWinpI0QcIA
 JsPtZ5zz0oVw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2020 22:22:12 -0700
IronPort-SDR: 6KuqAlQ4TVp8SbSg84s7X553dhtoKglyw9uMvNQpS9Ta8T7CB9n3B6u972WrJ1Q9HTu8sPrm8c
 DBTD0un+B+eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,475,1583222400"; d="scan'208";a="259091170"
Received: from unknown (HELO jsia-HP-Z620-Workstation.png.intel.com)
 ([10.221.118.135])
 by fmsmga008.fm.intel.com with ESMTP; 04 Jun 2020 22:22:11 -0700
From: Sia Jee Heng <jee.heng.sia@intel.com>
To: <alsa-devel@alsa-project.org>
Subject: [PATCH v4 2/3] ASoC: Intel: Add makefiles and kconfig changes for
 KeemBay
Date: Fri,  5 Jun 2020 13:08:56 +0800
Message-Id: <1591333737-3231-3-git-send-email-jee.heng.sia@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591333737-3231-1-git-send-email-jee.heng.sia@intel.com>
References: <1591333737-3231-1-git-send-email-jee.heng.sia@intel.com>
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
index c8de0bb..bc93448 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -244,6 +244,13 @@ config SND_SOC_ACPI_INTEL_MATCH
 
 endif ## SND_SOC_INTEL_SST_TOPLEVEL || SND_SOC_SOF_INTEL_TOPLEVEL
 
+config SND_SOC_INTEL_KEEMBAY
+	tristate "Keembay Platforms"
+	depends on OF && (ARM64 || COMPILE_TEST)
+	depends on COMMON_CLK
+	help
+	  If you have a Intel Keembay platform then enable this option
+	  by saying Y or m.
 
 # ASoC codec drivers
 source "sound/soc/intel/boards/Kconfig"
diff --git a/sound/soc/intel/Makefile b/sound/soc/intel/Makefile
index 8160520..f5aa32b 100644
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

