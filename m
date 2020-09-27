Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E68A27A2C6
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Sep 2020 21:33:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970AF1ABC;
	Sun, 27 Sep 2020 21:32:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970AF1ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601235228;
	bh=Ms8o1f0+5uqa9PFAdfwjqn7JZijvTTSa/9naGsS7rXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rQEOB9a+ds83BzHLVkxFaT0X5/ihg3D9dMBcnUey1bVqJzquUsa6Lfr+ttye2V3HJ
	 soXUrWRQuQAENkjGHZwgwHTcuq3l+uUaI054boZHdMVxs452nba9v8cjckackj/km1
	 r9c+R5SeBjvr2KJxuxHqUKIDafeonRgTU7jIjrzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 89E2AF802F9;
	Sun, 27 Sep 2020 21:29:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9197CF8028F; Sun, 27 Sep 2020 21:29:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C46ADF800DF
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 21:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C46ADF800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OAwisc7a"
Received: by mail-wm1-x344.google.com with SMTP id v12so4627230wmh.3
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 12:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yae7P0Q6083dv69O1TuhnVIjdtmUZr4BtGd67cLDrDw=;
 b=OAwisc7aL0o8lIuJum3WM3sV9ofN665KoKM9NtgnT/G8zNo9Q9fgkMTuJqx1czeNc6
 t1lx9xyjNwWHn8T8dqJm7/uG89/1NEjyVHD9C0S3HrqsKi5L5zwlxwMACbPvSgp6iWTd
 Dy0/3YjquAtjsMFUxepIlSBFuo+pWSSG5Rh7fyL016BPO28nT1wjpu5yHxRPxz8md0tG
 YT1lo3v6o7OkhuMsva3JMXgsP8srntNNyEWGRcq0GK6BaA9Q1dA9XquEzK6VS0a/uoI9
 M6QVFWhXRstuXj6maGreKLFXuCV7/3Xm2rPglp5ST/wqN/EtFpRsYi/EqTbHR86zAeA2
 /p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yae7P0Q6083dv69O1TuhnVIjdtmUZr4BtGd67cLDrDw=;
 b=qdSP7jSlITC7HclZZ2iNE2UmxakgsUzPXkx4jC1hONJ57PBDhLLX9IlhDri4W6FW9G
 lUxpRLhHC/C7xIfYPUn4M8cf53FkiHT7Sri6VHZYdf4Uky+uKxf9bNBhwswVtr8WZ3e4
 5ZTZkSyScFZlEPHP6uDsbYydgEyWLfv7SxCPWrKYdpn+bo9xe3Vbi4WPY4AobwRYVQoW
 a3LgYXvw4uxhPwqi2v9eVPXME+NmeW8qoa0zH4OPEggTEmQAK+3L3Kxn7M34Wo43LAO4
 CIMRenfQ1sLpzD6mgtNclt1YgXENk6VEUMVSEIiZePMe0wKUhG2K5dkCElogyVasJxVd
 0gow==
X-Gm-Message-State: AOAM530Dsadm4IUoACajGa6+6ssgtZkxrHXC8gpBiSf/B8Ld40rcDcNs
 UAW0aXs2LlZfMWyHfycvXHI=
X-Google-Smtp-Source: ABdhPJzIyHV+/LUfm7D9nL9vW8OGycgbDVJ8xGPlS1ktTBXE2yfbAvN/oB5kTGyRlhsp44nQJOXkXw==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr8404691wmb.155.1601234967071; 
 Sun, 27 Sep 2020 12:29:27 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id n21sm6149609wmi.21.2020.09.27.12.29.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Sep 2020 12:29:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v5 08/20] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Sun, 27 Sep 2020 21:29:00 +0200
Message-Id: <20200927192912.46323-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200927192912.46323-1-peron.clem@gmail.com>
References: <20200927192912.46323-1-peron.clem@gmail.com>
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
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3f9110d70941..9cd6cd1cd284 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -586,6 +586,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -914,13 +921,6 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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

