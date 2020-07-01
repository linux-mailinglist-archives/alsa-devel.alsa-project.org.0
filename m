Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E32AF211602
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:28:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FD701685;
	Thu,  2 Jul 2020 00:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FD701685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642538;
	bh=7xvA3cUAtWd0mO8KbivoOz3yDGmDmzbZ4IbXH/dBUFE=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RMwu9FnzXgYckoLOkR+srjVbkRh+nFZOEKUsfE3pYuiL++Yzi/e1N19BZlIYPlFEA
	 9ARlAUUWLY+MstiSiC4An60N1ChnOB0mdR6lwS2CM3bIZbO3FMJswDH6MAnLf2QswY
	 ghByI05TDCIvqN2cEKO2W7qcGuIMdM3Ido/XAmjE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C287BF80306;
	Thu,  2 Jul 2020 00:23:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07F6EF802FD; Thu,  2 Jul 2020 00:23:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E06DF802FD
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:23:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E06DF802FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fRk5UD+s"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8A08120780;
 Wed,  1 Jul 2020 22:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642198;
 bh=7xvA3cUAtWd0mO8KbivoOz3yDGmDmzbZ4IbXH/dBUFE=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=fRk5UD+sxhWB/hiPkkJtu4ozNr1sT9itXDqqk6wwwJqlUCl4UX/yQFGyudO8Yn4s6
 21LTjs4VK6aivMoCvgkqyVYQhQVYviLEfIlD8KLRYLxVcz+L7mmV1ErwwMkh8r5nNz
 Tl2HzIB8lCJjTguZDnkMD0CrZRxR52FJmWTKa5kc=
Date: Wed, 01 Jul 2020 23:23:15 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
References: <20200701183716.83314-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 0/2] ASoC: Intel: atom: fix kernel-doc and W=1 warnings
Message-Id: <159364215575.10630.1416175564616167123.b4-ty@kernel.org>
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

On Wed, 1 Jul 2020 13:37:14 -0500, Pierre-Louis Bossart wrote:
> Yet another series to fix broken kernel-doc and mark unused variables
> as such.
> 
> Pierre-Louis Bossart (2):
>   ASoC: Intel: atom: fix kernel-doc
>   ASoC: Intel: atom: fix 'defined but not used' warning
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: Intel: atom: fix kernel-doc
      commit: 11013884025044374ee6222408f67ec518831353
[2/2] ASoC: Intel: atom: fix 'defined but not used' warning
      commit: 544079abf603bf7823453748285b7cc048b09a9f

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
