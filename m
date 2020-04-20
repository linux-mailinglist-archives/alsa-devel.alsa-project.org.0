Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A75541B0CEE
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 15:39:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58CA51680;
	Mon, 20 Apr 2020 15:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58CA51680
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587389979;
	bh=qSLyEMdFkBck+mljMG13xzjAvLPCpubntm0n35wtzGs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D3wQbAdIpLlmnUvENKkAr2LS0tl3euHcMJ1x+AcKSOZ/DKeGry1gCZD0hTwJ9X59R
	 ZerAF230TKmu5Vcf4VkyIv8Tl7hpVy5T6jrBiitePNL8xAfOXGilBmDuEJ6A1GS/KX
	 2oeOPDACuBZaW80qtV/VFnZlsu0kQWjeLOlw7v1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7763F8028F;
	Mon, 20 Apr 2020 15:37:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 84545F8025E; Mon, 20 Apr 2020 15:37:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8433EF8013E
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 15:37:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8433EF8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="X8saqD15"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9EA2320857;
 Mon, 20 Apr 2020 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587389822;
 bh=qSLyEMdFkBck+mljMG13xzjAvLPCpubntm0n35wtzGs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=X8saqD15vVDUMhQNyFjal0htzRh6HLHdz+2WF0LiYC0e9/L7Lf320pqnRVNfBAyyJ
 KmaacoKfXa27AZGbOcLheP898y5RcrH24Pg9NdnUeDSDBKfSSxCaSZXQi7CM1yCVVO
 skWB4SL1hP1YiR6uMzDMxifWAlT7lxllurGLp9W4=
Date: Mon, 20 Apr 2020 14:36:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>
In-Reply-To: <20200420114511.450560-1-jbrunet@baylibre.com>
References: <20200420114511.450560-1-jbrunet@baylibre.com>
Subject: Re: [PATCH 0/2] ASoC: meson: fix codec-to-codec link setup
Message-Id: <158738981360.28730.10303799966440949108.b4-ty@kernel.org>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>
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

On Mon, 20 Apr 2020 13:45:09 +0200, Jerome Brunet wrote:
> This patchset fixes the problem reported by Marc in this thread [0]
> The problem was due to an error in the meson card drivers which had
> the "no_pcm" dai_link property set on codec-to-codec links
> 
> [0]: https://lore.kernel.org/r/20200417122732.GC5315@sirena.org.uk
> 
> Jerome Brunet (2):
>   ASoC: meson: axg-card: fix codec-to-codec link setup
>   ASoC: meson: gx-card: fix codec-to-codec link setup
> 
> [...]

Applied to

	broonie/sound.git for-5.7

Thanks!

[1/2] ASoC: meson: axg-card: fix codec-to-codec link setup
      commit: 1164284270779e1865cc2046a2a01b58a1e858a9
[2/2] ASoC: meson: gx-card: fix codec-to-codec link setup
      commit: de911b4e683f9c28a063bb62991f2db206c38ba4

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
