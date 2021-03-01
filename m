Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFA7329550
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Mar 2021 00:43:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 569521688;
	Tue,  2 Mar 2021 00:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 569521688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614642196;
	bh=tj94u8URRVlanuIi09ahZYmufoYagN6NeRd0L0sR3EQ=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mvhmbZ2+PGqudlWJ89NvBLAZbuJ6mfSGUMhL9gJebpsdPnn2xowmdWqimR15rr+NV
	 PfZTIzDrpVXh/PVjp2lCDD5cBs9omuOhEZwMVlUcRLr8xPkDUkIogTLfmkYQ7LnJtf
	 tan5oReocivyvkA3atldeEI1c2vqQZQFkkGOvxHE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD782F80518;
	Tue,  2 Mar 2021 00:37:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ACE1AF80517; Tue,  2 Mar 2021 00:37:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 373D2F80510
 for <alsa-devel@alsa-project.org>; Tue,  2 Mar 2021 00:37:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 373D2F80510
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D7Sm82lF"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 05C0A60295;
 Mon,  1 Mar 2021 23:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614641828;
 bh=tj94u8URRVlanuIi09ahZYmufoYagN6NeRd0L0sR3EQ=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D7Sm82lF3v2slmoLHZ5L61fy4380Y/mwgky1chkeB7W/8Q8fYWybH5TzRy23pMhql
 yx7+nY7qPo9GHSi6/E/0wXaWN5ZDyhELygn4ZPJdF/5hdYQfr3u2NLXuXIoPGOCC9P
 zvviLppHs0FSoW37iVgSYSIGEmEpXZJpyS717Lu5KxqrN97WcLp9Y2JyRxgIb1tcoJ
 i/8VxaQfLgPvp4LS7JI/hZtgWiKP3+zuxGUyncicLt5xNdEw9vnETOK0qIPxmQtZbA
 2xUDYffCY8q89tCR7l5vFJ8u6Ow63+kSMDgsPc5RDtJ6CWjqdiSGNYZyjNXQ6i95h6
 HF3fgRpkKwsMA==
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
In-Reply-To: <20210125115441.10383-1-cezary.rojewski@intel.com>
References: <20210125115441.10383-1-cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: Intel: Skylake: Compile when any configuration is
 selected
Message-Id: <161464168097.31144.8011406861757894122.b4-ty@kernel.org>
Date: Mon, 01 Mar 2021 23:34:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com, tiwai@suse.com,
 hdegoede@redhat.com, kai.heng.feng@canonical.com,
 amadeuszx.slawinski@linux.intel.com
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

On Mon, 25 Jan 2021 12:54:41 +0100, Cezary Rojewski wrote:
> Skylake is dependent on SND_SOC_INTEL_SKYLAKE (aka "all SST platforms")
> whereas selecting specific configuration such as KBL-only will not
> cause driver code to compile. Switch to SND_SOC_INTEL_SKYLAKE_COMMON
> dependency so selecting any configuration causes the driver to be built.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: Skylake: Compile when any configuration is selected
      commit: cfa0faec5fc0544f84b9c599b6cf49cd3cc709f3

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
