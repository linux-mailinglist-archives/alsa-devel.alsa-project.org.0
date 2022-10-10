Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C4D5F9E5C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Oct 2022 14:08:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3FE8529A0;
	Mon, 10 Oct 2022 14:07:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3FE8529A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665403692;
	bh=aS5WA8WlMd5hWmep+lOPzVMTSzxAIOkf840xYz3U/KM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iSz0iCsDxXyPRnf9AHeqj+mq9GhExDa9EShEItMXiot4FZ1xeOnTGYw8MW5QTqfaZ
	 MJXH7204u/rwGY/LSblnhR+B4ONjr0tU+QCpfAWXjxgtnrQl3o2inFxomOsGWtAIZw
	 dFYxFZY/Ex5ucWA2wCxO1wbGhJ+wY5fLQta3Uks0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 824C0F805B2;
	Mon, 10 Oct 2022 14:04:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5677F8057A; Mon, 10 Oct 2022 14:04:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0546AF8057A
 for <alsa-devel@alsa-project.org>; Mon, 10 Oct 2022 14:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0546AF8057A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="loi3cWWM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665403451; x=1696939451;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aS5WA8WlMd5hWmep+lOPzVMTSzxAIOkf840xYz3U/KM=;
 b=loi3cWWM5eaDTvR/WYOJVn6N1MNpixkhkQgHx9tC5k9eWLCjsN/OXLV6
 cCo2h6u3/BhNPQiLkRy1i7nLyleesyyFkB7kqWDLHooeknv6wbuYck9M/
 euvivs/vBa9irFIuLRBKtkMpSp5swAHXZ6b1TxzCRjCFJtkBnzSPjC+VJ
 8tb+Js4mGKfZdBwSB5oz/SRys7+t1wS9yZX1LBmo2k2pT41b8zrUb1UOJ
 z3Lcfq6TFpoWBk8v0kSTPtZo3CkJx5zeiXQRGqixHYvQj2NNozUQF0/b1
 qsyvcT1uXyi36s9EXxQLXP1viJiNMO0MlEg2HeWJ2R/yJPisPCQP66T/Q A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="368346107"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="368346107"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2022 05:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="871078942"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; d="scan'208";a="871078942"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga006.fm.intel.com with ESMTP; 10 Oct 2022 05:04:07 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v2 11/15] ASoC: Intel: avs: Do not treat unsupported IPCs as
 invalid
Date: Mon, 10 Oct 2022 14:19:51 +0200
Message-Id: <20221010121955.718168-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221010121955.718168-1-cezary.rojewski@intel.com>
References: <20221010121955.718168-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

Utilize NOT_SUPPORTED status code to differentiate between unsupported
and invalid requests. Skip over error paths if it is the former that is
communicated by the base firmware.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h      | 4 +++-
 sound/soc/intel/avs/messages.h | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 92e37722d280..91f78eb11bc1 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -220,8 +220,10 @@ static inline void avs_ipc_err(struct avs_dev *adev, struct avs_ipc_msg *tx,
 	/*
 	 * If IPC channel is blocked e.g.: due to ongoing recovery,
 	 * -EPERM error code is expected and thus it's not an actual error.
+	 *
+	 * Unsupported IPCs are of no harm either.
 	 */
-	if (error == -EPERM)
+	if (error == -EPERM || error == AVS_IPC_NOT_SUPPORTED)
 		dev_dbg(adev->dev, "%s 0x%08x 0x%08x failed: %d\n", name,
 			tx->glb.primary, tx->glb.ext.val, error);
 	else
diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index c0f90dba9af8..02b3b7a74783 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -150,6 +150,8 @@ union avs_module_msg {
 	};
 } __packed;
 
+#define AVS_IPC_NOT_SUPPORTED 15
+
 union avs_reply_msg {
 	u64 val;
 	struct {
-- 
2.25.1

