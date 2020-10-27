Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F40829C754
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Oct 2020 19:37:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB06416DC;
	Tue, 27 Oct 2020 19:37:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB06416DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603823871;
	bh=OUsa3DZIjeYl6XSY+07ZNB/OkUOhjM+21xgNBl6qCpY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sK9cE5MBj8j727RuaxvPceNa4AV1GGFXFaP7RXV369fDNyqio3+Z1e09Pf7QRjYp9
	 E1NaKIZLJz2yttI+Ge4+6l3TzXkNpDT6cJTtRMQhAWU8b3llTX02Xmn9FjPsyvRBu5
	 SS1CFGv4zR9qmdKukHoo4ptmwobjrpWTT+JjfSNI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6AC1F8051D;
	Tue, 27 Oct 2020 19:32:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0DD3F804BC; Tue, 27 Oct 2020 19:32:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A409F804BB
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 19:32:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A409F804BB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Qq7QZoCm"
Received: by mail-wr1-x442.google.com with SMTP id x7so3048660wrl.3
 for <alsa-devel@alsa-project.org>; Tue, 27 Oct 2020 11:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/c21paZsZJba8DF8tLoBjklcU/pJ5XW5IJeLsS+Kt2k=;
 b=Qq7QZoCmy3TG4ygb3zE5N9P9WwwrdWRvnwyFqTugFRCwtD8y0B79yV80bbWFTHlS3B
 laFP7MJZXthqxDAyFScKHBXrLD0CNzRem3b+BB8IlbWO0eZHx1RvmnmHdeBM4GsI3r7T
 7/5/LfySsMy0D43qEsW1hGFYZZc5E2bTDlLZbOBahwdNUPEriU3TZSCy3HU050xKmv8o
 Ln/dkQiVXEKmpUIOjB3BdZ5DJRN5FFan/AbEdGRzd8NsC1zX2L7l2z/3ZiSBwNMr4oNO
 T1Rj7RTK/ja2Rk+ajzINEpm0aI4tJRGELYqL2YY1PXuzfmsZc05K9yaIgaIG8rEQsFzz
 8tCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/c21paZsZJba8DF8tLoBjklcU/pJ5XW5IJeLsS+Kt2k=;
 b=YCLKHXX/dIGX3uw7rH1LaYV1KnX16vfIT7P6r+wSQViYNGtFXg4vMVLxgNXcAfneJr
 ZU/LgscCUrRGVUsXGsfYye1wIQCDPizvMWulWX+D0xx5cHEJk6riixvRcK/5DYkKiS0P
 62zjamC1IZCLa3THNXwp4usyd4B9li/g+oLINtE5j/GyI8Isb0jS+bkwcFdWw+deV1CZ
 jPb0+mfVGnNTsGF042HjVYPecoBFNMMST3OdfVQUZSteHWXwAvPCq/pUy2vlguTECbNR
 ZeW4mWDRbioA8QuPSR9/g+jMZO+YF6zYO/+XHzxBfbBpV9Vk/V0CXfvk02Gj/1kscaUO
 Xtcg==
X-Gm-Message-State: AOAM5303IRf1OYfIyANIxu6uRVAb00+/5XI+TwxUdxrIn46sbqtFEZK8
 EEHzGYxNnmUd0e5oQ6zEG+g=
X-Google-Smtp-Source: ABdhPJybTKURTTgkaIrteg61pZdd9OQfEw3Zti19H4IKrVduAttOy9laYU4qyz5dK9TRTLYbl8fiGQ==
X-Received: by 2002:adf:fe4b:: with SMTP id m11mr4110664wrs.98.1603823520009; 
 Tue, 27 Oct 2020 11:32:00 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id m9sm2864148wmc.31.2020.10.27.11.31.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Oct 2020 11:31:59 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v9 07/14] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Tue, 27 Oct 2020 19:31:42 +0100
Message-Id: <20201027183149.145165-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027183149.145165-1-peron.clem@gmail.com>
References: <20201027183149.145165-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Marcus Cooper <codekipper@gmail.com>, linux-sunxi@googlegroups.com,
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

From: Samuel Holland <samuel@sholland.org>

Because SUN4I_I2S_FIFO_CTRL_REG is volatile, writes done while the
regmap is cache-only are ignored. To work around this, move the
configuration to a callback that runs while the ASoC core has a
runtime PM reference to the device.

Signed-off-by: Samuel Holland <samuel@sholland.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Acked-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 83537538f8ee..6a3207245ae2 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -596,6 +596,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
 		return ret;
 	}
 
+	/* Set significant bits in our FIFOs */
+	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
+			   SUN4I_I2S_FIFO_CTRL_TX_MODE_MASK |
+			   SUN4I_I2S_FIFO_CTRL_RX_MODE_MASK,
+			   SUN4I_I2S_FIFO_CTRL_TX_MODE(1) |
+			   SUN4I_I2S_FIFO_CTRL_RX_MODE(1));
+
 	switch (params_physical_width(params)) {
 	case 16:
 		width = DMA_SLAVE_BUSWIDTH_2_BYTES;
@@ -924,13 +931,6 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 		return ret;
 	}
 
-	/* Set significant bits in our FIFOs */
-	regmap_update_bits(i2s->regmap, SUN4I_I2S_FIFO_CTRL_REG,
-			   SUN4I_I2S_FIFO_CTRL_TX_MODE_MASK |
-			   SUN4I_I2S_FIFO_CTRL_RX_MODE_MASK,
-			   SUN4I_I2S_FIFO_CTRL_TX_MODE(1) |
-			   SUN4I_I2S_FIFO_CTRL_RX_MODE(1));
-
 	i2s->format = fmt;
 
 	return 0;
-- 
2.25.1

