Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F7F3DAC15
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jul 2021 21:51:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C84E41EF8;
	Thu, 29 Jul 2021 21:50:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C84E41EF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627588268;
	bh=buhNMFI+9VCWjOMaoYdJ3hTev3sxHngfjErEthfv/3g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lAtjAKGT93aqALFXVU3H8Fr/A7Uml6sBm2Fn0Yt/nCahRe3zYlHWr2SrKGRa8/mJN
	 /txXXKQaaO1Q+1S86pmVlIdrwBSmdONamV2D/5deGA6aXswTWXmiHkH7mGTU+312xy
	 ieROBL2cdhT2NA9WbcdnI+wGFfrUYK0DEJJmPQ8U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 38735F80276;
	Thu, 29 Jul 2021 21:49:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 64181F8026C; Thu, 29 Jul 2021 21:49:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F44DF8020D
 for <alsa-devel@alsa-project.org>; Thu, 29 Jul 2021 21:49:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F44DF8020D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="IbWSsKQy"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5109260EE6;
 Thu, 29 Jul 2021 19:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627588172;
 bh=buhNMFI+9VCWjOMaoYdJ3hTev3sxHngfjErEthfv/3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IbWSsKQyObaCDnAy1A09HilVYchZ3N2y2asBTI+1Ab5ayFnhNaiZGMNNAvPbFkX32
 gyIJM3lj3mCu0v/b1ScWnWNPyKWjJVcfYr5+Uef9kFtrVyP/w2QBgMigzMbPHvLjH+
 HcjvrMYwjgGqUDE9Nj5t0ow1yo2jkn9nqDigSXgsxubNZnjWctg/GUhBFmrDJ9YVFI
 rPkaIRxLuGMy4hPuGq8IL4oWvySDNvavmZXwThjpJ9fs+p+cAviE6EmM72W161i1Z5
 5u3KUuqzElccdiFkKwmASQqpUrcLS8UVrQ8V1AbhDn+eUTQpjycthSMmoQq8tn4tlR
 BBZS+4GJSVbMg==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/3] ASoC: cs42l42: Correct definition of ADC Volume
 control
Date: Thu, 29 Jul 2021 20:49:21 +0100
Message-Id: <162758812271.3952.13208728919315614383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210729170929.6589-1-rf@opensource.cirrus.com>
References: <20210729170929.6589-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
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

On Thu, 29 Jul 2021 18:09:27 +0100, Richard Fitzgerald wrote:
> The ADC volume is a signed 8-bit number with range -97 to +12,
> with -97 being mute. Use a SOC_SINGLE_S8_TLV() to define this
> and fix the DECLARE_TLV_DB_SCALE() to have the correct start and
> mute flag.

Applied to

   torvalds/linux.git master

Thanks!

[1/3] ASoC: cs42l42: Correct definition of ADC Volume control
      commit: ee86f680ff4c9b406d49d4e22ddf10805b8a2137
[2/3] ASoC: cs42l42: Don't allow SND_SOC_DAIFMT_LEFT_J
      commit: 64324bac750b84ca54711fb7d332132fcdb87293
[3/3] ASoC: cs42l42: Fix bclk calculation for mono
      commit: 926ef1a4c245c093acc07807e466ad2ef0ff6ccb

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
