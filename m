Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C755EED8D
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Sep 2022 08:07:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C77D6846;
	Thu, 29 Sep 2022 08:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C77D6846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664431656;
	bh=im3EeMAe+47Ir6AIJG/MGkNzpH2VJePcZKB94OjLLho=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=njn9Iv9yU+Iwcpl9FaSwhLp1zzRCnwW+clMVTokX6ATMEF2w50vHjL62fzmyPYou9
	 z4z4kgHi0ewLUU9aJ+3Hi7AyFvkhxqxWUpvSA5G/FvuqZSFndK7qB/aRNKUxzA7yqA
	 Az2zHCh2FtuYWQEtjTw/OPq8DPf87BQAWkDOWBy4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33C91F803DD;
	Thu, 29 Sep 2022 08:06:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0199F804D0; Tue, 27 Sep 2022 15:35:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CCB49F80166
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 15:35:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CCB49F80166
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4McLB828b7zlVmD;
 Tue, 27 Sep 2022 21:31:28 +0800 (CST)
Received: from kwepemm600008.china.huawei.com (7.193.23.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 27 Sep 2022 21:35:43 +0800
Received: from huawei.com (10.175.100.227) by kwepemm600008.china.huawei.com
 (7.193.23.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 27 Sep
 2022 21:35:42 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <james.schulman@cirrus.com>, <david.rhodes@cirrus.com>,
 <tanureal@opensource.cirrus.com>, <rf@opensource.cirrus.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <christophe.jaillet@wanadoo.fr>,
 <peter.ujfalusi@gmail.com>, <alsa-devel@alsa-project.org>,
 <patches@opensource.cirrus.com>
Subject: [PATCH -next 2/4] ASoC: wm8978: Use DIV_ROUND_UP() instead of
 open-coding it
Date: Tue, 27 Sep 2022 22:09:46 +0800
Message-ID: <20220927140948.17696-3-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220927140948.17696-1-shangxiaojing@huawei.com>
References: <20220927140948.17696-1-shangxiaojing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600008.china.huawei.com (7.193.23.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 29 Sep 2022 08:06:37 +0200
Cc: shangxiaojing@huawei.com
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

Use DIV_ROUND_UP() instead of open-coding it, which intents and makes it
more clear what is going on for the casual reviewer.

The Coccinelle references Commit e4d8aef21403 ("ALSA: usb: Use
DIV_ROUND_UP() instead of open-coding it").

Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 sound/soc/codecs/wm8978.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index a682f8020eb6..aa2f55401a88 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -498,7 +498,7 @@ static int wm8978_configure_pll(struct snd_soc_component *component)
 
 		if (4 * f_opclk < 3 * f_mclk)
 			/* Have to use OPCLKDIV */
-			opclk_div = (3 * f_mclk / 4 + f_opclk - 1) / f_opclk;
+			opclk_div = DIV_ROUND_UP(3 * f_mclk / 4, f_opclk);
 		else
 			opclk_div = 1;
 
-- 
2.17.1

