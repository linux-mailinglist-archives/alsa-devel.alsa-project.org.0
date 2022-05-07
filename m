Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB8C52153B
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 14:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F8E218A7;
	Tue, 10 May 2022 14:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F8E218A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652185445;
	bh=GXgIDs8kibNFxrrk7AAX0lV6rdXCJP0PiOCMbEjlnG0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=X00ZxzyMQ6xToR0Yk4SnjjUwbEs4TvIJpjOqkJwfvEOZCFLrGBLGwqIX3B1lFg38X
	 GZgdCwnze8nSnFH2yHVmwqCLUyjnB8KqBYzVNUJzFk8kLfunAmrAbimUnc3bJthLce
	 IfHE8x7uQ/R2kYA3KqRsEcecJ95XR3o97XmX5AEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF43BF80519;
	Tue, 10 May 2022 14:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DEBF80155; Sat,  7 May 2022 14:31:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0CB5EF800D3
 for <alsa-devel@alsa-project.org>; Sat,  7 May 2022 14:31:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0CB5EF800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="jSWuncNA"
Received: by mail-ej1-x62d.google.com with SMTP id gh6so18956457ejb.0
 for <alsa-devel@alsa-project.org>; Sat, 07 May 2022 05:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=jSWuncNAiU0XkPaOT1H89zBzD0IQbe9EpFSJVAJNDrfrhJ475C3/F1a3IRUpkfdmfl
 z5FYvQB3AxePJWNCui/KXqmyoKXJvtMUI3YmIK3SI/XfbdKwbALc15eOsfve/uT1hAV5
 KrV5JwXSKPUIr6C9cB0qe+O8iSfy6eiSlf7p6ihESMr7M1iGsnLs0ze8PAOL35nKHjCi
 TrulnuUgvOH98Ktl1Y+5P9gLjG69IA+KtlBrubuLth9BWu3HNiuqdsoC70GxoAqZ6bux
 Ew2//PR/5ufgtbHfTK62Pagl53ORU3lyO6MqepZsTijkUelvniZTwsuIS3MPFNeP7YNz
 Du8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=odrTWnnk+0TKPwvD0iPYLdpq8OBfQIl/lud0T5I07wwRJZI30XCGt7CiTgyccdY3WP
 iA3qQDPfYNp61XRP89wgqw8R3iy9YwM9J8MoJNgmGJ7gKN+CoNc66yBDMtxUz9WU8IZy
 FlCvUhMHh1s8CQZCYWZr7EqiUTf0sAmWd43l+0ebPV1xZ+w+8zCuBCOQV5v5lKQFavDQ
 ObHaKPfJ7YmCt/CuP9IDJz8oarLMK23yFIE9DZDBtamoQXofsgIdX1YPlc+hxO3YkNUN
 4KW/4NLjauEbhKRuoteWj9Rc0T9vYjG9Xk+38haTrmb9/FYKWou5IKrQLvqP0+Biqb6m
 78fw==
X-Gm-Message-State: AOAM530qL7NmZZQbYZ0JKa8rCCJ5w/NcTcPCiCsovFB/mqpJcK3KF2hP
 CAcyD7uu5+hgJ5/HvJx23+Si/Ywk05ny8g==
X-Google-Smtp-Source: ABdhPJwgi2oAExzw1tYk1Mg5zfE640UsZvBoS4IF5pYyh1DxuoHxiAg8VieZVSJo8xU8ihZXToPuwA==
X-Received: by 2002:a17:907:7e9f:b0:6f6:e9ce:9939 with SMTP id
 qb31-20020a1709077e9f00b006f6e9ce9939mr4108603ejc.456.1651926665959; 
 Sat, 07 May 2022 05:31:05 -0700 (PDT)
Received: from pca.lan (ptr-dc5856ogfk7hh0p2zet.18120a2.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0:311d:17d5:927c:28c5])
 by smtp.gmail.com with ESMTPSA id
 d23-20020aa7d697000000b0042617ba63absm3468466edr.53.2022.05.07.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 05:31:05 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Subject: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Sat,  7 May 2022 14:31:01 +0200
Message-Id: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 10 May 2022 14:21:49 +0200
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
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

In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
the loop was changed to start iterating from 1 instead of 0. The error
message however was not updated, reporting the wrong clock to the user.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ffc24afb5a7a..f0602077b385 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
 			dev_err(&pdev->dev, "failed to get mclk%d clock: %ld\n",
-					i + 1, PTR_ERR(sai->mclk_clk[i]));
+					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
 	}
-- 
2.25.1

