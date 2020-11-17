Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E212B6F2E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 20:47:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3CBE1794;
	Tue, 17 Nov 2020 20:46:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3CBE1794
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605642420;
	bh=IZaT1tM3sN7joJmL1uch79Y7cIZCybbWthHVsOLDHgA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NOb2NP+Hj8oJp4q2G6EK7YVDddcauZ/n+mMP3QE5Vo1ae9blBUwoJFf3P2NmSJ/d8
	 v7hw3TKe9GwgQc+mho2eiOyCvnp8G2HF3YtExBMCRMun27Hf5V17wkirRjNSC0pofR
	 rARZsxbxbC2s2VVsh1601RQIyKbumThQT3FCjTAQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B47A6F804C1;
	Tue, 17 Nov 2020 20:45:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 95012F801F5; Tue, 17 Nov 2020 20:45:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EE274F801F5
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 20:45:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EE274F801F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bEGG7+pW"
Received: by mail-ed1-x543.google.com with SMTP id q16so8556746edv.10
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 11:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7FuTWq4BSG35jYcVC2y/aAokRjHupx3BOtYk6g9sB7k=;
 b=bEGG7+pWjohHYGCns+rU7864961TKkiTrUm42uvT6LxfEO1YbnvJekuitA/BWkBKCo
 qsN7cTlm7OY2hRiTAQmLfnUp5/8RZkKp3Z1cgY6qHSkU2RUHKqAoAI1oAj92qbp+41pe
 b6MjEliAQcKXdDVxBibvY1dzSUPVoAUuBdgwaCY1IAT2zds2yNeNwWnKqoWmVMTxDpmU
 Akl7TpvzvH5UZnc2SzUfp1e4+K8aIFpDLyllv88lW4vf7WvlidV+fOa2lO/WErCtz9Eb
 wrQ/xv8kRnYDHyi6GvBxmPENKiQuoaJ2MA8DAOb2WxOwi6mr7o/5gY81Y8VYrIQ0wr9s
 1piQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7FuTWq4BSG35jYcVC2y/aAokRjHupx3BOtYk6g9sB7k=;
 b=DIHhUCKJ4cXoTtWEzyLmsOqdLZgS0pUT6DR9bM60RBTRuOQn7s5mF4T7rh3RFYjGEI
 guFmkjIOFulRkzwaJS9jIrFNBsTeFuY2YthP30nwuqgWUw52FmV97xLNvY0JBiTklm47
 j40Dm5st66B5S+h5m4PFgkyd1Y3Xqtuve5fngRL0Em0uGiMWEsLcKHfSPVJdjgqjdtK5
 HEjNq6xKZOV+M0K0Jtx9jR5+FePYT3WWudqi5oXUvHJg+d9spTg7brP8yTbQ071dA+vp
 3W+yPnh4I9pmeuIJlRgur/91/BsCkN5D7X04YfL2YTg+f6bceEMhAIwDAyY53gI4lkGl
 LfoQ==
X-Gm-Message-State: AOAM531SozpSadq+7QLAOeHyfaEZttpXGNkUL3QkfjvlsNvhsmcNDXkv
 M8zhLn6ZXVnCs5fy3KsvUHs=
X-Google-Smtp-Source: ABdhPJwioSe6dJaxInh8X3IisG9hWd9obKO0KYfxQKA8qdRvbEI9nQjadusnXlOz4yN8QPtxAn5+Fg==
X-Received: by 2002:aa7:df82:: with SMTP id b2mr21560851edy.251.1605642316279; 
 Tue, 17 Nov 2020 11:45:16 -0800 (PST)
Received: from debian.home (81-204-249-205.fixed.kpn.net. [81.204.249.205])
 by smtp.gmail.com with ESMTPSA id w2sm727972ejc.109.2020.11.17.11.45.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 17 Nov 2020 11:45:15 -0800 (PST)
From: Johan Jonker <jbx6244@gmail.com>
To: heiko@sntech.de
Subject: [PATCH v4 0/7] Enable rk3066a HDMI sound
Date: Tue, 17 Nov 2020 20:45:00 +0100
Message-Id: <20201117194507.14843-1-jbx6244@gmail.com>
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
 drivers/gpu/drm/rockchip/rk3066_hdmi.c             | 272 ++++++++++++++++++++-
 6 files changed, 320 insertions(+), 18 deletions(-)

--
2.11.0

