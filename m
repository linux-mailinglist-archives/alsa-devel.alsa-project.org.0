Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0AB94C6BA
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2024 00:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74D6CB76;
	Fri,  9 Aug 2024 00:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74D6CB76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723154835;
	bh=qtAK0UeXQRcCnP7Y+pZwRW9Qdm29Lj43pKM6k3a4U4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PzN5R6OKiAg4EQSUZPZM4kfwOW2ejICAymhWdOWgoDAxr4w4NJwSTrfaCaw/V/xpW
	 on01CbDkajX8FbmshTzq5NrXUcyMQAm1t0D6AhAEmIZjU6YEt0d31ugvx2baykb1uc
	 Kn9ld+mFpm6mI6+PMeQ3LNplB6juCA9DjQ3S5rZw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FBC2F80588; Fri,  9 Aug 2024 00:06:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9826BF8049C;
	Fri,  9 Aug 2024 00:06:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BC9CF80579; Thu,  8 Aug 2024 23:52:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,TIME_LIMIT_EXCEEDED shortcircuit=no
	autolearn=unavailable version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 503FAF80236
	for <alsa-devel@alsa-project.org>; Thu,  8 Aug 2024 23:46:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 503FAF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GB7iBy2z
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 87D2D61592;
	Thu,  8 Aug 2024 21:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3CBAC4AF0C;
	Thu,  8 Aug 2024 21:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723153615;
	bh=qtAK0UeXQRcCnP7Y+pZwRW9Qdm29Lj43pKM6k3a4U4I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GB7iBy2zOeWDJaLuvF3/XzjgSBufy8srdgMk7h+UCiYbiGidb8LtqyFWVikrd2AAA
	 4DehsFUaMiOS+XE2iIKdMzJlQCpszYg29ZvL7bYlPL+yg60MayHfVaP5+CUrfotPKy
	 17fXirqE5RtqZ9kJ3SBgYP8YHxZqGDarp5fbh96B+7miSyNiALUNG4oYrNZzH/aEw8
	 CNM2M1Lcta0NGOQ2PxMSPsOX6qiti92Usx4mRsf+6+xWmxEtEHyVJrsJkKOxUX5/ln
	 J6N79l2h0fueSsEmkv34gxldPIeqbv9McxUZw+UuhlyLV5NFsX0PFBx4CjGqdD8+Dq
	 VBTlcWCqmbtUw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shenghao Ding <shenghao-ding@ti.com>,
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
Subject: Re: [PATCH v2 0/3] ASoC: tas*: Fix up GPIO usage
Message-Id: <172315361213.480667.14057947911720144793.b4-ty@kernel.org>
Date: Thu, 08 Aug 2024 22:46:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: IEHFAX5H36LBGSP5446AAY7W6WQLXVWH
X-Message-ID-Hash: IEHFAX5H36LBGSP5446AAY7W6WQLXVWH
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
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IEHFAX5H36LBGSP5446AAY7W6WQLXVWH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Aug 2024 17:02:31 +0200, Linus Walleij wrote:
> The TI TAS drivers use some legacy GPIO code and headers,
> this series fixes it up.
> 
> The TAS2781 is a special case since it adds a handful of
> lines of deviating code to reconfigure a GPIO line for
> IRQ mode and then never actually use the IRQ obtained in
> the code. Is the line used by autonomous hardware? I'm
> puzzled by this.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: tas2781-i2c: Drop weird GPIO code
      commit: c2c0b67dca3cb3b3cea0dd60075a1c5ba77e2fcd
[2/3] ASoC: tas2781-i2c: Get the right GPIO line
      commit: 1c4b509edad15192bfb64c81d3c305bbae8070db
[3/3] ASoC: tas*: Drop unused GPIO includes
      commit: caab9a1cbb9a9fca24ceabeef57b3764d861ad32

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

