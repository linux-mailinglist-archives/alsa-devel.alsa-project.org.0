Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F14D44B0B99
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 11:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7688717DD;
	Thu, 10 Feb 2022 11:57:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7688717DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644490708;
	bh=azAEAI0Fg/kGZ09zLDIdo+Wl6+JUyPmAKn9bATV4jtU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tFCxjPzjWiBjTx8X1l2grUTOUz/sYlY2sWivtP92lAtnaHISUkG8ngIZh6vAKUsP4
	 ldpOlpssRXw86OKaerMnMP+IY6jeoeuoHFl8fe24UNo7LSISnU3uW24X8br9gvNb4Z
	 75731yAGe4XM+zqA/vdgjFDLhqnp4YgId5Ny0SgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31779F80524;
	Thu, 10 Feb 2022 11:55:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9AF6F80519; Thu, 10 Feb 2022 11:55:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9816FF80054
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 11:55:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9816FF80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="X1yy8e08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490532; x=1676026532;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=azAEAI0Fg/kGZ09zLDIdo+Wl6+JUyPmAKn9bATV4jtU=;
 b=X1yy8e08BwC3RKgUYZjtLPjN0rmJT/67BsAAQAPU7QdyaE3j46KzkFPd
 Wgp9RXB5Og2QCZ3aG4OduL4Rebpy/fZmHbTQu8w4ZpHeA919sLJyHONft
 l8z/Hfc7L/6QVG797taX4wcfII2npCYUmxuIRh3lcl6mBvHtNBj1SXkNT
 FpS/NY/b4chCEvNmHlbdTKWt1dlnX7Lp99klk/28qvyDky0RVrN+LPOi/
 fFNbSGrwnYblJQ202uHvH9QaxSi0IZqMf146SzxOZn0Sowf7J7+9tlcIB
 8p5AzCYaK2rSOjDGo+zuHHuTcXjxSWy/magkjNTW6PX3b5t2fxI0Gdv6A w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202830"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202830"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:26 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679106841"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:23 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH 1/9] ASoC: SOF: Drop unused DSP power states: D3_HOT and
 D3_COLD
Date: Thu, 10 Feb 2022 12:55:11 +0200
Message-Id: <20220210105519.19795-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
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

