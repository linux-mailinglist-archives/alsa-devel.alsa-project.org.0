Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A82605763F1
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 16:57:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46F9F210;
	Fri, 15 Jul 2022 16:56:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46F9F210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657897027;
	bh=/7ig4T9skUCX5/C8/ne9Ot00IKkPW7tDkMbA+IgtA04=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fMLgE2uyRNbGWjEGtZtGyxi17Jup+pwkMOt8/rIlEoERHfrP3uwqhe4f8jaTeYTwe
	 qNQrI2TYlk1veKMEbhrcwfyyZpJvelw8JGYf7iSzMwK2AD8fyNhYxZKsaeMELaobkJ
	 LtOQlGAXuobb7EGBTpMRBSfCrGWvgaL/MJhxiyhQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78621F805B2;
	Fri, 15 Jul 2022 16:53:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 346ABF8053D; Fri, 15 Jul 2022 16:53:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9AF15F8053D
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 16:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9AF15F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ZArckl4B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657896778; x=1689432778;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/7ig4T9skUCX5/C8/ne9Ot00IKkPW7tDkMbA+IgtA04=;
 b=ZArckl4BHfFrOjg3Uv1DfRZcgmLxpHANGlNRwq3Nb3/4gcK70s0fqoqd
 wwc61AW6e3fZSKXB/kZw911GmFzFoWhXgOXhc0EB41mCH+nbCbhC9eoRI
 Lj195ljtTgBRAgmGoZMYoIbAN/usxyloM+gUWH4b769nmPHQVrpgugRIL
 dK+p/3AUaIV1kCMaMKXLSUBExbrtmCZqsvUXKMU/+Tnuy/0uDH5EHS+kc
 5e+DHOY3ZRs6Xm4EcTKVNSqvnQtvx8BAZx/8G9e0UH63hsei7n2o1zU1E
 uABspnYNCC57jymioo8+/R6R1c8JPAlaGAKz9cfSHrfNfG6z/2CBpg5WZ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10408"; a="311476910"
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="311476910"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:33 -0700
X-IronPort-AV: E=Sophos;i="5.92,274,1650956400"; d="scan'208";a="923533122"
Received: from jmurope-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.14.184])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2022 07:52:32 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 05/11] ASoC: SOF: ipc4-topology: set domain bit based on dp
 domain type
Date: Fri, 15 Jul 2022 09:52:10 -0500
Message-Id: <20220715145216.277003-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
References: <20220715145216.277003-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Rander Wang <rander.wang@intel.com>,
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

Currently the domain bit in ipc msg for module initialization is
set to lp (low power) mode for pipeline. This is not correct since
it is for module domain type:  ll domain or dp domain which are for
scheduler in fw. If the domain bit is set to 1 fw will process the
module in dp domain or deal it with ll domain. So set domain bit
based on dp domain setting.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Rander Wang <rander.wang@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4-topology.c |  6 ++++--
 sound/soc/sof/ipc4-topology.h | 13 ++++++++++++-
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/ipc4-topology.c b/sound/soc/sof/ipc4-topology.c
index 47291fa3f166..af072b484a60 100644
--- a/sound/soc/sof/ipc4-topology.c
+++ b/sound/soc/sof/ipc4-topology.c
@@ -314,6 +314,7 @@ static int sof_ipc4_widget_set_module_info(struct snd_sof_widget *swidget)
 static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_ipc4_msg *msg)
 {
 	struct sof_ipc4_fw_module *fw_module;
+	uint32_t type;
 	int ret;
 
 	ret = sof_ipc4_widget_set_module_info(swidget);
@@ -330,6 +331,9 @@ static int sof_ipc4_widget_setup_msg(struct snd_sof_widget *swidget, struct sof_
 	msg->extension = SOF_IPC4_MOD_EXT_PPL_ID(swidget->pipeline_id);
 	msg->extension |= SOF_IPC4_MOD_EXT_CORE_ID(swidget->core);
 
+	type = fw_module->man4_module_entry.type & SOF_IPC4_MODULE_DP ? 1 : 0;
+	msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(type);
+
 	return 0;
 }
 
@@ -1532,8 +1536,6 @@ static int sof_ipc4_widget_setup(struct snd_sof_dev *sdev, struct snd_sof_widget
 
 		msg->extension &= ~SOF_IPC4_MOD_EXT_PARAM_SIZE_MASK;
 		msg->extension |= ipc_size >> 2;
-		msg->extension &= ~SOF_IPC4_MOD_EXT_DOMAIN_MASK;
-		msg->extension |= SOF_IPC4_MOD_EXT_DOMAIN(pipeline->lp_mode);
 	}
 	dev_dbg(sdev->dev, "Create widget %s instance %d - pipe %d - core %d\n",
 		swidget->widget->name, swidget->instance_id, swidget->pipeline_id, swidget->core);
diff --git a/sound/soc/sof/ipc4-topology.h b/sound/soc/sof/ipc4-topology.h
index 56ab80e722ce..0aa87a8add5d 100644
--- a/sound/soc/sof/ipc4-topology.h
+++ b/sound/soc/sof/ipc4-topology.h
@@ -15,7 +15,18 @@
 #define SOF_IPC4_FW_PAGE(x) ((((x) + BIT(12) - 1) & ~(BIT(12) - 1)) >> 12)
 #define SOF_IPC4_FW_ROUNDUP(x) (((x) + BIT(6) - 1) & (~(BIT(6) - 1)))
 
-#define SOF_IPC4_MODULE_LL      BIT(5)
+#define SOF_IPC4_MODULE_LOAD_TYPE		GENMASK(3, 0)
+#define SOF_IPC4_MODULE_AUTO_START		BIT(4)
+/*
+ * Two module schedule domains in fw :
+ * LL domain - Low latency domain
+ * DP domain - Data processing domain
+ * The LL setting should be equal to !DP setting
+ */
+#define SOF_IPC4_MODULE_LL		BIT(5)
+#define SOF_IPC4_MODULE_DP		BIT(6)
+#define SOF_IPC4_MODULE_LIB_CODE		BIT(7)
+
 #define SOF_IPC4_MODULE_INSTANCE_LIST_ITEM_SIZE 12
 #define SOF_IPC4_PIPELINE_OBJECT_SIZE 448
 #define SOF_IPC4_DATA_QUEUE_OBJECT_SIZE 128
-- 
2.34.1

