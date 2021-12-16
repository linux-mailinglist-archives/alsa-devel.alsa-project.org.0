Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 853C0478065
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Dec 2021 00:18:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18A782013;
	Fri, 17 Dec 2021 00:17:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18A782013
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639696711;
	bh=656bol65cWpWIQr+3WCQyE8h0GX+tZ4rK+z0RQ9129U=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J5VMhiYpDR2mNG7KsaSTj965YhYCwLXLkzPi2QgYPbKm3KQRnbJRxAOlDUzx4Clnf
	 H/MqMD8azLhjJIDVsBlIToamHGjZ6PnY7Zth75lYIIv0XFpA1LgFG1Nq2eiujYI+pW
	 TIn/Y7jdnYzSZSFJsIhjX/RSAs0OC1rYLiJdhwvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26B53F80310;
	Fri, 17 Dec 2021 00:16:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2266F800F4; Fri, 17 Dec 2021 00:16:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4BE6AF800F4
 for <alsa-devel@alsa-project.org>; Fri, 17 Dec 2021 00:16:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE6AF800F4
X-IronPort-AV: E=McAfee;i="6200,9189,10200"; a="219641673"
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="219641673"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:16:38 -0800
X-IronPort-AV: E=Sophos;i="5.88,212,1635231600"; d="scan'208";a="756279922"
Received: from priyosmi-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.100.174])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 15:16:37 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/3] ASoC: SOF: pcm: remove support for RESUME trigger
Date: Thu, 16 Dec 2021 17:16:26 -0600
Message-Id: <20211216231628.344687-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216231628.344687-1-pierre-louis.bossart@linux.intel.com>
References: <20211216231628.344687-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, tiwai@suse.de,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, Kai Vehmanen <kai.vehmanen@intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

The SOF driver removed the support for INFO_RESUME in the commit
"ASoC: SOF: pcm: do not add SNDRV_PCM_INFO_RESUME to runtime hw info".
And resuming is handled by the ALSA core with the .prepare and
.trigger_start stages. So, remove handling of RESUME trigger in the
component driver trigger op.

Reviewed-by: Kai Vehmanen <kai.vehmanen@intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pcm.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e4446defe51e..37fb8e6cd493 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -395,26 +395,6 @@ static int sof_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		stream.hdr.cmd |= SOF_IPC_STREAM_TRIG_RELEASE;
 		break;
-	case SNDRV_PCM_TRIGGER_RESUME:
-		if (spcm->stream[substream->stream].suspend_ignored) {
-			/*
-			 * this case will be triggered when INFO_RESUME is
-			 * supported, no need to resume streams that remained
-			 * enabled in D0ix.
-			 */
-			spcm->stream[substream->stream].suspend_ignored = false;
-			return 0;
-		}
-
-		/* set up hw_params */
-		ret = sof_pcm_prepare(component, substream);
-		if (ret < 0) {
-			dev_err(component->dev,
-				"error: failed to set up hw_params upon resume\n");
-			return ret;
-		}
-
-		fallthrough;
 	case SNDRV_PCM_TRIGGER_START:
 		if (spcm->stream[substream->stream].suspend_ignored) {
 			/*
-- 
2.25.1

