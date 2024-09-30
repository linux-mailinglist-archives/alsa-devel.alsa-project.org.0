Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E098AF00
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 23:27:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3155721DF;
	Mon, 30 Sep 2024 23:27:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3155721DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727731651;
	bh=veuninIKx7QYinPBmCwwfQiyLb05lA5LCrphoSHqTqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bxo97JACQL2b9N+GmUSSp67LilNwwo7Rt9wGdxw40JCOjw0uYi1ioA4seZlAB6qR7
	 DW69Noc7LKhUSsO33VyJRUtnMcNg+cD/5/ztXjSyvq7DRFXYQES3zPoa/4nLqggITW
	 DXQltc35+jLf545kSfc5/H3zbe9iL6TX+arpQn/M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7BD8FF805C4; Mon, 30 Sep 2024 23:26:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 65507F805D4;
	Mon, 30 Sep 2024 23:26:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF6D7F80517; Mon, 30 Sep 2024 23:26:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 55000F80007
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 23:26:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55000F80007
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GiURxv7s
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id ECFB6A416D9;
	Mon, 30 Sep 2024 21:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9E2C4CEC7;
	Mon, 30 Sep 2024 21:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727731596;
	bh=veuninIKx7QYinPBmCwwfQiyLb05lA5LCrphoSHqTqY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GiURxv7sbbjhMHaH0tDr0g8pA8QZQOGxqmbeExzAcFohmWfqqAC9sK3+ZxrvuqUdh
	 BBLm0a/5EZnAzIyJALuSxxPRrxyzXPBZd4nLdhA+0oluSxdT47u7S6tl6FeMGrgOQl
	 AzZM8Ha8JYrgEQVX3rvSETBj8CZGDXN2eGr+iW+hnyRgqx1Rze0MY452pWSRKghgQu
	 7cjY9gdO1mwInCsE6xZjbMG8NQOBfowhWcBtEctqqHJhg+cYDRGAZoVYCgCyz8yHxC
	 0Dr4X/S5Wm3D1HhznhD4moZDv4BBKbLXKec5uZrZO6oyTtg7uJK4WVqMkTg3fipgYE
	 v7NloAuTt4AYg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: 
 <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
References: 
 <20240920-asoc-axg-iface-continuous-v1-1-6075d7db0e61@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-iface: set continuous rates
Message-Id: <172773159468.2197048.15947948691093286494.b4-ty@kernel.org>
Date: Mon, 30 Sep 2024 22:26:34 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: JG5QXSUNV7RQIHOM34HW755GR2EVFPXE
X-Message-ID-Hash: JG5QXSUNV7RQIHOM34HW755GR2EVFPXE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JG5QXSUNV7RQIHOM34HW755GR2EVFPXE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 20 Sep 2024 19:22:05 +0200, Jerome Brunet wrote:
> The axg TDM HW does not depend on a selected set of rates.
> The hardware itself, just takes an input clock and work with it, regardless
> of its rate. In this way, the rates TDM can take are continuous.
> 
> What might force the use of specific rate are the PLL available as clock
> and/or the codecs facing the TDM HW. Either way, this constraint does not
> belong in the TDM interface driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: axg-iface: set continuous rates
      commit: 3a02cc576accdccb22ffd2d6ac1f9788c7b4c7ce

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

