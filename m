Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97A624A3A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 20:05:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F899166C;
	Thu, 10 Nov 2022 20:05:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F899166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668107156;
	bh=P84Ae0OVSjLriM+LMwCx/4pQY5c2hZAQryWUgrF5sKs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HGG1we3N8H7iTTRs11YrebfuXtz+5deiWCd6Wkow2c3CuEQbgUUchIlq4go03/19y
	 1rSnNquDHr64+7bVpfdpbSmDWLoIqQt0/V10M0ilUgLsQhGBhR4/WTSsKHCBFJ+B8p
	 GFe6v9963teOLi3DTJUIKLEZBSeU8P3/BbiO6tvE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2AB10F80104;
	Thu, 10 Nov 2022 20:04:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09F44F80104; Thu, 10 Nov 2022 20:04:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88E38F80104
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 20:04:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88E38F80104
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MdCBhY/Z"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id A5AB8CE225C;
 Thu, 10 Nov 2022 19:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21BAFC4347C;
 Thu, 10 Nov 2022 19:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668107066;
 bh=P84Ae0OVSjLriM+LMwCx/4pQY5c2hZAQryWUgrF5sKs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=MdCBhY/ZxXyc2FJPPprOdUJVW6KsAQuyH506It9HaZHpZM84C4O1qhUqcdDrFxEIn
 9ATgl+41Nt7d9xv0B6Me5lb1MWFCos1ONMK7ly80XhS7TmefG/quxkOUv7JGXKc6Js
 f4kzDU3SGs/k86bxQBHpU1CltDzMpNI0zx4wgcu9kKhexxwK7p+90MoHy0WSyBiDLJ
 oJbysYsZPuqOEzQ68zI1kVC7vkwhMl+UdqdayeWqYqSp55hWb8W5z8qnBqvus+iSU7
 ElULPMqvMPhJQKEBBKqs+ravPC3yDL4alE+RDMUH3OO0Zv6EkHNcXUEzshJR/mZ97a
 0ag2bK5TrdlHA==
From: Mark Brown <broonie@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
In-Reply-To: <20221110084406.287117-1-olivier.moysan@foss.st.com>
References: <20221110084406.287117-1-olivier.moysan@foss.st.com>
Subject: Re: [PATCH] ASoC: stm32: i2s: remove irqf_oneshot flag
Message-Id: <166810706385.995851.10605818222907923454.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 19:04:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Thu, 10 Nov 2022 09:44:06 +0100, Olivier Moysan wrote:
> The IRQF_ONESHOT flag allows to ensure that the interrupt is not
> unmasked after the hard interrupt context handler has been executed
> and the thread has been woken. The interrupt line is unmasked after
> the thread handler function has been executed.
> 
> The STM32 I2S driver does not implement a threaded IRQ handler.
> So, the IRQF_ONESHOT flag is not useful in I2S driver.
> Remove this flag to allow the interrupt routine to be managed
> as a thread in RT mode.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: stm32: i2s: remove irqf_oneshot flag
      commit: 7c0f8f1462c9edeaa202a2cbea1bde0960434b09

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
