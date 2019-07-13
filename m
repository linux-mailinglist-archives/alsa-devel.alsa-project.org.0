Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 562A56780B
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Jul 2019 05:51:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C40DB165D;
	Sat, 13 Jul 2019 05:50:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C40DB165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562989859;
	bh=y8pJ18hsPGePE6oLi9IS/5kYDf1XB7KG98fOEkvT9vQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tjPF+gTciJXUwmLqsECcav46pOxRbC82v8/8sEWhxeCDrrpMdnyDVVDq6/+8ujFxC
	 2O/NaESb9M6KfRHaXt1QA72Niln7P5pD2yfvERUWhGwFKIiYyrTsppY/IDOM0KgnJ4
	 6MEI8vfml6IwAsomZZQ3r2BSb8jfTfKrOBArPtvc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AE5AF80361;
	Sat, 13 Jul 2019 05:48:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC967F80271; Sat, 13 Jul 2019 05:48:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [63.217.80.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8A76F800D0
 for <alsa-devel@alsa-project.org>; Sat, 13 Jul 2019 05:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8A76F800D0
Received: from mse-fl1.zte.com.cn (unknown [10.30.14.238])
 by Forcepoint Email with ESMTPS id 9220ADD60F5720B25519;
 Sat, 13 Jul 2019 11:48:21 +0800 (CST)
Received: from notes_smtp.zte.com.cn ([10.30.1.239])
 by mse-fl1.zte.com.cn with ESMTP id x6D3m9QF091066;
 Sat, 13 Jul 2019 11:48:09 +0800 (GMT-8)
 (envelope-from wen.yang99@zte.com.cn)
Received: from fox-host8.localdomain ([10.74.120.8])
 by szsmtp06.zte.com.cn (Lotus Domino Release 8.5.3FP6)
 with ESMTP id 2019071311485264-2322081 ;
 Sat, 13 Jul 2019 11:48:52 +0800 
From: Wen Yang <wen.yang99@zte.com.cn>
To: krzk@kernel.org
Date: Sat, 13 Jul 2019 11:46:14 +0800
Message-Id: <1562989575-33785-2-git-send-email-wen.yang99@zte.com.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
References: <1562989575-33785-1-git-send-email-wen.yang99@zte.com.cn>
X-MIMETrack: Itemize by SMTP Server on SZSMTP06/server/zte_ltd(Release
 8.5.3FP6|November 21, 2013) at 2019-07-13 11:48:52,
 Serialize by Router on notes_smtp/zte_ltd(Release 9.0.1FP7|August  17, 2016) at
 2019-07-13 11:48:16, Serialize complete at 2019-07-13 11:48:16
X-MAIL: mse-fl1.zte.com.cn x6D3m9QF091066
Cc: wang.yi59@zte.com.cn, alsa-devel@alsa-project.org, xue.zhihong@zte.com.cn,
 sbkim73@samsung.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, broonie@kernel.org, s.nawrocki@samsung.com,
 cheng.shengyu@zte.com.cn, Wen Yang <wen.yang99@zte.com.cn>
Subject: [alsa-devel] [PATCH 1/2] ASoC: samsung: odroid: fix an
	use-after-free issue for codec
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The codec variable is still being used after the of_node_put() call,
which may result in use-after-free.

Fixes: bc3cf17b575a ("ASoC: samsung: odroid: Add support for secondary CPU DAI")
Signed-off-by: Wen Yang <wen.yang99@zte.com.cn>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-kernel@vger.kernel.org
---
 sound/soc/samsung/odroid.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index dfb6e46..64ebe89 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -284,9 +284,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 	}
 
 	of_node_put(cpu);
-	of_node_put(codec);
 	if (ret < 0)
-		return ret;
+		goto err_put_node;
 
 	ret = snd_soc_of_get_dai_link_codecs(dev, codec, codec_link);
 	if (ret < 0)
@@ -317,6 +316,7 @@ static int odroid_audio_probe(struct platform_device *pdev)
 		goto err_put_clk_i2s;
 	}
 
+	of_node_put(codec);
 	return 0;
 
 err_put_clk_i2s:
@@ -326,6 +326,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 err_put_cpu_dai:
 	of_node_put(cpu_dai);
 	snd_soc_of_put_dai_link_codecs(codec_link);
+err_put_node:
+	of_node_put(codec);
 	return ret;
 }
 
-- 
2.9.5

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
