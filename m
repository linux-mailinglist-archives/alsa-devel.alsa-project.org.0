Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E3F419D6D
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Sep 2021 19:48:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9389516C1;
	Mon, 27 Sep 2021 19:48:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9389516C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632764933;
	bh=OFB2h1pUmmxmuNC7hbWEZy/mzmIVDrF2CCf76PMzO5I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=asv3sBSvx4HqzuUlteYyPtIZSTR3pnSVtLCPL1/5JOF7yDEPSeA80KRIg33kHq/VS
	 YCeTHe4FN5f7uPHPl0/UJQpNBzFPxC5sqif3/XcTVm0d2z9oVCIs9+LxH2qwONUSgu
	 HMDafyuXJOghUPVYOXhTt450syF3NKYyO8q8O7oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCACAF801F7;
	Mon, 27 Sep 2021 19:47:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47485F80161; Mon, 27 Sep 2021 19:47:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1A73F80147
 for <alsa-devel@alsa-project.org>; Mon, 27 Sep 2021 19:47:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1A73F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="oIyjtvD1"
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFA1660FBF;
 Mon, 27 Sep 2021 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632764824;
 bh=OFB2h1pUmmxmuNC7hbWEZy/mzmIVDrF2CCf76PMzO5I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oIyjtvD1Gr96SFNXU7+KT5PNhU/1XaXYvgUC44rvXID/wvO9t5qGjyiBagPAU2WvM
 AmCd5JLBvjZHk9hr+ElZ7bzkslnWgPHya9qSpFZOw/r9ZpsddafvqbRLvNYSlXnjew
 +tTLs+W+tRETnED/uV6Z1IauuBTyhUMwVPEvETYWL6xJX18aP2NT6hm/n/zXJxTJVF
 FiPTEw/H65DYO82q44b7w5pQquddRREbXUoFB2s4sm1MOxabMgpJrefS44bkPh6HP8
 EQMEkHQlgaCsQqG4eULincHAYVOyzkQWuieBuZOLiWTOblX/zzTYZiwKQXXSLV709f
 Bp5qSO1i3T3oQ==
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: alc5632: Use modern ASoC DAI format terminology
Date: Mon, 27 Sep 2021 18:45:24 +0100
Message-Id: <163276442022.18200.12739670203314121602.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210920165128.17224-1-broonie@kernel.org>
References: <20210920165128.17224-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Mon, 20 Sep 2021 17:51:28 +0100, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the alc5632 driver to use more modern terminology for clocking.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: alc5632: Use modern ASoC DAI format terminology
      commit: 155acb01bfbf9d0555463a730a4220a4e2ddda63

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
