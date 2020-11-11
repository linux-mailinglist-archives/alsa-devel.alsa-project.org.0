Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D602AF19E
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 14:07:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 430EC1703;
	Wed, 11 Nov 2020 14:06:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 430EC1703
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605100058;
	bh=J0VAf0Uixw7QGnpIL83WkbdSiBgeF6BMc6FjQo+mwkI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AaHk89aVOOdXHkGMjf/+KC0y6dJKIVTG8q601CDIcWZkAlhSXJEEz1JCuEqH7Rm73
	 hFqqXtFqkEmC49AElPmokOIIrf//4wbvxrNSsQExYUcXSomCEORzfaNDp/yQ0gmBgD
	 m78urvP/X0Z7kmoW5MO+PbHyES2/wg+vfn322mYk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70C3BF80271;
	Wed, 11 Nov 2020 14:05:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B678F8025E; Wed, 11 Nov 2020 14:05:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08296F801F5
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 14:05:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08296F801F5
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CWQ2P1FyVzhZND;
 Wed, 11 Nov 2020 21:05:33 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 21:05:38 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <rf@opensource.cirrus.com>
Subject: [PATCH v2 3/4] ASoC: wm8994: Fix PM disable depth imbalance on error
Date: Wed, 11 Nov 2020 21:09:22 +0800
Message-ID: <20201111130923.220186-4-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201111130923.220186-1-zhangqilong3@huawei.com>
References: <20201111130923.220186-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org
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

The pm_runtime_enable will increase power disable depth. Thus
a pairing decrement is needed on the error handling path to
keep it balanced according to context.

Fixes: 57e265c8d71fb ("ASoC: wm8994: Move runtime PM init to platform device init")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/wm8994.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index fc9ea198ac79..f57884113406 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4645,8 +4645,12 @@ static int wm8994_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	pm_runtime_idle(&pdev->dev);
 
-	return devm_snd_soc_register_component(&pdev->dev, &soc_component_dev_wm8994,
+	ret = devm_snd_soc_register_component(&pdev->dev, &soc_component_dev_wm8994,
 			wm8994_dai, ARRAY_SIZE(wm8994_dai));
+	if (ret < 0)
+		pm_runtime_disable(&pdev->dev);
+
+	return ret;
 }
 
 static int wm8994_remove(struct platform_device *pdev)
-- 
2.25.4

