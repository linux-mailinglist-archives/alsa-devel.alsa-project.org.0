Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF9C42CDD
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19AA017A4;
	Wed, 12 Jun 2019 18:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19AA017A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358828;
	bh=8JF7NuOTBJCdAio7YQwTMvF0LZpOeYQ+OF/jZpjKXuA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oNbhjyCKdnXbPR78sZjwTYvF69l3V9HJPyfDcXflPM8yjQJAOQjXCElc2ToyvHYWl
	 eabmADRy+y/nQ7lgDS6WJNZwR7cx6ZJl6SpzZVKEzuepYyK9xZ9CZPEDRU56SbSDVl
	 eO26J3wubiA8dyX/3qCP6eIrFmeAeRAI0zARehw4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7296EF89736;
	Wed, 12 Jun 2019 18:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16D37F89716; Wed, 12 Jun 2019 18:57:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF3A7F896CE
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:57:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF3A7F896CE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:57:10 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2019 09:57:09 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:57:02 -0500
Message-Id: <20190612165705.1858-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
References: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 2/5] ASoC: SOF: uapi: align comments with
	firmware files
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

No functional change, just mirror firmware comment changes

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 4 ++--
 include/sound/sof/trace.h    | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 4978999fd362..41dcabf89899 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -84,9 +84,9 @@ struct sof_ipc_buffer {
 struct sof_ipc_comp_config {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t periods_sink;	/**< 0 means variable */
-	uint32_t periods_source;	/**< 0 means variable */
+	uint32_t periods_source;/**< 0 means variable */
 	uint32_t reserved1;	/**< reserved */
-	uint32_t frame_fmt;		/**< SOF_IPC_FRAME_ */
+	uint32_t frame_fmt;	/**< SOF_IPC_FRAME_ */
 	uint32_t xrun_action;
 
 	/* reserved for future use */
diff --git a/include/sound/sof/trace.h b/include/sound/sof/trace.h
index 2187ff7d07ce..9257d5473d97 100644
--- a/include/sound/sof/trace.h
+++ b/include/sound/sof/trace.h
@@ -66,7 +66,9 @@ struct sof_ipc_dma_trace_posn {
 #define SOF_IPC_PANIC_WFI			(SOF_IPC_PANIC_MAGIC | 0xa)
 #define SOF_IPC_PANIC_ASSERT			(SOF_IPC_PANIC_MAGIC | 0xb)
 
-/* panic info include filename and line number */
+/* panic info include filename and line number
+ * filename array will not include null terminator if fully filled
+ */
 struct sof_ipc_panic_info {
 	struct sof_ipc_hdr hdr;
 	uint32_t code;			/* SOF_IPC_PANIC_ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
