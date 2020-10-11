Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B821C28AA5E
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:27:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 510C7168E;
	Sun, 11 Oct 2020 22:27:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 510C7168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602448076;
	bh=GX/IVuA3uq8z+/cEd0kuKYVWPhSzAbhAmplNqT7o1nE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LwKcR2cMiVcypmB2RfYXCoDbzK7DCIk3zkbZZNr1XDgTvvFseCn6VgCJk5sRKSQPr
	 zj7oijlFmVLoDAUoFADf0s8Vf5DyPkHhwL2PCvAzT3a42DcGPAVXXCDuIc2VSOctzr
	 S5bQquuxQN5FuYx6KCW1nTnvCIVppWbJyYa5GrSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E01F9F802D6;
	Sun, 11 Oct 2020 22:23:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88970F80298; Sun, 11 Oct 2020 22:22:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C3AEFF8025A
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:22:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3AEFF8025A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="d59DH9WL"
Received: by mail-qk1-x741.google.com with SMTP id k9so1797479qki.6
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8+oP++IDX+TWr9W8oZTbwkkM6rISpxgkl78X/PIuT+s=;
 b=d59DH9WLcL+dOgLluVb9q429BtG4LALyLEUJQb+dDs/SB3Brrb/Yur83xfyq4UAiTe
 O5TGgXf4cySYKPIO3eo6FvB/jhuVmKM4JKUsTMIbyyTof7lJaCBNJTtqeENQ6la5WvBB
 67WYBAizr3w45CndFLFp9EOuLnOQaFwCcl5DVcwAX4pUA6Ur4Dbc0xSN9WKzLn2DICvQ
 OcYtMs2vp5Dodz5uhIrqbCQQp7I8vPmq8XQkq7e57ZExLaYif4Kaxw6ePhrPsyfPziTy
 +cMggT3vrXmy7C1AhgdWZ1B1GO+PCbxSybWHrLmb9GVUx67hhsmKh87bo7nXpok/qJgv
 NOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8+oP++IDX+TWr9W8oZTbwkkM6rISpxgkl78X/PIuT+s=;
 b=X347LDWbyAxxGNQ3zEa2BMRSQ6Wx57wAbW2pWVu+vMgQkQKizhGvfVG26n7eE7roCE
 Np6WuIXoNNTVYp5ItohU4NSatRuQdaUQv4ITXFqUG37w333lrqBW9UxCoScbtkQbH274
 Q+3SS8mxiDYrWy1Q54rkJq009fOcCD4YTugHLw8SHgcbYmYUbMYPoK6rWfxZDic3B6UD
 PIZ0OWTJNM+TfsjpWGEKkXfc6yWJmN/TO0jU8CC52b+eUdkWcmkAG0haA3h64CgSt6wp
 FwOz2Z0jj1hmTV/w7mTlHzKAHtl9yWBOzOTDmGiIZ1ZvRUwSTjmZOmzA17b+4rnlMbnA
 AJ5Q==
X-Gm-Message-State: AOAM531e7mh9/PeMOriyUlp1tIcAjgYJFo84PXM6qG4TJ7fX0XCOnw9N
 I7wJfeXGl/s0ALTd9IVUKU0=
X-Google-Smtp-Source: ABdhPJwpkzOPa3fw7jDMn1v4AWa/1gBNcuwFcYb4ee8gA8XqsjEiJRn4mAIBI04Z9pSC2wW7MVi5lg==
X-Received: by 2002:a37:a9c9:: with SMTP id s192mr7124715qke.128.1602447772374; 
 Sun, 11 Oct 2020 13:22:52 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 07/14] ASoC: sun4i-i2s: Fix setting of FIFO modes
Date: Sun, 11 Oct 2020 22:22:17 +0200
Message-Id: <20201011202224.47544-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
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
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3fc0bd818539..e7b9dcbf82db 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -588,6 +588,13 @@ static int sun4i_i2s_hw_params(struct snd_pcm_substream *substream,
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
@@ -916,13 +923,6 @@ static int sun4i_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
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

