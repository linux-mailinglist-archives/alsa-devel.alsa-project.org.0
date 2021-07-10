Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB43C2FED
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:38:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5C8516DF;
	Sat, 10 Jul 2021 04:37:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5C8516DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625884688;
	bh=1tBw5Zt9YPIrQK/9dRp5GoREl6y7xA8VRfsxmcF8F8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mZEV4fkkqUYrUSgQVNRfUH/mUI8OQIQz2tyXSSo8kV4TIYCON8TWZRkqJPOLeUmBE
	 t0kLJQI9909KP7nq40kMb+x/uxHJNK4iV2w15IDbBeaul4nZueAz5bFohGuTYV06c4
	 G6RWhi0vuO9omDBAEmnoatFCFjQwaT1rjO3JSPkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 659FCF8055A;
	Sat, 10 Jul 2021 04:25:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3C80F8055A; Sat, 10 Jul 2021 04:25:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D327EF80552
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:25:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D327EF80552
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MpqqBhtR"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3FE84613F4;
 Sat, 10 Jul 2021 02:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625883930;
 bh=1tBw5Zt9YPIrQK/9dRp5GoREl6y7xA8VRfsxmcF8F8I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MpqqBhtRDP1MZdvQObU42OqkWHjFjSAslm28T35diLCCnCiZrB0KxYpQrK5OqyUTw
 Vp+hPWm6S73xhcPG4sCk7caDEX2rCwN1Y97cqd+YewgOmm2FNQz/w9lUXbiHQ9Trml
 8qHPNwHpy003e+h2LiBxkCu5HoWSbtPJXhywVEa/Uq44I5Sngq4tv2vAbHmM4vrM5g
 0hxJFoXGY1PCvf+/nWdroTRk1xDvqFMxCnMQnF6+8XYosVwWrk1AEqOvYjoD/uxpZm
 OJgubjOT3o6dLiTu0XW1r+ymmN+3GYFKyhRn8nXnhszkcqzXNuEbVRlnNIK7RKR6Vw
 5RQm968xte23A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 47/93] ASoC: img: Fix PM reference leak in
 img_i2s_in_probe()
Date: Fri,  9 Jul 2021 22:23:41 -0400
Message-Id: <20210710022428.3169839-47-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022428.3169839-1-sashal@kernel.org>
References: <20210710022428.3169839-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Sasha Levin <sashal@kernel.org>, Hulk Robot <hulkci@huawei.com>,
 alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Yufen Yu <yuyufen@huawei.com>
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

From: Yufen Yu <yuyufen@huawei.com>

[ Upstream commit 81aad47278539f02de808bcc8251fed0ad3d6f55 ]

pm_runtime_get_sync will increment pm usage counter even it failed.
Forgetting to putting operation will result in reference leak here.
Fix it by replacing it with pm_runtime_resume_and_get to keep usage
counter balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yufen Yu <yuyufen@huawei.com>
Link: https://lore.kernel.org/r/20210524093521.612176-1-yuyufen@huawei.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/img/img-i2s-in.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index 0843235d73c9..fd3432a1d6ab 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -464,7 +464,7 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 		if (ret)
 			goto err_pm_disable;
 	}
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
 		goto err_suspend;
 
-- 
2.30.2

