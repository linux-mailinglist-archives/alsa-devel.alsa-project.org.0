Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AD851D919
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:27:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED4117F5;
	Fri,  6 May 2022 15:26:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED4117F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651843663;
	bh=aAEPPHDWwvX/VSKkKZmrL+J1KgB/XxUHKZUmMwhq6Yk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ILa0f6MxdGZG8pooGh2NTbWLWrNGYU2FaAUdZe48lthlSPl//Cy8vSabQsrr0/Ceu
	 xAhiGdEnw5gM0wDhmR0U0J5Jqz0D+GYUKauVPx1OU/8J1MH+RcX3k36MHnvF9vZ729
	 R5bHhfF29gtg2D1XH3FRLV8Uw8vWg2QGOS7cjIVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CA037F80507;
	Fri,  6 May 2022 15:26:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A152BF8012F; Fri,  6 May 2022 15:26:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D844CF8012F
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D844CF8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GXPecVw3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651843597; x=1683379597;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aAEPPHDWwvX/VSKkKZmrL+J1KgB/XxUHKZUmMwhq6Yk=;
 b=GXPecVw3Ehsm5f2K7U5GiM5W6gpNoTVOT5GWeiukC0gwU7NKSlUegBZ7
 djPSm9FLGxmSspWRnNzU4Yh1KDsG5j499BY4YjMgIOJRZ6Rr+QRzwH8fi
 Iy7eYARlMUWcZNnkhJMEWJc8hHYXq/+0caVx9yRjx30oHBXyM8UGfQXEY
 Jhf8FCgI2QpnXXLMRvqqUCBvtvIoO8z8bETf/K4MTgrxSGrV08l1ZylgH
 jWYUOtgL575mo4O9at8E+JV6qJ0TPtia1QRbMkjYSR1K94kwbdh9C8nuk
 SCMD6Lgr4dZV3njB7zrRUd6TyfJpZkhbj9Zgg2sr0k4Ni1ANOGNOoJIso w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293672787"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293672787"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585971560"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 1/8] ASoC: SOF: sof-client: Add API to get the maximum IPC
 payload size
Date: Fri,  6 May 2022 16:26:40 +0300
Message-Id: <20220506132647.18690-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
References: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

Provide a way for the client drivers to query the maximum payload size of
an IPC message.
Currently clients do not have access to this information and they can only
use the SOF_IPC_MSG_MAX_SIZE defined value.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 8 ++++++++
 sound/soc/sof/sof-client.h | 1 +
 2 files changed, 9 insertions(+)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index 5fb3eb21bf7d..18839a8a03c3 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -319,6 +319,14 @@ const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_get_fw_version, SND_SOC_SOF_CLIENT);
 
+size_t sof_client_get_ipc_max_payload_size(struct sof_client_dev *cdev)
+{
+	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
+
+	return sdev->ipc->max_payload_size;
+}
+EXPORT_SYMBOL_NS_GPL(sof_client_get_ipc_max_payload_size, SND_SOC_SOF_CLIENT);
+
 /* module refcount management of SOF core */
 int sof_client_core_module_get(struct sof_client_dev *cdev)
 {
diff --git a/sound/soc/sof/sof-client.h b/sound/soc/sof/sof-client.h
index 4b6394b4c694..4b5787156775 100644
--- a/sound/soc/sof/sof-client.h
+++ b/sound/soc/sof/sof-client.h
@@ -41,6 +41,7 @@ int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 struct dentry *sof_client_get_debugfs_root(struct sof_client_dev *cdev);
 struct device *sof_client_get_dma_dev(struct sof_client_dev *cdev);
 const struct sof_ipc_fw_version *sof_client_get_fw_version(struct sof_client_dev *cdev);
+size_t sof_client_get_ipc_max_payload_size(struct sof_client_dev *cdev);
 
 /* module refcount management of SOF core */
 int sof_client_core_module_get(struct sof_client_dev *cdev);
-- 
2.36.0

