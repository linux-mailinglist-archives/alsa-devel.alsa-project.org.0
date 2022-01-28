Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E261C4A0492
	for <lists+alsa-devel@lfdr.de>; Sat, 29 Jan 2022 00:50:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 780931765;
	Sat, 29 Jan 2022 00:49:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 780931765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643413818;
	bh=F27xKt1k5Qx/rPYDcTSyI5MrOc5jMprMLk+/SCPUYns=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nXG+kiq3pBxcWKz0sT0yVj+t/4TeoTO70Cd/ZXNkrsuLyysRDLO9ElZUd1+UOk0qU
	 ZaxlK61GK15MxU6W4H2lBjHS4hXfS/n7SN7owr3k++396SKYu6ICg5lTjAVkjWz+eK
	 aSshsvt2rJViD0XqAY/4nf6sTdpBnnST79p9Ktn8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 595E3F80534;
	Sat, 29 Jan 2022 00:47:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2E39F80527; Sat, 29 Jan 2022 00:47:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 682AAF8052F
 for <alsa-devel@alsa-project.org>; Sat, 29 Jan 2022 00:47:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 682AAF8052F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iZtApCPC"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4F189CE2803;
 Fri, 28 Jan 2022 23:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C6DC340E7;
 Fri, 28 Jan 2022 23:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413624;
 bh=F27xKt1k5Qx/rPYDcTSyI5MrOc5jMprMLk+/SCPUYns=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iZtApCPCEgrx6ylEShx5LCCmDTNsKIo8o9fcjZZR9U5XfKhwOesohL6RQGTVKT7ly
 sRO6FhMj4LZLos75cTi9j0sl/1D0zKWK0UsIOGxz5IhQVRVeKeCY5tcbbs15DNg/Ai
 eoscUHxVYCsebvNCm16j7ZFTF7rdvKZnbEn12DfPRlu6+SBVtOVwHQ6BTjcQa45njq
 tSsUzs4C8QTdHB5OWvsbC42MnVNgZommKnUc55NybJoWaYlYzx2H6A9yjSafkd8a2j
 kGNIR1cNEiu16OnhbdN5Z97gsq0LfInqoH/PnqQZ+z7GzYkLCSbde4VId3OhyEwK6O
 roNhppw26G6Og==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220110071832.306185-1-u.kleine-koenig@pengutronix.de>
References: <20220110071832.306185-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] ASoC: cs42l51: Improve error handling in
 cs42l51_remove()
Message-Id: <164341362314.694709.18206268969781285326.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 23:47:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kernel@pengutronix.de
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

On Mon, 10 Jan 2022 08:18:32 +0100, Uwe Kleine-König wrote:
> When disabling a regulator fails while the device goes away, there is
> little we can do and the machine is probably in enough trouble that any
> action we'd want to take fails anyhow.
> 
> The return value used to be passed on in cs42l51_i2c_remove() (i.e. the
> i2c device remove callback). But the i2c core ignores the error code
> (apart from emitting a generic warning) and removes the device anyhow.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l51: Improve error handling in cs42l51_remove()
      commit: 73d4c3135b2aa2308fe058f58ddbf658436aa385

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
