Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382895692B7
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Jul 2022 21:40:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7ED9D1657;
	Wed,  6 Jul 2022 21:39:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7ED9D1657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657136416;
	bh=HlvxmsXnFuskHnbruuUM6GzPnL3zMzUWN21tU9F1Gdk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ItQ5Sf5dNZlHPHwraU4CTdMha5kKmv0G7uLZBK7EqGTX90+qZAgzap430mhSSqCnZ
	 lXDkuVyXROwHm84+Qcuo4ehzExVl8PfEgqTw55GBsFTt4vODuiEagoVdLItjMq0U4k
	 6z0bDZ8VeEMFV5Uerrv7w7/1/Ah1uaLKw7BCLr4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF690F800C5;
	Wed,  6 Jul 2022 21:39:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D414CF8023A; Wed,  6 Jul 2022 21:39:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 65F51F800C5
 for <alsa-devel@alsa-project.org>; Wed,  6 Jul 2022 21:39:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65F51F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="HYqkn6EP"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1FA33B810B2;
 Wed,  6 Jul 2022 19:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3341C3411C;
 Wed,  6 Jul 2022 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657136348;
 bh=HlvxmsXnFuskHnbruuUM6GzPnL3zMzUWN21tU9F1Gdk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=HYqkn6EPdwx8IlH74ev8csSkq8cD5eZ8qfQnFNj08A0ZxI3zygptISXDL2bwYFfQN
 xk9BguraqTTCzmDLqa3JY9DESHSAjVUXMft9G3wK3JXMztEA+jGuDU2Z+C3qHyJVJ+
 cxs6MK4976yhknpaUCvJ9+HcB3LLm6Y6Ir/7r61abWYp3LYYcFbmtIlXbhJhGHbb+F
 3jiQrg4FS5vxyrA9n2+0FPmZLDshxefSqP3UkkjC8UvJj1RVGE297yQUa99J4Q0Tq+
 AarTX2ZatSId4of4PmyRbWhuE+wSIEmPMADhdNJ1v4igKOb0kjdxA9N9nWwOUJG8/+
 LQmtsC+8ISuAw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
References: <20220705063613.93770-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: rsnd: Emit useful error messages in .remove()
Message-Id: <165713634664.1162270.8652459213550827086.b4-ty@kernel.org>
Date: Wed, 06 Jul 2022 20:39:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, christophe.jaillet@wanadoo.fr,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel@pengutronix.de
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

On Tue, 5 Jul 2022 08:36:13 +0200, Uwe Kleine-König wrote:
> If more than one call of rsnd_dai_call(remove, ...) fails the platform
> remove callback returns all values orred together which then makes the
> driver core emit a generic error message which is little helpful.
> 
> Instead emit details of which call failed exactly and return 0. Note
> returning 0 instead of an error code doesn't make a difference in the
> driver core apart from the error message.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rsnd: Emit useful error messages in .remove()
      commit: e57297fc0915e2f95de26d18ad8ab6f17c068658

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
