Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 265807A5FE9
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 12:45:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64A7AE80;
	Tue, 19 Sep 2023 12:44:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64A7AE80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695120311;
	bh=HtIEPSNCZ0GMAkqVZj8+LiaPlfdUAVqALLayse+bb7I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Qs3gA0qTs39b86683+87cTL8cWtS8Zyk3/gn+v0xpK7rJ7GQm9CuwKNwSxS7V7HIu
	 VGPpceUrBkBKfKf6XQ/w/UdXLL+XQ0qjGK6e+FBPXFe5A+tSObWWl32lsR2uWfKvO1
	 WiuhJPP9C7p/tdZJxmGkEuxMzoILvmiUQ8zE91Ec=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F237FF805BF; Tue, 19 Sep 2023 12:42:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54471F805B3;
	Tue, 19 Sep 2023 12:42:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 88DF7F805A8; Tue, 19 Sep 2023 12:42:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EDB59F8055A
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 12:42:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDB59F8055A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=U56uSWH2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695120158; x=1726656158;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HtIEPSNCZ0GMAkqVZj8+LiaPlfdUAVqALLayse+bb7I=;
  b=U56uSWH29KjdylXgonbijU+woFA0Prh7fNBj+DRODeJ8Q/xyMTw6cFKc
   ij07jBddLXEN1bdEQd1IBmeczcbaQZpGrvQbnV4HTAl/g8BH754LAQC3s
   L6TCvl2df9lmVh9MdkGPrkPTA+P5lSJ6b4aLImp9tGiSY78v7hoSOajJT
   2e73bMROIlhO4yPYhPQC4OwPPVyy4AMuW+k5/jfMknjYy+P7ZlrdGbCZp
   WVf+U+BmWq8/eFImZ1cprXVkQb3Yo3ItcxZwOSLKyc6tybcPPDH7doDv9
   30LM1eREnCek9cCtRRwrqULNh+NVR/MUiY3g0U6PYM2U9xqilxOdGohrO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382658483"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="382658483"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="722823273"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000";
   d="scan'208";a="722823273"
Received: from mokashi-mobl1.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.50.26])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 03:42:32 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	daniel.baluta@nxp.com,
	rander.wang@intel.com
Subject: [PATCH 5/9] ASoC: SOF: amd: Use generic names for IPC types
Date: Tue, 19 Sep 2023 13:42:22 +0300
Message-ID: <20230919104226.32239-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
References: <20230919104226.32239-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WF6FCIGAUN7BGXYJUQNDIHBDBZCGKOFD
X-Message-ID-Hash: WF6FCIGAUN7BGXYJUQNDIHBDBZCGKOFD
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WF6FCIGAUN7BGXYJUQNDIHBDBZCGKOFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the new SOF_IPC_TYPE_3 in core code.

No functional changes, just renaming.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/amd/pci-rmb.c     | 10 +++++-----
 sound/soc/sof/amd/pci-rn.c      | 10 +++++-----
 sound/soc/sof/amd/pci-vangogh.c | 10 +++++-----
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/amd/pci-rmb.c b/sound/soc/sof/amd/pci-rmb.c
index 9935e457b467..72e211b5f7a4 100644
--- a/sound/soc/sof/amd/pci-rmb.c
+++ b/sound/soc/sof/amd/pci-rmb.c
@@ -47,16 +47,16 @@ static const struct sof_dev_desc rembrandt_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info		= &rembrandt_chip_info,
-	.ipc_supported_mask     = BIT(SOF_IPC),
-	.ipc_default            = SOF_IPC,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
+	.ipc_default            = SOF_IPC_TYPE_3,
 	.default_fw_path	= {
-		[SOF_IPC] = "amd/sof",
+		[SOF_IPC_TYPE_3] = "amd/sof",
 	},
 	.default_tplg_path	= {
-		[SOF_IPC] = "amd/sof-tplg",
+		[SOF_IPC_TYPE_3] = "amd/sof-tplg",
 	},
 	.default_fw_filename	= {
-		[SOF_IPC] = "sof-rmb.ri",
+		[SOF_IPC_TYPE_3] = "sof-rmb.ri",
 	},
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_rembrandt_ops,
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index c72d5d8aff8e..a0195e9b400c 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -47,16 +47,16 @@ static const struct sof_dev_desc renoir_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info		= &renoir_chip_info,
-	.ipc_supported_mask	= BIT(SOF_IPC),
-	.ipc_default		= SOF_IPC,
+	.ipc_supported_mask	= BIT(SOF_IPC_TYPE_3),
+	.ipc_default		= SOF_IPC_TYPE_3,
 	.default_fw_path = {
-		[SOF_IPC] = "amd/sof",
+		[SOF_IPC_TYPE_3] = "amd/sof",
 	},
 	.default_tplg_path = {
-		[SOF_IPC] = "amd/sof-tplg",
+		[SOF_IPC_TYPE_3] = "amd/sof-tplg",
 	},
 	.default_fw_filename	= {
-		[SOF_IPC] = "sof-rn.ri",
+		[SOF_IPC_TYPE_3] = "sof-rn.ri",
 	},
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_renoir_ops,
diff --git a/sound/soc/sof/amd/pci-vangogh.c b/sound/soc/sof/amd/pci-vangogh.c
index d8be42fbcb6d..5cd3ac84752f 100644
--- a/sound/soc/sof/amd/pci-vangogh.c
+++ b/sound/soc/sof/amd/pci-vangogh.c
@@ -45,16 +45,16 @@ static const struct sof_dev_desc vangogh_desc = {
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
 	.chip_info		= &vangogh_chip_info,
-	.ipc_supported_mask     = BIT(SOF_IPC),
-	.ipc_default            = SOF_IPC,
+	.ipc_supported_mask     = BIT(SOF_IPC_TYPE_3),
+	.ipc_default            = SOF_IPC_TYPE_3,
 	.default_fw_path	= {
-		[SOF_IPC] = "amd/sof",
+		[SOF_IPC_TYPE_3] = "amd/sof",
 	},
 	.default_tplg_path	= {
-		[SOF_IPC] = "amd/sof-tplg",
+		[SOF_IPC_TYPE_3] = "amd/sof-tplg",
 	},
 	.default_fw_filename	= {
-		[SOF_IPC] = "sof-vangogh.ri",
+		[SOF_IPC_TYPE_3] = "sof-vangogh.ri",
 	},
 	.nocodec_tplg_filename	= "sof-acp.tplg",
 	.ops			= &sof_vangogh_ops,
-- 
2.42.0

