Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C660622C835
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jul 2020 16:40:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FA1E1696;
	Fri, 24 Jul 2020 16:39:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FA1E1696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595601606;
	bh=Y3rRNtfg71nMx6qz6rx66JXD55K1Y0yFf+scRNRURBs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YyMvWye16n63sARZSxZfJyG76GdeE2BWGu1qEbvdAkeKldV6FYa8Iknix4UbF4rN9
	 X7PXNRJfWWejS/sbqI+G9EJMsuhCvhV4UfWhxQ02nsyTl+eP0kfpNMhCOafE6XhpxE
	 3jab9T1+ehXTQW33QZT0UkS3d3M4PdQ/YnvYjN0k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 26EB9F8015A;
	Fri, 24 Jul 2020 16:37:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 845F4F8014C; Fri, 24 Jul 2020 16:37:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D778F800DF
 for <alsa-devel@alsa-project.org>; Fri, 24 Jul 2020 16:37:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D778F800DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZAlWr5O+"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 542FF20674;
 Fri, 24 Jul 2020 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595601451;
 bh=Y3rRNtfg71nMx6qz6rx66JXD55K1Y0yFf+scRNRURBs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=ZAlWr5O+XTfG91n0rqwmKp3rshphbA6EIBLmuQCyb8izj8jCMReYWja4yrnPq6RYd
 tcrzxLEoNG6tNr+r9BYGi93QBbwbJscxNs1A5nxmIqgTjor/Mewkq9ihkkhFtf3eYP
 QihSAcIqt3ewMLFv2S61Lz0msGDRp+q7xneMvyRc=
Date: Fri, 24 Jul 2020 15:37:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200723142020.1338740-1-jbrunet@baylibre.com>
References: <20200723142020.1338740-1-jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: soc-component: don't report of_xlate_dai_name
 failures
Message-Id: <159560143160.13017.4077278524631889799.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

On Thu, 23 Jul 2020 16:20:20 +0200, Jerome Brunet wrote:
> With commit e2329eeba45f ("ASoC: soc-component: add soc_component_err()")
> every error different for ENOTSUPP or EPROBE_DEFER will log an error.
> 
> However, as explained in snd_soc_get_dai_name(), this callback may error
> to indicate that the DAI is not matched by the component tested. If the
> device provides other components, those may still match. Logging an error
> in this case is misleading.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-component: don't report of_xlate_dai_name failures
      commit: cc4d8cebbf2a1239aab71a8077fbe20f24ec2165

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
