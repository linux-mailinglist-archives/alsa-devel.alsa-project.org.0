Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A95A419D8D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:52:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9244A16BA;
	Mon, 27 Sep 2021 19:52:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9244A16BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632765171;
	bh=IR4B6aYnMXTGnB/crg9w4tGGrD3fv788HScxhhvhhPM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nwot6o55dA9sjz6WCH6wD2XR5A28T7QDMm61J/9GFo4BWZW0/3cZTMaJCy7nKB3CY
	 T+QlVjjE//HWUmTEVvpWEMH468PYOa+wI8zdjM4BMBzx/ToZwDpN8Hbcn4tTLM/FfW
	 mx0W4MleJykFFtkQW0NFK+AP9QmppGBKdv7Ay5gg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47F96F8052E;
	Mon, 27 Sep 2021 19:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2F68FF8052E; Mon, 27 Sep 2021 19:47:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8663DF80527
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8663DF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K7yBdRQt"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6803B6113D;
 Mon, 27 Sep 2021 17:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764856;
 bh=IR4B6aYnMXTGnB/crg9w4tGGrD3fv788HScxhhvhhPM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K7yBdRQtUuaX4uucNKIkzT/zgCumDut+qkfVoLi4FuQbQD7RtYYvU5U4Q6B2gPjw1
 Wx4VammlEEb+C9cxIOHwBsehmXORQM+a8gM9+EMdL0RXb+p8sSyCx6IU/KDxZsVfie
 yRRfGj/d7Iz+Y03d9OvcUa/rfYc3BBxcrG22u6ukVkAi9bj3BjJQJPw9niufto5nTr
 30IywusZM8f3hkWznFFcOHnsuT6bUZ9cm9+qxV9LFonRiP2kL3qTTAgTpwHz9m5rMQ
 2irgAFMGD0tcDLj0fEUhJmpB2UYIhbsjZ3jX46F464dd8Qg+RMelBu44GCnCUISnuR
 miQcQMvOHTP8Q==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: ak4642: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:36 +0100
Message-Id: <163276442022.18200.6006217883014724535.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920164042.16624-1-broonie@kernel.org>
References: <20210920164042.16624-1-broonie@kernel.org>
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

On Mon, 20 Sep 2021 17:40:42 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the ak4642 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4642: Use modern ASoC DAI format terminology
      commit: 3e8908fbfd9c0dc588e99c1c4d81a5fe43516f0f

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
