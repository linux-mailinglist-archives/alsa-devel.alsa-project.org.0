Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3451E6130AC
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 07:48:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAF8D1636;
	Mon, 31 Oct 2022 07:47:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAF8D1636
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667198888;
	bh=S42DRyQJvW7TZ+pT+uzx8w8nEiWf3kDosmTLCv5ZehE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T3KighxHEM0x1+/SveYG34V1w+foHzOTCt/Wt8ZGc7x+ygFcsiSqOL5MozGgtyu9S
	 KiWMdzraEEaou7RZMDqsyqCNcvDfUtb2qzz2LS1ZAtgHgKN5ebbxU/mqE3EHj4bwa/
	 BYokxQAWrkV1a3TKCPuFcI6Kcsc16gs/JdzSTODk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A0804F80568;
	Mon, 31 Oct 2022 07:45:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39B91F8024C; Fri, 28 Oct 2022 17:26:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D0A2F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 17:26:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D0A2F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.b="N4qct+2/"
Received: by mail-ej1-x636.google.com with SMTP id y14so13720741ejd.9
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 08:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KYAU7odEMWKCjcropggkZQwO0OXnOT7Nxlue1f2Igjw=;
 b=N4qct+2/SkZTJmUhVNcb4x9h7lglsGkPGesm5ETCb6oDXj/896682W1IKcdN13TLcG
 gbEtaMgVEyleOH1zypX/bT1pazrPuMqQPG5xvSv2qzdZvL+olVF/KWwtwno67arAzTkL
 W3K4jUtGoo3rlzaDH5gok3XY0vEyMjSuHY5fM5MRm6iD2G5SkAdWW7k4zv9U0+pP97HT
 uo0nP/LOksN6bp8kC4OfFV2xDijskpC/DXBwG0FeSQU97vxR09Cjo1eHTCFA85h8ArXI
 s1aKN9+FHg9TcVnM4ILkZaZb96o1MkKsTKtaEvRHhjqMVKYr8i1XIlAiLkmu+lE8P1oO
 EArA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KYAU7odEMWKCjcropggkZQwO0OXnOT7Nxlue1f2Igjw=;
 b=ZmIGlW30GNtzXtJMtojYmZu6079RlBi1cbFv3moTZr1Jf/89raGkTyT7CcjmxcELpk
 HWPerwEl5a63txDA75zDa/7rZOgDX5WfFli2GaZZz+scC2t763ohOLBy69fxk9psTtZR
 ddp/zA5RZVPFpP/fXorrjumdCFYqH9J6ziqnR6o/BQp5+jJwP54QGh9ELQBhZjzIahg1
 FV4IjNIcyk7GPm7NIKVuUvXg8pTEYqRgKYfxBXjbjYXy/intnnsv2EQxfnlfQd1GXDXg
 lStzEjkLXwIfXQurncNccZMexZ1NtK0DfzhjJAFl7gbYSOCJHT5vFj+HF6tT28pT3viE
 hlzw==
X-Gm-Message-State: ACrzQf1mn2OYi92k9h5LuCvz5BGHq4/+fxTtl/803EBV9YQryZzUcyKs
 Be4Mz2Se7vHb+d+X6Lmi5v48lA==
X-Google-Smtp-Source: AMsMyM4W1T435LCEpPz8XnDAEEj28TglPOt1WbD5txMFkIDdY7TDsPUrl+yprTOYVSDAYlOwSgOmjQ==
X-Received: by 2002:a17:906:30c5:b0:782:707:9e2d with SMTP id
 b5-20020a17090630c500b0078207079e2dmr46375763ejb.286.1666970810840; 
 Fri, 28 Oct 2022 08:26:50 -0700 (PDT)
Received: from dtpc.zanders.be (78-22-137-109.access.telenet.be.
 [78.22.137.109]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906319100b00730df07629fsm2349839ejy.174.2022.10.28.08.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 08:26:50 -0700 (PDT)
From: Maarten Zanders <maarten.zanders@mind.be>
To: Lars-Peter Clausen <lars@metafoo.de>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/3] ASoC: adau1372: fix mclk
Date: Fri, 28 Oct 2022 17:26:23 +0200
Message-Id: <20221028152626.109603-2-maarten.zanders@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028152626.109603-1-maarten.zanders@mind.be>
References: <20221028152626.109603-1-maarten.zanders@mind.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 31 Oct 2022 07:45:34 +0100
Cc: alsa-devel@alsa-project.org, Maarten Zanders <maarten.zanders@mind.be>,
 linux-kernel@vger.kernel.org
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

"mclk" is retrieved from the configuration and assigned to adau1372->clk.
However adau1372->mclk (==NULL) is used for clk_prepare_enable() and
clk_disable_unprepare() which don't have any effect.

Remove .clk from struct adau1372 and use .mclk throughout.
This change ensures that the input clock is switched on/off when the
bias level is changed.

Signed-off-by: Maarten Zanders <maarten.zanders@mind.be>
---
 sound/soc/codecs/adau1372.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/adau1372.c b/sound/soc/codecs/adau1372.c
index a9f89e8565ec..00d0825e193b 100644
--- a/sound/soc/codecs/adau1372.c
+++ b/sound/soc/codecs/adau1372.c
@@ -25,7 +25,6 @@
 #include "adau-utils.h"
 
 struct adau1372 {
-	struct clk *clk;
 	struct regmap *regmap;
 	void (*switch_mode)(struct device *dev);
 	bool use_pll;
@@ -925,9 +924,9 @@ int adau1372_probe(struct device *dev, struct regmap *regmap,
 	if (!adau1372)
 		return -ENOMEM;
 
-	adau1372->clk = devm_clk_get(dev, "mclk");
-	if (IS_ERR(adau1372->clk))
-		return PTR_ERR(adau1372->clk);
+	adau1372->mclk = devm_clk_get(dev, "mclk");
+	if (IS_ERR(adau1372->mclk))
+		return PTR_ERR(adau1372->mclk);
 
 	adau1372->pd_gpio = devm_gpiod_get_optional(dev, "powerdown", GPIOD_OUT_HIGH);
 	if (IS_ERR(adau1372->pd_gpio))
@@ -947,7 +946,7 @@ int adau1372_probe(struct device *dev, struct regmap *regmap,
 	 * 12.288MHz. Automatically choose a valid configuration from the
 	 * external clock.
 	 */
-	rate = clk_get_rate(adau1372->clk);
+	rate = clk_get_rate(adau1372->mclk);
 
 	switch (rate) {
 	case 12288000:
-- 
2.37.3

