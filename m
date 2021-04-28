Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 081C536DDA0
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Apr 2021 18:56:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99B0E16D4;
	Wed, 28 Apr 2021 18:55:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99B0E16D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619628976;
	bh=afX80eTKphvREzmJ06cN4lmgX/5HQyII66qLFz6W0oA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dTddWCMaEevaL6r4XqWlXLaSYDcNt9S/EJZy4gfYu6wB1541fGWvE4TaBcABoNBwL
	 qN0C/vhGVhlNTCs9de7DV/1Z4PnfbCbTXRcMZNhYDrtkidFtkWj6qykksef2kXcJqy
	 FBkInvaBmXjpIApguzhVcM6OpmcFeTG6tQk6cUj0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B743F80224;
	Wed, 28 Apr 2021 18:54:33 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A5F8F8016C; Wed, 28 Apr 2021 18:54:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B30C5F8012A
 for <alsa-devel@alsa-project.org>; Wed, 28 Apr 2021 18:54:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B30C5F8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="E3oXKMUw"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7B2DC6143D;
 Wed, 28 Apr 2021 16:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619628866;
 bh=afX80eTKphvREzmJ06cN4lmgX/5HQyII66qLFz6W0oA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=E3oXKMUwn0BOGXkc+2ozbwCm4gi3vyc+KhLLAP31nBUf93FrhqIVvuYih2QLF/HD4
 ioczWWCOvpvDdbz3kIzhrfXb8eiMFHpmqHAvS8oBpODYHU4IYt4x7WQsB+ImG9//yH
 mUyje1nBjNpa89A2Xsh1GGhGDwRWWF4dVleLNcWzlyZ0Wg0oU+7UlIxE7M23E16VxH
 ia8hxwPz8ZY66PflpcL0/RSxTYNzovFPu1RsidmTUsFufyvVfUQPaR5H4EsC0/U52v
 KgjZC9oMXAQXqXW+I5JehnP7eKK/15lm3BgQqaPHMR/uXcOPSDRjgzZ8ZdqLWoaQxZ
 NHJyc0d64kiHg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] ASoC: Revert clk_hw_get_clk() cleanup
Date: Wed, 28 Apr 2021 17:53:44 +0100
Message-Id: <161962856274.49583.8078596005578732734.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210428122632.46244-1-jbrunet@baylibre.com>
References: <20210428122632.46244-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Stephen Boyd <sboyd@kernel.org>, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Wed, 28 Apr 2021 14:26:30 +0200, Jerome Brunet wrote:
> There is problem with clk_hw_get_hw(). Using it pins the clock provider to
> itself, making it impossible to remove the related module.
> 
> Revert the two commits using this function until this gets sorted out.
> 
> Jerome Brunet (2):
>   ASoC: stm32: do not request a new clock consummer reference
>   ASoC: da7219: do not request a new clock consummer reference
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: stm32: do not request a new clock consummer reference
      commit: a0695853e5906a9558eef9f79856e07659b7a1e6
[2/2] ASoC: da7219: do not request a new clock consummer reference
      commit: 97c733654ab4a5ac910216b4b74e605acf3e1cce

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
