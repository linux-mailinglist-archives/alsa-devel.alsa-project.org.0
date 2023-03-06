Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 412D36AC141
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 14:34:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0EB91116;
	Mon,  6 Mar 2023 14:33:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0EB91116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678109647;
	bh=n4vaoJypBj3ZnWOSr2/6ylu1yP0IfC9GLrLhygb790c=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=inP/dT/1feu6U0pcotFSSr+dNiJymWAhbIl2lK97co4ByAnEtaYpISO5orzrI5Czl
	 EQOLDYof+U65xaRPwGt6M31Uw1Fx8l2jkd46SyGr/0KTYlWFv0GCNu3XI4ve9oZCC0
	 o+q/VQ17XP3py2EkAGe4EGXNt9GgFAARo1aTcQ5Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E1257F80482;
	Mon,  6 Mar 2023 14:33:16 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF0F6F80482; Mon,  6 Mar 2023 14:32:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AD75BF800DF
	for <alsa-devel@alsa-project.org>; Mon,  6 Mar 2023 14:31:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AD75BF800DF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aNtuJJnY
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 0971ACE118D;
	Mon,  6 Mar 2023 13:31:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0819FC433EF;
	Mon,  6 Mar 2023 13:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678109506;
	bh=n4vaoJypBj3ZnWOSr2/6ylu1yP0IfC9GLrLhygb790c=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=aNtuJJnY+2dUoUEevCcSGoR07uQjisGPJXDnw6+kOmA1iOd8khRlmgL5LGMuPca0/
	 dTFzP9/v76YbRn+S94AAHQoalLL86WBptYI8NhOyngZIjCgFufmoDCbXft8sEAW159
	 Vp71lQBEo44MT6gA2XFm6ewD5blb0GRGTpWUD3OcpmsbAo29kkj5CmJ2bmW+ppd8rf
	 d82y5DTgy+GxpGVD7NnBED4cq16EmyOdq53WeT/c6nDZbEnkqiPLGvX0iOHYzYiDKw
	 66JQZ++0QmDAFlX+nsZLG3c/9RsnEIHinD0SdkWHj4BUWxvRS4UgEo93sWG0AO4xq6
	 2U5EKzICKSgJQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 - <patches@opensource.cirrus.com>,
 Adrien Grassein <adrien.grassein@gmail.com>, Randy Li <ayaka@soulik.info>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
References: <20230217150627.779764-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 1/3] ASoC: dt-bindings: wlf,wm8960: Convert to
 dtschema
Message-Id: <167810950275.75807.2993006253194931204.b4-ty@kernel.org>
Date: Mon, 06 Mar 2023 13:31:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bd1bf
Message-ID-Hash: NI4J2RBG6PETONWYAWGMKCLXXQINICAU
X-Message-ID-Hash: NI4J2RBG6PETONWYAWGMKCLXXQINICAU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NI4J2RBG6PETONWYAWGMKCLXXQINICAU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 17 Feb 2023 16:06:25 +0100, Krzysztof Kozlowski wrote:
> Convert the Wolfson WM8960 audio codecs bindings to DT schema.
> 
> Changes against original binding:
> 1. Document clocks and clock-names - already present in DTS and used
>    by Linux driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: wlf,wm8960: Convert to dtschema
      commit: af5932fc58d351d3908d0a732ccabaef088311a0

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

