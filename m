Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9604049FAE3
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 14:37:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 168A21792;
	Fri, 28 Jan 2022 14:36:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 168A21792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643377051;
	bh=0YzJJYy9DlJ1gVtMXK1hSqwlqLo2WyJjF2puxviO9e0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cxY/auawa8c79e0qKa/OZhOFTkahgUvjdZKo3J3BZoyyO7gH25LCtiaLZ5ylpLIFD
	 jizSBYx2YkItc+6IZ4wuqFlQBFF9XeJ01A91QNXJJ1pysJpj3weI5AJ5rRjjAQVz24
	 Qm5TzD5JA/fXwKuZS8iBDGEjO1i69Rc4b4wMmFSQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CADB3F80511;
	Fri, 28 Jan 2022 14:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BF73F8050F; Fri, 28 Jan 2022 14:36:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EDCCF80118
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 14:35:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EDCCF80118
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bv8cfVPO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643376955; x=1674912955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0YzJJYy9DlJ1gVtMXK1hSqwlqLo2WyJjF2puxviO9e0=;
 b=bv8cfVPOznBROGFcYGMfPwOA+eWMlqTFCqneVDXNrDx2/UAR3rXjejqe
 w+tBZCxW2tbzTrJQFkfuj8wCWQWywLvdN9HMTCCghqOXuMWaMR9i6SqfM
 Z+hc6us1BLUDNEFDLYJ0Vr/AIcpXee94C7bTyc9hu0SduWtuaIfHwJZSc
 hW3kz3LlBSk4PQhDwiJziDouJm8KgCRXieMH/DT7I4vqojnbT46jWqrlw
 S/0duxs6czEnpaKSxRZNShdhiJ0Usdv/YE3ZivdKW02N9CB3RyO89J/s7
 PCUIzQ2wbIa5ub8GODF4VMcZduw2xpZBvYInQa646zl9MQFGbW9D9cIhf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227790493"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="227790493"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:35:51 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="536132825"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:35:48 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: SOF: Intel: cnl: Use pm_gate->hdr.cmd in
 cnl_compact_ipc_compress()
Date: Fri, 28 Jan 2022 15:36:18 +0200
Message-Id: <20220128133620.9411-2-peter.ujfalusi@linux.intel.com>
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

Instead of first checking the msg->header (which is the hdr.cmd), use
directly the cmd from the message itself.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/cnl.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index e615125d575e..1911e104f113 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -161,11 +161,9 @@ static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev)
 static bool cnl_compact_ipc_compress(struct snd_sof_ipc_msg *msg,
 				     u32 *dr, u32 *dd)
 {
-	struct sof_ipc_pm_gate *pm_gate;
-
-	if (msg->header == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE)) {
-		pm_gate = msg->msg_data;
+	struct sof_ipc_pm_gate *pm_gate = msg->msg_data;
 
+	if (pm_gate->hdr.cmd == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_GATE)) {
 		/* send the compact message via the primary register */
 		*dr = HDA_IPC_MSG_COMPACT | HDA_IPC_PM_GATE;
 
-- 
2.35.0

