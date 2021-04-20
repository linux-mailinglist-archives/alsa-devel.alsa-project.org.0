Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C9365BE5
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Apr 2021 17:09:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 987141691;
	Tue, 20 Apr 2021 17:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 987141691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1618931341;
	bh=notO+AX1S6KlITWxKZbYDRxBIOFZVLI6wIZs30gVzzE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BpVZPKlSAlBfRihRfamqs9eknni9sGIZcVzczbqBkwz8m0CEIJkBWpLzaIIQ4xaSc
	 cgAkRSAnASwvrIYwFmqI5/f8XiH56vmGydWr/C+n9AppJZrvpJh8vKZ82DBQk/QH/n
	 jee63ax8Z53s0XL5w34wJDDzaiZli/9RqN3USgqQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AACA9F802C9;
	Tue, 20 Apr 2021 17:07:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D50BCF80273; Tue, 20 Apr 2021 17:07:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B07FAF800FE
 for <alsa-devel@alsa-project.org>; Tue, 20 Apr 2021 17:07:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B07FAF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="CuNiazsC"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 767E2613CA;
 Tue, 20 Apr 2021 15:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618931232;
 bh=notO+AX1S6KlITWxKZbYDRxBIOFZVLI6wIZs30gVzzE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CuNiazsCxauu6F9r5V/3s0aWzAlE8Abv5Iy5SdLLajuqTpNBCfwOti8jIsbrSyGm+
 9iCKELjPb1EGXbbSmlzHG/gFTxbKxelDVWcnZTYCMwX6Q/eaj2g3EeOoF1kthwnLfj
 55eXG0Dixk5p5ibsuYr2E/SHO1uSuGH6mqxLYOlJ6PGllcqlg0kB3+bY0RsLJo0MmK
 WrByw3DVK0w8cDoxl/y7Iw1fu2pkhyRUeBw+5ukJMmFMfm/9/YV9IN5HPOCRg68h8T
 wvf92dM1syfqCH21pSjAwBa6Jhl0Ff4vJChLuIFL94Dvj+3RBwcFRISPxUpMxBCm2p
 QlhAwg+5P3Jvw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: Allocate link info structure on
 heap
Date: Tue, 20 Apr 2021 16:06:39 +0100
Message-Id: <161893058718.55483.6897930067782163061.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210419164117.1422242-1-thierry.reding@gmail.com>
References: <20210419164117.1422242-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, alsa-devel@alsa-project.org,
 kernel test robot <lkp@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Jon Hunter <jonathanh@nvidia.com>,
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org
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

On Mon, 19 Apr 2021 18:41:17 +0200, Thierry Reding wrote:
> struct link_info can grow fairly large and may cause the stack frame
> size to be exceeded when allocated on the stack. Some architectures
> such as 32-bit ARM, RISC-V or PowerPC have small stack frames where
> this causes a compiler warning, so allocate these structures on the
> heap instead of the stack.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: Allocate link info structure on heap
      commit: ec1af6c64db94e4f24e53011a77b2bf2220ae000

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
