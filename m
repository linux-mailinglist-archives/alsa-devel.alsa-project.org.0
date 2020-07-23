Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A3222B7AE
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:26:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE5C4168A;
	Thu, 23 Jul 2020 22:25:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE5C4168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595536002;
	bh=8vVstHmelPurjB9fC/bKrROk2yVRiPsYnXDY9xWfxhw=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AoWCkcNV/cWnbzovgNbCuwmhmWBZpqb63FnL1RoT3e7iHw0HMwFcqxm71pyx7XXen
	 i0Vva7s1Ij8ByVd+Po/sTTC5pseFDmRTZxJ24XKyVBXOis5TtOZyk52tNwKlKoaZFB
	 106y3ASBiWj/zizJfHkWCH3Lm66FNEb9LTvUaQy8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 916FEF80315;
	Thu, 23 Jul 2020 22:20:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4AAFAF80315; Thu, 23 Jul 2020 22:20:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8A65F80306
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8A65F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="sczQ0KmG"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B02CA22B47;
 Thu, 23 Jul 2020 20:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535637;
 bh=8vVstHmelPurjB9fC/bKrROk2yVRiPsYnXDY9xWfxhw=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=sczQ0KmG4tQUiep6/dyLHAfEuOKcO5yhRWt5UEqCpDLCjG3cSA+XUOEtbQDUetv/Y
 bQFrxThzdieUyKQNkww4fdKh8pfoHmID7LSMIyCppJ6ZDX0S2IWVMOpBt9ETNnIKz7
 J+8RPoXDPgAv1rrqnyQR4d4CXaxuzEb6SWgktypg=
Date: Thu, 23 Jul 2020 21:20:22 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, rdunlap@infradead.org, Sameer Pujar <spujar@nvidia.com>,
 geert@linux-m68k.org, tiwai@suse.com, lgirdwood@gmail.com
In-Reply-To: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
References: <1595492011-2411-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix build error due to 64-by-32 division
Message-Id: <159553557414.41908.1715197837491457325.b4-ty@kernel.org>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 thierry.reding@gmail.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

On Thu, 23 Jul 2020 13:43:31 +0530, Sameer Pujar wrote:
> Build errors are seen on 32-bit platforms because of a plain 64-by-32
> division. For example, following build erros were reported.
> 
> "ERROR: modpost: "__udivdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
>  undefined!"
> "ERROR: modpost: "__divdi3" [sound/soc/tegra/snd-soc-tegra210-dmic.ko]
>  undefined!"
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix build error due to 64-by-32 division
      commit: f9ec176cd684c83a60638123da0b34c7c82f0c74

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
