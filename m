Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA35EBFE0
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Sep 2022 12:36:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F872847;
	Tue, 27 Sep 2022 12:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F872847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664275014;
	bh=Gq/Ydxuwa5AYGf9ernxE9FxfAvME30nJMsneSS443DI=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=m8JE6SZDOzZp/n2eSXMx5JlgQdpBQpMOrjywQ5XJxxtYIBkSMYg5DUVufp4xVWUdQ
	 LKPkV1xbqwAabAqTokoxV0MggRnXKktLyl5JfmFViAXv7yOywV67BEJt3T0uWp53ph
	 9/6MRKtJS2XJszW4Kwsu1ZEVA5Bp5ul/A0riwhoU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C107F8053C;
	Tue, 27 Sep 2022 12:34:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7432F8054A; Tue, 27 Sep 2022 12:34:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 275B4F80549
 for <alsa-devel@alsa-project.org>; Tue, 27 Sep 2022 12:34:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 275B4F80549
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Wp6kiQ1D"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6157A617B6;
 Tue, 27 Sep 2022 10:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBA4C433B5;
 Tue, 27 Sep 2022 10:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664274867;
 bh=Gq/Ydxuwa5AYGf9ernxE9FxfAvME30nJMsneSS443DI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Wp6kiQ1DzdDH75hcP6pTyGbVmAPEvDORRvGfUx2SEbe2t6fvFmKpH44NNGzTMr4/R
 7Ro9FZwx7+reXQG7hBdCBX2tokQAAvkqLOz5m2hXRyPQGCjfoVtrVlbv+yoTa8mZpP
 9+AGEEYZm/GddYx3B+8/zmcYi47rehmqKSaQe7clZc6dg20cxisbbbRhkTxllS0zDJ
 oWHQwdoirMHWc1jQEaINbuIi5aSikDkWHAuATi2c7wVOMY/Tbw+I4A9sTP67j/D187
 vVbv4qX/nGr0uaCxH638EpIJtLKivEf0sO3NF41okFjCYuPJT5YUzdVwqLs13f9RzI
 /p9kFWX6gZE3w==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
In-Reply-To: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
References: <20220923133616.26267-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH 0/6] ASoC: SOF: ipc4/Intel: Improve and enable IPC error
 dump
Message-Id: <166427486547.60697.5904813708821442671.b4-ty@kernel.org>
Date: Tue, 27 Sep 2022 11:34:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, rander.wang@intel.com
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

On Fri, 23 Sep 2022 16:36:10 +0300, Peter Ujfalusi wrote:
> On Intel platforms the registers for DSP communications are used differently,
> the IPC dump information is not correct since important registers are not
> printed and existing ones are used a bit differently for IPC4.
> 
> As a last step, enable the IPC timeout 'handling' and allow the printout of
> the now usefull IPC dump.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: SOF: Intel: cnl: Add separate ops for ipc_dump for IPC4
      commit: a996a333ad74d1f26c3831f1edd94a5d16798a0c
[2/6] ASoC: SOF: Intel: hda: Add separate ops for ipc_dump for IPC4
      commit: 32b97c07c2a3b7cccc0c7e9a5b23970bd9a52c5d
[3/6] ASoC: SOF: Intel: skl: Use the ipc4 version of the ipc_dump
      commit: 6759f35b234aa94e26e122afcd402ba2a39bd9d3
[4/6] ASoC: SOF: Intel: mtl: Print relevant register in ipc_dump
      commit: d01784ee680c558938baf6c4f184bee2bc612798
[5/6] ASoC: SOF: Intel: hda: Only dump firmware registers for IPC3
      commit: 01fb69d09afb896579e00c3dbc3c1aa74613dd86
[6/6] ASoC: SOF: ipc4: Call snd_sof_handle_fw_exception() in case of timeout
      commit: 4245fdba89b82befee0d963a85f7494c70432ee9

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
