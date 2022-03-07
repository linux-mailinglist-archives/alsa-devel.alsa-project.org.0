Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8F24D062A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 19:17:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D3C417F4;
	Mon,  7 Mar 2022 19:16:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D3C417F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646677029;
	bh=mqMyC96t4y2a7Hms6/q4IPPhUc1tUWOwO1EenyeBsJQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBlyo4PUG02DfgOsAf+/1D6C8LX2XyXr+jm0gHkKA+ziqFaUz/jlQoQLyd7NfEPh1
	 RSPgbUGApZQS1jpd7plAONkoq0bJGjBn/jqLybkXFatgJbNE/f5vq/WAZDvMxq8egL
	 IWrey0bJyS6ZDDAJnO2TPYPLYjfpXnHnYx2xyKq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F16FF805A0;
	Mon,  7 Mar 2022 19:11:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CA44F80549; Mon,  7 Mar 2022 19:11:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 951BBF80536
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 19:11:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951BBF80536
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="XjTWwe9e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646676703; x=1678212703;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mqMyC96t4y2a7Hms6/q4IPPhUc1tUWOwO1EenyeBsJQ=;
 b=XjTWwe9eRLaC7RYETuxVDml8EeHr/+9CuEUn5LyaHdcJjYKmBly20ksz
 nHeYSJO6K4TM5uxWLXrRV08ZCVBoF2h7CCC8xWxyoOf2IF5H5a7HMVIEj
 eocr1KuA4pPZ3P+Ov31D8yHJeQumSaJBs9kM4ZAudVaxhnqDZy4aZKEi2
 FkMk6Y357QhG1KwLxPgWEx9sag3mvs5CHZPD2Wa3LzjOXXG8PYFalDhF8
 5ArwgEIllHLgT7a+6Q3U2Q0pl7gQG9nhlGwARt/boGHEWa/q8oVPghA24
 4K96rr0LRN8MNhOKBcO5EaYYR7GKvd/RUQNTJ8OklwWdGF7gbzc6VQ3pe A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254401359"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254401359"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:30 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="495146700"
Received: from echun1-mobl.amr.corp.intel.com (HELO rsridh2-mobl1.localdomain)
 ([10.251.130.219])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 10:11:30 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 18/18] ASoC: SOF: move definition of snd_sof_ipc to header file
Date: Mon,  7 Mar 2022 10:11:11 -0800
Message-Id: <20220307181111.49392-19-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
References: <20220307181111.49392-1-ranjani.sridharan@linux.intel.com>
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

Move definition of struct snd_sof_ipc to the header file so it can be
shared with new IPC versions.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 12 ------------
 sound/soc/sof/sof-priv.h | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index c729bb7bf8c8..34084e0008f1 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -27,18 +27,6 @@ static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf);
  * IPC message Tx/Rx message handling.
  */
 
-/* SOF generic IPC data */
-struct snd_sof_ipc {
-	struct snd_sof_dev *sdev;
-
-	/* protects messages and the disable flag */
-	struct mutex tx_mutex;
-	/* disables further sending of ipc's */
-	bool disable_ipc_tx;
-
-	struct snd_sof_ipc_msg msg;
-};
-
 struct sof_ipc_ctrl_data_params {
 	size_t msg_bytes;
 	size_t hdr_bytes;
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2e19ac619ad5..7f0514db4d06 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -345,6 +345,18 @@ struct snd_sof_ipc_msg {
 	bool ipc_complete;
 };
 
+/* SOF generic IPC data */
+struct snd_sof_ipc {
+	struct snd_sof_dev *sdev;
+
+	/* protects messages and the disable flag */
+	struct mutex tx_mutex;
+	/* disables further sending of ipc's */
+	bool disable_ipc_tx;
+
+	struct snd_sof_ipc_msg msg;
+};
+
 /*
  * SOF Device Level.
  */
-- 
2.25.1

