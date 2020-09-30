Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB07027E81E
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Sep 2020 14:01:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367A917EC;
	Wed, 30 Sep 2020 14:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367A917EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601467310;
	bh=ISbLEyVRJ3YYEaL+4amU3UcxHwOFBV2/mqHOS1AZfTI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lFQJMwaW2SnFHaFGYooE7HTim7oorUPnypnfA4YwPkYlXLlx80ZVKQBUCubNqnjkn
	 1eMgDw8sJxxb5MHPXWp/j7lB2mMabn1A16Wk2pvumj0HUsaCTkD5i1gDHQ8bk1nOL3
	 ivk8ePEzPmtz6dG78SG1SA4ahpRjjjha8TIUI3u0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A14FF8023F;
	Wed, 30 Sep 2020 14:00:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2430FF8023F; Wed, 30 Sep 2020 14:00:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A4AF80110
 for <alsa-devel@alsa-project.org>; Wed, 30 Sep 2020 13:59:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A4AF80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Y0YyWw8C"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0584A2075F;
 Wed, 30 Sep 2020 11:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601467195;
 bh=ISbLEyVRJ3YYEaL+4amU3UcxHwOFBV2/mqHOS1AZfTI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=Y0YyWw8CNbpdLpMe9jELYNndvNBCi6BJ6iNkKosLBzcdgYLgxa52QqbefuxM4C38U
 DF5IjxxYkZVeAEN+2DPN0RL42nd7IEpt4BjtgCmdFNA2A0u4lAITSRUxIVffdERbaK
 vjttzXi8Gn4MD1G72UdvXWZnCjRi7iFd3ywEIn38=
Date: Wed, 30 Sep 2020 12:58:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200929112933.46977-1-miaoqinglang@huawei.com>
References: <20200929112933.46977-1-miaoqinglang@huawei.com>
Subject: Re: [PATCH -next] ASoC: soc-core: use devm_snd_soc_register_card()
Message-Id: <160146713690.40065.6936378045479268404.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 29 Sep 2020 19:29:33 +0800, Qinglang Miao wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: use devm_snd_soc_register_card()
      commit: ad61b78ea8913e5cf9c91f5527428eed1bd2a862

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
