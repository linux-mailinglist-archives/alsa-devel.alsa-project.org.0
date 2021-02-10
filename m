Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D04043170F8
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Feb 2021 21:15:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CD1A16F5;
	Wed, 10 Feb 2021 21:14:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CD1A16F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612988113;
	bh=q7eIm3qrN3wG+rZf4GR377AWnQyp0Ci5funSrRGI9b8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bFxuGo2G/TsEg/QzprxQFyAFxYW96RdJp8fz1BsD/3Ifyna/lDLoowYZbC80eDTup
	 bgNq6eulhIpLwyXRZby9R15ukP4NpTC+cr2a49ySC4DPhvS5qACvmaB/JRr3fxl5jn
	 wVOTcIrxse/3yIPJS/TM+20kP4poIVqNDg1N16l4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01C14F802C9;
	Wed, 10 Feb 2021 21:12:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 88EBFF8010D; Wed, 10 Feb 2021 21:12:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0055BF8010D
 for <alsa-devel@alsa-project.org>; Wed, 10 Feb 2021 21:12:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0055BF8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="B8e+kvU2"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A4F264EDA;
 Wed, 10 Feb 2021 20:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612987962;
 bh=q7eIm3qrN3wG+rZf4GR377AWnQyp0Ci5funSrRGI9b8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=B8e+kvU2BdcrXVasD+363VVg9c005ZL3Gu+ZdDuiCVDiY+T6thBZKKD/xGfJFSxDA
 9Nqr718DWEnCXea4GkEXXIsYGS9E/Tvuf+g94P4qSeV9vHz4uHqzq0v3Ms8DZ+A/0a
 l08a1K/Bd9ujc1Lk1w+QjMn5s7qiZn7v7YtokRUdsXntqk8UBZ/F2j/1mkjeITXNvS
 nlOdphpos5Bn9EaC2NVY+cf4gustRRBH3LfbfSenzRnVC2e8+/+aH96Rd+/f3Nko/g
 dcVpNOMG7XngqjRA+udpHLQDWidDVFsTcMaTmo0gCbJjqOJplGPSypy/NxkCwqQQdj
 dd5Ry5Nam3uWQ==
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20210208234043.59750-1-pierre-louis.bossart@linux.intel.com>
References: <20210208234043.59750-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [RFC PATCH 0/2] ASoC: dapm/pins: handle component prefix
Message-Id: <161298789618.5497.13798490549586338074.b4-ty@kernel.org>
Date: Wed, 10 Feb 2021 20:11:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 8 Feb 2021 17:40:41 -0600, Pierre-Louis Bossart wrote:
> SoundWire machine drivers make a heavy use of component prefixes to
> uniquify control names. This however results in errors when looking
> for widgets or pins. This patchset suggests two solutions but feedback
> or suggestions on how to take the prefix into account would be
> welcome.
> 
> Bard Liao (1):
>   ASoC: Intel: boards: max98373: get dapm from cpu_dai
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dapm: use component prefix when checking widget names
      commit: ae4fc532244b3bb4d86c397418d980b0c6be1dfd
[2/2] ASoC: Intel: boards: max98373: get dapm from cpu_dai
      commit: 1183c350011a6f6b551c200b9206bf1808c22a4c

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
