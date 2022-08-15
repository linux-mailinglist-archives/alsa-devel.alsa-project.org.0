Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9CB593335
	for <lists+alsa-devel@lfdr.de>; Mon, 15 Aug 2022 18:26:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E1491607;
	Mon, 15 Aug 2022 18:26:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E1491607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660580814;
	bh=CQ8GnYQ4x+INFVVCSYPZ42+atVmQLvhXcUHF093NxoI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=amBCL8eDPslCxQu7jMMaEW18NAhlQnTItKgimo+IEuPciNxBcxh3m5EaNnoKCl31o
	 URaYY6X9I4fwF7aLn8gWB1MLVdPgmXvLjn3LaKQtjpi9d19tuqcetKOj0be4cMcKI+
	 1wmCxPkeyd2kCRWGxJ4RkbrgH86rLwKYPYAsRwOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88E28F8057D;
	Mon, 15 Aug 2022 18:23:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF305F805A1; Mon, 15 Aug 2022 18:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E46CEF80578
 for <alsa-devel@alsa-project.org>; Mon, 15 Aug 2022 18:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E46CEF80578
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Db3WCW7Q"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 520D3B80FED;
 Mon, 15 Aug 2022 16:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD978C433D7;
 Mon, 15 Aug 2022 16:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660580598;
 bh=CQ8GnYQ4x+INFVVCSYPZ42+atVmQLvhXcUHF093NxoI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Db3WCW7QvkizfRr3+w9C7o7vjJbRK9vF+ZSd23yZLdTZ/10gf0s8Pje+E39i0XbOX
 lg9eCSB6p505XCQ9VjqmBVkzEGmAmN5X+qjPQkJDrDEPHf0x7I/I9LsnRbrmrQzNr0
 PBtbtLM8cJwZI1bRn46zJkj/6tyu/74vsI7w7f5xg3xUpQQ88bqEvTdRS1kZPx+bn7
 rEoQGxuMNnCpmjt9RmSmSZoMIUTh065hDwct9yo4qKx7MdQn4mr+D641a7sMk9lqnH
 V607nOms2sSxp1ScIuqInvySqb4j6Mprows1oj/pBKxdrzzN40RAeycR4g4S5C3nlE
 W5NhUgBLJtqFw==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220810010809.2024482-1-nathan@kernel.org>
References: <20220810010809.2024482-1-nathan@kernel.org>
Subject: Re: [PATCH] ASoC: mchp-spdiftx: Fix clang
 -Wbitfield-constant-conversion
Message-Id: <166058059542.769843.4941839393289864947.b4-ty@kernel.org>
Date: Mon, 15 Aug 2022 17:23:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: alsa-devel@alsa-project.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Tom Rix <trix@redhat.com>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org,
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
      commit: eab9100d9898cbd37882b04415b12156f8942f18

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
