Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F27927D38
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Jul 2024 20:36:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5830BB65;
	Thu,  4 Jul 2024 20:36:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5830BB65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720118209;
	bh=rCWEKZiJpFDMpQmRBe2oHF+Q4L1xuCzmJqFKI9sBbBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y4ZYL35je50fLOGsWbN0VnPUxypl4agj+WpDgEBsWg1+GCLcC+LqT0y2bgAn1L4kV
	 0t+hG3ZcxH0AcVnVIkpb68bBpp4L5A/Ci4yXMu90dRvvNqrSjP5KJuNHi8Yk9Ndm7I
	 NuJXy4SYqJmyVPar/U3Si+BnjHO4ibEmawOLuGL4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68892F805C8; Thu,  4 Jul 2024 20:36:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF5EF805C9;
	Thu,  4 Jul 2024 20:36:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E09CBF8025E; Thu,  4 Jul 2024 20:35:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D951AF800F8
	for <alsa-devel@alsa-project.org>; Thu,  4 Jul 2024 20:35:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D951AF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=XwkC4aqR
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 44691CE391F;
	Thu,  4 Jul 2024 18:35:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEBE4C32781;
	Thu,  4 Jul 2024 18:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720118145;
	bh=rCWEKZiJpFDMpQmRBe2oHF+Q4L1xuCzmJqFKI9sBbBU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XwkC4aqRrEk7dbyVe7FPkDuvLWRj1jidNP+euuAbzP9JjJzLszTewqZzPa+o+jBjC
	 FfFm5HKXGJqAADRL6npfN59JBc96M4knjbEw55jvee+lnAx4pced+gtLG/Id8VWOlX
	 UQaKQ5if+3ZNZlp6hHhpWOkCK8IUesi7Y+7OLE0lk5WaxQg3EGu/fmJaNrpwGR5QFa
	 TiIMvvL5uQCyFdh6L8HSwLkmE8hrqsRtVIJiouy9JLLCww5LkHFuXxaL0ZNkP965RM
	 mu/JfdeUKlnfOmLtHEJjNcf0T0eHBjGtDD9EamZCPEDDyP3EtBv9EaBAWPirYx85z0
	 kOEspMLmVOnEA==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20240701113038.55144-1-herve.codina@bootlin.com>
References: <20240701113038.55144-1-herve.codina@bootlin.com>
Subject: Re: [PATCH v2 00/10] Add support for non-interleaved mode in
 qmc_audio
Message-Id: <172011814156.108577.6835000954041673379.b4-ty@kernel.org>
Date: Thu, 04 Jul 2024 19:35:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 2MHTF76BXU3QRCBL5A7NBJM22WT7ZABR
X-Message-ID-Hash: 2MHTF76BXU3QRCBL5A7NBJM22WT7ZABR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2MHTF76BXU3QRCBL5A7NBJM22WT7ZABR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 01 Jul 2024 13:30:27 +0200, Herve Codina wrote:
> The qmc_audio driver supports only audio in interleaved mode.
> Non-interleaved mode can be easily supported using several QMC channel
> per DAI. In that case, data related to ch0 are sent to (received from)
> the first QMC channel, data related to ch1 use the next QMC channel and
> so on up to the last channel.
> 
> In terms of constraints and settings, the interleaved and
> non-interleaved modes are slightly different.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: fsl: fsl_qmc_audio: Check devm_kasprintf() returned value
        commit: e62599902327d27687693f6e5253a5d56583db58
[02/10] ASoC: fsl: fsl_qmc_audio: Fix issues detected by checkpatch
        commit: 86dd725b57a88869acfe15b0405937450d0aef30
[03/10] ASoC: fsl: fsl_qmc_audio: Split channel buffer and PCM pointer handling
        commit: 42212b2ce8b1182d536452eee2880d2de7cce059
[04/10] ASoC: fsl: fsl_qmc_audio: Identify the QMC channel involved in completion routines
        commit: 5e51a1f9dfd90de6e44cfb5340d48263f9e8f8d8
[05/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_audio_pcm_{read,write}_submit()
        commit: 33a6969fbc653f25d5204b17fb67d5a21e6295e6
[06/10] ASoC: fsl: fsl_qmc_audio: Introduce qmc_dai_constraints_interleaved()
        commit: b81cfa66435bdab896b4c24e11d24ec33bdb0601
[07/10] soc: fsl: cpm1: qmc: Introduce functions to get a channel from a phandle list
        commit: 37797c605da33445adc112561695f70bfaa11133
[08/10] soc: fsl: cpm1: qmc: Introduce qmc_chan_count_phandles()
        commit: af8432b2e41abc0a20bdc01a3b144ea7b2f1ee09
[09/10] dt-bindings: sound: fsl,qmc-audio: Add support for multiple QMC channels per DAI
        commit: fb6013168fa94d5863ed6085b24eaeb89102ad74
[10/10] ASoC: fsl: fsl_qmc_audio: Add support for non-interleaved mode.
        commit: 188d9cae54388171d28bd632a2561863db4b9f8b

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

