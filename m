Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A6246A3BA
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 19:03:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4576C2319;
	Mon,  6 Dec 2021 19:02:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4576C2319
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638813792;
	bh=AiU1xc1Jnt2ICB58kMPE7QKt3CB5Vizbk3iw6XtQqK0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WWTksXcnrLsQ38dik3z4ETgWXFPdamuafmXLgTZuN8O5P/zPPhqGmlYxWt49XaCpd
	 9Oc86p92ybrNVn1gov42zCVfNO1eyHC+1zhK3VxYnp1tPndJUMJ0dWlF6qwPvq81rG
	 uyg1lKooGxY1FxQKU5vIxnBf+hx50maPe9DO9//k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EBB4F80515;
	Mon,  6 Dec 2021 19:00:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0111F80506; Mon,  6 Dec 2021 19:00:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CC5B3F804FE
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 19:00:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC5B3F804FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mciFNq34"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DFD1FB811EA;
 Mon,  6 Dec 2021 18:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49EFC341C5;
 Mon,  6 Dec 2021 18:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638813636;
 bh=AiU1xc1Jnt2ICB58kMPE7QKt3CB5Vizbk3iw6XtQqK0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mciFNq34peMArE3urpNFdCWCDAh3GA2RtbopuFzoJI381ImLflVp3/sRmyQ8N8AKY
 lsvSmqFCQVnA5lg0wbHGGC0xVvPQgzTI2HlV9taN6Jnb+jN9k5ocZCJ0DiY4TjSKVo
 42w4slGBBURvfyjvXZ8xmkc5jwAxwXRx8a3R8dVJ4tW8NiaBcMA6+3Sm004OpAthWI
 Q/hhxHZhId6sHYlDymMjFP3/KxsNr6khJgZIlEsCeYtjd5hPNm8Pu88ygoBdVKCxfI
 ockfAzoleyIi0iro5iLPrqg+2YN0vDu4vwEj4OP5z/z7U6+TxUuHtdF2itkBd8Sjak
 u/u9kGzzlMbwg==
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20211202204838.75287-1-andriy.shevchenko@linux.intel.com>
References: <20211202204838.75287-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: zl38060: Setup parent device and get rid of
 unnecessary of_node assignment
Message-Id: <163881363460.2769299.5427691491147846285.b4-ty@kernel.org>
Date: Mon, 06 Dec 2021 18:00:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
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

On Thu, 2 Dec 2021 22:48:38 +0200, Andy Shevchenko wrote:
> Some of the drivers do not set parent device. This may lead to obstacles
> during debugging or understanding the device relations from the Linux
> point of view. Assign parent device for GPIO chips created by these
> drivers.
> 
> While at it, let GPIO library to assign of_node from the parent device.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: zl38060: Setup parent device and get rid of unnecessary of_node assignment
      commit: 766cc7f12078fe80dd88469e3dfe045e49bdf2bb

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
