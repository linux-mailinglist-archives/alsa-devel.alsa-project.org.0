Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD0D2B551C
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 00:35:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23FA1781;
	Tue, 17 Nov 2020 00:35:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23FA1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605569751;
	bh=rWLCAH/AOib/MOZQSJ5hNZCF+t2YoYpawutUu0T/X5g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pSbDuOJdxlbcPwwTQmM9aWx1uWh3u4EwRL/M3IRwoHn8MmHg0VderLAWEzwm9pJEA
	 f6oOavSRQJBkG+Mtjhe9GxBxMaLFkQU6PhioWJsa3K20v5EJEnxzS7KTE9TCWC6xY5
	 e7B/qlrRsUAF0l7ANkv80Qt8z9boKadJfSWKHZu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 411BDF804D8;
	Tue, 17 Nov 2020 00:33:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E834F804D6; Tue, 17 Nov 2020 00:33:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7444F804CA
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 00:33:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7444F804CA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="W+Z2ROLP"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4411B2223C;
 Mon, 16 Nov 2020 23:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605569601;
 bh=rWLCAH/AOib/MOZQSJ5hNZCF+t2YoYpawutUu0T/X5g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=W+Z2ROLPyw49m3EbZSpvtiHrAgFYu2GVM/7j7JGpt/Cfm//U7tdyxCJrzWVqFJaNo
 ChkcFbk6aLnH+tJ5z6mru4PpwMRYQAYpstkzABgRGKoTIVZdjuU60+feURAhN9nxrX
 eqGLrX5tnox2Z3Xsir1UgmKhQDiSGWga/CL/9nt8=
Date: Mon, 16 Nov 2020 23:33:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20201116133332.8530-1-cezary.rojewski@intel.com>
References: <20201116133332.8530-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH 0/5] ASoC: Intel: catpt: Offload fixes and code
 optimization
Message-Id: <160556956526.29683.7053619645686677199.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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

On Mon, 16 Nov 2020 14:33:27 +0100, Cezary Rojewski wrote:
> First two of the series address bugs connected mainly to offload streams:
> - scenarios with very low buffer sizes: RESET_STREAM IPC timeouts
> - fix lp clock selection when switching between PAUSE <-> RESUME states:
>   glitches on first offload when no additional stream is opened
>   simultaneously
> 
> Follow ups are: code reduction and optimization oriented patches.
> This has been foretold in:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: Intel: catpt: Skip position update for unprepared streams
      commit: aa9e3fa4992d83acb7311fc86d11d0d53e7ffb8e
[2/5] ASoC: Intel: catpt: Correct clock selection for dai trigger
      commit: 1072460a1aabacf6ececda98acd3b5ecaad23fd2
[3/5] ASoC: Intel: catpt: Optimize applying user settings
      commit: 768a3a3b327da88c2fa6856806d32852a90e75d5
[4/5] ASoC: Intel: catpt: Streamline power routines across LPT and WPT
      commit: c440c72474e12fcf79bbe716d4796d16b7201031
[5/5] ASoC: Intel: catpt: Cleanup after power routines streamlining
      commit: 3d32489838bbf3119bb1ea59cdbed0077d7dbf3c

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
