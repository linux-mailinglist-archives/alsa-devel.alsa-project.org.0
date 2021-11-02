Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 374AC442AB4
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Nov 2021 10:49:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BD53116CF;
	Tue,  2 Nov 2021 10:48:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BD53116CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635846555;
	bh=lnt4fSPzX4CVlY09qPADflaM1DX0ksg+xLNSW07csVw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MjBmj8951mm+l3dNjS0cC3QMroI2GOBZs3vHp+nT+GDVeKuHd8CGdNf505T+kztJ2
	 1kHRfaJaUCPGegl/YFL8hhpCdX+1XaFNL4vo7s5igUncHNl4P4sFyGPTf4AxDhMJvL
	 wAKxF5+oL2OCRuuF9FUS8ZDYQ8illtxDusuydvlw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27F2FF8025F;
	Tue,  2 Nov 2021 10:47:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A95DF8025D; Tue,  2 Nov 2021 10:47:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 19E8FF80224
 for <alsa-devel@alsa-project.org>; Tue,  2 Nov 2021 10:47:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19E8FF80224
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="211979710"
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="211979710"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 02:47:45 -0700
X-IronPort-AV: E=Sophos;i="5.87,202,1631602800"; d="scan'208";a="500470048"
Received: from asorichi-mobl1.amr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.44.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 02:47:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: core: Unregister machine driver before IPC and
 debugfs
Date: Tue,  2 Nov 2021 11:47:56 +0200
Message-Id: <20211102094756.9317-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

To ensure clean unload of the machine driver, components and topology, do
the unregister before we free IPC and debugfs.

It is a possibility that part of the unregister we would have IPC
communication with the firmware.

Suggested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 2c3de295f11f..af5bbc861297 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -362,6 +362,13 @@ int snd_sof_device_remove(struct device *dev)
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
+	/*
+	 * Unregister machine driver. This will unbind the snd_card which
+	 * will remove the component driver and unload the topology
+	 * before freeing the snd_card.
+	 */
+	snd_sof_machine_unregister(sdev, pdata);
+
 	if (sdev->fw_state > SOF_FW_BOOT_NOT_STARTED) {
 		ret = snd_sof_dsp_power_down_notify(sdev);
 		if (ret < 0)
@@ -373,13 +380,6 @@ int snd_sof_device_remove(struct device *dev)
 		snd_sof_free_trace(sdev);
 	}
 
-	/*
-	 * Unregister machine driver. This will unbind the snd_card which
-	 * will remove the component driver and unload the topology
-	 * before freeing the snd_card.
-	 */
-	snd_sof_machine_unregister(sdev, pdata);
-
 	/*
 	 * Unregistering the machine driver results in unloading the topology.
 	 * Some widgets, ex: scheduler, attempt to power down the core they are
-- 
2.33.1

