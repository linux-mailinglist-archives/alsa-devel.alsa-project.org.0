Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043F9280A89
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Oct 2020 00:50:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 885AA1AF6;
	Fri,  2 Oct 2020 00:49:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 885AA1AF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601592644;
	bh=5wbAsBc6F+A6i8ZNRWp9o2yFaL1jRl0UihqKMbzcWy4=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5r3dDbc61KFik0v3gyCMWf/ssUzRSUJN/aN0mBWHnkxlVAReJzGXMHa39wWaqCyL
	 e/cNfP9koeT1zTTEhO88Jtq1Ehx9/KhgyTvR7Em9dyPvVj2dQee8pybZ9O6xnT1bIV
	 8jCAzCAVp8i5Rxch62jjsxeu/wJIJj5b6vxUnMc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE9B8F802E0;
	Fri,  2 Oct 2020 00:47:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A80CF802DF; Fri,  2 Oct 2020 00:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF92F800AB
 for <alsa-devel@alsa-project.org>; Fri,  2 Oct 2020 00:47:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF92F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Sy0mxeYX"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D7A020739;
 Thu,  1 Oct 2020 22:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601592449;
 bh=5wbAsBc6F+A6i8ZNRWp9o2yFaL1jRl0UihqKMbzcWy4=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Sy0mxeYXKJQmlmjVKauRjRW0Frq9VJL077lN1dq6t6kA3PeDiA4+mqxcuKFAP2QUx
 bIqBtV6MJfSHWI/fjBsgp/LuQVx7uP4FARetcUH89a0ch1r7X/g6onxZQJbDebUWKp
 P9gVLiyVpYd+n4VlRg6OI7rVeY1eSm9mO/xlQv9E=
Date: Thu, 01 Oct 2020 23:46:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Qinglang Miao <miaoqinglang@huawei.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20200929112936.47441-1-miaoqinglang@huawei.com>
References: <20200929112936.47441-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: tegra: tegra_rt5640: use
 devm_snd_soc_register_card()
Message-Id: <160159237544.44588.2378133228066985986.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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

On Tue, 29 Sep 2020 19:29:36 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: tegra_rt5640: use devm_snd_soc_register_card()
      commit: c859926abc8ebc0562a16a12b4993eab690c2281

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
