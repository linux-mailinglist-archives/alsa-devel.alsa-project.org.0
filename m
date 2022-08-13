Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AA591974
	for <lists+alsa-devel@lfdr.de>; Sat, 13 Aug 2022 10:35:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C6EB829;
	Sat, 13 Aug 2022 10:34:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C6EB829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660379738;
	bh=FtdNfMjINTvJpDxfnZe7jiV7bTj40+N4jlglFNF7kTI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bgWVv8YdnZTBNliVZnTpA4dGem4NcL0yxjd6+dCk35NJ7wUXi2oepxGJ73EvxwWGP
	 A2+l+cNTf8nDyaiXAvuPIJavI+SrEfxREmUGD3wwcPeXF5XsaI0MGWC7XjXw4VvsY2
	 toVyl7Dn0JuGyi4cMMPa+/3yyDvSVEoJbjzfcETI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73F16F800AA;
	Sat, 13 Aug 2022 10:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CE2E1F80166; Sat, 13 Aug 2022 10:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4CB81F800AA
 for <alsa-devel@alsa-project.org>; Sat, 13 Aug 2022 10:34:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4CB81F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CKPeBNjS"
Received: by mail-ej1-x634.google.com with SMTP id w19so5512876ejc.7
 for <alsa-devel@alsa-project.org>; Sat, 13 Aug 2022 01:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=giMh6CV+ebQaMfil4WhC+L/0OniXZ48oEVWUpwWfMDs=;
 b=CKPeBNjSUoVfcYjf2H0tn6lNfb4WCfH+qcPtLe20kpAf1XSdq1ou13nbDylclZhgD6
 ki1V4f57v8AcfC4HPm7ZSkxfJfiHWfJFaxLzddNKM1YCsQQ0y2mKWNZdL8ixvJ6KD4J8
 FSylg13oxehSO15OyPeLWb7mTRuYpAAL3frMeLcLMGJVoAOwPze667o7nEn1k72/buOx
 BvmU9/stXwcHbfLUgxAW0GOsurGBjg3rXdRIeOfzxj0myq77l9NwosfecMYTlrV3UrZb
 UWcBO43HL3uWb/tUnXCuMy3NlC3B6+MmLoOxACezPUAOC61q0OW8TsrAAXKYtdcVAUr6
 wbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=giMh6CV+ebQaMfil4WhC+L/0OniXZ48oEVWUpwWfMDs=;
 b=LzXMlM5DVZp9lXtFrscwmACW9pgBgACie2Fh8tpYsNraQo2LYAxwsWc9ppEieiAQ/R
 xlApXKGP6gXZaWUVxfvjkBiivHlNWD2Z9d8qawxZteSu8nhzfXSo9izLEXKPUHbnSKMM
 5XicdJKg7tORqWBOBgGWLl3WVJi9zR6I1WH6q0/VY90cDo+IhA88hoLX664WAwOIBGPC
 Jq/ee0eEdUEmdCMH/BdmnUA6mH4KY8xYszpEGWOPJrdYHrh+ZBL7+gQF+iUnzQVbS+BR
 L1sPMQU1bVKPAEJNJNfMszMr3fb9xy9vURiZMZdJEaKd6j0p/L+ImI6Sy2wB/AHQyKOh
 568Q==
X-Gm-Message-State: ACgBeo0i8ovKwrCINqzncsNOwfbR76TLe2ZG/03A7UZFo3NzEMihIrim
 UeGz0sxaTBcpwYEG+43YqAU=
X-Google-Smtp-Source: AA6agR5/50LsvrEBmEVylqJMNR6BNXGjnKBGmDDXPFCJ/to2MC9nIENXqMl7u4Pw4kWk29w7Fk5NdQ==
X-Received: by 2002:a17:907:e94:b0:730:af21:cf60 with SMTP id
 ho20-20020a1709070e9400b00730af21cf60mr4639547ejc.681.1660379672269; 
 Sat, 13 Aug 2022 01:34:32 -0700 (PDT)
Received: from pca.lan (ptr-dc5856nwo1xazteick5.18120a2.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0:d03:1d8d:20cb:2215])
 by smtp.gmail.com with ESMTPSA id
 u26-20020aa7d55a000000b0042de3d661d2sm2718172edr.1.2022.08.13.01.34.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Aug 2022 01:34:31 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Sat, 13 Aug 2022 10:33:52 +0200
Message-Id: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
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

In commit c3ecef21c3f26 ("ASoC: fsl_sai: add sai master mode support")
the loop was changed to start iterating from 1 instead of 0. The error
message however was not updated, reporting the wrong clock to the user.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
V2: rebase against latest version
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 7523bb944b21..d430eece1d6b 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1306,7 +1306,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
 			dev_err(dev, "failed to get mclk%d clock: %ld\n",
-					i + 1, PTR_ERR(sai->mclk_clk[i]));
+					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
 	}
-- 
2.25.1

