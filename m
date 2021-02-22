Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BB0322187
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 22:37:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 930DD166A;
	Mon, 22 Feb 2021 22:36:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 930DD166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614029842;
	bh=k7P2dmXbfqZ1Vvm0f+KEu3jfA1SdV9t/WKyPWVbnF7w=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EXtSZM0Ro80etVZnp15GCdu1Lpaf2s0PbASrVX3XIJ5ZL+KKAHHCG6O1AyHv+8Yn0
	 bkoL4QIuOTsfdxcgIoMXfj3v1qYBcBr39kFZ3/EdC8dnmu++ama4rTRH5fOvyShc3m
	 0ZwjZMXwpesqMEzU3Z1bbYyuWEMejYseAXD8EpHA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F105F804AC;
	Mon, 22 Feb 2021 22:33:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D2E1F8022B; Mon, 22 Feb 2021 22:33:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AFC1F80249
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 22:33:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AFC1F80249
IronPort-SDR: UeoHgN3mFgpqhxOBdPtBPv1Jkeen1/TTTt3PlMQVMDFQPQhSY5FEwAc86HqD752uV4bKbNhhBY
 mVjvDVA83jvw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="171740007"
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="171740007"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:22 -0800
IronPort-SDR: 3Qw9aSttdlOi39Qg7QUQFy5+w7M0mBBHOuvWOHV4BTBzDXvpQUbIUxDo3s2cmp23Wv46XQo9Ks
 QMeLsGEhkgDA==
X-IronPort-AV: E=Sophos;i="5.81,198,1610438400"; d="scan'208";a="423270725"
Received: from sspurohi-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.54.136])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 13:33:19 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 5/6] ASoC: samsung: snow: remove useless test
Date: Mon, 22 Feb 2021 15:33:05 -0600
Message-Id: <20210222213306.22654-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
References: <20210222213306.22654-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
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

sound/soc/samsung/snow.c:112:2: style:inconclusive: Found duplicate
branches for 'if' and 'else'. [duplicateBranch]
 if (rtd->num_codecs > 1)
 ^
sound/soc/samsung/snow.c:114:2: note: Found duplicate branches for
'if' and 'else'.
 else
 ^
sound/soc/samsung/snow.c:112:2: note: Found duplicate branches for
'if' and 'else'.
 if (rtd->num_codecs > 1)
 ^

Fixes: 7de6b6bc1a58 ("ASoC: samsung: use asoc_rtd_to_cpu() / asoc_rtd_to_codec() macro for DAI pointer")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/samsung/snow.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 989af624dd11..6da674e901ca 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -109,10 +109,7 @@ static int snow_late_probe(struct snd_soc_card *card)
 	rtd = snd_soc_get_pcm_runtime(card, &card->dai_link[0]);
 
 	/* In the multi-codec case codec_dais 0 is MAX98095 and 1 is HDMI. */
-	if (rtd->num_codecs > 1)
-		codec_dai = asoc_rtd_to_codec(rtd, 0);
-	else
-		codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
 
 	/* Set the MCLK rate for the codec */
 	return snd_soc_dai_set_sysclk(codec_dai, 0,
-- 
2.25.1

