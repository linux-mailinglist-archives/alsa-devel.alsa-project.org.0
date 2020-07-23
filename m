Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F3222B7A4
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Jul 2020 22:24:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F0E9168E;
	Thu, 23 Jul 2020 22:23:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F0E9168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595535844;
	bh=gubfBKCSqYKJKCwTCF6tkdA/vQ/smaOJHwoZEJzIT24=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ks5NInGxMhoVMG+Y6OMm7+F6ZoNP5Ycv9tDQ9ay7eEXGzZqpH7hWbCQoJSWhQHfdI
	 MKmDS0ZMJ1fJ2ONmIDeUHPwMMV3m7qrOoqKW+tsyjFegmqFiaeiSt3Zf2ZVuj58TNM
	 lWgWL1+BKdE/fwYDGGKjmeEBEn+XV9EROcddXwZw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A18DF802E3;
	Thu, 23 Jul 2020 22:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E057F802E2; Thu, 23 Jul 2020 22:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BF2E1F802DF
 for <alsa-devel@alsa-project.org>; Thu, 23 Jul 2020 22:20:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF2E1F802DF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="DlUrW7h4"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BF32C2065F;
 Thu, 23 Jul 2020 20:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595535609;
 bh=gubfBKCSqYKJKCwTCF6tkdA/vQ/smaOJHwoZEJzIT24=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=DlUrW7h48OnwQsuZfBkDGYcNLFWe43Dh7UzQYoPTMmJzEnMVstwfl/bEUa8cUDIU9
 2iaSDbJhY+cEvf0dhb33RIrmBEhQok6fqK8WS853uQO6dmgKVZXKwAeiutYcGhCqxi
 iyhXfSvUFgJnEkCHw/AGg9WatP+JE3AAebzF48tQ=
Date: Thu, 23 Jul 2020 21:19:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87y2nf0yw2.wl-kuninori.morimoto.gx@renesas.com>
References: <87y2nf0yw2.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/29] ASoC: add asoc_substream_to_rtd() macro
Message-Id: <159553557415.41908.6886755663188786565.b4-ty@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 20 Jul 2020 10:17:15 +0900, Kuninori Morimoto wrote:
> Many ASoC drivers are getting rtd from substream by
> 
> 	rtd = substream->private_data
> 
> OTOH, we have snd_pcm_substream_chip() macro for it.
> 
> 	#define snd_pcm_substream_chip(substream) ((substream)->private_data)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/28] ASoC: soc-xxx: add asoc_substream_to_rtd()
        commit: 0ceef681e34a61afcd77af0837b2132925c5bad4
[02/28] ASoC: ux500: use asoc_substream_to_rtd()
        commit: 3e44c47979b743e02c6af8203c530695c9837c89
[03/28] ASoC: ti: use asoc_substream_to_rtd()
        commit: 02cde14ab59de4f578c8c949483514c22a80273d
[04/28] ASoC: tegra: use asoc_substream_to_rtd()
        commit: 95ebd023e1c963ef8727776ca158f69ad83ddd92
[05/28] ASoC: sunxi: use asoc_substream_to_rtd()
        commit: c09e34b799ee78a673676e71e14ee4fb0145db5e
[06/28] ASoC: stm: use asoc_substream_to_rtd()
        commit: ddb4f06d620f442c444e010b8af8c001fb4e3d9b
[07/28] ASoC: sof: use asoc_substream_to_rtd()
        commit: 1205300af9dba3ef9f44cf6a02d6ed6ebfa6b8c6
[08/28] ASoC: sh: use asoc_substream_to_rtd()
        commit: 28ec78b0f4cc8ee62e0dfe29ea9b2e78c4aad1f9
[09/28] ASoC: samsung: use asoc_substream_to_rtd()
        commit: c101ce8883be49e971f6cb06bad589d24c0cbf46
[10/28] ASoC: pxa: use asoc_substream_to_rtd()
        commit: 83b95c2fc0283976c5dab77ef930597219fa61a4
[11/28] ASoC: cirrus: use asoc_substream_to_rtd()
        commit: d42df9400f1d46453abddb5c626fc24f306d8607
[12/28] ASoC: rockchip: use asoc_substream_to_rtd()
        commit: 5c5eb29e8a68ef3ab523fe75179dde5710cae6de
[13/28] ASoC: amd: use asoc_substream_to_rtd()
        commit: ded0054359ddc1bbd9893ce39af22e1ce7a03357
[14/28] ASoC: fsl: use asoc_substream_to_rtd()
        commit: 9f5f078aed9d4dc024c397507a97bbf07e3ac4f3
[15/28] ASoC: mediatek: use asoc_substream_to_rtd()
        commit: 0cd08b10ae3b5226ff3433139d56ce6e9f218788
[16/28] ASoC: atmel: use asoc_substream_to_rtd()
        commit: b1839ebf13bbc23f6cce87e9c25f51338db69166
[17/28] ASoC: qcom: use asoc_substream_to_rtd()
        commit: fdc9a2e469e9e7b7aac7a3cd054cef64d0ca4e0f
[18/28] ASoC: dwc: use asoc_substream_to_rtd()
        commit: a7c7ff1a47ff6974b6fc4ab30632cd0ad02797b1
[19/28] ASoC: meson: use asoc_substream_to_rtd()
        commit: 371a014d4260e119b5ae9df782af88cc58557df1
[20/28] ASoC: au1x: use asoc_substream_to_rtd()
        commit: e287d0464be03212f1c2e1cd258cc9720f228024
[21/28] ASoC: bcm: use asoc_substream_to_rtd()
        commit: 0359c834a2e801bb51c137cf4b008fb5897371fa
[22/28] ASoC: codecs: use asoc_substream_to_rtd()
        commit: 3e3b62950ad02758626070b0a023ce9318bd8b63
[23/28] ASoC: generic: use asoc_substream_to_rtd()
        commit: 9ae035e289379ba31f918198fb6bc789dda7a768
[24/28] ASoC: sprd: use asoc_substream_to_rtd()
        commit: 1581db969ca0331af69de0dfd42e7b7b4d2a11e8
[25/28] ASoC: kirkwood: use asoc_substream_to_rtd()
        commit: 6501cad63ac12eb908fc547ba2a37ccd94d65785
[26/28] ASoC: xtensa: use asoc_substream_to_rtd()
        commit: 8d08d9b00a9f38083b5864e438eda2acba6d55dd
[27/28] ASoC: mxs: use asoc_substream_to_rtd()
        commit: 3359128d7fe30be5836ae3e7a257d5b3733bd9b1
[28/28] ASoC: uniphier: use asoc_substream_to_rtd()
        commit: 382683c4a1c36408e352775e8e0e5dd9b4dbf233

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
