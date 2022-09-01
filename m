Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 165095A9405
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Sep 2022 12:16:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0FDE15F9;
	Thu,  1 Sep 2022 12:15:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0FDE15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662027374;
	bh=z2O78SjNfDand0kXLAqrumtUb0KyWRKp1i7tDTBtj3Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZVtY8SGhAg9UGPyEyPmAAFrz3flNmslI8limvPz8/fmSGdPIrfO37+GwettqWLXG8
	 bTgQ5WBSqxVB71DGnUp0zzKOuawoqYsNy5C0TtAepMlQyTmrASvjeO9l3qLWKCPn6j
	 WRAiChWXRmqTpHTtcrI9WymaCDGOynBh3HeNC2mM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23CA3F800EB;
	Thu,  1 Sep 2022 12:15:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D62A0F804A9; Thu,  1 Sep 2022 12:15:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99BD5F80236
 for <alsa-devel@alsa-project.org>; Thu,  1 Sep 2022 12:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99BD5F80236
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E2vOWXys"
Received: by mail-lj1-x236.google.com with SMTP id s15so12226974ljp.5
 for <alsa-devel@alsa-project.org>; Thu, 01 Sep 2022 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=mtzbQ813GefStQWt/8A6rNqlj+sApr5uo7WJJunn+4w=;
 b=E2vOWXystzy9srWI5OpgIsGxHVKb+2e0yhd6Mkwge/GrzSYj6S0d0sVvyfJjMgfNjl
 MwMEtnqZCk5cj+YZyIbI5YCv4c+cHZ1eBVfCGgatIIiPD1KqsUWBiaGNAVujsWEco/hJ
 JBodrZB1ON0wCXkGtd8Jxyk+QrcfSIYHEb8feT5/BTeFsIiNr9RtqOyM5S/UDhnFiSvf
 qvLE0f4rnPk6pg0eTQtGpNv2AacQbviNEiuyNpb3vRjRCX9VrvB8oCe80q5BlcuyO7Ge
 OlEye61oXuYVzENpNMwtIeCshBQw+h9bwAcZOmuIxvy17Kzsko/AxThwxJ7t54P2t6gD
 agrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=mtzbQ813GefStQWt/8A6rNqlj+sApr5uo7WJJunn+4w=;
 b=l24gBlbhRCnlMQ7JsVGx/Alu7ZZyuQdxFLfXIak8CG6V0D24eF7gyrzQQ9cE6ZvyMp
 elvlKDl1XkNaFxb0ZUhfa8YsLbZh2ZXHgi9NCD80X/tU9yS5hO+PLgbLsbTdcAZY8Rbc
 u3wDA5VnhNbQRFwJqtF5ocuT6KeZ0IG455NAOxLO59Hd1rOouVBB5DmiAzo8zMfpeJ9v
 xxGeDzurL1S+Ysc9QDYbvYyBQii96L9RN/ENavJ1T+3R722ikbZhyn9WLSsFQziB9W7r
 WjUjhXIc/hhoYD0JFXSEwlkAiqf8KaEfVXXqzaKdX1JkYY6oIwpOuZoh4egy/21XEzzL
 mgzw==
X-Gm-Message-State: ACgBeo0ASsv9o4SNylN0sdSCzLTVsXX16HmibD/qreMfSf4AWuxLs5bK
 vtyuSk4qtVWwqssoDsszOobgIQ==
X-Google-Smtp-Source: AA6agR4nyCOizMkZutH4KZGXO4VRzf8r56lGSNHj2Joxp+eGxPfb/WD8KLrvVHlPdm9fl/JtEZrOWg==
X-Received: by 2002:a2e:7205:0:b0:263:fec3:a700 with SMTP id
 n5-20020a2e7205000000b00263fec3a700mr5963996ljc.178.1662027301413; 
 Thu, 01 Sep 2022 03:15:01 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 189-20020a2e05c6000000b00261ca0f940esm1266565ljf.62.2022.09.01.03.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 03:15:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: codecs: wcd934x: add Slimbus dependency
Date: Thu,  1 Sep 2022 13:14:57 +0300
Message-Id: <20220901101458.365354-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kernel test robot <lkp@intel.com>
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

The WCD934X codec is a Slimbus driver, so it must depend on SLIMBUS,
also for compile tests:

  ERROR: modpost: "slim_stream_prepare" [sound/soc/codecs/snd-soc-wcd934x.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 5b7f4e5de61b ("ASoC: codecs: allow compile testing without MFD drivers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 968d0701f2e8..2fc37f4e061c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1744,6 +1744,7 @@ config SND_SOC_WCD_MBHC
 config SND_SOC_WCD934X
 	tristate "WCD9340/WCD9341 Codec"
 	depends on COMMON_CLK
+	depends on SLIMBUS
 	select SND_SOC_WCD_MBHC
 	depends on MFD_WCD934X || COMPILE_TEST
 	help
-- 
2.34.1

