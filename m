Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 982A14B1143
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 16:07:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31930193A;
	Thu, 10 Feb 2022 16:06:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31930193A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644505639;
	bh=azAEAI0Fg/kGZ09zLDIdo+Wl6+JUyPmAKn9bATV4jtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KBnob31AEwTctn0IEd5Tz82YiVu7XVEULNzi77t9V0Endk6ZkN3Nr460/sO4+eusZ
	 ZBsVwvqPr1LpmC7duFT+eXtVgdNdGSHeTDa89LSmPpA8r4lBCWjPliiveyqCCdPXrx
	 pGEall66QWFbg6pO7P95xOj1Iiq7AAMQ5v7D1z5Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A58F8F80516;
	Thu, 10 Feb 2022 16:05:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56C5DF804AC; Thu, 10 Feb 2022 16:05:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE6AFF8013D
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 16:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE6AFF8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OZb/lDla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644505537; x=1676041537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azAEAI0Fg/kGZ09zLDIdo+Wl6+JUyPmAKn9bATV4jtU=;
 b=OZb/lDlaJoKRdWXX+UuQPEht9Ix0LpKj3XTcZlIqV/EJoJ7dzWnBnChD
 E+dHn9Ro/biQB+tGZu1FtVLjFasjgvo7bfFxR7S/+pGP1MJcmTZGbVSZ+
 fS+ZPniwqy80gOE9exQ16NIjffk+5kgxyE6P3WIC8+vsZ0k4Ggq99lLsV
 gBRCdYFzqAnYINQ93NHOrOPtGuvPqawUKFRABBZ0tr9Yu9Q9T/kB9E6OU
 DPw9HnMDtgOJ54y0uJiQl/8zHKiwi+BLXTFcmugBmwR+WxGlWnLZ52Ihj
 QzvOdSAdbhFzH9xKXVcKmPUR92IKr8YwPbSsfdHtkgpDwvm9gU0BaENse w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249714948"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249714948"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="500422556"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 07:05:30 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH v2 1/9] ASoC: SOF: Drop unused DSP power states: D3_HOT and
 D3_COLD
Date: Thu, 10 Feb 2022 17:05:17 +0200
Message-Id: <20220210150525.30756-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
References: <20220210150525.30756-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

The only reference to D3_HOT and D3_COLD DSP power state is in
intel/hda-dsp.c in form of a dev_dbg() print.

Remove them as they are not used and even if they are they could be
re-added via the substate.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 6 ------
 sound/soc/sof/sof-priv.h      | 2 --
 2 files changed, 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 0fe522549c91..8ddde60c56b3 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -498,15 +498,9 @@ static void hda_dsp_state_log(struct snd_sof_dev *sdev)
 	case SOF_DSP_PM_D2:
 		dev_dbg(sdev->dev, "Current DSP power state: D2\n");
 		break;
-	case SOF_DSP_PM_D3_HOT:
-		dev_dbg(sdev->dev, "Current DSP power state: D3_HOT\n");
-		break;
 	case SOF_DSP_PM_D3:
 		dev_dbg(sdev->dev, "Current DSP power state: D3\n");
 		break;
-	case SOF_DSP_PM_D3_COLD:
-		dev_dbg(sdev->dev, "Current DSP power state: D3_COLD\n");
-		break;
 	default:
 		dev_dbg(sdev->dev, "Unknown DSP power state: %d\n",
 			sdev->dsp_power_state.state);
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index e48402ce4bdb..6358f8c84cce 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -84,9 +84,7 @@ enum sof_dsp_power_states {
 	SOF_DSP_PM_D0,
 	SOF_DSP_PM_D1,
 	SOF_DSP_PM_D2,
-	SOF_DSP_PM_D3_HOT,
 	SOF_DSP_PM_D3,
-	SOF_DSP_PM_D3_COLD,
 };
 
 struct sof_dsp_power_state {
-- 
2.35.1

