Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C4272123
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 12:30:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB83916F1;
	Mon, 21 Sep 2020 12:30:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB83916F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600684255;
	bh=Ms8o1f0+5uqa9PFAdfwjqn7JZijvTTSa/9naGsS7rXg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uWPprR8FXN4EiHQc6MMHrnYqW/dwkEmbG2EIgOPEq/lzNI4dgrFit3LpX+2Ox30fr
	 7Eu66RACUd5CcniJtw72hjDOznFWtBzxit5LEa2aWqYfZ1+cvS1BV32LL4m2OUHkbS
	 tP+Bbw0nsNKVzG/YO5r3znJDkoom82PjX1xvQrzY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0D1BF802D2;
	Mon, 21 Sep 2020 12:28:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBA59F802E0; Mon, 21 Sep 2020 12:27:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A5F3F801EC
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 12:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A5F3F801EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="rCdT//U2"
Received: by mail-wm1-x341.google.com with SMTP id k18so12040645wmj.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 03:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yae7P0Q6083dv69O1TuhnVIjdtmUZr4BtGd67cLDrDw=;
 b=rCdT//U2AqcdazNuPTd6p8zqxjyzbxQNDjdeI/7jDvZXZShVr3xx8A8HEFgwuTFhOv
 0iCbR/OSGYNyI9OTN99qOQgZGubfICuVJQLaJyzRZNnrRmcPRb03qzID0/mtJeoJvgiP
 hOcqWZmL+pcEmIC2+ZsIG4BjfGAXwlaDMOqs0Wa5ZmjTMBpllKsNwZYV1RA+xdmnvdR6
 mjdM6nO/EJQd2lDGkyHExBqkfoxUynncV6IoWjvnzBVp30upJjgbXNXxnwiwOMVxCR76
 kZZEDwVP1v1bFADbwt9Sn2B1w+DWJ0e2ISmerCAfvbfB/sQJ74dXwv6Ui9C8nzhifF1P
 /UCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yae7P0Q6083dv69O1TuhnVIjdtmUZr4BtGd67cLDrDw=;
 b=Wmd6IyJBBGdzwYn/4XVhfcmmTPHCjA5IIahIq467IQZ9wk/aCGl7GSiQuqW0Vkzymd
 VUUFhkAB0ifNfvDm3IDEdBlAr99gocqzMwnRcQ/5LwL4b3rvzzYaecWJ0mgJdpQA0NPd
 1VLoJPV9iiYX2h/RB262/eNLew+qNm3ZthqgGHPUxqFmIISajqPkSf7EvPUAsm8Mhzc+
 g4wLB30pvWfnrkz2mB6cZFUPCCKVehjEY9sD8MXjg10vWiu5fBsCx6lFwS6cKTjxrRLT
 gpzPWYZD3x7KONd4qIqZUhEKnyR+JbsczFyQ8QybawVjijkvNvM4BNS1NUkl9vVSjRJC
 aaOQ==
X-Gm-Message-State: AOAM533Z6rtXB3ctG801NR/vLvV27JAGtWQHofyhun0YHbpkPMDaD/qK
 AS7f0belqQvfiOfVQouQm2FWciK3Y9qccEIq
X-Google-Smtp-Source: ABdhPJyC6302uJZIAaQejnS7NYDTwq61oiH+vrMlM+oB3NaVqrV/ajxYP8zA0atuIyOGJ1TuBrkjrQ==
X-Received: by 2002:a1c:e484:: with SMTP id b126mr28632817wmh.44.1600684065594; 
 Mon, 21 Sep 2020 03:27:45 -0700 (PDT)
Received: from localhost.localdomain
 (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
 by smtp.gmail.com with ESMTPSA id h2sm20713774wrp.69.2020.09.21.03.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 03:27:44 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v4 08/22] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Mon, 21 Sep 2020 12:27:17 +0200
Message-Id: <20200921102731.747736-9-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200921102731.747736-1-peron.clem@gmail.com>
References: <20200921102731.747736-1-peron.clem@gmail.com>
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

