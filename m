Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 094DE28B1CB
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 11:52:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91DAC168D;
	Mon, 12 Oct 2020 11:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91DAC168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602496327;
	bh=xBnQLmKoOiCSCehIkTpRdj+229dUCdYnznFyATQkI2E=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iKMDxgF+qW8uEwk1iyRXps+ylWNB3+mYFy530HqzgSATT4MgIjaSLlp2+yUe0FRZG
	 IwAfSB56RgHUf6iJE8bWbg6JqPoDbB050slrLA3vTQIn2F2nwfQMv4kSvxCn00B64M
	 F/mH3RwX3y7jLGP2tB5hd6iHO54BDsS/CGCG2yUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FF7FF80141;
	Mon, 12 Oct 2020 11:50:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA565F800F6; Mon, 12 Oct 2020 11:50:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A18DBF800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 11:50:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A18DBF800F6
IronPort-SDR: pvvqz+r6nP8BwN3Px65p63a+T4l9K3ZpwNwiOC+VBspjVNuq+Arpd8xceDybsRNdqD83f1Mpse
 2PycyngSVj4g==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="152642111"
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="152642111"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2020 02:50:12 -0700
IronPort-SDR: 34RnFMyEoJZyUGgLLrbpHAWAJN4rlnviFpCPpkGsDXlgsnkRxKPMwt0Dg5DjojUSrHKiiG99b/
 aGFQ9K90Zf5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,366,1596524400"; d="scan'208";a="317867894"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 12 Oct 2020 02:50:10 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: atom: Remove duplicate kconfigs
Date: Mon, 12 Oct 2020 11:50:05 +0200
Message-Id: <20201012095005.29859-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: pierre-louis.bossart@linux.intel.com,
 Cezary Rojewski <cezary.rojewski@intel.com>, lgirdwood@gmail.com,
 tiwai@suse.com, hdegoede@redhat.com, vkoul@kernel.org, broonie@kernel.org
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

SND_SST_IPC and its _PCI and _ACPI variants all target
sound/soc/intel/atom solution alone. SND_SST_IPC is the core component,
required for PCI and ACPI based atom platforms both. _PCI and _ACPI
target Merrifield/Edison and Baytrial/Cherrytrail platforms
respectively.

On top of that, there is an equivalent set of configs targeting the same
solution:
- SND_SST_ATOM_HIFI2_PLATFORM (core)
- SND_SST_ATOM_HIFI2_PLATFORM_PCI
- SND_SST_ATOM_HIFI2_PLATFORM_ACPI

As both sets do the same job - allow for granular platform selection -
remove the duplicate set and rely on SND_SST_ATOM_HIFI2_PLATOFRM_XXX
configs alone.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/Kconfig           | 18 ------------------
 sound/soc/intel/atom/Makefile     |  2 +-
 sound/soc/intel/atom/sst/Makefile |  6 +++---
 3 files changed, 4 insertions(+), 22 deletions(-)

diff --git a/sound/soc/intel/Kconfig b/sound/soc/intel/Kconfig
index d5bae5d1ab6f..a5b446d5af19 100644
--- a/sound/soc/intel/Kconfig
+++ b/sound/soc/intel/Kconfig
@@ -15,22 +15,6 @@ config SND_SOC_INTEL_SST_TOPLEVEL
 
 if SND_SOC_INTEL_SST_TOPLEVEL
 
-config SND_SST_IPC
-	tristate
-	# This option controls the IPC core for HiFi2 platforms
-
-config SND_SST_IPC_PCI
-	tristate
-	select SND_SST_IPC
-	# This option controls the PCI-based IPC for HiFi2 platforms
-	#  (Medfield, Merrifield).
-
-config SND_SST_IPC_ACPI
-	tristate
-	select SND_SST_IPC
-	# This option controls the ACPI-based IPC for HiFi2 platforms
-	# (Baytrail, Cherrytrail)
-
 config SND_SOC_INTEL_SST
 	tristate
 
@@ -57,7 +41,6 @@ config SND_SST_ATOM_HIFI2_PLATFORM
 config SND_SST_ATOM_HIFI2_PLATFORM_PCI
 	tristate "PCI HiFi2 (Merrifield) Platforms"
 	depends on X86 && PCI
-	select SND_SST_IPC_PCI
 	select SND_SST_ATOM_HIFI2_PLATFORM
 	help
 	  If you have a Intel Merrifield/Edison platform, then
@@ -70,7 +53,6 @@ config SND_SST_ATOM_HIFI2_PLATFORM_ACPI
 	tristate "ACPI HiFi2 (Baytrail, Cherrytrail) Platforms"
 	default ACPI
 	depends on X86 && ACPI && PCI
-	select SND_SST_IPC_ACPI
 	select SND_SST_ATOM_HIFI2_PLATFORM
 	select SND_SOC_ACPI_INTEL_MATCH
 	select IOSF_MBI
diff --git a/sound/soc/intel/atom/Makefile b/sound/soc/intel/atom/Makefile
index a9326d5ec44c..c66f03f5d8d6 100644
--- a/sound/soc/intel/atom/Makefile
+++ b/sound/soc/intel/atom/Makefile
@@ -6,4 +6,4 @@ snd-soc-sst-atom-hifi2-platform-objs :=	sst-mfld-platform-pcm.o \
 obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += snd-soc-sst-atom-hifi2-platform.o
 
 # DSP driver
-obj-$(CONFIG_SND_SST_IPC) += sst/
+obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += sst/
diff --git a/sound/soc/intel/atom/sst/Makefile b/sound/soc/intel/atom/sst/Makefile
index f17c905df3e2..5761d30a5f9d 100644
--- a/sound/soc/intel/atom/sst/Makefile
+++ b/sound/soc/intel/atom/sst/Makefile
@@ -3,6 +3,6 @@ snd-intel-sst-core-objs := sst.o sst_ipc.o sst_stream.o sst_drv_interface.o sst_
 snd-intel-sst-pci-objs += sst_pci.o
 snd-intel-sst-acpi-objs += sst_acpi.o
 
-obj-$(CONFIG_SND_SST_IPC) += snd-intel-sst-core.o
-obj-$(CONFIG_SND_SST_IPC_PCI) += snd-intel-sst-pci.o
-obj-$(CONFIG_SND_SST_IPC_ACPI) += snd-intel-sst-acpi.o
+obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM) += snd-intel-sst-core.o
+obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_PCI) += snd-intel-sst-pci.o
+obj-$(CONFIG_SND_SST_ATOM_HIFI2_PLATFORM_ACPI) += snd-intel-sst-acpi.o
-- 
2.17.1

