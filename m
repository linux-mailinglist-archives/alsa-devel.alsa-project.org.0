Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC5833748
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Jun 2019 19:52:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D3F61673;
	Mon,  3 Jun 2019 19:51:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D3F61673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559584325;
	bh=qXuIuDlmTqmxnZY8pxPBna2eEuWfnWgM6KtPYQPhGyo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Va+iquCfeZ70920pFDPZMcZX2LbU+qmkqYpASZC/im0lZIPPbWJ+vIbtK+oz3E+mZ
	 EYBsgvKH04XJxpo1SvJBmjdQNw3iIfdiV6IQ9qVxWxBaANkmNWsV9Yoqr5fo/iAXbv
	 yTHXj7Iei6U6qOm5PlyfjXvCbr2g0Fi09GEFMFs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8DC61F8973F;
	Mon,  3 Jun 2019 19:47:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9E2CF8971F; Mon,  3 Jun 2019 19:47:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F23DF896DE
 for <alsa-devel@alsa-project.org>; Mon,  3 Jun 2019 19:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F23DF896DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fbvcavDw"
Received: by mail-lf1-x141.google.com with SMTP id p24so7821011lfo.6
 for <alsa-devel@alsa-project.org>; Mon, 03 Jun 2019 10:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JwGUR02EDQ13UCHXrb89qrEiTxqnpniiixZ9ii9/brU=;
 b=fbvcavDwHCyV2dKEGAeUTgZUKMNr01Q6ULE8FaQUiQ0JNUrjsYilRijeWC2uCcENRm
 ncJuCkU64ceD57b3rxwPalvIbpznVZ7OkkJ4B0ZPwyGyAA2gs/VJl5rtG1a0rPbDNLBj
 Gq4NihVFfIedw9rSwdHTg7pv/zx/Am+uDPlXbJE8VRA2RBdGBsca4ykyyGNXAbwI0pRQ
 Zi/4ypd/JLnHATw3n1vJk8wIgXn44kMJB5tRTL7xqUpY5vhW8KTrfn17Secy0wGMPITQ
 JFijHJq9c8jmkEMhQN8AgIdRwr/DksdSrrCmnStyH+lY/STE05oQ5yB+q0o4EOFL8IDm
 z4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JwGUR02EDQ13UCHXrb89qrEiTxqnpniiixZ9ii9/brU=;
 b=L9g7aXSmt0F+sgiKmMuxXiV1QRWWZf6Rilvb0p0nTmulcgg60i/x0aer//MGm6/2LW
 k/bUX04hFvMDOHHeYE+Co4XXlD72JrIhyT+4BkLTBvpTVuLIp0SOQSMFG2bg/Bwqbcq4
 GKGCJ/UFo6PbMV4dUwKcjvQ4CfF3AlE2jV1lwK7yPsjiQrzfMnmBVY1DbOkHYMt9vdvl
 6Q6eGbv3AXcq+FeDJE2JfVLc31jCZaeCJeN6eJ5Z8XpcNDjZ1Iwijfomk/rvNZz9+XVE
 lOtlTRkQHzNXMMBWkRnestt617se5va1r8lnyn1PxrrYmVpEH4Lh8++WzjnaFjf+R045
 mNFQ==
X-Gm-Message-State: APjAAAVh0Ab7iFbyH1LM3QSO334I5BLEPbSvokZyWgbqcVq/HYb/V7jA
 8Bt/uiJNQj3BLpyK7unWIJQ=
X-Google-Smtp-Source: APXvYqzhmC7VgtWYMxxp2kY23YtH8Ca0a0KQNKe2mlI1+BLdkn+mgGJp9VxVUIN/qnwBwT0R5uQVCQ==
X-Received: by 2002:a19:4f50:: with SMTP id a16mr13990334lfk.24.1559584061508; 
 Mon, 03 Jun 2019 10:47:41 -0700 (PDT)
Received: from localhost.localdomain ([188.150.253.81])
 by smtp.gmail.com with ESMTPSA id n7sm2803532lfi.68.2019.06.03.10.47.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Jun 2019 10:47:41 -0700 (PDT)
From: codekipper@gmail.com
To: maxime.ripard@free-electrons.com, wens@csie.org,
 linux-sunxi@googlegroups.com
Date: Mon,  3 Jun 2019 19:47:30 +0200
Message-Id: <20190603174735.21002-5-codekipper@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190603174735.21002-1-codekipper@gmail.com>
References: <20190603174735.21002-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v4 4/9] ASoC: sun4i-i2s: Reduce quirks for
	sun8i-h3
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

We have a number of flags used to identify the functionality
of the IP block found on the sun8i-h3 and later devices. As it
is only neccessary to identify this new block then replace
these flags with just one.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index e2961d8f6e8c..329883750d6f 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -119,10 +119,7 @@
  *
  * @has_reset: SoC needs reset deasserted.
  * @has_slave_select_bit: SoC has a bit to enable slave mode.
- * @has_fmt_set_lrck_period: SoC requires lrclk period to be set.
- * @has_chcfg: tx and rx slot number need to be set.
- * @has_chsel_tx_chen: SoC requires that the tx channels are enabled.
- * @has_chsel_offset: SoC uses offset for selecting dai operational mode.
+ * @is_h3_i2s_based: This block is similiar to what is found on the h3.
  * @reg_offset_txdata: offset of the tx fifo.
  * @sun4i_i2s_regmap: regmap config to use.
  * @mclk_offset: Value by which mclkdiv needs to be adjusted.
@@ -143,10 +140,7 @@
 struct sun4i_i2s_quirks {
 	bool				has_reset;
 	bool				has_slave_select_bit;
-	bool				has_fmt_set_lrck_period;
-	bool				has_chcfg;
-	bool				has_chsel_tx_chen;
-	bool				has_chsel_offset;
+	bool				is_h3_i2s_based;
 	unsigned int			reg_offset_txdata;	/* TX FIFO */
 	const struct regmap_config	*sun4i_i2s_regmap;
 	unsigned int			mclk_offset;
@@ -340,7 +334,7 @@ static int sun4i_i2s_set_clk_rate(struct snd_soc_dai *dai,
 	regmap_field_write(i2s->field_clkdiv_mclk_en, 1);
 
 	/* Set sync period */
-	if (i2s->variant->has_fmt_set_lrck_period)
+	if (i2s->variant->is_h3_i2s_based)
 		regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 				   SUN8I_I2S_FMT0_LRCK_PERIOD(32));
@@ -366,7 +360,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (i2s->variant->has_chcfg) {
+	if (i2s->variant->is_h3_i2s_based) {
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_CHAN_CFG_REG,
 				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM_MASK,
 				   SUN8I_I2S_CHAN_CFG_TX_SLOT_NUM(channels));
@@ -386,7 +380,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 	regmap_field_write(i2s->field_rxchansel,
 			   SUN4I_I2S_CHAN_SEL(params_channels(params)));
 
-	if (i2s->variant->has_chsel_tx_chen)
+	if (i2s->variant->is_h3_i2s_based)
 		regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
 				   SUN8I_I2S_TX_CHAN_EN_MASK,
 				   SUN8I_I2S_TX_CHAN_EN(channels));
@@ -449,7 +443,7 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	if (i2s->variant->has_chsel_offset) {
+	if (i2s->variant->is_h3_i2s_based) {
 		/*
 		 * offset being set indicates that we're connected to an i2s
 		 * device, however offset is only used on the sun8i block and
@@ -942,10 +936,7 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.mclk_offset		= 1,
 	.bclk_offset		= 2,
 	.fmt_offset		= 3,
-	.has_fmt_set_lrck_period = true,
-	.has_chcfg		= true,
-	.has_chsel_tx_chen	= true,
-	.has_chsel_offset	= true,
+	.is_h3_i2s_based     = true,
 	.field_clkdiv_mclk_en	= REG_FIELD(SUN4I_I2S_CLK_DIV_REG, 8, 8),
 	.field_fmt_wss		= REG_FIELD(SUN4I_I2S_FMT0_REG, 0, 2),
 	.field_fmt_sr		= REG_FIELD(SUN4I_I2S_FMT0_REG, 4, 6),
-- 
2.21.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
