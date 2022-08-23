Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DBF59EB32
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 20:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FC3616A6;
	Tue, 23 Aug 2022 20:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FC3616A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661279960;
	bh=6b52WSZ0j72XRJq6uFTsXCAQc695XrtImOHOm6npeI0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HuhiLf6XY42uozNcSIXgO+nxjJ32nxfhWoBkRBFN1kV2BaKYkAxNh/s+KqebLbqWt
	 U/EkTcXGlCpMyrwmkh6FmQyBm6klbuHap4WcaR6W9JKJpozHwvsAVX0Pgf/PalM0Ol
	 QnnqYlBOX9ZGOQH8r74AyGEZP/XbTF05lcEYoO2E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CF66F80529;
	Tue, 23 Aug 2022 20:37:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 55046F8052F; Tue, 23 Aug 2022 20:37:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 94B3DF80526
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 20:37:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 94B3DF80526
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fCGqvlzl"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 406AFB818BE;
 Tue, 23 Aug 2022 18:37:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6CC433D6;
 Tue, 23 Aug 2022 18:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661279839;
 bh=6b52WSZ0j72XRJq6uFTsXCAQc695XrtImOHOm6npeI0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=fCGqvlzlZe5Fih2wiCo9XuQ6bZuWQpS4Fkb5U9T0AaZAfFtnkTftjnL8OvWZ29Asp
 WRTPf0O0fPAGBPJx6q1Lv0Z3hmboFJvyaFxbs5z0MTX/b7o74pGWz5HeJxdiwfy9n6
 ZkXthBYrOmT36MUgDa8PmrF/903ZpdwLG2J8uQPi89h7asbfIvWVJ9ryQAlVk0mQOa
 c+otNUMpaonl6T8AeR9I1YBiYmlcds+u4+kAwMC6BEo5L4/EGngyhSpy/Y/7kHtljd
 YM4G4eG7gDn1nVmor3ffibw/eIgQJdh2yKIOlnhYLF89o8KCBTHv+jgxZlM2IIKrhQ
 WZM6LZLiIS6Nw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
References: <20220810010809.2024482-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-Id: <166127983640.711152.15279532246364775048.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:37:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org, Tom Rix <trix@redhat.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
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

On Tue, 9 Aug 2022 18:08:09 -0700, Nathan Chancellor wrote:
> A recent change in clang strengthened its -Wbitfield-constant-conversion
> to warn when 1 is assigned to a 1-bit signed integer bitfield, as it can
> only be 0 or -1, not 1:
> 
>   sound/soc/atmel/mchp-spdiftx.c:505:20: error: implicit truncation from 'int' to bit-field changes value from 1 to -1 [-Werror,-Wbitfield-constant-conversion]
>           dev->gclk_enabled = 1;
>                             ^ ~
>   1 error generated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdiftx: Fix clang -Wbitfield-constant-conversion
      commit: 5c5c2baad2b55cc0a4b190266889959642298f79

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
