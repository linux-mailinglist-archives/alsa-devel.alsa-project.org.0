Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2197272FDB
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 19:00:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BEC816C7;
	Mon, 21 Sep 2020 18:59:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BEC816C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600707626;
	bh=mNJcpgufw1VRaRkLPvUMtGyZTZPcUX4LYP4cj3IjjKI=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s0LYfj4vlhJF7neKEav3Z/Ur/DtKM50x96A+H58/DVDJqGFNhX026zkNMzSgruO1Y
	 orxeAkOiaWHOsruqgOUcM1oXRPn+rTbO6CCtlhYnwE6M8nOxov8gwwiD4Vzsw6EGAa
	 0/gT37+k5Yw2tSApm4FlzP7cDjFpi43Hgiex8ASQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8737DF8010A;
	Mon, 21 Sep 2020 18:58:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EA09F80171; Mon, 21 Sep 2020 18:58:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF8EFF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 18:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF8EFF8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="1d9KeBWs"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B6FE20C09;
 Mon, 21 Sep 2020 16:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600707510;
 bh=mNJcpgufw1VRaRkLPvUMtGyZTZPcUX4LYP4cj3IjjKI=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=1d9KeBWs+A777+jilEp0jFpDF3jNwsyOKSGm4Kof2nOH/tWp0gDgQBanHxc4491F+
 DWUhXjF5YZLNBce83qV5zk/KT2FgypH7cKa4BsojR0yAGcruQuTeW5YrFkmH1Ds1Is
 vsnsPwrDGHuEUDxEywJKJxFSq1emK7MeelUJW0NY=
Date: Mon, 21 Sep 2020 17:57:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20200921104544.2897112-1-kai.vehmanen@linux.intel.com>
References: <20200921104544.2897112-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH] ASoC: SOF: topology: fix the process being scheduled on
 core0 always
Message-Id: <160070745847.56122.6304873079726187313.b4-ty@kernel.org>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Jaska Uimonen <jaska.uimonen@intel.com>, Keyon Jie <yang.jie@linux.intel.com>,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com
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

On Mon, 21 Sep 2020 13:45:44 +0300, Kai Vehmanen wrote:
> In commit 783898ce68de ("ASoC: SOF: append extended data to
> sof_ipc_comp_process") the process components are set to run on the
> fixed core 0, this break us from scheduling components on any other DSP
> core.
> 
> Since we can get the DSP core index from swidget->core, it is duplicated
> to pass the extra 'core' argument for those sof_widget_load_xx()
> functions.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: topology: fix the process being scheduled on core0 always
      commit: 2263063fc4880d544a1eb87713f642384fe03cb7

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
