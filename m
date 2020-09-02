Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6FF25AFCA
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 17:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D24C01879;
	Wed,  2 Sep 2020 17:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D24C01879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599061579;
	bh=fnMfnSTIR81qsGyMm2s1QIdZOJG9E2MUKKia0C5AbCY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VB7lDYxY+ZCXXwoSgEW+5DFeDFi0pZMWuFISHKV2CaQlTvFxpYc9TeHpTycM6b0hg
	 GZi3B3VEEPudrACIxMBB1afN6pcfYv256FgFS0nnOuIRXkpeoNT2xTQ/X1iTK0BAmC
	 ZUHdNsUmIXoMJZOg9YextUkxJCl3bkg+VQ98UmnQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07CD8F802E0;
	Wed,  2 Sep 2020 17:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECD2DF802DF; Wed,  2 Sep 2020 17:43:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B208BF800BA
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 17:43:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B208BF800BA
IronPort-SDR: 1b9ZeOv/tNULqvI3UIiixfZUz3zaKzKGB4c6n8m2HwGm46GRCqpvD211O+NAzoToVlsqcvF+P5
 93XKD4H0e3XA==
X-IronPort-AV: E=McAfee;i="6000,8403,9732"; a="221628508"
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="221628508"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2020 08:43:45 -0700
IronPort-SDR: vTnoQEJcov2aJzTrUDcW4Gb7e0A9ZEI2/sbt1qyJEYWttMOwmtkyI4Pm29RxSHkO2evHnBpIwQ
 3KugRKS1tPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,383,1592895600"; d="scan'208";a="502178904"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2020 08:43:43 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Subject: [PATCH] ALSA: hda: release resource when snd_hdac_device_init is
 failed
Date: Wed,  2 Sep 2020 18:42:29 +0300
Message-Id: <20200902154229.1440489-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kai.vehmanen@linux.intel.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Rander Wang <rander.wang@intel.com>

When snd_hdac_device_init is failed, the codec is released by kfree
immediately without releasing some resources. The vendor_name should
be free if the memory is allocated and the runtime pm status should
be restored, especially the runtime pm status of parent device.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/hda/hdac_device.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index 3e9e9ac804f6..8d9d37225701 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -109,12 +109,16 @@ int snd_hdac_device_init(struct hdac_device *codec, struct hdac_bus *bus,
 				     codec->vendor_id & 0xffff);
 	if (!codec->chip_name) {
 		err = -ENOMEM;
-		goto error;
+		goto error_chip;
 	}
 
 	return 0;
 
+ error_chip:
+	kfree(codec->vendor_name);
  error:
+	pm_runtime_put_noidle(&codec->dev);
+	pm_runtime_set_suspended(&codec->dev);
 	put_device(&codec->dev);
 	return err;
 }
-- 
2.27.0

