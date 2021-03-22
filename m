Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 988FF344BDB
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Mar 2021 17:40:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BE47166B;
	Mon, 22 Mar 2021 17:39:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BE47166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616431214;
	bh=85L6X2n4pYlF2a8S2JW5e2BcOyYjdKNIhWYZsWZ18yo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o5a1tIJ/5Fp83MPGlhg6XoV2UBX9pDFbneTy1GBM6y44B2tHyU0ajrvAUqt4ncfKy
	 uG+3aS3epAM3SkOiEq3fWd3bmimq1WW+y8xIEBTEXa4wr+IKDaybBfrPpzcGVFGsja
	 gYlbjCAED1c099VOXqRK0FEv5rjd+ARyQP7HVrsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64958F80246;
	Mon, 22 Mar 2021 17:38:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BCE2F802E3; Mon, 22 Mar 2021 17:38:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8A6EF80107
 for <alsa-devel@alsa-project.org>; Mon, 22 Mar 2021 17:37:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8A6EF80107
IronPort-SDR: dk0VVfJ+w59qsEfxt5e/dMiEX5cA5jT2v4BTqIUu+aFgWax1LHmo7828X/4efO7M5uMK+XebwP
 Xgz1ohYlWi/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="210376606"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="210376606"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:42 -0700
IronPort-SDR: X+E8/3bCDBkD+5KJQml426Q0k7b4+Jas1Ib7L5D1lJFXN74hRlV1ZEyirLaom+mf41yFmteZM6
 rRIkdFLIddNA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; d="scan'208";a="407899081"
Received: from josemari-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.209.40.21])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 09:37:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: SOF: core: harden shutdown helper
Date: Mon, 22 Mar 2021 11:37:22 -0500
Message-Id: <20210322163728.16616-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
References: <20210322163728.16616-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Libin Yang <libin.yang@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

When the probe is handled in a workqueue, we must use
cancel_work_sync() in the shutdown helper to avoid possible race
conditions.

We must also take care of possible errors happening in a probe
workqueue or during pm_runtime resume (called e.g. before shutdown for
PCI devices). We should really only try to access hardware registers
and initiate IPCs if the DSP is fully booted.

Fixes: daff7f1478e12 ("ASoC: SOF: add snd_sof_device_shutdown() helper for shutdown")
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Libin Yang <libin.yang@intel.com>
---
 sound/soc/sof/core.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 495295a34c3a..7005353602c4 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -400,7 +400,13 @@ int snd_sof_device_shutdown(struct device *dev)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 
-	return snd_sof_shutdown(sdev);
+	if (IS_ENABLED(CONFIG_SND_SOC_SOF_PROBE_WORK_QUEUE))
+		cancel_work_sync(&sdev->probe_work);
+
+	if (sdev->fw_state == SOF_FW_BOOT_COMPLETE)
+		return snd_sof_shutdown(sdev);
+
+	return 0;
 }
 EXPORT_SYMBOL(snd_sof_device_shutdown);
 
-- 
2.25.1

