Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCE284ED8
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E257F1726;
	Tue,  6 Oct 2020 17:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E257F1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601997815;
	bh=IL1qUaq16zUuaudsbYu3xsH7hhilOeFElEGAdB2ZSW0=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rzq4HFYAC4EZ0AptJ6CUTzcbOduauLd/Ev8M2mc01A43VNYsrdiGzj7n7BbaYZ+OC
	 VjNvGLodBKzGXN/mGAZdIQDQArb+pOrvr28T3lKGvPEIiqQZexX2tq8BB+Gpz1rO1j
	 s8WNO5PkbWW0V/drUrpDv8Kzx/PuiHQiX+3mDJ4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C143F80164;
	Tue,  6 Oct 2020 17:22:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB516F8015B; Tue,  6 Oct 2020 17:22:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D95DF8012B
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D95DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="0lH4RAry"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B02B20789;
 Tue,  6 Oct 2020 15:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601997715;
 bh=IL1qUaq16zUuaudsbYu3xsH7hhilOeFElEGAdB2ZSW0=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=0lH4RAry/3jk/7lNm/uCSFWxzMhkOHkHY1QWm2a3yKVRgVYe63NARW6c9fc26vVEL
 iVJz4/tLGsDAjWblxHzlCTs5H8M89tKPjvYRkLjMT6aI3rDyZK68TU/W3FJgwMgVVV
 XcPAzEZI+KaiLSaQxeNgVFw2eEd1hlUgMF9ywYU8=
Date: Tue, 06 Oct 2020 16:20:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20201006101252.1890385-1-tzungbi@google.com>
References: <20201006101252.1890385-1-tzungbi@google.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8183-da7219: fix wrong ops for I2S3
Message-Id: <160199764658.51353.13573290899066355390.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Tue, 6 Oct 2020 18:12:52 +0800, Tzung-Bi Shih wrote:
> DA7219 uses I2S2 and I2S3 for input and output respectively.  Commit
> 9e30251fb22e ("ASoC: mediatek: mt8183-da7219: support machine driver
> with rt1015") introduces a bug that:
> - If using I2S2 solely, MCLK to DA7219 is 256FS.
> - If using I2S3 solely, MCLK to DA7219 is 128FS.
> - If using I2S3 first and then I2S2, the MCLK changes from 128FS to
>   256FS.  As a result, no sound output to the headset.  Also no sound
>   input from the headset microphone.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183-da7219: fix wrong ops for I2S3
      commit: ebb11d1d9fe2d6b4a47755f7f09b2b631046e308

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
