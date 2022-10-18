Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC90602B5C
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:12:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC9C39CD3;
	Tue, 18 Oct 2022 14:11:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC9C39CD3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095121;
	bh=+VbW1XXRCFSOR+SHo27Ir/bLlx2ipKcCYnuw+5nVouI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CS5S06yM5HEvp7IE+zUVSNsgwNoN/oLcpoTy8p7hnzzdFvxZrMGvKZihrcAbBAIaA
	 1SiUrZcd+UaMQEG+DabD+v4meoYzioDPL1fhKutgNBnoiurIt1FrQ2qfzWNKWZscGC
	 rJ4uOSsoIRUmBnBUz3bV7Asw2Sdo0qqpJMiPWXwE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6069EF80578;
	Tue, 18 Oct 2022 14:09:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 923C2F8057E; Tue, 18 Oct 2022 14:09:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0520BF80564
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0520BF80564
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Au2pElVF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094966; x=1697630966;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+VbW1XXRCFSOR+SHo27Ir/bLlx2ipKcCYnuw+5nVouI=;
 b=Au2pElVFk19SdNo4aiCB5UnWclQtKXJlvwnkMPYrE2+9hJaWOM6FQy8t
 ZM60R3E9CP6jKeMCStoa+Z5iNQvHy2ywEkQIcuLK6t30WMc7HyO6Nq3mA
 mCoeHL1B48s7M0STzNoRHfo6Wf5n6fSv2YYsUTk7/Q0aGjX56uuqqZNUy
 1yk2yn7PpURsy5OJc2zdie9evsCjtRPFLgF6KofrlqJLSkzczATEY52wU
 YM/j+e/pBA7tRCnplBX5h9lXAiAoW42UdK/bj3ObNqLdqp2Mwwx9URZW3
 kz5bJc0/pKN9IrmlKH1ozsKY16t5Pzm7UK49/spaKpg9mTqpvDYOE89RR A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452948"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452948"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:19 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579757918"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579757918"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:14 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 08/19] ASoC: SOF: ipc4-loader: Save the maximum number of
 libraries supported
Date: Tue, 18 Oct 2022 15:09:05 +0300
Message-Id: <20221018120916.19820-9-peter.ujfalusi@linux.intel.com>
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

The firmware supports external libraries (containing modules) to be loaded
runtime.
The firmware configuration contains the maximum number of libraries
supported, including the base firmware (which is library 0).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/ipc4-loader.c | 7 +++++++
 sound/soc/sof/ipc4-priv.h   | 3 +++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/ipc4-loader.c b/sound/soc/sof/ipc4-loader.c
index 9f433e9b4cd3..2495a205ef78 100644
--- a/sound/soc/sof/ipc4-loader.c
+++ b/sound/soc/sof/ipc4-loader.c
@@ -202,6 +202,13 @@ static int sof_ipc4_query_fw_configuration(struct snd_sof_dev *sdev)
 			trace_sof_ipc4_fw_config(sdev, "Trace log size", *tuple->value);
 			ipc4_data->mtrace_log_bytes = *tuple->value;
 			break;
+		case SOF_IPC4_FW_CFG_MAX_LIBS_COUNT:
+			trace_sof_ipc4_fw_config(sdev, "maximum number of libraries",
+						 *tuple->value);
+			ipc4_data->max_libs_count = *tuple->value;
+			if (!ipc4_data->max_libs_count)
+				ipc4_data->max_libs_count = 1;
+			break;
 		default:
 			break;
 		}
diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index e3b8484a2f1f..7f5c7a47b3a7 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -32,6 +32,8 @@ enum sof_ipc4_mtrace_type {
  * @nhlt: NHLT table either from the BIOS or the topology manifest
  * @mtrace_type: mtrace type supported on the booted platform
  * @mtrace_log_bytes: log bytes as reported by the firmware via fw_config reply
+ * @max_libs_count: Maximum number of libraries support by the FW including the
+ *		    base firmware
  */
 struct sof_ipc4_fw_data {
 	u32 manifest_fw_hdr_offset;
@@ -40,6 +42,7 @@ struct sof_ipc4_fw_data {
 	void *nhlt;
 	enum sof_ipc4_mtrace_type mtrace_type;
 	u32 mtrace_log_bytes;
+	u32 max_libs_count;
 };
 
 /**
-- 
2.38.0

