Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A204598E9
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Nov 2021 01:03:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C916C846;
	Tue, 23 Nov 2021 01:02:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C916C846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637625791;
	bh=OYnq4wrpACbNs7esyB7jfrW82zCFu1z13PhYloNHXac=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D/1KkXxyWvUpjy9BkqBPy9LcUYyl8wvENuQajNcLXSTjFJuxMl/6WbVWJcYh8mBRn
	 Hl+466ZdF++EOdVPFn3V0ZrV0ekAsLRNgJGfAg8/D5tsYf3GlRyJbiY4h5EgNrgJjP
	 EfV/9tCio5beMfju2mMLiwFz4Ca2CyWwLmEGNIVg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EE9F80515;
	Tue, 23 Nov 2021 01:00:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E858DF804FB; Tue, 23 Nov 2021 01:00:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_29,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45BD3F804FC
 for <alsa-devel@alsa-project.org>; Tue, 23 Nov 2021 01:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45BD3F804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JrjNEwl1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0CC0A61002;
 Tue, 23 Nov 2021 00:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637625612;
 bh=OYnq4wrpACbNs7esyB7jfrW82zCFu1z13PhYloNHXac=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JrjNEwl1LFCJDouVJWi/9E8aYBoMOy4OEIgefhQYYWtIQ2W6bc9aGVH8UoumkaDAp
 TyAEZ5K4iHetNaFOZDgAZl74vOYri4HA6lZFyvHqz4BzIaYKF/3Wunf0K5c+MhMwaZ
 7YxJq/prnq1ouOmbojfbwlu0Hi+clgdWyucBKBSFtNtr1OV2uGiYfdSiSTUEcAarDu
 6RV50PgabC8Lav8vzN4Nxkmc9LgkzzucpsgU5A/8OkMjWKaWzJ0o/7f/1serncIRl8
 EEpoNkYZx85uUagifg3Up7b+mJZtDI2diXWoxDrprZcVIDWn9gAs4Yg3vLUkrxWDZ9
 5POHuGg1O88VQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20211119124854.58939-1-rf@opensource.cirrus.com>
References: <20211119124854.58939-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs42l42: Report initial jack state
Message-Id: <163762561074.2471742.11078502974656470664.b4-ty@kernel.org>
Date: Tue, 23 Nov 2021 00:00:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Fri, 19 Nov 2021 12:48:54 +0000, Richard Fitzgerald wrote:
> When a jack handler is registered in cs42l42_set_jack() the
> initial state should be reported if an attached headphone/headset
> has already been detected.
> 
> The jack detect sequence takes around 1 second: typically long
> enough for the machine driver to probe and register the jack handler
> in time to receive the first report from the interrupt handler. So
> it is possible on some systems that the correct initial state was seen
> simply because of lucky timing. Modular builds were more likely to
> miss the reporting of the initial state.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l42: Report initial jack state
      commit: fdd535283779ec9f9c35fda352585c629121214f

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
