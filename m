Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5C663ADFB
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 17:40:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4EA71702;
	Mon, 28 Nov 2022 17:40:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4EA71702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669653653;
	bh=IvUx3MjLUTJK+tueA8CSBKHbylvoSs0bmHFekQHcz2g=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k7KaLfBT5PyF2+LW1qbQNKVHMx2+HpNnZ9wHzsThjen8d3+UvHhroOzrbmZd0io/a
	 SniAtCovb9HZeKO5DkO+eDD1fORtLTPovPgsM2kdaR2fFn5apyHEyhwCHNbwF/oH3c
	 T9BJX4wFMi8U3zAbnsir6i70sHd0pSpbkeJQ7El8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BEEF804D8;
	Mon, 28 Nov 2022 17:39:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CE3EF8028B; Mon, 28 Nov 2022 17:39:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BC91F801D8;
 Mon, 28 Nov 2022 17:39:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BC91F801D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="p0Fp2G2P"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD516B80E18;
 Mon, 28 Nov 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0200C433D7;
 Mon, 28 Nov 2022 16:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669653546;
 bh=IvUx3MjLUTJK+tueA8CSBKHbylvoSs0bmHFekQHcz2g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=p0Fp2G2PiK83DL3iiUMU16TObTHnjPtg1FBNyNPVCfRTHYzjP0BVR0lNRfzHYBT9J
 G0zDLaTJJf/Wn7tmnuUg2YM9mn8dXYDFK6QmRpmG447XvIxFHYVvXVpE/csXLd/bdg
 WQ3hk3UJiOI13tpiuaYKnAFWQ4fhzd7AH7OHo9Beuntesqb6dv9OUmmK27zDRK0tOq
 EPOLWSkbCu/Jt+gIwIxoRu2+STffzfLBjrHilCH5+zDdr/lvcqb0G15kq5DrDHCb/m
 w7qIHP33bJJjjcU9ChB7WnfJl5bBpJVwSHOfxUlVBNvo6W9Vu05C4WaWz3LPDcWRPe
 24DH/S1PdRaRQ==
From: Mark Brown <broonie@kernel.org>
To: V sujith kumar Reddy <vsujithkumar.reddy@amd.corp-partner.google.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20221123121911.3446224-2-vsujithkumar.reddy@amd.corp-partner.google.com>
References: <20221123121911.3446224-1-vsujithkumar.reddy@amd.corp-partner.google.com>
 <20221123121911.3446224-2-vsujithkumar.reddy@amd.corp-partner.google.com>
Subject: Re: [PATCH v1 1/4] ASoC: SOF: amd: Fix for reading position updates
 from stream box.
Message-Id: <166965354163.629583.9195064953643860302.b4-ty@kernel.org>
Date: Mon, 28 Nov 2022 16:39:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, venkataprasad.potturu@amd.com,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>, Vijendar.Mukunda@amd.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN FIRMWARE \(SOF\) DRIVERS"
 <sound-open-firmware@alsa-project.org>
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

On Wed, 23 Nov 2022 17:49:08 +0530, V sujith kumar Reddy wrote:
> From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
> 
> By default the position updates are read from dsp box when streambox
> size is not defined.if the streambox size is defined to some value
> then position updates can be read from the streambox.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: amd: Fix for reading position updates from stream box.
      commit: aae7e412b0ec0378e392b18c50b612dae09cdb74
[2/4] ASoC: SOF: amd: Fix for selecting clock source as external clock.
      commit: f9ced7dbbb551885c63632f1594997bdaf2177ee
[3/4] ASoC: SOF: amd: ADD HS and SP virtual DAI.
      commit: 9fd3b5b11db2fbbf0438324696de8233c0a78dad
[4/4] ASoC: SOF: Add DAI configuration support for AMD platforms.
      (no commit info)

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
