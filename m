Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE5551573
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jun 2022 12:09:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4E621940;
	Mon, 20 Jun 2022 12:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4E621940
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655719789;
	bh=O4SwyI2G/dNCqyMJTE1m8IbY8RbyRbpnChN1eMMr6xc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SEYiWWUIdNTc8JniectvdvrFXB3mRxsdd1Eb9CIQpohrliqCDWaQOkmdSZRYZ0kcU
	 exH0seJHrqRw1S0bEHY1MZen+8TJBVCyMnwwMhhBue4EBMz5oM28DWtAkcPWQmxYAR
	 2REw5DZAbG2G82ExGom2fyiN5ZRPp6A/4R4vU6d0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A8B7F805CB;
	Mon, 20 Jun 2022 12:04:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C9CCF805C9; Mon, 20 Jun 2022 12:04:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C41AF805C8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 12:04:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C41AF805C8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="TGH/Iglx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655719470; x=1687255470;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=O4SwyI2G/dNCqyMJTE1m8IbY8RbyRbpnChN1eMMr6xc=;
 b=TGH/Iglx2Ao5AMydNIypHFcaQY3TJvi/gfXXM6VBl2KF0IYFc0wkJyy5
 ZgBI5lNpmpISeqqyqenhVjRyNzyh5Y6QdwJ4Y+dFq/z7MeV8Cz9dth5mB
 EBrYYObc/5EP29H6JdW5yoKsw1tzmVNnPIBnL7lDYzQmjVJ2Jc64yWbSF
 6Bo3j1WyHSHD6xAKaTOHWfYHVaMSrrLFBvBpvKcucy+LjTkpmMdSUgbbN
 auiciraYu9rQ2TwUawkZZtfDddqsPgmql2eVw09nycs4vWkTlDry0uiy7
 Mi6A24v0oaWqGfqR4ONuTUWYblzirlVIqb8jcJ45ycXdkNAUC39crQCvU g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10380"; a="279905843"
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="279905843"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2022 03:04:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; d="scan'208";a="643046455"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
 by fmsmga008.fm.intel.com with ESMTP; 20 Jun 2022 03:04:21 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH v4 17/17] ASoC: Intel: bdw_rt286: Remove FE DAI ops
Date: Mon, 20 Jun 2022 12:14:02 +0200
Message-Id: <20220620101402.2684366-18-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220620101402.2684366-1-cezary.rojewski@intel.com>
References: <20220620101402.2684366-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 pierre-louis.bossart@linux.intel.com, tiwai@suse.com, hdegoede@redhat.com,
 amadeuszx.slawinski@linux.intel.com
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

bdw_rt286_fe_ops is redundant as platform components already limit the
number of channels available for the endpoint.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/boards/bdw_rt286.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/sound/soc/intel/boards/bdw_rt286.c b/sound/soc/intel/boards/bdw_rt286.c
index 622f2424ca59..2317a0bb136a 100644
--- a/sound/soc/intel/boards/bdw_rt286.c
+++ b/sound/soc/intel/boards/bdw_rt286.c
@@ -115,30 +115,6 @@ static const struct snd_soc_ops codec_link_ops = {
 	.hw_params = codec_link_hw_params,
 };
 
-static const unsigned int channels[] = {
-	2,
-};
-
-static const struct snd_pcm_hw_constraint_list constraints_channels = {
-	.count = ARRAY_SIZE(channels),
-	.list = channels,
-	.mask = 0,
-};
-
-static int bdw_rt286_fe_startup(struct snd_pcm_substream *substream)
-{
-	struct snd_pcm_runtime *runtime = substream->runtime;
-
-	/* Board supports stereo configuration only */
-	runtime->hw.channels_max = 2;
-	return snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
-					  &constraints_channels);
-}
-
-static const struct snd_soc_ops bdw_rt286_fe_ops = {
-	.startup = bdw_rt286_fe_startup,
-};
-
 SND_SOC_DAILINK_DEF(system, DAILINK_COMP_ARRAY(COMP_CPU("System Pin")));
 SND_SOC_DAILINK_DEF(offload0, DAILINK_COMP_ARRAY(COMP_CPU("Offload0 Pin")));
 SND_SOC_DAILINK_DEF(offload1, DAILINK_COMP_ARRAY(COMP_CPU("Offload1 Pin")));
@@ -157,7 +133,6 @@ static struct snd_soc_dai_link card_dai_links[] = {
 		.nonatomic = 1,
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.ops = &bdw_rt286_fe_ops,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1,
 		SND_SOC_DAILINK_REG(system, dummy, platform),
-- 
2.25.1

