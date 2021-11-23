Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9624F4598E7
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:02:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32BA5166A;
	Tue, 23 Nov 2021 01:01:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32BA5166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625757;
	bh=vxGV5wzjy0QQFIApAyOfWagXPSDG+s+TC+Gf6T38UHo=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ho4fbik0C0z5EIfVAUnfLsnoQuCNqEi2J8rXovqAI9tDVM7eSEAhQxlvu07V4e2L8
	 hOkOMMddd0AarVFgsOhZZsDAoxRtKuBqk1Ns3ACOtjEWn9dBqSJs2tps9s4mfh62hx
	 nbNAFDPm9ivAWlkePg4LghYZf9IIQb4JQhadvskM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 43A63F80506;
	Tue, 23 Nov 2021 01:00:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE1C2F804FF; Tue, 23 Nov 2021 01:00:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1760AF804F1
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 01:00:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1760AF804F1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iMHjChp/"
Received: by mail.kernel.org (Postfix) with ESMTPSA id E448660E08;
 Tue, 23 Nov 2021 00:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625610;
 bh=vxGV5wzjy0QQFIApAyOfWagXPSDG+s+TC+Gf6T38UHo=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iMHjChp/FsrwxsNjV9fA8FujPkuw61bjwbP/rc44PNuYuui1XSmiKtVsKiVnsrBPF
 LN/mxz0WRpIYj74g2imnUlPHoQ0wE9dq3+6d2YOXIBnKFIn8Cur8YXC/kxlQY4C4zH
 Hp/QuS1cBdPCIMZ+YcNZ3gR1FZEtdwSH/UDMbjDBFanJZn6Ur0DYre3zxJbp733zyJ
 LYNHT4jKe/+VZzdagCP98b5kXeyAgQdWLzk/W3L9PftwuQQeGcljwJf/blP2EMpZ20
 FXMBFN75M0TcSST6ldN1PBc7z3JG0GQbEAZdPz3Sqc9YeDYdmjdPmgUUTR3Xm50mmr
 jVSCuWGlwrLHQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20211119104752.13564-1-olivier.moysan@foss.st.com>
References: <20211119104752.13564-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH v2 0/3] ASoC: stm32: add pm runtime support
Message-Id: <163762560655.2471742.5896666264679935449.b4-ty@kernel.org>
Date: Tue, 23 Nov 2021 00:00:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Fri, 19 Nov 2021 11:47:49 +0100, Olivier Moysan wrote:
> Enable support of pm runtime on STM32 SPDIFRX, I2S and DFSDM drivers
> to allow power state monitoring.
> 
> Changes in v2:
> - Move pm runtime enabling before component registration
> 
> Olivier Moysan (3):
>   ASoC: stm32: i2s: add pm_runtime support
>   ASoC: stm32: dfsdm: add pm_runtime support for audio
>   ASoC: stm32: spdifrx: add pm_runtime support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: stm32: i2s: add pm_runtime support
      commit: 32a956a1fadfd7d3924ab8ada2b7754054375903
[2/3] ASoC: stm32: dfsdm: add pm_runtime support for audio
      commit: 98e500a12f934531b0d44eac6bc53c3d4b66aa74
[3/3] ASoC: stm32: spdifrx: add pm_runtime support
      commit: ac5e3efd55868d8c12a178123b24616a22db274d

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
