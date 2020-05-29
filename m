Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FD41E8421
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:55:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29D6617B4;
	Fri, 29 May 2020 18:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29D6617B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771334;
	bh=CM8lMzcigJDeJNrpdnzh/BYaIp1O0I07VF67/OQDqIQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QReRM+Kj4mLRLiDVjtPld28TrnKvAxLcSPgtClIYMXDxV0TBZfR+O7JHGy4hyy4K0
	 0Bh5x8916bwZSGDTa8n+p2KJuXiJSBMjRaMppSRyhmA0icKr5m0BbuncgWWCFsRcJ7
	 Ryo7yaE20TNXihpz1Xd99HtvGUSH0GTRuJK5B9EU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 553F4F802A7;
	Fri, 29 May 2020 18:51:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9760F802A9; Fri, 29 May 2020 18:51:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1884BF802A7
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1884BF802A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="dgr7442Y"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C02F207F5;
 Fri, 29 May 2020 16:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771092;
 bh=CM8lMzcigJDeJNrpdnzh/BYaIp1O0I07VF67/OQDqIQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=dgr7442Y1N0HHZZW6gdMDe5EEv8wEurjRkdRLERuu3V6CV+/bz80HHVXLCCZ2+jl1
 Gp5wQatYXP2lWtodeMDC1gzpiNO+2lom3AbQqdhwR87ADUyZugvh+pZu7SAbAE3yt4
 ZpcmGsUEwpj4KtM44aOfb4KO1a8BdXntbNfnHvlE=
Date: Fri, 29 May 2020 17:51:29 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, 朱灿灿 <zhucancan@vivo.com>, perex@perex.cz, linux-kernel@vger.kernel.org, tiwai@suse.com, alsa-devel@alsa-project.org
In-Reply-To: <ALMAWwB5CP9aAcKXCU5FzqqF.1.1590747164172.Hmail.zhucancan@vivo.com>
References: <ALMAWwB5CP9aAcKXCU5FzqqF.1.1590747164172.Hmail.zhucancan@vivo.com>
Subject: Re: Subject: [PATCH v2] ASoC: soc-pcm: fix BE dai not hw_free and
 shutdown during mixer update
Message-Id: <159077105221.28617.13718283164712388833.b4-ty@kernel.org>
Cc: kernel <kernel@vivo.com>, 王文虎 <wenhu.wang@vivo.com>, trivial@kernel.org
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

On Fri, 29 May 2020 18:12:44 +0800 (GMT+08:00), 朱灿灿 wrote:
> FE state is SND_SOC_DPCM_STATE_PREPARE now, BE1 is
> used by FE.
> 
> Later when new BE2 is added to FE by mixer update,
> it will call dpcm_run_update_startup() to update
> BE2's state, but unfortunately BE2 .prepare() meets
> error, it will disconnect all non started BE.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Subject: [PATCH v2] ASoC: soc-pcm: fix BE dai not hw_free and shutdown during mixer update
      commit: 68f8043ed13e636c6f04ac1c0831e17681d392ab

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
