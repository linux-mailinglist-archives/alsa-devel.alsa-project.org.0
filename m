Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1264664D804
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Dec 2022 09:50:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 776B423D9;
	Thu, 15 Dec 2022 09:49:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 776B423D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671094229;
	bh=Xb6HAMTOE8XGB+he/8crvLmIoKFamiSOnJ54h1Bx0Vg=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=t2bNbxfnA52Ed7hQw2wwaGukpShSiobZOUgzI7dZGJh8O3kjGVf1E7E3+yfplJwFT
	 D9hlT8fCs+JOtfD1Q8B36lE4gEFnTrvmu2St+mfT+eqwiIDJEqCYFBnBxT19As07HP
	 eHz5Gt3J+rTw2jQ+YI1sGYCIbIep2sVapiTuxs0g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0301AF804F3;
	Thu, 15 Dec 2022 09:49:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1470F804ED; Thu, 15 Dec 2022 09:49:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0DF7BF801D5
 for <alsa-devel@alsa-project.org>; Thu, 15 Dec 2022 09:49:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0DF7BF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=UndBVJcB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1671094168; x=1702630168;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xb6HAMTOE8XGB+he/8crvLmIoKFamiSOnJ54h1Bx0Vg=;
 b=UndBVJcBeNNT3jZcQBCJmpJfqhBrqRgEejaxYwREurkOS8y61zWQamto
 m0n1vQJHY01t8J7BZh+rtpAw1sJT/RC+/pK2JiidFY1VQpE2+SAN0W29Z
 tAp+rqylBRtQcf5/jX9jII1zl3FlyAsmw4dHSLLZ6yRtDFraw2aDviIbG
 HKdZmXpfPs+ZSV0XEGahH8xdrJZKiBttBm5kZYbvh7OZD5g3dxW61gljH
 LiuSx3jOdHALbSiceHM2gSlg9fdwwYz5NWomZ3voAeo6ZtVhdEzBT5f1m
 eCXT01zFx01A9rxLtLfwn09rDUZ56d9zFYr/hRItXtID/cC4I9E6qOOU7 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="345712036"
X-IronPort-AV: E=Sophos;i="5.96,246,1665471600"; d="scan'208";a="345712036"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 00:49:21 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10561"; a="627091306"
X-IronPort-AV: E=Sophos;i="5.96,246,1665471600"; d="scan'208";a="627091306"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2022 00:49:18 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: alsa-devel@alsa-project.org,
	vkoul@kernel.org
Subject: [PATCH] soundwire: intel: remove DAI startup/shutdown
Date: Thu, 15 Dec 2022 16:54:36 +0800
Message-Id: <20221215085436.2001568-1-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: pierre-louis.bossart@linux.intel.com, vinod.koul@linaro.org,
 bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The only thing these DAI startup/shutdown callbacks do is play with
pm_runtime reference counts.

This is not wrong, but it's not necessary at all. At the ASoC core level,
only the component matters for pm_runtime. The ASoC core already calls
pm_runtime_get_sync() in snd_soc_pcm_component_pm_runtime_get(),
before the DAI startup callback is invoked.

None of the SoundWire codec drivers rely on pm_runtime helpers in
their DAI startup/shutdown either. This adds to the evidence that only
the component, or more precisely the device specified when registering
a component, should deal with pm_runtime transitions.

Beyond the code cleanup, this move prepares for the addition of link
power management in the auxiliary device startup/resume/suspend
callbacks. The DAI callbacks can by-design assume that the device is
already pm_runtime active.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 drivers/soundwire/intel.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/drivers/soundwire/intel.c b/drivers/soundwire/intel.c
index bc9c50bacc49..2651767272c7 100644
--- a/drivers/soundwire/intel.c
+++ b/drivers/soundwire/intel.c
@@ -778,22 +778,6 @@ static int intel_post_bank_switch(struct sdw_intel *sdw)
  * DAI routines
  */
 
-static int intel_startup(struct snd_pcm_substream *substream,
-			 struct snd_soc_dai *dai)
-{
-	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	ret = pm_runtime_resume_and_get(cdns->dev);
-	if (ret < 0 && ret != -EACCES) {
-		dev_err_ratelimited(cdns->dev,
-				    "pm_runtime_resume_and_get failed in %s, ret %d\n",
-				    __func__, ret);
-		return ret;
-	}
-	return 0;
-}
-
 static int intel_hw_params(struct snd_pcm_substream *substream,
 			   struct snd_pcm_hw_params *params,
 			   struct snd_soc_dai *dai)
@@ -954,15 +938,6 @@ intel_hw_free(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 	return 0;
 }
 
-static void intel_shutdown(struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
-{
-	struct sdw_cdns *cdns = snd_soc_dai_get_drvdata(dai);
-
-	pm_runtime_mark_last_busy(cdns->dev);
-	pm_runtime_put_autosuspend(cdns->dev);
-}
-
 static int intel_pcm_set_sdw_stream(struct snd_soc_dai *dai,
 				    void *stream, int direction)
 {
@@ -1088,12 +1063,10 @@ static int intel_component_dais_suspend(struct snd_soc_component *component)
 }
 
 static const struct snd_soc_dai_ops intel_pcm_dai_ops = {
-	.startup = intel_startup,
 	.hw_params = intel_hw_params,
 	.prepare = intel_prepare,
 	.hw_free = intel_hw_free,
 	.trigger = intel_trigger,
-	.shutdown = intel_shutdown,
 	.set_stream = intel_pcm_set_sdw_stream,
 	.get_stream = intel_get_sdw_stream,
 };
-- 
2.25.1

