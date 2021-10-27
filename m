Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 908A343CFBF
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:32:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 169301699;
	Wed, 27 Oct 2021 19:31:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 169301699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635355930;
	bh=Y7OlbI7dpHDSCTo/Pgfa3iE3fPseMCCntZQAERdVvkQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBp6Ioaw/ozZGcfuJD78KasZk+pWXxgillt8Qo+FRNglUNna9pNpXKJhMdUlMeK5K
	 NLRAYTkUQdEKijXTDo9PL5NeN+pVCIKYLCl9dCb+6Z77DNDs02WBVUImuY6YoxQBMr
	 a60SCEb4gDuzmRT9sxIX1LFyERuuXPXnr2x2qvrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 72D2CF804EC;
	Wed, 27 Oct 2021 19:29:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0819CF804E2; Wed, 27 Oct 2021 19:29:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 00CE6F80271
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 00CE6F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="pzhyuOtF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BAA86109D;
 Wed, 27 Oct 2021 17:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355752;
 bh=Y7OlbI7dpHDSCTo/Pgfa3iE3fPseMCCntZQAERdVvkQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=pzhyuOtF2kSfkguYUeCDve2b6DDJ+1oPGMusnd8sEKEIFT8KvYyV8stOhEjBVTi3K
 jmtd2o+NPmFgpJhUC5HuRnHtZxd+7oZwniTp/pZZ9MHrqoi2o68b1hkEMIMy+R61za
 WPXybtsyo6bXoe4TNFOTIPe/JFDHjGAgamCqbwTwPhrxeGrXhapWIBdZU0Nvh7VAyr
 9TE4z6OVRVZQM2F0dRXxZ2TTdhgucU/0zlB84EOI1fRGO6RACYkGA9KP0j1a4ZktAy
 44Co0TmoUwnLaOCYdA7Fs3MDHkUGXbV+WUaBRqBPpgapKQWayzc8MZSgNrOe40TwSy
 3pXmersxPhOLA==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
References: <20211025185933.144327-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/8] ASoC: minor cleanup of warnings
Message-Id: <163535575198.4012075.17769018172349090714.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:11 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de
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

On Mon, 25 Oct 2021 13:59:25 -0500, Pierre-Louis Bossart wrote:
> Sparse, make W=1 and cppcheck all report minor warnings.
> 
> The only functional change is in patch7 where the error code is now
> returned to the caller.
> 
> Pierre-Louis Bossart (8):
>   ASoC: topology: handle endianness warning
>   ASoC: rt5682s: use 'static' qualifier
>   ASoC: nau8821: fix kernel-doc
>   ASoC: nau8821: clarify out-of-bounds check
>   ASoC: mediatek: remove unnecessary initialization
>   ASoC: mediatek: mt8195: rename shadowed array
>   ASoC: mediatek: mt8195: fix return value
>   ASoC: rockchip: i2s_tdm: improve return value handling
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] ASoC: topology: handle endianness warning
      commit: 1baad7dad115ea3976fb5e5d0e3f3bec83dfd7ca
[2/8] ASoC: rt5682s: use 'static' qualifier
      commit: 49ba5e936e1512d4c7812d433048f8909234fca0
[3/8] ASoC: nau8821: fix kernel-doc
      commit: 765e08bdc7faa44b13bf96df4663a580d68a1c49
[4/8] ASoC: nau8821: clarify out-of-bounds check
      commit: 46ae0b3f554a323322a770c0edee50aa8019a655
[5/8] ASoC: mediatek: remove unnecessary initialization
      commit: 33fb790fcc02a717c1cac90958f203f06da14f7e
[6/8] ASoC: mediatek: mt8195: rename shadowed array
      commit: 73983ad922764e747d40b486ec7c2526e0355db1
[7/8] ASoC: mediatek: mt8195: fix return value
      commit: 439c06f341aa1f09ad7def774998db1076946c98
[8/8] ASoC: rockchip: i2s_tdm: improve return value handling
      commit: f913582190ddfe2380ecf8ee87b4ff2c8dcb5d48

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
