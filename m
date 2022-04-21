Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 835BC50A5DB
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 18:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E28F81673;
	Thu, 21 Apr 2022 18:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E28F81673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650558952;
	bh=OQ+J5CYYBD+AcM38OvInWnOyTTvb654BNUyl10jzizg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OpMHaFMEUwYk/keosga19g/9vCQbdv91/KNRxFZ0sD/RFb+z4MwllB8SuYL38K42z
	 R61sask0clkvD3wE+FtheHu7ylAbvj/+ReOP0iWXhwV1A7tFZ4nnKyVB8RQxJYVbc5
	 MewvwWUItPXFaFHHVqbWAJ9tWRPuYSJnp56k4zYs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B515F80125;
	Thu, 21 Apr 2022 18:34:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 91F0BF800C1; Thu, 21 Apr 2022 18:34:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F1D5F800C1
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 18:34:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F1D5F800C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="AkdWPzOZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650558862; x=1682094862;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OQ+J5CYYBD+AcM38OvInWnOyTTvb654BNUyl10jzizg=;
 b=AkdWPzOZK8SXvzcLUS/XmhVml7XhpBHKsRCvJPx+HzydE2QxlAp61IJv
 A1IK7l6mJVhMYSzC5n9De1VFaFPptZDx2DucY4ZZSbcgPMS7TmwlBSWGZ
 9gA8++1UAGwjfUxZjqipOJFoEVZn00El9rQbFDLE4Z5RQQC/IPpgeq07M
 E1n8maJi9CpPoe93cvsEQqNoD98TbLPLKlhhysHMfv4t+eWCAkfV/rr9P
 q+kszDtfG9vz2H2XM7C222dkBewz+qw/0S6Mr8TU6WwVMBoMwR+PICRik
 dtGQVLPQstY3J7Y3014Z+XplSSUSSTJaHUZ0TGG6uehvg3KRYZK1/yd0s A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="246310264"
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="246310264"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,279,1643702400"; d="scan'208";a="614980751"
Received: from qingsu-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.148.250])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 09:34:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASOC: SOF: pci: add ipc_type override for Intel IPC4 tests
Date: Thu, 21 Apr 2022 11:33:56 -0500
Message-Id: <20220421163358.319489-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421163358.319489-1-pierre-louis.bossart@linux.intel.com>
References: <20220421163358.319489-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Rander Wang <rander.wang@intel.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

Add a kernel module parameter for select the non-default IPC type.

This should only be used by developers with access to firmware and
topology files, typically Intel and partners.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/core.c        |  7 +++++++
 sound/soc/sof/sof-pci-dev.c | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index d981a1c3fb057..04b0cf3c822f9 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -358,6 +358,13 @@ int snd_sof_device_probe(struct device *dev, struct snd_sof_pdata *plat_data)
 	sdev->first_boot = true;
 	dev_set_drvdata(dev, sdev);
 
+	/* check IPC support */
+	if (!(BIT(plat_data->ipc_type) & plat_data->desc->ipc_supported_mask)) {
+		dev_err(dev, "ipc_type %d is not supported on this platform, mask is %#x\n",
+			plat_data->ipc_type, plat_data->desc->ipc_supported_mask);
+		return -EINVAL;
+	}
+
 	/* init ops, if necessary */
 	ret = sof_ops_init(sdev);
 	if (ret < 0)
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 003120721779f..cd90da7c92c24 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -40,6 +40,10 @@ static int sof_pci_debug;
 module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
 MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
+static int sof_pci_ipc_type = -1;
+module_param_named(ipc_type, sof_pci_ipc_type, int, 0444);
+MODULE_PARM_DESC(ipc_type, "SOF IPC type (0): SOF, (1) Intel CAVS");
+
 static const char *sof_dmi_override_tplg_name;
 static bool sof_dmi_use_community_key;
 
@@ -206,6 +210,23 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 
 	sof_pdata->ipc_type = desc->ipc_default;
 
+	if (sof_pci_ipc_type < 0) {
+		sof_pdata->ipc_type = desc->ipc_default;
+	} else {
+		dev_info(dev, "overriding default IPC %d to requested %d\n",
+			 desc->ipc_default, sof_pci_ipc_type);
+		if (sof_pci_ipc_type >= SOF_IPC_TYPE_COUNT) {
+			dev_err(dev, "invalid request value %d\n", sof_pci_ipc_type);
+			return -EINVAL;
+		}
+		if (!(BIT(sof_pci_ipc_type) & desc->ipc_supported_mask)) {
+			dev_err(dev, "invalid request value %d, supported mask is %#x\n",
+				sof_pci_ipc_type, desc->ipc_supported_mask);
+			return -EINVAL;
+		}
+		sof_pdata->ipc_type = sof_pci_ipc_type;
+	}
+
 	if (fw_filename) {
 		sof_pdata->fw_filename = fw_filename;
 
-- 
2.30.2

