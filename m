Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 110AE6481F1
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Dec 2022 12:47:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69BA21FE;
	Fri,  9 Dec 2022 12:46:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69BA21FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670586463;
	bh=h8cBc2yBpk7/VniQXMQNqhBOeLpvqUCk5Hu0Q33S5Go=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EsliLjNZYFsFbVfhmtQlEQZLyBZ5k5jpg+ZpVZZTyi53vjMkyofu74bCkvyI81NYV
	 HAG66L1i9NwP1vo3QTL92tXpXx2BDuyIssjQbbX4GdF1fQekXsqqqKRuitTOps14c7
	 ZLRP6K2oUfxAcXemJ0Jz/41a0wwMOvx3IiQL9lDk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CD2CF804DC;
	Fri,  9 Dec 2022 12:46:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E534CF804DD; Fri,  9 Dec 2022 12:46:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B572F804DB
 for <alsa-devel@alsa-project.org>; Fri,  9 Dec 2022 12:46:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B572F804DB
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CEJC98NA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670586362; x=1702122362;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h8cBc2yBpk7/VniQXMQNqhBOeLpvqUCk5Hu0Q33S5Go=;
 b=CEJC98NAwICrOxChozGwnRt9tK9liP3AOmA/4uTPmq1J4roORdNre8fA
 iVxM+YMgKoMsMvrS3ziSzJqEn67ezVmI8s+xcpdueh1xfcYndwFxkWaFr
 HD/KGi9vVgy8Bg8vY0kUcZKCcq9AejaPyRpqyI4f6vCQda/AkMCibXN/x
 BGK/4wmx69Drn1kmnbkr2VMEwpWVNK7X7azKlY37SnYz6oxhcJc7WfOw3
 8VrIDu920tYKQGqEiEs4haZTapx6UjEgMRvc5fHzTjTenyuUwakGGKjoS
 qH7FnvDQnyOBhQ2Qwrwz915A9WmT91KhvJzIZ5biMpOF60hjtyjsEb9P4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="297122704"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="297122704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2022 03:46:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10555"; a="754000474"
X-IronPort-AV: E=Sophos;i="5.96,230,1665471600"; d="scan'208";a="754000474"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga002.fm.intel.com with ESMTP; 09 Dec 2022 03:45:57 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/2] ASoC: SOF: Revert: "core: unregister clients and machine
 drivers in .shutdown"
Date: Fri,  9 Dec 2022 13:45:29 +0200
Message-Id: <20221209114529.3909192-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, tiwai@suse.de,
 daniel.baluta@nxp.com, Oliver Neukum <oneukum@suse.com>,
 peter.ujfalusi@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, yung-chuan.liao@linux.intel.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The unregister machine drivers call is not safe to do when
kexec is used. Kexec-lite gets blocked with following backtrace:

[   84.943749] Freezing user space processes ... (elapsed 0.111 seconds) done.
[  246.784446] INFO: task kexec-lite:5123 blocked for more than 122 seconds.
[  246.819035] Call Trace:
[  246.821782]  <TASK>
[  246.824186]  __schedule+0x5f9/0x1263
[  246.828231]  schedule+0x87/0xc5
[  246.831779]  snd_card_disconnect_sync+0xb5/0x127
...
[  246.889249]  snd_sof_device_shutdown+0xb4/0x150
[  246.899317]  pci_device_shutdown+0x37/0x61
[  246.903990]  device_shutdown+0x14c/0x1d6
[  246.908391]  kernel_kexec+0x45/0xb9

This reverts commit 83bfc7e793b555291785136c3ae86abcdc046887.

Reported-by: Ricardo Ribalda <ribalda@chromium.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/core.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 3e6141d03770..625977a29d8a 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -475,19 +475,10 @@ EXPORT_SYMBOL(snd_sof_device_remove);
 int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
-	struct snd_sof_pdata *pdata = sdev->pdata;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
-	/*
-	 * make sure clients and machine driver(s) are unregistered to force
-	 * all userspace devices to be closed prior to the DSP shutdown sequence
-	 */
-	sof_unregister_clients(sdev);
-
-	snd_sof_machine_unregister(sdev, pdata);
-
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
 		return snd_sof_shutdown(sdev);
 
-- 
2.38.1

