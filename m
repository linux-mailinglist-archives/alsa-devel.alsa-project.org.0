Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 394AB25CF50
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 04:16:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADCF51ABC;
	Fri,  4 Sep 2020 04:15:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADCF51ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599185775;
	bh=Jfl9HcFR9obLYPBbjc6pe567ZbQomQxn+Xkm8CNz090=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aLL2z19nVoi7JYHFWzdd2etMhcFACIcS6hPYY+wevxeStLIIfWVcqDEJSIqbiXWtM
	 g4t1FvIzC31e1PBG7hiC3GFKeog59GBSG+doFg6tJoAp/1a2szXJbujRKr6+wMUyyC
	 UCoYRYF7IsrLSSuRrlE0SWxAQoJZ7YpDv8X6k1yE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DFFE1F800F0;
	Fri,  4 Sep 2020 04:14:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFE5CF8024A; Fri,  4 Sep 2020 04:14:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=5.0 tests=AC_FROM_MANY_DOTS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 877A2F801DA
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 04:14:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 877A2F801DA
IronPort-SDR: /p/IuTfuYndcUmWC8KyQOphlomZI9Ob6D9oY8QtQZ98F9DOA+wzAnGB35aGn9HyY+2bnFNQtoO
 oKYzXbSzbSNg==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="158663047"
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="158663047"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2020 19:14:20 -0700
IronPort-SDR: uoDT62K3tZOu8n0golAbme4zcqo4jpNlLmt2QzxtgJ5dMIQOAv2QtwHyg8/eqVqiVFVYF8Q7LN
 TLzyXEg9Iq5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,387,1592895600"; d="scan'208";a="326445690"
Received: from mike-ilbpg1.png.intel.com ([10.88.227.76])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2020 19:14:17 -0700
From: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: KeemBay: Fix warning potential ! vs ~ typo
Date: Fri,  4 Sep 2020 10:09:04 +0800
Message-Id: <20200904020904.19577-1-michael.wei.hong.sit@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, andriy.shevchenko@intel.com, tiwai@suse.com,
 jee.heng.sia@intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

To set platform in slave mode setting the MASTER_MODE bit is not needed.
Removing !MASTER_MODE conditional to avoid potential errors and warning.

Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/keembay/kmb_platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index ca25a6e40cc9..f54b710ee1c2 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -515,7 +515,7 @@ static int kmb_dai_hw_params(struct snd_pcm_substream *substream,
 
 		write_val = ((config->chan_nr / 2) << TDM_CHANNEL_CONFIG_BIT) |
 				(config->data_width << DATA_WIDTH_CONFIG_BIT) |
-				!MASTER_MODE | TDM_OPERATION;
+				TDM_OPERATION;
 
 		writel(write_val, kmb_i2s->pss_base + I2S_GEN_CFG_0);
 		break;
-- 
2.17.1

