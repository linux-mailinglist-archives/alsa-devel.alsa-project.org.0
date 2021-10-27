Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2236143CFBD
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:31:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7683816B4;
	Wed, 27 Oct 2021 19:30:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7683816B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355885;
	bh=ktlPmVCSuV7Ef/nALqcRLnbx6/f5ml2xH/fYWgAsxJc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LWSCf0SkUSmiJpwCuUL3IPHzJLWMK2GulmNqZhfwl5DWj0nv/kE+WBA/4YuiYNk3O
	 ZJtgCYHIR7gPXwmVmEQxLW3GgarzSNlLP/NuqHlrrenC6t7Sqw9yi/nLASDHAdUMsW
	 HgeRf8naScZ/h0xhBkkN5UsgRsuYz3N1AscyOm0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3CEDF8032B;
	Wed, 27 Oct 2021 19:29:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66D05F8027B; Wed, 27 Oct 2021 19:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63E4FF8016C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63E4FF8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pL0ARhvI"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 77B9E60E78;
 Wed, 27 Oct 2021 17:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355751;
 bh=ktlPmVCSuV7Ef/nALqcRLnbx6/f5ml2xH/fYWgAsxJc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pL0ARhvIuTDpnZzTHvC37mnkGGdIh6TCsLk9wndwACPfzHaIB2ZwjWFPuOZdQeW7S
 K2bSQzhP+yF/71gLYN3IYgJ0Un1DU4U5F3sx3Bzafrm8YuXEUyuTkZdXQa0Sll8AYk
 NuzSIJlpZqQFUo3R8ES7+wNZGlMvKJhhXMZxBX2ICwqkcMi8RJP1bSYn+PEfitmcCW
 Q71efwCnNZzfO8vL8tH34Fkt1Pvx2sWc7rNKaeOlNcNjtFBymz6CNbVaaBK3y8TwYK
 p+WSJ0rNsiCaE5UHvmQQg5ovJLgn8OZhfgTOuWMJsYgs7vD+exLf+r36YK70xsX8vG
 pWMq+MWdzp+JA==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 oder_chiou@realtek.com
In-Reply-To: <20211026081030.422481-1-angelogioacchino.delregno@collabora.com>
References: <20211026081030.422481-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: rt5682-i2c: Use devm_clk_get_optional for optional
 clock
Message-Id: <163535575023.4012075.17015997876203514512.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, tiwai@suse.com,
 lgirdwood@gmail.com
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

On Tue, 26 Oct 2021 10:10:30 +0200, AngeloGioacchino Del Regno wrote:
> The mclk clock is optional, but it's currently using devm_clk_get:
> simplify the handling by using devm_clk_get_optional instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682-i2c: Use devm_clk_get_optional for optional clock
      commit: 709d297503e64ec3804b3b8150628656db164d4b

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
