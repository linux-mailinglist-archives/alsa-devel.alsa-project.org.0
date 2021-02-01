Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0400730ACF6
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 17:49:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7AFF51728;
	Mon,  1 Feb 2021 17:48:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7AFF51728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612198143;
	bh=BYN4P1D4rCCkAfn2duFYF1Tx4dpo/sxwz9GZpqd6Qlw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JmYtSsrw7Sh1mebnztlgLyg4Ou8NiJBZx5gK1DqnH+UdENB0zl/MZREi3S7YKOtFL
	 +lu8fgLU5w2baoDSpSQsEzxBVC26Nyggo8iQ98mpCEZZCnKFlkhS4MrXVR/FEZaNB7
	 jhYOxweI6n8jZO4R7TnCv3l4MdTRdtJdtku4gCCo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEA3DF80234;
	Mon,  1 Feb 2021 17:46:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B6B4F80224; Mon,  1 Feb 2021 17:46:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6516CF800E2
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 17:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6516CF800E2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DZ+iSaq9"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D75164DE3;
 Mon,  1 Feb 2021 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612197996;
 bh=BYN4P1D4rCCkAfn2duFYF1Tx4dpo/sxwz9GZpqd6Qlw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=DZ+iSaq96VTB8qAtZSWN49K2u7fgM7Lr9aFt108RTS6WIxrnf95RSPs8WwZE+l3CA
 HPVcZg5aC7TmWnRNRiEbdFWUNqgejuF2HzjaCWAKUj79KIjqoSYuSd00AMXGImeeWX
 58UGCE/sn7pXy3yyskgkZNqq73YjlfrdLjRIC3nJhEGUPsEM9b4czxM2LBn5H54NU+
 FF1HuOO8550hbJI3b+PdNP2iOdn5sLohVtcGl58Q2IccN6n6fbjilBZYaDnAN/qxe7
 ZBvHvaOPeDJ5MM67nOrsWL2oibk/d5yLKr8m0hjEzUfAfgE7kLz8lqAehjTQXuoPZ2
 Rhwylk+veJkXg==
From: Mark Brown <broonie@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Sameer Pujar <spujar@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <20210129125915.2652952-1-geert+renesas@glider.be>
References: <20210129125915.2652952-1-geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend
 on SND_SOC_TEGRA
Message-Id: <161219793994.46194.18131030130174715049.b4-ty@kernel.org>
Date: Mon, 01 Feb 2021 16:45:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 29 Jan 2021 13:59:15 +0100, Geert Uytterhoeven wrote:
> Audio Graph Card based Tegra driver is only useful on NVIDIA Tegra SoCs.
> Hence add a dependency on SND_SOC_TEGRA, to prevent asking the user
> about this driver when configuring a kernel without Tegra sound support.
> 
> Wrap all Tegra sound config options inside a big if/endif block, instead
> of just adding the dependency to the single config option that does not
> have it yet, to preventing similar future mistakes.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: SND_SOC_TEGRA_AUDIO_GRAPH_CARD should depend on SND_SOC_TEGRA
      commit: e86caa011c80507783e5975bca1458f28c1d2b8c

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
