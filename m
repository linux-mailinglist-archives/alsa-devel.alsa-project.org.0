Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46666332623
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Mar 2021 14:08:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6563E17CF;
	Tue,  9 Mar 2021 14:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6563E17CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615295294;
	bh=GP0Tk3hCYXO7KAUnszFjuDKX8+FPn9lwtPFiJ5Ozn8M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S87O9k6c6cjoN/2vyeQjOk7pvR/M/W1sRSAva9YSna7DiyccVd75yQx9D1ULvYK49
	 ZXvUPmcnZgUA4sB/4PyZHOP5sYvnQrxybG0UQnBZq4RSkgeGhkiWXnicpkjNWQoSuI
	 d5eDVO61o4K4/1eCNlONyziRbnTQvnEr9NG7prdQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A745FF8028B;
	Tue,  9 Mar 2021 14:06:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8F1A5F80227; Tue,  9 Mar 2021 14:06:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ED69F8019B
 for <alsa-devel@alsa-project.org>; Tue,  9 Mar 2021 14:06:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ED69F8019B
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DvwR56S7pzkWgK;
 Tue,  9 Mar 2021 21:04:49 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 9 Mar 2021 21:06:10 +0800
From: 'Wei Yongjun <weiyongjun1@huawei.com>
To: <weiyongjun1@huawei.com>, Oder Chiou <oder_chiou@realtek.com>, "Liam
 Girdwood" <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Jaroslav
 Kysela" <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jack Yu
 <jack.yu@realtek.com>
Subject: [PATCH -next] ASoC: rt715-sdca: Fix return value check in
 rt715_sdca_sdw_probe()
Date: Tue, 9 Mar 2021 13:14:58 +0000
Message-ID: <20210309131458.1884899-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function devm_regmap_init_sdw_mbq() and
devm_regmap_init_sdw() returns ERR_PTR() not NULL. The NULL test
in the return value check should be replaced with IS_ERR().

Fixes: 393c52d2d109 ("ASoC: rt715-sdca: Add RT715 sdca vendor-specific driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index bcced85876b0..1350798406f0 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -184,12 +184,12 @@ static int rt715_sdca_sdw_probe(struct sdw_slave *slave,
 
 	/* Regmap Initialization */
 	mbq_regmap = devm_regmap_init_sdw_mbq(slave, &rt715_sdca_mbq_regmap);
-	if (!mbq_regmap)
-		return -EINVAL;
+	if (IS_ERR(mbq_regmap))
+		return PTR_ERR(mbq_regmap);
 
 	regmap = devm_regmap_init_sdw(slave, &rt715_sdca_regmap);
-	if (!regmap)
-		return -EINVAL;
+	if (IS_ERR(regmap))
+		return PTR_ERR(regmap);
 
 	return rt715_sdca_init(&slave->dev, mbq_regmap, regmap, slave);
 }

