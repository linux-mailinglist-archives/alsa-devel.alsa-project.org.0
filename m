Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 653D821458B
	for <lists+alsa-devel@lfdr.de>; Sat,  4 Jul 2020 13:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0048C16AB;
	Sat,  4 Jul 2020 13:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0048C16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593862942;
	bh=hjZj1fNjiyztfV7q0ctTDdIJy29UhiZEk5sleYmJ0Bs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Augr0jfXhtET/NOQRTlzpUVcXcAv2fFU0j8uCHL7viQ9HmEWOaSAivyucrwngiufz
	 XFaw59dE6T/v6mMTg9RdVyxpAWrM52wwAAjmAP/LA4Go6DzcehPaMKESLzfWsAzSAf
	 OfziDt6EzxGvKKqfg5/YF7qYwZZMsFDYFOKAJFyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 744C4F80253;
	Sat,  4 Jul 2020 13:39:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3CD11F8022B; Sat,  4 Jul 2020 13:39:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D593BF8022B
 for <alsa-devel@alsa-project.org>; Sat,  4 Jul 2020 13:39:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D593BF8022B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="uLSRDPJx"
Received: by mail-wr1-x443.google.com with SMTP id f2so7458675wrp.7
 for <alsa-devel@alsa-project.org>; Sat, 04 Jul 2020 04:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wM8K//a3jkdseqCAX2c7vevYvjhQJoc1FelDz72tbrA=;
 b=uLSRDPJxTFQXZeoHyKDe5jl2kj0U+TGby3zgXWBnikqtT6iWF2HlxK66opO7RAlSaT
 PlGtaqTqdSRH5fxRrcNbVqNexyGLLvRP60i+KX6k1qhMSGGY9dsvNC3LEVf1INfUi/p5
 ye6D6sD2UHAIpmmf7aM/z87jqs1s877OgEWe+asl/0NtltxFcZb4Sbqp/TRmiSXAxSWb
 hMeWglCBdNY1hf+OTXKA/zPoeoMreUO9Cj7gPjk+gsAYGUQruNFh3K4ZhxTXVI2CmmeP
 adiQel92MTrYxYZqyyWgHE54DkcHH5zUbFyOnnofBty/t4XfBv/3DRt0FhdYIAMuHikg
 RxSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wM8K//a3jkdseqCAX2c7vevYvjhQJoc1FelDz72tbrA=;
 b=VuVXue1/M7Sicfk2JwYgPN9am1k5RjD7/cxivrGWDSLanXSillVe+VLlgeiomyTkVY
 FsF75NBCITfquI7OBJ0NTJj3JP4stQmdastrmKh4phHBNt9THvkIbBMu6lLjsYfu4tWq
 198yl7cFxkvBq0hunDAluXCmwESlYJKaZBqCqCw4kgq+1ArbWug92vK0KQQYZ4MI1nRd
 jSudFG50Qubl9IGwTmBRPJQws6dr+ghCRZ3zINBXPRRbmYSohpVarRG+pFYuE82GnEl6
 MdCj+hm3qixq+fGU/Fp/UPQwUbvvzx3quDc4MlBqE+uUESiAu7vQVlyBKFBG0bnUhaM0
 k/KA==
X-Gm-Message-State: AOAM5336E4GSK339S4sjPHmsOg09VnNhDveiRlZVsK/cQAHJOtqLPQCL
 6vKiEvDUKROjv12m7ZeJdPs=
X-Google-Smtp-Source: ABdhPJwuek4INGNtBBLyn1Xm7fiys3LCOLkRgtyoQjhb5oZz83S7qN2/HUPVrbJchM+9xFxxHAwRKA==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr39049381wrm.69.1593862748290; 
 Sat, 04 Jul 2020 04:39:08 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id j24sm18657373wrd.43.2020.07.04.04.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jul 2020 04:39:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 02/16] ASoC: sun4i-i2s: Adjust LRCLK width
Date: Sat,  4 Jul 2020 13:38:48 +0200
Message-Id: <20200704113902.336911-3-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200704113902.336911-1-peron.clem@gmail.com>
References: <20200704113902.336911-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Maxime Ripard <maxime@cerno.tech>, linux-arm-kernel@lists.infradead.org
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

Some codecs such as i2s based HDMI audio and the Pine64 DAC require
a different amount of bit clocks per frame than what is calculated
by the sample width. Use the values obtained by the tdm slot bindings
to adjust the LRCLK width accordingly.

Signed-off-by: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
Acked-by: Maxime Ripard <maxime@cerno.tech>
---
 sound/soc/sunxi/sun4i-i2s.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 9690389cb68e..8bae97efea30 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -470,6 +470,9 @@ static int sun8i_i2s_set_chan_cfg(const struct sun4i_i2s *i2s,
 		return -EINVAL;
 	}
 
+	if (i2s->slot_width)
+		lrck_period = i2s->slot_width;
+
 	regmap_update_bits(i2s->regmap, SUN4I_I2S_FMT0_REG,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD_MASK,
 			   SUN8I_I2S_FMT0_LRCK_PERIOD(lrck_period));
-- 
2.25.1

