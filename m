Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9814737C1
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Dec 2021 23:43:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3F24183E;
	Mon, 13 Dec 2021 23:42:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3F24183E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639435423;
	bh=dDQFAFUmTORVECs8IuRszmLZ6KqUu5Nfojvby5Bc3rM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YAzu7V6U2ywbGBQndWoH5ZuMQRGtwDNINZleZwLETWMbYGR2Ma/NEl15nw0BL3H04
	 ECNyCd+/5ERz8byOD9HYP8NQaOAVeaV6/yufrLEyLffiuipy7kdRneSvwC9h9nfLSX
	 Hx0wBUoUoy0O4xUNq25QSA2Ud6uOXhkg0ZF0XMTQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0261CF8013C;
	Mon, 13 Dec 2021 23:42:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35252F8025D; Mon, 13 Dec 2021 23:42:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C10A4F8016A
 for <alsa-devel@alsa-project.org>; Mon, 13 Dec 2021 23:42:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C10A4F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QUX9zrPh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D01D4B81670;
 Mon, 13 Dec 2021 22:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFBFC34600;
 Mon, 13 Dec 2021 22:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639435345;
 bh=dDQFAFUmTORVECs8IuRszmLZ6KqUu5Nfojvby5Bc3rM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QUX9zrPh31+XK+TMxIuA6+kPF4uIX6QRj1Q+26ETWZrZ6f0tcMg2/H94di7h0yysc
 zaiuMd3+xt5uNVevsiNk2yO7VUq6aL7Be/+Ho8zpUd4RMf09sqR7rSoHjJtJGZK/gc
 lwNs6cwupky48u1WEdk8toOE2bsgG74Yjnt6qZBKfxFwPk4GVcEfDCTgLR8HZe5hWL
 o+Rvh0hcd/oHuATZUnq1soZ/0+vH6ylr+PTcB8zIM0Si7RANNuKBkwMz25ZqTe+PqJ
 +izi4OUBUKxKNnPEflzaA5QjFIeFeA6CqGKWZdkxb4xb/k93Vg8OBNa473nURZldTN
 6JVzNqwWozF1w==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thomas Graichen <thomas.graichen@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20211211231146.6137-1-digetx@gmail.com>
References: <20211211231146.6137-1-digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: tegra: Add DAPM switches for headphones and
 mic jack
Message-Id: <163943534342.1012216.11678969524505932920.b4-ty@kernel.org>
Date: Mon, 13 Dec 2021 22:42:23 +0000
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

On Sun, 12 Dec 2021 02:11:45 +0300, Dmitry Osipenko wrote:
> UCM of Acer Chromebook (Nyan) uses DAPM switches of headphones and mic
> jack. These switches were lost by accident during unification of the
> machine drivers, restore them.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[1/2] ASoC: tegra: Add DAPM switches for headphones and mic jack
      commit: d341b427c3c3fd6a58263ce01e01700d16861c28
[2/2] ASoC: tegra: Restore headphones jack name on Nyan Big
      commit: db635ba4fadf3ba676d07537f3b3f58166aa7b0e

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
