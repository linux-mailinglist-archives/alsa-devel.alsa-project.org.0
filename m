Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8858E459
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 03:09:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9360A84B;
	Wed, 10 Aug 2022 03:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9360A84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660093778;
	bh=gDpZ800zuPi6XDQp4C0dv++Rl8lv0u6lVZ0kAvYcyxo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DIhkyxfOiVgPdMluWakuZdZEX5yWiNW9izD3kQTf2z38sfkmlvp5C4RsgJ+Sv22/4
	 kYtoxLrVa4fIqFC9z8QrKHSK5hyHCIEsRV3prMthn8BekQKspKP+gkodSBjeiKPRfx
	 H5PhaLFhR4QineikSjP6xU7yItWsE1BChZOLFpZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EDE2CF801F7;
	Wed, 10 Aug 2022 03:08:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7ABB8F8016C; Wed, 10 Aug 2022 03:08:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFB82F8012A
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 03:08:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFB82F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="I4WtNltD"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78ACD6120A;
 Wed, 10 Aug 2022 01:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B7DC433C1;
 Wed, 10 Aug 2022 01:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660093711;
 bh=gDpZ800zuPi6XDQp4C0dv++Rl8lv0u6lVZ0kAvYcyxo=;
 h=From:To:Cc:Subject:Date:From;
 b=I4WtNltDw7RjbFxENBifLW3+OiG8lw8/Jz0a0jrR+uwxaw+8zEaf9DLpCYzlDEyo6
 5jRb7tJkSBdGG+a8nW3sSZ+Q3T3kMFgtjcb9J1yeP+FWTQRhLHNEUpvIc5AnKBMl7u
 JB80tzys/ze1IShnCWVO/W02G11gRfQesIKCOx15HyD1QmW58+zF9hIs2O/1q0tprI
 Uzt3W2bIPw9CPvO/tw0Yf6RJG0sFRjfGF7Q/33jrCgjb8TEW2abYzNs1xbMZrAM6+f
 s3tsJt71azux//4MTS3/Bx9AE+SIHTPQwMKd7ghf7uPsw/2Z4KtuvS0OCz82nuCkze
 SCdcuNkOjIGyQ==
From: Nathan Chancellor <nathan@kernel.org>
To: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
Date: Tue,  9 Aug 2022 18:08:09 -0700
Message-Id: <20220810010809.2024482-1-nathan@kernel.org>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 linux-arm-kernel@lists.infradead.org
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

A recent change in clang strengthened its -Wbitfield-constant-conversion
to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
only be 0 or -1, not 1:

  sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
          dev->gclk_enabled = 1;
                            ^ ~
  1 error generated.

The actual value of the field is never checked, just that it is not
zero, so there is not a real bug here. However, it is simple enough to
silence the warning by making the bitfield unsigned, which matches the
mchp-spdifrx driver.

Fixes: 06ca24e98e6b ("ASoC: mchp-spdiftx: add driver for S/PDIF TX Controller")
Link: https://github.com/ClangBuiltLinux/linux/issues/1686
Link: https://github.com/llvm/llvm-project/commit/82afc9b169a67e8b8a1862fb9c41a2cd974d6691
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/atmel/mchp-spdiftx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 4850a177803d..ab2d7a791f39 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -196,7 +196,7 @@ struct mchp_spdiftx_dev {
 	struct clk				*pclk;
 	struct clk				*gclk;
 	unsigned int				fmt;
-	int					gclk_enabled:1;
+	unsigned int				gclk_enabled:1;
 };
 
 static inline int mchp_spdiftx_is_running(struct mchp_spdiftx_dev *dev)

base-commit: 15205c2829ca2cbb5ece5ceaafe1171a8470e62b
-- 
2.37.1

