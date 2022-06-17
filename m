Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF4054FB1B
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jun 2022 18:32:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 537BC1F34;
	Fri, 17 Jun 2022 18:31:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 537BC1F34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655483520;
	bh=saZDLQrvcJUhl+w7RmXmEIruNfKYNuAQkwMfgiwHaRA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nrGHT0YqtxrRLm4k0r6ihJ9eAr9hvnjFb2SpofbnVcsS5qj/OAvIBv0AL59/gP3Jd
	 U6iqiAwaGaIBEd6ZsemEjILXPkAATBK9+1+y7XghH//z2Mq2zz2qH97Y3SJ779XG+r
	 IfJTPrSJovMUt3vNVCZF4CFcVvL0nRoAvilcM4pc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3876F80539;
	Fri, 17 Jun 2022 18:30:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF1E0F80534; Fri, 17 Jun 2022 18:30:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74D55F8051F
 for <alsa-devel@alsa-project.org>; Fri, 17 Jun 2022 18:29:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74D55F8051F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="bs0G9l0S"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9D552CE2C28;
 Fri, 17 Jun 2022 16:29:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0FCC3411B;
 Fri, 17 Jun 2022 16:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655483394;
 bh=saZDLQrvcJUhl+w7RmXmEIruNfKYNuAQkwMfgiwHaRA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=bs0G9l0S7e/TredrSsutdTCdz7UaUU6cgSZJfMVk0ZdZxhlME8VCSXHPCUFCRht/N
 CG+6lEOP7C/DkIPUxsxqOOTfLMZVIa+M6VubebuF2Cj5Q6WkEM44ycCehKueslPyiG
 U5q51I5REQcr9ZrY4KaXRQOkhXeF0iE8JyMb2p91JnvfFCXPqciBZyUYzUkJeuz9oS
 utBS5K3uGKYT99/HRqfSMV+BJry/14tgnyEy1D8bocg21cggtkG7iD71WXloTdnPFz
 8zZpq8TXR7kyqoghg2ev0URvS+9Z8yiL/JtmglAY4g0HyspXgsBNb0C61VKBlA3/HF
 brPROXUFhKrng==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org
In-Reply-To: <20220616214055.134943-1-pierre-louis.bossart@linux.intel.com>
References: <20220616214055.134943-1-pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 00/13] ASoC: Intel: Chromebooks: remap jack pins
Message-Id: <165548339256.901499.13440685571052781757.b4-ty@kernel.org>
Date: Fri, 17 Jun 2022 17:29:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: cujomalainey@google.com, tiwai@suse.de, cezary.rojewski@intel.com,
 amadeuszx.slawinski@linux.intel.com
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

On Thu, 16 Jun 2022 16:40:42 -0500, Pierre-Louis Bossart wrote:
> This patchset adds the missing jack pin remapping needed by upstream
> UCM on Chromebooks, suggested by Jaroslav Kysela [1].
> 
> These patches were succesfully tested on GeminiLake and JasperLake
> platforms, and generalized to other Chromebooks.
> 
> [1] https://mailman.alsa-project.org/pipermail/sound-open-firmware/2022-June/004468.html
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/13] ASoC: Intel: skl_nau88l25_max98357a: remap jack pins
        commit: e33ea0685a219543f3e23d88186bc6c3259b3ff4
[02/13] ASoC: Intel: skl_nau88l25_ssm4567: remap jack pins
        commit: 4864ef4a67edfbf802ba36c921c5e9f66e1530bf
[03/13] ASoC: Intel: kbl_rt5663_max98927: remap jack pins
        commit: decdbf3dd7ec3e3522548f50e22d81558d151118
[04/13] ASoC: Intel: kbl_da7219_max98357a: remap jack pins
        commit: c2065d43ae8546668f8f187138eda8a18f7625fd
[05/13] ASoC: Intel: kbl_da7219_max98927: remap jack pins
        commit: b9f53b9fc14e26ef3b3c33160afb094ad7ae192b
[06/13] ASoC: Intel: kbl_rt5663_rt5514_max98927: remap jack pins
        commit: c0703be996c343b4d1036b6ba258133d88b7932b
[07/13] ASoC: Intel: bxt_da7219_max98357a: remap jack pins
        commit: bbdd4ea2190b4712c0cd9989a5e402c7f99fc122
[08/13] ASoC: Intel: glk_rt5682_max98357a: remap jack pins
        commit: 4c3a68e9026ad7d3aa61278ce5702407d91d5dd9
[09/13] ASoC: Intel: cml_rt1011_rt5682: remap jack pins
        commit: 77a036e8b074a679c0177f61c9d3b8e942673141
[10/13] ASoC: Intel: sof_cs42l42: remap jack pins
        commit: 7459c8940a506280908f8b5e9e4227784a0b6569
[11/13] ASoC: Intel: sof_da7219_max98373: remap jack pins
        commit: 2913bb1f6830251416659dbb04c392bbc9592f14
[12/13] ASoC: Intel: sof_nau8825: remap jack pins
        commit: 2a172d2f06c155ea7c9b34f47febdfe9b9bbe1c2
[13/13] ASoC: Intel: sof_rt5682: remap jack pins
        commit: c3ce12b27e562bf3a255bc9f3096dacea2194dd8

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
