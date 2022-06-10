Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B633545F5A
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jun 2022 10:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14A31FBE;
	Fri, 10 Jun 2022 10:36:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14A31FBE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654850267;
	bh=cA6vWiO7WJyUwwcYplJtTcdqFrDMbIwSRkAYxAGMjHE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u7Xt39TIQLXOd4mDaRH2FVvRvhPoDxJKSPr3rEMlBjguKJ8WqtTs3lLhI+G7YwuhQ
	 PvYnbmg2T2wzoNyasfNIGCSkK3sAaHGBmSTxvp4zH/H93aExXv0ljKnbW3eay/Y1+8
	 9H959G5TUGvAbBnLCN+CMSKm3Qktw3vlMu/7qZCE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89268F80538;
	Fri, 10 Jun 2022 10:35:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15A09F800DF; Fri, 10 Jun 2022 10:35:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4AFFF800DF
 for <alsa-devel@alsa-project.org>; Fri, 10 Jun 2022 10:35:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4AFFF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fF9n+Kyq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654850131; x=1686386131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cA6vWiO7WJyUwwcYplJtTcdqFrDMbIwSRkAYxAGMjHE=;
 b=fF9n+KyqILRwVy5MjPLfzXkh8QRnVe7HahpY0QQYa4maF/iBAfq7dCTD
 K2i4FVqB2O0jwvgyVBad+2ujctoVbx6ZkXFwpCfkR0tEpQe3Cc61QrZUx
 LsZTnOI8PhkBZM0Z1LkhuAfeku8EUYWUnzsBWdPoYEKCE54vQ8PUK7wG3
 rZs20lq9gTu4au+FbcjSWJdqzsx8nb8VhD+3mpk3671/NGhh8iYq93lh9
 Vo1eWMlxErWvzNQMmXzhJ6xm/vN2gF9YxRUbu0ReZwhT0LXYfT+OmYDFO
 BC0O4oRPBH6H+1qWbcafTr/CCUfdhPc8LYouiuoKhD6ojMFRJtqH47vZ+ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10373"; a="302936689"
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="302936689"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,288,1647327600"; d="scan'208";a="638020901"
Received: from nuribebu-mobl.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.108])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 01:35:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 6/6] ASoC: SOF: ipc4: implement pm ctx_save callback
Date: Fri, 10 Jun 2022 11:35:49 +0300
Message-Id: <20220610083549.16773-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
References: <20220610083549.16773-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, yung-chuan.liao@linux.intel.com,
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

Use the context save callback to power down the primary core which is used
by the firmware as an indication that the DSP is going to be turned off.

The IMR boot setup is done in response to the primary core power down.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc4.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index b2cb92745ec6..5dd22f6a0605 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -618,7 +618,22 @@ static int sof_ipc4_set_core_state(struct snd_sof_dev *sdev, int core_idx, bool
 	return sof_ipc4_tx_msg(sdev, &msg, msg.data_size, NULL, 0, false);
 }
 
+/*
+ * The context save callback is used to send a message to the firmware notifying
+ * it that the primary core is going to be turned off, which is used as an
+ * indication to prepare for a full power down, thus preparing for IMR boot
+ * (when supported)
+ *
+ * Note: in IPC4 there is no message used to restore context, thus no context
+ * restore callback is implemented
+ */
+static int sof_ipc4_ctx_save(struct snd_sof_dev *sdev)
+{
+	return sof_ipc4_set_core_state(sdev, SOF_DSP_PRIMARY_CORE, false);
+}
+
 static const struct sof_ipc_pm_ops ipc4_pm_ops = {
+	.ctx_save = sof_ipc4_ctx_save,
 	.set_core_state = sof_ipc4_set_core_state,
 };
 
-- 
2.36.1

