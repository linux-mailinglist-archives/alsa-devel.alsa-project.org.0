Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD7B652F74
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Dec 2022 11:27:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C0F2F16BD;
	Wed, 21 Dec 2022 11:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C0F2F16BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671618464;
	bh=r5Yyl4b8ilWgnmz7mfJQWkUdW1b0VRotQRp8wUsZ0uE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=t1H5tmTbJg1CYs6rst2mThrfp59nSWGOm+F8HnWLKFBdHcpdpLCU1XGBmEXWHZVdw
	 N9iBVKwgbkTWcGWNF3AKJUZ1jhkNl5gprsGGTRQVNUl8EzG+09wrNotY5veoChgETs
	 pp9aoySXDgtFzZ1L8HzW9XsTLoS3zuflnyElACyE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB6ABF80580;
	Wed, 21 Dec 2022 11:24:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A2CF80423; Wed, 21 Dec 2022 11:23:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23447F80423
 for <alsa-devel@alsa-project.org>; Wed, 21 Dec 2022 11:23:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23447F80423
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PEcYImz1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671618230; x=1703154230;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5Yyl4b8ilWgnmz7mfJQWkUdW1b0VRotQRp8wUsZ0uE=;
 b=PEcYImz1dkdLm7PPX/TtTjKAZQ8AZF7VLoZaGbxiEO7gFtotFtwHZERA
 iyj/peMOK4bW6r+KHn+/F66uPiApyXn3ZlKSeLgKoUwxt+vlAmxV9V8Py
 eMDmmrI4KvV2dEjkiOX27x+KKclC7CcFriGVw3PxWJK0L6hnXSjwKGO5m
 XscaiiP+64sxbDXKCjruQcj5pPYjHlOWnAhsSKdFL5ZvPnq736Yc2VNEC
 ZrmrEVqMGaEd+Vt2C9aCtmSnvD73kjCMxUle6ZvZNUB3f+q77WNcAOEC+
 WhrtI6DyiXWabvWNjzatIHVIO6H1SWrLM7u/f9VAWofBTLwSa4bAyyvNW Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="406078700"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="406078700"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10567"; a="681984425"
X-IronPort-AV: E=Sophos;i="5.96,262,1665471600"; d="scan'208";a="681984425"
Received: from cofearra-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.20.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2022 02:23:46 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 10/11] ASoC: SOF: trace: Use sof_ipc_get_ops() in
 sof_fw_trace_init
Date: Wed, 21 Dec 2022 12:23:27 +0200
Message-Id: <20221221102328.9635-11-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
References: <20221221102328.9635-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For the sake of safety use the sof_ipc_get_ops() to fetch the fw_tracing
ops to avoid cases when either sdev->ipc or sdev->ipc->ops might be NULL.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
---
 sound/soc/sof/trace.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
index 6f662642d611..0e92269c4a00 100644
--- a/sound/soc/sof/trace.c
+++ b/sound/soc/sof/trace.c
@@ -6,14 +6,16 @@
 
 int sof_fw_trace_init(struct snd_sof_dev *sdev)
 {
-	if (!sdev->ipc->ops->fw_tracing) {
+	const struct sof_ipc_fw_tracing_ops *fw_tracing = sof_ipc_get_ops(sdev, fw_tracing);
+
+	if (!fw_tracing) {
 		dev_info(sdev->dev, "Firmware tracing is not available\n");
 		sdev->fw_trace_is_supported = false;
 
 		return 0;
 	}
 
-	return sdev->ipc->ops->fw_tracing->init(sdev);
+	return fw_tracing->init(sdev);
 }
 
 void sof_fw_trace_free(struct snd_sof_dev *sdev)
-- 
2.39.0

