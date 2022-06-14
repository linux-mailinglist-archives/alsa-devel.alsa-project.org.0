Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9354AB35
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jun 2022 09:56:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1416016C9;
	Tue, 14 Jun 2022 09:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1416016C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655193414;
	bh=dKyAUI7CGEJAntXWQzAo2Ewcy/TCBwhvYmbAewxp+oc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gM+8Ufcv2PJEXlDqsMg3+uH/82fPjQYE8tNm11q13EBRmjmYbW/IYpfKxAHeLcZpt
	 xJ5a0gWesiGo1KtgWsjOoIowVg1dUyNaRWFsEMrRg+x/sQXGhkbAZ7gGhXSPgmcCqw
	 OmGAuIG2kGQAIe7W9N4kiIX8W3QsL2Fd74SUy2Zo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83728F80165;
	Tue, 14 Jun 2022 09:55:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DC28F80139; Tue, 14 Jun 2022 09:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1C40F8012B
 for <alsa-devel@alsa-project.org>; Tue, 14 Jun 2022 09:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1C40F8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CndgPcVY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655193346; x=1686729346;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dKyAUI7CGEJAntXWQzAo2Ewcy/TCBwhvYmbAewxp+oc=;
 b=CndgPcVY7ozLbPCW2qMESm1SDtanO3qTw2S5SklCUXq6xWT37u+ryRed
 5uDJPI4v6yiKlTTnnj5P5YwRxjuop6JF5zhZpVi0tiyDQVRRGlasi02at
 p06yyXyesGm/I2OR2yCb72AEFXnXuP/RQPxVPxwJzSsac6Og/dXQglUYA
 bXSQWBpVnCo5f4yCIJogA020O8YZ9XWIW+ZjP32vJgixsFNyAOUS6vPF6
 lJ5EuRutNMo7aYmggi2MKl0kmersuapFkKPoL5xNwS4CyffPlyW2QvS4Z
 bdgxaK7GxEQclVeeeOqRLqoxEEMqVbj11XVO2PMBYt6IADAm3gfI0Lzt+ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10377"; a="267230504"
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="267230504"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:55:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,299,1647327600"; d="scan'208";a="651894411"
Received: from gkuik-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.239])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2022 00:55:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: Compile and runtime IPC version selection
Date: Tue, 14 Jun 2022 10:56:17 +0300
Message-Id: <20220614075618.28605-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The new IPC4 version is only supported by Intel platforms, iMX, AMD and
MediaTek only uses the standard SOF IPC.
There is no need for these platforms to build kernel support for IPC4 as
it is just dead code for them.

SND_SOC_SOF_IPC3 and SND_SOC_SOF_INTEL_IPC4 is introduced to allow compile
time selection and exclusion of IPC implementations.

To avoid randconfig failures add also support for runtime selection of
the IPC ops in ipc.c based on sdev->pdata->ipc_type

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/Kconfig          |  7 +++++++
 sound/soc/sof/Makefile         | 16 ++++++++++++----
 sound/soc/sof/amd/Kconfig      |  1 +
 sound/soc/sof/imx/Kconfig      |  1 +
 sound/soc/sof/intel/Kconfig    | 11 +++++++++++
 sound/soc/sof/ipc.c            | 24 ++++++++++++++++++------
 sound/soc/sof/mediatek/Kconfig |  1 +
 7 files changed, 51 insertions(+), 10 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 4542868cd730..e90f173d067c 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -252,6 +252,13 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 	  When selected, the probe is handled in two steps, for example to
 	  avoid lockdeps if request_module is used in the probe.
 
+# Supported IPC versions
+config SND_SOC_SOF_IPC3
+	bool
+
+config SND_SOC_SOF_INTEL_IPC4
+	bool
+
 source "sound/soc/sof/amd/Kconfig"
 source "sound/soc/sof/imx/Kconfig"
 source "sound/soc/sof/intel/Kconfig"
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 2fa8088707a8..9a74ed116ed9 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -1,10 +1,18 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 
 snd-sof-objs := core.o ops.o loader.o ipc.o pcm.o pm.o debug.o topology.o\
-		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o\
-		ipc3-topology.o ipc3-control.o ipc3.o ipc3-pcm.o ipc3-loader.o\
-		ipc3-dtrace.o\
-		ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o
+		control.o trace.o iomem-utils.o sof-audio.o stream-ipc.o
+
+# IPC implementations
+ifneq ($(CONFIG_SND_SOC_SOF_IPC3),)
+snd-sof-objs +=	ipc3.o ipc3-loader.o ipc3-topology.o ipc3-control.o ipc3-pcm.o\
+		ipc3-dtrace.o
+endif
+ifneq ($(CONFIG_SND_SOC_SOF_INTEL_IPC4),)
+snd-sof-objs += ipc4.o ipc4-loader.o ipc4-topology.o ipc4-control.o ipc4-pcm.o
+endif
+
+# SOF client support
 ifneq ($(CONFIG_SND_SOC_SOF_CLIENT),)
 snd-sof-objs += sof-client.o
 endif
diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
index 085232e04582..190c85d57047 100644
--- a/sound/soc/sof/amd/Kconfig
+++ b/sound/soc/sof/amd/Kconfig
@@ -17,6 +17,7 @@ if SND_SOC_SOF_AMD_TOPLEVEL
 config SND_SOC_SOF_AMD_COMMON
 	tristate
 	select SND_SOC_SOF
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_PCI_DEV
 	select SND_AMD_ACP_CONFIG
 	select SND_SOC_ACPI if ACPI
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 9b8d5bb1e449..cc6e695f913a 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -15,6 +15,7 @@ config SND_SOC_SOF_IMX_COMMON
 	tristate
 	select SND_SOC_SOF_OF_DEV
 	select SND_SOC_SOF
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_XTENSA
 	select SND_SOC_SOF_COMPRESS
 	help
diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 0def2aa5581d..80cdc3788bbe 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -40,6 +40,7 @@ if SND_SOC_SOF_ACPI
 config SND_SOC_SOF_BAYTRAIL
 	tristate "SOF support for Baytrail, Braswell and Cherrytrail"
 	default SND_SOC_SOF_ACPI
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	select SND_SOC_SOF_ACPI_DEV
@@ -60,6 +61,7 @@ config SND_SOC_SOF_BAYTRAIL
 config SND_SOC_SOF_BROADWELL
 	tristate "SOF support for Broadwell"
 	default SND_SOC_SOF_ACPI
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_INTEL_COMMON
 	select SND_SOC_SOF_INTEL_HIFI_EP_IPC
 	select SND_SOC_SOF_ACPI_DEV
@@ -85,6 +87,7 @@ config SND_SOC_SOF_MERRIFIELD
 	tristate "SOF support for Tangier/Merrifield"
 	default SND_SOC_SOF_PCI
 	select SND_SOC_SOF_PCI_DEV
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_INTEL_ATOM_HIFI_EP
 	help
 	  This adds support for Sound Open Firmware for Intel(R) platforms
@@ -95,6 +98,8 @@ config SND_SOC_SOF_MERRIFIELD
 config SND_SOC_SOF_INTEL_APL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
+	select SND_SOC_SOF_IPC3
+	select SND_SOC_SOF_INTEL_IPC4
 
 config SND_SOC_SOF_APOLLOLAKE
 	tristate "SOF support for Apollolake"
@@ -120,6 +125,8 @@ config SND_SOC_SOF_INTEL_CNL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_SOF_IPC3
+	select SND_SOC_SOF_INTEL_IPC4
 
 config SND_SOC_SOF_CANNONLAKE
 	tristate "SOF support for Cannonlake"
@@ -154,6 +161,8 @@ config SND_SOC_SOF_INTEL_ICL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_SOF_IPC3
+	select SND_SOC_SOF_INTEL_IPC4
 
 config SND_SOC_SOF_ICELAKE
 	tristate "SOF support for Icelake"
@@ -179,6 +188,8 @@ config SND_SOC_SOF_INTEL_TGL
 	tristate
 	select SND_SOC_SOF_HDA_COMMON
 	select SND_SOC_SOF_INTEL_SOUNDWIRE_LINK_BASELINE
+	select SND_SOC_SOF_IPC3
+	select SND_SOC_SOF_INTEL_IPC4
 
 config SND_SOC_SOF_TIGERLAKE
 	tristate "SOF support for Tigerlake"
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index c5aef5fc056b..6ed3f9b6a0c4 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -155,12 +155,22 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 
 	init_waitqueue_head(&msg->waitq);
 
-	/*
-	 * Use IPC3 ops as it is the only available version now. With the addition of new IPC
-	 * versions, this will need to be modified to use the selected version at runtime.
-	 */
-	ipc->ops = &ipc3_ops;
-	ops = ipc->ops;
+	switch (sdev->pdata->ipc_type) {
+#if defined(CONFIG_SND_SOC_SOF_IPC3)
+	case SOF_IPC:
+		ops = &ipc3_ops;
+		break;
+#endif
+#if defined(CONFIG_SND_SOC_SOF_INTEL_IPC4)
+	case SOF_INTEL_IPC4:
+		ops = &ipc4_ops;
+		break;
+#endif
+	default:
+		dev_err(sdev->dev, "Not supported IPC version: %d\n",
+			sdev->pdata->ipc_type);
+		return NULL;
+	}
 
 	/* check for mandatory ops */
 	if (!ops->tx_msg || !ops->rx_msg || !ops->set_get_data || !ops->get_reply) {
@@ -190,6 +200,8 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 		return NULL;
 	}
 
+	ipc->ops = ops;
+
 	return ipc;
 }
 EXPORT_SYMBOL(snd_sof_ipc_init);
diff --git a/sound/soc/sof/mediatek/Kconfig b/sound/soc/sof/mediatek/Kconfig
index a149dd1b3f44..4a2eddf6009a 100644
--- a/sound/soc/sof/mediatek/Kconfig
+++ b/sound/soc/sof/mediatek/Kconfig
@@ -15,6 +15,7 @@ config SND_SOC_SOF_MTK_COMMON
 	tristate
 	select SND_SOC_SOF_OF_DEV
 	select SND_SOC_SOF
+	select SND_SOC_SOF_IPC3
 	select SND_SOC_SOF_XTENSA
 	select SND_SOC_SOF_COMPRESS
 	help
-- 
2.36.1

