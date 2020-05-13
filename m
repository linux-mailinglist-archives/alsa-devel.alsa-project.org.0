Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB4A1D1AC7
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 18:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 725E01665;
	Wed, 13 May 2020 18:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 725E01665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589386523;
	bh=FZ1M3OZRM7jW9vqDsr/RzhwezaAUizYn3SALLQyOYSQ=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=du6a/3P39kI/F76V/4Lio6Op8zYu8GYpDEBCooyVLb3EiSwOtBgi5hbjCCd+bOS2h
	 fQbB+9XDJrGl939Sr30ZbTK/QnWxC5cWIkOKElAbBW37mi4Sxvny9DtIjP3H1yQQrg
	 l2muvyKiB37F3HLjA8opJZwxsU/7VCo2lt+LCchM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92085F800B7;
	Wed, 13 May 2020 18:13:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 46D6FF80247; Wed, 13 May 2020 18:13:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3E608F800E3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 18:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E608F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="xntG21/I"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42DA1204EC;
 Wed, 13 May 2020 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589386413;
 bh=FZ1M3OZRM7jW9vqDsr/RzhwezaAUizYn3SALLQyOYSQ=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=xntG21/I7Ay8cOTAJfy7iyCU1UqELUJvsfSS2XB/cjC05nvuQp0mSZAePVM3mXpnn
 C0bU+iTfDiyqtBqHpW1KYEMTH/lMw/KQmpUKqIKC7zK20xtlUeWigXFmt/WrpPNgQn
 9ndkSa4hVk/WU72qg9yg2lKthIPbRHIpPxypHSjc=
Date: Wed, 13 May 2020 17:13:30 +0100
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 Dan Murphy <dmurphy@ti.com>
In-Reply-To: <20200513142807.11802-1-dmurphy@ti.com>
References: <20200513142807.11802-1-dmurphy@ti.com>
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix bias config values
Message-Id: <158938641090.28795.1473298461328605544.b4-ty@kernel.org>
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

On Wed, 13 May 2020 09:28:07 -0500, Dan Murphy wrote:
> The device tree binding declares the ti,mic-bias-source and the
> ti,vref-source properties as u32.  The code reads them as u8 which is
> incorrect.  Since the device tree binding indicates them as u32 the
> conde needs to be updated to read u32.
> 
> In addition the bias source needs to be shifted 4 bits to
> correctly write the register.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

Thanks!

[1/1] ASoC: tlv320adcx140: Fix bias config values
      commit: 0e36f32f6b6c4c86a6bf3d6f0940831691b0a3b0

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
