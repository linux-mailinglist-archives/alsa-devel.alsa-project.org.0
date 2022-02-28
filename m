Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AA14C78BE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 20:23:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37411923;
	Mon, 28 Feb 2022 20:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37411923
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646076198;
	bh=l+D4DA+CZw7donT9xNUc3FpiJEsDH0lvUyai6c5t7S0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GSFpLhjmI8r8b2mP7qYgdplG3UaKqvqqfyY2VkQmW5Yrc+2zFH9QsFcRKkKNb1SEo
	 UG4rvnvSZNwZft7Dxz333zgBrmOGwIXbXuKCgvH2DNNyO6EvhOA45cMmgyeB8ceWUz
	 B8bLJsS1gw6fJYghvlzmsKVQ+sp2/6ZblBRvNAGU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBC2DF805CA;
	Mon, 28 Feb 2022 20:16:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CA98F805A1; Mon, 28 Feb 2022 20:15:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 71706F805A0
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 20:15:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 71706F805A0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="b72sLYPZ"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5AC5B81630;
 Mon, 28 Feb 2022 19:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A86C340F2;
 Mon, 28 Feb 2022 19:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646075747;
 bh=l+D4DA+CZw7donT9xNUc3FpiJEsDH0lvUyai6c5t7S0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=b72sLYPZnAQkjSE6qKpqMrhDC/jxf7XrqSGFWhotA0q2ZB8vY3yHpCD4uViPWCU0G
 ftidlpx1wPrIwmo5gQF7YIOnyjtusYho0ROd7Sx2Os7w5BvOm5Z0lMV2yxIzgJtaGs
 Shw65AYEAriTmYpvIfveOwWH9hkpusx3UOvr/WouNlcro7ZU/FuXtzPnU8T7fHxPa2
 oLmuB3Wa8JtMx96PUQvy+s+r8Qha9xeYKRg1DgLAHvVgG5GL/lxO3PkdVpOD01rnVY
 uDV3BXos/20A95oR4nfVYyOdoRFp2Ii2kJfjEGbw8HbWJv1DQThvDFnd+Frq3/eU2z
 W+PJhwiS2hYDA==
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220223003046.1697784-1-broonie@kernel.org>
References: <20220223003046.1697784-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: twl4030: Use modern ASoC DAI format terminology
Message-Id: <164607574627.3538791.2036746981293564502.b4-ty@kernel.org>
Date: Mon, 28 Feb 2022 19:15:46 +0000
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

On Wed, 23 Feb 2022 00:30:46 +0000, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the twl4030 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: twl4030: Use modern ASoC DAI format terminology
      commit: 7effe2cde907a5517489bf3927df7822c3acb13c

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
