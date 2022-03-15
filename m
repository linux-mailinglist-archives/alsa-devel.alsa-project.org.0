Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6DE4D92B1
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Mar 2022 03:40:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B8C4182F;
	Tue, 15 Mar 2022 03:39:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B8C4182F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647312026;
	bh=M93GEnDAy6xHiGPRj1UhOsRdxPzHlOj50fi3D3Hy5fA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=QPZiM9xVaxw65mLJbqp0BJrJNgghPzGIEyt4aeHrcjal4HE8LJahu5RIsl2sV1Jlu
	 sumhI30U0vcd0KrwCKVVAYpj/CsrqK1nk+NIgtREgecF4+I8AgDgv1QAe5CpQKBfOw
	 vNnfA0ehKYU5BF62cGfHVQgz5zd3ZfPN0MirL/hE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18197F800FF;
	Tue, 15 Mar 2022 03:39:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA678F80162; Tue, 15 Mar 2022 03:39:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A36DF800FF
 for <alsa-devel@alsa-project.org>; Tue, 15 Mar 2022 03:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A36DF800FF
Received: from kwepemi500019.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4KHct72GDVzcbJR;
 Tue, 15 Mar 2022 10:34:07 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 kwepemi500019.china.huawei.com (7.221.188.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 15 Mar 2022 10:39:03 +0800
Received: from huawei.com (10.175.127.227) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.21; Tue, 15 Mar
 2022 10:39:02 +0800
From: zhangqilong <zhangqilong3@huawei.com>
To: <frattaroli.nicolas@gmail.com>, <tiwai@suse.com>, <perex@perex.cz>,
 <heiko@sntech.de>
Subject: [PATCH -next] ASoC: rockchip: Fix PM usage reference of
 rockchip_i2s_tdm_resume
Date: Tue, 15 Mar 2022 10:54:15 +0800
Message-ID: <20220315025415.2593762-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com
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

pm_runtime_get_sync will increment pm usage counter
even it failed. Forgetting to putting operation will
result in reference leak here. We fix it by replacing
it with pm_runtime_resume_and_get to keep usage counter
balanced.

Fixes:081068fd64140 ("ASoC: rockchip: add support for i2s-tdm controller")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 5f9cb5c4c7f0..d3b710406941 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1738,7 +1738,7 @@ static int __maybe_unused rockchip_i2s_tdm_resume(struct device *dev)
 	struct rk_i2s_tdm_dev *i2s_tdm = dev_get_drvdata(dev);
 	int ret;
 
-	ret = pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0)
 		return ret;
 	ret = regcache_sync(i2s_tdm->regmap);
-- 
2.31.1

