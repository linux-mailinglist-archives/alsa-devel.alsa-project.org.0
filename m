Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8712245CD
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 23:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C40B16C0;
	Fri, 17 Jul 2020 23:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C40B16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595020897;
	bh=CQpaybShSmqhWV9ZlFg+et/eP7Rr6qB1MDqBgK8iezw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=L2LOQG9jDPOpg92AcjZk3fL+XwCDqyai0ThxROhq8Jo2UP3FgcVz4cQB7wakJtsWl
	 wX8YJaThbQ6k7wZ1hOMTNGKWs4QAWHSpVlQFMkow0jE2au8bGGybZ6+ktCn08UjGOC
	 ZIcWA7IVIZ28WPT5b59qzz12lYVb/84OHy0D6Pb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F7CBF802E8;
	Fri, 17 Jul 2020 23:16:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16F1CF8021D; Fri, 17 Jul 2020 23:16:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=none autolearn=disabled
 version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AD70F80110
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 23:14:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AD70F80110
IronPort-SDR: UxIAAC8p8ueCgGtT4Rn7pSz+6dBXIDqeW5qOYaVupTzvKkZWtCvxoBJ5IpV9syAxVCn+r/rSDi
 Y/lLjypvD6TA==
X-IronPort-AV: E=McAfee;i="6000,8403,9685"; a="129758216"
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="129758216"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:52 -0700
IronPort-SDR: Y5z9njGoqSh2h1a/lL+/P1Eed03NZrq9jPO286u30UcrsAtya8XSbae8odFw1ZoWT4YDjNjCii
 9ISipjKeI6CA==
X-IronPort-AV: E=Sophos;i="5.75,364,1589266800"; d="scan'208";a="282905799"
Received: from toddjdav-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.77.240])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2020 14:13:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 5/6] ASoC: intel: board: sof_rt5682: Update rt1015 pll input
 clk freq
Date: Fri, 17 Jul 2020 16:13:36 -0500
Message-Id: <20200717211337.31956-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
References: <20200717211337.31956-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>
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

From: Yong Zhi <yong.zhi@intel.com>

In commit d696a61413b4 ("ASoC: rt1015: Add condition to prevent SoC
providing bclk in ratio of 50 times of sample rate."), PLL input at 50fs
is no longer supported, the new recommended settings at 48Khz rate are:

PLL input       SSP bclk
------------------------
64fs            3.073Mhz
100fs           4.8Mhz

(bclk update is reflected in topoplogy.)

Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_rt5682.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index cc8b0f26f724..61a61dcca82a 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -284,8 +284,15 @@ static int sof_rt1015_hw_params(struct snd_pcm_substream *substream,
 		return 0;
 
 	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		/* Set tdm/i2s1 master bclk ratio */
+		ret = snd_soc_dai_set_bclk_ratio(codec_dai, 64);
+		if (ret < 0) {
+			dev_err(card->dev, "failed to set bclk ratio\n");
+			return ret;
+		}
+
 		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1015_PLL_S_BCLK,
-					  params_rate(params) * 50,
+					  params_rate(params) * 64,
 					  params_rate(params) * 256);
 		if (ret < 0) {
 			dev_err(card->dev, "failed to set pll\n");
-- 
2.25.1

