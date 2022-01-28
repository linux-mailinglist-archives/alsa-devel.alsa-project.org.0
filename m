Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB949FD6D
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 17:00:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C8BC91706;
	Fri, 28 Jan 2022 16:59:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C8BC91706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643385629;
	bh=TNhGzP3L4A62xIW3WqJXmAepqSZa9f/QpFgq2evI+GY=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NNMK29m62trSv2kZ31p31rXI+I9KFxg0GaE689BYOblEamb+umxEJ0hKg24yfoo6o
	 uppWUaXXbXivB83vrSDMOutoZDBkVSTIi+J5/DYdOzpaCEh1kSmfyaVtHhAKWNBPDq
	 p53bRH9a3zs9ln1KN9HF1uHdDzqODFa0Suxf+FJU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6A85F8050F;
	Fri, 28 Jan 2022 16:58:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5864F804A9; Fri, 28 Jan 2022 16:58:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6801DF804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 16:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6801DF804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="cLo52bKz"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC34FB8263E;
 Fri, 28 Jan 2022 15:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879EFC340E0;
 Fri, 28 Jan 2022 15:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643385524;
 bh=TNhGzP3L4A62xIW3WqJXmAepqSZa9f/QpFgq2evI+GY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=cLo52bKzZ8GfrFghA1xPWJnhoWIHtxlzjqxTcLxSjmrczYwy/J4qkSuMpHTCKCa28
 7RBkW6WwTtldAUfdfUM1PbzM+qMGbjCXRdFNDNsSaQmTsNnh9VvZp15iTBu7yHcQIB
 lkvX/Yo80fbskFQpSmkn8WCOCGR2HT6NmWVHEJsF/AdjbazXjTvfG9ISD6d91Gt6Uk
 8FASTGnHiVa+u45iJnBg0PZ0fHZFI5bVGHSX89k87WIkRx8LPM8ea0vRZf1BgAQbSE
 6UN1EZPa5S2Z2YcbTW+8lPryFcd1epj4tLzioc3056J+8wHNxJ2Ole0Qf4rpsw8QyK
 q83EIDhiCkQ8Q==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Derek Fang <derek.fang@realtek.com>
In-Reply-To: <20220126231358.1637174-1-robh@kernel.org>
References: <20220126231358.1637174-1-robh@kernel.org>
Subject: Re: [PATCH] ASoC: dt-bindings: realtek,
 rt5682s: Drop Tegra specifics from example
Message-Id: <164338552327.1711274.18356400085950572134.b4-ty@kernel.org>
Date: Fri, 28 Jan 2022 15:58:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 26 Jan 2022 17:13:58 -0600, Rob Herring wrote:
> There's no need to complicate examples with a platform specific macro.
> It also complicates example parsing to figure out the number of interrupt
> cells in examples (based on bracketing).
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: realtek,rt5682s: Drop Tegra specifics from example
      commit: 0cfe76156cc1c7f8a707969c03ed2242db8f0292

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
