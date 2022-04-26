Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 323EA5104ED
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 19:09:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B77731863;
	Tue, 26 Apr 2022 19:08:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B77731863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650992966;
	bh=aaBawI33NbfAGFpgHbLl1Dslz5ZFBG98N9c+G0KtajE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=phS3QGpfMP/EUPXm6ctQ3eEKAX9vvBC6x5mRt7jxek++Zc7hd29PAxC2rrDhwGrTN
	 c+fBDQo2M/7WcJooqR6fyovO8RKebx9r6tmhL/KUYZDGwdzUEuoBdHrR9zv1GXCBvp
	 79TrLd/XliTkMC8rEHkYYgiSPD9VgcN+00FFq3Do=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87667F80510;
	Tue, 26 Apr 2022 19:08:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9557F8050F; Tue, 26 Apr 2022 19:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 27A63F800FA
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 19:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27A63F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="AOdq2uw6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F8C4B8210A;
 Tue, 26 Apr 2022 17:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD2C385AA;
 Tue, 26 Apr 2022 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650992871;
 bh=aaBawI33NbfAGFpgHbLl1Dslz5ZFBG98N9c+G0KtajE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=AOdq2uw62zzWiXpXg5cPtPj91ZK68OtswauVWFKecjbmYw/TT91x/GavnlxI5aj+h
 vo+Mb7Yz93VjCJz+TSvrPyffDQfedk+mk5h3HYYjhD5CVK3gRn7c5q7XrFBTrQSrIr
 NONhKDK4uxyCRprlFKokdcPJuIND6Z5YQ7LMyV2l+jgASLeZ8doJPTJbHSF9WNECXF
 4Y/Hw5Y3KjMLKpp8vp96+49WO+Bkc18ibN30kHac/ZMnVPkPSCvTV6YLDUYeE1xwEA
 6NZ0PV7dJKdYJIHGuTcCIBPRImoyVRRFGdSgFRBOG7QPNHLuXsHpYBq5+KPJcZNKrU
 IiewgXqVdPbRg==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20220425193023.61046-1-u.kleine-koenig@pengutronix.de>
References: <20220425193023.61046-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: pcm1789: Make pcm1789_common_exit() return void
Message-Id: <165099286979.2323572.8803042675528868354.b4-ty@kernel.org>
Date: Tue, 26 Apr 2022 18:07:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel@pengutronix.de
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

On Mon, 25 Apr 2022 21:30:23 +0200, Uwe Kleine-König wrote:
> This function returns zero unconditionally, so there isn't any benefit
> of returning a value. Make it return void to be able to see at a glance
> that the return value of pcm1789_i2c_remove() is always zero.
> 
> This patch is a preparation for making i2c remove callbacks return void.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm1789: Make pcm1789_common_exit() return void
      commit: 6cefb6264277c073030a3b2d91ba6b28593b4c89

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
