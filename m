Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8199B4240CB
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:06:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 21C5683E;
	Wed,  6 Oct 2021 17:05:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 21C5683E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633532808;
	bh=4ElE9WSjOoOoOy0uaaSRj11YCjiuZmE1M/GDF32RFIQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Z+W5EdhKvyOFbU4/aRBuCeeZqgXwN/G1TNpna9yvp+WdK6DamnNfej2u8LLQbkybU
	 gmBeCvh6syJJofpssKSHp9FsL0YDoTLr07iahte9p79iQq21nP5abdEOnrn2FHad7K
	 eq2XWl7lOXcmmM1ERRv0rfUtRPjV0mj3vdCLqQoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 978A5F804E5;
	Wed,  6 Oct 2021 17:04:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1C2B1F804E5; Wed,  6 Oct 2021 17:04:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00115F8032D
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:04:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00115F8032D
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="225961145"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="225961145"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="478146138"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga007.jf.intel.com with ESMTP; 06 Oct 2021 08:04:39 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id CFFA2291; Wed,  6 Oct 2021 18:04:45 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] ASoC: Intel: bytcr_rt5640: Utilize dev_err_probe() to
 avoid log saturation
Date: Wed,  6 Oct 2021 18:04:42 +0300
Message-Id: <20211006150442.16503-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
References: <20211006150442.16503-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

dev_err_probe() avoids printing into log when the deferred probe is invoked.
This is possible when clock provider is pending to appear.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 2e7d45f0f05d..a0c5f0e9c22a 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1617,8 +1617,8 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 							   "headset-mic-detect", GPIOD_IN,
 							   "headset-mic-detect");
 		if (IS_ERR(priv->hsmic_detect)) {
-			ret_val = PTR_ERR(priv->hsmic_detect);
-			dev_err_probe(dev, ret_val, "getting hsmic-detect GPIO\n");
+			ret_val = dev_err_probe(dev, PTR_ERR(priv->hsmic_detect),
+						"getting hsmic-detect GPIO\n");
 			goto err_device;
 		}
 	}
@@ -1645,12 +1645,8 @@ static int snd_byt_rt5640_mc_probe(struct platform_device *pdev)
 	if (byt_rt5640_quirk & BYT_RT5640_MCLK_EN) {
 		priv->mclk = devm_clk_get_optional(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
-			ret_val = PTR_ERR(priv->mclk);
-
-			dev_err(dev,
-				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
-				ret_val);
-
+			ret_val = dev_err_probe(dev, PTR_ERR(priv->mclk),
+						"Failed to get MCLK from pmc_plt_clk_3\n");
 			goto err;
 		}
 		/*
-- 
2.33.0

