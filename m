Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E864CA1A2
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Mar 2022 11:01:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 551542048;
	Wed,  2 Mar 2022 11:01:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 551542048
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646215314;
	bh=h39jAtAKq+dHL8Of/1MnEd7ooWF9tmieOZjKtIFqgbU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iYwiMfPkh4TiK6soMeC9JGpHgEKWV34eT1ElZE8FoDONPCEk/gv5ZCUBDoYppiI68
	 0TjEQCmV/KW8rfdHOzDaggP8/S++zyZfmKHDfPR9zAU5w+5n9prseY97bwYhrB23jG
	 otL2RQ6ziHtSCi7/EAS+G+ydhTmfxuBffWvG2UuU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C3603F8027D;
	Wed,  2 Mar 2022 11:00:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29559F801D5; Wed,  2 Mar 2022 11:00:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8CF2F80167
 for <alsa-devel@alsa-project.org>; Wed,  2 Mar 2022 11:00:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8CF2F80167
X-QQ-mid: bizesmtp77t1646215227tx88lfbo
Received: from localhost.localdomain (unknown [58.240.82.166])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 02 Mar 2022 18:00:22 +0800 (CST)
X-QQ-SSF: 0140000000200060D000B00A0000000
X-QQ-FEAT: HoyAXBWgskmYdSdyebFBiWjxCytgNey9Aae4l7NvKJrtYf/1UqQ8fM1QK4I+m
 CbnWyd2+7bCShdqhan+VzGSRt+cMuQ2hVE19BLeF2n45eNFGihIMAT+Sy7/thMyeEbKosPT
 IiZpZb1oudFqlhNFHxRlSdmvheplHNsHZQNEG/ogqtjB2cT0C2vJOFJ0282dCG77/IUJGl6
 Cs+io3wd/sccnIac73X2G26JYwDYkyvme7CbhDqZ9KasJDw0u0CS+0cWOyl+vx9yJVQq7YT
 puhiPsxy+48QtjG2NuaK9gkEnDdbaK/q/sthFOqyJPRcEqPfxHpS6ywrzpJT83xyh/4KI+d
 QD1RaflZwBBf1VSYEaJMwoIm8pNR1g/vYJ3cyTYn8kMbrE7yvc=
X-QQ-GoodBg: 2
From: Zhen Ni <nizhen@uniontech.com>
To: frattaroli.nicolas@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com
Subject: [PATCH] ASoC: rockchip: i2s_tdm: fix runtime pm imbalance on error
Date: Wed,  2 Mar 2022 18:00:19 +0800
Message-Id: <20220302100019.22891-1-nizhen@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
Cc: Zhen Ni <nizhen@uniontech.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

pm_runtime_get_sync() increments the runtime PM usage counter even the
call returns an error code. Thus a pairing decrement is needed on the
error handling path to keep the counter balanced.

Signed-off-by: Zhen Ni <nizhen@uniontech.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 5f9cb5c4c7f0..4691a76b499d 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1739,8 +1739,10 @@ static int __maybe_unused rockchip_i2s_tdm_resume(struct device *dev)
 	int ret;
 
 	ret = pm_runtime_get_sync(dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(dev);
 		return ret;
+	}
 	ret = regcache_sync(i2s_tdm->regmap);
 	pm_runtime_put(dev);
 
-- 
2.20.1



