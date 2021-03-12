Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2308033968E
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 19:32:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD79E1849;
	Fri, 12 Mar 2021 19:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD79E1849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615573939;
	bh=9iRGPjL2CRBVinZ5dqJmuuYAafqu7EKakTtWed79rjk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aYJOaVESmP9sZ9k1YOrfXMwxahQo9ChIdKSFG3k4BpimLPZ5wOaPGdoJBmW+qsPwv
	 Ys/uX/B4bR2f3SFO048H/NGDdSEJgC7Lk2gzbaND8ttGDEYZ3anyH4pcQBvF2uo8p4
	 RpVmjXcneSYbzEYAsNxU6J6uoIKx5J+fWzLeEZ0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 362ACF8053C;
	Fri, 12 Mar 2021 19:24:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66593F80529; Fri, 12 Mar 2021 19:24:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BF2DF8050F
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 19:23:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BF2DF8050F
IronPort-SDR: Z4ZaE16BzHiElk5OqQQJG6ZjBogHkqFzjGSbIvxLtozy5pQkv9WGvkKZIOcBTM6h6Y5gOLiYZY
 O+ENBHq47fsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9921"; a="188236507"
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="188236507"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:52 -0800
IronPort-SDR: o8BsyRpU/yc0CdyM5I3L1bh5ATKYgIyYoD4rM7Z3YXWGPwZgTOw+zfGiYLvYsTGC2dYAqXCbBS
 kcCRuVHdnKnQ==
X-IronPort-AV: E=Sophos;i="5.81,244,1610438400"; d="scan'208";a="377792064"
Received: from amiteshs-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.37.30])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2021 10:23:51 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 20/23] ASoC: tas2562: remove warning on return value
Date: Fri, 12 Mar 2021 12:22:43 -0600
Message-Id: <20210312182246.5153-21-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
References: <20210312182246.5153-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, tiwai@suse.de,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Jonghwan Choi <charlie.jh@kakaocorp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, broonie@kernel.org,
 Dan Murphy <dmurphy@ti.com>
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

sound/soc/codecs/tas2562.c:530:9: warning: Identical condition and return expression 'ret', return value is always 0 [identicalConditionAfterEarlyExit]
 return ret;
        ^
sound/soc/codecs/tas2562.c:525:6: note: If condition 'ret' is true, the function will return/exit
 if (ret)
     ^
sound/soc/codecs/tas2562.c:530:9: note: Returning identical expression 'ret'
 return ret;
        ^

Fix with return 0

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/tas2562.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index ba23f9f07f04..10302552195e 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -526,7 +526,7 @@ static int tas2562_volume_control_put(struct snd_kcontrol *kcontrol,
 
 	tas2562->volume_lvl = ucontrol->value.integer.value[0];
 
-	return ret;
+	return 0;
 }
 
 /* Digital Volume Control. From 0 dB to -110 dB in 1 dB steps */
-- 
2.25.1

