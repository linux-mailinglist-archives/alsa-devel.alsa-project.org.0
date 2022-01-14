Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8D848F2C5
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jan 2022 00:03:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ADE41F5A;
	Sat, 15 Jan 2022 00:02:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ADE41F5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642201419;
	bh=pmCJdziAEPBdQY4V0iAR4auB8lbMXcP3bPpKBBHtHO0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GOYcNqYyzSK7acmXfQzw1ePDzm24w1Ewsc1yUjDPMKhxXITYjdtA3oITbM1L1EFoX
	 vAa57j4ZsDd0r4MRLv/YYbV8pOQvSVdEtuBmikH96ZcvS9fG0luexM7XkEKhVOK9qe
	 gC+QVbb3bdxUTD5T0nd/6LgeArvI27D2iGedJbYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE7CCF80310;
	Sat, 15 Jan 2022 00:02:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B6CFF8030F; Sat, 15 Jan 2022 00:02:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5D67F80054
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 00:02:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5D67F80054
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="RlhP0wuS"
Received: by mail-pg1-x535.google.com with SMTP id f8so3915114pgf.8
 for <alsa-devel@alsa-project.org>; Fri, 14 Jan 2022 15:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVKiFbTgrN+4dfFsvMUyjh+c0889xN5w0pTkQdz39q4=;
 b=RlhP0wuSMGhXyZ0phG35Nuw+vFNDE+c2d0FJlvmi0+5DgQ5O5JmdPQeR7DqGCdMJCC
 /VlrAAmzilfFOfy2kC38ITfTjtJpZv4kTsfB7s/L1ganW6OWvpHUVXoHEafET0oHBu4M
 Ppj9Vq7LGVUguy0vkS7dCTqHlj8W7ppW3F7jo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BVKiFbTgrN+4dfFsvMUyjh+c0889xN5w0pTkQdz39q4=;
 b=1HrKV8MHsCQtLq+Z3Kl2nTqUPaPnR4j6kDhlLFco8nMuGT27p2wQp8gk0+BzEvgEqA
 OgMtofrie6x8MBWOMyX/9VMrNTDg/F7aPiisFUxSYK31DmU3kAV1OJW4z/FtV2AvxIMi
 pZAE4enr+gacBCmJqQi/icuDXpUgHCKVuCoVJiU7AI2cZ7Ug/Dw1z1UJmADsRNLeJkGm
 Wkmjv3A1iebAKBpPaypWU4Ts1qmIdn5nPMtregcTzz99S3za6IJXZYsJ6ycVHlXF2BAu
 Fljfsjb/m14XrHpQRqpRYq9fM2INBc0eAk3uVIumJWrKVpUKWbnUNTUsNGbhzgI1LEY4
 1xUg==
X-Gm-Message-State: AOAM530vXl/KYGHUbZGCjDcWAR5dcouaR7XCdXvwThJ0BsAQBuyBIQ8p
 Y2y7vvAlNBmhtowTGjPNZx8KtA==
X-Google-Smtp-Source: ABdhPJygQAhOjz++7gMBKAe+FDohBuatX363kR5ClyepF85gLiZS7G/unLnFqdy+/LSmnjDXX93GWQ==
X-Received: by 2002:a05:6a00:890:b0:4bd:347d:8aaf with SMTP id
 q16-20020a056a00089000b004bd347d8aafmr11000008pfj.61.1642201345551; 
 Fri, 14 Jan 2022 15:02:25 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id c10sm6750264pfl.200.2022.01.14.15.02.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 15:02:24 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/3] (Re)enable DP/HDMI audio for RK3399 Gru
Date: Fri, 14 Jan 2022 15:02:06 -0800
Message-Id: <20220114230209.4091727-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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

This series fixes DP/HDMI audio for RK3399 Gru systems.

First, there was a regression with the switch to SPDIF. Patch 1 can be
taken separately as a regression fix if desired. But it's not quite so
useful (at least on Chrome OS systems) without the second part.

Second, jack detection was never upstreamed, because the hdmi-codec
dependencies were still being worked out when this platform was first
supported.

Patches cover a few subsystems. Perhaps this is something for arm-soc?

Changes in v2:
 - (Un)set pinctrl, because the default assumes we're routing out to
   external pins

Brian Norris (3):
  arm64: dts: rockchip: Switch RK3399-Gru DP to SPDIF output
  drm/rockchip: cdn-dp: Support HDMI codec plug-change callback
  ASoC: rk3399_gru_sound: Wire up DP jack detection

 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi | 17 ++++++++----
 drivers/gpu/drm/rockchip/cdn-dp-core.c       | 28 ++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h       |  4 +++
 sound/soc/rockchip/rk3399_gru_sound.c        | 20 ++++++++++++++
 4 files changed, 64 insertions(+), 5 deletions(-)

-- 
2.34.1.703.g22d0c6ccf7-goog

