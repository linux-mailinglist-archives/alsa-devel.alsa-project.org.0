Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 50523451AB7
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 00:39:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBC4816B4;
	Tue, 16 Nov 2021 00:38:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBC4816B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637019586;
	bh=HuEl3f7lPL2y6l7FsxchqJg97/trWBdfI6HPcHSFJi4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EcRYF+/vVdNxG+HzLpZB82+dG5jHjGdIIlBP0Z25HYUF2YZq48s78hxVrqpOJOT9u
	 v2otZRgQ3jy1b3UWYeFqaD2cklSkV9kfiGbNbzt5hGzq1vLYDp4VTNYaMzhLEz+xaz
	 GQvpBNOXau9+xc1MgPkYqYWy3QsdU7ChjdEE0w7s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8213EF80533;
	Tue, 16 Nov 2021 00:35:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 115A7F80506; Tue, 16 Nov 2021 00:35:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC6AF804FC
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 00:35:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC6AF804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="J4GDPsVX"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 94A8D63252;
 Mon, 15 Nov 2021 23:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637019315;
 bh=HuEl3f7lPL2y6l7FsxchqJg97/trWBdfI6HPcHSFJi4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=J4GDPsVXkBXR7bcx8trgWIQCPnDTSzCAToUNOFIj7ijj6VfH3UZJxfuw7CEUyoSoR
 4ur3yK4O6JLXc5+5YeljfRJSCKK0DEZVrYiv/M9oot4u7Ta5Zsrd0szm18Ie1f/b/H
 MEqYBd+HceCIUYP2BrGEMCmYUMxVafFw+igERDNdmwxLfI6qrIuZjFvQdCdJ9wSe56
 KDuudZcjbluKhgvodNxW39Rb+YnzhCVRjCRRtXyrEFt4ov1g6LQzsBvTa7kHpi+vY9
 Qan+Fe1xXjHIs6hlQddzPrpe9vbRo0ax5Ah4gJG+Qzmcx4s8EPZHQgqzdrpQnIrRxl
 XVaaUxbEpW5/Q==
From: Mark Brown <broonie@kernel.org>
To: lars@metafoo.de, perex@perex.cz, lgirdwood@gmail.com, tiwai@suse.com, Maíra Canal <maira.canal@usp.br>, nuno.sa@analog.com
In-Reply-To: <YXWo/9o7ye9a11aR@fedora>
References: <YXWo/9o7ye9a11aR@fedora>
Subject: Re: [PATCH] ASoC: adau1701: Replace legacy gpio interface for gpiod
Message-Id: <163701931331.675370.7417859226915915721.b4-ty@kernel.org>
Date: Mon, 15 Nov 2021 23:35:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Sun, 24 Oct 2021 15:42:07 -0300, Maíra Canal wrote:
> Considering the current transition of the GPIO subsystem, remove all
> dependencies of the legacy GPIO interface (linux/gpio.h and linux
> /of_gpio.h) and replace it with the descriptor-based GPIO approach.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: adau1701: Replace legacy gpio interface for gpiod
      commit: 5dbec393cd23ecfdeddced217f8a1c11228139c4

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
