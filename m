Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F9624D28
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 22:37:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A365D1673;
	Thu, 10 Nov 2022 22:36:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A365D1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668116265;
	bh=dxe+GIjKXtd9ZijX1nvmNwvHzd7h4ssKNL0fXojrTW0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LsFtBb2X1gClmLGn9OJ96DlSNsxMOgbCLGGmPIB5xfUmoRN3JV6TlQLhNjjJHmTLV
	 ImUcdo2lIYZYUYGf5PkbivajWcmCHBKICn1IWVR36iEJdajIEHXQxJndUfXoC/FuhD
	 J5p27ZQU0cUN9JmPshZtq/Nsk69A1PWpevamVw88=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D025FF804FF;
	Thu, 10 Nov 2022 22:36:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE1A5F80114; Thu, 10 Nov 2022 22:36:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 31776F80162
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 22:36:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31776F80162
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="byjDznbS"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 331DBB823A0;
 Thu, 10 Nov 2022 21:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB85C433B5;
 Thu, 10 Nov 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668116179;
 bh=dxe+GIjKXtd9ZijX1nvmNwvHzd7h4ssKNL0fXojrTW0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=byjDznbSMjGoD0JMO0wv5616TytfFIZwLfEhThsJ2DyReWalmod7txmJCU/aBWEIX
 wZNQMEhi0WuNDexC42AmoRNNDTpdQPSpy0qLJF01BHa1GIM/sdo4IEeQ5JelMJ9AU9
 9hcUenhI+3L5aXmZg42w9yCDiRQmEeAyX1zWHGf2NZusxafxyiWFnwuvgP7vd+IrLV
 Dn75IPloNvZS97s/tYmYCq5q7aRIElNKa4qIv28Ibr3LhX9f5VJ1Q7fwPYADpozOdP
 O7MQ69YbXGwsy+gLJeCF958/AcgUYP8TmUvvOEb+OftImmoY9cdtFSPI9cVwVerAkz
 0M509VpiYmkzg==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
 Colin Ian King <colin.i.king@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sameer Pujar <spujar@nvidia.com>, 
 Jaroslav Kysela <perex@perex.cz>, Thierry Reding <thierry.reding@gmail.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221108111340.115387-1-colin.i.king@gmail.com>
References: <20221108111340.115387-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
Message-Id: <166811617747.1093199.5048769698185581160.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 21:36:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
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

On Tue, 8 Nov 2022 11:13:40 +0000, Colin Ian King wrote:
> There is a spelling mistake in struct member fliter_structure.
> Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
      commit: f8dc9cd92fe218aa1d8720e1105c542dcd3e58f2

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
