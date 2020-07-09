Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 832B821AA3D
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Jul 2020 00:05:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3136E1614;
	Fri, 10 Jul 2020 00:04:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3136E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594332307;
	bh=a/YZQQXI5XYzJtlvUHGGCG+pDHweuqgOt/orhYR2T7g=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IZemHdnU3CzZfdHHFfamQ8yF5mHBvlLgKdbz3+TmQGd13TRguQPJEEd5D6KzwGAkU
	 CWZyGiIwT6uni6aUKcPaB1L0jvASgvXMLSzSTnwfGgapgmjSqRTfNa/j43+EQRVUB0
	 b8bMzPYrTnShBik6u/DSPDn62ZBVHfTW9YkZwVM0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7B46F802C4;
	Fri, 10 Jul 2020 00:00:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B805F802EB; Fri, 10 Jul 2020 00:00:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_PASS,
 SUBJECT_NEEDS_ENCODING,SUBJ_ILLEGAL_CHARS autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF4FCF802C4
 for <alsa-devel@alsa-project.org>; Fri, 10 Jul 2020 00:00:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF4FCF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="TZuEYRXk"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 025BB20720;
 Thu,  9 Jul 2020 22:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594332033;
 bh=a/YZQQXI5XYzJtlvUHGGCG+pDHweuqgOt/orhYR2T7g=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=TZuEYRXkT4ga2DY+v+4kjEn4/x3g4sTF7lRiHv4XTHKrxIEroL46tDRx3E4RXVkuM
 TgJNVP+OEHMO4oUs96SkcDVebs8gpk4MFlrLkE3VVuJhUGSeL7nS4AmVp7VtEJf63B
 0H51RT8LMALWoyy8CnDo3PtPQd/zteHKZEVkbFAI=
Date: Thu, 09 Jul 2020 23:00:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
References: <20200707190612.97799-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 00/13] ASoC: Clean-up W=1 build warnings​ - part1
Message-Id: <159433200031.57213.11837798686567663097.b4-ty@kernel.org>
Cc: tiwai@suse.de, Lee Jones <lee.jones@linaro.org>
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

On Tue, 7 Jul 2020 14:05:59 -0500, Pierre-Louis Bossart wrote:
> Both Lee Jones and I submitted separate series, this is the first part
> of the merged result, which includes all previously reviewed patches
> or suggested changes along with trivial ones for CONFIG_ACPI.
> 
> Lee Jones (2):
>   ASoC: codecs: jz4770: Remove defined but never used variable
>     'mic_boost_tlv'
>   ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: atmel: fix kernel-doc
        commit: 0bdaef8a9c9adc11a640e76132c7dfca6c4831c4
[02/13] ASoC: samsung: spdif: fix kernel-doc
        commit: 53c512d89fef113033df53f0ab942b815a28b1a4
[03/13] ASoC: samsung: pcm: fix kernel-doc
        commit: b023cc4c4e9eda8cf086107dd7803ec396600703
[04/13] ASoC: tegra: tegra20_das: remove always-true comparison
        commit: cf3804dbd3c4ff5f8c8478fd64190ed9fea7db55
[05/13] ASoC: uniphier: aio-core: fix kernel-doc
        commit: 891ba284df5e374f6ea4675b66b56eefb9831f1f
[06/13] ASoC: codecs: da7210: fix kernel-doc
        commit: d3d0502ae595c29091dac0cda7550f19b913074f
[07/13] ASoC: codecs: da7219: fix 'defined but not used' warning
        commit: 14310a9644f604e3e2bca7207056d6071c530d04
[08/13] ASoC: codecs: jz4770: Remove defined but never used variable 'mic_boost_tlv'
        commit: a7997d67f6c2d1b0e657f7db2dcd447f9db9df6f
[09/13] ASoC: ti: omap-mcbsp-st: Remove set, but unused variable 'w'
        commit: 0a292439655d3ba6349fb3eb17d8c1b14728e1ba
[10/13] ASoC: codecs: cros_ec_codec: fix 'defined but not used' warning
        commit: fbcde4ffa5feebf07ba57b1158d03f609637a2c1
[11/13] ASoC: codecs: es8316: fix 'defined but not used' warning
        commit: 07ac670981fc5932ca3799ce7d96431d80afce0e
[12/13] ASoC: codecs: max98390: fix 'defined but not used' warning
        commit: ce7ed845eb60c119b033057815a4d1d7261367f9
[13/13] ASoC: codecs: rt*: fix 'defined but not used' warning
        commit: 56bbfbfdab2b79d3b6e370750358702a7aa079ed

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
