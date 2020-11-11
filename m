Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D24232AF1B1
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Nov 2020 14:08:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73DE0176C;
	Wed, 11 Nov 2020 14:07:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73DE0176C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605100108;
	bh=8wi1WNl+EPQo+TBW6DnItPQZpFg0h0s7c/CD0ovBl6o=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SwOnspLIW1Yob/l2tF2nYGzhL5wpQTaaf0vEKXVdfa+mJWVMa5y6Bo2gI5B+TAuTr
	 w9vo2FvMQjh3es4mSgbwcBFYalCe1IerbwTJ3unTmu2X8+hgIAxXI6S433tSFA/iPx
	 39hYSXNRGSJVpuukBzdnavpYcuOU6uEt3DZmdSM4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E314F804C3;
	Wed, 11 Nov 2020 14:06:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D644BF8027C; Wed, 11 Nov 2020 14:05:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E4ABF8022D
 for <alsa-devel@alsa-project.org>; Wed, 11 Nov 2020 14:05:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E4ABF8022D
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CWQ2S2Vvjzhhpc;
 Wed, 11 Nov 2020 21:05:36 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Wed, 11 Nov 2020
 21:05:37 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <rf@opensource.cirrus.com>
Subject: [PATCH v2 2/4] ASoC: arizona: Fix PM disable depth imbalance on error
Date: Wed, 11 Nov 2020 21:09:21 +0800
Message-ID: <20201111130923.220186-3-zhangqilong3@huawei.com>
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

Fixes: 85e7dd3f871b9 ("ASoC: arizona: Add support for setting the output volume limits")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 sound/soc/codecs/wm8997.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 229f2986cd96..014328162262 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1163,10 +1163,10 @@ static int wm8997_probe(struct platform_device *pdev)
 
 	ret = arizona_init_vol_limit(arizona);
 	if (ret < 0)
-		return ret;
+		goto err_pm_disable;
 	ret = arizona_init_spk_irqs(arizona);
 	if (ret < 0)
-		return ret;
+		goto err_pm_disable;
 
 	ret = devm_snd_soc_register_component(&pdev->dev,
 					      &soc_component_dev_wm8997,
@@ -1181,6 +1181,8 @@ static int wm8997_probe(struct platform_device *pdev)
 
 err_spk_irqs:
 	arizona_free_spk_irqs(arizona);
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
-- 
2.25.4

