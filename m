Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D451E61A1
	for <lists+alsa-devel@lfdr.de>; Thu, 28 May 2020 15:05:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DDF2417E0;
	Thu, 28 May 2020 15:04:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DDF2417E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590671134;
	bh=Cc7Ez2FTnEVe9mVi0XRAGO+B55CjnD6FpLRvrlsoSi0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MVp6Iy+gkpJHTkUPG42SQpsqmQfkwSGPqraPsje5OS7zc5nfu5vlihfP7pwMtXMqj
	 hgrQ/hIh1OQONv8cGMc3au9dXNpJDX3zfi6gBVxjknUZQm9LB0rQWyM+uBqbYxHhfF
	 oOpMVeEoX/oifFLS2ygTDexygdpTzTQEkD6fGg+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AB5EF802A8;
	Thu, 28 May 2020 15:02:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA95BF802A7; Thu, 28 May 2020 15:02:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6CCAAF802A1
 for <alsa-devel@alsa-project.org>; Thu, 28 May 2020 15:02:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6CCAAF802A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Hwjvmpet"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1AA38207F5;
 Thu, 28 May 2020 13:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590670943;
 bh=Cc7Ez2FTnEVe9mVi0XRAGO+B55CjnD6FpLRvrlsoSi0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=HwjvmpetjbwDwCZhm/gyi2wky783acBxHuHHtBg+4T0XeeqzP9cx11gl1G2oW7VNN
 9Njm0afft0CtUxKHf8hksNf5CcTVFwLzd7aE1c278stTLUuKohyEpRJJ/1ywnU6VTi
 zEN+YaByhAYaWFJjoiaSFBTkOwCHk9T4J0B/QdZo=
Date: Thu, 28 May 2020 14:02:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Chuhong Yuan <hslester96@gmail.com>
In-Reply-To: <20200528102004.911653-1-hslester96@gmail.com>
References: <20200528102004.911653-1-hslester96@gmail.com>
Subject: Re: [PATCH] ASoC: sta32x: add missed function calls in error paths
Message-Id: <159067091850.53762.2058034425301081343.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, 28 May 2020 18:20:04 +0800, Chuhong Yuan wrote:
> sta32x_probe() forgets to call undo functions when it fails, add
> the missed function calls to fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sta32x: add missed function calls in error paths
      commit: 8dc1011470315501914a4527276b7b93301f3d38

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
