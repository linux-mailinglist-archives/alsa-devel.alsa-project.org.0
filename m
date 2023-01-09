Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80111662B9E
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jan 2023 17:50:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FBFCBA36;
	Mon,  9 Jan 2023 17:49:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FBFCBA36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673283010;
	bh=H0htiAO+IFq+g1kJgzGvOm1YmHXS0hxKh6DEXB3GTTM=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QEbQknahZ+MoZoAONzUkVXZT2QgF6/RTeRD6FAMuzhmPSINkVzkUalgQ9Mr1l/HVN
	 /m/6DGnC8cXwy8Ve6hIFt/xElsDM7A3BkuB9FvmNzIzysY/14OA1pMeKjhUxv9HXjj
	 CM2HPoSSYqscmAhVasp83zzvg791ogPGfHPRrQ94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A973CF802BE;
	Mon,  9 Jan 2023 17:49:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF4D9F800C7; Mon,  9 Jan 2023 17:49:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A4249F800C7
 for <alsa-devel@alsa-project.org>; Mon,  9 Jan 2023 17:49:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A4249F800C7
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QogZDQbP
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 718EE611A0;
 Mon,  9 Jan 2023 16:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F45CC433F0;
 Mon,  9 Jan 2023 16:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673282944;
 bh=H0htiAO+IFq+g1kJgzGvOm1YmHXS0hxKh6DEXB3GTTM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=QogZDQbPqxlOguyCkSnP7GkZ/qDjqfQl9F/Qu1MXxIzq8xLBZtZNU5mmqbDdepXmg
 uTp/HNQyIBt9mgZldLHjB8Wvh4ISAUlZQmWK79j3iJkkx+5FSpmue9Mm9PTtamZ+a+
 xxAQsOHS2am14ScPKHs+LjGa9jaQr/IhJ4Gr0qMzjwElnyd3Hj5r1jBaVgA1/0QeNy
 YBn0ERVEDm99j5XBkMDonmNN48Pb98f7qIhN4/55VusFCizoOXBJcDWlA/TW8qsAbC
 PEJSRt3VlXsLxAfOk5ArlBDnxgQlDto5yZxeKEuFPfBIf12HRK1Sj6FEe1gTKDzqpp
 jamtcwpDku1yw==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Francesco Dolcini <francesco@dolcini.it>
In-Reply-To: <20221223170404.210603-1-francesco@dolcini.it>
References: <20221223170404.210603-1-francesco@dolcini.it>
Subject: Re: [PATCH v1 0/3] ASoC: nau8822: add speaker Bridge Tied Output
Message-Id: <167328294221.323147.12666098870170781252.b4-ty@kernel.org>
Date: Mon, 09 Jan 2023 16:49:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12-dev-8b3d1
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: wtli@nuvoton.com, kchsu0@nuvoton.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Benjamin Marty <info@benjaminmarty.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Fri, 23 Dec 2022 18:04:01 +0100, Francesco Dolcini wrote:
> Add support for BTL (Bridge Tied Load) configuration to NAU8822 audio codec,
> since this requires adding a new property to the binding convert it from
> txt to yaml first.
> 
> Emanuele Ghidoli (3):
>   ASoC: dt-bindings: nau8822: convert to the dtschema
>   ASoC: dt-bindings: nau8822: add nuvoton,spk-btl property to dtschema
>   ASoC: nau8822: add speaker Bridge Tied Output configuration
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: nau8822: convert to the dtschema
      commit: 76fa6279eff931b43482f0bef5d65cdcf325de87
[2/3] ASoC: dt-bindings: nau8822: add nuvoton,spk-btl property to dtschema
      (no commit info)
[3/3] ASoC: nau8822: add speaker Bridge Tied Output configuration
      commit: 968b42069fe5dab362b623c6b8a1565709a12f5b

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
