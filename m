Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EEF4216DF
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 20:57:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD8A71666;
	Mon,  4 Oct 2021 20:56:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD8A71666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633373833;
	bh=yuWFH/oIhictHBApSx4tW8L3mEiQKQLN5bpMN9Dahg0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nPVoG9fJKiupnhWXcX6ly3jA+Kp6u0FgpuoaUjUpAH+2HLsGSfeM8g249pe90RwJx
	 dvVwGPhNTpFVeifT+29zu4YvMaXkVf3EV/wJixkpD5w+0ijR7oJu1g2/gKMOnh0n/G
	 6gOJnFFq5Sceb4p9c/iS55mQVvmFkYCAC5UXHouE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C449EF804E7;
	Mon,  4 Oct 2021 20:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 69D0AF804E5; Mon,  4 Oct 2021 20:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 43138F800BA
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 20:55:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43138F800BA
X-IronPort-AV: E=McAfee;i="6200,9189,10127"; a="206360928"
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="206360928"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:42 -0700
X-IronPort-AV: E=Sophos;i="5.85,346,1624345200"; d="scan'208";a="523435367"
Received: from mbrescia-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.4])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2021 10:14:41 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 3/5] ASoC: SOF: Intel: hda: add new flags for DAI_CONFIG
Date: Mon,  4 Oct 2021 12:14:28 -0500
Message-Id: <20211004171430.103674-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
References: <20211004171430.103674-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 broonie@kernel.org, Brent Lu <brent.lu@intel.com>,
 Bard Liao <bard.liao@intel.com>
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

The DAI_CONFIG is used for both hw_params and hw_free. Use flags to
specify what stage the configuration applies to.

the DAI_CONFIG IPC may be sent also during the widget setup so each
flag is cleared after the IPC to restore the state.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/sof/intel/hda.c | 6 ++++++
 sound/soc/sof/sof-audio.c | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 066e90506ae6..1463f3de01bc 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -71,6 +71,9 @@ int hda_ctrl_dai_widget_setup(struct snd_soc_dapm_widget *w)
 		return ret;
 	}
 
+	/* set HW_PARAMS flag */
+	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_HW_PARAMS);
+
 	/* send DAI_CONFIG IPC */
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
 				 &reply, sizeof(reply));
@@ -107,6 +110,9 @@ int hda_ctrl_dai_widget_free(struct snd_soc_dapm_widget *w)
 
 	config = &sof_dai->dai_config[sof_dai->current_config];
 
+	/* set HW_FREE flag */
+	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_HW_FREE);
+
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
 				 &reply, sizeof(reply));
 	if (ret < 0)
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index c4cabe26b157..262cb3ad4674 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -8,6 +8,7 @@
 // Author: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
 //
 
+#include <linux/bitfield.h>
 #include "sof-audio.h"
 #include "ops.h"
 
@@ -55,6 +56,9 @@ static int sof_dai_config_setup(struct snd_sof_dev *sdev, struct snd_sof_dai *da
 		return -EINVAL;
 	}
 
+	/* set NONE flag to clear all previous settings */
+	config->flags = FIELD_PREP(SOF_DAI_CONFIG_FLAGS_MASK, SOF_DAI_CONFIG_FLAGS_NONE);
+
 	ret = sof_ipc_tx_message(sdev->ipc, config->hdr.cmd, config, config->hdr.size,
 				 &reply, sizeof(reply));
 
-- 
2.25.1

