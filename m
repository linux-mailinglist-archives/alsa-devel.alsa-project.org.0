Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C3A220DA9
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Jul 2020 15:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B9F9F1669;
	Wed, 15 Jul 2020 15:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B9F9F1669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594818545;
	bh=3qG0tDHK4FTq+aJtALuUMcURMfk1jSgSyuxWBp8fwMc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Sn/WlPx1koRbV/rIujMpANYUG2LvLMxF4DZxQoqTH5cnGsETFGh/b2fH94HkOjIYv
	 RHyoDmkfcdH7gakcg8+H3ss70y/0TkS5fnBA8eNYad6t7l1oGPmpQ98aIBPgWnbGSC
	 wI0XTYxFQl+SxEn5fmb5wv2avZ0vbf/3pFrmUDAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CE38FF80227;
	Wed, 15 Jul 2020 15:07:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B1BAF8021D; Wed, 15 Jul 2020 15:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E8CBF800E8
 for <alsa-devel@alsa-project.org>; Wed, 15 Jul 2020 15:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E8CBF800E8
IronPort-SDR: I5Mj/jMBoJhHes+pHYepymdQzRDxuPeqaCaRwt3Yv7zsKDMdk3iG8ZfnI2A5lk/EIrxuOTXUn6
 7a2ElXYIMCsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9682"; a="137267539"
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="137267539"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2020 06:07:04 -0700
IronPort-SDR: E3pA83vvknl1Df5oHsY6r61hOoIDzniJHE8XzU9CoYabakhau/AgfLvtlpy6dDBj35AO9l6AFY
 apgQ9NUm9/LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,355,1589266800"; d="scan'208";a="324828700"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by FMSMGA003.fm.intel.com with ESMTP; 15 Jul 2020 06:06:55 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: hdac_hdmi: remove cancel_work_sync in runtime suspend
Date: Wed, 15 Jul 2020 21:01:50 +0800
Message-Id: <1594818110-786-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Brent Lu <brent.lu@intel.com>
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

A deadlock is identified when there are three contexts running at the
same time:
- a HDMI jack work which is calling snd_soc_dapm_sync().
- user space is calling snd_pcm_release() to close pcm device.
- pm is calling runtime suspend function of HDMI codec driver.

By removing the clear_dapm_works() invocation in the
hdac_hdmi_runtime_suspend() function, the snd_pcm_release() could
always returns from dapm_power_widgets() function call without
blocking the hdac_hdmi_jack_dapm_work() work thread or being blocked
by the hdac_hdmi_runtime_suspend() function. The purpose of the jack
work is to enable/disable the dapm jack pin so it's not necessary to
cancel the work in runtime suspend function which is usually called
when pcm device is closed.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/codecs/hdac_hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index f26b77f..9052edd 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -2097,8 +2097,6 @@ static int hdac_hdmi_runtime_suspend(struct device *dev)
 	if (!bus)
 		return 0;
 
-	clear_dapm_works(hdev);
-
 	/*
 	 * Power down afg.
 	 * codec_read is preferred over codec_write to set the power state.
-- 
2.7.4

