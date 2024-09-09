Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8335697241A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2024 23:02:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FD8CA4A;
	Mon,  9 Sep 2024 23:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FD8CA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725915760;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YL7PdUCqDbENBbrEoP+nN0uSBnHeT/445sY4dW2TpK1HOY4qVXPysBCr2q2hlpwiV
	 Q9I/iq3QmNNII7JypUj3z5iaqRvw6hAo2qv7GUtgZXNHLECYBqU4zsKUCM8gKk3UFo
	 aR7rTr/VepQTTSqnvnkcok0trDBsRYwA+8kq5WhI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7DB7F805D3; Mon,  9 Sep 2024 23:02:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 47073F805DA;
	Mon,  9 Sep 2024 23:02:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38714F80272; Mon,  9 Sep 2024 23:01:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0FD20F8010B;
	Mon,  9 Sep 2024 23:01:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FD20F8010B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=U83w8q4v
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C4484A419D0;
	Mon,  9 Sep 2024 21:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95DBDC4CEC5;
	Mon,  9 Sep 2024 21:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725915712;
	bh=fk1O36vP6EYATpW7zFnE0wBAJf09Xs8FlL14jwq2K04=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=U83w8q4vmWuUNWWa8wp6WXXICFHNrWHnRAOLoFaJwf+YGIhqaA4++V14XBYpETLmz
	 Rrd3E+kOLKplgGDfpABUQym08RyIiH3l4jAbmyk5bBAK0s0gOBxgw2KpqYkk67k29Q
	 bB2annXHCrM4S5XPhPdfW+/6Ff0w15aInu8EqGFqDTaWc6XH5oDKdHJJFazQNbDIc4
	 p3AukalcGRDrdrFRfFF1YtRIBR9v1CMyNI+juVxM1lxCtHvdKIJ/p3GvzmaDqMOg0z
	 e01KB1mHz9lEzQnWY0Dh6JJLHfYFid95AQrKjY5TyB7IUFJ0wwiByyCgketuPB89UX
	 ftt0aAFvxLWog==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org, asahi@lists.linux.dev,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org
In-Reply-To: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
References: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH] ASoC: Switch back to struct platform_driver::remove()
Message-Id: <172591570834.136248.17412626468486255591.b4-ty@kernel.org>
Date: Mon, 09 Sep 2024 22:01:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-99b12
Message-ID-Hash: VJPAVQIXUE6DV2IS6APEQGAGKKEQZSPX
X-Message-ID-Hash: VJPAVQIXUE6DV2IS6APEQGAGKKEQZSPX
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VJPAVQIXUE6DV2IS6APEQGAGKKEQZSPX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 09 Sep 2024 17:12:30 +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all drivers below sound/soc to use .remove(), with the eventual
> goal to drop struct platform_driver::remove_new(). As .remove() and
> .remove_new() have the same prototypes, conversion is done by just
> changing the structure member name in the driver initializer.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Switch back to struct platform_driver::remove()
      commit: 130af75b5c05eef4ecd8593371f3e924bcd41241

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

