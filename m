Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3C9334FC
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 18:32:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 340A516C5;
	Mon,  3 Jun 2019 18:31:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 340A516C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559579536;
	bh=y9P4a0QO2zCcSjqPVrkvBuki1c2u7Wp+HqzSbt837E0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rbrulNk8JeO/9KCx6zC1hKM33eIUy42mV1LeA85hnQNN2MxJK3lemUDK1GuGrgXQD
	 vfQO7Q48OddSyVyI8TnnkBEuiUazThZZ3Jo2C6S7fkE3SmNUoI0djqrVKT7fmwR/ws
	 KePzWD5RuMsHOpzTUgyxkLwTKudbsEHOQHW9oRSY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E464F89781;
	Mon,  3 Jun 2019 18:21:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAC77F8975D; Mon,  3 Jun 2019 18:20:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 103F2F8975F
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 18:20:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 103F2F8975F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Jun 2019 09:20:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,547,1549958400"; d="scan'208";a="181219145"
Received: from chiannaa-mobl6.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.254.97.98])
 by fmsmga002.fm.intel.com with ESMTP; 03 Jun 2019 09:20:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  3 Jun 2019 11:20:32 -0500
Message-Id: <20190603162032.7626-9-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
References: <20190603162032.7626-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, Slawomir Blauciak <slawomir.blauciak@linux.intel.com>,
 broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 8/8] ASoC: SOF: ipc: replace fw ready bitfield
	with explicit bit ordering
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

From: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>

Previously the structure used bitfields, which do not guarantee bit
ordering.

This change makes sure the order is clearly defined.  It also renames
and repurposes the field for general use.

Signed-off-by: Slawomir Blauciak <slawomir.blauciak@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/info.h | 20 ++++++++++----------
 sound/soc/sof/ipc.c      | 11 +++++++----
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/include/sound/sof/info.h b/include/sound/sof/info.h
index 21dae04d8183..16528d2b4a50 100644
--- a/include/sound/sof/info.h
+++ b/include/sound/sof/info.h
@@ -18,6 +18,14 @@
 
 #define SOF_IPC_MAX_ELEMS	16
 
+/*
+ * Firmware boot info flag bits (64-bit)
+ */
+#define SOF_IPC_INFO_BUILD		BIT(0)
+#define SOF_IPC_INFO_LOCKS		BIT(1)
+#define SOF_IPC_INFO_LOCKSV		BIT(2)
+#define SOF_IPC_INFO_GDB		BIT(3)
+
 /* extended data types that can be appended onto end of sof_ipc_fw_ready */
 enum sof_ipc_ext_data {
 	SOF_IPC_EXT_DMA_BUFFER = 0,
@@ -49,16 +57,8 @@ struct sof_ipc_fw_ready {
 	uint32_t hostbox_size;
 	struct sof_ipc_fw_version version;
 
-	/* Miscellaneous debug flags showing build/debug features enabled */
-	union {
-		uint64_t reserved;
-		struct {
-			uint64_t build:1;
-			uint64_t locks:1;
-			uint64_t locks_verbose:1;
-			uint64_t gdb:1;
-		} bits;
-	} debug;
+	/* Miscellaneous flags */
+	uint64_t flags;
 
 	/* reserved for future use */
 	uint32_t reserved[4];
diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 4327b4718116..996ac19986b7 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -764,16 +764,19 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 		}
 	}
 
-	if (ready->debug.bits.build) {
+	if (ready->flags & SOF_IPC_INFO_BUILD) {
 		dev_info(sdev->dev,
 			 "Firmware debug build %d on %s-%s - options:\n"
 			 " GDB: %s\n"
 			 " lock debug: %s\n"
 			 " lock vdebug: %s\n",
 			 v->build, v->date, v->time,
-			 ready->debug.bits.gdb ? "enabled" : "disabled",
-			 ready->debug.bits.locks ? "enabled" : "disabled",
-			 ready->debug.bits.locks_verbose ? "enabled" : "disabled");
+			 ready->flags & SOF_IPC_INFO_GDB ?
+				"enabled" : "disabled",
+			 ready->flags & SOF_IPC_INFO_LOCKS ?
+				"enabled" : "disabled",
+			 ready->flags & SOF_IPC_INFO_LOCKSV ?
+				"enabled" : "disabled");
 	}
 
 	/* copy the fw_version into debugfs at first boot */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
