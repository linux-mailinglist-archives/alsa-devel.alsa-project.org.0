Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2017BEAAF
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Oct 2023 21:34:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83EC8ED1;
	Mon,  9 Oct 2023 21:34:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83EC8ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696880096;
	bh=3vSQGl8AKGsrfujKMh0CxRfl2/dxm1puOS4ZfrVqiOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=lyi3HNjb9sshyxEjI+P/oHAStzqst4ysOml4T7igYmSOAR+JzZBZwpMXC9OMya2pX
	 SSfy6f+jNRKP+kl3RM9bf2HmVhGgq6MpPdLxjKURQAdSjr4jXwIksDpKLnbe1oRgEw
	 AKCGr74A23ck5+fUTmtSmhew5E7uSNc7w6YGCTV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A8AB7F8015B; Mon,  9 Oct 2023 21:34:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F71F8027B;
	Mon,  9 Oct 2023 21:34:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0D1E2F802BE; Mon,  9 Oct 2023 21:34:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3E429F8015B
	for <alsa-devel@alsa-project.org>; Mon,  9 Oct 2023 21:33:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3E429F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kqFhJBLb
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1D8F76124E;
	Mon,  9 Oct 2023 19:33:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED7C2C433C7;
	Mon,  9 Oct 2023 19:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696880028;
	bh=3vSQGl8AKGsrfujKMh0CxRfl2/dxm1puOS4ZfrVqiOQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=kqFhJBLbV57LCCJaaGa4Cb6xeE1pwKxBLjp1vrm0M8gC8Jmygrgbw44uVuMC1xJcL
	 iIwWM0BMCU0VDZ97wHTtrGSr9jBN9zS4XQKyptleasbRpyzlDxP8vuq0ds579CS79q
	 9cqIOB4W+MAevB2BsAgJy5UyEcK1qYoCJZNFIZEzN1XFgDcWNN9l4v4+htQbiULn9x
	 3A489kPRl5cgnkrkQuOGQ2QFmbovWkMf0fjokrDYa6EW5lxFKXV5dfHCd5cv660Pqa
	 P2da3GVyqDBCKdGJLaM+b0/ybnr+3q4r45vgAyV29YJUXP0zigXz5NjG6XRsVovFdq
	 gzFlhg72cEHTQ==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 alsa-devel@alsa-project.org
In-Reply-To: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
References: <20231006-descriptors-asoc-mediatek-v1-0-07fe79f337f5@linaro.org>
Subject: Re: [PATCH 0/8] Convert Mediatek ASoC codecs to use GPIO
 descriptors
Message-Id: <169688002562.148554.2449511739055608946.b4-ty@kernel.org>
Date: Mon, 09 Oct 2023 20:33:45 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: KZSJ4GSRXUHLWZ46MFYLPRGTK4DREWLF
X-Message-ID-Hash: KZSJ4GSRXUHLWZ46MFYLPRGTK4DREWLF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KZSJ4GSRXUHLWZ46MFYLPRGTK4DREWLF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 06 Oct 2023 15:46:23 +0200, Linus Walleij wrote:
> Convert over the Mediatek codecs to use GPIO descriptors.
> 
> One few-liner affects gpiolib-of.h, I don't think there
> will be conflicts so I suggest that all of this can be
> merged through ASoC after review.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] gpiolib: of: Add quirk for mt2701-cs42448 ASoC sound
      commit: 9e189e80dcb68528dea9e061d9704993f98cb84f
[2/8] ASoC: mediatek: mt2701-cs42448: Convert to GPIO descriptors
      commit: 654a23724072f37c0d07b31395e1d9f45f5563ab
[3/8] ASoC: mt8173-max98090: Drop unused include
      commit: b1306c3b6140f0c299f727edc9bb90ec79700614
[4/8] ASoC: mt8173-rt5650-rt5514: Drop unused includes
      commit: 94a7f618211652235f3e4b88aca477391078dba6
[5/8] ASoC: mt8173-rt5650-rt5676: Drop unused includes
      commit: cb1c18e8a7337c7f3ee461b613a52a45c3f723d5
[6/8] ASoC: mt8173-rt5650: Drop unused includes
      commit: 6dffd1f38ad76660e7fff8e269889284e892603d
[7/8] ASoC: mt8186-mt6366-rt1019-rt5682s: Drop unused include
      commit: 73e1f8a05bd8289ab5154c703a0592729267e979
[8/8] ASoC: mt8192-afe-gpio: Drop unused include
      commit: 3b5d22bdf33c4e44016fdcfc8904a0b0bf218e75

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

