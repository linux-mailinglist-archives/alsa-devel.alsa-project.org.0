Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ABAAD2115F5
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Jul 2020 00:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 523801681;
	Thu,  2 Jul 2020 00:24:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 523801681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593642315;
	bh=cJ/E7eJozKmA8owHe5A5Mzv6L3LI8x9nRfUS77HPINA=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ejOIOZPJUfmrZqt89J2B5OgxGQBhZRxsZSABxquD+M1OnAMx1tEkCFwAK2TTeAlRN
	 Cx9SrmMFCh0FEntdYVJa+qmH2Qe9fW6o3lUML80vbSUpBZClesaunU7ECOMX/P+7Ct
	 LDLWM3722KPTUy/414nrN2el7LcdPje9jA9eFbcM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13300F8025F;
	Thu,  2 Jul 2020 00:22:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 48E77F8025F; Thu,  2 Jul 2020 00:22:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57EE9F8020C
 for <alsa-devel@alsa-project.org>; Thu,  2 Jul 2020 00:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57EE9F8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="eoZetv18"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 77574207E8;
 Wed,  1 Jul 2020 22:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593642163;
 bh=cJ/E7eJozKmA8owHe5A5Mzv6L3LI8x9nRfUS77HPINA=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=eoZetv183/MwvWt4g9XDdVjYYsLTKM3H+xWZ9H88Ciadikq8X5B7IjbZPxke7OytK
 0khhZ0pQ70pTNdYl1Wko3KkJCe4bG+XwA2DNLuFlfOs/+1Oa5euSv4F5l2qhUSjjCZ
 eYZ09tWNMNXg6H1ACS8jpDmejaNm2KrM+ZcGDXSU=
Date: Wed, 01 Jul 2020 23:22:40 +0100
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 robh+dt@kernel.org
In-Reply-To: <20200630125843.11561-1-peter.ujfalusi@ti.com>
References: <20200630125843.11561-1-peter.ujfalusi@ti.com>
Subject: Re: [PATCH v4 0/3] ASoC: ti: Add support for audio on J721e EVM
Message-Id: <159364215574.10630.2058528286314798186.b4-ty@kernel.org>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Tue, 30 Jun 2020 15:58:40 +0300, Peter Ujfalusi wrote:
> Changes since v3:
> - Fix the single clock source handling and typo
> 
> Changes since v2:
> - DT binding:
>  - use proper (?) patch subject for the binding docuemtn patch
>  - drop pll4 and pll15 from DT - driver should check the rate via
>    clk_get_parent. If it is not available (as it is not currently) then use the
>    match_data provided rates.
>  - add simple explanation for the clocking setup
>  - Use descriptive names for clocks: cpb/ivi-mcasp-auxclk and cpb/ivi-codec-scki
>  - dt_binding_check shows no errors/warnings
> - ASoC machine driver:
>  - Try to read the PLL4/15 rate with clk API (parent of the two clock divider)
>    if it is not available then use the match_data provided numbers.
>  - Support for single PLL setup
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ti: davinci-mcasp: Specify stream_name for playback/capture
      commit: ef3ab250aad9920fa7fd6280051c92a488109b87
[2/3] ASoC: dt-bindings: Add documentation for TI j721e EVM (CPB and IVI)
      commit: 8142500e7dc0d214e3c7a22788116f71cd84f07b
[3/3] ASoC: ti: Add custom machine driver for j721e EVM (CPB and IVI)
      commit: 6748d05590594837e42dfa975879fb275099f0b2

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
