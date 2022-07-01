Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 35783562C9C
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Jul 2022 09:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDCB91678;
	Fri,  1 Jul 2022 09:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDCB91678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656660613;
	bh=VyByxFNkJ+15bD53k5okvGNmbn+1PWPhIvXAqNbSC2Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=uwCH3OYTMBGhIz3Wg8BiO9idJIvUhnbkme3iUuBR47j2L1pvewjRW1WmcRsYTLM4v
	 e8W8Zo2qcIltDz79cf1413FvKP/Bur92ewqL5GAQGWRbSAz27rDmzKDZhw8XlYZXyc
	 /xIbldjVl+cQ7N1V50PwL8NDmbGqTECBXt4v+B8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A912F80256;
	Fri,  1 Jul 2022 09:29:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9951CF80155; Fri,  1 Jul 2022 09:29:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=disabled version=3.4.0
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A639F800E8
 for <alsa-devel@alsa-project.org>; Fri,  1 Jul 2022 09:29:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A639F800E8
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0VHzzt3O_1656660532; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VHzzt3O_1656660532) by smtp.aliyun-inc.com;
 Fri, 01 Jul 2022 15:29:04 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: lgirdwood@gmail.com
Subject: [PATCH] ASoC: tegra20_ac97: Fix missing error code in
 tegra20_ac97_platform_probe()
Date: Fri,  1 Jul 2022 15:28:50 +0800
Message-Id: <20220701072850.62408-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 jonathanh@nvidia.com, broonie@kernel.org, thierry.reding@gmail.com,
 p.zabel@pengutronix.de, linux-tegra@vger.kernel.org
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

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'ret'.

This was found by coccicheck:

sound/soc/tegra/tegra20_ac97.c:357 tegra20_ac97_platform_probe() warn: missing error code 'ret'.

Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 sound/soc/tegra/tegra20_ac97.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index e17375c6cddb..87facfbcdd11 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -354,6 +354,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 		}
 	} else {
 		dev_err(&pdev->dev, "no codec-reset GPIO supplied\n");
+		ret = -EINVAL;
 		goto err_clk_put;
 	}
 
@@ -361,6 +362,7 @@ static int tegra20_ac97_platform_probe(struct platform_device *pdev)
 					    "nvidia,codec-sync-gpio", 0);
 	if (!gpio_is_valid(ac97->sync_gpio)) {
 		dev_err(&pdev->dev, "no codec-sync GPIO supplied\n");
+		ret = -EINVAL;
 		goto err_clk_put;
 	}
 
-- 
2.20.1.7.g153144c

