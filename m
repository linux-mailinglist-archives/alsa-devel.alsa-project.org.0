Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D12E4D404D
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Mar 2022 05:30:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D2417B6;
	Thu, 10 Mar 2022 05:29:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D2417B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646886612;
	bh=sGuKLGEnlhUeu/ZDoTWrMX/BpPNizb7za9JQMXG4NhE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cBDw0GvxMvV9miajBmVXykGilcw4fFT/5HSiPVwFEUtWMDEZ7Su0DDJemWyRpmVlo
	 p7+FgPnD55kUh414pLVLyj+iNY+b2zkHUFlfwKMCB0wWzTQ/4z+ygUI/tdAVgXzs9k
	 529/ecmKlnok9lrkJyYnnFIDNGeUjJVhm/Kck4k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 492D2F8051F;
	Thu, 10 Mar 2022 05:27:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20B82F8051B; Thu, 10 Mar 2022 05:27:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 29DB0F8013C
 for <alsa-devel@alsa-project.org>; Thu, 10 Mar 2022 05:27:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29DB0F8013C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="n4/R7XiU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646886466; x=1678422466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sGuKLGEnlhUeu/ZDoTWrMX/BpPNizb7za9JQMXG4NhE=;
 b=n4/R7XiURFyGZfFHelfGTtAFdDPIgZZYUD7QC3apmHV3VgCA2jyo8ywn
 1E6ThNdM9pw+KjHAf+i05yY6Ms/OWHyDlhVqlMzFxMae73ex/pypCa/k+
 BXhkZIoOgUu4pz3wv50eTwQ+Ld6ks47fAkvVPlDOnzs7owO/2ubLd+3Kj
 2GxyWuOtnBlrRLMgsW4MNcDu2kc6AQbMIVc34bFCsb28IG3rjn4gjqqz9
 e6D8PHlmgflZ74KxnPnUHHDLN8GOQcb4lPbamDUUWYyEH2dDnbm60uEGq
 E8SlunOCSy4yOnkb1xGmwd3j+uxjTmLoFwQdhHdwrEbhdq1oOK9nXz9ET Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="318380885"
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="318380885"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:32 -0800
X-IronPort-AV: E=Sophos;i="5.90,169,1643702400"; d="scan'208";a="547884673"
Received: from ttahmed-mobl2.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.50.225])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 20:27:31 -0800
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/10] ASoC: SOF: pcm: Remove sof_pcm_dsp_params() wrapper
Date: Wed,  9 Mar 2022 20:27:13 -0800
Message-Id: <20220310042720.976809-4-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
References: <20220310042720.976809-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Call directly for snd_sof_ipc_pcm_params() from sof_pcm_hw_params() and
remove the wrapper for it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/pcm.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index d952ea8ccd12..93989a77873a 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -36,22 +36,6 @@ static int create_page_table(struct snd_soc_component *component,
 		spcm->stream[stream].page_table.area, size);
 }
 
-static int sof_pcm_dsp_params(struct snd_sof_pcm *spcm, struct snd_pcm_substream *substream,
-			      const struct sof_ipc_pcm_params_reply *reply)
-{
-	struct snd_soc_component *scomp = spcm->scomp;
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-
-	/* validate offset */
-	int ret = snd_sof_ipc_pcm_params(sdev, substream, reply);
-
-	if (ret < 0)
-		dev_err(scomp->dev, "error: got wrong reply for PCM %d\n",
-			spcm->pcm.pcm_id);
-
-	return ret;
-}
-
 /*
  * sof pcm period elapse work
  */
@@ -285,9 +269,12 @@ static int sof_pcm_hw_params(struct snd_soc_component *component,
 		return ret;
 	}
 
-	ret = sof_pcm_dsp_params(spcm, substream, &ipc_params_reply);
-	if (ret < 0)
+	ret = snd_sof_ipc_pcm_params(sdev, substream, &ipc_params_reply);
+	if (ret < 0) {
+		dev_err(component->dev, "%s: got wrong reply for PCM %d\n",
+			__func__, spcm->pcm.pcm_id);
 		return ret;
+	}
 
 	spcm->prepared[substream->stream] = true;
 
-- 
2.25.1

