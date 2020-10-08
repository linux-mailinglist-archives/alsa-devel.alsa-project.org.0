Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E45C287E85
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Oct 2020 00:05:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B46A51663;
	Fri,  9 Oct 2020 00:04:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B46A51663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602194748;
	bh=k1V6OrupLcNeNFQfLBLLBhRQBY/eVFlgP8hwmK08lew=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rGvaYHxw410OSVfEQOOMQr5i6Rv6sjh+u0iZTIoe28GDNGQiXgxEE03JFkz8jtXKL
	 wd4KAi31xvFisue2vRjkb4GTPTy+NYu2Y/MC9vDvVI3hQ79ucwLmX8L3gVpiJZysYc
	 AlLnUs8UnF/cn/xJyEfqHQoxCBz5ahQAWFnZup/o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C909F8026A;
	Fri,  9 Oct 2020 00:02:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BBE51F80279; Fri,  9 Oct 2020 00:02:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D7F5F8026C
 for <alsa-devel@alsa-project.org>; Fri,  9 Oct 2020 00:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D7F5F8026C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="rGx38ez9"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 707BC22244;
 Thu,  8 Oct 2020 22:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602194519;
 bh=k1V6OrupLcNeNFQfLBLLBhRQBY/eVFlgP8hwmK08lew=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=rGx38ez9zkZljUIwl/ogar/lEdyNl0R92nEog4pJVNEDupOGwLHMSdUOc3/WHy7xV
 +2O1yg0iUlpjW1vQ2PSqFOrSd/3OB3YSudfKsbdV3W1hV78M/gxICsEBuNbhhKjrM1
 G8f5PXfQhCeoom9JnaycsnZnxM1lyzQZGRlyvhmo=
Date: Thu, 08 Oct 2020 23:01:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Colin King <colin.king@canonical.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
 alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>
In-Reply-To: <20201006152024.542418-1-colin.king@canonical.com>
References: <20201006152024.542418-1-colin.king@canonical.com>
Subject: Re: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun"
 -> "overrun"
Message-Id: <160219448330.29664.4641489072692300066.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Tue, 6 Oct 2020 16:20:24 +0100, Colin King wrote:
> There is a spelling mistake in a dev_warn message. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"
      commit: 6db282c8a9edcbf84e699e45ec087baf07be2236

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
