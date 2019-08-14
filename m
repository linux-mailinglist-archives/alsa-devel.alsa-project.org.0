Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9DA8CBBC
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Aug 2019 08:13:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C20611666;
	Wed, 14 Aug 2019 08:13:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C20611666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565763236;
	bh=nWm86smvzU9yMVAwiSc73ennEa/+OJXg07pPzO7Kvbk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p13jxc+JMPptGZwGvou/JtqMva5CBD85coCPw1knyaigE+kPGulSzHsFb7H/CWIQo
	 3fbumtAQXMXZD6iebb7mp9qPxqfV2Q4ih5zc/es1FALD7r18ggOGIIn5KMl4rIsOML
	 wF03+lIZ55KWfUACq+I83K6gr4X1KGZ+bL+z88iE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 986B2F80612;
	Wed, 14 Aug 2019 08:09:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D79DDF8060D; Wed, 14 Aug 2019 08:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3ECFBF8060E
 for <alsa-devel@alsa-project.org>; Wed, 14 Aug 2019 08:09:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3ECFBF8060E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FavTetyh"
Received: by mail-lf1-x143.google.com with SMTP id n19so10065790lfe.13
 for <alsa-devel@alsa-project.org>; Tue, 13 Aug 2019 23:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nIdAGNiLkiiK2Gw0kPcR7I6xu5ZStD9Kxb2ECFc6UjY=;
 b=FavTetyhFsglyGujp7hKFmN5Wjrg8vatZ/OKeJnhnFCTNyNjm6FSQW5m7z4ex3otcK
 XNWNbkpobxRd8dgjYf9tHhgx9aHtDe4FhyV7utEEWuo615XqeQvu3KtvBsKqTrXAaLJ1
 JuZoHI12nV9/EFhVOIcOLI4Efnu30Co0IfQpSZC5NSOOy30Y7vapcGtPogK7LmGHzLKY
 Or1T9GCBBheRfEcR8c9bnEU8DqDNZqWg9zraE2OVhBNP22FEH2TyDi1RHPMZVNkfSQO9
 YuIyZtMpunFNx0/5XICae1ynEKsev56Mf9hGlsmEGDKtPGMhp8nU3Gz9uqEU2jIWK79A
 WWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nIdAGNiLkiiK2Gw0kPcR7I6xu5ZStD9Kxb2ECFc6UjY=;
 b=o0Hz2joGznpY2E9Yj/Rkzx7kNiY+pV6IjvY1wwkCD++8YSpznsa9/6Zo7mSC6TNOxA
 pOi5qU0o9Yiq4zeFkXAngwk7jChRcnx1x509Vtj0jMUZ/TCV/4vNshK0yLrlghpCspyi
 rPIi6B5Txyl1iZNd+RBl3xBiDsVMqdeN5kCDm3nCX0KEBgZPQncKUF045O2CIjFIUr65
 Z9HjGiBAaf7znTLAj23HV9oGLapbIYPdpaZB8AXWqka/HL/HXzt8peF9dJJIw2//ikVA
 RvZHmZU4q+ZLqgVH96fYln9ENKYmLmqKIXoixGBbJKYLKeymJS5q8M9BA/F214ntzvL1
 0GMQ==
X-Gm-Message-State: APjAAAVl67s4WM5p4srqWg9H6sPMtWjCT7oVFtGdRwAw+06xsOq+G2q3
 K5iza3Hj2+gpGPypFbl7XCY=
X-Google-Smtp-Source: APXvYqzPDghVmAfn8CnRzvuqNzhY1HphT9aHe0MsxJAGXonvqC7XcehgcpyOD4PCKzazCISMYoQs9w==
X-Received: by 2002:a19:c511:: with SMTP id w17mr13345752lfe.31.1565762942016; 
 Tue, 13 Aug 2019 23:09:02 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id s10sm3124235ljm.35.2019.08.13.23.08.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 13 Aug 2019 23:09:01 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Wed, 14 Aug 2019 08:08:41 +0200
Message-Id: <20190814060854.26345-3-codekipper@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814060854.26345-1-codekipper@gmail.com>
References: <20190814060854.26345-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v5 02/15] ASoC: sun4i-i2s: Add set_tdm_slot
	functionality
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

Codecs without a control connection such as i2s based HDMI audio and
the Pine64 DAC require a different amount of bit clocks per frame than
what is calculated by the sample width. Use the tdm slot bindings to
provide this mechanism.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 8201334a059b..7c37b6291df0 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -195,6 +195,9 @@ struct sun4i_i2s {
 	struct regmap_field	*field_rxchansel;
 
 	const struct sun4i_i2s_quirks	*variant;
+
+	unsigned int	tdm_slots;
+	unsigned int	slot_width;
 };
 
 struct sun4i_i2s_clk_div {
@@ -346,7 +349,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	if (i2s->variant->has_fmt_set_lrck_period)
 		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
-				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
+				   SUN8I_I2S_FMT0_LRCK_PERIOD(word_size));
 
 	/* Set sign extension to pad out LSB with 0 */
 	regmap_field_write(i2s->field_fmt_sext, 0);
@@ -450,7 +453,8 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_field_write(i2s->field_fmt_sr, sr);
 
 	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
-				      params_width(params));
+				      i2s->tdm_slots ?
+				      i2s->slot_width : params_width(params));
 }
 
 static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -693,10 +697,25 @@ static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static int sun4i_i2s_set_dai_tdm_slot(struct snd_soc_dai *dai,
+				      unsigned int tx_mask,
+				      unsigned int rx_mask,
+				      int slots, int width)
+{
+	struct sun4i_i2s *i2s = snd_soc_dai_get_drvdata(dai);
+
+	i2s->tdm_slots = slots;
+
+	i2s->slot_width = width;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops sun4i_i2s_dai_ops = {
 	.hw_params	= sun4i_i2s_hw_params,
 	.set_fmt	= sun4i_i2s_set_fmt,
 	.set_sysclk	= sun4i_i2s_set_sysclk,
+	.set_tdm_slot	= sun4i_i2s_set_dai_tdm_slot,
 	.trigger	= sun4i_i2s_trigger,
 };
 
-- 
2.22.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
