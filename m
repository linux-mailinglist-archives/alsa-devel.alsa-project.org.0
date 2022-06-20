Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 776C8554F1B
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 17:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 187131E72;
	Wed, 22 Jun 2022 17:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 187131E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655911554;
	bh=npvPMjSZECv5ADKGwrqJNAtSjHJRKaSPFuM0+qR0qPU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qiTtAJ/QPZsF+ZdmulcLcTVIJ0PacmTS9QbYMp+0r3Ms433cC3FJmIggUwgViqJBQ
	 kQf9z4WDwkY4cyYzpB6gnD/S1Hgc1UD1svZimiiQBg9gZGuq09BZPuwPSlRhdxkEJ7
	 MNYxbD9le3h2snavL42+vVfmX92RF4Cdk/UgCTHQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CF51F8055B;
	Wed, 22 Jun 2022 17:23:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B193BF804EB; Mon, 20 Jun 2022 22:06:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_NONE, T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F5DBF804D8
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 22:06:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F5DBF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QNECaX95"
Received: by mail-wr1-x42a.google.com with SMTP id g27so9431561wrb.10
 for <alsa-devel@alsa-project.org>; Mon, 20 Jun 2022 13:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwq1xrraD4RZAx2kCX1gT4beeMnmuxO1mM9UwNM/j94=;
 b=QNECaX952+TTlSLlpOVs/6XitpxYvWRdZb+grPlyuTrwlpraID/DEO7pF7pRWsRnhg
 hjsEeZ5QkVN79568dtxIQ2IXGLbC5nR7sF+MgWAVMh5hkBWMw0P53fMMGZkmjvLcFNNa
 dhUutUl0wGwONV7Kom3uv28INHcBCYzOkQGuNSDENRNw1sxJZQ0/eMfiA/Qgxb87L4I8
 /Ptke0D3H96sRWpppziAeYZU/tnFck/UsfeMN/LXYqm2I78lehUvPTyO3hQ8x4y7ScUk
 uchno9kgBiWN8XY4/R7yf92muZ6rRsjh0pZSVJsyikq3CxlSVWLF/qU3eR8EP1K+XGbx
 gjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwq1xrraD4RZAx2kCX1gT4beeMnmuxO1mM9UwNM/j94=;
 b=C7FGvNIRNot2x+5v9zDcBpaT/DVbJdBjBu/aYFvFHKfkxodmSJSsrKVYDTkfoXNPiP
 pof4EKVg8ja9tHrAIQNmOol6W6HRKO5JNmsnvO3gq6H1HPlnYdxruFgrTwo1OHLbe/Qo
 YnSFCYDdRTtyQPXYWwFUW1zRhdmam9Xu3s9C0VOgeoY0cycYqwl+/TxSlvy4H3SC3Hh0
 QfEdWwI6GIePK/liYITvx4XMg3QmQhgb+XrR9Bri6OjpVlgE6useWbUQ333zgLEVI77E
 VDNgrfbemfLaFWk4vmQwehkYCvKN1VoAJEuwuRaLqE/QAXtJxabzpjq2UK6rhMdYD17H
 Ygmg==
X-Gm-Message-State: AJIora/qdkLbieHuLtoT7McgO0u2qFnPTKOicq9B2uUx83t1H/6L0Yn7
 LBJilNjjt6jcMh0yvfN2vbA=
X-Google-Smtp-Source: AGRyM1tP2UDTugiqATrashu5vRyEcZXwb3725FZvBb5Omwk2LFohTTxHAY3xss+vpJU1LZ+f8ik2aw==
X-Received: by 2002:adf:ef42:0:b0:21b:8e58:f24b with SMTP id
 c2-20020adfef42000000b0021b8e58f24bmr7537796wrp.257.1655755585865; 
 Mon, 20 Jun 2022 13:06:25 -0700 (PDT)
Received: from localhost (92.40.169.68.threembb.co.uk. [92.40.169.68])
 by smtp.gmail.com with ESMTPSA id
 u3-20020adfeb43000000b0021a34023ca3sm13936104wrn.62.2022.06.20.13.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 13:06:25 -0700 (PDT)
From: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
To: broonie@kernel.org
Subject: [PATCH 07/49] sound: soc: codecs: wcd9335: Convert irq chip to config
 regs
Date: Mon, 20 Jun 2022 21:06:02 +0100
Message-Id: <20220620200644.1961936-8-aidanmacdonald.0x0@gmail.com>
In-Reply-To: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
References: <20220620200644.1961936-1-aidanmacdonald.0x0@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 17:23:17 +0200
Cc: alsa-devel@alsa-project.org, bgoswami@codeaurora.org, rafael@kernel.org,
 linus.walleij@linaro.org, bjorn.andersson@linaro.org,
 srinivas.kandagatla@linaro.org, myungjoo.ham@samsung.com, lee.jones@linaro.org,
 samuel@sholland.org, maz@kernel.org, brgl@bgdev.pl, mani@kernel.org,
 krzysztof.kozlowski@linaro.org, jernej.skrabec@gmail.com,
 cw00.choi@samsung.com, wens@csie.org, agross@kernel.org, orsonzhai@gmail.com,
 linux-sunxi@lists.linux.dev, b.zolnierkie@samsung.com,
 linux-arm-msm@vger.kernel.org, tharvey@gateworks.com,
 linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, tiwai@suse.com,
 tglx@linutronix.de, cristian.ciocaltea@gmail.com,
 linux-arm-kernel@lists.infradead.org, rjones@gateworks.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 michael@walle.cc, zhang.lyra@gmail.com, baolin.wang7@gmail.com,
 mazziesaccount@gmail.com
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

Switch the driver to config registers. This will allow the old
type register code in regmap-irq to be removed.

Signed-off-by: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
---
 sound/soc/codecs/wcd9335.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index 617a36a89dfe..727d4436142a 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -5020,16 +5020,22 @@ static const struct regmap_irq wcd9335_codec_irqs[] = {
 	},
 };
 
+static const unsigned int wcd9335_config_regs[] = {
+	WCD9335_INTR_LEVEL0,
+};
+
 static const struct regmap_irq_chip wcd9335_regmap_irq1_chip = {
 	.name = "wcd9335_pin1_irq",
 	.status_base = WCD9335_INTR_PIN1_STATUS0,
 	.mask_base = WCD9335_INTR_PIN1_MASK0,
 	.ack_base = WCD9335_INTR_PIN1_CLEAR0,
-	.type_base = WCD9335_INTR_LEVEL0,
-	.num_type_reg = 4,
 	.num_regs = 4,
 	.irqs = wcd9335_codec_irqs,
 	.num_irqs = ARRAY_SIZE(wcd9335_codec_irqs),
+	.config_base = wcd9335_config_regs,
+	.num_config_bases = ARRAY_SIZE(wcd9335_config_regs),
+	.num_config_regs = 4,
+	.set_type_config = regmap_irq_set_type_config_simple,
 };
 
 static int wcd9335_parse_dt(struct wcd9335_codec *wcd)
-- 
2.35.1

