Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1290D5A940D
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 12:16:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C701637;
	Thu,  1 Sep 2022 12:15:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C701637
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662027406;
	bh=TJazg0dLrS6tOUfggEWpuqajM5OwKZ0vPx4aqlu6Icc=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T0i87ATfyTW+nxorZpsZ2Xtcd0rUiObkBpJuIcurPMtvQe8VIE4NCTtwuw0/T2/yV
	 qrG/kThBZ6wgDQaeBx3SpgDbUe1uk3SiKbO64wIgZjBwPYS9L/ADPFHw6KpJr9lz4k
	 yz0MDEEWhMpnxTaPouEO9ExlhcMp3eDA4nxPKUUk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D2D9F804CF;
	Thu,  1 Sep 2022 12:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2229DF8026D; Thu,  1 Sep 2022 12:15:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA094F800EB
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:15:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA094F800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TKrsf52Q"
Received: by mail-lf1-x12c.google.com with SMTP id w8so14635861lft.12
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=UfjJiZEAo19qjNND3CHqX4TJIKByuTN8Q8XFKaEmWz8=;
 b=TKrsf52Q9ddOKrIePHpowifFuaGXZwGr7nnqt5/5qxzHukoBbU1LFhbXr0TYtxU037
 ENlh5/9bMNjo6uoA8dravtDhpiWKCxQnF24CDyY1TnirQOEpWKPTRCJNjtdjWodSf0g8
 1pau6sAowWb/DJYJfEzXeLMcwvbRga7nxpC/Icl2TjeZt9wqm11NCmDNSn12B7pGF4hI
 XwSqVYXrVki9il3F221JSZnTBCOETdTPyjDqRGdEEaNx5yheEgoLzUSVqz/t3gfg6QSp
 zfDO4QLW52Yjqa3WBS0Xyg5+EVEyXSlCwFm83mAmzh2ht8ywHoLfD4by4mUmff3rBgcb
 gndQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=UfjJiZEAo19qjNND3CHqX4TJIKByuTN8Q8XFKaEmWz8=;
 b=I2l2ye6zjFPvopBKlIrdcd+TtQb7FB6GDrxetEFWbM2NLtyDaDpZRh5Lv310rReZaP
 BdigR8bzB4moQ81WTxX51wn2IvxHyDy7J2A1FZkfJ4QfsHpmMC6pjH/Ns40WK4Vxnosk
 M4r9bXYtRq5XSwy4sFQZXdnlvXdZh5qKKZ2gWOVLr14Shol+34pBif/UMvuSBnvQ9ZaR
 4pexMrAvePgzsyqYfs4cEoB1S6/1DHOUDZ9nDi7Hw55WMm3qNQWTQ4h7WdyNeKl1Yd+k
 78vghoEn3zznuYdPbNmBFp3KJMqsNpIxGnhPNvdDQoJDF7crv6DCQUzQzz9GZbbwMIBC
 oBhg==
X-Gm-Message-State: ACgBeo2ty2HWUnfjyTkf7c49GLBTXzld5UuWp6FjEfNSofF7qZe5zQlJ
 hGWR55mrZ0B3zO53Al4oLOnNB2nw9KNsJT82
X-Google-Smtp-Source: AA6agR5f7OH/NaeXRFpefaOH5s/hdNZXALvs+nG+rRPEVpI0nAU3tYg/eaf9gChB/xIQn9Mkzif8eg==
X-Received: by 2002:a05:6512:2255:b0:492:ebbb:5f0d with SMTP id
 i21-20020a056512225500b00492ebbb5f0dmr9923411lfu.304.1662027302632; 
 Thu, 01 Sep 2022 03:15:02 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 189-20020a2e05c6000000b00261ca0f940esm1266565ljf.62.2022.09.01.03.15.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:15:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: codecs: rk817: drop I2C dependencies
Date: Thu,  1 Sep 2022 13:14:58 +0300
Message-Id: <20220901101458.365354-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220901101458.365354-1-krzysztof.kozlowski@linaro.org>
References: <20220901101458.365354-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The RK817 codec uses regmap API and not directly regmap I2C.  It is the
parent MFD who uses and selects regmap I2C.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 2fc37f4e061c..c7d83fe999e9 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1197,8 +1197,7 @@ config SND_SOC_RK3328
 
 config SND_SOC_RK817
 	tristate "Rockchip RK817 audio CODEC"
-	depends on MFD_RK808 || COMPILE_TEST && I2C
-	select REGMAP_I2C
+	depends on MFD_RK808 || COMPILE_TEST
 
 config SND_SOC_RL6231
 	tristate
-- 
2.34.1

