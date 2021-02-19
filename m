Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D6332019C
	for <lists+alsa-devel@lfdr.de>; Sat, 20 Feb 2021 00:13:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1C7F1661;
	Sat, 20 Feb 2021 00:12:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1C7F1661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613776411;
	bh=qX+5FeifPCmPzdQSjhfHjJM2ddQvH4rmzSgNugklxdc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Gjo0kLb4suTx1YZJV7LHP5wjiVUdYB+lUXW4YPPm+oUlbzKU+GMrVX9els+CMp43W
	 EuELke185vUBK76tBieA4NrPDLslMHfDAXoTegHjNZ4Tk7iPR5FQLvsUYQ91ApeLRD
	 fS+qISGDrBoeot/48sKAMi2chu2F2XTZIgKOzvMM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBF00F80424;
	Sat, 20 Feb 2021 00:09:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FBD5F8026C; Sat, 20 Feb 2021 00:09:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0BB7F800C7
 for <alsa-devel@alsa-project.org>; Sat, 20 Feb 2021 00:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0BB7F800C7
IronPort-SDR: +1+PfmjaNhgAtD0nkBLC/y1/a5huOiX90UMftMzyUCI42H8sfViuuNtCtwlAy1+//y1qkyi4mk
 ucLyLytxXoOw==
X-IronPort-AV: E=McAfee;i="6000,8403,9900"; a="163139064"
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="163139064"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:31 -0800
IronPort-SDR: 3tfeS/LaZNCfWQ3ribFI45l7pCi9F0WfqwsEmbmUMVL1PVAaBkk9gjWc0kxhciGeeZF7EUPzgZ
 T3EZPXvTgCgw==
X-IronPort-AV: E=Sophos;i="5.81,191,1610438400"; d="scan'208";a="365362856"
Received: from lkwerake-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.153.34])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2021 15:09:31 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: samsung: snow: remove useless test
Date: Fri, 19 Feb 2021 17:09:16 -0600
Message-Id: <20210219230918.5058-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
References: <20210219230918.5058-1-pierre-louis.bossart@linux.intel.com>
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

