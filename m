Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBBA2F5179
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jan 2021 18:55:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D00C516B0;
	Wed, 13 Jan 2021 18:54:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D00C516B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610560546;
	bh=H6zaiQ68/zWFe0SdzT9exazDyHJ3yHh5vn7wK4h4jzc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QBl+dWns4iCFGX6VIilv7TKOzHdf3/zVlc+oRFV9d+r2rj/2f7aTGANGnfB/K3Dj1
	 QgkgS9J/3rmr4w796LkOM2l+zdHhlRAT4ev9b1AV3XrQK9rMUx51v/HxBz28Io12Bv
	 K6ryojtO1Adbtz5qH6gsOBUcy5Tlt78PTbBomzno=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 048ABF8026D;
	Wed, 13 Jan 2021 18:54:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1D688F8026D; Wed, 13 Jan 2021 18:54:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED87AF8014D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jan 2021 18:54:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED87AF8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="U1skgfZE"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87D122343E;
 Wed, 13 Jan 2021 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610560440;
 bh=H6zaiQ68/zWFe0SdzT9exazDyHJ3yHh5vn7wK4h4jzc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=U1skgfZEXNeaNaIWSXocNzwlEte+imI8NGu3CENI0en3CWAbeHnj8FEZA73rvRrSA
 n/NW4/1MWocCFshcbCw1chxcowI1bJmd4fRG6mDY+hSnpS4C/jXjad5GuObcZgFcax
 UCcqaiupnhPNOHAeuL0TXV+hHzVXBVUSK3k13qIeOJ1Sj6syO2gIQbteLNvn51GppS
 2zY0TzcnDX2h+1C6VvZnHvXKJ6D2ZTwek0HfwK96Xsl8W1eDSyRh9FUjfFOzhBl4hE
 xMxtOPWV/56VcpIblvLO2y6jx+ZvncMkZ+EUob89VWRwuA/WTPyX6lzwL+adEcVjYS
 1W1qhQFL1kj/g==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
References: <20210113152617.4048541-1-kai.vehmanen@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: SOF: add .shutdown() callback to snd_sof_dsp_ops
Message-Id: <161056040078.11774.2119555745829499894.b4-ty@kernel.org>
Date: Wed, 13 Jan 2021 17:53:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Keyon Jie <yang.jie@linux.intel.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, Bard Liao <bard.liao@intel.com>
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

On Wed, 13 Jan 2021 17:26:14 +0200, Kai Vehmanen wrote:
> Add .shutdown() callback to the struct snd_sof_dsp_ops, for
> doing platform specific actions at shutdown.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: SOF: add .shutdown() callback to snd_sof_dsp_ops
      commit: 7edb3051f11683640c38b93e183ef1676090a79b
[2/4] ASoC: SOF: add snd_sof_device_shutdown() helper for shutdown
      commit: daff7f1478e12cdee3e639c83c571cfd38bc5080
[3/4] ASoC: SOF: sof-pci-dev: add .shutdown() callback
      commit: 3475b44c7601d6f2b4d96e731047ef73fd2f1eb2
[4/4] ASoC: SOF: Intel: tgl: do thorough remove at .shutdown() callback
      commit: 44a4cfad8d78efcda9ec0dd97ceea38d8b602f24

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
