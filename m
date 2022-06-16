Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E81854E684
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jun 2022 18:00:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 830BC1ACD;
	Thu, 16 Jun 2022 17:59:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 830BC1ACD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655395202;
	bh=F5ho0Xijk1rr5TerGHKquW/0iovyiHPVRyzv4YN0pGo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gx3/u2duAKoYvOsee5NbLQgaA7k5YEKnp5mikCE4vRvXF8+f4JvEZuHD4zq05yqwv
	 f2kNTy4sKnKYk2gA83WnqJeQW0Cyj81A8ZT8Uc49gNEQLrsWI1vS2vLzZEborJB9HM
	 1ZpdrgM1HF8DLHowP9KWsJH92rrZjmaQU6LCxkBg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECE2BF80310;
	Thu, 16 Jun 2022 17:59:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7238FF801D8; Thu, 16 Jun 2022 17:59:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2CF7F800F0
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 17:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2CF7F800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="etAzaLvB"
Received: by mail-pf1-x42d.google.com with SMTP id y6so1854455pfr.13
 for <alsa-devel@alsa-project.org>; Thu, 16 Jun 2022 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dt7moyOGq/wGPX6up0TVePAZeRh2KcSmjYDlmf94HxE=;
 b=etAzaLvBUF3LEk3BYYPg9CD5v+EkBJJTvunVknq9iG/wLOY/Le32cBqexS0UkwiMlm
 ETzSnFjod9eT57QJBIyjiwXD7Ji0tFwwKHTkKj1Ize6vtPyw2HENYoBzT1QYSCFPVmH1
 oC8sYIl2DMZmXaRla94BaQApJ2Rdu8zrT5qdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dt7moyOGq/wGPX6up0TVePAZeRh2KcSmjYDlmf94HxE=;
 b=y9omCvXKbfxMVjQuIm+5Zzdn5Y71ZlJVtaG8URJD09z9CDbb4HS1WKPqVUHIyLq9et
 /Qn51alOwYwBZuBgSQrog2LGXK890YzFLur93PewHjxeCet+Xtr2YjAF6EzAz9LCXaOg
 Dl+N2d2VvqvWNH6kmit3VtAz8cGJQIPCwITDbqW+31lk+u0RleWXkYPejPGOlbm4hWyq
 FORN5nPYJ4JhLf47IUBLpck+E/FJVgLEfudel9aBflUB4WzAehbXTAYvl10nroqBNNEI
 vhwTVOknWCNy4slIcbNTpv1f7uuKOMuDSd5YcVt4vnqs3WK9Scoh36204ogwjgpm5Nat
 N7GQ==
X-Gm-Message-State: AJIora9l/8dEMKfClEW+UP29t8nqR3sp/sM5hXCSJqX3mGeIMKa/0D54
 T/xT6jMKf0QYY3Dml2Tmrb/ffw==
X-Google-Smtp-Source: AGRyM1t0X7UHlN5X6Tiqx+yKhBWm7VLeGVTI8ighHLTVurpkRre+vuBb+6E5+wGZ4rm7QDhfp1ipTg==
X-Received: by 2002:aa7:888c:0:b0:505:7832:98fc with SMTP id
 z12-20020aa7888c000000b00505783298fcmr5333501pfe.0.1655395133562; 
 Thu, 16 Jun 2022 08:58:53 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a170902684800b00161478027f5sm1779797pln.150.2022.06.16.08.58.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 08:58:53 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Thu, 16 Jun 2022 15:58:33 +0000
Message-Id: <20220616155836.3401420-1-judyhsiao@chromium.org>
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

The patches series is to fix the unexpected large
DC output voltage of Max98357a to burn the speakers 
on rockchip platform when BCLK and SD_MODE are ON but LRCLK is OFF.

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
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  10 ++
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  25 +++-
 sound/soc/rockchip/rockchip_i2s.c             | 134 ++++++++++++++----
 4 files changed, 149 insertions(+), 27 deletions(-)

-- 
2.36.1.476.g0c4daa206d-goog

