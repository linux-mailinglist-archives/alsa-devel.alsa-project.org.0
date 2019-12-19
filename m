Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 277DC1262A0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2019 13:53:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2F0515E0;
	Thu, 19 Dec 2019 13:52:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2F0515E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576760025;
	bh=X9wHXlzvdBJfPzoZlZhPl68yi51+9im1g5/tpOH8HhM=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ret3QT9VKtvArnGGs0hlHBivc1bKu0BB/VJaKANQBv59EelnWjpkv+dU1pgCRulQz
	 2ejqYvP8/pXaRic1CsPYj3suaarf1/c6OKLMHMsEPI+759dzwwEicNx0XKBmQZ65me
	 XFN8eVv/JmScJHwbNmK7ZHhkD0AwKOuRMG/Hi0Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FF8CF80253;
	Thu, 19 Dec 2019 13:52:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CEA5BF80234; Thu, 19 Dec 2019 13:51:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 5971BF8014F
 for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2019 13:51:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5971BF8014F
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 291AD31B;
 Thu, 19 Dec 2019 04:51:55 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9ADF33F719;
 Thu, 19 Dec 2019 04:51:54 -0800 (PST)
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org
Date: Thu, 19 Dec 2019 12:51:40 +0000
Message-Id: <20191219125140.47689-1-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Tzung-Bi Shih <tzungbi@google.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [alsa-devel] [PATCH] ASoC: max98090: Remove empty suspend function
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

The suspend function is empty so can be removed.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98090.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index da23810f958e..4c7b16d557e2 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -2838,17 +2838,12 @@ static int max98090_resume(struct device *dev)
 
 	return 0;
 }
-
-static int max98090_suspend(struct device *dev)
-{
-	return 0;
-}
 #endif
 
 static const struct dev_pm_ops max98090_pm = {
 	SET_RUNTIME_PM_OPS(max98090_runtime_suspend,
 		max98090_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(max98090_suspend, max98090_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(NULL, max98090_resume)
 };
 
 static const struct i2c_device_id max98090_i2c_id[] = {
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
