Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F393D34B215
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 23:18:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90A94168D;
	Fri, 26 Mar 2021 23:17:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90A94168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616797109;
	bh=0b+TEVoMxflbC0cnb4ORvWoipVBE6x2IjHqq9cMq0zg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pOh8mmGuKzdrm6QSj3p8csQeyVwTqN44Weubx4Fx3Ao5Qn1LsSR4CgHLhP/48ffzU
	 X7ljb7yaDAS8KF2FoTp1sk73iAmn/trWkgaTDsM94mFd809S7mrFU1YPYyZb0Jva1f
	 zLgJNNlgJlPR1uJ+wAUawJ2B7d6oMVKuWR4q2rkQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 393EFF80240;
	Fri, 26 Mar 2021 23:16:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE463F801EC; Fri, 26 Mar 2021 23:16:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F06F80103
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 23:16:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F06F80103
IronPort-SDR: c4rkSqDzLCnKgf5exEf3jplwwXTuCcJXzmE6osInhqEgfvRf53O0dfbE/FM0T/0dRZDlQ22qN+
 mm3Zm4vSKFYg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="276373853"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="276373853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:35 -0700
IronPort-SDR: 34QJdPUncT96lUQIYIzihS44wToWZicF1nK572qYaqKj6FzzfNSXbRJ0+hj6A9OaazW9HTHrfV
 ze6P0bviXeHg==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416713337"
Received: from schine-mobl1.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.213.191.61])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:16:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [RFC PATCH 1/2] ASoC: lm49453: fix useless assignment before return
Date: Fri, 26 Mar 2021 17:16:18 -0500
Message-Id: <20210326221619.949961-2-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
References: <20210326221619.949961-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, tiwai@suse.de,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vishwas A Deshpande <vishwas.a.deshpande@ti.com>, broonie@kernel.org,
 M R Swami Reddy <mr.swami.reddy@ti.com>
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

sound/soc/codecs/lm49453.c:1210:11: style: Variable 'pll_clk' is
assigned a value that is never used. [unreadVariable]

  pll_clk = BIT(4);
          ^

FIXME: What is the correct fix?
	/* fll clk slection */
	pll_clk = BIT(4);
	return 0;

is the assignment redundant or the 'return 0' a mistake?

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/codecs/lm49453.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/codecs/lm49453.c b/sound/soc/codecs/lm49453.c
index eb3dd0bd80d9..fb0fb23537e7 100644
--- a/sound/soc/codecs/lm49453.c
+++ b/sound/soc/codecs/lm49453.c
@@ -1206,8 +1206,6 @@ static int lm49453_set_dai_sysclk(struct snd_soc_dai *dai, int clk_id,
 		break;
 	case 48000:
 	case 32576:
-		/* fll clk slection */
-		pll_clk = BIT(4);
 		return 0;
 	default:
 		return -EINVAL;
-- 
2.25.1

