Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F11E550992
	for <lists+alsa-devel@lfdr.de>; Sun, 19 Jun 2022 11:54:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0615B1F00;
	Sun, 19 Jun 2022 11:53:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0615B1F00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655632481;
	bh=jlbEPSvKUPCdJa3mV+PEJWaI5UtEbyXT+jbHwq3vWds=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NYxLmKv/6yA3CAT7fxLyu/FtQ8bGwrf+nr8eQ7V6KT6Nvs9QnIRDCww9oJ5x2WYOv
	 +pfYVWbs8HDJxnOWfeW/oREo2hhZsMHvSe+Qh/30n2bGPXdGoOhZ/0jdMfsikh5FSp
	 hM2qHblehpmom1mHh+cM4Q7IakJHguFSptN3sNB8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70E34F80158;
	Sun, 19 Jun 2022 11:53:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9FE69F8020D; Sun, 19 Jun 2022 11:53:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4ADAF800CB
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 11:53:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4ADAF800CB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Ujfw05oC"
Received: by mail-pj1-x1034.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so8197535pjl.5
 for <alsa-devel@alsa-project.org>; Sun, 19 Jun 2022 02:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR0nPmihBKg/JVQtdlu4B3iD3y1xFJeR/L3hKnfirkg=;
 b=Ujfw05oCO6CQHlxIt9U1/Vw2jZz2wiVAu2MidO2JcQLF7s5nkeLtX+pXVg0r+JG7Rq
 bspYGi4fxvj/xaZ96AGR+/2wKEL8/NTtY2c8USzvxw8l9fcUpS41zrHtRVsNA/M50cgw
 jGn6RF4QAyzCyK8+RxV6AHBAabXA7pT2Kp29w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kR0nPmihBKg/JVQtdlu4B3iD3y1xFJeR/L3hKnfirkg=;
 b=p1Ou0qznUSnzxS+uTAbI0zIb56LFaM8zgSwgj4ly8RyBv0qD3NPMeLjk4C7I6PPLxd
 e3FHm9MttLAdMASKPIVsUql9gTGICnOVAZZsYls/KZl9GRbTkpyK3rOsvulpdWuqMrWZ
 qDN26Tmha+H+9qVEnRwwjNrMXv5Gh0p8hhkqgs/awtm0UtnEj6RkzPGTzmOaAlgDIM2g
 Dq098grvhLm4LuxIXrK/mtcPn/R4fNWT3c4LBy/ljwy3vuqjHQLw7s04PrqOZP4QpdJr
 4cTTol3iMP5XgzCQlfUuoi/LaXjFSgpKEuAoi4HvLQQlIDP6D5h2sJVkKLeyblVPi2d4
 sj7w==
X-Gm-Message-State: AJIora9R1VQbKSYXKbcM/xG6lg/dE0hTcL+exfamjj2cA/E7yMxtGeWE
 iAnCqG5b0qr/MV11zsPqi4SVfw==
X-Google-Smtp-Source: AGRyM1v7zPmyGbZPOSnbb98hniYzON8YpxLeYV5xLE/gaU76OD8LpMvcKXf8EiPwhBviJK2jxy4o0Q==
X-Received: by 2002:a17:90a:e418:b0:1ec:9908:d5f0 with SMTP id
 hv24-20020a17090ae41800b001ec9908d5f0mr3170210pjb.7.1655632411623; 
 Sun, 19 Jun 2022 02:53:31 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62178d000000b0050dc762817esm6799971pfx.88.2022.06.19.02.53.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 02:53:30 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v4 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Sun, 19 Jun 2022 09:53:21 +0000
Message-Id: <20220619095324.492678-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.36.1.476.g0c4daa206d-goog
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

The patches series is to fix the unexpected large DC output
voltage of Max98357a that burns the speakers on the rockchip
platform when BCLK and SD_MODE are ON but LRCLK is OFF.

Changes Since V4:
    -- Fix indentation in the driver. (Align parameters with the parenthesis
       placement.)
    -- Fix incorrect return type of rockchip_snd_rxctrl.
Changes Since V3:
    -- Fix indentation in the documentation.
    -- Put pinctrl-1 right after pinctrl-0 in dtsi.
    -- Fix indentation in the driver.
    -- Remove unnecessary dev_dbg() in the driver.
Changes Since V2:
    -- Add documents of i2s pinctrl-names.
    -- Fix dtsi syntax error.
    -- Include the dtsi change and the driver change in the same series.
    -- Ensure that driver gets both bclk_on and bclk_off states before using them.

Judy Hsiao (3):
  ASoC: rockchip: i2s: switch BCLK to GPIO
  arm64: dts: rk3399: i2s: switch BCLK to GPIO
  ASoC: dt-bindings: rockchip: Document pinctrl-names for i2s

 .../bindings/sound/rockchip-i2s.yaml          |   7 +
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  10 +
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  25 ++-
 sound/soc/rockchip/rockchip_i2s.c             | 171 +++++++++++++-----
 4 files changed, 165 insertions(+), 48 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

