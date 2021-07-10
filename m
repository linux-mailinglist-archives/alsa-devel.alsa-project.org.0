Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FDF3C3009
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Jul 2021 04:44:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 302151709;
	Sat, 10 Jul 2021 04:43:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 302151709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625885064;
	bh=hau0c91h4BJ9V9i1sgzxQVHOLNVU2hgyRWuAw9aeMe0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SYApjrRG8zlc7OBAUtF2+7Yh9/83+8QAsdp4kZOBBIH3nWSnIGc6S3BM7UaSMo/hb
	 E6MlQJegsLrUI4g75nF82Lc/yf/0dTkEKBZLFrKBBS83dGSV0pqRmO/gXdKgY892WS
	 FcipgK+j0vWrvAGRfi/Elp036USLjMf7Z+RifmLg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4D4AF8062F;
	Sat, 10 Jul 2021 04:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 13276F80630; Sat, 10 Jul 2021 04:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51B51F804DA
 for <alsa-devel@alsa-project.org>; Sat, 10 Jul 2021 04:27:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51B51F804DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="prx/qnzi"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B393D61413;
 Sat, 10 Jul 2021 02:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625884067;
 bh=hau0c91h4BJ9V9i1sgzxQVHOLNVU2hgyRWuAw9aeMe0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=prx/qnzigWMBnlyJ2rSLOZ/5waHiX98SsZ4VDBP4ODh9VN3grlJArWu416pSPB/0s
 SjTLtv1XILZ8LJpeR+Vco7fY3vU/n0SoZtbRNuYrt2VKZtUatmM6GEmk9Fo1RxIEi6
 YK4NLPKBtaHv6y0sXkHLHdipH7K+SriuXK0lQVmi5l6mDw4wsV4xfLgIQQp5JKTbPr
 venA++bECiPoO5fcHBWJSJ0iWBSZ0QyGlvRyCEnG9lx2MttMV039DiaJrI4O5ClKwa
 ojhOuAGj8rLeCu3kuR7CyIzFAzzbG7DDX7mY4XyqB1v0EsVmUo3JCFuCbUIUGe2XE7
 /kXSn+GNerCdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 29/63] ASoC: img: Fix PM reference leak in
 img_i2s_in_probe()
Date: Fri,  9 Jul 2021 22:26:35 -0400
Message-Id: <20210710022709.3170675-29-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710022709.3170675-1-sashal@kernel.org>
References: <20210710022709.3170675-1-sashal@kernel.org>
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
index bb668551dd4b..243f916355ee 100644
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

