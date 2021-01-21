Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A46802FDDA9
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:10:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 407A018B0;
	Thu, 21 Jan 2021 01:09:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 407A018B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187837;
	bh=UUKzBQxLkBhYjym818Hr0vGurpuNCZqXyHa55eogA14=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YpZcLeenlbtB+coVU7+hwicK3hhmuLXfk0NDBpnl6XA4DMT5RPdMXMdEwfsd+smKV
	 bKRLmeqJEZGF93MB41i/QQqICnojCfHMK19VEoMMZP1mGbjidhkv+tgxtKtAtrspf6
	 8NNNB1tJW8C5ja+G8yYeNejug5H2mu1npM4NRZto=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55374F804FB;
	Thu, 21 Jan 2021 01:07:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD3EFF804FC; Thu, 21 Jan 2021 01:07:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0748AF804F2
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0748AF804F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="fViAopOo"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B70B32054F;
 Thu, 21 Jan 2021 00:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187627;
 bh=UUKzBQxLkBhYjym818Hr0vGurpuNCZqXyHa55eogA14=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=fViAopOoAexLJGAd+U1pDwCk/ujh6INeub8C31Wte83Cm2//fdqeanJ84NzrYEQB8
 uNR+e3TystfROvpU2N7JhtlYRpw74bTXhp3bz0XsYZfO8XZc//F5iCDMQmsmH1RPjQ
 DCvQs/rGsLl202+07lW8Cwz3EUlaLCtuaKLNWRhddbE2svs7YwU+fnc3Hzf1tNdcA4
 AbYlcMcJ36kU3NuuTY0MPzlERiPR14pGzzXPjyZtoijGaZr0snA2uqwgW2QHGvR4PM
 1D04eauUxeSdf0u9yerfq8lo4/E+0n12SfkkgNtyWybFkbN8BoMEcL9ftZGfSkYfpY
 el9ZCw6F6HSOQ==
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
In-Reply-To: <20210114133337.1039-1-tiwai@suse.de>
References: <20210114133337.1039-1-tiwai@suse.de>
Subject: Re: [PATCH 0/3] ASoC: Simplify with dma_set_mask_and_coherent()
Message-Id: <161118753483.45718.7168616825847385991.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Thu, 14 Jan 2021 14:33:34 +0100, Takashi Iwai wrote:
> Simple conversions from two dma_set_mask*() calls into the single
> dma_set_mask_and_coherent().
> 
> Just a minor code refactoring, no functional changes.
> 
> 
> Takashi
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: intel: skl: Simplify with dma_set_mask_and_coherent()
      commit: d3afb00220becf81bc2d9016f04e05949dfd5bb2
[2/3] ASoC: SOF: intel: Simplify with dma_set_mask_and_coherent()
      commit: ab152afa2427bb3e4eea7c9f21c4393287838774
[3/3] ASoC: tegra: Simplify with dma_set_mask_and_coherent()
      commit: 7cc206bff69b52be24fa13ee2c9afde3320c6cf6

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
