Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0153284EDF
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Oct 2020 17:24:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57F4F1726;
	Tue,  6 Oct 2020 17:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57F4F1726
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601997872;
	bh=4GwMgvhMYP09QQTaVchdH/g0FL+01bYYP1Scb0uwz8U=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/NDNLbwDFeunh4Tu4sPn0JijuU+ICIshaxwUo3vYVdtBpllK3pXcSinCg4FM6pCi
	 XhcoUiNsGeiRKts5MVXkJibqYOg7Eo6jo+Hc6eETN0Ib13QcN0I2BkbXUV85Ba+8uN
	 ESOuu2k5WGbLBcjFslSQji9jyIzJx96ug0cv9Org=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADC52F8016E;
	Tue,  6 Oct 2020 17:22:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3850F80169; Tue,  6 Oct 2020 17:22:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E9CE8F80127
 for <alsa-devel@alsa-project.org>; Tue,  6 Oct 2020 17:22:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9CE8F80127
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qWE/qvUH"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C293206F7;
 Tue,  6 Oct 2020 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1601997726;
 bh=4GwMgvhMYP09QQTaVchdH/g0FL+01bYYP1Scb0uwz8U=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qWE/qvUHB0NBFS4fuG2iUtDr3AKkcW1w/jKEYh0/k4Ve5yJkIDM3dXsRkOFAmWw/k
 FKy4+HJm7Q/mVJYw+Rsb+1XaxV9wQqstMWlrlGSwNdsI9g0H1VY/df+oz+hw2dEpqU
 gxIF/rlPSM2Drs558a+VNmoX7oswwZkLrXBq67P4=
Date: Tue, 06 Oct 2020 16:21:03 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Dewar <alex.dewar90@gmail.com>
In-Reply-To: <20201004102535.325547-1-alex.dewar90@gmail.com>
References: <20201004102535.325547-1-alex.dewar90@gmail.com>
Subject: Re: [PATCH] ASoC: omap-mcbsp: Fix use of uninitialised pointer
Message-Id: <160199764658.51353.3516318370024872903.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, linux-omap@vger.kernel.org,
 Jarkko Nikula <jarkko.nikula@bitmer.com>
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

On Sun, 4 Oct 2020 11:25:36 +0100, Alex Dewar wrote:
> Commit 9c34d023dc35 ("ASoC: omap-mcbsp: Re-arrange files for core McBSP
> and Sidetone function split"), in rearranging various files, also replaced
> calls to platform_get_resource_by_name() + devm_ioremap_resource() with a
> single call to devm_platform_ioremap_resource_byname(). However, the
> struct resource is needed as we access its members so at present a null
> pointer is dereferenced. Fix by doing things the old way.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: omap-mcbsp: Fix use of uninitialised pointer
      commit: cd7dea5e17a561e621e78e5863f5634cb6f9f097

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
