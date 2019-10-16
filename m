Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAA1D8909
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 09:10:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D340B1675;
	Wed, 16 Oct 2019 09:09:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D340B1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571209825;
	bh=8aS8J536AP+EE7IIvkJPxX86ymhwpfVmHdOl75ALqc8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Rsz3c9UYiDPyN0t1tRtaLGb6vsAKttNYU5h271P/bY7s7LdQfuIoWSggvwcoeG01S
	 akKPK4IlohaNu56WLRW19vzsnOoyTuPsNo2QxSzdENXo35pt80AktcvppEC2yAAUGk
	 0++5rB3ssdfKdLB1q0IVXvZovU472igYb9ldLEQY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 864A1F805FA;
	Wed, 16 Oct 2019 09:07:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83E70F80362; Wed, 16 Oct 2019 09:07:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1310F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 09:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1310F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XNEosleP"
Received: by mail-lj1-x241.google.com with SMTP id j19so22839062lja.1
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 00:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kDtdILcfLHoVejEtGgLfvnr1m900cxUvF44JNpWqBWQ=;
 b=XNEoslePrQiCPCXuOnDyy5PnKlhPhOjFeGvb9qfXg63GuYrL1wakT6kL3MgLI7npCd
 SICpSGkSVRWkjYZ64LBiiMnOtjDXe+5RnsP2Ko1deb/JUik1ialZMRvRvWzFV0ytNCNn
 C1mnQPSR+Zk1niRVJzjo5QCTHUIT+/KwUfAE41lqF0eF/L5vL99jfL/VXmKXS2fSeDEQ
 KjNG0lEiyju1a5qnai9EJJ0oHfwp54AG86k8qK3xtFDreiTsBoGoaZcZxMUeaHW6yPD9
 ynztCpZHXYXllLnfhQsUjlgGCuKzFq9CZmqkAderDUGu4nxmuDpPgqMlD1JuUDMYk1sk
 KJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kDtdILcfLHoVejEtGgLfvnr1m900cxUvF44JNpWqBWQ=;
 b=qohJXASL0vQgp7WsH7bTiduOQVmL1l5PV1QtPtCSMPf3zy5VQQ+bPnjMbJO7XipgRj
 MUW2/fB0GdUIvOX8213aWR76uk8iHoc4bxwmAaUtDuaWi9FJnvCFZ5xeC9D9UoKEXVCa
 JrMFJ/NBto+HH2eFpFTsSVBrriSHYcAKuADR4qdxs0P2amOcfev0FPk7YmnJqyeso++t
 IQHdrjdzsV9NmxaXdLYhnLPTD95YqDvWl5lKd6rbrufHiVZV8nNQJf5MfPzayTNqamzY
 q6mARvyc0nYidbYxHEzs8HVbo/tFcQnKwXHcBVKhF5h1hGuyFQ9+AkQVB5Pj3jK9K6At
 TaFA==
X-Gm-Message-State: APjAAAXnFs8JRpp2xmJcA8/2I9/cqOFgTzf7WLCvGiS2WysIlPkjTxJK
 /oUn0HH4BFrNCX0stcftVWg=
X-Google-Smtp-Source: APXvYqzPrA41KnDu7zXYKhTKIDFPIusxpkGfQ/f36MqaVUccNYdTjpt+jBN/sHBQmPMYw+AofQ+MZg==
X-Received: by 2002:a2e:9117:: with SMTP id m23mr24989061ljg.82.1571209663820; 
 Wed, 16 Oct 2019 00:07:43 -0700 (PDT)
Received: from localhost.localdomain (c213-102-65-51.bredband.comhem.se.
 [213.102.65.51])
 by smtp.gmail.com with ESMTPSA id j191sm1361493lfj.49.2019.10.16.00.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2019 00:07:43 -0700 (PDT)
From: codekipper@gmail.com
To: mripard@kernel.org,
	wens@csie.org,
	linux-sunxi@googlegroups.com
Date: Wed, 16 Oct 2019 09:07:34 +0200
Message-Id: <20191016070740.121435-2-codekipper@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191016070740.121435-1-codekipper@gmail.com>
References: <20191016070740.121435-1-codekipper@gmail.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org, be17068@iperbole.bo.it,
 broonie@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH v6 1/7] ASoC: sun4i-i2s: Move channel select
	offset
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

On the newer SoCs the offset is used to set the mode of the
connection. As it is to be used elsewhere then it makes sense
to move it to the main structure.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d0a8d5810c0a..f1a80973c450 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -156,7 +156,7 @@ struct sun4i_i2s_quirks {
 	s8	(*get_wss)(const struct sun4i_i2s *, int);
 	int	(*set_chan_cfg)(const struct sun4i_i2s *,
 				const struct snd_pcm_hw_params *);
-	int	(*set_fmt)(const struct sun4i_i2s *, unsigned int);
+	int	(*set_fmt)(struct sun4i_i2s *, unsigned int);
 };
 
 struct sun4i_i2s {
@@ -169,6 +169,7 @@ struct sun4i_i2s {
 	unsigned int	mclk_freq;
 	unsigned int	slots;
 	unsigned int	slot_width;
+	unsigned int	offset;
 
 	struct snd_dmaengine_dai_dma_data	capture_dma_data;
 	struct snd_dmaengine_dai_dma_data	playback_dma_data;
@@ -516,7 +517,7 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 				      slots, slot_width);
 }
 
-static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
+static int sun4i_i2s_set_soc_fmt(struct sun4i_i2s *i2s,
 				 unsigned int fmt)
 {
 	u32 val;
@@ -589,11 +590,10 @@ static int sun4i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	return 0;
 }
 
-static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
+static int sun8i_i2s_set_soc_fmt(struct sun4i_i2s *i2s,
 				 unsigned int fmt)
 {
 	u32 mode, val;
-	u8 offset;
 
 	/*
 	 * DAI clock polarity
@@ -632,27 +632,27 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_DSP_A:
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
-		offset = 1;
+		i2s->offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_DSP_B:
 		mode = SUN8I_I2S_CTRL_MODE_PCM;
-		offset = 0;
+		i2s->offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_I2S:
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
-		offset = 1;
+		i2s->offset = 1;
 		break;
 
 	case SND_SOC_DAIFMT_LEFT_J:
 		mode = SUN8I_I2S_CTRL_MODE_LEFT;
-		offset = 0;
+		i2s->offset = 0;
 		break;
 
 	case SND_SOC_DAIFMT_RIGHT_J:
 		mode = SUN8I_I2S_CTRL_MODE_RIGHT;
-		offset = 0;
+		i2s->offset = 0;
 		break;
 
 	default:
@@ -663,10 +663,10 @@ static int sun8i_i2s_set_soc_fmt(const struct sun4i_i2s *i2s,
 			   SUN8I_I2S_CTRL_MODE_MASK, mode);
 	regmap_update_bits(i2s->regmap, SUN8I_I2S_TX_CHAN_SEL_REG,
 			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
 	regmap_update_bits(i2s->regmap, SUN8I_I2S_RX_CHAN_SEL_REG,
 			   SUN8I_I2S_TX_CHAN_OFFSET_MASK,
-			   SUN8I_I2S_TX_CHAN_OFFSET(offset));
+			   SUN8I_I2S_TX_CHAN_OFFSET(i2s->offset));
 
 	/* DAI clock master masks */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-- 
2.23.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
