Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2EB6204AA
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 01:25:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C571846;
	Tue,  8 Nov 2022 01:24:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C571846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667867132;
	bh=PypZ6wpXKMNNLuOqSFBC/06G/r/SaesQrJz1CmvAtdo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lS6auQACYw1oobI1dPiafNiR4e6B/kozEL5qL1uSg/L4YcpL5lghUv/vKnSimh7Dn
	 i0LbeK9IkCNoXkpKAJCnRKsIizCeVGG6ldbQMzJhFmtIvHcpKm7rNVq7ziIgvPtsCL
	 +/WW2UbAts1DRyFqX2CdGIhlDfRm5fJv/eG4R6k0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB244F80557;
	Tue,  8 Nov 2022 01:24:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 43D00F80549; Tue,  8 Nov 2022 01:24:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B99EF804DF
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 01:24:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B99EF804DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="niVApYGC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667867053; x=1699403053;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PypZ6wpXKMNNLuOqSFBC/06G/r/SaesQrJz1CmvAtdo=;
 b=niVApYGCLGO/zZepe7fsaDyErrNKanKjuVCqLNBft6XRY5keZgyxyAkg
 +1KyKEF/VzEwLDAL3rfSbyvcTZmNpeH5mq66eNV7YuvC6QPF90wNgSoO0
 e2ZhGklil34t0u/vTcssmbeMwPslXIeqSMmKEtPyhQcy5/FG9l/kZs911
 lzr38mqeVxgP7EOXvIc+rmnVaxMD8aSda8aZcEosoo3xLYsxYdreHcNyW
 MMPiUxukgjwt3eMac1c1CK0wlN2YUAq2zI5WloXDi0wWE3cShPTEAd6kC
 ISSkacSlail6s7yeYmcYvGsc8ojX/x7LJyecfVP3FS1ngJkhiFUqt0yal Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="293927274"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="293927274"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="614070236"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="614070236"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 16:23:46 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Subject: [PATCH 2/3] ASoC: SOF: ipc4-loader: get max pipeline number
Date: Tue,  8 Nov 2022 08:29:09 +0800
Message-Id: <20221108002910.2819709-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
References: <20221108002910.2819709-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, peter.ujfalusi@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, bard.liao@intel.com,
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

Get max pipeline number from firmware configuration.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 11 +++++++++++
 sound/soc/sof/ipc4-priv.h   |  2 ++
 2 files changed, 13 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 702196774c50..1321acc402fd 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -383,6 +383,17 @@ int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			if (!ipc4_data->max_libs_count)
 				ipc4_data->max_libs_count = 1;
 			break;
+		case SOF_IPC4_FW_CFG_MAX_PPL_COUNT:
+			ipc4_data->max_num_pipelines = *tuple->value;
+			trace_sof_ipc4_fw_config(sdev, "Max PPL count %d",
+						 ipc4_data->max_num_pipelines);
+			if (ipc4_data->max_num_pipelines <= 0) {
+				dev_err(sdev->dev, "Invalid max_num_pipelines %d",
+					ipc4_data->max_num_pipelines);
+				ret = -EINVAL;
+				goto out;
+			}
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index d6f35004c4b7..fc9efdce67e0 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -65,6 +65,7 @@ struct sof_ipc4_fw_library {
  * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
+ * @max_num_pipelines: max number of pipelines
  * @max_libs_count: Maximum number of libraries support by the FW including the
  *		    base firmware
  *
@@ -76,6 +77,7 @@ struct sof_ipc4_fw_data {
 	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
+	int max_num_pipelines;
 	u32 max_libs_count;
 
 	int (*load_library)(struct snd_sof_dev *sdev,
-- 
2.25.1

