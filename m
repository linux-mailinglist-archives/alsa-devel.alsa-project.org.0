Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CAB538CA1
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 10:19:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAAAD1EEF;
	Tue, 31 May 2022 10:18:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAAAD1EEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653985154;
	bh=fSVEgHaQGJCievYHd/siPU9MrxqftRRsLr4LLyS7pIE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gz1vaHv6byowD0oYoNpKwdOZd/9vFNGo6sLOxCcUtavdLB/moABPncmewQAKcWQZD
	 6bOtSz8V6IXO//UeK7liNaIDLzmQtRREIY/YICzRab5NdVUmeqyBGJLotSb+01CyJD
	 Vc6JStb2UzdD1KbwUMd4ky67DWR+VBAartm/Mnk8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CD02F800DE;
	Tue, 31 May 2022 10:18:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 560A2F80161; Tue, 31 May 2022 10:18:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4AB1F800DE
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 10:18:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4AB1F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="e8AAYJgW"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E8C261232;
 Tue, 31 May 2022 08:18:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B8D3C341CA;
 Tue, 31 May 2022 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653985088;
 bh=fSVEgHaQGJCievYHd/siPU9MrxqftRRsLr4LLyS7pIE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=e8AAYJgWyOqcPINHbX51cvc9F2YNxkdwn2HcDd7WPgbW0dK5XJlLPPb18vVmBIH5/
 xEKw9Uh8hZ0K4/K8i3d6juxZNufcKIErfb9Y0RAv1v6RpZAyYsiLy66/+IFHFvIowy
 lmh1O2CTB7sAf1RXjYmQO8Fhx82xGX4np+blffUij1w8D6lhp4gUh1b2D/F0RcQTDX
 /XU88mpNGZzcVowqyQom2hBeybvzYJrcQGkZ5/f4pqtr2u7EHrX1tkdsmKKJVzt2SB
 dO1naBmegRow+N9JPAukBqOHJZvzN8rJjZYcb8oFCUR5qGLcj2tpJr0PhQkzcd7Bu1
 dHjjuiLE0ueSw==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, lgirdwood@gmail.com,
 DLG-Adam.Thomson.Opensource@dm.renesas.com, perex@perex.cz
In-Reply-To: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
References: <cover.1653916368.git.DLG-Adam.Thomson.Opensource@dm.renesas.com>
Subject: Re: [PATCH 0/2] ASoC: da7219: Small fixes for jack detection and
 removal
Message-Id: <165398508710.2913674.18295857798607070807.b4-ty@kernel.org>
Date: Tue, 31 May 2022 10:18:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: DLG-Support.Opensource@lm.renesas.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org
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

On Mon, 30 May 2022 13:22:21 +0000, Adam Thomson wrote:
> This series contains 2 small fixes around the AAD part of DA7219, particularly
> in relation to jack pole detection on certain active headsets, and tidy up
> when a jack is removed.
> 
> Adam Thomson (2):
>   ASoC: da7219: Fix pole orientation detection on certain headsets
>   ASoC: da7219: cancel AAD related work earlier for jack removal
> 
> [...]

Applied to

   broonie/sound.git for-linus

Thanks!

[1/2] ASoC: da7219: Fix pole orientation detection on certain headsets
      commit: 06f5882122e3faa183d76c4ec2c92f4c38e2c7bb
[2/2] ASoC: da7219: cancel AAD related work earlier for jack removal
      commit: 2d969e8f35b1849a43156029a7a6e2943b89d0c0

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
