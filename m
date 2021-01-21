Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C972FF4D0
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Jan 2021 20:42:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C1D41934;
	Thu, 21 Jan 2021 20:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C1D41934
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611258157;
	bh=VqpMA7UGB6L7aDsLItzSJw145692r0KrzY1d1OzwUMg=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bZuIyXAACJlUruaaxWrYy9YPesZgNsU2RYdQTytzXFK6gKMHv/HClaA08z5Mh16iN
	 Qk0bWUP7wbKAepqE5DU4OQ6gWGS3l2grmr7WwME5FXkhl2A1nytrFJCwdA3Vu4lb7W
	 sghaxY61KrVtHdlbCDnm3W77pm7jwn4JhFLFXfhA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AEB4F80257;
	Thu, 21 Jan 2021 20:40:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3C76F804B2; Thu, 21 Jan 2021 20:40:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D45C1F80257
 for <alsa-devel@alsa-project.org>; Thu, 21 Jan 2021 20:40:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45C1F80257
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="D8WFQxrT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2594F23A40;
 Thu, 21 Jan 2021 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611258005;
 bh=VqpMA7UGB6L7aDsLItzSJw145692r0KrzY1d1OzwUMg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=D8WFQxrTaq+pEmPvaZxso4rqadyK2xsorpXEso9MJFccbap9jJaLaUWfzOVQXF8h8
 wD+nIo0+b7xDH4e8DIbCQxCGSf4lOF5eBjst0aI+AsKUoNbCoSUx+mBLUIB2zYzWDC
 ek66SB6LKkS1CqUQEhfr2w7R0CYh/hMfIY0xGHc4c7DbZs76XBBWYjbJvQ9YMPt9Df
 SZxvE6saOF01iBpuDg/vnWsCo8KAAZF6RzwpkykOp+9dxTrH9ECcYo0ddvG0ik/nNG
 7LLaDqj0b2ZktbBbcpMZv5CYnyKd1UcRe9//15sy2Qb1wVu/ferEkax3CwZmKUkonJ
 Hs3cU7XyvmUPw==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87zh1aolkt.wl-kuninori.morimoto.gx@renesas.com>
References: <87zh1aolkt.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 00/44] ASoC: sync parameter naming : rate / sample_bits
Message-Id: <161125795421.35635.12429890296690548014.b4-ty@kernel.org>
Date: Thu, 21 Jan 2021 19:39:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On 15 Jan 2021 13:51:56 +0900, Kuninori Morimoto wrote:
> snd_pcm_runtime / snd_soc_dai / snd_soc_dai_driver / snd_soc_dai_link
> have related parameter which is similar but not same naming.
> 
> 	struct snd_pcm_runtime {
> 		...
> (A)		unsigned int rate;
> 		...
> (B)		unsigned int sample_bits;
> 		...
> 	};
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/44] ASoC: soc-pcm: revert soc_pcm_apply_symmetry()
        commit: 80f454e283708c28f5220eda68511fc495e5ffaf
[02/44] ASoC: sync parameter naming : rate / sample_bits
        commit: f14654ddf2e982537ab476d392a87fcbf90374c3
[03/44] ASoC: adi: sync parameter naming (rate/sample_bits)
        commit: 55d0056ba6a1bc8be2ae804cadf106ff2ae712ca
[04/44] ASoC: atmel: sync parameter naming (rate/sample_bits)
        commit: ba471f8d1655753bd1fad226a1c47ffc4568c02e
[05/44] ASoC: au1x: sync parameter naming (rate/sample_bits)
        commit: 3470c2398ce9f6e80a5434c1c8649b036544a1d4
[06/44] ASoC: bcm: sync parameter naming (rate/sample_bits)
        commit: a8e940222bdf60b9957515e80064b1230a3fc774
[07/44] ASoC: cirrus: sync parameter naming (rate/sample_bits)
        commit: f1e6b04baba690e3bd08669c73e8d78032c2b905
[08/44] ASoC: tegra: sync parameter naming (rate/sample_bits)
        commit: c6d152a8de560f50a37e9580b7550dc2001eaccf
[09/44] ASoC: rockchip: sync parameter naming (rate/sample_bits)
        commit: fadaed3023138197000d37c2fafe15b2208ec9bc
[10/44] ASoC: samsung: sync parameter naming (rate/sample_bits)
        commit: d11ff0bf6ac1a85fcf51f4ca52934b0fb6ac47a6
[11/44] ASoC: sh: sync parameter naming (rate/sample_bits)
        commit: f1cd5f3bbcef13980734ea18797f192c344d850e
[12/44] ASoC: ti: sync parameter naming (rate/sample_bits)
        commit: c756316f0027a8659562d7df76fb24a9ff7c2068
[13/44] ASoC: pxa: sync parameter naming (rate/sample_bits)
        commit: c658b2185818ac39ca5b71001f30ab14a517219a
[14/44] ASoC: mediatek: sync parameter naming (rate/sample_bits)
        commit: 4b7ead032ecd1b1af5ce0dfbc2479cfdee7063b3
[15/44] ASoC: fsl: sync parameter naming (rate/sample_bits)
        commit: cb2f6927faf44d0cd3e55d3f9a9211f2aad26850
[16/44] ASoC: wm*: sync parameter naming (rate/sample_bits)
        commit: 0769575294e4c965cc2a4f4817fa696e20c2c05f
[17/44] ASoC: tlv*: sync parameter naming (rate/sample_bits)
        commit: a9aef184f7b47c355e4d78aa08792ff74fd5c4f5
[18/44] ASoC: rt*: sync parameter naming (rate/sample_bits)
        commit: bc03b3910ef6e228ef8b192e08030a1e177ad273
[19/44] ASoC: nau*: sync parameter naming (rate/sample_bits)
        commit: 42c9b5bec1c5218b33eda3b519381b38b89d5ccd
[20/44] ASoC: tas*: sync parameter naming (rate/sample_bits)
        commit: fa056c07367e443271837c8500de8c7e6d9b2722
[21/44] ASoC: da*: sync parameter naming (rate/sample_bits)
        commit: 1c6d1c4f6874345a31d12a9f3843876c49d637fa
[22/44] ASoC: es*: sync parameter naming (rate/sample_bits)
        commit: 4060064e8baf047a64b6286f5fd87cb0a34d8b89
[23/44] ASoC: max*: sync parameter naming (rate/sample_bits)
        commit: cb40d1b4581c0f6e2a828ebfcb7cc9a04dca1e11
[24/44] ASoC: cs*: sync parameter naming (rate/sample_bits)
        commit: 260b668cf356dbab5f73e651cfc96a90ed220b98
[25/44] ASoC: tscs*: sync parameter naming (rate/sample_bits)
        commit: 9b4488efdeccbe1d4dceb13aee9e58371f6ba926
[26/44] ASoC: ak*: sync parameter naming (rate/sample_bits)
        commit: 870b76ea7d0c0e5d6e5f305d8eca9ba45b89241a
[27/44] ASoC: adau*: sync parameter naming (rate/sample_bits)
        commit: f88f45861bbd5da303a997f92800fa0d7958c929
[28/44] ASoC: jz4740: sync parameter naming (rate/sample_bits)
        commit: 0547dece8dcbb80983b3c37ad20ceca76a1f06a5
[29/44] ASoC: sunxi: sync parameter naming (rate/sample_bits)
        commit: 813857086191aace3a39c056c8acb6946ff75f03
[30/44] ASoC: zl38060: sync parameter naming (rate/sample_bits)
        commit: b33c088a9b0b15df987dae05177ef9b0816dc4cf
[31/44] ASoC: ssm2602: sync parameter naming (rate/sample_bits)
        commit: 4735c8cadd54ef74726718ad93a27d16b23089b0
[32/44] ASoC: sgtl5000: sync parameter naming (rate/sample_bits)
        commit: bea17630c4ad398b6cd9b454c1649a962a7e0258
[33/44] ASoC: mc13783: sync parameter naming (rate/sample_bits)
        commit: 23df7f69ff134d108ddffcde622b7ffc904ac789
[34/44] ASoC: mt6660: sync parameter naming (rate/sample_bits)
        commit: 852d4daa9689188f25cd1aa92d4daf3a88d73101
[35/44] ASoC: lochnagar-sc: sync parameter naming (rate/sample_bits)
        commit: 65ba325625e74f44fe7c0052a85bcdfac2b012ec
[36/44] ASoC: ab8500: sync parameter naming (rate/sample_bits)
        commit: 6058bcb4974418bdec55738383755b83e57e555e
[37/44] ASoC: alc5632: sync parameter naming (rate/sample_bits)
        commit: 278eacf3dc717f27463d56d605c2ea919e308e49
[38/44] ASoC: cx2072x: sync parameter naming (rate/sample_bits)
        commit: 15d27c2b129fc8234ed709bdcbd17fa3fff0808e
[39/44] ASoC: inno_rk3036: sync parameter naming (rate/sample_bits)
        commit: d5d396c8b01e1fea696c68d255c2d7206de6499f
[40/44] ASoC: lm49453: sync parameter naming (rate/sample_bits)
        commit: 3b940ecd2ebfdd9a2b4a7a97aef1f25d1844d3ba
[41/44] ASoC: ml26124: sync parameter naming (rate/sample_bits)
        commit: 6944db0ab8c4b7c19b7ff9fbbe98322efcd9595a
[42/44] ASoC: soc-dai.h: remove symmetric_rates/samplebits
        commit: fa31a2c787aeaf61d02b2a57bd9765ca5e67d949
[43/44] ASoC: soc-pcm: cleanup soc_pcm_apply_symmetry()
        commit: fac110cbcddec115c7d4b79d7491aebebbe44469
[44/44] ASoC: soc-pcm: cleanup soc_pcm_params_symmetry()
        commit: 3a906721112263f1698d7752f6f0133c78fc12c2

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
