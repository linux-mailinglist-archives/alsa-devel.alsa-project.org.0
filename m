Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1283622625A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jul 2020 16:41:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFF0A950;
	Mon, 20 Jul 2020 16:40:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFF0A950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595256094;
	bh=EcWTvV7FvjC152CSceUX6DbHmfJye4qaDwlHiHugiZU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GvtvZAAuokYmfbvMoSNxQ0cnZGahy8gEdyWeUwadXi0b86ECA5g/XiGqowFH1cHcE
	 EmkCBx5S0Kul0arYn5iVF3z5/NNzfkR0Sl8HAilrEJ1PdvSpFzN/0eUnONJ69gjlYl
	 NsOVbgq+8V66j13MqUr1KFal84NsyeYHM+GeQBVI=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E910F80161;
	Mon, 20 Jul 2020 16:38:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3336F8015A; Mon, 20 Jul 2020 16:38:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ED785F800E0
 for <alsa-devel@alsa-project.org>; Mon, 20 Jul 2020 16:38:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED785F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="qcIP39ho"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EE9EE22482;
 Mon, 20 Jul 2020 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595255916;
 bh=EcWTvV7FvjC152CSceUX6DbHmfJye4qaDwlHiHugiZU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=qcIP39hoNUAdVJQvhVryEPqSGKvUM/CCT0Bl6NtT2kHxXjUmV4Y3iqt8KckyulIt2
 RAIxVA7zlh0CSdmwmNuPVE0vL1qOyord1P2Mu7d56rZlV/0Yh0uXrNR9bD2hfYF8Vf
 jI34YufHG9n7Ss1g6bJtFQWwZqNGUjmQza3rmFZI=
Date: Mon, 20 Jul 2020 15:38:24 +0100
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 Sameer Pujar <spujar@nvidia.com>, kuninori.morimoto.gx@renesas.com,
 tiwai@suse.com
In-Reply-To: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
References: <1595134890-16470-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v5 00/11] Add ASoC AHUB components for Tegra210 and later
Message-Id: <159525589435.6792.708136378511410418.b4-ty@kernel.org>
Cc: viswanathl@nvidia.com, alsa-devel@alsa-project.org, swarren@nvidia.com,
 nwartikar@nvidia.com, linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
 nicoleotsuka@gmail.com, sharadg@nvidia.com, thierry.reding@gmail.com,
 atalambedu@nvidia.com, linux-tegra@vger.kernel.org, digetx@gmail.com,
 rlokhande@nvidia.com, mkumard@nvidia.com, dramesh@nvidia.com
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

On Sun, 19 Jul 2020 10:31:19 +0530, Sameer Pujar wrote:
> Overview
> ========
> Audio Processing Engine (APE) comprises of Audio DMA (ADMA) and Audio
> Hub (AHUB) unit. AHUB is a collection of hardware accelerators for audio
> pre-processing and post-processing. It also includes a programmable full
> crossbar for routing audio data across these accelerators.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/6] ASoC: dt-bindings: tegra: Add DT bindings for Tegra210
      commit: 665308c0b44a37339b9b3368f1dd61eb66acde87
[2/6] ASoC: tegra: Add support for CIF programming
      commit: 1c3b89fb7e4a78ddcd627e3f218a216e2136ae9b
[3/6] ASoC: tegra: Add Tegra210 based DMIC driver
      commit: 8c8ff982e9e2b2eb9255fc393f938915b0ddc127
[4/6] ASoC: tegra: Add Tegra210 based I2S driver
      commit: c0bfa98349d1796fe754dfac7f7f505bb60dcd83
[5/6] ASoC: tegra: Add Tegra210 based AHUB driver
      commit: 16e1bcc2caf446fa3e1daa040b59fd6f6272a766
[6/6] ASoC: tegra: Add Tegra186 based DSPK driver
      commit: 327ef64702668bb754eeea80ce402454d7a1302a

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
