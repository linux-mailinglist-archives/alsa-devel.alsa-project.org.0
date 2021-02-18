Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5B831F261
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Feb 2021 23:34:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BFE131674;
	Thu, 18 Feb 2021 23:34:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BFE131674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613687694;
	bh=A2uGarlMSyDQ6ZoGrxQiT5WyjcTX5kCsdoAt8N/v5v8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WBNb87XX4gigByWb/d8JcPB6+VzhIshDepiFW0r5rQPKKF2wdWdPdDF4xGfH1zkfz
	 wsbDMvihX0t1CdhClwZ/i1zvtPbf4+7FpV/2ry4T6Tkk6IIJFIdbRT0FS45WB7x9E8
	 shJaMo8c/V+avf4MKKaQHpIOQvMAjPQElMjCRtiE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09851F804CF;
	Thu, 18 Feb 2021 23:30:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF7C6F8015A; Thu, 18 Feb 2021 23:30:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2159AF80275
 for <alsa-devel@alsa-project.org>; Thu, 18 Feb 2021 23:29:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2159AF80275
IronPort-SDR: ibcccN5dgsa6sePZh2yCApyi1qMM7aqVA+JdujC8tMz5otd2bbCpHmoJq02u53LqK7zfU2rPC+
 KDdvi84Chu8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="182875670"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="182875670"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:45 -0800
IronPort-SDR: hBsyFSNwA20LgdDw3zo99OyynS1XAo3wFx5yfeRKToVAqTQ4qGIdg6vwRoWmXhrUt5067F+e7F
 FYmKdQsJwQJg==
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; d="scan'208";a="364990853"
Received: from tphilli1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.64.38])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2021 14:29:42 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/10] ASoC: wcd934x: remove useless return
Date: Thu, 18 Feb 2021 16:29:15 -0600
Message-Id: <20210218222916.89809-10-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
References: <20210218222916.89809-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, vkoul@kernel.org, broonie@kernel.org,
 srinivas.kandagatla@linaro.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/wcd934x.c:1571:9: warning: Identical condition and
return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/codecs/wcd934x.c:1568:6: note: If condition 'ret' is true,
the function will return/exit
 if (ret)
     ^
sound/soc/codecs/wcd934x.c:1571:9: note: Returning identical
expression 'ret'
 return ret;
        ^

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/wcd934x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index 40f682f5dab8..d461a3747b4d 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1565,8 +1565,6 @@ static int wcd934x_set_interpolator_rate(struct snd_soc_dai *dai,
 		return ret;
 	ret = wcd934x_set_mix_interpolator_rate(dai, (u8)rate_val,
 						sample_rate);
-	if (ret)
-		return ret;
 
 	return ret;
 }
-- 
2.25.1

