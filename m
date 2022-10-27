Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A53B6101E1
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:40:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1811E2DD6;
	Thu, 27 Oct 2022 21:40:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1811E2DD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899656;
	bh=r1tDvRQeNtbLiiOZiqTwbZdqxVGDKMWlVeN0HIGsZ2M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vcwXo/SuAYUnAhyIwd8RCigjX2Atou3bybGbUPejNxYcVm7i1peDClbOPyRWjSPn2
	 X8/6Nn1XX4x/kzRjJAstuIKqDZvnKBUbmrIlfMkJA1dk2ZOn+7U+cIZGtPMw4EVi45
	 sBK8rAjAqDB9t4E0OJ/J7V4l4OPp8CT7jpiC1w8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FE85F80580;
	Thu, 27 Oct 2022 21:36:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C03F6F805C0; Thu, 27 Oct 2022 21:36:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0638AF80579
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0638AF80579
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Nn456wWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899382; x=1698435382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r1tDvRQeNtbLiiOZiqTwbZdqxVGDKMWlVeN0HIGsZ2M=;
 b=Nn456wWEHVAAtxD+oHNT7vBR42V7Cq329YFivOS++NvrDrWn+BbjbzHg
 dzD7DY4ZY3SJbbvsGbnIAr1v27/7zOIVFvdW+TndexPlVnfqo09KVT0Xu
 a9KbaqaIUqlKYhYZjz9Fnr0nWd3iIyDg0IIRDvR1PJSyepPrpxVhR4umf
 Rq7oZx5xQ5PEKnXhS8RD3HNhhZAJPNng4/PmfMUsqtXzLQarVLKdluC2N
 1jbWHASNrGXgQ9T9Tu39UZu19wUWDJHsWcUJTjN8NiZ1bkFlPZmR8rj1J
 0v6sKM6GHR7vCApNouFWOjaN48ucmk+cM2Dd92H+fAdwJKiCqofpl60an Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957849"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957849"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:20 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632527044"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632527044"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:18 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 14/21] ASoC: SOF: Intel: hda-dsp: clarify dependencies on
 SND_SOC_SOF_HDA
Date: Thu, 27 Oct 2022 15:35:33 -0400
Message-Id: <20221027193540.259520-15-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

IS_ENABLED is not always in the right places, the codec parts depend
on SND_SOC_SOF_HDAUDIO_CODEC

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 6d896ea31680..d325e82aff4c 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -635,9 +635,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 	if (ret < 0)
 		return ret;
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	hda_codec_jack_wake_enable(sdev, runtime_suspend);
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* power down all hda link */
 	snd_hdac_ext_bus_link_power_down_all(bus);
 #endif
@@ -698,14 +698,12 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 		goto cleanup;
 	}
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
 	/* check jack status */
 	if (runtime_resume) {
 		hda_codec_jack_wake_enable(sdev, false);
 		if (sdev->system_suspend_target == SOF_SUSPEND_NONE)
 			hda_codec_jack_check(sdev);
 	}
-#endif
 
 	/* enable ppcap interrupt */
 	hda_dsp_ctrl_ppcap_enable(sdev, true);
-- 
2.34.1

