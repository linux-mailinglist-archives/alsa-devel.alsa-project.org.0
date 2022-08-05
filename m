Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0535E58A5FA
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Aug 2022 08:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E8CAF7;
	Fri,  5 Aug 2022 08:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E8CAF7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1659681666;
	bh=GXgIDs8kibNFxrrk7AAX0lV6rdXCJP0PiOCMbEjlnG0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PehMcrsHIZSY8Ksfbisbes5ziUIf4hnM62ygvrcAwxKzjGdzwvkVMxyO7ZYD2oo3q
	 WNGjodPKk0U+5oPPNDAk7cBbwAuupaeJ5B8sSHl7qBU9/hIjxChNyc7Fjp6HXJrE/X
	 7R9RgBeCEgHkWR0R3WQiH/7nlvbwOJb3PywdZO4I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE119F80271;
	Fri,  5 Aug 2022 08:40:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBC71F8013D; Fri,  5 Aug 2022 08:40:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NO_DNS_FOR_FROM,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1B577F8013D
 for <alsa-devel@alsa-project.org>; Fri,  5 Aug 2022 08:40:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1B577F8013D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="kpA6bYaZ"
Received: by mail-ej1-x631.google.com with SMTP id gk3so3312300ejb.8
 for <alsa-devel@alsa-project.org>; Thu, 04 Aug 2022 23:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=kpA6bYaZVNdY5XPuTwRvs/4t2P2Jn7AIV5rT96nKfRBPIB8wjbIhAI7XMVCuac5coR
 o4CO9nwCDgK+whRCFocX/baE6lWplV7v0ePT/D5Zm+V5MOoc47d3uDQkHzBTy60nfPgx
 kh0ocgfXKM2mMG1ncreWjMHozyZd6Sm6lXfUv+rwHNvCtLVuCBq1FLLa5kfqNKfmzuRI
 it+GR7DmZpbaIQdX2cK0ZsjVWWMVrJMRLfpu0y6nbck1Z+nMO1OoYhyMHPDj63ShN/Gz
 8LZzqE3E3ogl7GLsA3/2tSgV9c7qKgkw9YRhIXPGs1X8bOlBzUBTfdvPNlAtDMEYY77q
 8DCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=ENBjMlJUGNvOL2BE1eZ5xrOz4MlM79x2yU1+2SBrNl1dpI2eM/8ZGxtB2W00jLc3Lk
 DMi6Kwvl6vhoBWKcVevKRV87Mc3YSA4IyORt6pNsPphpsjKWNMtgMhUhO9v7ZbSPcx16
 0SIsE4WtDisCEyY8A7CgRJxGGxRK+ht6Ect2Fi1UMtxSZbVB8Ml6PjbKfWFC21kINroU
 VJ1m2OcgA1OZFp8bTzCO77a50vk+7oH4afNTuKXnADFFg6/bM+3pftd7fZ1bYiJKUDG0
 t262z3VfjcFB7ppwOmMWzHXpsAu5BEuGMkXqubhdJbKfbXTKxc/hv3yf6FVEiq/I/7p5
 0BvQ==
X-Gm-Message-State: ACgBeo0Jg8wUPL93MvP5DoduyfNUkhDzchCNhvXnUxvh+t2BU0pMtyM3
 fPaTRahNHClHnT1i8Pc+x20=
X-Google-Smtp-Source: AA6agR5MnwJei2qMi9xCPBXMyJBR3CjOgKjjo5gERif3wfzLaWzUTeQyRhVX5l+BxEggBeS4PVlK1g==
X-Received: by 2002:a17:906:93ef:b0:730:69e0:dd0c with SMTP id
 yl15-20020a17090693ef00b0073069e0dd0cmr4120144ejb.609.1659681600787; 
 Thu, 04 Aug 2022 23:40:00 -0700 (PDT)
Received: from pca.lan (dd57636e4.access.telenet.be. [213.118.54.228])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a170906140700b0073066d4d7a4sm1184987ejc.80.2022.08.04.23.39.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 23:40:00 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Fri,  5 Aug 2022 08:39:42 +0200
Message-Id: <20220805063942.8520-1-pieterjan.camerlynck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

