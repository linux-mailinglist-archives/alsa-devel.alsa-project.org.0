Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C726446982
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Nov 2021 21:16:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 564281699;
	Fri,  5 Nov 2021 21:15:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 564281699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636143365;
	bh=BfJkmp/zQUz58AjoefSLkKZ/YEytniomZ7ATR4zR/dk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jrokU6RyPgdW0nopuggMCmJQAasGXTds9C8GNnM1tDS8ZOGqoG32f/cjJFz3MBfZb
	 QEGnk0HHr9DiH81mhWBijIJEcljvydWaWZulDkFKjgq8BOnJYXzBjCJQ2N/KSiJ9hv
	 8jC587vTI8j1fENB3EolqvdYSGGDcvV2jEkCVZI0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD75F804B1;
	Fri,  5 Nov 2021 21:14:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDDD9F8026A; Fri,  5 Nov 2021 21:14:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06FDBF80148
 for <alsa-devel@alsa-project.org>; Fri,  5 Nov 2021 21:14:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06FDBF80148
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="neJH8bau"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95DD56108F;
 Fri,  5 Nov 2021 20:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636143253;
 bh=BfJkmp/zQUz58AjoefSLkKZ/YEytniomZ7ATR4zR/dk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=neJH8bauoAdPDOcCsijwl4LUlljFlHGa6hlx/RGRvD81oLSiHUFYAYb8vR1GLk3oa
 gCI2fpW3IGK0SWqCXJQCRkBzlCLrWA3aERn39UuttW4lrbF4CTYtknU0hepaXmpT7O
 G40+YRqq6hbCO2fs49deGTimDZThoqK8b8Besbj5hIT4XTsvXUGA4yuOR0+d8iY+Gs
 c/UozEcRJK4ywA6hxN9yOdUmeLCsca924RYw9Y9Ip2jZsKsXoesK3ndna+tbdap32t
 90PjjJOhw2VwMP7M/mveTlZpdwTkKkQdoiR6MLiIGVsQe4JdsRmTGbnWwgJnRQe7s3
 x3wFHU6rYk7iw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20211105152013.75252-1-angelogioacchino.delregno@collabora.com>
References: <20211105152013.75252-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8173-rt5650: Rename Speaker control to
 Ext Spk
Message-Id: <163614325129.3446536.8434137401670448140.b4-ty@kernel.org>
Date: Fri, 05 Nov 2021 20:14:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, tiwai@suse.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, linux-arm-kernel@lists.infradead.org
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

On Fri, 5 Nov 2021 16:20:13 +0100, AngeloGioacchino Del Regno wrote:
> Some RT5645 and RT5650 powered platforms are using "Ext Spk"
> instead of "Speaker", and this is also reflected in alsa-lib
> configurations for the generic RT5645 usecase manager configs.
> 
> Rename the "Speaker" control to "Ext Spk" in order to be able
> to make the userspace reuse/inherit the same configurations also
> for this machine, along with the others.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/1] ASoC: mediatek: mt8173-rt5650: Rename Speaker control to Ext Spk
      commit: 0a8facac0d1e38dc8b86ade6d3f0d8b33dae7c58

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
