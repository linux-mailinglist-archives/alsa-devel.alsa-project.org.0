Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE21385F94
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Aug 2019 12:27:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F98B851;
	Thu,  8 Aug 2019 12:26:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F98B851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565260028;
	bh=peQ5xvFM8sKEe02k1uhqjwwgXbqL7gJX2iH2cpUdenI=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bGT2ponX+y2cQ+gvlBEHl2b8M1hAfDTuRo96abqFQV1rdYPjb9Z/trierUM+fxJz4
	 hirBeVygN0/XKFMPXEjKJTwbI0YTLUag9A1cSxjZylwxr30/uVQIAmVL7xCbpLQfEJ
	 FCW45K1RFZyp/F/t2eezDqTBpdDWr9YeBUHtC4fQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7AB5F805A8;
	Thu,  8 Aug 2019 12:24:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B9CF8059F; Thu,  8 Aug 2019 12:24:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E8FBF803F3
 for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2019 12:24:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E8FBF803F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Aug 2019 03:24:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,360,1559545200"; d="scan'208";a="179798074"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga006.jf.intel.com with ESMTP; 08 Aug 2019 03:24:41 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Date: Thu,  8 Aug 2019 12:24:32 +0200
Message-Id: <20190808102432.16591-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: lgirdwood@gmail.com, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, tiwai@suse.com, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH v4 1/2] ASoC: Intel: Skylake: Limit
	large_config_get to single frame
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Reply for the very first LARGE_CONFIG_GET request contains total size of
payload to be retrieved by host.
From then on, each subsequent reply carries buffer offset instead. As
looping is not covered by any real-life example, remove it and cleanup
the function for followup overhaul.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-sst-ipc.c | 37 +++++----------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
index a2b69a02aab2..196c80dadb1f 100644
--- a/sound/soc/intel/skylake/skl-sst-ipc.c
+++ b/sound/soc/intel/skylake/skl-sst-ipc.c
@@ -973,8 +973,7 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 {
 	struct skl_ipc_header header = {0};
 	struct sst_ipc_message request = {0}, reply = {0};
-	int ret = 0;
-	size_t sz_remaining, rx_size, data_offset;
+	int ret;
 
 	header.primary = IPC_MSG_TARGET(IPC_MOD_MSG);
 	header.primary |= IPC_MSG_DIR(IPC_MSG_REQUEST);
@@ -987,34 +986,12 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
 	header.extension |= IPC_FINAL_BLOCK(1);
 	header.extension |= IPC_INITIAL_BLOCK(1);
 
-	sz_remaining = msg->param_data_size;
-	data_offset = 0;
-
-	while (sz_remaining != 0) {
-		rx_size = sz_remaining > SKL_ADSP_W1_SZ
-				? SKL_ADSP_W1_SZ : sz_remaining;
-		if (rx_size == sz_remaining)
-			header.extension |= IPC_FINAL_BLOCK(1);
-
-		request.header = *(u64 *)(&header);
-		reply.data = ((char *)param) + data_offset;
-		reply.size = msg->param_data_size;
-		ret = sst_ipc_tx_message_wait(ipc, request, &reply);
-		if (ret < 0) {
-			dev_err(ipc->dev,
-				"ipc: get large config fail, err: %d\n", ret);
-			return ret;
-		}
-		sz_remaining -= rx_size;
-		data_offset = msg->param_data_size - sz_remaining;
-
-		/* clear the fields */
-		header.extension &= IPC_INITIAL_BLOCK_CLEAR;
-		header.extension &= IPC_DATA_OFFSET_SZ_CLEAR;
-		/* fill the fields */
-		header.extension |= IPC_INITIAL_BLOCK(1);
-		header.extension |= IPC_DATA_OFFSET_SZ(data_offset);
-	}
+	request.header = *(u64 *)(&header);
+	reply.data = param;
+	reply.size = msg->param_data_size;
+	ret = sst_ipc_tx_message_wait(ipc, request, &reply);
+	if (ret < 0)
+		dev_err(ipc->dev, "ipc: get large config fail, err: %d\n", ret);
 
 	return ret;
 }
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
