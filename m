Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 617EC216E91
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:19:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B163B15DC;
	Tue,  7 Jul 2020 16:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B163B15DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594131545;
	bh=xiM86TEWnTbnoRN62OKAZLkyZO3l0Gu01472tfcVo2k=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YoSVmiqvCCKgPjbTeu96GoR20JRsTVYu08uRAWmyT0q25jcxtWSJxgFhWbXiJo5iP
	 49ftGM27C5uelYm6ewYu98sXgux8MDj9DVL9ffjYAIEcOSB8TqHvjStrci7sEf8EOi
	 oqoHYYA3HkHCsuX1Wt0qadt9moWusk+NDo/h51jc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3502F80257;
	Tue,  7 Jul 2020 16:17:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 81BAEF80264; Tue,  7 Jul 2020 16:17:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16153F8011F
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16153F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="nA/5MTV4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7EA8207FB;
 Tue,  7 Jul 2020 14:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594131434;
 bh=xiM86TEWnTbnoRN62OKAZLkyZO3l0Gu01472tfcVo2k=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=nA/5MTV4XAh3mSK0N8pd2YHm4Fc1Mw3kmvhCpNX8++J57fjyWRx2FCWXekcpEehwP
 V8u/sf6EoJ0yd5Iqw1tuazCyX6cCYd0e8drP0B+RbzLw4ove40SNlsEaOG1Cw+A+wG
 TYTV1SaxD4kB0WqEvxIUXDdtGb49T/dDvfjD46PE=
Date: Tue, 07 Jul 2020 15:17:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Maxime Ripard <maxime@cerno.tech>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20200707074237.287171-1-maxime@cerno.tech>
References: <20200707074237.287171-1-maxime@cerno.tech>
Subject: Re: [PATCH] ASoC: core: Remove only the registered component in devm
 functions
Message-Id: <159413142466.34737.6407676326055176145.b4-ty@kernel.org>
Cc: linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
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

On Tue, 7 Jul 2020 09:42:37 +0200, Maxime Ripard wrote:
> The ASoC devm_ functions that register a component
> (devm_snd_soc_register_component and devm_snd_dmaengine_pcm_register) will
> clean their component by running snd_soc_unregister_component.
> 
> snd_soc_unregister_component will then remove all the components for the
> device that was used to register the component in the first place.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: core: Remove only the registered component in devm functions
      commit: 58f30150ffd6d95efa524ff05bbcee4e95bfa870

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
