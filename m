Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4145725ACA1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 16:12:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB5C71860;
	Wed,  2 Sep 2020 16:11:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB5C71860
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599055932;
	bh=klG/qfX0NtPht9eMiKJRx1ApVtrYY2/mEfTkzrMn0zI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=osTtCod686jBTbVyBrnlYne2HUWfhvCVbxkVLJgOeODxM6uG80du87+kJzAsACLxI
	 mefUJ9yvNBJKDbWf9TujUMb55YFg4vzNWjYXOLxk4aI4te18H/se3EpiqKEO4CtSny
	 lzbzUvTU5cdMvGO17tUGSkwuY/6MiNI3Crf3fa6k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC47AF80212;
	Wed,  2 Sep 2020 16:09:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFF33F80257; Wed,  2 Sep 2020 16:09:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EF63F80257
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 16:09:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EF63F80257
IronPort-SDR: MMF+STVY+ycZxm1c4EScx9z1z5E5Zu+wSDzXFdwRDahcdyjHyLGACrluC667jBmls7gBDBjazD
 /HKW6nNaXJeA==
X-IronPort-AV: E=McAfee;i="6000,8403,9731"; a="156650013"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="156650013"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 07:09:27 -0700
IronPort-SDR: dm6JFk47xXeY7E/rMsXwqySF4mFA4Aiv96YJTfWQWG4JJSfQvThtaYSk/HQDY5Pi0YE0WyDmjo
 31k3GCXbH2Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="338934380"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Sep 2020 07:09:26 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/3] ASoC: SOF: topology: fix core enable sequence
Date: Wed,  2 Sep 2020 17:07:56 +0300
Message-Id: <20200902140756.1427005-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
References: <20200902140756.1427005-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com, Keyon Jie <yang.jie@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Rander Wang <rander.wang@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

Core power up involves 2 steps: The first step tries to
power up the core by setting the ADSPCS.SPA bit for the host-managed
cores. The second step involves sending the IPC to power up other
cores that are not host managed. The enabled_cores_mask should
be updated only when both these steps are successful. If the
IPC to the DSP fails, the host-managed core that was powered in
step 1 should be powered off before returning the error.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Keyon Jie <yang.jie@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/topology.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 46468fb7b6d1..d47da407a1bd 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -1303,7 +1303,7 @@ static int sof_core_enable(struct snd_sof_dev *sdev, int core)
 	if (sdev->enabled_cores_mask & BIT(core))
 		return 0;
 
-	/* power up the core */
+	/* power up the core if it is host managed */
 	ret = snd_sof_dsp_core_power_up(sdev, BIT(core));
 	if (ret < 0) {
 		dev_err(sdev->dev, "error: %d powering up core %d\n",
@@ -1311,16 +1311,24 @@ static int sof_core_enable(struct snd_sof_dev *sdev, int core)
 		return ret;
 	}
 
-	/* update enabled cores mask */
-	sdev->enabled_cores_mask |= BIT(core);
-
-	/* Now notify DSP that the core has been powered up */
+	/* Now notify DSP */
 	ret = sof_ipc_tx_message(sdev->ipc, pm_core_config.hdr.cmd,
 				 &pm_core_config, sizeof(pm_core_config),
 				 &pm_core_config, sizeof(pm_core_config));
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(sdev->dev, "error: core %d enable ipc failure %d\n",
 			core, ret);
+		goto err;
+	}
+
+	/* update enabled cores mask */
+	sdev->enabled_cores_mask |= BIT(core);
+
+	return ret;
+err:
+	/* power down core if it is host managed and return the original error if this fails too */
+	if (snd_sof_dsp_core_power_down(sdev, BIT(core)) < 0)
+		dev_err(sdev->dev, "error: powering down core %d\n", core);
 
 	return ret;
 }
-- 
2.27.0

