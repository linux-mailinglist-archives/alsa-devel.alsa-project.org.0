Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71434576217
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Jul 2022 14:49:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB5D18D2;
	Fri, 15 Jul 2022 14:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB5D18D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657889397;
	bh=QAlCB37lDSR1Q6yFY2+peFoU18THXf/wGIKb4Zh3gk8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e8RbApI7L5NLM63uzFslWUwkM3tg/RPHi564DFzFl/rHyrlu2P877Wj9qxWAClvaF
	 jsM14jm7Y3QXszSOiVPqxmpKb8V2Mqja59G9MDvwVaiTQs7bscJKk4z45t1JOlsEcr
	 W9trOd7vRPen3XhzXk53lr5m68H4FkB2XhjT0xpw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37ED2F80212;
	Fri, 15 Jul 2022 14:48:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76D48F8014E; Fri, 15 Jul 2022 14:48:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0576F8014E
 for <alsa-devel@alsa-project.org>; Fri, 15 Jul 2022 14:48:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0576F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qgx9tgv4"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D1D7CB82BF0;
 Fri, 15 Jul 2022 12:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC61C34115;
 Fri, 15 Jul 2022 12:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657889326;
 bh=QAlCB37lDSR1Q6yFY2+peFoU18THXf/wGIKb4Zh3gk8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qgx9tgv4CIMIfNQhUbFYKuogKUypqrtPm1dfQMWQrzjXe5fgQ1tM3gUREhuYz56nl
 RPX4fNawPIhDcoXqvM5K2K+kEGT0StreRr/ZrRkj3h9VnI1+LxblS+YdOzL/E7Rn8k
 XEmwV53RVgx2FrVBFksCo6ArXD+i/ZOm/oiUra14FabKo8TnRtEovBCsivROVtj3sl
 iIZznQZbtCHUiqBJU6+CIzShQY0yH7AMsvL+MFqEjqBvXxuIbuzVRcWHo8jXzomtZI
 UnNWR8ekqM8eo2nof1w8Tw7pusowo+Y9H0zt+NLkklRtGp70RhN0mzgEM+6qlR1oJg
 oGx7kYh0UPRQA==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@microchip.com, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, lgirdwood@gmail.com, tiwai@suse.com,
 perex@perex.cz
In-Reply-To: <20220715090939.1679963-1-claudiu.beznea@microchip.com>
References: <20220715090939.1679963-1-claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: atmel_ssc_dai: remove #ifdef CONFIG_PM
Message-Id: <165788932455.2010699.4592648749095007813.b4-ty@kernel.org>
Date: Fri, 15 Jul 2022 13:48:44 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
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

On Fri, 15 Jul 2022 12:09:39 +0300, Claudiu Beznea wrote:
> Remove #ifdef CONFIG_PM and use pm_ptr() instead.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel_ssc_dai: remove #ifdef CONFIG_PM
      commit: e1d1ffeda697dedf0859f963bc4180b5bb7bf150

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
