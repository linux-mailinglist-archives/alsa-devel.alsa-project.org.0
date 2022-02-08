Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B594AE1D2
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Feb 2022 20:02:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36CDB17E2;
	Tue,  8 Feb 2022 20:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36CDB17E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644346936;
	bh=b5q5pF8UzOEpYcQYZhXkzd4MKuEtCee+DCQiem20o7I=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AmT7fXTkLsuFogkTWtT2gnOd800leQgV29kZ7p4JeZQ2Bmjk7EHd1RpNmbIcs7Aus
	 b18TYCHz190ta+ydVxdhrEjyDD+YNk6mV2dwNbT+LiDHj6nLhnux86bLR4kxZ3HdzA
	 7b4Ng88FViP/dpFSHrGAwqUYHN3dBXqNuGxCrNuM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 199C7F8051D;
	Tue,  8 Feb 2022 20:00:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 337B1F80475; Tue,  8 Feb 2022 20:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF824F80475
 for <alsa-devel@alsa-project.org>; Tue,  8 Feb 2022 20:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF824F80475
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="szpdvlKL"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7EDCD612D5;
 Tue,  8 Feb 2022 19:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1063FC340F2;
 Tue,  8 Feb 2022 18:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644346799;
 bh=b5q5pF8UzOEpYcQYZhXkzd4MKuEtCee+DCQiem20o7I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=szpdvlKLkmIahCuMqao38fK2Mnfr/LsJaGZgZN4M4om1K7+862USsJ/tM/hjKXVlR
 mWxO1zE7pzkOIkD0K9jBofVB6MDCjjEvkXreBeSiWB0qkXO8BE6vZpP4I19V5ewwwi
 SSvAxbyUdqOlHM5zu51EX+K1xTFB6K+V/ltrParP14GCH310gd71ekTokWA3nUEvWL
 zsJ6JSJWCwKKI5zU8qPAN/ZnNcrAs6L4P+s22i6HRzeQ2aX+l9NMq2y93H64OdZwFy
 X/IHKhH2rGTgtJcpauuH3FsEwkooVeWP+b2ncbWFFifCrL/gDZ3Qs30fgB2pmqOq1i
 1Wb2KTqbTvBgw==
From: Mark Brown <broonie@kernel.org>
To: Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>
In-Reply-To: <20220202192333.3655269-1-broonie@kernel.org>
References: <20220202192333.3655269-1-broonie@kernel.org>
Subject: Re: [PATCH v1 0/6] ASoC: Fix gpiolib dependencies
Message-Id: <164434679879.1135369.6546240907240735507.b4-ty@kernel.org>
Date: Tue, 08 Feb 2022 18:59:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Wed, 2 Feb 2022 19:23:27 +0000, Mark Brown wrote:
> This series removes a bunch of spurious selects of gpiolib that were
> causing noise in randconfig build tests.
> 
> Mark Brown (6):
>   ASoC: dmic: Remove spurious gpiolib select
>   ASoC: rt9120: Remove spurious gpiolib select
>   ASoC: simple-amplifier: Remove spurious gpiolib select
>   ASoC: max9759: Remove spurious gpiolib select
>   ASoC: zl38060: Remove spurious gpiolib select
>   ASoC: simple-mux: Depend on gpiolib rather than selecting it
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dmic: Remove spurious gpiolib select
      commit: 823868f59ff4f1a8889120bc71a216542b79d909
[2/6] ASoC: rt9120: Remove spurious gpiolib select
      commit: 2cc12ef489a39d22230d4029c9890d27902a855b
[3/6] ASoC: simple-amplifier: Remove spurious gpiolib select
      commit: 44bd27c42a1c9a00f1fbcb58301a7f3e6f5cdd0f
[4/6] ASoC: max9759: Remove spurious gpiolib select
      commit: c29744876071c3186871515b3f849a884dc47241
[5/6] ASoC: zl38060: Remove spurious gpiolib select
      commit: 8e70aaae32b72d3088d18a3447b67112b3f5979a
[6/6] ASoC: simple-mux: Depend on gpiolib rather than selecting it
      commit: 805fff750107bce59f769a54f77205a8c4c37705

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
