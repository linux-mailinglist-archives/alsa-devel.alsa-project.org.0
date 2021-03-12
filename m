Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C5B33965C
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:25:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE742173E;
	Fri, 12 Mar 2021 19:25:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE742173E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573555;
	bh=NF6pFqBHBpgRnHFuxCMibBrLe9undzJLD8g7SjDGKNs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VOzbI/MklVKDm9yeQkiphboP6rEpdq+O3wJoczHDNlwoNlrEmJA3fhGapszEkU2wb
	 TXZeJczlncXXP5RNIY9muM4GHQorVskrBrWJcZeB8zr2RFMtuToK3d2o1avFGz/CLE
	 iFoOpvy5QQ02IBxHL/mEfxGEAEwNZJbn7J89LjZo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 685A7F804A9;
	Fri, 12 Mar 2021 19:23:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C965F804A9; Fri, 12 Mar 2021 19:23:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2309BF800BF
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2309BF800BF
IronPort-SDR: qlPWevZTwvMHFyxUsVphV1HCN1Nn35jFVbbYwo2XFHnHEyqW1wQaftk61p5YFHNfy4bxXeMeBO
 gabBaYS9sXLg==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515164"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515164"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:10 -0800
IronPort-SDR: YYsm2Ig+h24qBreBc1FvLpGhz8KQjbWRRMvYVLCGSOus4fmmuW8bxX/FbmI2ayPnEZg0oVoG6p
 8Rr3YqnMOXow==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791904"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/23] ASoC: adau1977: remove useless return
Date: Fri, 12 Mar 2021 12:22:26 -0600
Message-Id: <20210312182246.5153-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Liam Girdwood <lgirdwood@gmail.com>,
 tiwai@suse.de, Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>, broonie@kernel.org
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

Cppcheck warning:

sound/soc/codecs/adau1977.c:242:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]

 return ret;
        ^
sound/soc/codecs/adau1977.c:239:6: note: If condition 'ret' is true,
the function will return/exit

 if (ret)
     ^
sound/soc/codecs/adau1977.c:242:9: note: Returning identical expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/adau1977.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/adau1977.c b/sound/soc/codecs/adau1977.c
index 8260f49caa24..e347a48131d1 100644
--- a/sound/soc/codecs/adau1977.c
+++ b/sound/soc/codecs/adau1977.c
@@ -236,8 +236,6 @@ static int adau1977_reset(struct adau1977 *adau1977)
 	ret = regmap_write(adau1977->regmap, ADAU1977_REG_POWER,
 			ADAU1977_POWER_RESET);
 	regcache_cache_bypass(adau1977->regmap, false);
-	if (ret)
-		return ret;
 
 	return ret;
 }
-- 
2.25.1

