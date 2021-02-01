Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C930A45D
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 10:28:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 962901771;
	Mon,  1 Feb 2021 10:28:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 962901771
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612171731;
	bh=dogd0vFSzdmglBUFCdw9rtxegh9nNxgvaKEiSxquf24=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IORCu2HFUOL7ySU3pY+uqjL7ZZZ9OuNl/Q8MXzvZuQuFTPntzOpuDLYr35jhoUe3X
	 /T1uZ+QOLqWN66jnKIT9JpXs0XQl9wPZIVrqIFKUGpngQbpA5C5Aisvj2v6lXFc06Q
	 YeaEHLwR8T8jwKovoGOmSycFgX8LcShe3j+R1FFI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C85DEF80234;
	Mon,  1 Feb 2021 10:27:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33C26F80224; Mon,  1 Feb 2021 10:27:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C089F8015A
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 10:27:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C089F8015A
IronPort-SDR: WNp71igToHo/vdLuiW0s3jXfg5mGV+OUEy26PEoH7nYshgbdyTSshjZ0hmq6vhUllEZa6R4QHZ
 7ScqAS8YrNEw==
X-IronPort-AV: E=McAfee;i="6000,8403,9881"; a="180803263"
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="180803263"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 01:27:05 -0800
IronPort-SDR: tnqbT84CdlvOxHchma1Yk5vq3DNM5RyMTGzkHQfihsNKV1+LYSvBYUnEzK2cTzcP902YGGavtd
 0mRCgwQaSTRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,392,1602572400"; d="scan'208";a="371476553"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 01 Feb 2021 01:27:03 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH] ASoC: SOF: add be_hw_params_fixup() for ALH
Date: Mon,  1 Feb 2021 11:23:45 +0200
Message-Id: <20210201092345.1214232-1-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Rander Wang <rander.wang@intel.com>,
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

From: Rander Wang <rander.wang@intel.com>

Fixup BE DAI links channel count to match topology settings. Normally the
channel count of BE is equal to FE's so we don't have any issue. For some
cases like DSM with 2-channel FE and 4-channel BE the mismatch of BE and
topology will result in audio issues.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Keyon Jie <yang.jie@intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/pcm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 0dc39fbcd81d..61c3fe17342d 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -707,7 +707,12 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		}
 		break;
 	case SOF_DAI_INTEL_ALH:
-		/* do nothing for ALH dai_link */
+		/*
+		 * Dai could run with different channel count compared with
+		 * front end, so get dai channel count from topology
+		 */
+		channels->min = dai->dai_config->alh.channels;
+		channels->max = dai->dai_config->alh.channels;
 		break;
 	case SOF_DAI_IMX_ESAI:
 		rate->min = dai->dai_config->esai.fsync_rate;

base-commit: 8ac9e476b86851c94e0f33bea758e0a00e3f875e
-- 
2.29.2

