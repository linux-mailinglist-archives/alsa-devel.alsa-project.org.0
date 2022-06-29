Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28055F9F7
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 10:05:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23CAB164F;
	Wed, 29 Jun 2022 10:04:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23CAB164F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656489938;
	bh=feOXphnJ2IZI7B/de3SKwq0143W2P+BAmVvtln20x+w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XiwEptlqQMVtJPRi7BuzVG4BtuaUVg1U4bO/yVog6J1Jh0bqxkeWPsL8vYQblRplL
	 RPZNpuZrM5davlVhLnKXQogPNn5CrO9QPun6p+09WQjvpgVnPzGO34lOLtJYkmNZ04
	 nPPmmYhGeL44lOPc2erzSgAI8Seu0HQ3U2v42B9s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD63F804E6;
	Wed, 29 Jun 2022 10:04:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1FB45F8027B; Wed, 29 Jun 2022 10:04:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC79EF80245
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 10:04:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC79EF80245
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="kbp3Symy"
Received: by mail-pl1-x62c.google.com with SMTP id r1so13365576plo.10
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 01:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tphUaJRWmGfbf+rcQQvvdTAaHw/IgKryhTSbMG303fk=;
 b=kbp3SymyDcrr+av2CLzAaJ76U24aRBFW6qsAWMQJGR2htBnuWGvLCgalt6z/9/NmEc
 NYAfdcJUNOfMQCpCkh4e9mKK6tdsIRgQA3MxiqiHyNqa8GjPRZJajLDPkoWHecHitd0N
 Xx9kXZJ5tjyhVlfINrOFta2j0NZ+Epkj0WilE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tphUaJRWmGfbf+rcQQvvdTAaHw/IgKryhTSbMG303fk=;
 b=WAfmgQaXD7W65fNqfkDFrfX2AgkIlvYRNCi/QNJZ1mpJM9TCbqhLPHWoe92+YIgGdY
 p3EJ0760crtqabQJ7m0yE/QjnhlagJQHfFGVrtNqxP7EKgjvJT2dpjV/mxgkWYtRTI0d
 ONJ7weoNymKvluwB1hWiNOAkG4vXGWCm+SS8jGFd345OOXdKo4NoWoVQ1nmZC2KqF4AG
 jO96yM3hTXhJCvKSS26gPLpTw8cuJYHOu3eoBakMPgV/uXP4PoOwPtwGaHTBopPJpkmG
 OrpjQx8BecwQEY1S0W3upoLGWbV96YsgFmf7BhsaF99nmLQkM8XVns58qaY3KdBeAOg/
 HZig==
X-Gm-Message-State: AJIora+r2IQQ4dDjPjG8+S2F+1izaTjXrhzKJgHEh15Q+qjHYB7C6Tad
 7AT07ouJ8Q2+KBxfrOwzZH23SA==
X-Google-Smtp-Source: AGRyM1vD7+R3YGDCxJmwjPFiWHdqVH/Qs7cs5QFTjqLhaftK9VZtL0He5C1/fsJNXhqqZ4K3pDox+A==
X-Received: by 2002:a17:902:7481:b0:16b:7a53:3b4c with SMTP id
 h1-20020a170902748100b0016b7a533b4cmr8071158pll.54.1656489869151; 
 Wed, 29 Jun 2022 01:04:29 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 11-20020a63164b000000b0040d4c8e335csm10579256pgw.75.2022.06.29.01.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 01:04:28 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v1 1/2] ASoC: rockchip: i2s: Remove unwanted dma settings in
 rockchip_i2s_probe
Date: Wed, 29 Jun 2022 08:04:21 +0000
Message-Id: <20220629080421.2427933-1-judyhsiao@chromium.org>
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

Remove the unwanted dma settings in rockchip_i2s_probe.

Fixes: 44f362c2cc6d ("ASoC: rockchip: i2s: switch BCLK to GPIO")
Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
---
 sound/soc/rockchip/rockchip_i2s.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0ed01624a2db..285b6455be28 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -817,14 +817,6 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	i2s_pinctrl_select_bclk_off(i2s);
 
-	i2s->playback_dma_data.addr = res->start + I2S_TXDR;
-	i2s->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->playback_dma_data.maxburst = 4;
-
-	i2s->capture_dma_data.addr = res->start + I2S_RXDR;
-	i2s->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
-	i2s->capture_dma_data.maxburst = 4;
-
 	dev_set_drvdata(&pdev->dev, i2s);
 
 	pm_runtime_enable(&pdev->dev);
-- 
2.37.0.rc0.161.g10f37bed90-goog

