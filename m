Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9182D43CFD3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Oct 2021 19:33:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D5A816AA;
	Wed, 27 Oct 2021 19:33:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D5A816AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635356039;
	bh=Dmy2eSxMesrXx3Kt54NoJu+ASFtTZgXO7s9XqZs9lFc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NrnCUWdd0erxR87Cnu3uXKHRQse4vz5ulCc0cqGWFVD8avW11qcXMfCB2P7cTi+6p
	 MjeJNOWlTFj/5jgBFzXerQgi7hi8yS8++Om7zLU8QeFcVB3UxImHbUui1jnaZCRKUJ
	 DYrJlo7qXWhRGsdbyZwuf+tvWd9W2S0yrHAz6znY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3021F80519;
	Wed, 27 Oct 2021 19:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2F55F8016C; Wed, 27 Oct 2021 19:29:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F450F8049C
 for <alsa-devel@alsa-project.org>; Wed, 27 Oct 2021 19:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F450F8049C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="utolcpQ8"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15776610C7;
 Wed, 27 Oct 2021 17:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635355763;
 bh=Dmy2eSxMesrXx3Kt54NoJu+ASFtTZgXO7s9XqZs9lFc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=utolcpQ85h/f5oh9Q/bK6syRgpbaiVM1k/d8JoOYChk/iV5EtxKi/VoTkyQHVofY7
 zUGNW4xjtV3/NOI4OLZZP8tc6YGrPPhNevb7Bxj2bCBa8FHwVjpjRHItgc6hMuI0pZ
 HPT1EVUZi7W8AJ3E3d0g2CU+2QXZfLBO3teKKd2FMWf1aAn18DcjeOD2gzKD4f9Oz5
 JvwdyhUuzb4nmuc2arTmGhtz/j7FvxyzSxWrV0K2imoqDj3Xw+try+HoLD5gfUI4UW
 TLCjCGpKlKUARHf0IOpHlaCEegIFHLfoXecoeH4PQuaDRQPACRpi1a95MWtedMlPTy
 kuit7R26ABYDQ==
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <20211027082359.52248-1-arnd@kernel.org>
References: <20211027082359.52248-1-arnd@kernel.org>
Subject: Re: [PATCH] ASoC: amd: acp: fix Kconfig dependencies
Message-Id: <163535576182.4012075.12901832843673816206.b4-ty@kernel.org>
Date: Wed, 27 Oct 2021 18:29:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
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

On Wed, 27 Oct 2021 10:23:46 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The CONFIG_SND_SOC_AMD_MACH_COMMON has some dependencies that
> are not checked by the symbols that select it:
> 
> WARNING: unmet direct dependencies detected for SND_SOC_AMD_MACH_COMMON
>   Depends on [n]: SOUND [=y] && !UML && SND [=m] && SND_SOC [=m] && X86 && PCI [=y] && I2C [=n]
>   Selected by [m]:
>   - SND_SOC_AMD_LEGACY_MACH [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m]
>   - SND_SOC_AMD_SOF_MACH [=m] && SOUND [=y] && !UML && SND [=m] && SND_SOC [=m]
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: fix Kconfig dependencies
      commit: 1dcc81d95b910dc404c40ff6101bfa2520a3528e

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
