Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FA8656A33
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Dec 2022 12:58:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EE173A7;
	Tue, 27 Dec 2022 12:57:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EE173A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672142306;
	bh=6kHgo+9AsYVpxsedFFseY69MhbSiHTijIuaxAeqBGgM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=m5oSSvDArfMILr8PFg4gbPIMCdzs8JmirNxhM6z/wO2EZP0V/Dzz8ABPOQyyE66sE
	 U2iRHKt3Dl2AmJ3FeZ1UKIZ2ADV5+0R2dUUuv+yqPq0Ej1svIQv4u54tuiYxxKuZvU
	 Losj2yt1njELC6LTHI7odZVqrFoi1LjTnJYqPhnM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03DE5F804FB;
	Tue, 27 Dec 2022 12:57:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4D7EEF80524; Tue, 27 Dec 2022 12:56:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89365F804E4
 for <alsa-devel@alsa-project.org>; Tue, 27 Dec 2022 12:56:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89365F804E4
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rgYcsS7j
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 292A4B80F96;
 Tue, 27 Dec 2022 11:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49920C433D2;
 Tue, 27 Dec 2022 11:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672142215;
 bh=6kHgo+9AsYVpxsedFFseY69MhbSiHTijIuaxAeqBGgM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=rgYcsS7j4nWqThRSfu3wsgFZWH65PL2CkTzRfQQmd2zS/fZTKJ/Ly8m46WBuXRCzj
 juda2Hch7BeuwB+GVmDE8bezQYPWZZXkAFylBC0k0E7SaNEIH8/yYqqoU2u0nOIirW
 3PVf4WJH1vyYWzvHqbb7TjSbbBk8ctHo2od0Bp1WJZe/8GBIPkg9SciPO3V47B06Sd
 EkJUIHn7ohwtL5ZWgyNvXwXxjAsiyPLtxhwDVSOsP6913TGkSbFiHOoIhg+HAljnsB
 2dH/JPyl7F0GVpi4puGZd3uduFw+7nbMPVVknr8zCihQ8KNmqVRwriVqEWtmxGV77O
 jQcZDEXFlvvcw==
From: Mark Brown <broonie@kernel.org>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>
 =?utf-8?q?=2C?= Robert Jarzmik <robert.jarzmik@free.fr>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20221212174737.3740223-1-u.kleine-koenig@pengutronix.de>
References: <20221212174737.3740223-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: pxa: Drop empty platform remove function
Message-Id: <167214221401.82924.5239278488590645383.b4-ty@kernel.org>
Date: Tue, 27 Dec 2022 11:56:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12-dev-7ab1d
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, kernel@pengutronix.de
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 12 Dec 2022 18:47:37 +0100, Uwe Kleine-König wrote:
> A remove callback just returning 0 is equivalent to no remove callback
> at all. So drop the useless function.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pxa: Drop empty platform remove function
      commit: e812aa458acf7c47f9f5d8e6c62177317a998263

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
