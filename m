Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B572824BD
	for <lists+alsa-devel@lfdr.de>; Sat,  3 Oct 2020 16:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D36D41AC9;
	Sat,  3 Oct 2020 16:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D36D41AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601735114;
	bh=kEYm2IuEqleaXxqG4EG/QCxSPR+pF5kVYM4Bi75MLzI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cp+O+GXJk2V8K0tcR3mKantQAAiA+j53QekVJiihEytCLuUFWQYJVpvuX7th9vPg9
	 UJnJgQbFrKokXPa4rSG5WG5NNKGbsOeu5Rw4MGC09in0e0olLismzgXaRKYcazlvX5
	 AZsUHEb8l2SzOxKRHSjAfEhgsA6KaDC30i2uQz7o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC71F802F8;
	Sat,  3 Oct 2020 16:20:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30FA5F80303; Sat,  3 Oct 2020 16:20:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0413F802E7
 for <alsa-devel@alsa-project.org>; Sat,  3 Oct 2020 16:20:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0413F802E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="La5vwbHb"
Received: by mail-wr1-x442.google.com with SMTP id h7so1232446wre.4
 for <alsa-devel@alsa-project.org>; Sat, 03 Oct 2020 07:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GG2/Dd/Pfj/stdMqywLnjL8coxrUAoJ9mpk4ojfM8Fo=;
 b=La5vwbHbR1jnuvX12uTDXOVFTg8mLqrERM77iYNSjm1KNsRBosLxvWRu0yvxuJfMEJ
 oTsZwReZD2qO+v6/quG0T2tQZmS6pdJWwBlnypjIAU3upGKteJHeCCCgvo7KKkKVSrqq
 4/IUGA5cCxNkXiZ2ma58E5VilDg+IjTfRom4NzUYx0WVar9xknPKMDaGg4mbkYLsp1PZ
 Q42NrBqaSxt/eGWeeA9ySF8Fk2+xGKCMmgx+L/ba3Du0jkHx4S3apzU3jDydVaKz4wd+
 nJzuo/0DzG+s6gNa2txaGf4x/EJhSyCWAPhOTvEbd/A2L93VThZQQ5P0oki0G8F40xEr
 9ktw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GG2/Dd/Pfj/stdMqywLnjL8coxrUAoJ9mpk4ojfM8Fo=;
 b=KV2uhzI4yKniiAFFNoLFR/ey/qMCVFqbPq9FTQ53zVjk1z1+7gUM/e20g1bDJiquAH
 7IvZHiN0m0EBCGzwoHbmYqBvr3qcdsqLEbzIQqzXfJtRF0H26TxmCJfW8SheEFdmPl8O
 bPHtQWUGTqLGA5NAtG78oduWMS/3DW2xQL4ORS5WOM27MOF09eHm4bnWORHr5oDHnaOK
 SDsqlDSjE485ppRE+Zirfh088YXV6dgMSGkNXmYXxoGAYrwFry0yCK1hPMK03R9YoGSM
 KGh8BUCVOd6cGldQ1JDWVQcjfE89huzZMNJmmb+L/tFLnSR0FbM0cGW/GUwV1aciNvY7
 ZGOg==
X-Gm-Message-State: AOAM533GzHQodMviro9Y+yPOeZuKvwYTQ2zlgsMYBcUJpLJWkH+EMzLo
 o7SLHKJyu0BQ5IMPXSiraVs=
X-Google-Smtp-Source: ABdhPJxGRE4IDwwLwXLF61O5XwpP4zJXdg3TDS4HcNO71kQwZRKme1VQ72oK2Ri92ijto3Kb6RNZVg==
X-Received: by 2002:adf:e407:: with SMTP id g7mr2338694wrm.349.1601734807424; 
 Sat, 03 Oct 2020 07:20:07 -0700 (PDT)
Received: from clement-Latitude-7490.numericable.fr
 (213-245-241-245.rev.numericable.fr. [213.245.241.245])
 by smtp.gmail.com with ESMTPSA id d18sm5417473wrm.10.2020.10.03.07.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Oct 2020 07:20:06 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH v6 06/14] ASoC: sun4i-i2s: Fix sun8i volatile regs
Date: Sat,  3 Oct 2020 16:19:42 +0200
Message-Id: <20201003141950.455829-7-peron.clem@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201003141950.455829-1-peron.clem@gmail.com>
References: <20201003141950.455829-1-peron.clem@gmail.com>
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
index ba7514849b73..92671eb94db9 100644
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

