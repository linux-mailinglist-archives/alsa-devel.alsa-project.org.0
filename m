Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796A439BEA
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Oct 2021 18:43:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1E9516CA;
	Mon, 25 Oct 2021 18:42:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1E9516CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635180192;
	bh=SUySrwU2vrG96reGvl3Ene5c6/sKiWoq3Hgb9+DeVGo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uulRfQQZ6bEFhIXZJvia9Fw2LOp/K85RsgSpRSh6qnQGGDcm3EUxR1ZufMXSlvayl
	 l119djh8Asf0pk+A5L1orGRKSDOYiIkCuZIXO/+1QopEZD76wpELX9sL+0BBlpg0TQ
	 Y4d+FmmaJ7f+Z1vahCldNe7hEE7hlUYdD7zeVkio=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E589F80517;
	Mon, 25 Oct 2021 18:40:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA6D2F80511; Mon, 25 Oct 2021 18:39:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D605F804E3
 for <alsa-devel@alsa-project.org>; Mon, 25 Oct 2021 18:39:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D605F804E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ih0lREts"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AFA960EB9;
 Mon, 25 Oct 2021 16:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635179991;
 bh=SUySrwU2vrG96reGvl3Ene5c6/sKiWoq3Hgb9+DeVGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ih0lREtsP2PNxnUUKzr6VfNnEkZui2kblyA0dUhZE3JSuNCSGFxgNAJnVBNKka4W+
 53lfqH4pxuaTyu325VaYFPruS+vKyQjAFXPMzaJ+10ou2qo9xNpmFYTyvOhxFMvyGJ
 9yq8wz0VCs68GNdZYGkhBH5cC+6hs8opKt03zPh2e50QxKKX7gdhRH1BdjzEn6CAzP
 7v/uX7iAbw8uxAGsztj2//iEhlwL+Ltm5rg+ThB91vDo9yXsEcpR+1mnycO1u27p3B
 7z0RQMD74u8w+GZ/cP8anQudOcYh5Ot0Z6waC7HDqlUcnRimw9Ydmx1jCvsppl4ys+
 zgNnipx0/uU/w==
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <david.rhodes@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 James Schulman <james.schulman@cirrus.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: cs35l41: Make cs35l41_remove() return void
Date: Mon, 25 Oct 2021 17:39:26 +0100
Message-Id: <163517996154.3558038.9417166244501241715.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020132416.30288-1-u.kleine-koenig@pengutronix.de>
References: <20211020132416.30288-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

On Wed, 20 Oct 2021 15:24:16 +0200, Uwe Kleine-König wrote:
> Up to now cs35l41_remove() returns zero unconditionally. Make it
> return void instead which makes it easier to see in the callers that
> there is no error to handle.
> 
> Also the return value of i2c, platform and spi remove callbacks is
> ignored anyway.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l41: Make cs35l41_remove() return void
      commit: ca7270a7b60dfb25b7fd180d93ea18eebd5edee7

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
