Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA113072FE
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Jan 2021 10:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF3D516D3;
	Thu, 28 Jan 2021 10:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF3D516D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611827047;
	bh=8kaa2ndUsFhVpN5iTWzB/kA4ylvQKAFjTrpdxUcRKj4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O014LB+kK4crJ0x9O9wNZg2zw3Y7iw89JI2QXtpQk0LeGszuziXXwB0IF3XEHIQdH
	 OjjuKivoW0sbQPZKVDMI6pZNDRzdmUm8a3bZhkyRKbblgUciVI0GM3lT7y9X0JOJFY
	 EjVtE3edloIZtWLHjTyz21jLWyIdqwU2JV9k5v28=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AA99F80253;
	Thu, 28 Jan 2021 10:42:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EBF1DF80217; Thu, 28 Jan 2021 10:42:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A980F800BE
 for <alsa-devel@alsa-project.org>; Thu, 28 Jan 2021 10:42:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A980F800BE
IronPort-SDR: 3Q/GF5BKIUwzdp+uF6A7osz1mxek9gQA1eKpt4m8ssiaYLtw4SUsileeAJIdB2hM7cazbL3xYH
 +7+uZi+FSxDw==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="159380104"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="159380104"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 01:42:15 -0800
IronPort-SDR: vIwQ3wcRIx+UICeWmNv37ZBHdVjK9ddaHhTfUeH/drfTOzefyEEm/9p9jsrBuNxX5KDGsbBOs5
 MsqO4iXsTiQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="369789112"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 28 Jan 2021 01:42:13 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/5] ASoC: SOF: Intel: hda: use snd_sof_dsp_core_power_up/down
 API
Date: Thu, 28 Jan 2021 11:38:46 +0200
Message-Id: <20210128093850.1041387-2-kai.vehmanen@linux.intel.com>
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

To implement common logic in SOF core, core power up/down flows should
use common SOF API and not directly use low-level platform specific
helper functions.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c    | 2 +-
 sound/soc/sof/intel/hda-loader.c | 2 +-
 sound/soc/sof/intel/hda.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2b001151fe37..4fe4175179d4 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -624,7 +624,7 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 #endif
 
 	/* power down DSP */
-	ret = hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
+	ret = snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
 	if (ret < 0) {
 		dev_err(sdev->dev,
 			"error: failed to power down core during suspend\n");
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 365a79fc7081..4b2ab351e2cc 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -183,7 +183,7 @@ static int cl_dsp_init(struct snd_sof_dev *sdev, int stream_tag)
 		flags |= SOF_DBG_DUMP_FORCE_ERR_LEVEL;
 
 	hda_dsp_dump(sdev, flags);
-	hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
+	snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
 
 	return ret;
 }
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 7e703ce22fcd..d57d484a42d1 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -928,7 +928,7 @@ int hda_dsp_remove(struct snd_sof_dev *sdev)
 
 	/* disable cores */
 	if (chip)
-		hda_dsp_core_reset_power_down(sdev, chip->host_managed_cores_mask);
+		snd_sof_dsp_core_power_down(sdev, chip->host_managed_cores_mask);
 
 	/* disable DSP */
 	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
-- 
2.29.2

