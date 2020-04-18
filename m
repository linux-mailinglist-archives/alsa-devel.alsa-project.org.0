Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2465E1AEEE9
	for <lists+alsa-devel@lfdr.de>; Sat, 18 Apr 2020 16:41:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2021665;
	Sat, 18 Apr 2020 16:40:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2021665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587220875;
	bh=rcWOe7r77y1R4Abbuw51f1OgeirTlxnjmN7AcYzmnUg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i2ChlFffKlsGtO/ejyQgSkssnPeIT1BoYqwiUfE9IdjVm+eodlblKliBxZykiidID
	 2gtR/BW1xq6Kg3eudltmNtPN2mSIXAj7+E7aicRTq7jD61RQktIlaN3kAiiw1eI/XP
	 QiwDk34ARUb7NiLmiVWmKwuEXPf/8aGfPcnvpgvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7BA6F80240;
	Sat, 18 Apr 2020 16:39:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3824BF8016F; Sat, 18 Apr 2020 16:39:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D548F800E7
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 16:39:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D548F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="E9cA2LGc"
Received: by mail-wm1-x344.google.com with SMTP id z6so6021394wml.2
 for <alsa-devel@alsa-project.org>; Sat, 18 Apr 2020 07:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stLQlVuh4P5IJ5M0lj4/6uAQgTyw/bQBI8ltWxyZDXo=;
 b=E9cA2LGcfpwjWkWL0LUCKY8rmu73mUw4/VIbbjYfLKPQwuWP9GEU6t7ShXY0UXKUmt
 Z8fXWZurPul5Q9s9FOLmzG8iSW+h9wQGvfq/Vay0WY8Wa7Tz8vb4B2JnsAmuQHQQIOzr
 jW2PHrACksVjQkQZd1h+cahQd+HTFKynZObqNlHA6BRUDaM/67kufXqd5vmEIFB3F5D+
 T9p3+9Gkb010F2QJ0jY8Z9vjeEEAtCmOftABQtUOWhaWfAQdnBRi/2pOiSBw4FqLeuFj
 Pr9VnRQ1cMPsoNr7KfX6BwqUkMOg1kFog4UDIjA0Qum20JgQHo2GbTunOfUK9YQa+HjZ
 yB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=stLQlVuh4P5IJ5M0lj4/6uAQgTyw/bQBI8ltWxyZDXo=;
 b=hTEkvP3LGISTNwi41EQHktbrthnhdZ2KDi0lvFnRRB3LdUcubZOJKG4ybZtfZmQ31A
 h+HJnr8vX2ue3K8p+mjMwi4PXbHi2wfvTRkItVmnXxaa6QGe4ANivi5cQacaOgYhlPdy
 BAF7terOiwzb3cLM8ruM9+vwO3MwmEHE64ks6XkxNDOQzhV2Cz2nmTBTaurPefrv6128
 Tvixn7sMj+6NdueEZ1mhz40ykHdlbjsNPq/2di/gxuAIVwHSjNON/Fm0A2EzM/HCQLnF
 N9j0MHZNtDc3Dtv0i2Pr2kzfw6C3of0SFMaTt8iNGKFnm294xOVtNVS+bJ1OF0LEooik
 DzdQ==
X-Gm-Message-State: AGi0PuYeR1LYlBTIw1bbRNOD3zfs5TFQYN6tVS++hC7xslmw+qgcZJAe
 DcjWD6/usaUvLKR1nQ9yztU=
X-Google-Smtp-Source: APiQypJgp3beoqLe7KxcrcgO1iEb5Zi5/JPSvihpkv2bGufse5QTbKlcUIFXicuNuiKrgQXX+QJ18g==
X-Received: by 2002:a05:600c:2255:: with SMTP id
 a21mr8551841wmm.150.1587220767261; 
 Sat, 18 Apr 2020 07:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:4e7:1fdd:b7c2:b3ab])
 by smtp.gmail.com with ESMTPSA id
 s9sm25375322wrg.27.2020.04.18.07.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 07:39:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 0/7] Add H6 I2S support
Date: Sat, 18 Apr 2020 16:39:16 +0200
Message-Id: <20200418143923.19608-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Hi,

This is a sequel of Marcus Cooper serie[0], where remarks made by Maxime
have been fixed.

I have tested it on my Beelink GS1 board.

Thanks,
Clement

0: https://lore.kernel.org/patchwork/cover/1139949/

Jernej Skrabec (3):
  dt-bindings: ASoC: sun4i-i2s: Add H6 compatible
  ASoC: sun4i-i2s: Add support for H6 I2S
  arm64: dts: sun50i-h6: Add HDMI audio to H6 DTSI

Marcus Cooper (4):
  ASoC: sun4i-i2s: Adjust LRCLK width
  ASoC: sun4i-i2s: Set sign extend sample
  ASoc: sun4i-i2s: Add 20 and 24 bit support
  ASoC: sun4i-i2s: Adjust regmap settings

 .../sound/allwinner,sun4i-a10-i2s.yaml        |   2 +
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |  31 ++
 sound/soc/sunxi/sun4i-i2s.c                   | 286 ++++++++++++++++--
 3 files changed, 295 insertions(+), 24 deletions(-)

-- 
2.20.1

