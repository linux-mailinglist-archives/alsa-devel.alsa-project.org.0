Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 628FF4F11AC
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Apr 2022 11:09:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDAB3846;
	Mon,  4 Apr 2022 11:08:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDAB3846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649063346;
	bh=rCPmpT2K5ZhuHe3sQF3zzJV3g4Zm77QecS9qcI4RR74=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Y1Jz/dTC0lbGE0hKQ80rjrb6I6wgDepfsDWz7gug9pL2HZpwO3Ap/x54+Xyy5ozKQ
	 c7nBqI5UkIISvxopQN0pDwcHCW2peetiEgL/QDoQYHteCxQjRy9QrQJWY/H5wYnxv9
	 nUfl0NgGrDbyNXjcvpH3gMCRWlO5B82izxHJU5SE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C849F8012C;
	Mon,  4 Apr 2022 11:08:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CCABF80162; Mon,  4 Apr 2022 11:08:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F0D8F800D1
 for <alsa-devel@alsa-project.org>; Mon,  4 Apr 2022 11:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F0D8F800D1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ls68uvoO"
Received: by mail-pf1-x429.google.com with SMTP id h19so8392906pfv.1
 for <alsa-devel@alsa-project.org>; Mon, 04 Apr 2022 02:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id;
 bh=c4R3JJ+tk9qsvcjavAHFJ5wC1KGmyFCCYT/LvM1hEqY=;
 b=Ls68uvoOUR/HvzGT3MRTxlpWthdhU3tUNF4aOjl3xdUp65uTfi76PUS5jI+dbUcdaE
 cLqp5xrLy8rSPsGcnMlgnpN4FGY87jpzjfwKBcoSpAIvp8077bk/dLMbdcPZNmlgU3YJ
 Gy7EHuqAPdmftELz1JUVT39LOb58ukBenvxVttHwsiBVBpdl0y+q+lVu3fz0jWtIyvn8
 3bewdHaw5karz0Xr984lJIj29A0n0qfwxZP+QOVKOCndJIgBoPDAyJ2YchI81zG3j1Rr
 0NIMD9rUBcoFYrsQJwFKPMHEHBp0rC0m/6x96Vp2X02CYlNN4hSO8FqhDsL3flxSfPUR
 RRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=c4R3JJ+tk9qsvcjavAHFJ5wC1KGmyFCCYT/LvM1hEqY=;
 b=dvdKDzUAEGPy90AMM8eoAVbDRYkSbtiB0zaOfOK2YufaJ3+n9q0rnEXaIHMgGrHHF3
 nxEWwv0B8V3hO2kidVshyLeVcYc8ygGCQrz8VMPj4LbgRTxy0ulgbYFfqMIGl/SjauAN
 /Gn4USX0kJplRT+BCe5z8G/j+aAseQG6nBYL9HenRB+QZ5qrG1ah8Up4JkRD5juBfD/N
 wzxyHAxeWLYgMczXRZoOxN6Z664zhDcvwTYV14770l8JH9APCMITJv6hzdmjeKL4xTqi
 +Ys1z4bWwLsUnGYiccaCG3GOo7vdCq9uhvos6UwQeyjyeIEI4uN9yseC1pMH2jvzjoPZ
 Mrng==
X-Gm-Message-State: AOAM530ByZ7EiiwYuV9yP2ZbVlKmibsA3ma4UDtyops7SbYqnk9IKPDE
 eK8VLApw/hrX9yb3VBE2W5o=
X-Google-Smtp-Source: ABdhPJwG/xqzf7aCqAccqVqlycrMHQinGLZjwncodMQzeZKwvCOhlCagKN8TZY2f/EDfyzitWZjPmA==
X-Received: by 2002:a63:f515:0:b0:384:1f78:34b0 with SMTP id
 w21-20020a63f515000000b003841f7834b0mr24941626pgh.67.1649063279411; 
 Mon, 04 Apr 2022 02:07:59 -0700 (PDT)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id
 e12-20020a056a001a8c00b004fab88d7de8sm11299922pfv.132.2022.04.04.02.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 02:07:59 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Miaoqian Lin <linmq006@gmail.com>, Chris Morgan <macromorgan@hotmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Wei Yongjun <weiyongjun1@huawei.com>,
 Colin Ian King <colin.king@intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rk817: Use devm_clk_get() in rk817_platform_probe
Date: Mon,  4 Apr 2022 09:07:46 +0000
Message-Id: <20220404090753.17940-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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

We need to call clk_put() to undo clk_get() in the error path.
Use devm_clk_get() to obtain a reference to the clock, It has
the benefit that clk_put() is no longer required.

Fixes: 0d6a04da9b25 ("ASoC: Add Rockchip rk817 audio CODEC support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/codecs/rk817_codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 8fffe378618d..cce6f4e7992f 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -489,7 +489,7 @@ static int rk817_platform_probe(struct platform_device *pdev)
 
 	rk817_codec_parse_dt_property(&pdev->dev, rk817_codec_data);
 
-	rk817_codec_data->mclk = clk_get(pdev->dev.parent, "mclk");
+	rk817_codec_data->mclk = devm_clk_get(pdev->dev.parent, "mclk");
 	if (IS_ERR(rk817_codec_data->mclk)) {
 		dev_dbg(&pdev->dev, "Unable to get mclk\n");
 		ret = -ENXIO;
-- 
2.17.1

