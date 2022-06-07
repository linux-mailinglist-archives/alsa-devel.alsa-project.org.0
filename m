Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95F53FBDE
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 12:47:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAED71949;
	Tue,  7 Jun 2022 12:46:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAED71949
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654598857;
	bh=IOgz0dQ0/1xpf7eDJW+cN0d2nPxcoJB0Xq+WpKxag4s=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ef7SOE8tNCaaBCmQHU1Ta8zFiFrX8/BdKQNiIZ4L9dQZCzrQYDBwR2qLSjUz+Aud7
	 4rqXKt3Vn4GlaekfuYkFnYgELdl7DuLfnr3y+VnTEvJlJ0bqvKWujwjevEFsrNd0Au
	 nBx+QBkHoKBphRWfMpfWkHLiDmvL6uIXlwBOcx+Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D4ABFF80528;
	Tue,  7 Jun 2022 12:45:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAE7AF80534; Tue,  7 Jun 2022 12:45:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 259B7F80528
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 12:45:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 259B7F80528
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="awkeHSF3"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8966AB81EF8;
 Tue,  7 Jun 2022 10:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FA35C34114;
 Tue,  7 Jun 2022 10:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654598727;
 bh=IOgz0dQ0/1xpf7eDJW+cN0d2nPxcoJB0Xq+WpKxag4s=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=awkeHSF3zkt7AeKVWTWz1W0ci6IOcFZ3RoKA8EEQphs7RZz7twz2+mRyouvQi1ibq
 9zwa8wwQE8I+EFf9/n1xRwalriu4GdnysMFj1//OYs7hALOzLMLKURr7qjN2et0avO
 RuGvCH03LKlnA6uqEub2+HNQlNBelQLK12G9mt8EHMsJckbwM2rAvmT+1qMHqGrepI
 /9c5uEpiu58UpUGzSZEzVzGEXlo+k5I8ldFKsUYxoXWUD+kg+9qTtWrTMN97FuwJHo
 a/kag7WSA23boEwNxvTwA9wC/ypttJtFwe57sGCyJdeKoQsuZyyvX3jiOnAi+GjSdG
 qsOpEgI2sGQcQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, david.rhodes@cirrus.com, tanureal@opensource.cirrus.com, james.schulman@cirrus.com, rf@opensource.cirrus.com
In-Reply-To: <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
References: <20220520144738.GM38351@ediswmail.ad.cirrus.com>
 <20220520173349.774366-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] ASoC: cs35l45: Make cs35l45_remove() return void
Message-Id: <165459872522.301808.13993213912221981630.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 11:45:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
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

On Fri, 20 May 2022 19:33:49 +0200, Uwe Kleine-König wrote:
> cs35l45_remove() always returns zero. Make it return no value which
> makes it easier to see in the callers that there is no error to handle.
> 
> Also the return value of i2c driver remove callbacks is ignored anyway.
> This prepares making i2c remove callbacks return void, too.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Make cs35l45_remove() return void
      commit: 84965cc60e643db7049eb75bb9a6cc5cd66ee3d8

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
