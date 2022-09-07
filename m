Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BAD5B0573
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 15:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DA805163E;
	Wed,  7 Sep 2022 15:38:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DA805163E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662557978;
	bh=Dd0zVj0VklHGwNIh3GmXrVi5H/IIUqMDQzHTEV3cbZA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VwJCiU3yD3tf30IcvbW+6pnkzMQfquNrXINaDNJKKWbhixn1voU2BBtKodv+EFGJz
	 lXdYo80dOl+KEedtDz1soagfmLQPwNTw+c/TQxSQXCGp7OT3DNX8+yzfAN+NIOmhBB
	 GX8SXRS/bpnEzRIOAp74EUuCyURb4FdD+hz0aBR0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 00929F804FC;
	Wed,  7 Sep 2022 15:38:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48701F804B1; Wed,  7 Sep 2022 15:37:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60B3BF80249
 for <alsa-devel@alsa-project.org>; Wed,  7 Sep 2022 15:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60B3BF80249
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="QgYAr6Z2"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 527C8618E8;
 Wed,  7 Sep 2022 13:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CFEEC43140;
 Wed,  7 Sep 2022 13:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662557871;
 bh=Dd0zVj0VklHGwNIh3GmXrVi5H/IIUqMDQzHTEV3cbZA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QgYAr6Z2uHWXxHvlO+LwPMImS4gbY9od7AtU48hSnVJAng4RW+NUxEz466vv79vKw
 Aswx5OcFGIBBh8tCaNfVhWpZvt8u3R53kBE81s+z9IRZm27KBDZCVen7ejeLDVeGfF
 5AP2qLQcuBYDrg041WGcqGtbkdwxyHV54VoKxlujRTbmAejHIl4hMTbZJwe5x5F6H/
 yNz2X3mBAzsK+R6wdekjNOuHelAiw0BrSwLDp2JuZNhu6TMtttPfxSqdgelUJdOuW5
 4jIndBJgzVOQDnGg1J23gE7Lxnjfv5ZJPzkV+BmKktI8mhyDCTTd+Z/kUAwuIh2Ppw
 fDsVcQHg4yqwg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
In-Reply-To: <YxeaITtlJexygQo9@google.com>
References: <YxeaITtlJexygQo9@google.com>
Subject: Re: [PATCH] ASoC: simple-card-utils: switch to using gpiod API
Message-Id: <166255787023.130875.15429372687220294884.b4-ty@kernel.org>
Date: Wed, 07 Sep 2022 14:37:50 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
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

On Tue, 6 Sep 2022 12:06:09 -0700, Dmitry Torokhov wrote:
> This patch switches the driver away from legacy gpio/of_gpio API to
> gpiod API, and removes use of of_get_named_gpio_flags() which I want to
> make private to gpiolib.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: simple-card-utils: switch to using gpiod API
      commit: 355beeed9319cf3ceea56c7dec874a8a9c443771

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
