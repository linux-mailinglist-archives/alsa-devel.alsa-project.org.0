Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBB9549FAE7
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 14:38:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6B96F1730;
	Fri, 28 Jan 2022 14:37:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6B96F1730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643377085;
	bh=EeJRDrEONHaJM/B26toSuOhdinLr92LPpJg5mgahacA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OjMKnuBVZBjFHKt7E2cMXoB9aBQN1lO6bKuYWKsxEn/qOYQlpLYaYeLqIn3h8pf+3
	 /RRPxELRQBQSydvUMm1girWebOKPMeNJGmm1ZHLTASBhSEkxzTBTcqzJwLu3e4slms
	 BbY7nKNq2hIi7v/Eb8rvl0YK4IyLeDrCQaHbz4B8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5C4AF8051B;
	Fri, 28 Jan 2022 14:36:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4DB2EF8051A; Fri, 28 Jan 2022 14:36:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC3D6F8023B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 14:36:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC3D6F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="lfAkgadB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643376967; x=1674912967;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EeJRDrEONHaJM/B26toSuOhdinLr92LPpJg5mgahacA=;
 b=lfAkgadBp3d3xL9jp/8xZRMoV8czSJEF91URI0FfnYp1TsNxKxP+g9+c
 Gqz0NL+ixPU0yFzZ8V1plxTOFS2w0R/GYC/IQiG11wpBDTNQ2wT8heq97
 8bHdxpy3tzxvhbPiadXXOd9pmgbTC4UDCV0trRJjJKY32LRUTaYxMSZAD
 0pGjNdy7TufT1OqaY/PkK8qkfeS79TNLZJYrDwwZTM0zEcPXyP1E07Z3u
 jHlQYP+Iszs3cKSjJ4Kut/rJ6tQvMCicJHtL7OBHJ1Rm1/jIgJBzVtPba
 sgxJJKsFndqz0Fd5N0DzqCkkSEaZdPE+Hcxi0q2Z73b3vaa9Vx3k/+ZM5 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="271582707"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="271582707"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:36:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="536132851"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:35:55 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: ipc: Do not allocate buffer for msg_data
Date: Fri, 28 Jan 2022 15:36:20 +0200
Message-Id: <20220128133620.9411-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128133620.9411-1-peter.ujfalusi@linux.intel.com>
References: <20220128133620.9411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, rander.wang@intel.com,
 daniel.baluta@nxp.com
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

The sof_ipc_tx_message does not have support for async operations.
There is no need to allocate a buffer and copy each message to it to be
sent to the DSP, we can use the passed message data pointer directly.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index ec51daed8b31..16a0d7a059f3 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -321,7 +321,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc,
 	msg = &ipc->msg;
 
 	/* attach message data */
-	memcpy(msg->msg_data, msg_data, msg_bytes);
+	msg->msg_data = msg_data;
 	msg->msg_size = msg_bytes;
 
 	msg->reply_size = reply_bytes;
@@ -1003,9 +1003,6 @@ int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev)
 	struct snd_sof_ipc_msg *msg;
 
 	msg = &sdev->ipc->msg;
-	msg->msg_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	if (!msg->msg_data)
-		return -ENOMEM;
 
 	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
 	if (!msg->reply_data)
-- 
2.35.0

