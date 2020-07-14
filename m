Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0E121F788
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 18:42:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A12211612;
	Tue, 14 Jul 2020 18:41:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A12211612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594744952;
	bh=GxYEQ0ZE+PQYiELuKdT9mB9ND5rBTIQP1mYSyp5CoFY=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gVw+V5+J2XP86bR6GTSoCE2ZWqnA9rAX8QF/AHhRYcezTr9xiBpIO0l2G/zizuDEO
	 uVRO/SMoq034jRlG+Z2f9A55Lprs/q4snovKjXGciHbYZEvgLEzGm4VAUgqx/cVroB
	 ClQCul36g3KZ17T3kod5o6ZLRMmN76t8rYXtm+ls=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC830F8026F;
	Tue, 14 Jul 2020 18:40:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9330F8028A; Tue, 14 Jul 2020 18:39:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C1D3DF801F2
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 18:39:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C1D3DF801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="lVQhdWmH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C345622475;
 Tue, 14 Jul 2020 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594744791;
 bh=GxYEQ0ZE+PQYiELuKdT9mB9ND5rBTIQP1mYSyp5CoFY=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=lVQhdWmHbY5sHD5v1JROjRFjs3iFLrpVsC0ix8DjXt0O7ROEuVizPnIBsQJbUeruM
 lQZRsIyDjroKxRFQRZrOlERYHYXqvngQ7HkoXH+xVqX0WnA5vnhBHmALlPeT7o7a2Q
 yEl9cHhWIVW7UNxBbxuz2ysetjPgs8YMKMLhIZrw=
Date: Tue, 14 Jul 2020 17:39:42 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "derek.fang@realtek.com" <derek.fang@realtek.com>
In-Reply-To: <1594721600-29994-1-git-send-email-derek.fang@realtek.com>
References: <1594721600-29994-1-git-send-email-derek.fang@realtek.com>
Subject: Re: [PATCH RESEND] ASoC: rt5682: Enable Vref2 under using PLL2
Message-Id: <159474477218.998.1913180416899971436.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, shumingf@realtek.com, flove@realtek.com
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

On Tue, 14 Jul 2020 18:13:20 +0800, derek.fang@realtek.com wrote:
> Enable Vref2 under long term using PLL2 to avoid clock unstable.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt5682: Enable Vref2 under using PLL2
      commit: fa291331cb24bd9665096d660b917998285aae17

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
