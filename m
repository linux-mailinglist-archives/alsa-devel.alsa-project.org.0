Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 704DF50A5DC
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:36:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAB431687;
	Thu, 21 Apr 2022 18:35:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAB431687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558963;
	bh=+eCpKmAzHZJpLltZlJ6ot5uHkJJKkG/ryxcxLBp7PDg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GgpzH10FiRTpJKKsjvSUrYTKiCgLIk+t2HoImI81Kgn5NXzeapUNOlMlyCjDD2hjJ
	 eq/Nhft0iqs88YtR0+oNz2uV1lQC+d42ebFXzfB8+CBst3FFCVKmos6l9uJ8I98o9F
	 5ceb5IoVDF9/26/3G7VXtdOYb80Hq0UdibVqmJX0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8002AF804FB;
	Thu, 21 Apr 2022 18:34:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0A257F804FE; Thu, 21 Apr 2022 18:34:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EFD28F80125
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:34:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EFD28F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fuNdWWqj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558860; x=1682094860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+eCpKmAzHZJpLltZlJ6ot5uHkJJKkG/ryxcxLBp7PDg=;
 b=fuNdWWqjCpF23F0evc6Dejf70jcYD+10taCZQWZNuFpX7rjWkU8X94Hd
 CoBGJQfQkXDTGLqMJHdfRG7Ort0vVAonyBaiv0BLh00AnoAtTWLvYGlRE
 zra1H71tFjNSUeoaoc1Tt2LQ3mg0xPmvtjnl1Z8ZFsZAQHkclaD8qcRfI
 wH82agSxnF6cGA65bLS995i0/LeM4Li/AiVPtLcZyqzr5oGyH3LRU8z54
 hmN3Izvsf4Ypy0vCq9ctRymrg6XuI+JLTQweg1GfCKZw6bdbHOe+QsR3b
 2zQHH1saiMo0iiWPdHsQ4CZJEwYqlQPwyZIkMh3dugjWwVFqkrcKVHHeb A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246310250"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="246310250"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:09 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="614980738"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:08 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/4] ASoC: SOF: sof-pci-dev: don't use the community key on
 APL Chromebooks
Date: Thu, 21 Apr 2022 11:33:55 -0500
Message-Id: <20220421163358.319489-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421163358.319489-1-pierre-louis.bossart@linux.intel.com>
References: <20220421163358.319489-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

As suggested by MrChromebox, the SOF driver can be used with the SOF
firmware binary signed with the production key. This patch adds an
additional check for the ApolloLake SoC before modifying the default
firmware path.

Note that ApolloLake Chromebooks officially ship with the Skylake
driver, so to use SOF the users have to explicitly opt-in with
'options intel-dspcfg dsp_driver=3'. There is no plan to change the
default selection.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 4d1b7e4ccd3d8..003120721779f 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -12,6 +12,7 @@
 #include <linux/dmi.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
@@ -40,6 +41,7 @@ module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
 MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
 static const char *sof_dmi_override_tplg_name;
+static bool sof_dmi_use_community_key;
 
 #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
 
@@ -102,15 +104,35 @@ static const struct dmi_system_id sof_tplg_table[] = {
 	{}
 };
 
+/* all Up boards use the community key */
+static int up_use_community_key(const struct dmi_system_id *id)
+{
+	sof_dmi_use_community_key = true;
+	return 1;
+}
+
+/*
+ * For ApolloLake Chromebooks we want to force the use of the Intel production key.
+ * All newer platforms use the community key
+ */
+static int chromebook_use_community_key(const struct dmi_system_id *id)
+{
+	if (!soc_intel_is_apl())
+		sof_dmi_use_community_key = true;
+	return 1;
+}
+
 static const struct dmi_system_id community_key_platforms[] = {
 	{
 		.ident = "Up boards",
+		.callback = up_use_community_key,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "AAEON"),
 		}
 	},
 	{
 		.ident = "Google Chromebooks",
+		.callback = chromebook_use_community_key,
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
 		}
@@ -208,7 +230,7 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 			"Module parameter used, changed fw path to %s\n",
 			sof_pdata->fw_filename_prefix);
 
-	} else if (dmi_check_system(community_key_platforms)) {
+	} else if (dmi_check_system(community_key_platforms) && sof_dmi_use_community_key) {
 		sof_pdata->fw_filename_prefix =
 			devm_kasprintf(dev, GFP_KERNEL, "%s/%s",
 				       sof_pdata->desc->default_fw_path[sof_pdata->ipc_type],
-- 
2.30.2

