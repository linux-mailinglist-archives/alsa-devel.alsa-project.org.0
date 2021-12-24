Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB9A47F017
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Dec 2021 17:20:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 240F917DB;
	Fri, 24 Dec 2021 17:19:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 240F917DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640362803;
	bh=uSaKRhe6AicqI5f3I9EbmjggqJ18n5c3iIi82wvBO2w=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bS/yR2FW/kSQ+kVFsWUcmaFwKhNMNgzOILCOXnnDAHn4PrQ5RszYXMy15z17JBbj0
	 0722OdjwxAqUkioTmBXSSuZyL1hrK6kN35NesF87FrxRe/kkcHgA0zKwp0/7ZkmSYz
	 z4Q8tuB0P+XzskvUm6B3hFFxcKgx0OsG+K0nfhqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C83B5F80518;
	Fri, 24 Dec 2021 17:17:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCE11F80510; Fri, 24 Dec 2021 17:17:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83882F804E4
 for <alsa-devel@alsa-project.org>; Fri, 24 Dec 2021 17:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83882F804E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="n5NMZ84Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0F179620CA;
 Fri, 24 Dec 2021 16:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 363AFC36AE5;
 Fri, 24 Dec 2021 16:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640362656;
 bh=uSaKRhe6AicqI5f3I9EbmjggqJ18n5c3iIi82wvBO2w=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=n5NMZ84Y8mQq5ERhlN0Lwd5RPUxwnBxaKbDdy7orOEdZSDsP0LvmJ2g2Qm0XWFJge
 vd/N7r+980JU0K78fjaRpvw2IOsbVsYBeDxhunUhjwwwK7Uvc2/tErlj7mq99EHRfv
 Effy1N95l8rg7Rlh+H17DwfkmIc6xm3r2TTkI0c/cGobVsm27ljeL24yHOFYej7DIK
 YymeqEnKArztgvMk0Ou6Ppb6ys9Az3EIK3vZTP9MKBV68jAvewGla+Xbdb2ov/cQb3
 0+H5AKYK9JRemSFyB05/W12WAB3mCGQLdF1+eqavG5aVG8NqUjgq2g2je61vzk1upf
 CpOfAb7XwrC8g==
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 vkoul@kernel.org
In-Reply-To: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
References: <20211224021034.26635-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v2 0/7] ASoC/SoundWire: improve suspend flows and use
 set_stream() instead of set_tdm_slots() for HDAudio
Message-Id: <164036265394.3720027.13130210179491813810.b4-ty@kernel.org>
Date: Fri, 24 Dec 2021 16:17:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: vinod.koul@linaro.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 srinivas.kandagatla@linaro.org, sanyog.r.kale@intel.com, bard.liao@intel.com
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

On Fri, 24 Dec 2021 10:10:27 +0800, Bard Liao wrote:
> This series contains three topics.
> 1. SoundWire: Intel: remove pdm support
> 2. ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
> 3. ASoC/SOF/SoundWire: fix suspend-resume on pause with dynamic pipelines
> 
> The topics are independent but the changes are dependent. So please
> allow me to send them in one series.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASOC: SOF: Intel: use snd_soc_dai_get_widget()
      commit: da893a93eaf8eb2bce03862e00b9998463eeaecf
[2/7] ASoC/soundwire: intel: simplify callbacks for params/hw_free
      commit: b86947b52f0d0e5b6e6f0510933ca13aad266e47
[3/7] soundwire: intel: improve suspend flows
      commit: 8ddeafb957a9a6dd33b2c80309d726d3141df08f
[4/7] ASoC/SoundWire: dai: expand 'stream' concept beyond SoundWire
      commit: e8444560b4d9302a511f0996f4cfdf85b628f4ca
[5/7] ASoC: Intel/SOF: use set_stream() instead of set_tdm_slots() for HDAudio
      commit: 636110411ca726f19ef8e87b0be51bb9a4cdef06
[6/7] soundwire: intel: remove unnecessary init
      commit: 9283b6f923f3bdd92bdeaf259c6b7a5e9dac6900
[7/7] soundwire: intel: remove PDM support
      commit: 63a6aa963dd01b66019b7834cc84d032e145bb00

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
