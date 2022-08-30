Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 779515A5D8B
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Aug 2022 10:00:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D850D1675;
	Tue, 30 Aug 2022 09:59:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D850D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661846407;
	bh=G9PNhBxwiZr2iGVHDso4OYE+DdTPoJRPhM6XjYc1m+k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tZ0ad5seQcvxgdLsPH/Wj76W95rVVJTZa0WMTkJds6G6MU1swd08BL6B3X9HlV8MA
	 LFnUwLM7Dz2Vw/ie+HUcXx/soHXgjiJIuVrwkEI17u6R5eerQ2VAE+XcE50PIgPiLQ
	 MZbDtj9HK/0NyIVXVP8h02CeIv4EFuQtoz8VhioM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 327C4F800F2;
	Tue, 30 Aug 2022 09:59:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E8A5F8012A; Tue, 30 Aug 2022 09:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54CDEF8012A
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 09:58:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54CDEF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="hNnVqtnb"
Received: by mail-lf1-x12e.google.com with SMTP id p7so3277118lfu.3
 for <alsa-devel@alsa-project.org>; Tue, 30 Aug 2022 00:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=JyJg814s8VNKfznL3jPP/bagNFT2CFpVK/YKwkc4pmY=;
 b=hNnVqtnbES08UFG8eGi60EgJlNBj5fsNqtjk9dBwtUbdps1C1ZEv2RtnaP0ZCA3HOk
 9mTGLOgYD4Ia0vYwdd9g9JLecbEIANKroQutHXrXjtyS12suuT671yUGtkuTWSWKcwkN
 qG92MGVKfHNxGXX/edquEVl+6ebeeu7B95tpTb8um2lr2ovmF/yn1JLx2EWlIZaA5TJd
 W1o3//HEt61Y/BxwiyDoiAdm8mUfGaKEseYD8sfyfaRHTGmI2ZGqwqPAsu9OA1q3pByu
 ZOhAnESs9pGSwv5jPdkq1CvE1b7oKqupoyI0E6NkhcTNK6ciXdB9f4mmwdv9FvASVrp5
 suVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=JyJg814s8VNKfznL3jPP/bagNFT2CFpVK/YKwkc4pmY=;
 b=IsU8tbA91nU0siaoAnIIzFx3o9JHZu2IRPEY75FTnq+1dKIhVfoH1nS6GkZ62IDfbN
 8B2xhZrNJd/HEJczXmo9KLFc1LgF1nULQm29lo9xNiLmn/TIZKYGpQebGI/2B2ystnpC
 O39UlqADYcnIkg1VH/VCCrWrt6hlxG8oyGHZCOUAf5HduOVCYi+ho3CdkQdeGnVqt6pQ
 oQ+AL6Iq1iu1lzlV5MtLIp0teaRXov7bOT9T2TN9v9FIscX0INKHPCdXizwrU6FEnGGP
 Hrd+VoFbcSmsTd/RJsjjJZWo0LSuZnFqPlMunWGmfTMazBcADXsU3qKP0W0AWSqpu0bh
 +Vgg==
X-Gm-Message-State: ACgBeo3tQgOLisxObiWXHXuAMAk7sYa6iMNz7jC4xjIsW42KJNR6SA5T
 OOVvFNPKEj+1HnBdoLWvCLtZpQ==
X-Google-Smtp-Source: AA6agR6WgXrloUT0qepCq/hwy+s6NVisiGm9eKqQl4uG0m4zYRath4sRXPDFwrotfJCXgR8G769NBQ==
X-Received: by 2002:a05:6512:12c5:b0:48c:df54:a41a with SMTP id
 p5-20020a05651212c500b0048cdf54a41amr6994063lfg.464.1661846338193; 
 Tue, 30 Aug 2022 00:58:58 -0700 (PDT)
Received: from krzk-bin.. (balticom-73-99-134.balticom.lv. [109.73.99.134])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05651212c900b0048aa9d67483sm948946lfg.160.2022.08.30.00.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 00:58:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: codecs: rk817: fix missing I2C dependency in compile
 test
Date: Tue, 30 Aug 2022 10:58:55 +0300
Message-Id: <20220830075855.278046-1-krzysztof.kozlowski@linaro.org>
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

SND_SOC_RK817 uses I2C regmap so compile testing without parent MFD_RK808, requires I2C:

  WARNING: unmet direct dependencies detected for REGMAP_I2C
    Depends on [n]: I2C [=n]
    Selected by [y]:
    - SND_SOC_RK817 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (MFD_RK808 [=n] || COMPILE_TEST [=y])

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 5b7f4e5de61b ("ASoC: codecs: allow compile testing without MFD drivers")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Commit SHA from linux-next (recent).
---
 sound/soc/codecs/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 94b7bb85d236..968d0701f2e8 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -1197,7 +1197,7 @@ config SND_SOC_RK3328
 
 config SND_SOC_RK817
 	tristate "Rockchip RK817 audio CODEC"
-	depends on MFD_RK808 || COMPILE_TEST
+	depends on MFD_RK808 || COMPILE_TEST && I2C
 	select REGMAP_I2C
 
 config SND_SOC_RL6231
-- 
2.34.1

