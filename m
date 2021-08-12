Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7113EAD96
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Aug 2021 01:23:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A86CF191C;
	Fri, 13 Aug 2021 01:22:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A86CF191C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628810587;
	bh=wWS3K7ciyRjAYv3u/3fKWyWhfiLLTHRHWFt/8b6ns9o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KpZME6gfcjQj1NnCN40nvwmO6gH58b5B5/ZGoFxS1ATeStD298u654IuqO3/aANJ3
	 7PAeeoleCsfQ01g7cuMFHjyY2BMbZTIuYRxL5INj8kg+8BYpYPQEPDFyN/hqNAbaip
	 dLXlKUbpfqmVn4pdiIFZCfTTSxv2I9PwZWVxB4yI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 80CAAF804EC;
	Fri, 13 Aug 2021 01:20:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61B14F804E4; Fri, 13 Aug 2021 01:20:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C9BA0F804B1
 for <alsa-devel@alsa-project.org>; Fri, 13 Aug 2021 01:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9BA0F804B1
X-IronPort-AV: E=McAfee;i="6200,9189,10074"; a="202629473"
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="202629473"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:19:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,317,1620716400"; d="scan'208";a="507949890"
Received: from evanklei-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.77.110])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2021 16:19:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/4] ASoC: SOF: Intel: hda-stream: remove always true
 condition
Date: Thu, 12 Aug 2021 18:19:38 -0500
Message-Id: <20210812231940.172547-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
References: <20210812231940.172547-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
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

We test if (!stream) and return and later on re-test for stream.
The second test is always true.

This was detected by cppcheck but only after additional code changes.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 40a3993ae2cb..5302464754f9 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -198,7 +198,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 	 * in xruns during pause/release in capture scenarios.
 	 */
 	if (!IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1))
-		if (stream && !(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
+		if (!(flags & SOF_HDA_STREAM_DMI_L1_COMPATIBLE))
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
 						HDA_VS_INTEL_EM2,
 						HDA_VS_INTEL_EM2_L1SEN, 0);
-- 
2.25.1

