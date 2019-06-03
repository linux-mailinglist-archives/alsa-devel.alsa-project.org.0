Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E0203374B
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:52:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7ECA166C;
	Mon,  3 Jun 2019 19:52:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7ECA166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584371;
	bh=2EjqcWh77PE17uAOpuDm8v9ZZjcImCzWFWjlCuKf0Ho=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=McOgL791inyPrKznmvdh+7/AY27g0Zn/zBbFt0a2Co6M5ECZcsqKgEO45bzaq61M0
	 Dbh/MyD+yvzvURARsVgoK3O557CA4/k4eUjACx+BkBhKnxEgbRDer23yJRuiaEkEfq
	 o62n7DbPXUwQj2DCf8i+Tp5+z3B7ptf812QHxQMA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A32F89745;
	Mon,  3 Jun 2019 19:47:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03067F89732; Mon,  3 Jun 2019 19:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5895EF896EE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5895EF896EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="VB7x2Efd"
Received: by mail-lj1-x244.google.com with SMTP id t28so5948453lje.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4qDu9sgTgZn0ixKovZtDdWsY36CDb/LQcyeDWdfScG8=;
 b=VB7x2EfdwROpsggAChY65dDFdT4snrzfhIsqFYJismvsXq0mLGWEpQPGANo6GZ86WD
 EhluPWYQPbQI/VFt/GMWVZTgyYHqszB0rLOaGRMVg4VjXS18RqJW09eEmeXOXKqQcm31
 omLCWC5Mh3F3Y0cq0FGe9FoX3NMaq3Ek60AZkyyAxJI/PVrudcafQaC1CcwU/zP0+PFm
 X162LXhajyp+9zrRGf/vq0gBV6Uj4Lp9j1a2J4KZYbtmiywJ1hIvGs18iNVcojXLfNjM
 2v0tYS+Bywfe4G3RLDioJokRUvLQbkLXF3/T6eNyQo3HxlZRXWV+avdLO2X9ZAJVAtYk
 ccqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4qDu9sgTgZn0ixKovZtDdWsY36CDb/LQcyeDWdfScG8=;
 b=kbZUwqKoVg4c77u2eAttM4a5vnuVNQVfQgs7j85rbtZSMYHUps7HHbURjK42If7N+X
 g25PFUTjysKLaCUyWBhzXTZnyfrN4541MlBx9c3FncP7yoeQfE1GIidh4yOX7+nyZg4X
 qRrysJzQg0qB+rPF3Y5J6DS0eWiyfgBDjY0GeegUEspHDJKuN+EC6M9hY8Ngjhr0UqYk
 EijPetAA0aUxlZ2Lte0Z54Ax2ifRsFkYxtj7IZhfMBYFOO6Hicm6C6Fw/InwQlY7dnjN
 Z0lOzE7gpX2wu6ydIsj5vfOQyABvMFKyYncZ4O7CEFuEtPrwCC7blxqQkN8eOVdYJtOm
 YdwQ==
X-Gm-Message-State: APjAAAXit4/AjktOy10SDEffjlnTbjCQRxI29VkTNKaKkkGyi/W90nzp
 XXvy3q4qNCBu2qPCdgudMPSIkcaM
X-Google-Smtp-Source: APXvYqz2F0PyDNUFtpD+QUjxtj9ZHAQF3f3fXBXumc+SWsHJ+iRNTuzAyPXaNJZS7kycwtwb/Rn35A==
X-Received: by 2002:a2e:91d7:: with SMTP id u23mr14465389ljg.150.1559584062466; 
 Mon, 03 Jun 2019 10:47:42 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:41 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:31 +0200
Message-Id: <20190603174735.21002-6-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 5/9] ASoC: sun4i-i2s: Add set_tdm_slot
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

Some codecs require a different amount of a bit clocks per frame than
what is calculated by the sample width. Use the tdm slot bindings to
provide this mechanism.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 329883750d6f..bca73b3c0d74 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -186,6 +186,9 @@ struct sun4i_i2s {
 	struct regmap_field	*field_rxchansel;
 
 	const struct sun4i_i2s_quirks	*variant;
+
+	unsigned int	tdm_slots;
+	unsigned int	slot_width;
 };
 
 struct sun4i_i2s_clk_div {
@@ -337,7 +340,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	if (i2s->variant->is_h3_i2s_based)
 		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
-				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
+				   SUN8I_I2S_FMT0_LRCK_PERIOD(word_size));
 
 	/* Set sign extension to pad out LSB with 0 */
 	regmap_field_write(i2s->field_fmt_sext, 0);
@@ -414,7 +417,8 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			   sr + i2s->variant->fmt_offset);
 
 	return sun4i_i2s_set_clk_rate(dai, params_rate(params),
-				      params_width(params));
+				      i2s->tdm_slots ?
+				      i2s->slot_width : params_width(params));
 }
 
 static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
@@ -657,11 +661,25 @@ static int sun4i_i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id,
 	return 0;
 }
 
+static int sun4i_i2s_set_dai_tdm_slot(struct snd_soc_dai *dai,
+	unsigned int tx_mask, unsigned int rx_mask,
+	int slots, int width)
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
 	.trigger	= sun4i_i2s_trigger,
+	.set_tdm_slot	= sun4i_i2s_set_dai_tdm_slot,
 };
 
 static int sun4i_i2s_dai_probe(struct snd_soc_dai *dai)
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
