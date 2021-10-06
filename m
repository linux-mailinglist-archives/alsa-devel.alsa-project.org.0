Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E1F4240DD
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 17:08:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91F2A112;
	Wed,  6 Oct 2021 17:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91F2A112
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633532890;
	bh=XYVhEfijq27mW4KdqDnjNBeb2WxEuAj1RGL36qo2bHI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LkvdyZFAMvKMzZ+vN3VbIjRHYm5rBUkv4if6x8RSWeMddQASUMveWCvJlgqbm7obw
	 LxT/ugCWtdzBww6bCY1+LzsYN8lCMF1VlYVJ4I5yAQUCGsJN/O2oiQYFZCtBYnJIiA
	 t0jP4ioVKBE/4J8ZBkz67x1jt2EtcmbjL5lqp+2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14D4FF80516;
	Wed,  6 Oct 2021 17:05:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85DA2F80516; Wed,  6 Oct 2021 17:05:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 939B9F80511
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 17:05:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 939B9F80511
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="226325932"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="226325932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 08:04:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="488520328"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga008.jf.intel.com with ESMTP; 06 Oct 2021 08:04:46 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 67B4B56; Wed,  6 Oct 2021 18:04:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/4] ASoC: Intel: bytcr_rt5651: Utilize dev_err_probe() to
 avoid log saturation
Date: Wed,  6 Oct 2021 18:04:51 +0300
Message-Id: <20211006150451.16561-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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
 sound/soc/intel/boards/bytcr_rt5651.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 28c561302e69..5e9c53dadbc7 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -1058,10 +1058,8 @@ static int snd_byt_rt5651_mc_probe(struct platform_device *pdev)
 	if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
 		priv->mclk = devm_clk_get_optional(dev, "pmc_plt_clk_3");
 		if (IS_ERR(priv->mclk)) {
-			ret_val = PTR_ERR(priv->mclk);
-			dev_err(dev,
-				"Failed to get MCLK from pmc_plt_clk_3: %d\n",
-				ret_val);
+			ret_val = dev_err_probe(dev, PTR_ERR(priv->mclk),
+						"Failed to get MCLK from pmc_plt_clk_3\n");
 			goto err;
 		}
 		/*
-- 
2.33.0

