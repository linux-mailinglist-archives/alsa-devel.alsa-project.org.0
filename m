Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 068E73242BB
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Feb 2021 18:00:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053511688;
	Wed, 24 Feb 2021 17:59:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053511688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614186013;
	bh=2kpr6Z+suT7c1HDOFero5vVJtTuhqNZTCoyKPUmUG60=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i3JqR2ZAt7XhVwhq/yO9PbVgrQhDGgl9DPPtTIA9wqFp91lppFBoyKbb17bqj+mAU
	 c+neLtEkIXz1ojaLRKQxKzyteaTLnEMZRiE/thjr+m5jfl1VFUEvCSalJs4/cW0of9
	 RfwBYRLEXTIjlNgf/O1+IZFSe3apGN0qIIIYnbes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC28F80249;
	Wed, 24 Feb 2021 17:58:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 354DEF80249; Wed, 24 Feb 2021 17:58:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A8F4F80159
 for <alsa-devel@alsa-project.org>; Wed, 24 Feb 2021 17:58:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A8F4F80159
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mz8ScZPp"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9321F64F0B;
 Wed, 24 Feb 2021 16:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614185906;
 bh=2kpr6Z+suT7c1HDOFero5vVJtTuhqNZTCoyKPUmUG60=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mz8ScZPpPMcBMGDRi/G6ToU1j3OvFbTVqhlferMHUK0FXBELAQr8uZwigk1Tjxz8H
 UvJetYN+s/83azbRKIr4fo8aaWksohG41d+84+6dZALiR0Yw2KQhSq59K+2UO6EV31
 bnOUPvXrhV6p8GJmHK52bydqEuKR0u05Cio3VZ3uc+6FoHO12UryXx4sY6/6vd3NsI
 ko5HN6NP4vN/f4NNOtpzN1BWtrBwlwTQFzkK75QF3WfrOmckN/fryPHxZBP4PtpKLY
 7bG42JUkDWo4o0c476fY0pYHLd+oNz87v8jD45O5NbgAPpkRLXZh9mTJaFKr2ttLIj
 JT7gFJM7h0q7A==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Hans de Goede <hdegoede@redhat.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20210215142118.308516-1-hdegoede@redhat.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
Subject: Re: [PATCH 0/4] ASoC: rt5670: Various kcontrol fixes
Message-Id: <161418583679.1249.4091359701484000710.b4-ty@kernel.org>
Date: Wed, 24 Feb 2021 16:57:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <bard.liao@intel.com>
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

On Mon, 15 Feb 2021 15:21:14 +0100, Hans de Goede wrote:
> While working on adding hardware-volume control support to the UCM
> profile for the rt5672 and on adding LED trigger support to the
> rt5670 codec driver. I hit / noticed a couple of issues this series
> fixes these issues.
> 
> Regards,
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: rt5670: Remove 'OUT Channel Switch' control
      commit: 30be2641848b2450f0f1b62e3a8aea42e14db640
[2/4] ASoC: rt5670: Remove 'HP Playback Switch' control
      commit: 8022f09883e827855d86173756caa07b891100f0
[3/4] ASoC: rt5670: Remove ADC vol-ctrl mute bits poking from Sto1 ADC mixer settings
      commit: 674e4ff4c2326c6e3f8ddc73c61910bf32228720
[4/4] ASoC: rt5670: Add emulated 'DAC1 Playback Switch' control
      commit: 982042931c255e2e7f196c24f1e5d6de780e04f9

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
