Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFF933965B
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:25:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7DC211782;
	Fri, 12 Mar 2021 19:24:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7DC211782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573539;
	bh=kppr8BcmoLx9fR5wYAszBPznoIn39y25uXF+8oWfFxI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DO/io9yhkr+yXWM8OwUjOaZmI4bzYkU2mZ5s4aWFjCT/rhrZwXyPn90kDu3fG1+2g
	 yDAkZkY2oFgVjWX6iwOsQ5N3WxaaC2UFQ9L7t3/2O7zVCbdws+HJD/wSNDiVlfa+Py
	 z6EhyemWrnTHl06JY/A6Y0jyyXjNpXGxsKdPai94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D18F801D8;
	Fri, 12 Mar 2021 19:23:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23BCEF8032B; Fri, 12 Mar 2021 19:23:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E503F801D8
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E503F801D8
IronPort-SDR: a5AkpHuz7HA6SoXrfuKmdbuX7YW/grHnwFx0labMRq4YQgtJugiuqZH5PyRdAtap+0qTZDSZBm
 0rjc4OIM0q9g==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="185515161"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="185515161"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:09 -0800
IronPort-SDR: 7mFQaj0ncPzQXy21S4P27cDT1gMH9RkZghKZHFmkHbTRU4dX40t5Fpomkj5fWPLIPGcNGEjFAE
 FZ/IEpgbVSCg==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377791901"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:08 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/23] ASoC: ad1836: remove useless return
Date: Fri, 12 Mar 2021 12:22:25 -0600
Message-Id: <20210312182246.5153-3-pierre-louis.bossart@linux.intel.com>
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

sound/soc/codecs/ad1836.c:311:9: warning: Identical condition and return expression 'ret', return value is always 0 [identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/codecs/ad1836.c:308:6: note: If condition 'ret' is true, the function will return/exit
 if (ret)
     ^
sound/soc/codecs/ad1836.c:311:9: note: Returning identical expression 'ret'
 return ret;
        ^

Likely copy/paste between adc and dac cases.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/ad1836.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/ad1836.c b/sound/soc/codecs/ad1836.c
index a46152560294..08a5651bed9f 100644
--- a/sound/soc/codecs/ad1836.c
+++ b/sound/soc/codecs/ad1836.c
@@ -305,8 +305,6 @@ static int ad1836_probe(struct snd_soc_component *component)
 		return ret;
 
 	ret = snd_soc_dapm_add_routes(dapm, ad183x_adc_routes, num_adcs);
-	if (ret)
-		return ret;
 
 	return ret;
 }
-- 
2.25.1

