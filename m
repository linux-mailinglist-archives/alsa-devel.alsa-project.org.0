Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EFD8910
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B224B1654;
	Wed, 16 Oct 2019 09:10:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B224B1654
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571209874;
	bh=rHsEnY8oVUbpn+vFLQ2uUd8VsrgDemJC07fjMwcOPeA=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ex/DXIASP0KI6VDmwBJcoXBdEsZlHwy1cfGWVPSnbYWQ6fBZj7u/DdajjBreKCsC4
	 CdygaR3ObwOQkWXyt2+9Ps8arK8ljvpH41YBR9/1ZPcwX6s+SB/kSLu7JOpwemmtgm
	 9aUmnujdhBCXfVE0PikhSsQksJgdV+f0QF+kA4S4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C674AF805FE;
	Wed, 16 Oct 2019 09:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21288F80369; Wed, 16 Oct 2019 09:07:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 91288F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91288F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="mJD0Y8fa"
Received: by mail-lj1-x242.google.com with SMTP id y23so22776140lje.9
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oxDmBN8xjRHLwjCrJVEkKzUtkBzzYQgLKNmxBNYk6Lk=;
 b=mJD0Y8fakTfV82mrGHxCoBR8AE4xJv6jTGnyRdffnT3gp8w5fy8thy7oRDclKCdlla
 9AKy2bnASj/sE5hke5dqFXtvW7zM260aK7qraQkvSRmMbE3qohdSyOgif3XtAsjpgL9U
 qQogQrSc2/Lngg0Mq/odTr+eGg+gm5xaIJwcIRKs4K/+zPRr+L6Mv9SIDgbtkWJfw6AR
 e622onDA+2WGpBrRXKKoDwnghIA2tO5jUJPZYBMzz91m3lO7t4XCgGkm3+cKhzhtOkaA
 9h1miXyTVi6KvzyaWYfBk3bsBykMkC0+hU7bBluJU3FRdvfiT6TPpzTpOLf7+csf/s1d
 uHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oxDmBN8xjRHLwjCrJVEkKzUtkBzzYQgLKNmxBNYk6Lk=;
 b=OPXKps5oC8XHuB7nqhDlieRgYHwyzx/IxNor1AE2zcz54ZtqoSAegAedra6EwChtVn
 m7EbZkNeEJhsRQY7EdD8gbV0rZy7/aLaRc60QMB8lzPjoGTE81FaykgYxHNS8xzzy8CE
 NoCU2knyjqSdDdHuWW9kHUW18qh5YWjvf82J0pUYuXJpFImQ/zzR00J69zIVMq+66uQK
 2neIz8moh+LfMw0Ovyw0dFo258YPEUlCjYNu+G8eBy1qKQ4gNIYYQC3S7WSScpL5huz/
 fKYH0fkVILtvKItO+PIshhBK2Mlsl6ZlfXW1IOoyLlQYWThL/D56GPiBZT2K7VuE+3i7
 4hTw==
X-Gm-Message-State: APjAAAXrxDpqvhGdBh3+F/6//WFRw6K5unsm8mPyU/SFGg/EbthQYGkW
 OgR+XUGC1vcie8XveK/RxOKAgHwL
X-Google-Smtp-Source: APXvYqzFJq0X14+N0B33ZyE/bD1IVOERGHXz7HXUP3dLkoHMUCclXOJf/F7lmiWKgsFUVqC3O42ZPQ==
X-Received: by 2002:a2e:8204:: with SMTP id w4mr25118019ljg.212.1571209665267; 
 Wed, 16 Oct 2019 00:07:45 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:44 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:35 +0200
Message-Id: <20191016070740.121435-3-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016070740.121435-1-codekipper@gmail.com>
References: <20191016070740.121435-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 2/7] ASoC: sun4i-i2s: Add functions for RX
	and TX channel offsets
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

Newer SoCs like the H6 have the channel offset bits in a different
position to what is on the H3. As we will eventually add multi-
channel support then create function calls as opposed to regmap
fields to add support for different devices.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index f1a80973c450..875567881f30 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -157,6 +157,8 @@ struct sun4i_i2s_quirks {
 	int	(*set_chan_cfg)(const struct sun4i_i2s *,
 				const struct snd_pcm_hw_params *);
 	int	(*set_fmt)(struct sun4i_i2s *, unsigned int);
+	void	(*set_txchanoffset)(const struct sun4i_i2s *, int);
+	void	(*set_rxchanoffset)(const struct sun4i_i2s *);
 };
 
 struct sun4i_i2s {
@@ -467,6 +469,23 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 	return 0;
 }
 
+static void sun8i_i2s_set_txchanoffset(const struct sun4i_i2s *i2s, int output)
+{
+	if (output >= 0 && output < 4)
+		regmap_update_bits(i2s->regmap,
+				   SUN8I_I2S_TX_CHAN_SEL_REG + (output * 4),
+				   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+				   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
+}
+
+static void sun8i_i2s_set_rxchanoffset(const struct sun4i_i2s *i2s)
+{
+	regmap_update_bits(i2s->regmap,
+			   SUN8I_I2S_RX_CHAN_SEL_REG,
+			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
+			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
+}
+
 static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
@@ -661,12 +680,10 @@ static int sun8i_i2s_set_soc_fmt(struct sun4i_i2s *i2s,
 
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_CTRL_REG,
 			   SUN8I_I2S_CTRL_MODE_MASK, mode);
-	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
-			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
-	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
-			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
+	if (i2s->variant->set_txchanoffset)
+		i2s->variant->set_txchanoffset(i2s, 0);
+	if (i2s->variant->set_rxchanoffset)
+		i2s->variant->set_rxchanoffset(i2s);
 
 	/* DAI clock master masks */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
@@ -1136,6 +1153,8 @@ static const struct sun4i_i2s_quirks sun8i_h3_i2s_quirks = {
 	.get_wss		= sun8i_i2s_get_sr_wss,
 	.set_chan_cfg		= sun8i_i2s_set_chan_cfg,
 	.set_fmt		= sun8i_i2s_set_soc_fmt,
+	.set_txchanoffset	= sun8i_i2s_set_txchanoffset,
+	.set_rxchanoffset	= sun8i_i2s_set_rxchanoffset,
 };
 
 static const struct sun4i_i2s_quirks sun50i_a64_codec_i2s_quirks = {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
