Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C4216E9B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:20:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93E1E15E2;
	Tue,  7 Jul 2020 16:19:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93E1E15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594131646;
	bh=nqNaTEsJJ1BX5Ar+tPUZJmqbadwF/kx214S3Z0T5Vjk=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RLzLYraZcTS3RWZz83VzqUw999AQ1QWIvyaMxiq0kB9bbw0AD58PsKODmqT/cCHba
	 ovYfaLkr97zOuwmwmtLUxWhWmEqGnSMqZVuGgj3yrUb8hoe4giDSQdAp5yG6ZsCfzm
	 ciOndPm0Yv7ZBtz8R4rOK8H+xiSyr3o7Sxzcki8Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB744F802BD;
	Tue,  7 Jul 2020 16:17:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5ACDDF8011F; Tue,  7 Jul 2020 16:17:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9423F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:17:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9423F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="hhky3TmY"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FBFA20771;
 Tue,  7 Jul 2020 14:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131444;
 bh=nqNaTEsJJ1BX5Ar+tPUZJmqbadwF/kx214S3Z0T5Vjk=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=hhky3TmYhv5JgVIPZTtSGNTNyit59gQIgJ7yZrPoLAZWcOTEvhyMxTkX/x2jlA+me
 FRrTV8Y1+s3opu5QE9dLXJbHzhNfgp50H2uXy3ilQLhk2Ny0qXxEQ0kFkAjb4lWuOu
 M2yrWLlhJebgVEaY/txw4w+NXtGL6LBAWwIN9yuk=
Date: Tue, 07 Jul 2020 15:17:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, alsa-devel@alsa-project.org
In-Reply-To: <1594118813-18689-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1594118813-18689-1-git-send-email-Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH] ASoC: amd: add ACPI dependency check
Message-Id: <159413142467.34737.8485886141400585716.b4-ty@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, hui.wang@canonical.com,
 Alexander.Deucher@amd.com
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

On Tue, 7 Jul 2020 16:16:41 +0530, Vijendar Mukunda wrote:
> Add ACPI dependency for evaluating DMIC hardware
> runtime.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: add ACPI dependency check
      commit: 68d1abe186d1c865923d3b97414906f4697daf58

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
