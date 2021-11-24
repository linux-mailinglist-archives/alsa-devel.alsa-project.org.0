Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F3045CB38
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 18:39:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ECC6178D;
	Wed, 24 Nov 2021 18:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ECC6178D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637775549;
	bh=BXSps0Gf7ZuWw7IhOjXWtmEcdooeUExkuzMuDp2cT9U=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGGEgGOYZInUoQoxSFdExd5SP8bs8VrM8Mer6+MhV3fDTOZcJ6tQC6jMrc9qDoA5d
	 BokicHoNmMaadwXpsZR03d/9/b5ohljymAU4qtuDuphAJkDbMg2e7R3kx6DeAmSPMf
	 1HGSyJX610aQpvcZMJTLnMwqInZfhesK0AKFqG2I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40232F804FB;
	Wed, 24 Nov 2021 18:36:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B911F804F3; Wed, 24 Nov 2021 18:36:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C51DAF804E6
 for <alsa-devel@alsa-project.org>; Wed, 24 Nov 2021 18:36:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C51DAF804E6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZkpVMBwx"
Received: by mail.kernel.org (Postfix) with ESMTPSA id A82B160FD8;
 Wed, 24 Nov 2021 17:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637775403;
 bh=BXSps0Gf7ZuWw7IhOjXWtmEcdooeUExkuzMuDp2cT9U=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZkpVMBwxqAArfvJj+K0hXXCrylUq+hK6ScZ+pr0xpJAbjXjzCRNIx5/8bRNvufLY2
 L5oR0AI66Khtuc1Ond5tA9phhziu6jISYnPoUTq9X0YtIFCT/opDxtKvT6mTa1GEAG
 kGP8uzA3t+0OPUva45PbZjTRSNxDgK+XEMgcSb86o9Qea/AGeMmQ749kdWZTzQ5C3p
 t4gisodhBq362797plgQzzpUKoKobsvZ0peEJ2t+xIdGdYA2x6JkPNPHfT9aLgrjVl
 kYjkVMx/lSeTn2T/5PL16yw+IM+irOP7rncpEN35n6oPNUj87iNsOKv2+K+YsDqlDC
 MQ4i4bK3qiBuA==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20211123161715.113131-1-kai.vehmanen@linux.intel.com>
References: <20211123161715.113131-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/2] ASoC: SOF: sof-audio: setup sched widgets during
 pipeline complete step
Message-Id: <163777540142.2712097.13357064765098661715.b4-ty@kernel.org>
Date: Wed, 24 Nov 2021 17:36:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, yung-chuan.liao@linux.intel.com,
 lgirdwood@gmail.com
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

On Tue, 23 Nov 2021 18:17:14 +0200, Kai Vehmanen wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> Older firmware prior to ABI 3.19 has a dependency where the scheduler
> widgets need to be setup last. Moving the call to sof_widget_setup()
> before the pipeline_complete() call also helps remove the need for the
> 'reverse' direction when walking through the widget list - this was
> only working because of the topology macros but the topology does not
> require any order.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: sof-audio: setup sched widgets during pipeline complete step
      commit: 01429183f479c54c1b5d15453a8ce574ea43e525
[2/2] ASoC: SOF: topology: don't use list_for_each_entry_reverse()
      commit: fb71d03b29bcbd8c03798d36e7b2a2297b6dea45

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
