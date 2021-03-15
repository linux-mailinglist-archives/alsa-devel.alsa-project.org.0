Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDAA33C257
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Mar 2021 17:41:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 434E017A7;
	Mon, 15 Mar 2021 17:40:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 434E017A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615826502;
	bh=rTSVaTIGUw4Bsk80ZvF0cWD1Llwfe6dpVuUwiv9JfBs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EGzNff2ObORk1PXAs4ZP457xuPGNqYzpke8Y69D6052iaugRdYkkEUWaj9bKt976E
	 oY/I6hOXeAxg7FFu+USzf8lIv3Mtla3OCzeHpIhDw/s80NFtPCA6edgvgesz/FfNmI
	 HlQeLIDS/mr4B4wJsXYrWAvJeOReQh/yixv9yNes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF43DF8010E;
	Mon, 15 Mar 2021 17:40:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3B7DF80254; Mon, 15 Mar 2021 17:40:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27122F80163
 for <alsa-devel@alsa-project.org>; Mon, 15 Mar 2021 17:39:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27122F80163
IronPort-SDR: dNHxrSDbUuo54hHcRWuyp5GxSJH9P1tdOCsTkxiMDMAgZY8Kv9Z29+06SYab3iteYaOxe6ZB89
 u8B2IJjsYYug==
X-IronPort-AV: E=McAfee;i="6000,8403,9924"; a="274160567"
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="274160567"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:45 -0700
IronPort-SDR: W3DPphj1ZPgUXWzGXN07F9mTVLttGcK/m3pSMT0dJClA/9lrrBOV7R8iN53zb0N+3ouAd+WvzX
 szQbPiDCZMLA==
X-IronPort-AV: E=Sophos;i="5.81,251,1610438400"; d="scan'208";a="604912884"
Received: from pwells-mobl2.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.5.38])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2021 09:39:42 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/3] ASoC: SOF: only allocate debugfs cache buffers for IPC
 flood entries
Date: Mon, 15 Mar 2021 11:39:31 -0500
Message-Id: <20210315163932.18663-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
References: <20210315163932.18663-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Xiuli Pan <xiulipan@outlook.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org
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

From: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

snd_sof_debugfs_buf_item() is an exported function and is called from
different locations to initialise different debugfs entries. However
.cache_buf is only needed for IPC flood entries. Limit allocations
respectively.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Xiuli Pan <xiulipan@outlook.com>
Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/debug.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/debug.c b/sound/soc/sof/debug.c
index 715a374b33cf..778c7d028493 100644
--- a/sound/soc/sof/debug.c
+++ b/sound/soc/sof/debug.c
@@ -609,14 +609,16 @@ int snd_sof_debugfs_buf_item(struct snd_sof_dev *sdev,
 	dfse->sdev = sdev;
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_IPC_FLOOD_TEST)
-	/*
-	 * cache_buf is unused for SOF_DFSENTRY_TYPE_BUF debugfs entries.
-	 * So, use it to save the results of the last IPC flood test.
-	 */
-	dfse->cache_buf = devm_kzalloc(sdev->dev, IPC_FLOOD_TEST_RESULT_LEN,
-				       GFP_KERNEL);
-	if (!dfse->cache_buf)
-		return -ENOMEM;
+	if (!strncmp(name, "ipc_flood", strlen("ipc_flood"))) {
+		/*
+		 * cache_buf is unused for SOF_DFSENTRY_TYPE_BUF debugfs entries.
+		 * So, use it to save the results of the last IPC flood test.
+		 */
+		dfse->cache_buf = devm_kzalloc(sdev->dev, IPC_FLOOD_TEST_RESULT_LEN,
+					       GFP_KERNEL);
+		if (!dfse->cache_buf)
+			return -ENOMEM;
+	}
 #endif
 
 	debugfs_create_file(name, mode, sdev->debugfs_root, dfse,
-- 
2.25.1

