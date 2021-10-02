Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D541F8B3
	for <lists+alsa-devel@lfdr.de>; Sat,  2 Oct 2021 02:20:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83AA516F2;
	Sat,  2 Oct 2021 02:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83AA516F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633134028;
	bh=GALxv5IAcLz97zH6Fr9l+G9iCwlzBZ9eBOi7+kM0a+I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YX4MmQVwrEq+23+a6lBli6VsoQVeJDbEDUvAu3r10EuOPlPCDvidYcv8QzMoFeaNh
	 J12PisQ/6Mw5TwZ6xTgb7hbbCNlXmp7hOET1ze2vdAqmRuFV/ifxsbnpBP5R5K8+fK
	 Stl14sr0xhob0vX0xNVyWADyt1z8GjOruuRBaOyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B03C7F804FD;
	Sat,  2 Oct 2021 02:17:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 971C4F8050F; Sat,  2 Oct 2021 02:17:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3C221F80301
 for <alsa-devel@alsa-project.org>; Sat,  2 Oct 2021 02:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C221F80301
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="arF/np9H"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8BE961ACD;
 Sat,  2 Oct 2021 00:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133821;
 bh=GALxv5IAcLz97zH6Fr9l+G9iCwlzBZ9eBOi7+kM0a+I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=arF/np9HzAkIV+idcv+OKiT4JFXUG1UBNP418klNHEg1G2Mppvf2GRzgAM9Ynu8mZ
 MH6/ee/HYtq3AaPJp68KWzUM+vHnexHu2KaJkcM1Hl3zcGaASLyqxr0TthwyMo0dde
 y5QC0k0hpbNYYqTOCxHr4+yFcRvV82xNUTxIAqeD8n2A2FHnrm+PR+2jWFcwLUxZjS
 Mi71UhfTCM5RLUOlAzpkx2h+F7WiuZuobAO2eZwvOmgBkYY+0NK+vb50o5j+Mff92z
 Nwm0WuYGReASE1yOUsB1jd29/YWlDviJGRpxeFucFQpU0c6ZmM530j4UOnMSabM7i4
 xzdw0gDqrIvBw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com,
	derek.fang@realtek.com
Subject: Re: [PATCH 1/2] ASoC: rt5682s: Enable ASRC auto-disable to fix pop
 during jack plug-in while playback
Date: Sat,  2 Oct 2021 01:16:30 +0100
Message-Id: <163313339132.45396.2733773513246500808.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001074113.2223-1-derek.fang@realtek.com>
References: <20211001074113.2223-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Mark Brown <broonie@kernel.org>,
 kevin_chen_ym@realtek.com, shumingf@realtek.com, flove@realtek.com
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

On Fri, 1 Oct 2021 15:41:12 +0800, derek.fang@realtek.com wrote:
> From: Derek Fang <derek.fang@realtek.com>
> 
> When codec's ASRC was enabled, the DA and AD filters use
> the reference clk which tracks the I2S clks.
> And if the I2S clks' timing of open and close are not expected,
> this patch allows the filters to switch to use sysclk if
> ASRC's ref clks disappeared and could fix the below possible issues:
> 1. Avoid DA filter to keep surplus samples.
> 2. Avoid that AD filter works failed during dapm's power on.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5682s: Enable ASRC auto-disable to fix pop during jack plug-in while playback
      commit: 04a8374c321db55834d5a9f3a9ceecb04b3cfbf5
[2/2] ASoC: rt5682s: Fix HP noise caused by SAR mode switch when the system resumes
      commit: 0b26ca1725fa16a2d28a86f89173f9df2a3fe8d7

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
