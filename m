Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DC55F9F6
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 10:05:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92E8D829;
	Wed, 29 Jun 2022 10:04:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92E8D829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656489903;
	bh=T0ZncwD4I/1keZnTPUCZkCDkox4VjYRNXFpBLaVDC7U=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OIMskWkW1PxbKpJ4UaJqOP2sL7LRON8yuh5XiXOEHkkoUdhs17L3+ur7W5oy6ZHiB
	 4aJAfN/jCFtwlzVCZszFQCXSctsCRvnSvMpdS/iX3LJMoqdztZsrlg0rPcwkLAo0jU
	 l7ZHPaflfF2vbxYFNSC82S/xwxHEoM8McJ64nVWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A245DF80107;
	Wed, 29 Jun 2022 10:04:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB4E7F8020D; Wed, 29 Jun 2022 10:04:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5FE19F80115
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 10:03:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5FE19F80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="cvTkmfHi"
Received: by mail-pf1-x431.google.com with SMTP id 136so9240136pfy.10
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 01:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYKmRwqhkod5kWIfzS16sS6jaDGBM3foLD2Ky8UkHos=;
 b=cvTkmfHi796POn8CJZVh8BuxQwCNHiL3lhRSUhCOi/iv8SBNkEjDUwW4bPCRwPQn2T
 78pmahWeeTSLx9N8hoYKAFzkZ06RUSRYZKtuOJJQ6OcBO/9FvozCxrj7AraN/NoC9Ugn
 Y8+1EFUP24BNpDYGjvcxFLYXVBUf7tkUheYHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kYKmRwqhkod5kWIfzS16sS6jaDGBM3foLD2Ky8UkHos=;
 b=eXdCA8hiYfKOWSVbI5MIqt+DwrxpYx8v1GkfSy5M8Ia1vGZxROo9dtOAJ1NnfVz4y0
 BkQRlhAXb0BV7WJebu/uwb+OaQX1ChlgKscy8HYdV2ZB1VhHoqyaZ3bjekwybRJ/1sSz
 X2ZTy/ZTecoff0R7Q41wYckvs8gk0vTvBlNtt3bUf0bWeDufW3XXqczPPzHC3A/rAzRa
 twxcTZsLSsAHVinUNF7WuTl9KOYBNzvSi9J/6gPUXsB6Q4BE9MQDHFga9QdyHXXOmFUH
 GA0dEcX99Ac2IgxAfPTFhqfkhzZ8rbQvr1QIzzJkoVgptzJ7+mNPoO1Qi0lvB8b5jo0V
 oQDQ==
X-Gm-Message-State: AJIora99kSFpaV3eV0AydubdX+OvocRefsXCOesUixuNCdlEPeiLISJh
 +F6lMGyN+zr3cQlt0nRXp9xkjQ==
X-Google-Smtp-Source: AGRyM1uLKuVxfxJVTSk72PzpYK6KFIsep162OacqzigSpO++IFBp3TTs/nUxCAA0MTJPJWRHyAz0Dw==
X-Received: by 2002:a05:6a00:c91:b0:525:8c3f:269 with SMTP id
 a17-20020a056a000c9100b005258c3f0269mr9140613pfv.66.1656489834468; 
 Wed, 29 Jun 2022 01:03:54 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 h18-20020a170902f7d200b001624cd63bbbsm10676727plw.133.2022.06.29.01.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 01:03:54 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v1] ASoC: rockchip: i2s: Fix the debug level on missing pinctrl
Date: Wed, 29 Jun 2022 08:03:45 +0000
Message-Id: <20220629080345.2427872-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>,
 Judy Hsiao <judyhsiao@chromium.org>, linux-arm-kernel@lists.infradead.org
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

Use dev_dbg on missing i2s->pinctrl as the pinctrl property is optional.

Fixes: 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 285b6455be28..f783994cc16a 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -812,7 +812,7 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 			}
 		}
 	} else {
-		dev_err(&pdev->dev, "failed to find i2s pinctrl\n");
+		dev_dbg(&pdev->dev, "failed to find i2s pinctrl\n");
 	}
 
 	i2s_pinctrl_select_bclk_off(i2s);
-- 
2.37.0.rc0.161.g10f37bed90-goog

