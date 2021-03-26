Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C5034B1DD
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:06:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8272F168C;
	Fri, 26 Mar 2021 23:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8272F168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616796376;
	bh=HeVMaC+BP+0JX6+43i0IYj4nIddZBQ6oYGL3xQYMIdU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=emExZPW+95YwHSlNCxWGbSHFoYNiloovJbhERlDjrWO5G8ZaQPSm5zhz4p4ssPeXZ
	 DILeVTB1ENW+MrcfOgo3f117GiZeeIHgqOXy0n8H0fA5brETmkc4nBNQ3UdArSMEA+
	 ESgOfkt4V/lBuorKt4nbSZPUMMqUzHMZkx4CboO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CB356F804FF;
	Fri, 26 Mar 2021 23:00:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78E5DF804AF; Fri, 26 Mar 2021 23:00:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D80A0F801D5
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:00:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D80A0F801D5
IronPort-SDR: ToXnXM/idV18iWpYakV8ycg+Etld9bQkYd2pUGDI+hBFX3KZZOG4Jhg8TRiRLwZxr2+spa5Wof
 PMqPKCJHcL7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="211396736"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="211396736"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:11 -0700
IronPort-SDR: Kd1I434yTkLH637JLQVyyM35CrcQFJ4t6dh3hzI2PrFA8z+j0URTOizazVklMi2PFM0tl3NGir
 XvqBkBjvY/aQ==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706860"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:10 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/17] ASoC: sunxi: sun8i-codec: clarify expression
Date: Fri, 26 Mar 2021 16:59:21 -0500
Message-Id: <20210326215927.936377-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Samuel Holland <samuel@sholland.org>,
 tiwai@suse.de, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, broonie@kernel.org,
 "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
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

cppcheck warning:

sound/soc/sunxi/sun8i-codec.c:488:28: style: Clarify calculation
precedence for '%' and '?'. [clarifyCalculation]
 return sample_rate % 4000 ? 22579200 : 24576000;
                           ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sunxi/sun8i-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 460924fc173f..518bfb724a5b 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -485,7 +485,7 @@ static int sun8i_codec_get_lrck_div_order(unsigned int slots,
 
 static unsigned int sun8i_codec_get_sysclk_rate(unsigned int sample_rate)
 {
-	return sample_rate % 4000 ? 22579200 : 24576000;
+	return (sample_rate % 4000) ? 22579200 : 24576000;
 }
 
 static int sun8i_codec_hw_params(struct snd_pcm_substream *substream,
-- 
2.25.1

