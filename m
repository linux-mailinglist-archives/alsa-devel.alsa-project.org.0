Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD64D53FC8C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:58:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7B2811AB9;
	Tue,  7 Jun 2022 12:57:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7B2811AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654599480;
	bh=FDFBcJGjSYENS9Wie/PcB7Lo2uPkUUFHOAyGZSbtvj8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VHw0hQKcAAwz+Osx8u75yqOjkLn0qIbSogf/3zN2hARiN8PzgLheIkrfqnLsn2FOL
	 W20oBQOWqJZ+KKtcnMSuNUqZ9z2I3KNfZi2t+B6T19YIV3GiYs8Rq3k1I0stGjlyzj
	 hBRqe56tVtzXFEfIDt6gEU7oyED6TvpNwsdOcyjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3ABBF80567;
	Tue,  7 Jun 2022 12:55:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2130F8053D; Tue,  7 Jun 2022 12:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 670C5F8053D
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:55:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 670C5F8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="tEyJt7m6"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6DC1CB81F0E;
 Tue,  7 Jun 2022 10:55:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 117F6C385A5;
 Tue,  7 Jun 2022 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654599307;
 bh=FDFBcJGjSYENS9Wie/PcB7Lo2uPkUUFHOAyGZSbtvj8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=tEyJt7m6UMfKJM4FtawRCAkzEuZUvqEp39bZS1ZHhpH5QR2o9Bvy4jPqxRuo7kkXr
 owMAVfzGqxU0gND+1EecNWb7rNQ/3hSW/Dr63906K/qxlzrNjOSE9bYzvPypTQUIcg
 I3Og0aIoXQgSIlFx47eob1snZuBasyvTO5bpQybM9KHkYC/qXobMBBVieV//BZ80iB
 7ZxJNB28V5icI7+WuSnrxbCZZtqWikWwGNKZfsq4bcstHhPO2CtFsUIplOkUqDoU9N
 hbgA5EGvzSZ1wm2i90qiBEu1ZIXHq2Bdeq6tEweVyzXi1TxHgBCVgW6THq9+jJp32B
 Zw993f7OtZ5zg==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220526134239.1593877-1-u.kleine-koenig@pengutronix.de>
References: <20220526134239.1593877-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: ak4642: Drop no-op remove function
Message-Id: <165459930579.399031.15779916341866082845.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:55:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kernel@pengutronix.de
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

On Thu, 26 May 2022 15:42:39 +0200, Uwe Kleine-König wrote:
> A remove callback that just returns 0 is equivalent to no callback at all
> as can be seen in i2c_device_remove(). So simplify accordingly.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4642: Drop no-op remove function
      commit: 60391d788a221f1866492a71929483790b772676

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
