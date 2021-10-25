Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 305EA439EE9
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 21:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 98C2616E6;
	Mon, 25 Oct 2021 21:01:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 98C2616E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635188564;
	bh=1nU6F8H/o+rYHhw87QiHffOGV6FZGa25y2YQgunkhLI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWZBFG/1essI+C3F0Ax2QE3hmIF0dLxUdt9iMajUMDEomFBuNAM4tcxlY9NjpaDbn
	 uIVTWTyycIsVbKUr2f6whI/Ep7Wf+T/NDliWfmSi2EjfDnWLrYe1LcQQSgANJ5pjvv
	 oriAnBN/+yRGrAGtAxJb5129v4TIyvypF0EltTmY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82D83F804F3;
	Mon, 25 Oct 2021 21:00:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2E34AF804E7; Mon, 25 Oct 2021 21:00:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3913AF804E3
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 21:00:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3913AF804E3
X-IronPort-AV: E=McAfee;i="6200,9189,10148"; a="216908186"
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="216908186"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:58 -0700
X-IronPort-AV: E=Sophos;i="5.87,181,1631602800"; d="scan'208";a="554318490"
Received: from ssubbar1-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.118.197])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 11:59:58 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 8/8] ASoC: rockchip: i2s_tdm: improve return value handling
Date: Mon, 25 Oct 2021 13:59:33 -0500
Message-Id: <20211025185933.144327-9-pierre-louis.bossart@linux.intel.com>
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

cppcheck reports the following warning:

sound/soc/rockchip/rockchip_i2s_tdm.c:599:9: warning: Identical
condition and return expression 'ret', return value is always 0
[identicalConditionAfterEarlyExit]

 return ret;
        ^
sound/soc/rockchip/rockchip_i2s_tdm.c:594:6: note: If condition 'ret'
is true, the function will return/exit
 if (ret)
     ^
sound/soc/rockchip/rockchip_i2s_tdm.c:599:9: note: Returning identical
expression 'ret'

 return ret;
        ^

While the code is not wrong, it's clearer to return 0 directly.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index e8dee1f95d85..17b9b287853a 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -596,7 +596,7 @@ static int rockchip_i2s_tdm_clk_set_rate(struct rk_i2s_tdm_dev *i2s_tdm,
 
 	i2s_tdm->clk_ppm = ppm;
 
-	return ret;
+	return 0;
 }
 
 static int rockchip_i2s_tdm_calibrate_mclk(struct rk_i2s_tdm_dev *i2s_tdm,
-- 
2.25.1

