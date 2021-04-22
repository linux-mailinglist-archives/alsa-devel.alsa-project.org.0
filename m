Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57436853D
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Apr 2021 18:51:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5745A168A;
	Thu, 22 Apr 2021 18:50:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5745A168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619110283;
	bh=zkr5DtGu2wFjDznQb02gU//n2iu4KCADiJe/Qwy1yFE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pfI/JIbDcXtxRWTtwbfAcJ9dpqyVyzjgR0+KW0oQHJVfR4RM3P9g0g2/HAG+1dVco
	 XaHuKsiD4WfXX0Zoc3TO4etMfw9a7S9yV/rGcqe4V3iYCp6nHv9p1EEnAiCVjHq9Xc
	 /4YEpyTs6RZLdo9ngYitsL7GJkqi4ROblq/NmW4c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 674E1F80278;
	Thu, 22 Apr 2021 18:49:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE2C6F80253; Thu, 22 Apr 2021 18:49:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1FFE5F800AE
 for <alsa-devel@alsa-project.org>; Thu, 22 Apr 2021 18:49:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FFE5F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="XuvbZNAV"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AE90613AF;
 Thu, 22 Apr 2021 16:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619110172;
 bh=zkr5DtGu2wFjDznQb02gU//n2iu4KCADiJe/Qwy1yFE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XuvbZNAVATSkzq0bJULF5Uhy3ZqFK2KkGwv+nXqHI3A9a65kKUiCJYagikq5Lz8nO
 /y/ifWnV9nHVSIeN+Zx/PX3hBva6dJPTJm6i8ILd5ujLSCdNpFbeyJ60eR7U59Yn5s
 zbeoES7J6CHqD6hXiV9b1ctJ+tt6HUfxHrmPm3ZlNSAxBXtOuK+D1OAY5YdZsOtxv8
 2l53IXY1Roqq66OGWCA1Udog5fxYMMNgf8fYac0LdSBU0wXZ3by4d/B+eYP9hj0rG2
 06GMK7chPQQGv+lk8fbUSZOJMte8ydcXvo9iYAiacmAkElrxEvDqOtGPDqxqLzaSi9
 xH6GMCkX01WKw==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Niklas Carlsson <Niklas.Carlsson@axis.com>,
 Jaroslav Kysela <perex@perex.cz>,
 =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
 Lars-Peter Clausen <lars@metafoo.de>
Subject: Re: [PATCH] ASoC: adau17x1: Avoid overwriting CHPF
Date: Thu, 22 Apr 2021 17:48:49 +0100
Message-Id: <161910991990.37460.17699154038867347176.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210422130226.15201-1-Niklas.Carlsson@axis.com>
References: <20210422130226.15201-1-Niklas.Carlsson@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Niklas Carlsson <niklasc@axis.com>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, kernel@axis.com, linux-kernel@vger.kernel.org
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

On Thu, 22 Apr 2021 15:02:26 +0200, Niklas Carlsson wrote:
> Configuring number of channels per LRCLK frame by using e.g.
> snd_soc_dai_set_tdm_slot before configuring DAI format was being
> overwritten by the latter due to a regmap_write which would write over
> the whole register.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau17x1: Avoid overwriting CHPF
      commit: a89f3a93cd20f77ac1f84089297258d4b409e280

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
