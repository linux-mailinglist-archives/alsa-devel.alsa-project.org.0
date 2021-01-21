Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDFE2FDDAA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 01:10:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73A6317B3;
	Thu, 21 Jan 2021 01:10:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73A6317B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611187852;
	bh=FDFIu182DIZzhgxiOXveNlHA/Hh6Y4tQs85NKRtax5E=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jvfUTmQJblwB/pymPbjgV4OIJYcwUxr6jwIPHWrsPNjiAKENjB+CbBcr6u3E2jkTv
	 VrAqbdFHjN9mOMhFbuo3EQhNQPNpljpnvLfdWPrwnl3QFtLoYXRkayM5sH1qXmsF5Y
	 4MfhDaOc0/3O1Rj7dsXn1+2CNb0ovI9RnwqF8Dts=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E4175F804FC;
	Thu, 21 Jan 2021 01:07:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C48FF804FF; Thu, 21 Jan 2021 01:07:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F384BF804FD
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 01:07:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F384BF804FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TR/KEC/B"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 88C542054F;
 Thu, 21 Jan 2021 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611187633;
 bh=FDFIu182DIZzhgxiOXveNlHA/Hh6Y4tQs85NKRtax5E=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=TR/KEC/Bwo32KzXpHkqnfIrklnvHUmXpSJJnc0vRkqgpnBHQxcjXQSdPnRcZCDMC3
 E5pRo3O5xMr0Lc58wMEfNZ2cOFm/zBtbY0of69XvAhilS2Rn1I8bmQ9WC6LOHUJp2n
 JiwHLc09udsgWHR6u/nA5VwLXpTZV74EOHbaD47G8eduQwzsh6Iqv1S3vVqSyCg88y
 Fo5q4EZVB0Av2J0PVlEIgqazzrr/iWqvl1SpV6ADebJOUi+uQz5YRCLnif05FprFka
 lSElmHfN/7qmuSMHDzwVOnXiYgqu75INn8Tq9fvVz0GpUZqBhnF1HKGSLzaaosWy6E
 Wd5Yba0MAprMA==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20210120080850.699354-1-tzungbi@google.com>
References: <20210120080850.699354-1-tzungbi@google.com>
Subject: Re: [PATCH 0/5] ASoC: mediatek: mt8192-mt6359: support DP audio
Message-Id: <161118753485.45718.14478394591214975243.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org
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

On Wed, 20 Jan 2021 16:08:45 +0800, Tzung-Bi Shih wrote:
> The 1st and 2nd patches refactor the machine driver.
> 
> The 3rd patch changes the platform driver to support TDM 8 channel output.
> 
> The 4th patch adds an optional DT property.
> 
> The 5th patch makes the machine driver support DP audio if the optional DT
> property is specified.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: mediatek: mt8192-mt6359: move headset_jack to card specific data
      commit: 4e37528a97bfffb2cd4f645c945759e76d583848
[2/5] ASoC: mediatek: mt8192-mt6359: simplify mt8192_rt5682_init
      commit: 12295ef97078db19683d8c0a23abc6f633ef0e23
[3/5] ASoC: mediatek: mt8192: change mclk_multiple of TDM from 128 to 512
      commit: df369921d726410a093de48d33e605fd4e0ee33c
[4/5] ASoC: dt-bindings: mt8192-mt6359: add hdmi-codec property
      commit: 9bc20e8076c96a54c9fb20228d12ff35c88447d5
[5/5] ASoC: mediatek: mt8192-mt6359: support audio over DP
      commit: 0d80c48c847842de488e76ae434ccb74397623c3

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
