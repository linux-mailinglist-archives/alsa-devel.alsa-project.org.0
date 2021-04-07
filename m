Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E103435A465
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 19:11:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5945F166E;
	Fri,  9 Apr 2021 19:10:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5945F166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617988266;
	bh=/SwzTW7s01iJuM8l3I9tvUUbIq1eKaXsPUJ/0/MihnQ=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pOSoFel/TKK59dM2R06MjbrreTTSJ2aNmKGt+upkMJ5rkyPiq21QcNT/c2ApNAWej
	 4GBrYRBcGy59I5EArhL0fq2WN2Dy6rCPcpkBfDzvgDSnOhL5Ayfsk3W90ajQVhcP4E
	 nbH8geP6Rnh23VaOu0ae0f52wbQxfk0pj2whmXeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B066AF8016D;
	Fri,  9 Apr 2021 19:09:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72567F8016A; Wed,  7 Apr 2021 11:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B42DCF80162
 for <alsa-devel@alsa-project.org>; Wed,  7 Apr 2021 11:56:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B42DCF80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PFu66/SN"
Received: by mail-wm1-x331.google.com with SMTP id
 z24-20020a1cf4180000b029012463a9027fso250223wma.5
 for <alsa-devel@alsa-project.org>; Wed, 07 Apr 2021 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=XI8zjCWrHrG5RIk4b3Hbm5Q3Z+HRUCQWg5bfMzD9Jsw=;
 b=PFu66/SNVZwtKmaSFIdn/9ceMMmMfrg5wm0jZCzFUOkxp7UMTjNzv+rpxe0GGHZd2t
 OyUq7Wdpon8ac2O4cHKkqaff7q9WnGVUzBrPFeGiEbUVFvKU3kWjyer2a4ATgUMZDm9b
 0J+3qUscAHVFfQyzTikzaUaXOOBRcJpsZErg1MNFGMuYnF2lN6VKu3TiA75OUhjxYsNX
 +i2RPqiOvBGzHehsYWL1vZn/9M3gxc2B7kw4cXkDaED/e5vGrrRg2FJQhKOh1zPdOaL6
 tfxlWfOxCek89UCQERc0S+8OmZU2a/9n3S87Bzw6VAKoruJH54FsPLrqQkBgpdiqxosf
 u4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=XI8zjCWrHrG5RIk4b3Hbm5Q3Z+HRUCQWg5bfMzD9Jsw=;
 b=IhVbeWPc1EPgfWe29tuS3OjPcpo7pF7k3+UGeQHI1Mzm/n35TwKl8D/wF88Ljn4C/r
 B6Ro190SGkcp6Qam8hXbdtq/vZeWKE2bM5cnl7DCWdgHRjCudhFeH6/vtnb1ctbxSUwa
 sDvRF6xEg7RMyDnVnvNctjVrQKamjdbyIkC8tgiOBdnGzU3K6+CnUvmdnISwQ5QYIZm4
 3JceV507toPnfArFCHfRnmZ5/prBR+MT6AdKtq6ZWfCvr5ydkvFX4APfrB/kUSPhEC4o
 6wKIvzuG2PYQZdhzLyf+kJjkboi8923xu8SQXPCApbPaCzqYqeXU9Rj1/gxyX4dGdi+6
 oVAA==
X-Gm-Message-State: AOAM530RhrpB9PttuV4wG3mVGzBH3VfGRbk1+gt4Fdio69iqnZ0UGdID
 rN+4z1WLxrx4Tj4P8dPoLAE=
X-Google-Smtp-Source: ABdhPJyFvIZgCudXxRH75W0b0/ObztMY9OZAeZr5OgyvwLXGLUX3a+7dZmd43PJqWcc67lcFZcMvMQ==
X-Received: by 2002:a1c:7209:: with SMTP id n9mr2286646wmc.132.1617789402785; 
 Wed, 07 Apr 2021 02:56:42 -0700 (PDT)
Received: from LEGION ([39.46.7.73])
 by smtp.gmail.com with ESMTPSA id u8sm39863959wrr.42.2021.04.07.02.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 02:56:42 -0700 (PDT)
Date: Wed, 7 Apr 2021 14:56:34 +0500
From: Muhammad Usama Anjum <musamaanjum@gmail.com>
To: Timur Tabi <timur@kernel.org>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH] ASoC: fsl: sunxi: remove redundant dev_err call
Message-ID: <20210407095634.GA1379642@LEGION>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 09 Apr 2021 19:09:35 +0200
Cc: linqiheng@huawei.com, kernel-janitors@vger.kernel.org,
 musamaanjum@gmail.com, dan.carpenter@oracle.com
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

devm_ioremap_resource() prints error message in itself. Remove the
dev_err call to avoid redundant error message.

Signed-off-by: Muhammad Usama Anjum <musamaanjum@gmail.com>
---
 sound/soc/fsl/fsl_aud2htx.c   | 4 +---
 sound/soc/fsl/fsl_easrc.c     | 4 +---
 sound/soc/sunxi/sun4i-codec.c | 4 +---
 3 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index d70d5e75a30c..a328697511f7 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -198,10 +198,8 @@ static int fsl_aud2htx_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(&pdev->dev, "failed ioremap\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 
 	aud2htx->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 						&fsl_aud2htx_regmap_config);
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 5e33afe87c4a..b1765c7d3bcd 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -1889,10 +1889,8 @@ static int fsl_easrc_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(dev, res);
-	if (IS_ERR(regs)) {
-		dev_err(&pdev->dev, "failed ioremap\n");
+	if (IS_ERR(regs))
 		return PTR_ERR(regs);
-	}
 
 	easrc->paddr = res->start;
 
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 2173991c13db..6f3d9148a185 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1711,10 +1711,8 @@ static int sun4i_codec_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(base)) {
-		dev_err(&pdev->dev, "Failed to map the registers\n");
+	if (IS_ERR(base))
 		return PTR_ERR(base);
-	}
 
 	quirks = of_device_get_match_data(&pdev->dev);
 	if (quirks == NULL) {
-- 
2.25.1

