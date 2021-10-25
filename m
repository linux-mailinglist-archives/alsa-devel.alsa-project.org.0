Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4FB439EE5
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:02:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 859BA16C7;
	Mon, 25 Oct 2021 21:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 859BA16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188553;
	bh=1wUQa6yPx3N2emGJCCE31CDaSszxxWCAFE44iD76Esw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Oyd27zaenk7HKr8uYh7wDZauAZg+yx+3L1ECCwGIera+IApCfjRP8+bXz+cDG7hmP
	 81zJCXtZtUtyNs4UszJb5QPw2Qyr4IoueC6JfMC6+meR7mZpuujR5jP3Cfxt/STLdH
	 XTmyNAiDE/wpk6E8Tys2yWiy0q9O6jS5ggoAVMK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC551F804AF;
	Mon, 25 Oct 2021 21:00:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C271AF804E5; Mon, 25 Oct 2021 21:00:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DC80F80166
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DC80F80166
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908166"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908166"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:56 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318473"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:56 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/8] ASoC: nau8821: clarify out-of-bounds check
Date: Mon, 25 Oct 2021 13:59:29 -0500
Message-Id: <20211025185933.144327-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, broonie@kernel.org,
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

cppcheck reports a false positive

sound/soc/codecs/nau8821.c:390:17: error: Array 'dmic_speed_sel[4]'
accessed at index 4, which is out of bounds. [arrayIndexOutOfBounds]

  dmic_speed_sel[i].param, dmic_speed_sel[i].val);
                ^
sound/soc/codecs/nau8821.c:378:2: note: After for loop, i has value 4
 for (i = 0 ; i < 4 ; i++)
 ^
sound/soc/codecs/nau8821.c:390:17: note: Array index out of bounds
  dmic_speed_sel[i].param, dmic_speed_sel[i].val);
                ^

While the code is not incorrect, we can deal with the out-of-bounds
check in a clearer way that makes static analysis happy.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/nau8821.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index 2757d2eeb48a..2de818377484 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -381,7 +381,7 @@ static int dmic_clock_control(struct snd_soc_dapm_widget *w,
 			speed_selection = dmic_speed_sel[i].val;
 			break;
 		}
-	if (speed_selection < 0)
+	if (i == 4)
 		return -EINVAL;
 
 	dev_dbg(nau8821->dev,
-- 
2.25.1

