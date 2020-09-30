Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4321827EC8C
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 17:28:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CED331833;
	Wed, 30 Sep 2020 17:27:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CED331833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601479726;
	bh=uuXNO1ci3kCISPNRbrM+AeW99QtmMz+WwJy/JqXz8Rw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P0un7tSqhRxNoREN0Uvdq2xAgUJ8aZJBcMLiyQVndxWZ4wJjX3iZGKTZK3H+w1pQE
	 G/A8nw4Fz7o6USnyzVwFQz62O0VKidsRswOUDovO/jTcLUz41GYmCkeseDoyGOw3EM
	 yXJkSmdmLq4IJKnT96c2Z/IxNCfsJfzEXntp3Y5A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 468EAF802E2;
	Wed, 30 Sep 2020 17:24:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3DBF0F802C3; Wed, 30 Sep 2020 17:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13674F80228
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 17:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13674F80228
IronPort-SDR: 8N6YG4/2xuELoxFuxaM3D9nrAAKS3nZCi4PLreIsC4Xipm5Q2CNWHI/utvLpef0TWqhI1cJfRB
 N+yo1mNO1UwQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="150130949"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="150130949"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2020 08:22:15 -0700
IronPort-SDR: SyJGGUZEN4EMQXjl7VmUkD5W3Ke+9UfhNM5vTqiUSAeG53sznjIGn1c5gRvp8quUAm7HWKj36M
 9+4tnhJaUYLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; d="scan'208";a="515114107"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga005.fm.intel.com with ESMTP; 30 Sep 2020 08:22:13 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 3/4] ASoC: SOF: sof-audio: remove goto used for force-nocodec
 support
Date: Wed, 30 Sep 2020 18:20:25 +0300
Message-Id: <20200930152026.3902186-4-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
References: <20200930152026.3902186-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 kernel test robot <lkp@intel.com>, kai.vehmanen@linux.intel.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, lgirdwood@gmail.com,
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

Address smatch warnings:
sound/soc/sof/sof-audio.c:375 sof_machine_check() warn: inconsistent indenting
sound/soc/sof/sof-audio.c:380 sof_machine_check() warn: ignoring unreachable code.

No functionality change.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/sof-audio.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index afe7e503bf66..9a8ce25a8fc8 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -443,11 +443,7 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	struct snd_soc_acpi_mach *mach;
 	int ret;
 
-	/* force nocodec mode */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
-		dev_warn(sdev->dev, "Force to use nocodec mode\n");
-		goto nocodec;
-#endif
+#if !IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
 
 	/* find machine */
 	snd_sof_machine_select(sdev);
@@ -460,8 +456,8 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	dev_err(sdev->dev, "error: no matching ASoC machine driver found - aborting probe\n");
 	return -ENODEV;
 #endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_FORCE_NOCODEC_MODE)
-nocodec:
+#else
+	dev_warn(sdev->dev, "Force to use nocodec mode\n");
 #endif
 	/* select nocodec mode */
 	dev_warn(sdev->dev, "Using nocodec machine driver\n");
-- 
2.27.0

