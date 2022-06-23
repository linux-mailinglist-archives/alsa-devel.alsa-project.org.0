Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202B5570ED
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jun 2022 04:13:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F1E41B21;
	Thu, 23 Jun 2022 04:12:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F1E41B21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655950387;
	bh=j2h8gEZWVv8wk6ToHRuwmvN/Zr6XHox7skDWD39TmDM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qbc0crfJZQfnqR+y3pYb7ZoyuvxumaYUKyg07hEcm0dVpdrlAVYJdvf4kt6pkE6Fd
	 f3OeEiBEb4SsZF70dO366kmXoOyc512aASiVVwN1wnlNlvcBGoz37XFb1MPM3Xu64c
	 9/RXm7Xp8m7mbd7wnIRoDj15WIdDgkO/3Zfh0tzc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4CE2F804C1;
	Thu, 23 Jun 2022 04:12:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D004FF800BD; Thu, 23 Jun 2022 04:12:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38F35F800BD
 for <alsa-devel@alsa-project.org>; Thu, 23 Jun 2022 04:12:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38F35F800BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="BR2naSce"
Received: by mail-pj1-x102c.google.com with SMTP id
 g16-20020a17090a7d1000b001ea9f820449so1104428pjl.5
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hRLTpselmSzOmfEMzptO0DKyWBgV2uZm8FqGFEjaV8s=;
 b=BR2naSce8Q38Guq9+xSEESPiRtMPfWntr5oX3C6t9VIHlwzBOfmM9RhSLX9CWTsMYW
 2gUyBX0+UTMKdPEfxtmCJ4CA1pEbwNKXe4xcp3Vq2XvN3KCbwROgQnoECWpG9Sb6mwL5
 ysQgodcgLMBdNiZaq+cVygPxvvgpSBqG3a8w0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hRLTpselmSzOmfEMzptO0DKyWBgV2uZm8FqGFEjaV8s=;
 b=JlycReZMnGzRGrAiw9UXD8sFxDuSYgG3CCuj3OHx+KZ4QIgUI6lQkpkQz388H/F7XS
 0qF94Xtz3czvrwA2+frpIf2d3eNNVkvzgubiS2LeIU0n1rK1iAIB4pqrQl/93WWP2qjd
 ZKvSJ5exrN7+wZKLMkJ1VcpkVZ3qS7PZ8knCXOYfaViYmanJ7JQbXwWbbloF7DkLm5Zq
 KKofGd5T3e0oZCHLuTkUPWRhDV06iymvfFQ9wZm6bn2PslGUa/kqODktNcqQXG2SzjLm
 v1r4dGvAoc6W/fQRE8l/lwd5DOGLT7bXrbizeBr85dKr//Oo04SFVaQWQgM/ASdFqES/
 iTpg==
X-Gm-Message-State: AJIora/nOCsmdttOAU9DiL+ZcZfYMvUFiafuSB9TyfNNOFZKx428bA9u
 PmNM1k5t4mfXRRS9as4Avp9hiw==
X-Google-Smtp-Source: AGRyM1to8GFgYWhfCWzgrps3P2NpjJ8gdP3iEDZCUi592P2vqic1MM8S2D55xH9pxFCZWiiBnYgG1A==
X-Received: by 2002:a17:902:e848:b0:167:6ef7:b093 with SMTP id
 t8-20020a170902e84800b001676ef7b093mr36677142plg.154.1655950320778; 
 Wed, 22 Jun 2022 19:12:00 -0700 (PDT)
Received: from judyhsiao0523.c.googlers.com.com
 (0.223.81.34.bc.googleusercontent.com. [34.81.223.0])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a170902768600b0016196bd15f4sm6194000pll.15.2022.06.22.19.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jun 2022 19:12:00 -0700 (PDT)
From: Judy Hsiao <judyhsiao@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v5 0/3] ASoC: rockchip: i2s: switch BCLK to GPIO
Date: Thu, 23 Jun 2022 02:11:50 +0000
Message-Id: <20220623021153.587423-1-judyhsiao@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.104.g0611611a94-goog
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

Changes Since V5:
    -- Check i2s->pinctrl is valid before using pinctrl_lookup_state.
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
2.37.0.rc0.104.g0611611a94-goog

