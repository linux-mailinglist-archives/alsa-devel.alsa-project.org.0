Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE374307300
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 10:44:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F42E16D0;
	Thu, 28 Jan 2021 10:43:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F42E16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611827086;
	bh=EqTGHD/06oipX4/r37yNO/YP8B7VLST05ehDQ3GCGVM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mro3Y+s9Q4D+EoVDoLF1EBY4Vz/F9irB3LQx40Nuf2zJNbLTba8rYPF8d25LioqCf
	 k+vELgPsvWkHzOmaStKOSw0N2z192UuUT95RL4vMYJJAwq6koLMAXXsIpay9fEl0Gu
	 m99T4KbIKnmwppiubxgSPTqbv7Zu9jBIBo8GyVYA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E440F8027B;
	Thu, 28 Jan 2021 10:42:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CCE1F804B4; Thu, 28 Jan 2021 10:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64B44F800D1
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 10:42:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64B44F800D1
IronPort-SDR: s+cxjNKTJiggTwDQ1/3qw1bzxQDWnglhgrdNmZISfGpapzKcW6lCOXkjKcsWNXgP1uvgypuoTn
 WoisYFlz4B3Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="159380107"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="159380107"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 01:42:17 -0800
IronPort-SDR: lQuo2dZficsUZlHYsEz1TWAHinL/g8oYhdJc43cZq0fvJDEFGOBKliaknSQVbkoB4CW2LPIUTq
 8oWIK7kG/5Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="369789123"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 01:42:15 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 2/5] ASoC: SOF: Intel: hda-loader: keep init cores alive
Date: Thu, 28 Jan 2021 11:38:47 +0200
Message-Id: <20210128093850.1041387-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
References: <20210128093850.1041387-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

init_core_mask should be the available cores mask after fw boot. So we
should keep not core 0 but init cores alive.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 4b2ab351e2cc..07b73fe3c5e5 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -147,8 +147,9 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 				       chip->ipc_ack_mask,
 				       chip->ipc_ack_mask);
 
-	/* step 5: power down corex */
-	ret = hda_dsp_core_power_down(sdev, chip->host_managed_cores_mask & ~(BIT(0)));
+	/* step 5: power down cores that are no longer needed */
+	ret = hda_dsp_core_power_down(sdev, chip->host_managed_cores_mask &
+				      ~(chip->init_core_mask));
 	if (ret < 0) {
 		if (hda->boot_iteration == HDA_FW_BOOT_ATTEMPTS)
 			dev_err(sdev->dev,
-- 
2.29.2

