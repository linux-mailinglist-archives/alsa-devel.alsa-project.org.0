Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B8F1AEF21
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224E81678;
	Sat, 18 Apr 2020 16:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224E81678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587221023;
	bh=tkaCy7t/xU/2G5Fcty2tzKw7tklVNnzVFuUersBbgsU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZCTmtlXh5//TsSUDp9MxAxIWlsPfCTataPaS7tAy0a28cElH9raaoG5O4fytxoCDd
	 eFBI2sr7UhCGLArVgBDDdz8IZxXFYCiG+wrFwNKNdqFwOPie/Vf3/eYHJ7Td+sDss0
	 MTn1TMZrSs/Gr1O6bJOWN9eOAjexfARzJXDhQb6c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AA0A2F802A1;
	Sat, 18 Apr 2020 16:39:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5AB4F8016F; Sat, 18 Apr 2020 16:39:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 312D1F8016F
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 312D1F8016F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="MbAoSbAc"
Received: by mail-wr1-x441.google.com with SMTP id f13so6327392wrm.13
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nS1Dh0dVCLU/Z6QcUpBzyWAuOru5+9aARHs3DkttnVE=;
 b=MbAoSbAc3D2+nJFIYEQeQQ/dHol3lD3ZutnkM2xwFwzOJdrCCCkOEVVcrcRQ62eV4g
 4mjR5SK5RiTtI+vgC8VsFBlN1uCx9tcGSTfJBpDFEwsNGpwCv8XxQLPHy5rX3pNcgXN8
 /H2nvjvJ7mQPsaRM/fi64I5nwdOKmQWqDDVP3L139dvKTbRby3Zz/s9icjPUnKDQdRLz
 5F0gIPt7vg86Vvcf6VhT9IwBi6un67axwSATzhZ5QtyicCU+yU9SLZgjNDyPUoYrwqY0
 FhB+3EleruV/2WjbvlpwwJBrPEdCmFQS2DEcQ4uVkLMe35d9SVZk+EZE1CHkdX68P+eP
 AHog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nS1Dh0dVCLU/Z6QcUpBzyWAuOru5+9aARHs3DkttnVE=;
 b=uhrIdGpHXInYiI7aeGzLAU9MWTUjtDXdSHdt1PvO1d1ioVLjZgYcnRPUfM2ZsZKF3W
 0rLAZHxCY2Tvj/o2LSn8FalbpA5DklDNgAYbnzXfmOcJMCq7AHj8lln++/UMAd4Fa8dn
 8noEkVbnUGg2EyxXc1IBptxYomT8R5tfeAUF+Ht/+09Wuufje58x6ai705+QhJtDd3Yi
 KYMgog4D4xglc4kGHl0LeCY959SOxPwvS3X69FDHyiYXM8MFuZoGoi/j1blf6cz/2dWz
 uSlZXLjAOxBHtyIX0zO3HozxA3U9RSIfP+soE16PQT0Md/hw340mtXrWcOAIPdaA3Gv3
 pgFw==
X-Gm-Message-State: AGi0PubXxMLAJW03XSKQpDuzvFpsswuMYa6dDQqDIFT8BDXbHhFGiNQZ
 snyTxvzx97SXN7CxCErCJII=
X-Google-Smtp-Source: APiQypKmRFkljkLfEDZwaNdb9gqp2zspKzPItWN+bdHyeoJEPtnPaZGdrFscUEGHdJTSLu1NGSDfQA==
X-Received: by 2002:a5d:498b:: with SMTP id r11mr9205532wrq.368.1587220771345; 
 Sat, 18 Apr 2020 07:39:31 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:30 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 4/7] ASoC: sun4i-i2s: Set sign extend sample
Date: Sat, 18 Apr 2020 16:39:20 +0200
Message-Id: <20200418143923.19608-5-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200418143923.19608-1-peron.clem@gmail.com>
References: <20200418143923.19608-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Marcus Cooper <codekipper@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-arm-kernel@lists.infradead.org
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

From: Marcus Cooper <codekipper@gmail.com>

On the newer SoCs such as the H3 and A64 this is set by default
to transfer a 0 after each sample in each slot. However the A10
and A20 SoCs that this driver was developed on had a default
setting where it padded the audio gain with zeros.

This isn't a problem whilst we have only support for 16bit audio
but with larger sample resolution rates in the pipeline then SEXT
bits should be cleared so that they also pad at the LSB. Without
this the audio gets distorted.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index a23c9f2a3f8c..e5f00be8cdcf 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -663,6 +663,12 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	}
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
 			   SUN4I_I2S_CTRL_MODE_MASK, val);
+
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN4I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN4I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
@@ -765,6 +771,11 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
@@ -867,6 +878,11 @@ static int sun50i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_BCLK_OUT | SUN8I_I2S_CTRL_LRCK_OUT,
 			   val);
 
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT1_REG,
+			   SUN8I_I2S_FMT1_REG_SEXT_MASK,
+			   SUN8I_I2S_FMT1_REG_SEXT(0));
+
 	return 0;
 }
 
-- 
2.20.1

