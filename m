Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9E62B3708
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Nov 2020 18:11:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADBB9179D;
	Sun, 15 Nov 2020 18:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADBB9179D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605460302;
	bh=fee1rS1X9ukahSpmLtq+PGaQQ1AAS2rXNMd0fRThlYs=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ONoUNDxvrtptHIpArex9KsEVYXp7vHpaWr5tYVLyCT+Wnu0Pr1npMePixTTElXSM2
	 YMeJj/+c7541/s4jyEVFv/igw0ANN8o35DIsroX5W7+ec/xvowO26IE5XgnMxAbbn2
	 0HO3J5X4hgRng0xpVSFVGtm9ql66M6cgO4PP6Ols=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 242D3F801F9;
	Sun, 15 Nov 2020 18:10:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C5CDF801F5; Sun, 15 Nov 2020 18:10:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 40666F8010A
 for <alsa-devel@alsa-project.org>; Sun, 15 Nov 2020 18:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 40666F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AnQeEgA9"
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch
 [84.226.167.205])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 959FA221F9;
 Sun, 15 Nov 2020 17:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605460198;
 bh=fee1rS1X9ukahSpmLtq+PGaQQ1AAS2rXNMd0fRThlYs=;
 h=From:To:Cc:Subject:Date:From;
 b=AnQeEgA9bNSfhvUCOS3w3bCa8X0kwOcYH0QB3FMsiNa2AEYHo4IWcCZgbVcUFzZEK
 Fyib85P/hVkKknFKsgPJdQ39r5/4wJ3jXrdYUjs0aKFiPaVvUMcB2bsoEJzhfwXQhY
 X7r4oFKQ7bcvRYg6550q2TciSAaeVEs90nDg9P10=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-media@vger.kernel.org,
 devel@driverdev.osuosl.org, alsa-devel@alsa-project.org
Subject: [PATCH 0/3] clk/sunxi/media: Fix builds with COMMON_CLK and
 HAVE_LEGACY_CLK
Date: Sun, 15 Nov 2020 18:09:47 +0100
Message-Id: <20201115170950.304460-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Krzysztof Kozlowski <krzk@kernel.org>
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

Multiple configurations create unbuildable config by selecting
COMMON_CLK and HAVE_LEGACY_CLK.  The first simply should not be
selected.

The patches 2/3 and 3/3 address this specific problem.  I performed few
compile tests and I am still building other configurations, therefore
they were marked as RFC.

Best regards,
Krzysztof


Krzysztof Kozlowski (3):
  clk: fix redefinition of clk_prepare on MIPS with HAVE_LEGACY_CLK
  ARM: sunxi: do not select COMMON_CLK to fix builds
  media: atomisp: do not select COMMON_CLK to fix builds

 arch/arm/mach-sunxi/Kconfig           | 1 +
 drivers/clk/clk.c                     | 4 ++++
 drivers/staging/media/atomisp/Kconfig | 2 +-
 sound/soc/sunxi/Kconfig               | 2 +-
 4 files changed, 7 insertions(+), 2 deletions(-)

-- 
2.25.1

