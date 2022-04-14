Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 112A7501B58
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:51:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5B4318BA;
	Thu, 14 Apr 2022 20:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5B4318BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962285;
	bh=rFwcUSwf8rO8Y817ZYM1DZyth1S4HDFgJ4ZJ/Y9mZVQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Pjpl+p3S9QS1wg8yRc85+AX/OfWxSS8PM2ONL/IhSW+B+ebyMaYPN7ZVxojPe5PkX
	 rIAvm104Kvl3GsEeMoX5vK33SYS4U0//9TwmsshADnRkKwigFbhvMfb3jQpkoF9fYR
	 EVNuLDxvvqynOi22+gExV/woHwj1+oWku8STpmr4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A85AF8052F;
	Thu, 14 Apr 2022 20:49:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B9E0F80536; Thu, 14 Apr 2022 20:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8EE9EF8051A
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8EE9EF8051A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bHjFrpp8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962135; x=1681498135;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rFwcUSwf8rO8Y817ZYM1DZyth1S4HDFgJ4ZJ/Y9mZVQ=;
 b=bHjFrpp8IFdsOZzjPtPmxiHAiOP37IYg1ASHIShDsUdDTJVUC6jO0D7a
 ZC6NIP0Y5UiR1ODDwDHA8IjLXwLjTBr81V2561IetWbbEGbCKYx73BFxm
 GF/cuo2ZoXkBFMn8sEXRHcUkSMpOu3Zw6J95w+HQ2GqXFBvhFH7tZ0zXk
 4WYjkAoKvnVyo4VMzP6kHUaLqgIqPNBy5Z539cc/cTRDVf/B2QCbsERAu
 k5ilSJGl8VejPYvlAv0CwZM60sTr4oVf1bfN+CgBvnBRh7GInxSp52kI4
 aEqK9rzEPuNCDFFuvP18a7n7129irIKd0vbvlkGWPSLKVMMZG8jr8Zn+k Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442342"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304622"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:36 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 05/15] ASoC: SOF: sof-pci-dev: add parameter to override
 firmware filename
Date: Thu, 14 Apr 2022 13:48:07 -0500
Message-Id: <20220414184817.362215-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
References: <20220414184817.362215-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Paul Olaru <paul.olaru@oss.nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
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

The existing 'fw_path' module parameter can be used to load alternate
firmware files, be it for development or to handle OEM-specific or
board-specific releases. The firmware name is however non-modifiable
and defined by platform-specific descriptors.

For additional flexibility during development or enable quirks, this
patch adds the 'fw_filename' module parameter to override default
firmware names.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 470c0ac4a4e0..15fffcdf6907 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -23,6 +23,10 @@ static char *fw_path;
 module_param(fw_path, charp, 0444);
 MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
 
+static char *fw_filename;
+module_param(fw_filename, charp, 0444);
+MODULE_PARM_DESC(fw_filename, "alternate filename for SOF firmware.");
+
 static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
@@ -175,7 +179,15 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 	sof_pdata->dev = dev;
 
 	sof_pdata->ipc_type = desc->ipc_default;
-	sof_pdata->fw_filename = desc->default_fw_filename[sof_pdata->ipc_type];
+
+	if (fw_filename) {
+		sof_pdata->fw_filename = fw_filename;
+
+		dev_dbg(dev, "Module parameter used, changed fw filename to %s\n",
+			sof_pdata->fw_filename);
+	} else {
+		sof_pdata->fw_filename = desc->default_fw_filename[sof_pdata->ipc_type];
+	}
 
 	/*
 	 * for platforms using the SOF community key, change the
-- 
2.30.2

