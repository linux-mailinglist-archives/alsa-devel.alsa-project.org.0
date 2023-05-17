Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CD9706BA9
	for <lists+alsa-devel@lfdr.de>; Wed, 17 May 2023 16:52:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B788E206;
	Wed, 17 May 2023 16:51:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B788E206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684335155;
	bh=8I67luAksBCL72+meHCMN8MBL7RhGxwexXQRG0RpqDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FPPiZ5MLuDN7WDfWb2K+o+aojdU0sz+RV8zl65CvKDomrk41etjm9YO3q5zP46LAD
	 oeU081HIAO4+hkvqSwcxSgYIhTfBdx2lsRlgOUrGhK6q7TuqoGn5tcmDfr+mTdT3qX
	 g7palQiddbYPKZi+fotETZwiBSaCUKcLYRj6ExhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D52F6F8057D; Wed, 17 May 2023 16:51:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 84FA7F80570;
	Wed, 17 May 2023 16:51:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D930F80552; Wed, 17 May 2023 16:50:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 149A2F80549
	for <alsa-devel@alsa-project.org>; Wed, 17 May 2023 16:50:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 149A2F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qUWfDk+i
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B9EBF64813;
	Wed, 17 May 2023 14:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEF2C433EF;
	Wed, 17 May 2023 14:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684335052;
	bh=8I67luAksBCL72+meHCMN8MBL7RhGxwexXQRG0RpqDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qUWfDk+i2yXv7J9MhJbZBLjKRMGgL6whFTdU7YNAeRKAslCwfkZ0uu36FniV0PGoD
	 2LKSjRxPljASyj1bfOozDGNrgsmGFwvlyb+oNv+iS70fjlEQpU5bHGYPhFnCGYyhLi
	 4kPl91ugCsgauLB+ix/5ci9SbDnPcBlIWgpkRFH2fLouplPEw/XHzzF2JrbR6wHZJ9
	 pOsDGy28GRzma75ffQTQgY/6M40lmW3vDnbWlNhIwgDq1tQkZaqIWJ2X0vLbWZgUdq
	 2mgFU/rPyj0yOY9sL5N7JTrNmMqzNGIPq1NI/0JMI3axFH6bqQb8ZI1VyM6xHzvKQq
	 hHxS0voC+lQRw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Min-Hua Chen <minhuadotchen@gmail.com>
Cc: alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230516223700.185569-1-minhuadotchen@gmail.com>
References: <20230516223700.185569-1-minhuadotchen@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: tegra210_adx: fix snd_pcm_format_t type
Message-Id: <168433504910.453649.10010887587375335670.b4-ty@kernel.org>
Date: Wed, 17 May 2023 23:50:49 +0900
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: 3HKBRJVVT2U2SN26M63PR2BS7VV6UK33
X-Message-ID-Hash: 3HKBRJVVT2U2SN26M63PR2BS7VV6UK33
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3HKBRJVVT2U2SN26M63PR2BS7VV6UK33/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 17 May 2023 06:36:59 +0800, Min-Hua Chen wrote:
> use snd_pcm_format_t instead of unsigned int to fix
> the following sparse warnings:
> 
> sound/soc/tegra/tegra210_adx.c:125:14: sparse: warning: restricted snd_pcm_format_t degrades to integer
> sound/soc/tegra/tegra210_adx.c:128:14: sparse: warning: restricted snd_pcm_format_t degrades to integer
> sound/soc/tegra/tegra210_adx.c:131:14: sparse: warning: restricted snd_pcm_format_t degrades to integer
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: tegra210_adx: fix snd_pcm_format_t type
      commit: 35f8a9d87ca4f920526e6063df570490b41295fc

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

