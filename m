Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FC440C528
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:24:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29741840;
	Wed, 15 Sep 2021 14:23:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29741840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708680;
	bh=Aq+lrPawmkOgPNoZuQ4vI8/55FWuno1CVhBGCbFjleQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZN0mPew2uAqPo79fZcCussIYjDx8/yxIfaa5SRUWI6FVJAIQaVcNTqm9KDEcwgWGv
	 OioeANXCDpvYqux/sL8HqcOJfdG4vZgS7L7hVlQIoXYKIWgfTkHKbsrXDeMXyt3+Yh
	 OPyJjFQzaG9BOPmFHXSA02a09tY7X57A0XvW6wWY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2CB6F80510;
	Wed, 15 Sep 2021 14:21:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF5D2F8049E; Wed, 15 Sep 2021 14:21:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 614C1F8049E
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 614C1F8049E
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117494"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117494"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:27 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901584"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:25 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 03/12] ASoC: SOF: imx: Do not initialize the
 snd_sof_dsp_ops.read64
Date: Wed, 15 Sep 2021 15:21:07 +0300
Message-Id: <20210915122116.18317-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The read64 operation is not used by IMX along with other IO functions.
No need to set it for the ops.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/imx/imx8.c  | 6 ------
 sound/soc/sof/imx/imx8m.c | 3 ---
 2 files changed, 9 deletions(-)

diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 12fedf0984bd..326aa65166c2 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -419,9 +419,6 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
-	/* Module IO */
-	.read64	= sof_io_read64,
-
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
@@ -468,9 +465,6 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
-	/* Module IO */
-	.read64	= sof_io_read64,
-
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index cb822d953767..b5c739a5cbeb 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -271,9 +271,6 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
-	/* Module IO */
-	.read64	= sof_io_read64,
-
 	/* ipc */
 	.send_msg	= imx8m_send_msg,
 	.fw_ready	= sof_fw_ready,
-- 
2.33.0

