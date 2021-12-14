Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9834D473A99
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Dec 2021 03:11:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2984F1935;
	Tue, 14 Dec 2021 03:10:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2984F1935
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639447907;
	bh=a8xDp6otNqt9nFtyhAqeRmB0Yotd5YEWWm6ttECh1bU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evCBWp9x1Epw/Mqb8tqelSqG1Kp2RXpy1+XtwS7IEj5CfhgDfvHW+R46krNDjnbk/
	 k0o+kRn6G9wVMO+QVPO1kI5sZsYg3SOsuPzOnpdtcx8F39JafrgX6dy+yFBu1bYyep
	 PXxlCXLgmiKOG4dUV1VDGlSbQ5oS6OEpYF5ojj+k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54860F8051F;
	Tue, 14 Dec 2021 03:09:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8DB5EF8051C; Tue, 14 Dec 2021 03:09:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67FB2F80246
 for <alsa-devel@alsa-project.org>; Tue, 14 Dec 2021 03:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67FB2F80246
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FHSyvx6Z"
Received: by mail-pf1-x42f.google.com with SMTP id x131so16538448pfc.12
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 18:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4GMiAc2zffga/KCdfd43WaAOAZcdnBOXgfVjwzKiIlU=;
 b=FHSyvx6ZDImKYKXesVCtyx8oHkJo4cg5FPUSOZEPoQL3NyPb84n2iCr8TkoCv/oIyg
 i14SpZzdT1t6PBoB7TYz2YvqdIcmIgSwpUYMi1w5wR6MgQPv/EnjBKTytgvAAAmYCbja
 KoSS4mQG3l0ct5V7S3phN4dIIS5ZZBjJOF29sC5xfMoPa1GiCLpcGL++FlaYBf7E+jeY
 UyrUfwMJdCXtZfxuyapzrCcwXQLP5CruEFC6RC9FBUHiXaWub2cHlBynnPtMmJKBy0un
 wFawsh48HAa1kZgppFyXIyybIzlkeVhQoXL1tsXeCcbhcb7a5GkQN2TAMwC2xy+z6mNS
 qdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4GMiAc2zffga/KCdfd43WaAOAZcdnBOXgfVjwzKiIlU=;
 b=YgfZbpdMWcibCZ+sGMdSjXVy77mRx5MsMBiadfaDsitZEZ1Psr8IBE5r0xw5wZ5AIW
 n3p7l51a27qT1WgC10By27Fhy4Y7MQWERqiMYMC0qV/2K4o9X7bchMI+S8ltP4L79Fdg
 QR9r56SOw+C6NYi0fBXYln+c8Eb7OvL3uEMmEnRvGvJGtatETYS3ex82XirtrTSw+Q6+
 a/LHDVj/itHXth6cd4IN5lPjG99CDvD7i11ytCQYz7+Ok+SN3dSIb5lA6CULVlq3Usk/
 pqNX2y9crjVGkk0/oGAPu0DHd2TabjxGqcr5cq2pO2hs2PO9vXSrSHs7YJqTgn5j7eQ9
 kjrw==
X-Gm-Message-State: AOAM5335yAzfiXs5A0h7VKvO4ocdl70SbfUkFhB3RUHdBfSI7xxL2a1L
 OijBy53o6rue9EA6k/IkbPM=
X-Google-Smtp-Source: ABdhPJxLRVfDjVWMrdoSVSydqMokrj6iA9YAGFPcbLi7YoAGXXcYIpdd0ooGJozmvgF7FLikK5k6xQ==
X-Received: by 2002:a65:6a0a:: with SMTP id m10mr1742700pgu.82.1639447769644; 
 Mon, 13 Dec 2021 18:09:29 -0800 (PST)
Received: from localhost.localdomain ([126.249.140.249])
 by smtp.gmail.com with ESMTPSA id b2sm14622296pfv.198.2021.12.13.18.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 18:09:29 -0800 (PST)
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 05/22] ASoC: codecs: pcm3168a: Use dev_err_probe() helper
Date: Tue, 14 Dec 2021 11:08:26 +0900
Message-Id: <20211214020843.2225831-6-kuninori.morimoto.gx@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
References: <20211214020843.2225831-1-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Use the dev_err_probe() helper, instead of open-coding the same
operation.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/pcm3168a.c | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index b6fd412441a1..fdf92c8b28e1 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -751,21 +751,14 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	pcm3168a->gpio_rst = devm_gpiod_get_optional(dev, "reset",
 						GPIOD_OUT_LOW |
 						GPIOD_FLAGS_BIT_NONEXCLUSIVE);
-	if (IS_ERR(pcm3168a->gpio_rst)) {
-		ret = PTR_ERR(pcm3168a->gpio_rst);
-		if (ret != -EPROBE_DEFER )
-			dev_err(dev, "failed to acquire RST gpio: %d\n", ret);
-
-		return ret;
-	}
+	if (IS_ERR(pcm3168a->gpio_rst))
+		return dev_err_probe(dev, PTR_ERR(pcm3168a->gpio_rst),
+				     "failed to acquire RST gpio\n");
 
 	pcm3168a->scki = devm_clk_get(dev, "scki");
-	if (IS_ERR(pcm3168a->scki)) {
-		ret = PTR_ERR(pcm3168a->scki);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to acquire clock 'scki': %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(pcm3168a->scki))
+		return dev_err_probe(dev, PTR_ERR(pcm3168a->scki),
+				     "failed to acquire clock 'scki'\n");
 
 	ret = clk_prepare_enable(pcm3168a->scki);
 	if (ret) {
@@ -781,8 +774,7 @@ int pcm3168a_probe(struct device *dev, struct regmap *regmap)
 	ret = devm_regulator_bulk_get(dev,
 			ARRAY_SIZE(pcm3168a->supplies), pcm3168a->supplies);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to request supplies: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to request supplies\n");
 		goto err_clk;
 	}
 
-- 
2.25.1

