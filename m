Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84091FF2BA
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 15:10:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40A591790;
	Thu, 18 Jun 2020 15:09:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40A591790
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592485848;
	bh=wbuM2H17mhrl0SZfNkiU/7la5QCjsWxCoIJ/nOWgf+U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=S8f7rac6y2zmlrPqV0QROE7C2Z9yuA8mrzyRZJCtHk6R4ZWD2KYSPiegveU/PBgru
	 PPd/UKumdnGwWvXNLtnIz3l9Dsb9a7VlhBD+UDiqDmAN4b4GGMfatmsjzJg7tToWBG
	 KnKhKz0lRWa5Cw2rp0UvDFvyJhl21F5msQiX8YOs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B8DCF80162;
	Thu, 18 Jun 2020 15:09:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17B5BF80116; Thu, 18 Jun 2020 15:09:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 01458F80101
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 15:09:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01458F80101
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eLzUn0z+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DA3020707;
 Thu, 18 Jun 2020 13:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592485739;
 bh=wbuM2H17mhrl0SZfNkiU/7la5QCjsWxCoIJ/nOWgf+U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eLzUn0z+eNBop9PZ7DRxlo0n3ltb8DVgR2ugQmNfhVs7IEkCZmwLgvI90ObqOtXAk
 cDXK79XwD5sCU+oihfuMwDPk4rxqzEoiXTXh5oPBmyjGpMzISat5mnBTDQAybthw+u
 wsR1cziid8S1P7diawHBa7HqxNyiOzfnOFtstiAE=
Date: Thu, 18 Jun 2020 14:08:56 +0100
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20200617165616.18511-1-pierre-louis.bossart@linux.intel.com>
References: <20200617165616.18511-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH RESEND 0/3] ASoC: Intel: simplify driver/card names for
 SOF/UCM integration
Message-Id: <159248573682.21358.3066767783204424991.b4-ty@kernel.org>
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

On Wed, 17 Jun 2020 11:56:13 -0500, Pierre-Louis Bossart wrote:
> As suggested by Jaroslav, this patchset simplifies legacy cards
> compiled with SOF: they now expose an 'SOF' driver name and an
> 'sof-bytcht <codec>' card name. UCM uses this driver name and
> additionally checks for the card name to load a configuration shared
> with the SST driver.
> 
> This patchset is just a rename with no functionality change. There is
> no modification when SOF is not used, and Kconfig for SOF are disabled
> when SST is enabled so no risk of interference.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Intel: byt*: simplify card names for SOF uses
      commit: b4ecd58b01fbd9420bb3d8911c526dc877319df5
[2/3] ASoC: Intel: cht*: simplify card names for SOF uses
      commit: 7bfbddfc98414ab52803ffd26d0dc65328d373b1
[3/3] ASoC: Intel: broadwell: simplify card names for SOF uses
      commit: a5f610c0fa7ef819ab04a958dcde574c20b2f55b

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
