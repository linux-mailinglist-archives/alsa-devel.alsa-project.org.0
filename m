Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B4F28AA5B
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Oct 2020 22:26:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B67B6168A;
	Sun, 11 Oct 2020 22:25:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B67B6168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602447998;
	bh=B/4mO1NZ+vxnJArUurTBkOOdOOiBkbjKczb26OhvNto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=E7VgtGW87hi/5okDFDspXqR5XTFyqmSuVUBM6Mx/6HL3NyTuRgoJhyQ171XfRXKi5
	 iI7+yWk3+S6Qmh1aCRtBinYuTaNIRTzsWN9GZ65rA8HwbsUQigvpzGjScxRK1LuWme
	 eTbkGFSJdVcV+G/YHWfUt3cY/pz6ySaE7Dcn1hIM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C94CF80296;
	Sun, 11 Oct 2020 22:23:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B09F0F8028A; Sun, 11 Oct 2020 22:22:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4F9FF80279
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 22:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F9FF80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="huxRfQy1"
Received: by mail-qv1-xf41.google.com with SMTP id cv1so7509201qvb.2
 for <alsa-devel@alsa-project.org>; Sun, 11 Oct 2020 13:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qc7Gl1pDl54reD6hY+CiR+N1U9m+7coVho5OHQ+G7Yo=;
 b=huxRfQy1nVMvnp7b6tJdyCptvLU/nlZoB4Y54X8r9LvWMldLOYTlBfEwzRu6sYIxis
 vW7fgNZmOgEoK4/sZtcJjcOkDV+45rgPmtghqzSdv1YnF0SzkrwRAxpxRE0WszBpUIuJ
 pk3TMt0Il8Crua4I5YrahTiUZlcXOzQE2iZBaEPsfR42vu3O+4qIFXTx9TkQsg8w2PHY
 C32A/UXRIsmtwXtMxCFDkp2Vaj5MymUL0TRyK/G2dCCyMaPdurQM+C+9Ehi2DzPftZuu
 D7Mzl41zNAKomwG+5V6QQsJmODTNlZE3snaP7iYDVTQSUhv/nL0vWFdIdNwt98SmpIBX
 y4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qc7Gl1pDl54reD6hY+CiR+N1U9m+7coVho5OHQ+G7Yo=;
 b=sf13BbQzSfw8qqRyHjvm66rmhRb0GXWxhiFsS3l+GKb5o48tDHMTJriiDt4QqltnK9
 8oI0O2Gc8P3CWidmlkOMw9boDzP2Jgxe3csdCaelFkwX9iecP9y1FXe28wDTCDo2GPFX
 PtFdCSXFRVCx8KsafNfnIci5M4aZvMqL3g8pSqitegG4ziqmcVSSQTmK9HWSPHVbdweg
 +DN4ebLvy0W77WyOVpcuIeXF5lzNN9WTsheqWRR/A+jPkDaFhZsAkydeU7FFI14ua47m
 nxUutUj9tPaHSyl35qzUm+zaz3oU0/JlGotBZ7QprW5V2appZp9t9AOnwieOJdlkg0+b
 jBEg==
X-Gm-Message-State: AOAM533aimLiuLSUG2YYFJBIeI04M0Vrd7t3QEiN0E2pwV+NTzbeoUy7
 3mtZkq4UWqu8SvaY0l9RMSA=
X-Google-Smtp-Source: ABdhPJwt/1LkDKNRn2qBy0MTm6ZGT2I7f49RSR1PoNRrozMbVyyczsSoLMl4C5nqm3BaMjH3bC2K/Q==
X-Received: by 2002:a0c:cc0d:: with SMTP id r13mr16175026qvk.6.1602447769387; 
 Sun, 11 Oct 2020 13:22:49 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id c72sm2987778qkg.56.2020.10.11.13.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 13:22:48 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v7 06/14] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Sun, 11 Oct 2020 22:22:16 +0200
Message-Id: <20201011202224.47544-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201011202224.47544-1-peron.clem@gmail.com>
References: <20201011202224.47544-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi@googlegroups.com,
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

The FIFO TX reg is volatile and sun8i i2s register
mapping is different from sun4i.

Even if in this case it's doesn't create an issue,
Avoid setting some regs that are undefined in sun8i.

Acked-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Chen-Yu Tsai <wens@csie.org>
Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 sound/soc/sunxi/sun4i-i2s.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d5eba58ff207..3fc0bd818539 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1154,12 +1154,19 @@ static bool sun8i_i2s_rd_reg(struct device *dev, unsigned int reg)
 
 static bool sun8i_i2s_volatile_reg(struct device *dev, unsigned int reg)
 {
-	if (reg == SUN8I_I2S_INT_STA_REG)
+	switch (reg) {
+	case SUN4I_I2S_FIFO_CTRL_REG:
+	case SUN4I_I2S_FIFO_RX_REG:
+	case SUN4I_I2S_FIFO_STA_REG:
+	case SUN4I_I2S_RX_CNT_REG:
+	case SUN4I_I2S_TX_CNT_REG:
+	case SUN8I_I2S_FIFO_TX_REG:
+	case SUN8I_I2S_INT_STA_REG:
 		return true;
-	if (reg == SUN8I_I2S_FIFO_TX_REG)
-		return false;
 
-	return sun4i_i2s_volatile_reg(dev, reg);
+	default:
+		return false;
+	}
 }
 
 static const struct reg_default sun4i_i2s_reg_defaults[] = {
-- 
2.25.1

