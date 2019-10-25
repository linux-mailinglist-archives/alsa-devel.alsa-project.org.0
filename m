Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB40E56BC
	for <lists+alsa-devel@lfdr.de>; Sat, 26 Oct 2019 00:56:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CF5A18F6;
	Sat, 26 Oct 2019 00:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CF5A18F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572044212;
	bh=DiH0Hn/a4SMXmJCWLB1qtq3tUPzvoW2Y2gPI9YYe1B0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c8eO4WGSPiZWBFzriufxUR7dqSqpYRpPd0zcB2TkO9ZK0cdfBmmEQC9g5Uy0RjETm
	 /wpDB0G/qJ19yE0ShQM44gL0LN+6nItHxwPnduCy3KfnLX375m4hpiUo5mAL0rAELS
	 /6lBb1ijI33YQV+t73jsw+GD5AfBcO3aE3P0oQRk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9A46F80774;
	Sat, 26 Oct 2019 00:42:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 567B8F8063E; Sat, 26 Oct 2019 00:41:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6994F8060F
 for <alsa-devel@alsa-project.org>; Sat, 26 Oct 2019 00:41:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6994F8060F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 15:41:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,230,1569308400"; d="scan'208";a="210458212"
Received: from archagam-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.252.139.180])
 by fmsmga001.fm.intel.com with ESMTP; 25 Oct 2019 15:41:44 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Fri, 25 Oct 2019 17:41:09 -0500
Message-Id: <20191025224122.7718-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
References: <20191025224122.7718-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Keyon Jie <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 13/26] ASoC: SOF: ipc: introduce message for
	DSP power gating
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Keyon Jie <yang.jie@linux.intel.com>

Add new ipc messages which will be sent from driver to FW, to ask FW to
enter specific power saving state.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/header.h | 1 +
 include/sound/sof/pm.h     | 8 ++++++++
 2 files changed, 9 insertions(+)

diff --git a/include/sound/sof/header.h b/include/sound/sof/header.h
index 332143ff7278..bf3edd9c08b4 100644
--- a/include/sound/sof/header.h
+++ b/include/sound/sof/header.h
@@ -75,6 +75,7 @@
 #define SOF_IPC_PM_CLK_GET			SOF_CMD_TYPE(0x005)
 #define SOF_IPC_PM_CLK_REQ			SOF_CMD_TYPE(0x006)
 #define SOF_IPC_PM_CORE_ENABLE			SOF_CMD_TYPE(0x007)
+#define SOF_IPC_PM_GATE				SOF_CMD_TYPE(0x008)
 
 /* component runtime config - multiple different types */
 #define SOF_IPC_COMP_SET_VALUE			SOF_CMD_TYPE(0x001)
diff --git a/include/sound/sof/pm.h b/include/sound/sof/pm.h
index 003879401d63..3cf2e0f39d94 100644
--- a/include/sound/sof/pm.h
+++ b/include/sound/sof/pm.h
@@ -45,4 +45,12 @@ struct sof_ipc_pm_core_config {
 	uint32_t enable_mask;
 } __packed;
 
+struct sof_ipc_pm_gate {
+	struct sof_ipc_cmd_hdr hdr;
+	uint32_t flags;	/* platform specific */
+
+	/* reserved for future use */
+	uint32_t reserved[5];
+} __packed;
+
 #endif
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
