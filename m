Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 012E1248C91
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Aug 2020 19:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C09F17CA;
	Tue, 18 Aug 2020 19:08:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C09F17CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597770533;
	bh=HWxo4vrMOU3esiD593QkE1IIv2od1PFXadrCi1GXvg0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uEss6oOJWZj9TDEOR09SXNIJnhiQ7IfJ7ut4cT/7zanPAYKX8QrwwpiMHYm2aqyB/
	 afqosOph8MjTRTrptV+nkt8FcElJ1SOsINy9+9JDk9+ltFsWj1Z3f1960srSkH87CV
	 yOfUsiJ9Bgzh0ZbWyRQtJsOavQoNsAc5fUaY7HU8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 639D3F80114;
	Tue, 18 Aug 2020 18:56:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE910F8038F; Tue, 18 Aug 2020 18:56:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70447F80383
 for <alsa-devel@alsa-project.org>; Tue, 18 Aug 2020 18:56:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70447F80383
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i6/2o+FV"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74625207DA;
 Tue, 18 Aug 2020 16:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597769761;
 bh=HWxo4vrMOU3esiD593QkE1IIv2od1PFXadrCi1GXvg0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=i6/2o+FVkZx5XhXbeVq05PeFkP4b+YKqK7sf/LSWWdK11eXs8CU2ydZUG76Q03f8L
 ON5z5F5O7N8duDeYBiz6/3I1JanwfbqChJN+BG8+OXHAegZVg+aHCsQF2VOmv3gT7j
 xzpHLlwlNEHPzhQDE4EhwNi4kvLlOJM31lI0rq5A=
Date: Tue, 18 Aug 2020 17:55:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <3662154.EqNIRYjrc8@pliszka>
References: <3662154.EqNIRYjrc8@pliszka>
Subject: Re: [PATCH] ASoC: wm8962: Export DAC/ADC monomix switches
Message-Id: <159776961933.56094.15928647607480426644.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>, "kernel@puri.sm" <kernel@puri.sm>, patches@opensource.cirrus.com, Guido Günther <agx@sigxcpu.org>, linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>
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

On Sun, 16 Aug 2020 03:23:34 +0200, Sebastian Krzyszkowiak wrote:
> This allows solutions like ALSA UCM to utilize hardware mono downmix
> for cases where mono output to a single speaker is desired only in
> specific situations (like on a mobile phone).

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8962: Export DAC/ADC monomix switches
      commit: 89383a2707e54b39e01407fb611662d131551bb2

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
