Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 182B98375A4
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Jan 2024 22:55:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E72CB65;
	Mon, 22 Jan 2024 22:55:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E72CB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705960512;
	bh=EeDjJlLHY6iFwJ0hkXfNBUcyQNF3sYQV0gkXYFzIUKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WFRWTGXuEI/pSlROurxV6HH1UNTC53ztJivXkNdLchfDXuNnrICAh7+iqit0Lxeva
	 l4CZkF36DuXU2aglX04a8yq5q0jqBPszewFYHeh5X/KeaeZHALPcb/oFCLVh0p7j3D
	 akuwgcu5pUp5ScYGxi5gUSCCwnmuYjUyQWZre97E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06CCEF805B5; Mon, 22 Jan 2024 22:54:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ACDCEF805B3;
	Mon, 22 Jan 2024 22:54:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 909C6F802BE; Mon, 22 Jan 2024 22:54:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 77E1BF800C1
	for <alsa-devel@alsa-project.org>; Mon, 22 Jan 2024 22:54:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77E1BF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qRGmZsG0
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8E895CE2D35;
	Mon, 22 Jan 2024 21:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7988C43390;
	Mon, 22 Jan 2024 21:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705960449;
	bh=EeDjJlLHY6iFwJ0hkXfNBUcyQNF3sYQV0gkXYFzIUKc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qRGmZsG0n0pbfTQwQgnz+TuBnM66swIVaH9h0QJShmFy6RXhQ3MCiJEqcFiTghpN6
	 8IcbTwBtX7aC0i64PwbrEYEyO2n+56CjGtSmPjoG7+AGL+lrmlqDMZBzhknrdkvrgD
	 YHofstpgXpfYwO+a5m22RQdeVErn2nkceiKmqzTPaIsc6m0SJ0O0dRbD6Y7cQ1llN6
	 d/NvJu7O4cAMl9gdUn1Wn6OoMsZQQ2wKZvAshAUlFEeEIshN2O82WzybfYWDGZDGAA
	 0XqAoc7JEy+1Q2v3TsZaNUJjvBEV1WIhqWpvozyq5NYHTsTwN2mTyBmLKCb0ZsLyg1
	 nqNHLFSwhv3jg==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=83=C2=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
References: <871qaoy9q7.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/3] ASoC: use devm_snd_soc_register_card()
Message-Id: <170596044638.161959.8281079331696349966.b4-ty@kernel.org>
Date: Mon, 22 Jan 2024 21:54:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-5c066
Message-ID-Hash: HH4MB3JZLRPPDS5W72IYWSWTRFGZH6AT
X-Message-ID-Hash: HH4MB3JZLRPPDS5W72IYWSWTRFGZH6AT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 11 Jan 2024 00:50:09 +0000, Kuninori Morimoto wrote:
> These are v2 to use devm_snd_soc_register_card() on ASoC.
> 
> v1 -> v2
> 	- focus only simple case.
> 
> Kuninori Morimoto (3):
>   ASoC: ti: use devm_snd_soc_register_card()
>   ASoC: fsl: use devm_snd_soc_register_card()
>   ASoC: atmel: use devm_snd_soc_register_card()
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ti: use devm_snd_soc_register_card()
      commit: 98e9645a35993f8cfe99e36c9ba3e6a8c1783d78
[2/3] ASoC: fsl: use devm_snd_soc_register_card()
      commit: a4005007161c9df8fa4f44a776c624f68ec34a69
[3/3] ASoC: atmel: use devm_snd_soc_register_card()
      commit: 00352af2504a90381ec733237c3ef444032d5f1f

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

