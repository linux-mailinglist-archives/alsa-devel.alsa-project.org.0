Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FFA602B60
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:12:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 602FD9CCF;
	Tue, 18 Oct 2022 14:11:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 602FD9CCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095151;
	bh=2xuMYsXyVmMBdsaMO//uDSCpQL/VZPCattQaQD7iJQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfEsvlqgSGlHmJOyi0WWbe4vUXz5ouwWY1BGnIfHdMOrgZpPxb/yfcSq3vbRv19pl
	 Xx8ssLYzcokI1w22VAYB/FgodQSJxtdsC3Z1WYqr40DoGcKCS5CUeBr95ahEKBz0kz
	 HDlGX+p428dA15JNLl/1cUOuw01qI0yUkmHQCbI4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78AF9F80589;
	Tue, 18 Oct 2022 14:09:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA731F80589; Tue, 18 Oct 2022 14:09:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 205F7F80579
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 205F7F80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="iKlSn7Vl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094968; x=1697630968;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2xuMYsXyVmMBdsaMO//uDSCpQL/VZPCattQaQD7iJQM=;
 b=iKlSn7Vl9GXnAsmSW6NtVhzCQ2OyMqqYNG73bekWnHtJK6BJ32rNkT7C
 oaY06Llbl0QYASHX28HlA0CLVTNohyaeVLT9H/SG12dJgeUBLS4rSprbA
 6a03FYYAPLLeYJCZRPtWVoqk/+2W+MlwOEwTKTyrGPRSFXKFX6Ook+59J
 ERz6rmXYFgxdtZJeDysFIZ4gq3mosTMblBGucbSHjjPjsHw0duZMDRCD4
 phWY9/bN+zCQZKD31ePgq+tujgKXOWaY0YKA73qCYr4RNYrdmQ2Fdodfh
 mA4E4fDfN/bWleeIRcvXu/3tc+d5zBNqNyOYWH1K3k323BsiJ1CBv7v6G g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452973"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452973"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:24 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757957"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757957"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:22 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 11/19] ASoC: SOF: Add path definition for external firmware
 libraries
Date: Tue, 18 Oct 2022 15:09:08 +0300
Message-Id: <20221018120916.19820-12-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

IPC4 based firmware supports dynamically loaded external libraries.
The libraries will be not stored alongside of the firmware or tplg files.

For intel platforms the default path will be:
intel/avs-lib|sof-ipc4-lib/<platform>/ if a community key is used on the
given machine then the libraries will be under 'community' directory, like
it is done for the firmware itself.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/sof.h         |  6 +++++-
 sound/soc/sof/sof-pci-dev.c | 26 ++++++++++++++++++++++++++
 2 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index e1f2f02666a7..266e66318f9c 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -82,6 +82,9 @@ struct snd_sof_pdata {
 	const char *tplg_filename_prefix;
 	const char *tplg_filename;
 
+	/* loadable external libraries available under this directory */
+	const char *fw_lib_prefix;
+
 	/* machine */
 	struct platform_device *pdev_mach;
 	const struct snd_soc_acpi_mach *machine;
@@ -127,8 +130,9 @@ struct sof_dev_desc {
 	unsigned int ipc_supported_mask;
 	enum sof_ipc_type ipc_default;
 
-	/* defaults paths for firmware and topology files */
+	/* defaults paths for firmware, library and topology files */
 	const char *default_fw_path[SOF_IPC_TYPE_COUNT];
+	const char *default_lib_path[SOF_IPC_TYPE_COUNT];
 	const char *default_tplg_path[SOF_IPC_TYPE_COUNT];
 
 	/* default firmware name */
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 643fd1036d60..f5ece43d0ec2 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -28,6 +28,10 @@ static char *fw_filename;
 module_param(fw_filename, charp, 0444);
 MODULE_PARM_DESC(fw_filename, "alternate filename for SOF firmware.");
 
+static char *lib_path;
+module_param(lib_path, charp, 0444);
+MODULE_PARM_DESC(lib_path, "alternate path for SOF firmware libraries.");
+
 static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
@@ -272,6 +276,28 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			sof_pdata->desc->default_fw_path[sof_pdata->ipc_type];
 	}
 
+	if (lib_path) {
+		sof_pdata->fw_lib_prefix = lib_path;
+
+		dev_dbg(dev, "Module parameter used, changed fw_lib path to %s\n",
+			sof_pdata->fw_lib_prefix);
+
+	} else if (sof_pdata->desc->default_lib_path[sof_pdata->ipc_type]) {
+		if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
+			sof_pdata->fw_lib_prefix =
+				devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
+					sof_pdata->desc->default_lib_path[sof_pdata->ipc_type],
+					"community");
+
+			dev_dbg(dev,
+				"Platform uses community key, changed fw_lib path to %s\n",
+				sof_pdata->fw_lib_prefix);
+		} else {
+			sof_pdata->fw_lib_prefix =
+				sof_pdata->desc->default_lib_path[sof_pdata->ipc_type];
+		}
+	}
+
 	if (tplg_path)
 		sof_pdata->tplg_filename_prefix = tplg_path;
 	else
-- 
2.38.0

