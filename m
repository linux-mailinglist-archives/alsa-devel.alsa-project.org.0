Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D59622B636
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 20:55:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF71F1688;
	Thu, 23 Jul 2020 20:54:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF71F1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595530516;
	bh=YbxBUMqGpnvnUXpNUDe5ezV/YoGSFc1wqjA12a9mRHA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YGPrPUKt5CyEG3iaAEX61gsl3xMciw4BzCG4CmrSNhaw+uaKIsq+aQ1aVouaXxNRA
	 Vm5IRS3/e446kyrPPC3VOhBqkqA+DPJfz5PQZERj3zQexUUhpiyIPGcENVWicFG/XV
	 8PwgWi8m731AVPuUNCJ1CH0kpOX6/B1YN3gZl/Ik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DCB0EF800CE;
	Thu, 23 Jul 2020 20:53:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 29583F80212; Thu, 23 Jul 2020 20:53:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E296F800CE
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 20:53:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E296F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hZY0Maby"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B315D20737;
 Thu, 23 Jul 2020 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595530408;
 bh=YbxBUMqGpnvnUXpNUDe5ezV/YoGSFc1wqjA12a9mRHA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hZY0Maby+Gy6eZs0Z3i24bEOLtEw2qNCLLT5CiK/7OQUGuuN/EN+IoepP+bZ6auly
 pqnGc8uqzPlDM41JWvd76O2GYzmvEwOJsHicYlOGCSxomTCMhSD8Hpzj19ghdGlYwE
 FbP69HBMfLSB8CG5PmOblE/yFjnihQ6E0o1od9Hg=
Date: Thu, 23 Jul 2020 19:53:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Harsha Priya <harshapriya.n@intel.com>, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <1595432147-11166-1-git-send-email-harshapriya.n@intel.com>
References: <1595432147-11166-1-git-send-email-harshapriya.n@intel.com>
Subject: Re: [PATCH v8] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix
 kabylake_ssp_fixup function
Message-Id: <159553039325.39755.1977316956642959152.b4-ty@kernel.org>
Cc: Vamshi Krishna Gopal <vamshi.krishna.gopal@intel.com>
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

On Wed, 22 Jul 2020 08:35:47 -0700, Harsha Priya wrote:
> kabylake_ssp_fixup function uses snd_soc_dpcm to identify the
> codecs DAIs. The HW parameters are changed based on the codec DAI of the
> stream. The earlier approach to get snd_soc_dpcm was using container_of()
> macro on snd_pcm_hw_params.
> 
> The structures have been modified over time and snd_soc_dpcm does not have
> snd_pcm_hw_params as a reference but as a copy. This causes the current
> driver to crash when used.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: kbl_rt5663_rt5514_max98927: Fix kabylake_ssp_fixup function
      commit: 5c5f1baee85ae48b1ff50da4cc5e89f496be702c

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
