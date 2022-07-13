Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2845738EC
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Jul 2022 16:32:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17D49172F;
	Wed, 13 Jul 2022 16:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17D49172F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657722767;
	bh=LfxpWWH095fjZfBkvfImn26SDsToZRyHZ9LxuKCfQLk=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BSLsWSbzlj8p2TZAp4Mtrvgx+vnDkET10wH71p7lhnul4DdigtxpT5BQLYpa98yci
	 +2drw7SALXxLo5LLsn7A5PGvwGXJlVpNNCcFJUZAswo/3v2TtED6vNTPLM2eLjxN39
	 pF3P2uGlwoN26Z7fMizWH+jjW/SwFAeXf/dSz5NU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42A53F80553;
	Wed, 13 Jul 2022 16:31:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 00173F80254; Wed, 13 Jul 2022 16:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24CECF8053D
 for <alsa-devel@alsa-project.org>; Wed, 13 Jul 2022 16:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24CECF8053D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="A+PioSTm"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64B0CB8201B;
 Wed, 13 Jul 2022 14:31:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A28C3411E;
 Wed, 13 Jul 2022 14:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657722659;
 bh=LfxpWWH095fjZfBkvfImn26SDsToZRyHZ9LxuKCfQLk=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=A+PioSTmxk1LK79ZJtaRBqYf37FGDZgHEH2JGy++bGzmRPNpw0HaTCP6DWf8YwIQC
 41yvpGUmQ4Hd55HMgJLtq+kwOL6b/3LLIxLY5KYkHcTkRiGgvPu5Q2VfbgYQ0sJCPv
 iLpx8WmohESUK4HbWDghqeTww6RFTCQu09tuIIotUWJPopHn9Sh3zJpAgqbLaNu8Dw
 1h5pnPSm6ubNSepaILbncjbsPvE/aQoyZnerA0n+tsXEZcmvOlY0XDoG+V8YVRYH/9
 6MHPz23Ci+rvkmSIjsN0Qt9+ZQMDgQPzLC+5gYWWFJ5hrx5nG90hVQieK+h2MhbXrL
 Ao+fMhahdH+sw==
From: Mark Brown <broonie@kernel.org>
To: rdunlap@infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220712183348.31046-1-rdunlap@infradead.org>
References: <20220712183348.31046-1-rdunlap@infradead.org>
Subject: Re: [PATCH -next] ASoC: amd: fix Jadeite kconfig warning and build
 errors
Message-Id: <165772265760.116109.4142483197276949409.b4-ty@kernel.org>
Date: Wed, 13 Jul 2022 15:30:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Vijendar.Mukunda@amd.com,
 Takashi Iwai <tiwai@suse.com>
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

On Tue, 12 Jul 2022 11:33:48 -0700, Randy Dunlap wrote:
> Since SND_SOC_ES8316 has a hard dependency on I2C and since 'select'
> does not follow any dependency chains, SND_SOC_AMD_ST_ES8336_MACH
> also needs to have a hard dependency on I2C.
> 
> Fixes a kconfig warning and subsequent build errors:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_ES8316
>   Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
>   Selected by [y]:
>   - SND_SOC_AMD_ST_ES8336_MACH [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AMD_ACP [=y] && ACPI [=y] && (I2C [=n] || COMPILE_TEST [=y])
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: fix Jadeite kconfig warning and build errors
      commit: 1795c16a436057f95fef5b622d808885dd772d0e

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
