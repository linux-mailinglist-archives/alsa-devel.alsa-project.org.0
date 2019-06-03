Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029A83373D
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:50:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63FA81654;
	Mon,  3 Jun 2019 19:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63FA81654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584206;
	bh=ighd3bYe0xYWhomlYV98bcHS8lxIxuZAEgZ94HjsNH0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vETgImWVfd14J3I0VRYTTtYYpxAA0Ie2jS+i98nLMIS6vikaDMPUlgPSovvD9Acy2
	 /3l48wT0WgqpiqSQau9PXrG0mwEYhuR7VZXPVrwH3iHsRyjw10KZUd7VZuajkrG2Mn
	 mWv2uE36BvmOv83edGSg8e4v5YU+uNJ5H6adRZmw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D8D8DF896EE;
	Mon,  3 Jun 2019 19:47:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24FF0F896DE; Mon,  3 Jun 2019 19:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49215F80CC4
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49215F80CC4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Ogrh9eTD"
Received: by mail-lf1-x144.google.com with SMTP id l26so14255202lfh.13
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GjT900taG1ijSa9lWUX/G6V7gIXt/Ttjrhy2y92+ySQ=;
 b=Ogrh9eTDgQAUONxtoCEsmlhtx9p4ZZt29kbWmmfagH5K1N51dWWiwQXBmLQshGR8J8
 JaNQR+8WKr/MTf8K1xrO0Syb9jjiMj35sivUp6zm1jV3T/QuMpE6Dw6L+RD342txYebk
 NJV8ZHfOTYFNFDubmYUOXAbSAhy5J+kUkggW04A+6mKqqgGSxB3BC5kzw4qweIKUiWXc
 RWh6GQHeO7X8UFlW3a9oj4ZkCyHYFG6u8OIgykswrOARCeyPCclz+zAeg7NjyYx51bDx
 //dpzaNZ8IwgIk00p3O4Qkzp3RAjBuhVSNlUHZlOzqvOgVE12g4mWxUF53/MCmxYTpvE
 sw7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GjT900taG1ijSa9lWUX/G6V7gIXt/Ttjrhy2y92+ySQ=;
 b=KUDJQcw+v15CZjmehHchTiBwm3EPH0Y3Cf2+lNFF/Vt2ReMqG7NJ11EouSGZpLk62m
 z1SxcvECgooSXNnOG9QDbrA+QDcRz40CTUipbYDxKIfHYfr8mkVMzr8emDgtEp7nnUr7
 nJGw7pCku11Me4UqZTVIXoTwLPSXZfe0GYdmpoLHgSMo0beKyNVAVQMqK7aGhS1UyzEV
 V+A7q3R66b69nVrNfaoaJMyvFyUZFfRpptxOeHcFNyQ8Pyq4hHJLSG7Kv5IUlmZw/MJs
 YeFDNj+9quvBO3MdF5/cRyjHJI0kEO/lh2V+oxHR4/2nkcv28zuk65xSpmjq6iKIPxOk
 Hy7g==
X-Gm-Message-State: APjAAAX9nqcqaADN6dKIeRr3JO+KELWwJwuYTnE+cAYqBmkGbQt/199b
 TGVWk2HsrxDbarSVDPConq4=
X-Google-Smtp-Source: APXvYqymibEEWq50h1UhkT3XaRXxM5Grj6g5eLWzSPNypWuItCujKf4Kk6Dvxeq4YPayp2H9tk8i+A==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr4407330lfq.136.1559584058502; 
 Mon, 03 Jun 2019 10:47:38 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:38 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:27 +0200
Message-Id: <20190603174735.21002-2-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 1/9] ASoC: sun4i-i2s: Fix sun8i tx channel
	offset mask
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

From: Marcus Cooper <codekipper@gmail.com>

Although not causing any noticeable issues, the mask for the
channel offset is covering too many bits.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index c53bfed8d4c2..90bd3963d8ae 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -106,7 +106,7 @@
 
 #define SUN8I_I2S_TX_CHAN_MAP_REG	0x44
 #define SUN8I_I2S_TX_CHAN_SEL_REG	0x34
-#define SUN8I_I2S_TX_CHAN_OFFSET_MASK		GENMASK(13, 11)
+#define SUN8I_I2S_TX_CHAN_OFFSET_MASK		GENMASK(13, 12)
 #define SUN8I_I2S_TX_CHAN_OFFSET(offset)	(offset << 12)
 #define SUN8I_I2S_TX_CHAN_EN_MASK		GENMASK(11, 4)
 #define SUN8I_I2S_TX_CHAN_EN(num_chan)		(((1 << num_chan) - 1) << 4)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
