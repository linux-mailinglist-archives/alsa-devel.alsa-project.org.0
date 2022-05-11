Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79930522CB3
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 08:59:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C322192D;
	Wed, 11 May 2022 08:58:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C322192D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652252361;
	bh=Ys/qOEDjmuuD7bxEDGjv1d7gVLGqLoHLlf43idhjzKY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bV4d1uSXyMmZXx5x3I+C7A+YGsgPchoxOSA6jZ7nOhc9unE1qIXFO4eSt0D7APdfx
	 Az8FJG3uJoZ4miCxRAeiFNnFaqihT9geIZylU9pVDyuOwYmsSMg03aXhDbfZy9oI38
	 mCoU7oWC2HnijSVmsFEtv2O/72sAeeJ2EYoc9auc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9642DF800BB;
	Wed, 11 May 2022 08:58:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE51DF80137; Wed, 11 May 2022 08:58:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C51AF800BB
 for <alsa-devel@alsa-project.org>; Wed, 11 May 2022 08:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C51AF800BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pgjJK2J3"
Received: by mail-pl1-x631.google.com with SMTP id n8so1017137plh.1
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 23:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6wA7u9nlH2LdboqPtaGVfPJPki2AKRQH5484bIHWMg=;
 b=pgjJK2J39T3beCax1II7a6Dqfmdllwbq+uAase9DTEpHkBGCFCCvVu8HbOEwWKI9T0
 /pih1l6aBpvIl9mSeaXn6BOyuf0MdTOFcY+6lMQf4IMdGYEGbkWgReR5kHEX7G2x9PN/
 qeU/D5dc0FTYlZCoBy87ORI12sLce4/ykfmoeKovnUp0pNWv8y5tZA3DL4prCrdrV7Ts
 n8bXfTG4Hbs4qw8+LlUw1N4qmDjpFNIzKoazkMlomEYbDDFlklO7LH+mb1jrY09jh6ey
 UGfDlNBYejMGhVfof1VA1t/YDu/cgnD2E57oQDnyAfhRzqYYykMJRkAjwOe78YX4hoUM
 ojxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K6wA7u9nlH2LdboqPtaGVfPJPki2AKRQH5484bIHWMg=;
 b=xUR94nXCy+/JEEjvqduOfAeoDHOUZ4/VNm6abMwZQp21zv2eUYGvaNidNFlCUzG039
 X66yz5nrmwhhXxGH44DBScAE9SWaSRvbARK0a+zq+PE5H+eGb3a02PHsrI4DQ+KON7bF
 TI9J10ulhoe5hHOhqOIMsp7I7KoCXGqH2bcsbNozSCsiir4F+2MBX5Lh1mIAl6K06CMM
 DRjh8Z+IEk9YcEdpJj21cchjRudaENd1OW51aUbjILC1ATLJjmMmK20z8Bs1tbqP5WZH
 kMfATf51Vu9Rk3Vl+Eo+8YzEymsi1POq1oCVWrO3qcvNzX24jppTWCMprAMWRaiExhZ4
 1lxQ==
X-Gm-Message-State: AOAM532mWCaQ6NqG5h95mUg4EzHBBYRrqwbQPyo3LTaR+yIOja0+4bpJ
 Cbr1yfB58Xnq5rDHuxcvTRk=
X-Google-Smtp-Source: ABdhPJycTqz9MfSxmTeQC3NNqRXwnBmg1ggt7GaNqU7Xvy/Afslm0yAQen3gRZ0c3GVtCC7vQ2id5Q==
X-Received: by 2002:a17:902:c2cf:b0:15f:1396:f54e with SMTP id
 c15-20020a170902c2cf00b0015f1396f54emr12870792pla.161.1652252294808; 
 Tue, 10 May 2022 23:58:14 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
 by smtp.googlemail.com with ESMTPSA id
 u18-20020a62ed12000000b0050dc76281a3sm766115pfh.125.2022.05.10.23.58.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 May 2022 23:58:14 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, Richard Zhao <richard.zhao@linaro.org>,
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl: Fix refcount leak in imx_sgtl5000_probe
Date: Wed, 11 May 2022 10:58:03 +0400
Message-Id: <20220511065803.3957-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linmq006@gmail.com
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

of_find_i2c_device_by_node() takes a reference,
In error paths, we should call put_device() to drop
the reference to aviod refount leak.

Fixes: 81e8e4926167 ("ASoC: fsl: add sgtl5000 clock support for imx-sgtl5000")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 sound/soc/fsl/imx-sgtl5000.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 8daced42d55e..580a0d963f0e 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -120,19 +120,19 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
 	if (!data) {
 		ret = -ENOMEM;
-		goto fail;
+		goto put_device;
 	}
 
 	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!comp) {
 		ret = -ENOMEM;
-		goto fail;
+		goto put_device;
 	}
 
 	data->codec_clk = clk_get(&codec_dev->dev, NULL);
 	if (IS_ERR(data->codec_clk)) {
 		ret = PTR_ERR(data->codec_clk);
-		goto fail;
+		goto put_device;
 	}
 
 	data->clk_frequency = clk_get_rate(data->codec_clk);
@@ -158,10 +158,10 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	data->card.dev = &pdev->dev;
 	ret = snd_soc_of_parse_card_name(&data->card, "model");
 	if (ret)
-		goto fail;
+		goto put_device;
 	ret = snd_soc_of_parse_audio_routing(&data->card, "audio-routing");
 	if (ret)
-		goto fail;
+		goto put_device;
 	data->card.num_links = 1;
 	data->card.owner = THIS_MODULE;
 	data->card.dai_link = &data->dai;
@@ -174,7 +174,7 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
 	if (ret) {
 		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed\n");
-		goto fail;
+		goto put_device;
 	}
 
 	of_node_put(ssi_np);
@@ -182,6 +182,8 @@ static int imx_sgtl5000_probe(struct platform_device *pdev)
 
 	return 0;
 
+put_device:
+	put_device(&codec_dev->dev);
 fail:
 	if (data && !IS_ERR(data->codec_clk))
 		clk_put(data->codec_clk);
-- 
2.25.1

