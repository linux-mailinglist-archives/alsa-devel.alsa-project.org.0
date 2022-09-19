Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE5C5BD7E6
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Sep 2022 01:11:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05FBD163C;
	Tue, 20 Sep 2022 01:10:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05FBD163C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663629093;
	bh=a7LlRFn94EzLHVYDKwO0DpD3jU+BvtVvG0KPXia3+1Q=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PusYXP5sdLHypUy/Ytpz+VYW0xW7CY6VPWWaUvwCwD/FCpu2JLCXLs3Cxs5TN5v7r
	 5GdT5DW4OBh7S9yTHH7EXIrduCTMuVieJWulH+teIKxYykKCZrkxiBx9XF2rLMdG9t
	 4g9zWSvYTxJL+KZm2djSux0Pnx2ueynk5NSNXf0E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 028CBF80543;
	Tue, 20 Sep 2022 01:09:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E2FFF8053D; Tue, 20 Sep 2022 01:09:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DEA4CF80538
 for <alsa-devel@alsa-project.org>; Tue, 20 Sep 2022 01:09:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DEA4CF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QxUN8zJQ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97F1BB821B7;
 Mon, 19 Sep 2022 23:09:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF22C433D6;
 Mon, 19 Sep 2022 23:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663628985;
 bh=a7LlRFn94EzLHVYDKwO0DpD3jU+BvtVvG0KPXia3+1Q=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QxUN8zJQ+S+KKUnRZO54UkL+xqAgKojlMAYa51Ajg/2U7yVVSRdC6P9TlvYqvS7NJ
 VCxiRTezMuPa5jxIM2YfbGiOUrlRzu03uZdXmZ+ES5N+n+FyykFJRuKYfEgI8MDG7X
 lTLWZPIPSma/mjOQn3/EWgO92qyyIT5WcQcicoKWFUIu3IPd3jvQIemBA14yA1fii3
 T4JgMItm5PSm4I2JCzPuiW0ZNVSjzikKjYlf5MPz3RmyI6VqEhjeH7BXt4sZirQZ4s
 nMf+akbAN6BtJCyQ38l3Vp5LAwnT1URwmB1sm7HjIzN1VyJKWArocDZaGRPl29Czoq
 jvB4lWw43vzbA==
From: Mark Brown <broonie@kernel.org>
To: steve.lee.analog@gmail.com, lgirdwood@gmail.com,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220916094235.1471-1-peter.ujfalusi@linux.intel.com>
References: <20220916094235.1471-1-peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ASoC: max98390: Fix dsm calibration reading
Message-Id: <166362898355.3419825.11722534306175747499.b4-ty@kernel.org>
Date: Tue, 20 Sep 2022 00:09:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
Cc: fred.oh@linux.intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com
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

On Fri, 16 Sep 2022 12:42:35 +0300, Peter Ujfalusi wrote:
> With the change introduced by 6ac246105b4f, the calibration can only be
> done after the codec probe (but questionable if it is working since
> 203A_AMP_EN is 0) or when the codec is powered up for audio use, in other
> cases "AMP is not ready to run calibration" is printed.
> 
> This changes how this worked before the patch: the codec was force powered
> on for the duration of the calibration readout, then shut down.
> So, if a calibration was asked when the codec was active, it would have
> powered it down?
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: max98390: Fix dsm calibration reading
      commit: 9dd28b467c35eef320a2974f6b1f209343ad8704

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
