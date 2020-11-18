Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B75042B7EBF
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 15:01:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48D4A16AE;
	Wed, 18 Nov 2020 15:00:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48D4A16AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605708070;
	bh=KwvM4z0WK3naEkvOwdZnzRmZXlAi+a9O5qyL+WBcWnw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2ESOVNSSPX7XeiA/KGJosUet7gCVa+rVYpDNqqlwO+ZK3aC3c0mWh8iYoZOdWROX
	 Zeqp/kBSbvWeqJ9GQaNvZQcE4PcZLEAW7kVCYWPcCAUsH/8OckGC30uC7E5X1g5+vB
	 xuNFAL6etqeZD3hc32zD9EqjFA2W3jGNiy2c65s8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DDDACF804DF;
	Wed, 18 Nov 2020 14:58:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88B51F802A9; Wed, 18 Nov 2020 14:58:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3644CF80168
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 14:58:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3644CF80168
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E0TgA8Fv"
Received: by mail-ed1-x543.google.com with SMTP id a15so2111861edy.1
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 05:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=O15+S8qQJDT/sctgXYGA2Ljv6MPm4itzezho9fQXrTw=;
 b=E0TgA8FvVhJVuL4QjwryYioG5ukaTZDNGKeVPP3cxNuekjQQhONNdSjVEESHmJaMnN
 FVEhigRNXoJlEDXlkZED6SOZu4whMRqRW0kN12qqnG1hTjYB/YXvJ8tOQmaj2tzD8/Xe
 tG5CucGg2BBmGqVIvY214dt5Dpd2RySOukfaAinlUD1qgjnqLqLVxwjIkzqzIca33e77
 qVhzBxHLQ0J0l8xc1UU1XZe7zySDlJF3C7lK/QV6Qo7WqkHrBoWN/qNKiQltWAV5nLN6
 TlIbrXowVBZwxjV5kuY8jvvFRVYK65IvSQSa3WziRuUpuKBdLZKH1G6Yfe4d83n4VDq4
 MF+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=O15+S8qQJDT/sctgXYGA2Ljv6MPm4itzezho9fQXrTw=;
 b=KfO+FB1L13vBgbzex4ETEVt3G2xVF/+Sra3tYLVtstQfow2Q9Yz4JtzNT9CK2jIkAU
 wsETYTp64/Fou9jYLiutuFVDxAU5GmLk2y1PiJQQ/NE1tTCsDqEkKnwVzIqhKwa/9uOL
 +7N0lmNe9WlpODqrQpcGTxnv+DHCV8fUxsqFlP0XcV1vkEJc3JB3q/n+huDbqERmKVqE
 GItTgfHn78q22WhwjqOmXO0+2j43sZt6b1rAzwk0FR4g3F5D3KJlzqwNMteWrassSEn+
 udvlopm4LE6oKDI733vaGCL+vnVW4IaASW21DxD3mtRGazWOdpp4XxKV0QvXPCsoPsZm
 UmcA==
X-Gm-Message-State: AOAM530cLVD9SSme40wNtoMNwCvI7ccBw1tXhk94zaDcF5gzsH+Jq9oO
 QpWDyYmTNvfVeb/jciqXcwE=
X-Google-Smtp-Source: ABdhPJyEp8bQ0cA1TBErbYejuIdVGGdRiXYdRohu8yPSprOL85WW3/XUARu8cgP0kyWc2Poc9qXFYA==
X-Received: by 2002:aa7:d703:: with SMTP id t3mr25109179edq.375.1605707910648; 
 Wed, 18 Nov 2020 05:58:30 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id cx6sm13721384edb.61.2020.11.18.05.58.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 05:58:30 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v5 0/7] Enable rk3066a HDMI sound
Date: Wed, 18 Nov 2020 14:58:15 +0100
Message-Id: <20201118135822.9582-1-jbx6244@gmail.com>
X-Mailer: git-send-email 2.11.0
Cc: alsa-devel@alsa-project.org, linux-rockchip@lists.infradead.org,
 airlied@linux.ie, linux-kernel@vger.kernel.org, mturquette@baylibre.com,
 hjc@rock-chips.com, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com,
 sboyd@kernel.org, robh+dt@kernel.org, broonie@kernel.org, daniel@ffwll.ch,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

First fix some legacy things in clk-rk3188.c that was never updated,
because probably nobody used rk3066a I2S before in the mainline kernel.
Update the rk3066a HDMI documents with a #sound-dai-cells property.
Include the code for sound in the HDMI driver.
Add a simple-sound-card compatible node to rk3066a.dtsi,
because I2S0 and HDMI TX are connected internally.
And as last enable rk3066a HDMI sound in the rk3066a-mk808.dts file.

Changed v5:
  removed unused variable
  fill frame structure

Johan Jonker (6):
  clk: rockchip: add CLK_SET_RATE_PARENT to sclk for rk3066a i2s and
    uart clocks
  clk: rockchip: fix i2s gate bits on rk3066 and rk3188
  dt-bindings: display: add #sound-dai-cells property to rockchip rk3066
    hdmi
  ARM: dts: rockchip: rk3066a: add #sound-dai-cells to hdmi node
  ARM: dts: rockchip: add hdmi-sound node to rk3066a.dtsi
  ARM: dts: rockchip: enable hdmi_sound and i2s0 for rk3066a-mk808

Zheng Yang (1):
  drm: rockchip: add sound support to rk3066 hdmi driver

 .../display/rockchip/rockchip,rk3066-hdmi.yaml     |   4 +
 arch/arm/boot/dts/rk3066a-mk808.dts                |   8 +
 arch/arm/boot/dts/rk3066a.dtsi                     |  17 ++
 drivers/clk/rockchip/clk-rk3188.c                  |  35 +--
 drivers/gpu/drm/rockchip/Kconfig                   |   2 +
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 275 ++++++++++++++++++++-
 6 files changed, 323 insertions(+), 18 deletions(-)

--
2.11.0

