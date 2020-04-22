Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 671EC1B4421
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Apr 2020 14:17:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E712D16C7;
	Wed, 22 Apr 2020 14:16:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E712D16C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587557857;
	bh=YRE3hQ3mZRt56pe96lyIAJ+qKpTQXcgtgdsxWgSa5Gs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MmiBXzFSAHE/eYGrWxcmOjAu2U0M4Dl5hg/x0uUeCwLcYPJnBnZJcQLjw85Suc4Dh
	 sKmHAIL0Tlqmom+0R5hkFTjzF637zUqWnSp9hdUi/0+ZaDeDizhdZ6kZpToC8CpWsd
	 EkFkse7ybmxpgl92M5pcKoAzMXUCshHcD6D2XQjg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6B15F80108;
	Wed, 22 Apr 2020 14:16:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F440F8020C; Wed, 22 Apr 2020 14:16:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56EFFF80142
 for <alsa-devel@alsa-project.org>; Wed, 22 Apr 2020 14:16:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56EFFF80142
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="G2mLrnKy"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D4CC92084D;
 Wed, 22 Apr 2020 12:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587557797;
 bh=YRE3hQ3mZRt56pe96lyIAJ+qKpTQXcgtgdsxWgSa5Gs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=G2mLrnKyB0FwCJqNhD1BTignOTDvgW8U46SCqBD0s6bRm0SqbMh/M8DGfUz4LcpgY
 yQUDODaOevKU8P1qwp7BB1SY77c1ASpCmuezT8qsD7QW09EXnl3E4NW8m7nGKBMFAy
 9xnyXIOM9hDe4DUXNhcOVHHHKuAxOyqu8GwulnEs=
Date: Wed, 22 Apr 2020 13:16:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20200422083550.50711-1-broonie@kernel.org>
References: <20200422083550.50711-1-broonie@kernel.org>
Subject: Re: [PATCH] ASoC: dmic: Allow GPIO operations to sleep
Message-Id: <158755779483.28370.12289447840506285126.b4-ty@kernel.org>
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

On Wed, 22 Apr 2020 09:35:50 +0100, Mark Brown wrote:
> If there is a power GPIO provided we control it from DAPM context so there
> is no problem with a sleeping GPIO, use the _cansleep() version of the API
> to allow this.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/dmic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: dmic: Allow GPIO operations to sleep
      commit: 5d7e0b1516dfc5901d1e394f17eb55b360e7d3d3

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
