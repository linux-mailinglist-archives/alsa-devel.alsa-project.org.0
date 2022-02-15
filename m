Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C948D4B7445
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Feb 2022 19:16:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49BE17E7;
	Tue, 15 Feb 2022 19:15:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49BE17E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644948997;
	bh=pf86zRo7PbseCg0QyFI2S2/R2iaKLejvTnbsr95L+7Q=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AsFfGQNG/SkRvBQz3tbVPAdoNHA0lGG4/c7KhK65iR3vJjDd84gmdubh1SPsUbCfD
	 ir2Gdo1nWXNhoSAyra25W6ftqDi3Yf9r8cQH7f2m7/Gnp8rYrK+0VzTneFjiKhwdLp
	 lWEyicUKOyUZoYgUwOEJnM7QpjoFJa9v52Q9mKTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16629F80159;
	Tue, 15 Feb 2022 19:15:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81EADF80124; Tue, 15 Feb 2022 19:15:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2311F80124
 for <alsa-devel@alsa-project.org>; Tue, 15 Feb 2022 19:15:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2311F80124
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="EOGwa0XF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644948923; x=1676484923;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pf86zRo7PbseCg0QyFI2S2/R2iaKLejvTnbsr95L+7Q=;
 b=EOGwa0XF6FbHm3gzAcUYgUyHHHTrUEcewH/BdQOse25o/S1jEustCAP6
 dXF4wv0Hyla/lWbehHo5q72KuwRCO8XdMiT5RBEHZr+WaHwogXAYZyKrb
 ByK4RSu3HBx2N8/vP3eZ/oSXsCbCNyJEknYj58xSmJ70vEJ6AHYB5JUyc
 Y+WfX9qY4bk2JGTHvivzbEw5PII4RMpmVyulSHJa6Um4vxGqoSDyjctab
 yXkCRprzxF2LgbOyvIyU9cYziTSmodu+2k6sS2gRUn65k0R8Bcqh3Todw
 rVy3pvV8tRo8gDb2vmt2QOW/CpLC3R1EtY+fh7bFpCh84piL8kOKH4CQf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10259"; a="231051180"
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="231051180"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2022 10:15:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,371,1635231600"; d="scan'208";a="539463792"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga007.fm.intel.com with ESMTP; 15 Feb 2022 10:15:16 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: core: unregister clients and machine drivers in
 .shutdown
Date: Tue, 15 Feb 2022 20:06:28 +0200
Message-Id: <20220215180628.3893282-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On a platform shutdown, the expectation for most drivers is that
userspace tasks will release all resources. When those sequences do
not complete, it can be the case that PCM devices exposed by ALSA
cards are used *after* the DSP shutdown completes, leading to a
platform hang.

When the clients and machine drivers provide an _unregister callback,
let's invoke it in the shutdown sequence.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index d99ecbb4282d..2a35d8ddf43e 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -463,10 +463,19 @@ EXPORT_SYMBOL(snd_sof_device_remove);
 int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct snd_sof_pdata *pdata = sdev->pdata;
 
 	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
 		cancel_work_sync(&sdev->probe_work);
 
+	/*
+	 * make sure clients and machine driver(s) are unregistered to force
+	 * all userspace devices to be closed prior to the DSP shutdown sequence
+	 */
+	sof_unregister_clients(sdev);
+
+	snd_sof_machine_unregister(sdev, pdata);
+
 	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
 		return snd_sof_shutdown(sdev);
 

base-commit: f7d344a2bd5ec81fbd1ce76928fd059e57ec9bea
-- 
2.35.1

