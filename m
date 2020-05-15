Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347C1D4FE3
	for <lists+alsa-devel@lfdr.de>; Fri, 15 May 2020 16:04:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307E81671;
	Fri, 15 May 2020 16:03:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307E81671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589551477;
	bh=K39MD2Y2X6r+sFZ+bbpatK0QtUToD4sHNqBWCYZOY6w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CMEEjSOoBSlabaitJkdkwkd+OwCiajcubIQuYVmlu+J5PcBMOOJkgjC7NbnI8z1Gl
	 Ggx1NPBYwtuSRhXzdndK8+Ex4eoH02jQgH/fJw618rC2IhXYysVQjCjJvShtu/CvYw
	 VbNrq8bFz7yJZLsgaUl2Ce12BxxVd5nye3rbVRio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1E42F802A7;
	Fri, 15 May 2020 16:00:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F509F802A7; Fri, 15 May 2020 16:00:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2582F800B8
 for <alsa-devel@alsa-project.org>; Fri, 15 May 2020 16:00:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2582F800B8
IronPort-SDR: Dq6OGCZDpo9Ohgkhy4vhnd7MlfUuFGX6thw6hT0xk1QooFo4ZSisuFyFvaGG3oaiBDf0hEUiX+
 ffHoxkvSrQyg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2020 07:00:32 -0700
IronPort-SDR: +Q9S9sTZOTqnfTEgml1y9z3Q3imTgEoT5l9P1Bst014MTTfW2lwOvLhEQdfX86nahQnbi9CJcg
 0h2lhx65VysA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,395,1583222400"; d="scan'208";a="266611077"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga006.jf.intel.com with ESMTP; 15 May 2020 07:00:30 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/8] ASoC: SOF: inform DSP that driver is going to be removed
Date: Fri, 15 May 2020 16:59:53 +0300
Message-Id: <20200515135958.17511-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
References: <20200515135958.17511-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Marcin Rajwa <marcin.rajwa@linux.intel.com>, daniel.baluta@nxp.com,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

From: Marcin Rajwa <marcin.rajwa@linux.intel.com>

This patch invokes the DSP power down notifier to inform
DSP that driver is going to be removed.
The module removal entails DSP power down, disabling of
IRQs and more. Therefore it is highly recommended to inform
the DSP about this upcoming event.

Due to hardware limitations on some Intel platforms it is necessary
to power gate all LPSRAM banks that were enabled prior to controller
reset. Otherwise, an attempt to write LPSRAM control registers may
have no effect.

Signed-off-by: Marcin Rajwa <marcin.rajwa@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index ef9be4f45e27..339c4930b0c0 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -343,6 +343,12 @@ int snd_sof_device_remove(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	struct snd_sof_pdata *pdata = sdev->pdata;
+	int ret;
+
+	ret = snd_sof_dsp_power_down_notify(sdev);
+	if (ret < 0)
+		dev_warn(dev, "error: %d failed to prepare DSP for device removal",
+			 ret);
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
-- 
2.26.0

