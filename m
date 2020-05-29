Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8B1E8423
	for <lists+alsa-devel@lfdr.de>; Fri, 29 May 2020 18:56:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58A9B177C;
	Fri, 29 May 2020 18:55:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58A9B177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590771375;
	bh=wDOgXiUXzoQ6Bq5OMWIXk6kS9dOgRJeZtkbpCNUiQCU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vLl8808yL0LplEHs7ScYiZLHVqIenqOuQ56fkEMZwR6Z3swHiYkJCHVXTXXUfGa6C
	 W8K/rX9gOUrDionSTx/TlHlUE7+LzdYKbfxhLSXMuSIgtq6MzvAH1Ao8sl4kPG4QSC
	 hcvNLbj9H5BMQBVbAL0RggXJHCIbwxLW7cbqDnt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9DFF0F802E0;
	Fri, 29 May 2020 18:51:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A021F802DF; Fri, 29 May 2020 18:51:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 901E1F802BC
 for <alsa-devel@alsa-project.org>; Fri, 29 May 2020 18:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 901E1F802BC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lRjSuEGg"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 913C820897;
 Fri, 29 May 2020 16:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590771099;
 bh=wDOgXiUXzoQ6Bq5OMWIXk6kS9dOgRJeZtkbpCNUiQCU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lRjSuEGgh1ZU15VcJ+R4EwUGO4kKf8XlhBuKu8bO3j7RE/LajrGWe0/X6aueiE6aS
 a1fXiTUEv0az4q22hIdd3UCcRrVwK6Oyfy4A8q9f3UgGbHtY21FBAxoQCINg1xmcCw
 LrjI298PXwi9aBrfK+C7Tvab9meGhnBedUaklyOY=
Date: Fri, 29 May 2020 17:51:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200529150408.17236-1-pierre-louis.bossart@linux.intel.com>
References: <20200529150408.17236-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: Intel: Baytrail: fix 'defined but not used'
 warnings
Message-Id: <159077105221.28617.15722905655179477031.b4-ty@kernel.org>
Cc: tiwai@suse.de, Stephen Rothwell <sfr@canb.auug.org.au>
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

On Fri, 29 May 2020 10:04:08 -0500, Pierre-Louis Bossart wrote:
> With the allmodconfig option, CONFIG_SND_SOC_SOF_BAYTRAIL is disabled
> due to mutual exclusion with the legacy driver. This generates
> 'defined by not used' warnings.
> 
> suspend/resume/remove are only supported for Baytrail for now, so move
> the code under the CONFIG_SND_SOC_SOF_BAYTRAIL checks.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: Intel: Baytrail: fix 'defined but not used' warnings
      commit: af89e7dac521f5e087b6b2706bb0623107f74c83

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
