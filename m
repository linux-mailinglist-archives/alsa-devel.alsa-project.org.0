Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA908C8CF1
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Oct 2019 17:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45005167D;
	Wed,  2 Oct 2019 17:31:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45005167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570030355;
	bh=KSnjkd+fc1J6wK7t1XlfsQuR+R2to/i3bRoIGJNIChA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pp6oEYnJLhOwPCfuSri5Q4LqPimxyFNLBHThSlFy//3gyAemMPa6kIYlBNZ9UBDu8
	 632lxecLBcDtGsgmbXnc57AejyDg0ApHgrgugrjlMQVNeC0gTMhp3+BhkrZnlf7Ymm
	 P09HdT7vZWM30/6pqAXESkqTQjImXffrYuOG4E7E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 94D3AF803F3;
	Wed,  2 Oct 2019 17:30:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EE8DF80391; Wed,  2 Oct 2019 17:30:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 634E2F8036E
 for <alsa-devel@alsa-project.org>; Wed,  2 Oct 2019 17:30:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 634E2F8036E
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 666471000;
 Wed,  2 Oct 2019 08:30:42 -0700 (PDT)
Received: from e110467-lin.cambridge.arm.com (e110467-lin.cambridge.arm.com
 [10.1.197.57])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 354BB3F706;
 Wed,  2 Oct 2019 08:30:41 -0700 (PDT)
From: Robin Murphy <robin.murphy@arm.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Date: Wed,  2 Oct 2019 16:30:37 +0100
Message-Id: <bcb12a849a05437fb18372bc7536c649b94bdf07.1570029862.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.21.0.dirty
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, heiko@sntech.de, tiwai@suse.com,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoc: rockchip: i2s: Fix RPM imbalance
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

If rockchip_pcm_platform_register() fails, e.g. upon deferring to wait
for an absent DMA channel, we return without disabling RPM, which makes
subsequent re-probe attempts scream with errors about the unbalanced
enable. Don't do that.

Fixes: ebb75c0bdba2 ("ASoC: rockchip: i2s: Adjust devm usage")
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 sound/soc/rockchip/rockchip_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index af2d5a6124c8..61c984f10d8e 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -677,7 +677,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 	ret = rockchip_pcm_platform_register(&pdev->dev);
 	if (ret) {
 		dev_err(&pdev->dev, "Could not register PCM\n");
-		return ret;
+		goto err_suspend;
 	}
 
 	return 0;
-- 
2.21.0.dirty

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
