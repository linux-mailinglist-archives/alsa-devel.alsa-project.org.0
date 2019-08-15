Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7208E7FB
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Aug 2019 11:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0E0B165F;
	Thu, 15 Aug 2019 11:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0E0B165F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565860790;
	bh=kmk/oMu7v33b/8QsEUUY/z61xJe43aNtW3C85LJmfA4=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fUFBcBJ1AzB82aa5Pcd9gOU7Q5H6aZfwYY0SD/OOxTqXhTCpiHvnJAjKLTGZlbOsA
	 3dU3oju2GuNcm0/Bu2Fg7s3uc6JUqBZXnROQh07LS6Zhybh+wsdGxpGoDdaQX9pplD
	 QStMMtXR9XcHS+AqLpEDp+Nb0/QTgJmKr6BIBSzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 65796F80273;
	Thu, 15 Aug 2019 11:18:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17824F80274; Thu, 15 Aug 2019 11:18:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F163DF8015B
 for <alsa-devel@alsa-project.org>; Thu, 15 Aug 2019 11:18:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F163DF8015B
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 9A43D17C3A25E7092CA3;
 Thu, 15 Aug 2019 17:17:56 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 15 Aug 2019
 17:17:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <afd@ti.com>, <colin.king@canonical.com>
Date: Thu, 15 Aug 2019 17:17:38 +0800
Message-ID: <20190815091738.21680-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH -next] ASoC: tlv320aic31xx: remove unused
	variable 'cm_m_enum'
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

sound/soc/codecs/tlv320aic31xx.c:261:29: warning:
 cm_m_enum defined but not used [-Wunused-const-variable=]

It is never used, so can be removed.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/tlv320aic31xx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 26a4f6c..df627a0 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -258,7 +258,6 @@ static SOC_ENUM_SINGLE_DECL(mic1rp_p_enum, AIC31XX_MICPGAPI, 4,
 static SOC_ENUM_SINGLE_DECL(mic1lm_p_enum, AIC31XX_MICPGAPI, 2,
 	mic_select_text);
 
-static SOC_ENUM_SINGLE_DECL(cm_m_enum, AIC31XX_MICPGAMI, 6, mic_select_text);
 static SOC_ENUM_SINGLE_DECL(mic1lm_m_enum, AIC31XX_MICPGAMI, 4,
 	mic_select_text);
 
-- 
2.7.4


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
