Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1A870C1DE
	for <lists+alsa-devel@lfdr.de>; Mon, 22 May 2023 17:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E3553E7;
	Mon, 22 May 2023 17:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E3553E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684767811;
	bh=Xc3OzCNv/9TsT3QJ9kDtnyKbwIPScbTEJXYBLdYZLys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=RGVb4Yn91r/XWnq644mTUN5df9W2wwnlEtDEuEkfjsLMKL6ibkXBuppJAUWsGq9RR
	 INVJWq1BBKuUPAABDhA4rgrbpiMenN5UfHnbdTybZpc6hVHtljb4NqRbXdHthpWrh0
	 +hU0tuaYI7QbavNx+GZqqn71iB+M2Ccl+uxmbh/Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B4DB5F80557; Mon, 22 May 2023 17:01:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 24E42F80551;
	Mon, 22 May 2023 17:01:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B9AE7F8026A; Mon, 22 May 2023 17:01:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6A106F80249
	for <alsa-devel@alsa-project.org>; Mon, 22 May 2023 17:01:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A106F80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=ONMvJ9D+
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6771623D4;
	Mon, 22 May 2023 15:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7272EC4339C;
	Mon, 22 May 2023 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684767700;
	bh=Xc3OzCNv/9TsT3QJ9kDtnyKbwIPScbTEJXYBLdYZLys=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ONMvJ9D+/l0QVG5Uozejv8p60mPpGJhdxa8xu+Gh8p0e/FWKitYy2iuWAEt0L8umB
	 ux7+I6x2OheOxqVawzF4bgGzBj5i0Yp+wPIHS96lYxYXg97d53V1d8wrEvWK06mB6V
	 Nq+PN0SPH+7g9OveZuabFAGRMzLOYUKYT05AyYDQFLsl4Q4t286q8C+gcWe9E9ggv/
	 +cb48l97874K/01+bqAQXjkNWyrjdfGzjRJZTJkBMJMKTEmTzSyV8hN5mXpZOMGmyx
	 XRpT4xm0r5y7QH/IrH/p6FEhNnYU9J0F/Qmd2kkbgKLbCsPqwDwbsensiwAFx0NeB7
	 4T+TK+ZV+9L2g==
From: Mark Brown <broonie@kernel.org>
To: Claudiu Beznea <claudiu.beznea@microchip.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: 
 <9b39a59f5829d200d7d1fac4e993dbf8ce05836d.1684578051.git.christophe.jaillet@wanadoo.fr>
References: 
 <9b39a59f5829d200d7d1fac4e993dbf8ce05836d.1684578051.git.christophe.jaillet@wanadoo.fr>
Subject: Re: [PATCH] ASoC: atmel: sam9g20_wm8731: Remove the unneeded
 include <linux/i2c.h>
Message-Id: <168476769819.849172.14698657660498994803.b4-ty@kernel.org>
Date: Mon, 22 May 2023 16:01:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: NZEBHQSBYSO664RDV4LL5MQFUQDB5GBS
X-Message-ID-Hash: NZEBHQSBYSO664RDV4LL5MQFUQDB5GBS
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 20 May 2023 12:21:58 +0200, Christophe JAILLET wrote:
> This driver does not use i2c, so there is no point in including
> <linux/i2c.h>
> 
> Remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: atmel: sam9g20_wm8731: Remove the unneeded include <linux/i2c.h>
      commit: 8c03fd5fbd3e5a534675dffd5647166e919e1fc2

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

