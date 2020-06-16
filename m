Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60C401FAF7E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 13:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F09D4167A;
	Tue, 16 Jun 2020 13:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F09D4167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592308213;
	bh=6LdeeLbdsC4MLcYQZFOEYWdCwIdyyxpjCra09bk486I=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QMeS0XsDsLezO6G5vz0vZzAM/bWqj1tI2tnNddh1T0SWYss+an2v4BUn+MZyO0gNF
	 YVYkGvsVdT01Hji8KUIi3wGZ9wQwMVeVRELFUPwHxHSWCEj2mVY2PzhT+fT/Ggw3Wf
	 oUFDjrVSM2DLlf6EFA4HXyb3cvNQZiBU49lFTDsc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 34994F80232;
	Tue, 16 Jun 2020 13:48:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3537F8022B; Tue, 16 Jun 2020 13:48:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AC00CF800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 13:48:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AC00CF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="trTMUySH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 474DC2074D;
 Tue, 16 Jun 2020 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592308101;
 bh=6LdeeLbdsC4MLcYQZFOEYWdCwIdyyxpjCra09bk486I=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=trTMUySH66ZNVqRmBqvP4OapO9rj3hxl2YKJ7Y5lhOuplGZqMTVc2f9V5MLJ6LDou
 Xj/JRiOK94fYrF79qSp9UA4xDbWqjvtWYUmehYtsigTRZGRbpBjDbkolYiHPZSRx/V
 HItt2cf/nLS61yEdjJS4fN9g0aHuIU5gU/nH0c8Y=
Date: Tue, 16 Jun 2020 12:48:19 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, "jack.yu@realtek.com" <jack.yu@realtek.com>
In-Reply-To: <20200616023644.4523-1-jack.yu@realtek.com>
References: <20200616023644.4523-1-jack.yu@realtek.com>
Subject: Re: [PATCH v2] ASoC: rt1015: Flush DAC data before playback.
Message-Id: <159230809945.49682.8878817468889003692.b4-ty@kernel.org>
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, lars@metafoo.de,
 kent_chen@realtek.com, kenny_chen@realtek.com, derek.fang@realtek.com,
 shumingf@realtek.com, flove@realtek.com
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

On Tue, 16 Jun 2020 10:36:44 +0800, jack.yu@realtek.com wrote:
> Flush DAC data before playback.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rt1015: Flush DAC data before playback.
      commit: 668b1508cf9e3dfd1bfad4f4906d1eaeae0a4015

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
