Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 802A1323A1
	for <lists+alsa-devel@lfdr.de>; Sun,  2 Jun 2019 16:57:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 105EA165D;
	Sun,  2 Jun 2019 16:57:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 105EA165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559487478;
	bh=QSrQ+CZ1ssezSWy306zhP8x4UvjOB42QMWumekSe790=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JJm7jZ6a1IyD1kWrCiXGQFrigFJoDzl1NdR1mVsQY6UaF6fB9zhTOrs2Ckg9mLP00
	 /5B/iWGkF+sdhbxaQ2LLfYcYK71d8n/FKOnjLr/NnyFKLWGD28XEgBtJC9BEOzAezC
	 iOq+ZWSUrul13HZ2dzM09irWr/6dFpkRUk2hQ2aA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50784F896F7;
	Sun,  2 Jun 2019 16:56:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97660F896F7; Sun,  2 Jun 2019 16:56:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0889CF80CC4
 for <alsa-devel@alsa-project.org>; Sun,  2 Jun 2019 16:56:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0889CF80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="WsL5NCHO"
Received: by mail-lj1-x243.google.com with SMTP id e13so13793013ljl.11
 for <alsa-devel@alsa-project.org>; Sun, 02 Jun 2019 07:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DW2E0BpzAc0HLFFmW75+Kp5tG91kuZE20dTCBSAHOjQ=;
 b=WsL5NCHO/hx1ZcYASq4bsmolID5vN3N1r5wG/oh7g8v9HayVY74o1nj2uE6NvUpM+t
 dByuvmgtCWtJmogFel7dFCHTiIsgOSJclkZ3LElEGL5FLevDqF3Tm25/Mz/fftMMWMha
 kWImrXq7jvQXlgq5Dlw2jVjERZ0/NNI0ApMjPxRfOvDp9aykkipBF4yhaERnX1ZuGSI5
 haG2X8KSUGAtGdmSFDJDI3I8XCzb5BgO5DVX0NV4JRBFWRcKAHeH/QGERFelXs2+l4Hc
 w7DL2pR3j8JMZEKcvfgE8Sg1D/QP7Rx8ELE3zkJnd8XCkXEhpyJSFm01SHb+BAjswNGu
 EqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DW2E0BpzAc0HLFFmW75+Kp5tG91kuZE20dTCBSAHOjQ=;
 b=TP4OqBRrL010RgGuc6QQzsHHoA25SvXxmWIfXzDQW91yCiPk5SeFmnuVephvdpO1az
 98kZDja7DEoObs01qKnh0rgybLSKb/6YIS86y+uHgetu0JexvHosmN5n7zDvbrmRveqR
 UU4dggrdszMQdbcrcilMIrCcsM2On/C2qgTQ/KWBxTYzTpdkCt6OVC9H+/PpZyFKjURk
 QT69n0bF5CZaEmaBSnRAenl6c0whvf9r6+wkniHqh7v5rLCwlIx22fp28pw5P6U15fu6
 L/AgT/ILcomaR0cClB4TCTZCIxdu99kL9bSJEpTn91PNbMfSPnEe+o2YAkx2pUrj1wtz
 Udww==
X-Gm-Message-State: APjAAAWjVtxEGtbE3cFRADWsrdw3IlobOiU/NBOzvrYmZzPKoJHQ+Cuw
 ejsuZDgppQsf1OYaXIr84dA=
X-Google-Smtp-Source: APXvYqxuvhbc5F1/SxRPxqwQh4RZAsUd4T+CyhZn3U7SOKGpwqiR7EKjrJoNpV/YsRm9j6xUQKE+3g==
X-Received: by 2002:a2e:5d49:: with SMTP id r70mr11553508ljb.102.1559487366917; 
 Sun, 02 Jun 2019 07:56:06 -0700 (PDT)
Received: from z50.gdansk-morena.vectranet.pl
 (109241207190.gdansk.vectranet.pl. [109.241.207.190])
 by smtp.gmail.com with ESMTPSA id x14sm2523212lfe.83.2019.06.02.07.56.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 02 Jun 2019 07:56:06 -0700 (PDT)
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Mark Brown <broonie@kernel.org>
Date: Sun,  2 Jun 2019 16:55:49 +0200
Message-Id: <20190602145549.30899-1-jmkrzyszt@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-omap@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: [alsa-devel] [PATCH] ASoC: ti: Fix SDMA users not providing channel
	names
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

McBSP used to work correctly as long as compat DMA probing, removed by
commit 642aafea8889 ("ASoC: ti: remove compat dma probing"), was
available.  New method of DMA probing apparently requires users to
provide channel names when registering with SDMA, while McBSP passes
NULLs.  Fix it.

The same probably applies to McASP (not tested), hence the patch fixes
both.

Fixes: 642aafea8889 ("ASoC: ti: remove compat dma probing")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
---
 sound/soc/ti/davinci-mcasp.c | 2 +-
 sound/soc/ti/omap-mcbsp.c    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 9fbc759fdefe..f31805920e3e 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2237,7 +2237,7 @@ static int davinci_mcasp_probe(struct platform_device *pdev)
 		ret = edma_pcm_platform_register(&pdev->dev);
 		break;
 	case PCM_SDMA:
-		ret = sdma_pcm_platform_register(&pdev->dev, NULL, NULL);
+		ret = sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 		break;
 	default:
 		dev_err(&pdev->dev, "No DMA controller found (%d)\n", ret);
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index a395598f1f20..610c5e706fd2 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1438,7 +1438,7 @@ static int asoc_mcbsp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	return sdma_pcm_platform_register(&pdev->dev, NULL, NULL);
+	return sdma_pcm_platform_register(&pdev->dev, "tx", "rx");
 }
 
 static int asoc_mcbsp_remove(struct platform_device *pdev)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
