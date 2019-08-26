Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C039D588
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Aug 2019 20:10:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ABB1816BA;
	Mon, 26 Aug 2019 20:09:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ABB1816BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566843016;
	bh=/JHtPOAnU0ugHyDr5bX6DVwxvMaDIfUkbeQ7BvJESUg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SUNJwF3acMnwqno9Be3RhFRgSQmz9+dhx1rCLe/1G88v45pb2ztffmDv/q5+2EXdQ
	 glht8zTUq1xxrel0f9bBagpdSKEPNLVumIMRKyTThy+B3UCligrxhTGXErYsecAWfW
	 hD44fnol4Fcf66u1wRzxZWjB0tkm5JNk9ujx6+gw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E060F802BC;
	Mon, 26 Aug 2019 20:07:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18D88F80390; Mon, 26 Aug 2019 20:07:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78D34F802BC
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 20:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78D34F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="X5ZI20/C"
Received: by mail-lj1-x242.google.com with SMTP id f9so15901411ljc.13
 for <alsa-devel@alsa-project.org>; Mon, 26 Aug 2019 11:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ukuuUBdDBhaCevdSYR2WXtuXiYA+/tk7SlxUyZaPi3U=;
 b=X5ZI20/CE7C81ZGz/W4Y/X/QmOCV5xtQN4RNxkIU7eUjrSA0n/z9clpTiZX8hVFZoH
 HNGhFUWhuJTyoDCrhkWLZsZroLsojNdY+wFLYWSJWG1uyRHfg0sORzhZbRAip95gEy/7
 lqUNDC53zrLWta46uPCP0BcIrIrFO60CvRXNNG0KmVAB30fJrH62qtQY/mhNh6g0E1Q/
 yIJJ0HvGKPGAo+cp+UVVk3Y/8NQQKxsGBUpQ0lkk26zIGilaPpgZN1C+hNOQsHFNxntS
 XW44tdSO2UMcU70Gq8LOsItG6SnVdwyMPE5UtwaTK8Dv7qCbF9801WXmw5EC9N+ONuod
 k0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ukuuUBdDBhaCevdSYR2WXtuXiYA+/tk7SlxUyZaPi3U=;
 b=f/seZA7Cm4Di84rwctC+ZY/ptJrHd8MICqCTG/9zC0/T637qBo3bkgDEOK3j9Yckp/
 eU1cmtldSx47pXGOgybZtLgumQeYHIKylOSd3fZKFTDimPOINxL+tr3SP7RTuEPsXxRL
 8ZwZSvtitB24XCWqshUSMqRcenlEOuxcB0/3dDdEesTVitNdAMcNKozm4ri2RWerMrpM
 e/gnjy7D8MES9LNrnKTdwc+jiGOYS2QoDlD+nOd3dX8s5IkItGSzPv9WM4iYiaBg+nIn
 AF47RQOgslKJFYAnmhIEaUjoJEC9Vmfm734eRfN5g7O8jPyQRDxULzH1yG62L53WYUT5
 VIHA==
X-Gm-Message-State: APjAAAUm3k2gSkwVfhM6WeWoAfQOvPIXBB1J5dE2kqOPxFmO7MjzVYCE
 dH2u4JyHMYUKd4Q9gc17fn4=
X-Google-Smtp-Source: APXvYqyYEpihsZF+JV1SShitkdzIKCoMZNNq7L/fwZ9FV8upcocQMT8ztPvcFOkyMOEOCgpILghRAA==
X-Received: by 2002:a2e:6393:: with SMTP id s19mr11066423lje.46.1566842859207; 
 Mon, 26 Aug 2019 11:07:39 -0700 (PDT)
Received: from localhost.localdomain (c213-102-74-69.bredband.comhem.se.
 [213.102.74.69])
 by smtp.gmail.com with ESMTPSA id u3sm2215564lfm.16.2019.08.26.11.07.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 11:07:38 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Mon, 26 Aug 2019 20:07:33 +0200
Message-Id: <20190826180734.15801-3-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826180734.15801-1-codekipper@gmail.com>
References: <20190826180734.15801-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 2/3] ASoC: sun4i-i2s: Add regmap field to
	sign extend sample
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

On the newer SoCs such as the H3 and A64 this is set by default
to transfer a 0 after each sample in each slot. However the A10
and A20 SoCs that this driver was developed on had a default
setting where it padded the audio gain with zeros.

This isn't a problem whilst we have only support for 16bit audio
but with larger sample resolution rates in the pipeline then SEXT
bits should be cleared so that they also pad at the LSB. Without
this the audio gets distorted.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 34575a8aa9f6..056a299c03fb 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -135,6 +135,7 @@ struct sun4i_i2s;
  * @field_clkdiv_mclk_en: regmap field to enable mclk output.
  * @field_fmt_wss: regmap field to set word select size.
  * @field_fmt_sr: regmap field to set sample resolution.
+ * @field_fmt_sext: regmap field to set the sign extension.
  */
 struct sun4i_i2s_quirks {
 	bool				has_reset;
@@ -145,6 +146,7 @@ struct sun4i_i2s_quirks {
 	struct reg_field		field_clkdiv_mclk_en;
 	struct reg_field		field_fmt_wss;
 	struct reg_field		field_fmt_sr;
+	struct reg_field		field_fmt_sext;
 
 	const struct sun4i_i2s_clk_div	*bclk_dividers;
 	unsigned int			num_bclk_dividers;
@@ -177,6 +179,7 @@ struct sun4i_i2s {
 	struct regmap_field	*field_clkdiv_mclk_en;
 	struct regmap_field	*field_fmt_wss;
 	struct regmap_field	*field_fmt_sr;
+	struct regmap_field	*field_fmt_sext;
 
 	const struct sun4i_i2s_quirks	*variant;
 };
@@ -354,6 +357,10 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 
 	regmap_field_write(i2s->field_clkdiv_mclk_en, 1);
 
+
+	/* Set sign extension to pad out LSB with 0 */
+	regmap_field_write(i2s->field_fmt_sext, 0);
+
 	return 0;
 }
 
@@ -1073,6 +1080,7 @@ static const struct sun4i_i2s_quirks sun4i_a10_i2s_quirks = {
 	.mclk_dividers		= sun4i_i2s_mclk_div,
 	.num_mclk_dividers	= ARRAY_SIZE(sun4i_i2s_mclk_div),
 	.get_bclk_parent_rate	= sun4i_i2s_get_bclk_parent_rate,
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
@@ -1091,6 +1099,7 @@ static const struct sun4i_i2s_quirks sun6i_a31_i2s_quirks = {
 	.mclk_dividers		= sun4i_i2s_mclk_div,
 	.num_mclk_dividers	= ARRAY_SIZE(sun4i_i2s_mclk_div),
 	.get_bclk_parent_rate	= sun4i_i2s_get_bclk_parent_rate,
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
@@ -1109,6 +1118,7 @@ static const struct sun4i_i2s_quirks sun8i_a83t_i2s_quirks = {
 	.mclk_dividers		= sun8i_i2s_clk_div,
 	.num_mclk_dividers	= ARRAY_SIZE(sun8i_i2s_clk_div),
 	.get_bclk_parent_rate	= sun8i_i2s_get_bclk_parent_rate,
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 4, 5),
 	.get_sr			= sun8i_i2s_get_sr_wss,
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
@@ -1127,6 +1137,7 @@ static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
 	.mclk_dividers		= sun4i_i2s_mclk_div,
 	.num_mclk_dividers	= ARRAY_SIZE(sun4i_i2s_mclk_div),
 	.get_bclk_parent_rate	= sun4i_i2s_get_bclk_parent_rate,
+	.field_fmt_sext		= REG_FIELD(SUN4I_I2S_FMT1_REG, 8, 8),
 	.get_sr			= sun4i_i2s_get_sr,
 	.get_wss		= sun4i_i2s_get_wss,
 	.set_chan_cfg		= sun4i_i2s_set_chan_cfg,
@@ -1154,6 +1165,12 @@ static int sun4i_i2s_init_regmap_fields(struct device *dev,
 	if (IS_ERR(i2s->field_fmt_sr))
 		return PTR_ERR(i2s->field_fmt_sr);
 
+	i2s->field_fmt_sext =
+			devm_regmap_field_alloc(dev, i2s->regmap,
+						i2s->variant->field_fmt_sext);
+	if (IS_ERR(i2s->field_fmt_sext))
+		return PTR_ERR(i2s->field_fmt_sext);
+
 	return 0;
 }
 
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
