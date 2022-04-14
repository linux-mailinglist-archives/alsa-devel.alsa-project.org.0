Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B120501B59
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Apr 2022 20:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2067218D5;
	Thu, 14 Apr 2022 20:50:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2067218D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649962296;
	bh=q7s9ESShOKhjo63kEE17W++rmi2d2CYKe+cnM5oWdpI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrJAO3ZOT3/fozq+V5BfqHO9NQWOHQ/Z9YiaZVOB8C/HiGfPU5JsHZZIogHxcIjdm
	 XVmPch+LMcvArBBOB+Aaw594XRqxDuHEwwom/FWRj5azJbrLotwGdDkZdQc2Hv/NVP
	 zf88WW6hxVD4Np2Tq8xrcjI3TvOCJMBCagC5i5tM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D135F80552;
	Thu, 14 Apr 2022 20:49:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE466F8053A; Thu, 14 Apr 2022 20:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77E03F80527
 for <alsa-devel@alsa-project.org>; Thu, 14 Apr 2022 20:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E03F80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X8huQw2e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649962136; x=1681498136;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q7s9ESShOKhjo63kEE17W++rmi2d2CYKe+cnM5oWdpI=;
 b=X8huQw2ebGYdSjWxYHRQy7U81EezkjdRJR84B8iY/w+nt9C5j0QHgWuk
 tCSwNrWdb1OlALl4zQBZIqUNi0JInWw5kQ8+M3sPFv0oW1LhpOHkCzUKo
 1/2lBJh0oR865imiOK7WbCnCAi/pVL0eQmLz2f3GpbUqx78ysxZuBSwng
 3+yiTFftEoYmjs8dO4AywWTB8esRN3V2YEhUQuD1g4Tpxu91hdi3f77Uf
 I+TvOapMD+8cxqId1aGMUDx0B+0+DSw6m0Fyz2vSkd9xi13hKIQi1P0nZ
 BlFrGVbf6c/uSV1js5KPfYFlEMRlBvtTXvj6K2gBqpHToe4GsASby/nC0 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="349442345"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="349442345"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:38 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="560304625"
Received: from rrsolima-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.252.130.212])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 11:48:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 06/15] ASoC: SOF: sof-pci-dev: add parameter to override
 topology filename
Date: Thu, 14 Apr 2022 13:48:08 -0500
Message-Id: <20220414184817.362215-7-pierre-louis.bossart@linux.intel.com>
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

The existing 'tplg_path' module parameter can be used to load
alternate firmware files, be it for development or to handle
OEM-specific or board-specific releases. However the topology filename
is either hard-coded in machine descriptors or modified by specific
DMI-quirks.

For additional flexibility, this patch adds the 'tplg_filename' module
parameter to override topology names.

To avoid any confusion between DMI- and parameter-override, a variable
rename is added.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/sof-pci-dev.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index 15fffcdf6907..4d1b7e4ccd3d 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -31,17 +31,21 @@ static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
 
+static char *tplg_filename;
+module_param(tplg_filename, charp, 0444);
+MODULE_PARM_DESC(tplg_filename, "alternate filename for SOF topology.");
+
 static int sof_pci_debug;
 module_param_named(sof_pci_debug, sof_pci_debug, int, 0444);
 MODULE_PARM_DESC(sof_pci_debug, "SOF PCI debug options (0x0 all off)");
 
-static const char *sof_override_tplg_name;
+static const char *sof_dmi_override_tplg_name;
 
 #define SOF_PCI_DISABLE_PM_RUNTIME BIT(0)
 
 static int sof_tplg_cb(const struct dmi_system_id *id)
 {
-	sof_override_tplg_name = id->driver_data;
+	sof_dmi_override_tplg_name = id->driver_data;
 	return 1;
 }
 
@@ -224,9 +228,20 @@ int sof_pci_probe(struct pci_dev *pci, const struct pci_device_id *pci_id)
 		sof_pdata->tplg_filename_prefix =
 			sof_pdata->desc->default_tplg_path[sof_pdata->ipc_type];
 
-	dmi_check_system(sof_tplg_table);
-	if (sof_override_tplg_name)
-		sof_pdata->tplg_filename = sof_override_tplg_name;
+	/*
+	 * the topology filename will be provided in the machine descriptor, unless
+	 * it is overridden by a module parameter or DMI quirk.
+	 */
+	if (tplg_filename) {
+		sof_pdata->tplg_filename = tplg_filename;
+
+		dev_dbg(dev, "Module parameter used, changed tplg filename to %s\n",
+			sof_pdata->tplg_filename);
+	} else {
+		dmi_check_system(sof_tplg_table);
+		if (sof_dmi_override_tplg_name)
+			sof_pdata->tplg_filename = sof_dmi_override_tplg_name;
+	}
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_pci_probe_complete;
-- 
2.30.2

