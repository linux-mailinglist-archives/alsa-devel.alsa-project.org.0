Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE21294904
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Oct 2020 09:40:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A91B116EB;
	Wed, 21 Oct 2020 09:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A91B116EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603265999;
	bh=ByjuYXaPslY2lp5ApVl+sSwmnPdlAXkDzNsSxTOVY50=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m3YFFBCwSapLOYUvBypGvfSYT1PzLlZll0Hp4YNhylnvPnPxYw8rM8a4UILGOgPho
	 im1TI3mX/3PfaiM0XYQcBMndrsKamh6JGSxXzrXDrGns+Jruf2bxJS+B8cKsjkC+4Y
	 4NcMAQK79aBh9eIdrwCl6EDoDzNLCN9fgf3qDwjw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CF0BF8026F;
	Wed, 21 Oct 2020 09:38:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 993FEF80264; Wed, 21 Oct 2020 09:38:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABD95F8011C
 for <alsa-devel@alsa-project.org>; Wed, 21 Oct 2020 09:38:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABD95F8011C
IronPort-SDR: qenKH4v6GbM9I1bh0TgXVD7bZz1id5JsLCqq8/THKKPCtWlrpZwM4NoBNyse1PBRSx/I6FEg4I
 oFovKC0cz0uQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="252025708"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="252025708"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2020 00:37:58 -0700
IronPort-SDR: 08o/ogkN8JaVAoo7XISqQiD8L4Uyt8Gif7lA1S3DPv610Flkkzv5obdRQg175n2LF13+cjRu8D
 EFq4dhovEyaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; d="scan'208";a="348206927"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga004.fm.intel.com with ESMTP; 21 Oct 2020 00:37:53 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: sof_rt5682: update quirk for cml boards
Date: Wed, 21 Oct 2020 15:26:46 +0800
Message-Id: <20201021072646.7980-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

The default quirk data of sof_rt5682 is for tgl platform. For cml
platforms to reuse this driver, the flag SOF_RT5682_MCLK_24MHZ is
necessary to setup codec asrc correctly.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index ddbb9fe7cc06..fa2c226a444a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -768,6 +768,11 @@ static int sof_audio_probe(struct platform_device *pdev)
 		/* default number of HDMI DAI's */
 		if (!hdmi_num)
 			hdmi_num = 3;
+
+		if (soc_intel_is_cml()) {
+			/* default quirk for sof_rt5682 is for tgl platform */
+			sof_rt5682_quirk |= SOF_RT5682_MCLK_24MHZ;
+		}
 	}
 
 	/* need to get main clock from pmc */
-- 
2.17.1

