Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DED217E275
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 15:23:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D85271679;
	Mon,  9 Mar 2020 15:22:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D85271679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583763821;
	bh=wTC1Y9HrDgh3iWuGAc1pOqRLru0Qmb2SGXKQPQJ6qQk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=muWeBRnmpSzHn7taA6UNsgiFeWaH/7bzJE1zxotvDqQlm8FUtVOuvzW8HoXeOBuey
	 1Je+iHEQlziDI8386bj5cZU3RUMlRcqroG5bAnqPZJGxWDlRtwVXlMWOEbBwh1w0Lv
	 kHNS0NJNy8+D+D4KTRtHSiqUUxYeAR68W7kuUDcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE5E0F800DA;
	Mon,  9 Mar 2020 15:22:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D145DF801EB; Mon,  9 Mar 2020 15:21:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0B28F800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 15:21:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0B28F800DA
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 07:21:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,533,1574150400"; d="scan'208";a="241982315"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by orsmga003.jf.intel.com with ESMTP; 09 Mar 2020 07:21:50 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: Fix probe point getter
Date: Mon,  9 Mar 2020 15:21:24 +0100
Message-Id: <20200309142124.29262-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com
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

Firmware API changes which introduced 'num_elems' param in several probe
structs such as sof_ipc_probe_dma_add_params also impacted getter for
both, DMA and probe points. All struct handlers except for
sof_ipc_probe_info_params have been updated. Align said handler too to
calculate payload size correctly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Fixes: f3b433e4699f ("ASoC: SOF: Implement Probe IPC API")
---
 sound/soc/sof/probe.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/probe.c b/sound/soc/sof/probe.c
index 2b2f3dcfc7e9..c38169fe00c5 100644
--- a/sound/soc/sof/probe.c
+++ b/sound/soc/sof/probe.c
@@ -95,13 +95,17 @@ static int sof_ipc_probe_info(struct snd_sof_dev *sdev, unsigned int cmd,
 	if (!reply->num_elems)
 		goto exit;
 
-	bytes = reply->num_elems * sizeof(reply->dma[0]);
+	if (cmd == SOF_IPC_PROBE_DMA_INFO)
+		bytes = sizeof(reply->dma[0]);
+	else
+		bytes = sizeof(reply->desc[0]);
+	bytes *= reply->num_elems;
 	*params = kmemdup(&reply->dma[0], bytes, GFP_KERNEL);
 	if (!*params) {
 		ret = -ENOMEM;
 		goto exit;
 	}
-	*num_params = msg.num_elems;
+	*num_params = reply->num_elems;
 
 exit:
 	kfree(reply);
-- 
2.17.1

